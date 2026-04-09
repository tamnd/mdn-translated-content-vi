---
title: firefoxOptions
slug: Web/WebDriver/Reference/Capabilities/firefoxOptions
page-type: webdriver-capability
sidebar: webdriver
---

Capability **`moz:firefoxOptions`** là một tập capability có namespace dành riêng cho [Firefox](https://www.firefox.com/en-US/). Nó được dùng để điều khiển hành vi của Firefox và có thể được dùng như một thành viên của [`alwaysMatch`](/en-US/docs/Web/WebDriver/Reference/Capabilities#alwaysmatch) hoặc như một thành viên của một trong các mục [`firstMatch`](/en-US/docs/Web/WebDriver/Reference/Capabilities#firstmatch).

Nó được dùng để định nghĩa các tùy chọn kiểm soát cách Firefox được khởi động và chạy.

## Giá trị

`moz:firefoxOptions` là một JSON Object có thể chứa bất kỳ trường nào sau đây:

### `binary` (string)

Đường dẫn tuyệt đối tới Firefox binary tùy chỉnh sẽ dùng.

Trên macOS bạn có thể cung cấp đường dẫn tới application bundle, tức `/Applications/Firefox.app`, hoặc đường dẫn tuyệt đối tới tệp nhị phân thực thi bên trong bundle này, ví dụ `/Applications/Firefox.app/Contents/MacOS/firefox-bin`.

geckodriver sẽ cố gắng suy ra vị trí mặc định của Firefox trên hệ thống hiện tại nếu bỏ trống. Các vị trí mặc định của Firefox là:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Hệ thống</th>
      <th scope="col">Vị trí mặc định</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>macOS</td>
      <td>
        <ol>
          <li>
            <code>/Applications/Firefox.app/Contents/MacOS/firefox-bin</code>
          </li>
          <li>
            <code
              >$HOME/Applications/Firefox.app/Contents/MacOS/firefox-bin</code
            >
          </li>
        </ol>
      </td>
    </tr>
    <tr>
      <td>Linux<br />BSD</td>
      <td>
        <p>
          Tệp <code>firefox</code> đầu tiên tìm thấy trong system path. Điều này
          tương đương với kết quả của việc chạy
          <a
            href="https://manpages.debian.org/stretch/debianutils/which.1.en.html"
            >which(1)</a
          >:
        </p>
        <pre class="brush: plain">
% which firefox
/usr/bin/firefox
</pre
        >
      </td>
    </tr>
    <tr>
      <td>Windows</td>
      <td>
        <p>Từ Windows system registry:</p>
        <ol>
          <li>
            <code
              >HKEY_LOCAL_MACHINE\SOFTWARE WOW6432Node\Mozilla\Mozilla
              Firefox\[VERSION]\Main\PathToExe</code
            >
          </li>
          <li>
            <code
              >HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Mozilla
              Firefox\[VERSION]\Main\PathToExe</code
            >
          </li>
        </ol>
      </td>
    </tr>
  </tbody>
</table>

### `args` (array of strings)

Các đối số dòng lệnh để truyền cho Firefox binary. Chúng phải bao gồm dấu gạch ngang đứng đầu (`-`) khi cần, ví dụ `["-headless"]`.

Để geckodriver lấy một [profile](#profile_string) hiện có trên hệ thống tệp cục bộ, bạn có thể truyền `["-profile", "/path/to/profile"]`. Nhưng nếu profile phải được chuyển sang máy đích, nên dùng mục `profile`.

### `profile` (string)

ZIP được mã hóa base64 của một thư mục profile để dùng cho Firefox instance. Mục này có thể được dùng để, ví dụ, cài extension hoặc chứng chỉ tùy chỉnh, nhưng để đặt preferences tùy chỉnh, chúng tôi khuyến nghị dùng mục `prefs` ([Preferences Object](#prefs_preferences_object)) thay thế.

Profile được tạo trong thư mục tạm của hệ thống. Đây cũng là nơi profile đã mã hóa được giải nén khi cung cấp `profile`. Mặc định geckodriver sẽ tạo một profile mới tại vị trí này.

Profile hiệu lực đang được WebDriver session sử dụng sẽ được trả lại cho người dùng trong capability `moz:profile` trong [phản hồi new session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession).

Để geckodriver lấy một profile hiện có trên hệ thống tệp, hãy đặt trường `args` thành `{"args": ["-profile", "/path/to/your/profile"]}`. Lưu ý rằng nếu bạn dùng một client từ xa kết nối tới một server trên hệ thống khác, profile phải đã tồn tại trên hệ thống đích.

### `log` (Log object)

Để tăng độ chi tiết ghi log của geckodriver và Firefox, bạn có thể truyền một đối tượng `log` trông như `{"log": {"level": "trace"}}` để bao gồm mọi log mức trace trở lên.

Một JSON Object có thể có bất kỳ trường nào sau đây:

#### `level` (string)

Đặt mức độ chi tiết của geckodriver và Firefox. Các mức khả dụng là `trace`, `debug`, `config`, `info`, `warn`, `error`, và `fatal`. Nếu bỏ trống, mặc định là `info`. Giá trị được xem không phân biệt chữ hoa chữ thường.

### `prefs` (Preferences object)

Bản đồ tên preference tới giá trị preference, giá trị có thể là chuỗi, boolean hoặc integer.

Một JSON Object với một mục cho mỗi preference cần đặt. Preference sẽ được ghi vào [profile](#profile_string) trước khi khởi động Firefox. Danh sách đầy đủ các preference khả dụng có thể xem bằng cách truy cập "about:config" trong Firefox của bạn. Một số trong đó được tài liệu hóa trong [tệp nguồn này](https://searchfox.org/firefox-main/source/modules/libpref/init/all.js).

Ví dụ về một preference object:

```json
{
  "dom.ipc.processCount": 8,
  "javascript.options.showInConsole": false
}
```

### Android

Bắt đầu từ geckodriver 0.26.0, có thêm các capability nếu Firefox hoặc một ứng dụng nhúng [GeckoView](https://wiki.mozilla.org/Mobile/GeckoView) phải được điều khiển trên Android:

#### `androidPackage` (string, required)

Tên gói của Firefox, ví dụ `org.mozilla.firefox`, `org.mozilla.firefox_beta`, hoặc `org.mozilla.fennec` tùy theo kênh phát hành, hoặc tên gói của ứng dụng nhúng GeckoView, ví dụ `org.mozilla.geckoview_example`.

#### `androidActivity` (string, optional)

Tên lớp đầy đủ của activity sẽ được khởi chạy, ví dụ `.GeckoViewActivity`. Nếu không chỉ định, activity mặc định của gói sẽ được dùng.

#### `androidDeviceSerial` (string, optional)

Số serial của thiết bị nơi ứng dụng sẽ được khởi chạy. Nếu không chỉ định và có nhiều thiết bị được kết nối, sẽ trả về lỗi.

#### `androidIntentArguments` (array of strings, optional)

Các đối số dùng để khởi chạy intent. Về mặt nội bộ, geckodriver dùng [Android am](https://developer.android.com/tools/adb#am) để khởi động ứng dụng Android đang được kiểm thử. Các đối số intent được cung cấp sẽ được nối vào lệnh `am start`. Xem [đặc tả Android về intent arguments](https://developer.android.com/tools/adb#IntentSpec) để biết chi tiết. Điều này cho phép kiểm soát cách ứng dụng được khởi chạy và thêm các extra tùy chọn để bật/tắt tính năng. Ví dụ, để khởi chạy với hành động view và một URL được chỉ định trước khi điều hướng như một phần của bài kiểm thử, hãy bao gồm:

```json
{
  "androidIntentArguments": [
    "-a",
    "android.intent.action.VIEW",
    "-d",
    "https://example.com"
  ]
}
```

Ví dụ, để chỉ định một boolean extra có thể được xử lý bằng [android.content.Intent.getBooleanExtra](<https://developer.android.com/reference/android/content/Intent#getBooleanExtra(java.lang.String,%20boolean)>), hãy bao gồm:

```json
{
  "androidIntentArguments": ["--ez", "customBooleanFlagName", "true"]
}
```

#### `env` (Env object)

Bản đồ tên biến môi trường tới giá trị biến môi trường, cả hai đều phải là chuỗi, sẽ được chuyển tiếp tới tiến trình ứng dụng chạy trên thiết bị Android.

Một JSON Object với một mục cho mỗi biến môi trường cần đặt. Trên Desktop, Firefox đang được kiểm thử sẽ khởi chạy với biến đã cho trong môi trường của nó. Trên Android, App dựa trên GeckoView sẽ có biến đã cho được thêm vào khối `env` trong tệp YAML cấu hình của nó.

Ví dụ về một env object:

```json
{
  "MOZ_LOG": "nsHttp:5",
  "MOZ_LOG_FILE": "/mnt/sdcard/log"
}
```

## Ví dụ

Sau đây là một ví dụ về một [capabilities object](/en-US/docs/Web/WebDriver/Reference/Capabilities) đầy đủ, chọn một Firefox binary cụ thể để chạy với một [profile](#profile_string) đã chuẩn bị sẵn từ hệ thống tệp trong chế độ [headless mode](https://hacks.mozilla.org/2017/12/using-headless-mode-in-firefox/). Nó cũng tăng số lượng tiến trình IPC thông qua một preference, tắt các lỗi/cảnh báo chrome trong console, và bật ghi log chi tiết hơn:

```json
{
  "capabilities": {
    "alwaysMatch": {
      "moz:firefoxOptions": {
        "binary": "/usr/local/firefox/bin/firefox",
        "args": ["-headless", "-profile", "/path/to/my/profile"],
        "prefs": {
          "dom.ipc.processCount": 8,
          "javascript.options.showInConsole": false
        },
        "log": { "level": "trace" },
        "env": {
          "MOZ_LOG": "nsHttp:5",
          "MOZ_LOG_FILE": "/path/to/my/profile/log"
        }
      }
    }
  }
}
```

`moz:firefoxOptions` phải được đặt - như trên - bên trong [`alwaysMatch`](/en-US/docs/Web/WebDriver/Reference/Capabilities#alwaysmatch), hoặc trong một trong các [`firstMatch`](/en-US/docs/Web/WebDriver/Reference/Capabilities#firstmatch) [capabilities object](/en-US/docs/Web/WebDriver/Reference/Capabilities) như ở đây:

```json
{
  "capabilities": {
    "firstMatch": [{ "moz:firefoxOptions": {} }]
  }
}
```

### Android

Phần này chạy ứng dụng ví dụ GeckoView như được cài trên thiết bị giả lập Android đầu tiên đang chạy trên máy chủ:

```json
{
  "capabilities": {
    "alwaysMatch": {
      "moz:firefoxOptions": {
        "androidPackage": "org.mozilla.geckoview_example",
        "androidActivity": "org.mozilla.geckoview_example.GeckoView",
        "androidDeviceSerial": "emulator-5554",
        "androidIntentArguments": ["-d", "http://example.org"],
        "env": {
          "MOZ_LOG": "nsHttp:5",
          "MOZ_LOG_FILE": "/mnt/sdcard/log"
        }
      }
    }
  }
}
```

## Xem thêm

- [Tài liệu geckodriver về các capability Firefox được hỗ trợ](https://firefox-source-docs.mozilla.org/testing/geckodriver/Capabilities.html)
- [Các capability WebDriver dành riêng cho Chrome](https://developer.chrome.com/docs/chromedriver/capabilities)
  (`goog:chromeOptions)`
- [Danh sách các capability WebDriver](/en-US/docs/Web/WebDriver/Reference/Capabilities)
- Lệnh [New Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession)
