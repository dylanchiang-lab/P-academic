# Dylan Chiang 的學術個人網站 Agent Notes

## Start Here

- Read this file first, then `RULES.md`, then the top policy section and latest entries in `MEMORY.md`.
- Keep `README.md` as the human-facing project overview; do not turn it into an agent log.
- Use `MEMORY.md` for durable collaboration notes, decisions, deployment facts, and gotchas.
- Do not write secrets, tokens, private keys, or `.env` values into repository files or logs.

## Repository routing

- 目前原始碼倉庫、正式網址與發布位置以 `MEMORY.md` 的 Current Repository Facts 為準。
- 原始碼與網站發布分屬不同倉庫；不得直接修改或覆蓋發布倉庫的舊 main 原始碼歷史。

## Tech Stack

- Node.js package `hugo-blox-academic-cv-starter`; scripts: build, dev
- Go module module github.com/HugoBlox/hugo-blox-builder/starters/academic-cv 

## Common Commands

- Install: `npm install`
- Develop: `npm run dev`
- Build: `npm run build`
- Test: `go test ./...`

## Work Rules

- Before editing, inspect the relevant source files and existing style.
- Keep changes small and reviewable; avoid unrelated refactors.
- Run the fastest relevant check after changes.
- Commit completed work with a clear Chinese commit message unless the user asks otherwise.
- Push only after the local verification for the change has passed.

## Documentation Map

- `README.md`: project overview for humans.
- `AGENTS.md`: current agent entrypoint and operating notes.
- `RULES.md`: stable repository-specific rules.
- `MEMORY.md`: progressive collaboration memory and historical notes.

## Migrated From `AGENTS.md`

```markdown
# Dylan Chiang 的學術個人網站 Agent Notes

## Start Here

- Read this file first, then `RULES.md`, then the top policy section and latest entries in `MEMORY.md`.
- Keep `README.md` as the human-facing project overview; do not turn it into an agent log.
- Use `MEMORY.md` for durable collaboration notes, decisions, deployment facts, and gotchas.
- Do not write secrets, tokens, private keys, or `.env` values into repository files or logs.

## Repository

- Owner: `DylanChiang-Dev`
- Repository: `DylanChiang-Dev.github.io`
- Origin: `https://github.com/DylanChiang-Dev/DylanChiang-Dev.github.io`
- Local path: `/Users/dc/Documents/github/DylanChiang-Dev/DylanChiang-Dev.github.io`
- Main branch: `main`
- Private: `False`

## Tech Stack

- Node.js package `hugo-blox-academic-cv-starter`; scripts: build, dev
- Go module module github.com/HugoBlox/hugo-blox-builder/starters/academic-cv 

## Common Commands

- Install: `npm install`
- Develop: `npm run dev`
- Build: `npm run build`
- Test: `go test ./...`

## Work Rules

- Before editing, inspect the relevant source files and existing style.
- Keep changes small and reviewable; avoid unrelated refactors.
- Run the fastest relevant check after changes.
- Commit completed work with a clear Chinese commit message unless the user asks otherwise.
- Push only after the local verification for the change has passed.

## Documentation Map

- `README.md`: project overview for humans.
- `AGENTS.md`: current agent entrypoint and operating notes.
- `RULES.md`: stable repository-specific rules.
- `MEMORY.md`: progressive collaboration memory and historical notes.

## Migrated From `CLAUDE.md`

```markdown
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 項目概述

這是一個基於 Hugo Blox Builder 構建的學術個人網站，展示蔣濤（Dylan Chiang）的學術成果、研究項目和專業經歷。網站支援繁體中文內容，並部署在 GitHub Pages 上。

## 核心技術棧

- **Hugo Extended 0.148.2** - 靜態網站生成器（由 GitHub Actions 指定版本）
- **Hugo Blox Builder** - 學術網站主題框架
- **Tailwind CSS v4** - CSS 框架（通過 pnpm 管理）
- **Node.js 20** - 用於 CSS 構建和資源處理
- **pnpm 10.14.0** - 包管理器

## 常用開發命令

```bash
# 本地開發服務器（推薦使用 --disableFastRender）
hugo server --disableFastRender

# 使用 npm scripts
npm run dev    # 啟動開發服務器
npm run build  # 構建生產版本

# 依賴管理
pnpm install   # 安裝依賴
```

## 內容類型對應指南

請嚴格遵守以下分類，特別是**論文閱讀筆記**與**學術論文**的區別：

| 內容類型 | 目錄 | 用途 |
|---------|------|------|
| **論文閱讀筆記** | `content/post/` | 個人化的論文閱讀心得、筆記（包含「我的理解」） |
| **技術分享** | `content/post/` | AI、技術工具、方法論的分享 |
| **學術論文** | `content/publication/` | **正式發表**的學術期刊、會議論文 |
| **演講記錄** | `content/talk/` | 演講、報告內容 |
| **會議記錄** | `content/event/` | 參與的學術會議 |

## 參考文檔 (Reference Documentation)

- **論文閱讀筆記指南**: 詳見 `docs/PAPER_READING_GUIDE.md` (寫作風格、結構模板)。
- **標籤系統指南**: 詳見 `docs/TAGGING_GUIDE.md`。

## 命名規範

### 資料夾與檔案
- **資料夾命名**：全小寫英文，用短橫線分隔（`kebab-case`）。
  - ✅ `rl-llm-reasoning-capacity-reading`
  - ❌ `RLLLMReading`, `rl_llm_reading`, `論文閱讀`
- **主檔案**：一律使用 `index.md`。
- **圖片**：使用描述性英文名稱，小寫短橫線分隔（如 `result-chart.png`）。特色圖片可命名為 `featured.jpg`。

### 語言規範
- **優先使用繁體中文**（如 `人工智慧`）。
- **常見縮寫使用英文大寫**（如 `LLM`, `AI`, `GWAS`）。
- **專有名詞保持原文**（如 `ChatGPT`, `DeepSeek`）。

## Front Matter 模板

### 1. Post (論文閱讀/技術分享)
位於 `content/post/`：
```yaml
---
title: "文章標題"
summary: "一句話摘要（顯示在列表中）"
date: 2025-01-01
authors:
  - admin
tags:
  - 論文閱讀           # 一級標籤（必選）
  - 人工智慧           # 二級標籤
  - LLM               # 三級標籤
draft: false
---
```
*注意：論文閱讀筆記必須包含「我的理解」章節。*

### 2. Publication (學術出版物)
位於 `content/publication/`：
```yaml
---
title: "論文標題"
authors:
  - admin
date: "2025-01-01"
draft: false
publishDate: "2025-01-01"
publication_types: ["article"]  # article, conference-paper, thesis
publication: "期刊或會議名稱"
publication_short: "縮寫"
abstract: "完整摘要"
summary: "一句話總結"
tags:
  - 標籤1
featured: true
links:
  - type: pdf
    url: PDF連結
---
```

### 3. Talk (演講)
位於 `content/talk/`：
```yaml
---
title: "演講標題"
event: "活動名稱"
location: "地點"
summary: "演講摘要"
abstract: "詳細說明"
date: "2025-01-01T13:00:00Z"
date_end: "2025-01-01T15:00:00Z"
all_day: false
authors:
  - admin
tags:
  - 標籤
draft: false
---
```

### 4. Event (參會)
位於 `content/event/`：
```yaml
---
title: "會議名稱"
event: "完整會議名稱"
location: "地點"
summary: "會議摘要"
date: "2025-01-01"
date_end: "2025-01-03"
all_day: true
authors:
  - admin
tags:
  - 標籤
draft: false
---
```

## 標籤系統指南

採用三層標籤系統，詳見 `docs/TAGGING_GUIDE.md`：

1.  **一級標籤（內容類型，必選一個）**
    - `論文閱讀`、`技術分享`、`研究發現`、`教學資源`

2.  **二級標籤（主題領域，推薦）**
    - 社會科學：`心理學`、`經濟學`、`政治學`
    - 科技領域：`人工智慧`、`數據科學`
    - 方法論：`行為遺傳學`、`演化心理學`

3.  **三級標籤（具體技術/概念，可選多個）**
    - `LLM`、`強化學習`、`RLVR`、`ChatGPT`
    - `GWAS`、`參與式預算`

**標籤建議數量**：3-6 個。

## 項目架構與配置

### 關鍵路徑
- `content/`：網站內容源文件。
- `config/_default/`：
  - `hugo.yaml`：主配置（語言 `zh-tw`, CJK 支援）。
  - `menus.yaml`：導航菜單權重。
  - `params.yaml`：外觀參數。
- `assets/`：SCSS、圖片等資源。

### 部署工作流
- 推送到 `main` 分支觸發 GitHub Actions。
- 自動構建並部署至 `gh-pages` 分支。
- 網站地址：https://dylanchiang-dev.github.io

### 開發注意事項
- **圖片處理**：Hugo 自動處理壓縮。建議為每個新內容創建獨立文件夾以管理圖片。
- **PDF 連結**：系統會自動為 PDF 連結添加 `target="_blank"`（由 `assets/js/pdf-links.js` 處理）。
- **搜索**：支援 Pagefind 搜索索引生成。
```
```
