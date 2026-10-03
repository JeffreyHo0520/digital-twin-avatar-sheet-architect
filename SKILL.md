---
name: digital-twin-avatar-sheet-architect
description: 人物數位孿生與多姿勢 IP 分身畫布架構師 (Digital Twin Avatar & Multi-Pose Sheet Architect)。專精於將真實人物照片或角色設定精準還原為「數位孿生 (Digital Twin)」虛擬形象，嚴格循序引導使用者完成五官特徵深度分析、風格選擇、分身數量 (8~20組) 與動作庫挑選 (40組老師/專業教學動作庫)，一鍵調用生圖工具產出單張白色畫布上的多姿勢老師插畫 (Wide-angle, strictly NO TEXT, solid clean white background)；並支援調用最多 6 個 Sub-Agents 並發生成各姿勢的獨立高解析素材圖，內建 Native ImageGen 與 Canva MCP 雙軌容錯生圖機制。當使用者提到「人物數位孿生」、「數位孿生分身」、「多姿勢分身圖」、「個人 IP 分身畫布」、「老師教學動作分身」、「照片轉多動作插畫」、「角色多姿勢合集」、「角色分身圖」、「Digital Twin 角色」時觸發。
---

# 人物數位孿生與多姿勢 IP 分身畫布架構師 (Digital Twin Avatar & Multi-Pose Sheet Architect)

專為講師、教師、創作者、專業人士打造「人物數位孿生（Digital Twin）」與「個人 IP 多姿勢角色分身畫布」的全方位視覺提示詞工程與自動化生成技能。
能將真實人物照片、形象照或角色設定圖，透過極細緻的特徵錨定與風格轉譯，生成單張白色純淨畫布上的多姿勢合集圖，或利用多 Agent 並行架構產出整套高解析獨立姿勢素材庫，供教材簡報、影音封面、社群圖卡與形象周邊使用。

---

## 🎯 核心價值與設計規範

1. **五官與特徵高保真還原 (High-Fidelity Feature Anchoring)**：
   - 深度解析照片中之臉型比例、眼神神韻、鼻樑高度、唇型、眉毛濃淡、眼鏡精確款式、髮型分布與漸層推剪比例（High Fade / 灰白比例）以及身材體態服飾。
2. **單一純白畫布原則 (Single Solid White Canvas)**：
   - 所有角色分身必須整齊均勻排列於單一張純白無雜質畫布上，方便下游直接裁切、去背或排版。
3. **零文字強制性政策 (Strict NO TEXT Policy)**：
   - **嚴禁**在畫面中出現任何文字、英文字母、標題、數字標記、動作名稱、圖表文字或浮水印。
4. **雙軌生圖容錯機制 (Dual-Engine ImageGen Failover)**：
   - 優先調用 Native `generate_image` 工具；
   - 若遇到 API 429 資源耗盡（RESOURCE_EXHAUSTED），自動無縫切換至 **Canva MCP**（`generate-image`）或本地備援引擎，確保生圖 100% 成功交付。
5. **多 Agent 並發加速架構 (Multi-Agent Parallel Pipeline)**：
   - 當需要生成各姿勢的獨立圖檔時，支援同時啟動最多 6 個 Sub-Agents（使用 `invoke_subagent`）並行繪製，縮短等待時間。

---

## 🔄 標準執行步驟（嚴格遵守順序，一次僅執行一個步驟）

在與使用者互動時，**嚴格遵守以下 8 個步驟順序**，每執行完一個步驟必須**停止並等待使用者回覆**：

### 步驟 1：歡迎與相片請求
- 親切歡迎使用者，說明本技能將引導打造「人物數位孿生 (Digital Twin)」多姿勢插畫畫布。
- 請使用者上傳一張清晰的人物照片或形象設定圖（若使用者已在首則訊息中上傳，則直接進入步驟 2）。
- **執行後必須停止並等待使用者上傳。**

### 步驟 2：五官特徵分析與確認
- 收到照片後，立即進行極細緻的特徵分析並記錄：
  * **臉型比例**：長方臉、方圓臉、倒三角臉、下顎線條。
  * **眼神神韻**：瞳色、瞇瞇笑眼、堅毅知性、溫暖親和。
  * **鼻樑高度**：挺直鼻樑、立體簡約、秀氣微翹。
  * **唇型**：上下唇輪廓、微笑嘴角、厚薄程度。
  * **眉毛濃淡**：濃密平劍眉、清秀眉、挑眉。
  * **眼鏡精確款式**：黑細方框、無框、玳瑁半框、圓框、金屬細框。
  * **髮型分布與細節**：寸頭、高漸層推剪 (High Fade)、灰白比例、捲度、分線。
  * **身形體態與經典穿搭**：健美肌理/勻稱身材、衣服款式與代表配色（如深青工字背心、深灰束口褲）。
- **主動呈現分析結果**（條列式描述）。
- **詢問確認**：「以上是為了確保『高度還原』所分析的特徵，有任何細節需要微調嗎？」
- **執行後必須停止並等待使用者確認。**

### 步驟 3：風格類別選擇
- 確認特徵後，展示以下六大風格類別供使用者挑選（或允許使用者輸入自訂風格）：
  * **1. 專業與商務邏輯**：極簡主義、溫暖專業、專業商務、數據驅動、單色調、高對比。
  * **2. 現代科技與未來派**：現代風、蘋果風、深色模式、極簡科技、未來主義、賽博龐克。
  * **3. UI 介面與材質質感**：玻璃擬態、液態玻璃、新擬物化、質感設計。
  * **4. 敘事與資訊視覺化**：視覺敘事、時間軸、資訊圖表、創意拼貼。
  * **5. 藝術美學與潮流**：奢華美學、復古海報、包浩斯、新粗魯主義、Y2K、復古拼貼。
  * **6. 溫馨生活與插畫風格**：北歐風、復古風、粉彩柔和、手繪水彩、Q 版可愛、溫馨手繪、黏土風、教育漫畫、剪紙藝術。
- **執行後必須停止並等待使用者回覆編號或自訂描述。**

### 步驟 4：具體風格確認
- 根據使用者在步驟 3 所選的類別，提供具體細化風格標籤（例如選 4 則提供 4-A 視覺敘事、4-B 現代資訊圖表、4-C 時間軸、4-D 創意拼貼）。
- **執行後必須停止並等待使用者確認。**

### 步驟 5：分身數量確認
- 詢問希望在單一畫布上呈現的分身數量（限定於 **8 到 20** 之間）。
- 提示建議：8～12 位細緻度最高、動作最清晰；16～20 位畫面豐富熱鬧。
- **執行後必須停止並等待使用者回覆數量。**

### 步驟 6：動作挑選模式
- 展示 **老師教學動作編排庫 (40 組完整動作)**。
- 請使用者選擇挑選模式：
  * **(A) 全手動**：由使用者直接輸入 N 個指定動作編號。
  * **(B) 全亂數**：由 AI 自庫中隨機挑選 N 組涵蓋講解、科技、互動、專注、放鬆等高對比張力的動作組合。
  * **(C) 指定 + 亂數**：使用者輸入必備編號，其餘由 AI 隨機補足。
- **執行後必須停止並等待使用者回覆。**

### 步驟 7：任務總結確認
- 條列簡述選定的特徵錨定重點、視覺風格、分身數量與動作清單。
- 詢問確認：「準備好開始生成您的『個人 IP 分身圖』了嗎？」
- **執行後必須停止並等待使用者確認。**

### 步驟 8：最終生圖執行
- 使用者確認後，立即呼叫生圖工具生成單張多姿勢綜合畫布。
- 繪圖完成後，主動提供成果檢視連結與本機圖檔路徑。

---

## 📚 老師教學動作編排庫 (40 組標準庫)

| 編號 | 動作名稱 | 英文 Prompt 關鍵語彙 | 編號 | 動作名稱 | 英文 Prompt 關鍵語彙 |
| :---: | :--- | :--- | :---: | :--- | :--- |
| **1** | 舉手回答 | Raising hand to answer or ask question | **21** | 持指揮棒指白板 | Holding pointer pointing at whiteboard |
| **2** | 做詳細筆記 | Taking meticulous notes on notepad | **22** | 黑板寫公式 | Writing mathematical formula on board |
| **3** | 手托腮聽講 | Hand resting under chin listening intently | **23** | 彎腰看學生作業 | Leaning over reviewing student work |
| **4** | 台上簡報 | Presenting on stage with open-palm gestures | **24** | 持擴音器說話 | Speaking through a megaphone |
| **5** | 閱讀教科書 | Reading an open textbook focused | **25** | 講台分發考卷 | Distributing exam papers from podium |
| **6** | 頭頂鉛筆思考 | Thinking with pencil balanced on head | **26** | 平板演示 App | Holding and demonstrating tablet app |
| **7** | 使用計算機 | Calculating numbers on desktop calculator | **27** | 操作投影機 | Adjusting and operating ceiling projector |
| **8** | 焦慮看時鐘 | Looking at wristwatch with urgency | **28** | 進行科學實驗 | Holding beaker doing science experiment |
| **9** | 坐在桌前改考卷 | Grading test papers with red pen at desk | **29** | 翻閱點名冊 | Flipping through student attendance binder |
| **10** | 擦拭黑板 | Wiping chalkboard clean with an eraser | **30** | 粉筆與板擦並用 | Holding chalk in one hand, eraser in other |
| **11** | 削彩色鉛筆 | Sharpening colored pencils with sharpener | **31** | 對鏡頭揮手 | Warmly waving hello with one hand |
| **12** | 整理文件夾 | Organizing colorful document binders | **32** | 校園長廊行走 | Confidently walking through hallway |
| **13** | 拿杯子喝水 | Holding mug sipping warm water/coffee | **33** | 小組討論 | Leading animated small group discussion |
| **14** | 操作筆電 | Expertly typing and working on slim laptop | **34** | 持地球儀教學 | Spinning educational globe with hands |
| **15** | 摸下巴沉思 | Thoughtfully stroking chin in deep reflection | **35** | 調整顯微鏡 | Looking into and adjusting microscope |
| **16** | 搬運重書 | Carrying a heavy stack of hardback books | **36** | 碼錶計時 | Holding stopwatch timing an exam/activity |
| **17** | 歡呼慶祝 | Cheering triumphantly with fists pumped | **37** | 公告欄貼海報 | Pinning announcement poster to board |
| **18** | 指圖表說明 | Outstretched arm pointing at diagram | **38** | 指導球類運動 | Athletic coach pose demonstrating ball drill |
| **19** | 趴桌補眠 | Head resting on crossed arms taking a nap | **39** | 頒發獎狀 | Presenting an award certificate honor |
| **20** | 手機通話 | Talking on modern smartphone professionally | **40** | 黑板繪製地圖 | Drawing geographical map on large board |

---

## 🎨 生圖提示詞架構規範 (Prompt Engineering Architecture)

調用生圖工具時，Prompt 必須嚴格遵從以下四層結構：

```text
[Layout & Composition]
A single comprehensive wide-angle character sheet illustration on a completely solid pure clean white background, featuring [N] distinct full-body poses of the exact same character evenly arranged across the single canvas.

[Character Identity & Physical Anchors]
Athletic muscular Asian male teacher, short black buzz-cut hair with a sharp high fade on the sides and back, sharp rectangular thin-rim eyeglasses, straight nose bridge, warm confident smile. Consistently wearing: dark teal / petrol blue sleeveless athletic tank top, dark charcoal gray jogger sweatpants, and dark athletic sneakers.

[Style & Aesthetic Tags]
[Selected English Style, e.g. Modern visual storytelling digital illustration, crisp vector linework, vibrant anime cel shading, expressive postures, clean composition].

[Actions & Postures List]
The [N] distinct poses arranged across the single canvas:
1. [Pose 1 in English]
2. [Pose 2 in English]
...
[N]. [Pose N in English]

[Mandatory Negative & Boundary Constraints]
Solid pure white background, completely isolated characters. STRICTLY NO TEXT, NO LETTERS, NO WORDS, NO NUMBERS, NO LABELS, NO SUBTITLES, NO WATERMARKS, NO ARROWS. Clean professional production quality.
```

---

## ⚡ 多 Sub-Agent 並發生圖與容錯調度協議

當使用者要求加速生成多個獨立姿勢圖檔（最多 6 個 Sub-Agents 同時運作）時，依循以下協同規則：

1. **工作分派矩陣**：
   - 使用 `invoke_subagent` 批次啟動最多 6 個 `self` 類型子代理。
   - 將剩餘姿勢（例如 Pose 2～8）均衡分配給各 Sub-Agent。
2. **生圖雙軌容錯 (Dual-Engine Execution)**：
   - **優先軌道**：調用 Native `generate_image`。
   - **備援軌道**：若發生 `429 RESOURCE_EXHAUSTED`，Sub-Agent 立即自動切換為 Canva MCP 工具：
     ```json
     {
       "ServerName": "canva",
       "ToolName": "generate-image",
       "Arguments": {
         "prompt": "[Standalone Pose Prompt on pure white background, STRICTLY NO TEXT]",
         "aspectRatio": "PORTRAIT_3_4",
         "user_intent": "Generate standalone pose for digital twin"
       }
     }
     ```
   - 輪詢 `get-generate-image-job` 直到取得成功產出的 Canva 檢視連結：`[Open generated image](...)`。
3. **完成彙整與資源清理**：
   - 各 Sub-Agent 完成後主動回傳包含姿勢編號、影像連結與執行日誌的結構化回報。
   - 主代理人驗收全數完成後，使用 `manage_subagents` (`Action: "kill_all"`) 釋放背景執行資源。
