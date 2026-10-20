## 原始碼與網站發布

- 原始碼與日後修改入口：`dylanchiang-lab/P-academic`。
- 正式網站維持 `https://dylanchiang-dev.github.io/`。
- 推送 `main` 後由本倉庫的 GitHub Actions 建置，再使用專用發布金鑰將靜態產物寫入個人倉庫 `DylanChiang-Dev/DylanChiang-Dev.github.io` 的 `gh-pages` 分支。
- 個人倉庫只作為原網址的發布入口；其舊 `main` 分支保留歷史，不再維護原始碼。
- `ACADEMIC_PAGES_DEPLOY_KEY` 是本倉庫的 Actions Secret，私鑰不得放入原始碼、日誌或網站產物。

# Dylan Chiang 的學術個人網站

歡迎來到蔣濤（Dylan Chiang）的個人學術網站。這是一個基於 Hugo Blox Builder 構建的平台，用於展示我的學術成果、研究項目以及專業經歷，同時也是我分享研究心得與技術見解的空間。

## 網站特色

- **學術研究**：完整收錄期刊論文、會議發表及學位論文，展示學術軌跡。
- **項目展示**：呈現研究專案與技術開發成果，分享實踐經驗。
- **知識分享**：透過博客文章記錄論文閱讀筆記、技術探索與深度思考。
- **專業歷程**：記錄教學經驗、受邀演講及學術會議參與情況。

## 開發指南

本網站採用 **Hugo Extended** 靜態網站生成器，搭配 **Tailwind CSS** 進行樣式設計。

### 快速開始

若您希望在本地運行此項目，請確保已安裝 Hugo Extended 與 pnpm：

```bash
# 1. 克隆倉庫
git clone https://github.com/dylanchiang-lab/P-academic.git
cd P-academic

# 2. 安裝依賴
pnpm install

# 3. 啟動開發服務器
hugo server --disableFastRender
```

啟動後，請在瀏覽器訪問 `http://localhost:1313`。更多關於技術棧與開發流程的細節，請參閱 [技術文檔](CLAUDE.md)。

## 內容管理

我們建立了一套標準化的內容管理流程，以確保網站內容的品質與一致性。

- **[貢獻指南](CONTRIBUTING.md)**：詳細說明了如何添加新內容、文件命名規範以及各類文章的 Front Matter 模板。
- **[標籤指南](docs/TAGGING_GUIDE.md)**：介紹了用於內容分類的三層標籤系統，幫助讀者更有效地檢索資訊。

## 聯繫方式

歡迎透過以下方式與我聯繫或進行學術交流：

- **GitHub**: [@DylanChiang-Dev](https://github.com/DylanChiang-Dev)

---

&copy; 2026 Dylan Chiang. Powered by the [Hugo Blox Builder](https://hugoblox.com).
