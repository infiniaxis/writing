## 安裝檔案
- 先在本地電腦中開啟 Visual Studio 2015，選ASP.Net + Test Project
- 按照官網的NuGet[安裝方式](https://our.umbraco.org/documentation/Getting-Started/Setup/Install/install-umbraco-with-nuget)

### 中文化
- 新增 zh_tw.xml 和 zh.xml 到 C:\example\example\Umbraco\Config\Lang

### web.config
-  `<system.web>` 中增加
  ```
	<trust level="Full" />
  ```

- 修改偵錯設定，或增加到 web.Debug.config
  ```
  <customErrors mode="Off" />
  ```

### 在網頁伺服器中設定資料庫
- 選擇資料庫種類為 MS SQL Server，不可以用 MySQL，會出安裝問題

### 開始安裝
- 在 VS2015 中按下 Ctrl-F5
- 選擇 Custom (而不是直接安裝才能設定資料庫）
- 選擇 Microsoft SQL Server

### 進到後台畫面
- 將原本的 Blog 系統改名稱為 Product
- 刪除 Content 底下的不需要資料
- 安裝 Articulate
- Settings -> Partial Views -> MainNavigation / BottomNavigation -> 增加Blog連結
  ```
  <li><a href="/blog/">Blog></li>
  ```

- 恢復文章

### 調整 web.config
- email smtp 設定移到另外的檔案，改成
  ```
  <smtp configSource="WebMail.secret.config" />
  ```

- connectionStrings 移到另外的檔案，並改成
  ```
  <connectionStrings configSource="Web.Secret.config"/>
  ```

### 英文版本
- 新增首頁節點，設定連結

### 設定目錄權限
- 安裝前按下面連結至伺服器網頁設定權限，[官網連結](https://our.umbraco.org/documentation/Getting-Started/Setup/Install/permissions)
- 安裝完後，記得在按照上面連結將不需要最高權限的資料夾改回來
  - 新增檔案 `<projectName>.wpp.targets` 在專案資料夾中
  - 參考[網頁教學](http://sedodream.com/2011/11/08/SettingFolderPermissionsOnWebPublish.aspx)設定自動化權限

### Deploy Settings
- 按照上面方式設定目錄權限
- 自動化同步其他檔案（[網頁教學](https://www.asp.net/mvc/overview/deployment/visual-studio-web-deployment/deploying-extra-files)）
