#!/usr/bin/env bash
set -euo pipefail

: "${PAGES_DEPLOY_KEY:?ACADEMIC_PAGES_DEPLOY_KEY is required}"
: "${GITHUB_TOKEN:?The job token is required}"
: "${RUNNER_TEMP:?RUNNER_TEMP is required}"
: "${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
: "${GITHUB_SHA:?GITHUB_SHA is required}"
: "${GITHUB_STEP_SUMMARY:?GITHUB_STEP_SUMMARY is required}"

if [[ "$GITHUB_REPOSITORY" != "dylanchiang-lab/P-academic" ]]; then
  echo "Only the authoritative source repository may publish this site." >&2
  exit 1
fi

test -s public/index.html
test -s public/en/index.html

umask 077
key_file="$RUNNER_TEMP/academic-pages-ed25519"
known_hosts="$RUNNER_TEMP/academic-pages-known-hosts"
publish_dir="$RUNNER_TEMP/academic-pages-output"
remote_refs="$RUNNER_TEMP/academic-pages-refs"
trap 'rm -f "$key_file" "$known_hosts" "$remote_refs"' EXIT
printf '%s\n' "$PAGES_DEPLOY_KEY" > "$key_file"
unset PAGES_DEPLOY_KEY

# 使用 GitHub HTTPS API 的正式 SSH host keys，保持嚴格主機驗證。
curl --fail --silent --show-error --retry 3 \
  --header "Authorization: Bearer $GITHUB_TOKEN" \
  https://api.github.com/meta \
  | python3 -c 'import json,sys; keys=json.load(sys.stdin)["ssh_keys"]; assert keys; print("\n".join("github.com " + key for key in keys))' \
  > "$known_hosts"
unset GITHUB_TOKEN
export GIT_SSH_COMMAND="ssh -i \"$key_file\" -o IdentitiesOnly=yes -o StrictHostKeyChecking=yes -o UserKnownHostsFile=\"$known_hosts\""

hosting_repo="git@github.com:DylanChiang-Dev/DylanChiang-Dev.github.io.git"
git ls-remote --heads "$hosting_repo" refs/heads/gh-pages > "$remote_refs"
if [[ -s "$remote_refs" ]]; then
  git clone --quiet --depth 1 --single-branch --branch gh-pages "$hosting_repo" "$publish_dir"
else
  git init --quiet --initial-branch=gh-pages "$publish_dir"
  git -C "$publish_dir" remote add origin "$hosting_repo"
fi

rsync -a --delete --exclude='.git' public/ "$publish_dir/"
touch "$publish_dir/.nojekyll"
cat > "$publish_dir/README.md" <<EOF
# 學術網站發布入口

正式網址：https://dylanchiang-dev.github.io/

原始碼與修改入口：https://github.com/$GITHUB_REPOSITORY

此分支只保存建置後的靜態網站，請在原始碼倉庫修改後推送 main。
本倉庫的 main 分支保留遷移前歷史，不再作為網站原始碼的維護入口。

本次原始碼提交：$GITHUB_SHA
EOF

git -C "$publish_dir" config user.name 'github-actions[bot]'
git -C "$publish_dir" config user.email '41898282+github-actions[bot]@users.noreply.github.com'
git -C "$publish_dir" add --all
if git -C "$publish_dir" diff --cached --quiet; then
  echo "Generated publication is unchanged."
else
  git -C "$publish_dir" commit --quiet -m "發布學術網站：${GITHUB_SHA:0:12}"
  git -C "$publish_dir" push origin HEAD:refs/heads/gh-pages
fi

published_sha=$(git -C "$publish_dir" rev-parse HEAD)
printf '原始碼：%s@%s\n\n發布提交：%s\n\n網站：https://dylanchiang-dev.github.io/\n' \
  "$GITHUB_REPOSITORY" "$GITHUB_SHA" "$published_sha" >> "$GITHUB_STEP_SUMMARY"
