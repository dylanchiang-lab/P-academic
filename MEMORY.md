# Dylan Chiang 的學術個人網站 Memory

## Context Loading Policy

- This file is a progressive memory entrypoint, not a full-session transcript.
- Start by reading this policy and the latest entries only.
- Search this file with narrow keywords before opening older sections or linked artifacts.
- Record durable decisions, current environment facts, deployment notes, and repeated gotchas here.
- Do not record secrets or raw `.env` values.

## Current Repository Facts

- Owner: `dylanchiang-lab`
- Repository: `P-academic`
- Origin: `https://github.com/dylanchiang-lab/P-academic.git`
- Local path: `/codex/002/个人网站维护/DylanChiang-Dev.github.io`
- Main branch: `main`
- Documentation standardized: 2026-05-18 02:30 CST
- Deployment: `main` push 在本倉庫建置，專用 deploy key 將靜態產物發布至 `DylanChiang-Dev/DylanChiang-Dev.github.io` 的 `gh-pages`；正式網址維持 `https://dylanchiang-dev.github.io/`。

## Deployment Boundary

- 統一規則：本工作流唯一部署到 GitHub 的網站是 `DylanChiang-Dev.github.io`，使用 GitHub Actions + GitHub Pages；其他現役網站部署到 Cloudflare Pages／Workers，GitHub 僅保存原始碼或作為 Cloudflare 的建置來源，不是部署平台。
- 本倉庫是學術網站原始碼；GitHub Actions 將產物發布至個人帳號的 Pages 入口，保留原 github.io 網址。

## Latest Entries

### 2026-10-20 分離原始碼與個人 Pages 發布入口

- 使用者要求保留完整原網址，並明確同意原始碼移至組織、個人倉庫繼續作發布入口及新增跨倉庫發布金鑰。
- 原始碼歷史以原倉庫已發布 `bb35e92ee3e86819aea999095cacb920c7aff5df` 為基準複製到 `dylanchiang-lab/P-academic`；本機既有未提交修改不納入此次發布。
- 新工作流保留 Hugo Extended 0.148.2、Node 24 與原 pnpm lock，固定原正式 baseURL；只授予 job contents:read，發布金鑰僅能寫入原個人發布倉庫。
- 切換前先驗證新工作流能建置並寫入 gh-pages，再切換原個人倉庫的 Pages source；原 main 與歷史保留作回復依據。正式切換與驗證結果於完成後補記。

### 2026-10-03 桌面首頁區塊寬度統一

- 使用者要求研究、論文、講座、參會與消息等首頁內容，桌面寬度對齊既有精選專案網格，手機不變。中英文首頁只為這五個區塊加上 `homepage-content-width`，不改專案網格、頂部簡介、內容字級或專案內頁。
- 新增主題原生支援的 `assets/css/custom.css`；樣式僅在 1024px 以上生效，沿用專案網格 1024px 外框及 1280px 前後的 32px／20px 內距，讓內容左右邊界一致。手機與平板 1024px 以下完全沿用原版。
- Hugo 建置通過；以 Chromium 對修改前後中英文頁面測量 390／767／768／1023／1024／1268／1280／1440px，共十六組視窗比較。桌面五區塊與專案網格左邊界、寬度、右邊界一致；小視窗幾何／高度／字級／內距與修改前完全相同，專案網格及簡介未變。已目視檢查深色版研究與專案對齊。
- 新樣式僅限首頁明確標記的區塊，不更動既有 mobile SCSS；現存個別斷點的頁面 overflow 未因本次修改增加，不擴大為無關修復。依前端持續授權直接提交、推送並由既有 Pages 工作流發布。

### 2026-10-03 四項開源專案與完整專案列表

- 使用者同意新增先前建議的四項公開專案並要求圖片及部署。新增 InkRelay、Generative Agents 法律 RAG 擴充、ShellMate、Quotabase-Lite 的中英文頁面，按 GitHub 公開 README 寫具體工作、來源與實作邊界；不修改來源倉庫。
- 每項各有一張獨立繪製的 1600×900 工作流／架構 PNG，首頁與列表封面使用明確 `image.filename`，正文有雙語替代文字與圖說；標為示意，不冒稱真實介面或測試截圖。未呼叫付費生圖、公開真實主機／客戶資料或匯入私人原作。
- 首頁改為「精選項目／Selected projects」：保留原七項，新增 InkRelay 與研究復現案例，共九項（三欄三列）；ShellMate 與 Quotabase 置於完整專案列表。新增 `/project/` 與 `/en/project/` 的雙語 landing collection，呈現全部十一項，首頁提供完整列表連結。
- Generative Agents 明列 Stanford 原始框架來源，僅主張本人模型服務適配、三人場景、地圖設定與法律 RAG 擴充；InkRelay 明列是 Skill 而非固定渲染器；工程頁不複製未核驗的效能／安全認證／法律效力宣稱。新增日期為專案頁整理日期，不宣稱所有程式碼在此日完成。
- 已完成源文字檢查、PNG 尺寸／CRC／解壓檢查、四張圖目視檢查、Hugo Extended 0.148.2 建置，以及雙語首頁九項／完整列表十一項、全部封面與正文圖片／圖說／原始框架連結檢查；僅有既存碩士論文連結欄位的棄用警告。
- 依使用者部署要求與全域前端持續授權直接提交、推送，沿用既有 GitHub Pages 自動發布；不新增分析追蹤或更動部署設定。

### 2026-10-02 API 生成獨立視覺示意並接回首頁

- 使用者明確同意 CLI／API 生圖備援。以 bundled `image_gen.py generate` 請求 `gpt-image-2`，僅一次實際生成呼叫、品質 high；未上傳任何原作圖片或譜面。現有憑證僅接入程序環境，不修改憑證或端點設定。
- 新增 `visual-concept-illustration.png`（模型回傳 1672×941，SHA-256：`8765fe39739ea74c374f33e27588ccf43632b38131d8ca09b13fb155e8b614e5`）：保留暖光／夜景的氛圍，但人物、服裝、構圖與場景不同，沒有原作字幕或題名。已目視確認；清除中繼資料但不改圖像像素。
- 中英文首頁改用新圖，正文明確標示為另行生成的概念示意，不是作品截圖或原作成果；保留獨立的虛構譜面示意及原有技術內容，不恢復真實總譜、原始畫面或可編輯檔案。
- 按前端持續授權完成必要驗證後直接提交與推送，沿用既有 Pages 自動發布；不清理或改寫 Git 歷史。

### 2026-10-02 撤下原作圖片，改為獨立示意

- 使用者重新收緊展示邊界，要求撤下原作譜面並替換為獨立示意，以及另用模型生成類似但不直接使用原圖的視覺素材。
- 移除現行分支中三張原作衍生 PNG（舊模糊譜面、清晰譜面、視覺原圖）與全部頁面引用；來源附件與私人原作不變，不改寫 Git 歷史。撤下現行內容不等於移除舊提交、快取或他人副本。
- 新增 `notation-workflow-illustration.png`：以程式獨立繪製虛構音符、示意聲部及力度，未讀取原作音樂資料；圖與圖說標示為示意，不冒稱實際總譜。暫作首頁封面，正文保留通用流程圖。
- 本對話未提供內建 image_gen 工具；模型重繪尚未完成，需先取得使用 CLI／API 生圖備援路徑的明確同意，不能把程式示意冒充模型生成的視覺圖。完成撤下部分後依前端持續授權直接提交與推送。

### 2026-10-02 具體製作工作與六項創作修訂

- 使用者提供技術說明原文，要求突出本人具體做過的工作。雙語頁面以創作者的行動與取捨為主，補上 Pi Agent／Claude Opus 5.5、MuseScore／MuseSounds 版本、Codex 音色檢查、Suno Studio v6 母帶、GPT-6 Sol 與 GPT Image 的分工、深度視差／局部動畫及 FFmpeg 輸出流程。
- 明列六項修訂：引子聲部進入、獨奏大提琴改英國管、鐘琴餘音／音型與尾聲滑音、流光方向與局部動態、移除穿模及調整眨眼／四句對話、定稿音軌替換並保留影像。使用者提供的實際技術操作可展示，不新增作品名稱、完整故事、音軌或其他原作素材。
- 保留 AI 協作的實作分工，不宣稱全部程式與音樂由本人純手工完成；試聽／定稿路線及譜面一致性／最終音軌逐音核對仍分開描述。沿用現有核准圖片與首頁封面。
- 依全域前端持續授權完成相關驗證後直接提交／推送，沿用既有 GitHub Pages 自動發布，不要求重複提交指令。

### 2026-10-02 創作者提供圖片替換首頁與譜面示例

- 使用者直接提供兩張圖片並要求換掉原小範圍模糊譜面。首頁改用人物視覺畫面，內頁展示同一視覺畫面與新的清晰總譜片段；不另行裁切、模糊或生成圖片。中英文文案同步移除舊的兩小節／兩聲部／模糊描述。
- 新增 `visual-production-still.png`（1903×1058，SHA-256：`d805f056a122c90391af672363aaa63bf0ef5e9ac470933eb6817e6fb0c9b70b`）與 `notation-production-excerpt.png`（1213×463，SHA-256：`921328ffb82ce4c72e5ac8ba04ed8f1940ecd5cbe831078257ac967ffd9510f2`）；原始像素與色彩描述檔保留，僅移除 EXIF／XMP 中繼資料。來源附件原檔不變。
- 新授權只涵蓋創作者指定的兩張局部圖片及其中既有文字／記號，不涵蓋完整作品、可編輯原檔或其他敘事內容。正文提供圖片原尺寸檢視，仍不揭露作品名稱；完整音樂、總譜與影片未匯入。
- 舊 `score-process-excerpt.png` 保留但不再作為封面或正文示例，避免覆寫既有素材；封面 `preview_only: true` 防止內頁頂部重複圖片。私人來源映射僅保留於來源 owner。
- Hugo 建置、中英文首頁新封面、正文三張圖（流程示意與兩張提供圖片）、原尺寸連結、七項專案及圖片／中繼資料檢查通過；本次沿用已完成且仍適用的驗證。使用者已明確授權本次前端圖片替換提交並推送至 `origin/main`，沿用既有 GitHub Pages 自動發布，不另行手動部署。

### 2026-10-02 音樂與視覺能力頁首頁縮圖修復

- 使用者指出首頁沒有專案圖；實際公開卡片只有作者頭像。正文有譜面圖，但未設定 `image.filename`，且頁面沒有 `*featured*` 資產，因此 Hugo Blox 未選到卡片封面。
- 中英文 front matter 指定既有 `score-process-excerpt.png` 為封面，設定 `preview_only: true` 避免在正文頂部重複顯示。未複製或新增原作素材，核准譜面圖的雜湊不變。
- Hugo 建置與中英文首頁卡片檢查通過：各有一張專案縮圖（與作者頭像分開），首頁保留七項，正文仍只有既有兩張圖。
- 使用者另行明確要求提交本次縮圖修復，授權將雙語封面設定與本記錄提交並推送至 `origin/main`，沿用既有 GitHub Pages 自動發布；不新增素材或修改部署設定。

### 2026-10-02 音樂與視覺能力頁提交授權

- 使用者明確要求提交，授權本次雙語技術製作頁、通用流程圖、經裁切與模糊的少量譜面、雙語首頁及協作記錄提交並推送至 `origin/main`。
- 不納入私人來源文件、完整作品或原始可編輯檔案。推送只沿用既有 GitHub Pages 自動建置與發布，不另行部署或修改部署設定；先前未提交條目保留為各製作階段的歷史狀態。

### 2026-10-02 音樂與視覺能力頁技術細化與局部譜面

- 依使用者最新要求，雙語能力頁按實際技術說明細化為六項工作：作曲與多軌資料、MusicXML／總譜及演奏渲染、音響後期、圖像與深度視差、音畫時序與輸出、具體問題修訂。區分試作與定稿路線，亦區分譜面一致性與最終音軌逐音驗證。
- 使用者另行允許極少量總譜或影片片段，可裁切／模糊；取代先前不放任何原作片段的限制，但未授權完整作品、名稱、故事或可編輯檔案。來源對應與處理配方只保留在私人來源 owner，不寫入本倉庫。
- 新增 `content/project/ai-music-visual-workflow/score-process-excerpt.png`：僅兩小節、兩個聲部，移除題名、身分、頁碼與周邊上下文並模糊細節；1024×495、無 PNG 中繼資料／EXIF，SHA-256：`68d9ca4fe275fd2fb4415c175e0191906d0259542ae81e758024c841ba99270e`。未匯入完整 PDF、MusicXML、MIDI、音軌或影片，未重建或重新生成付費素材。
- 模糊只用於限縮細節，不保證片段絕對不可辨識。圖說明確標為製作階段示例，不聲稱是最終音軌的逐音對照。
- Hugo Extended 0.148.2 建置、雙語六項工作與兩張圖、首頁七項、圖片解碼／中繼資料／雜湊及 1,461 份輸出的辨識資訊檢查通過；原總譜未變，僅有既存連結欄位棄用警告。未提交、推送或部署。

### 2026-10-02 去識別化音樂與視覺創作能力頁

- 新增中英文 `content/project/ai-music-visual-workflow/`，僅展示音樂判斷、可編輯資料、技術整合及迭代檢核的方法；保留 AI 協作的透明說明，不揭露原作或來源專案的辨識資訊。
- 展示邊界是長期選擇，不預設日後公開原作；頁面、檔名、替代文字、metadata 與協作記錄均不得加入原作名稱、作者別名、賽事資訊、投稿日期、具辨識度故事或私人來源路徑。
- 僅使用獨立繪製的中英文通用 SVG 流程圖；未匯入音訊、旋律片段、譜面、原始圖像或影片，也不提供原作下載。
- 首頁近期項目由六項增為七項，保留所有既有項目。Hugo Extended 0.148.2 建置、雙語頁面與流程圖、首頁七張卡片、來源邊界檢查與 `git diff --check` 通過；另檢查 1,461 份建置頁面／feed／metadata／SVG，未發現原作辨識資訊。
- 僅更新本機內容，未提交、推送或部署；不得沿用上一輪提交授權。

### 2026-10-02 LegalWorld 提交授權

- 使用者明確要求提交，授權將本次 LegalWorld 中英文專案頁、兩張介面截圖、雙語首頁、論文關聯與協作記錄提交並推送至 `origin/main`。
- 推送 `main` 會觸發既有 GitHub Pages 自動建置與發布；不另行手動部署或修改部署設定。先前「未提交、推送或部署」條目為各編輯階段結束時的歷史狀態。

### 2026-10-02 LegalWorld 個人貢獻與介面展示

- 使用者確認：主要負責前端建置與互動體驗，並同意納入人工評測與資料支援、展示影片及聯調部署工作；中英文頁面同步更新，不新增主導論文、資料集或 LongJud-Bench 設計的主張。
- 保留共同作者（第三作者，Tao Chiang）署名，以具體工作範圍取代重複的非主導者聲明；首頁仍保留六項專案與既有論文關聯。
- 從 `/codex/002/法律AI小镇/DC-simlaw-town-frontend/docs/screenshots/` 複製兩張圖片，來源保留不變：`01-live-simulation.png` → `content/project/legalworld/featured.png`（SHA-256：`c9ae36bcea1f5e69a102752aea09c46b99c730f96a428ec6d2fb33846a919724`）；`04-court-workbench.png` → `content/project/legalworld/court-workbench.png`（SHA-256：`e108dc15664ba8e41f4d43ffb4833a5c3373d782f3255bd6877692330939407a`）。來源與目標雜湊一致。
- 圖片附雙語替代文字與圖說，標為早期版本演示；封面僅用於列表預覽，正文在介面展示區呈現，避免重複顯示。未重新生成圖片或嵌入影片。
- 資源區補入線上系統 `http://www.fudan-disc.com/legalworld/` 與官方公開程式碼 `https://github.com/sii-research/Legal-world`；不公開私人倉庫、評測者資料或內部部署資訊。
- Hugo Extended 0.148.2 正式建置、雙語頁面順序、兩張圖片／圖說／替代文字、首頁六項專案與封面、論文雙向連結及 `git diff --check` 均通過；僅有既存碩士論文連結欄位的棄用警告。
- 僅更新本機內容與維護記錄，未提交、推送或部署。

### 2026-10-02 LegalWorld 合作研究專案

- 新增 LegalWorld 中英文專案頁，明確標示 Tao Chiang 為共同作者（第三作者），並非專案主導者；不推定尚未確認的個人工作分工。
- 首頁「近期項目」中英文顯示數量由五項增為六項，保留原有專案；LegalWorld 論文頁同步關聯專案。
- Hugo Extended 0.148.2 正式建置通過，已檢查中英文首頁六張專案卡片、作者角色文字與論文／專案雙向連結；僅有既存碩士論文連結欄位的棄用警告。
- 本次僅更新本機內容；未提交、推送或部署。

### 2026-09-14 WeiShi competition award update

- Added the Chinese and English award pages for the July 21, 2026 Bronze Award at the Sixth Yunnan-Taiwan University Student Innovation and Entrepreneurship Competition.
- Updated the WeiShi project profile and author awards to record Dylan's team-lead role and primary responsibility for product and technology.

### 2026-09-14 Chuangzhi Frontier Workshop event

- Added the Chinese and English event records at content/event/chuangzhi-frontier-workshop-20260911/.
- The record documents participation in the September 11, 2026 workshop at the Shanghai Innovation Institute, including the program on generative agents and social intelligence.

### 2026-07-28 21:30 CST English static site

- Added Hugo multilingual support with Traditional Chinese at the root and an English site at `/en/`; all current Markdown content now has a same-path English translation file.
- English navigation, SEO metadata, footer copy, locale settings, and CV-block interface labels are maintained in language-specific configuration and `i18n/en.yaml`.
- Added a local language-chooser override that uses Hugo language labels (`中文` and `English`) while retaining the theme's existing interaction.
- First-time homepage visits use the browser's primary language: Chinese locales stay on `/`, while other locales enter `/en/`; a manual language choice is stored locally and takes precedence.
- English project pages preserve the existing Chinese visual and PDF assets as original historical material.

### 2026-07-28 20:30 CST CAIADA leadership update

- Added Dylan's current role as Chairperson of the Chinese AI Application Development Association (CAIADA) to the experience timeline and biography.
- The entry reflects the association's public mission: AI technology exchange, industry collaboration, talent development, and cross-sector AI application promotion.
- The Chinese Nationalist Party youth committee secretary-general role and Chiang clan association supervisor role remain current; their experience entries intentionally omit end dates.

### 2026-07-28 20:00 CST Open-source portfolio

- Added DC-WeMark, BOYA Skills, and DC Family Task Manager as featured portfolio projects.
- Each project page documents Dylan's role, core innovations, technical architecture, live demo, and GitHub source.
- Increased the homepage recent-project count from three to five so all current personal projects are visible, using a three-column desktop grid to keep the section compact and visually aligned with the rest of the homepage.

### 2026-07-28 19:00 CST Demo project cleanup

- Removed the Pandas, scikit-learn, and PyTorch starter-template examples because they were not Dylan's projects.
- The project portfolio now contains only Dylan's own work and the research-project section.

### 2026-07-28 18:10 CST WeiShi project profile

- Added 未識 WeiShi as the featured project for the sixth Yunnan-Taiwan University Student Innovation and Entrepreneurship Competition.
- The public project page describes the local-first competition prototype, Dylan's product and technology contributions, and the consent-based AI-agent relationship exploration flow without exposing team titles or the private source repository.
- Added the project to the homepage's featured project collection and reused the pitch deck's title, mechanism, and governance slides as project visuals.

### 2026-07-28 18:45 CST Kinmen AI computing center project refresh

- Rewrote the fourth Yunnan-Taiwan competition project page as a concise public portfolio entry covering Dylan's contributions, service concept, core innovations, silver award, and related research.
- Clarified that the computing center is a research and competition proposal rather than an operating facility.
- Added a generated infrastructure cover image and featured the project on the homepage alongside WeiShi.
- Reframed all cross-regional service discussion around export-control, data-protection, and legal compliance.

### 2026-07-28 17:30 CST Fudan PhD profile update

- Updated the academic profile to reflect Dylan's 智能科學與技術 PhD study at the School of Data Science, Fudan University, and affiliation with the Data Intelligence and Social Computing Lab (Fudan DISC).
- Aligned the biography, education, research interests, homepage research summary, and skills with the public GitHub profile: NLP, LLMs, computational social science, and human-centered AI.
- Replaced placeholder LinkedIn and Google Scholar links with verified GitHub and X profiles.
- Corrected the production base URL and replaced the stale SEO description with the current research profile.

### 2026-06-02 20:15 CST Local Development Environment Fixes & GitHub Actions Restore

- **GitHub Pages Deployment**: Confirmed that the website is deployed via GitHub Pages (GitHub Actions `deploy.yml`), not Cloudflare Pages. Restored the `.github/workflows/deploy.yml` file.
- **pnpm Symlink configuration**: Added `.npmrc` with `prefer-symlinked-executables=true`. By default on macOS, `pnpm` creates POSIX shell script wrapper files in `node_modules/.bin/tailwindcss`, which causes Hugo's Tailwind CSS transformer to fail with `binary "tailwindcss" is not a Node.js script`. Enabling symlinked executables forces `pnpm` to create real node-compatible symlinks, resolving the Hugo build issue.
- **Go Environment**: Confirmed that the local Hugo / Tailwind Blox template relies on Go Modules. Installed Go `1.26.3` via Homebrew in the local development environment to enable successful builds.

### 2026-05-18 02:30 CST Documentation entrypoint standardization

- Standardized root agent documents to `AGENTS.md`, `RULES.md`, and `MEMORY.md`.
- Migrated useful content from legacy agent/memory files into the standard files where present.
- Repository should now start from `AGENTS.md`, then `RULES.md`, then this file's policy and latest entries.
