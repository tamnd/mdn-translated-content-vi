---
title: WebDriver capabilities
short-title: Capabilities
slug: Web/WebDriver/Reference/Capabilities
page-type: landing-page
sidebar: webdriver
---

Các capabilities của WebDriver classic được dùng để trao đổi các tính năng mà một [session](/en-US/docs/Web/WebDriver) hỗ trợ. Một client cũng có thể dùng capabilities để xác định những tính năng mà nó yêu cầu driver phải đáp ứng khi [tạo một session mới](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/NewSession).

Khi một WebDriver session được tạo, nó trả về một tập hợp capabilities mô tả các capabilities đã được thương lượng và có hiệu lực của session. Một số capabilities trong tập này là [chuẩn và được chia sẻ giữa mọi trình duyệt](#list_of_capabilities), nhưng tập này cũng có thể chứa các [browser-specific capabilities](#vendor-specific_capabilities) và chúng luôn có tiền tố.

## Thương lượng capabilities

Capabilities có thể được dùng để yêu cầu một driver hỗ trợ một tập hợp con tính năng nhất định. Điều này có thể dùng để yêu cầu các tính năng trình duyệt cụ thể, chẳng hạn như [khả năng thay đổi kích thước cửa sổ](/en-US/docs/Web/WebDriver/Reference/Classic/Capabilities/setWindowRect), nhưng cũng được dùng trong môi trường phân tán để chọn một cấu hình trình duyệt cụ thể từ một ma trận các lựa chọn.

Việc chọn một trình duyệt hoặc nền tảng cụ thể chỉ có ý nghĩa khi bạn dùng WebDriver từ xa. Trong trường hợp này, client kết nối với WebDriver thông qua một hoặc nhiều nút trung gian, các nút này sẽ thương lượng driver nào sẽ được trả về cho bạn dựa trên capabilities mà nó nhận được.

Đối tượng capabilities là một cơ chế lựa chọn giới hạn những cấu hình driver nào server sẽ trả về. Nếu bạn yêu cầu một phiên bản Firefox bằng `browserName` và Firefox không được cài trên máy từ xa, hoặc macOS từ một máy từ xa chỉ hỗ trợ Linux, bạn có thể không may mắn. Nhưng đôi khi bạn không quan tâm session của mình có hệ điều hành hay trình duyệt web cụ thể nào: bạn chỉ cần một session có một _khả năng_ nào đó.

Quá trình lựa chọn, hay _thương lượng capabilities_, được thực hiện qua `alwaysMatch` và `firstMatch`.

### `alwaysMatch`

Đúng như tên gọi, các capabilities được mô tả bên trong đối tượng capabilities `alwaysMatch` là những tính năng mà bạn _yêu cầu_ session phải có. Nếu server không thể cung cấp những tính năng bạn yêu cầu, nó sẽ thất bại.

Ví dụ nếu bạn yêu cầu Firefox phiên bản 62 trên một hệ thống chỉ có 60, việc tạo session sẽ thất bại:

```json
{
  "capabilities": {
    "alwaysMatch": {
      "browserName": "firefox",
      "browserVersion": "60"
    }
  }
}
```

### `firstMatch`

Trường `firstMatch` chấp nhận _một mảng_ các đối tượng capabilities sẽ lần lượt được so khớp cho đến khi một đối tượng khớp với những gì server có thể cung cấp, hoặc nó sẽ thất bại.

Điều này có thể hữu ích khi bạn muốn một driver chạy trên macOS hoặc Linux, nhưng không phải Windows:

```json
{
  "capabilities": {
    "firstMatch": [{ "platformName": "macos" }, { "platformName": "linux" }]
  }
}
```

### Kết hợp `alwaysMatch` và `firstMatch`

`firstMatch` đương nhiên có thể được kết hợp với `alwaysMatch` để thu hẹp phạm vi lựa chọn. Ví dụ nếu bạn muốn một driver chạy trên macOS hoặc Linux nhưng _phải_ là Firefox:

```json
{
  "capabilities": {
    "alwaysMatch": {
      "browserName": "firefox"
    },
    "firstMatch": [{ "platformName": "macos" }, { "platformName": "linux" }]
  }
}
```

Ví dụ trước hoàn toàn tương đương với việc đặt yêu cầu Firefox trong từng nhánh `firstMatch`:

```json
{
  "capabilities": {
    "firstMatch": [
      { "browserName": "firefox", "platformName": "macos" },
      { "browserName": "firefox", "platformName": "linux" }
    ]
  }
}
```

Việc bạn chọn ví dụ nào trong hai ví dụ trên không quan trọng, nhưng nó có thể có ý nghĩa khi truyền theo cấu hình trình duyệt. Để tránh lặp lại dữ liệu không cần thiết, chẳng hạn như profile, nên dùng `alwaysMatch` để dữ liệu này chỉ được truyền qua dây một lần:

```json
{
  "capabilities": {
    "alwaysMatch": {
      "browserName": "firefox",
      "moz:firefoxOptions": {
        "profile": "<base64 encoded profile>",
        "args": ["-headless"],
        "prefs": { "dom.ipc.processCount": 8 },
        "log": { "level": "trace" }
      }
    },
    "firstMatch": [{ "platformName": "macos" }, { "platformName": "linux" }]
  }
}
```

## Danh sách capabilities

- [`browserName`](/en-US/docs/Web/WebDriver/Reference/Capabilities/browserName)
- [`browserVersion`](/en-US/docs/Web/WebDriver/Reference/Capabilities/browserVersion)
- [`platformName`](/en-US/docs/Web/WebDriver/Reference/Capabilities/platformName)
- [`acceptInsecureCerts`](/en-US/docs/Web/WebDriver/Reference/Capabilities/acceptInsecureCerts)
- [`pageLoadStrategy`](/en-US/docs/Web/WebDriver/Reference/Capabilities/pageLoadStrategy)
- [`proxy`](/en-US/docs/Web/WebDriver/Reference/Capabilities/proxy)
- [`setWindowRect`](/en-US/docs/Web/WebDriver/Reference/Capabilities/setWindowRect)
- [`timeouts`](/en-US/docs/Web/WebDriver/Reference/Capabilities/timeouts)
- [`unhandledPromptBehavior`](/en-US/docs/Web/WebDriver/Reference/Capabilities/unhandledPromptBehavior)
- [`webSocketUrl`](/en-US/docs/Web/WebDriver/Reference/Capabilities/webSocketUrl)

### Capabilities đặc thù của nhà cung cấp

Ngoài [các capabilities chuẩn](#list_of_capabilities), WebDriver cho phép bên thứ ba _mở rộng_ tập capabilities để phù hợp với nhu cầu của họ. Các nhà cung cấp trình duyệt và nhà cung cấp driver thường dùng extension capabilities để cung cấp cấu hình cho trình duyệt, nhưng chúng cũng có thể được dùng bởi các thành phần trung gian cho các khối dữ liệu tùy ý.

- [Firefox capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities/firefoxOptions) (`moz:firefoxOptions`)
- [Chrome capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities/goog/chromeOptions) (`goog:chromeOptions`)

### Capabilities cũ

Phần lớn client Selenium dùng `desiredCapabilities` và `requiredCapabilities` để cấu hình session mới. Chúng rất giống với `firstMatch` và `alwaysMatch` mô tả ở trên. Một số driver hỗ trợ các capabilities cũ này, nhưng chúng đã bị loại bỏ và nên tránh dùng.

Việc chuyển một đối tượng capabilities cũ sang kiểu mới khá dễ. Điều đầu tiên bạn cần biết là `alwaysMatch`/`firstMatch` luôn được bọc bên trong một JSON Object `capabilities`, trong khi `desiredCapabilities`/`requiredCapabilities` tồn tại ở cấp cao nhất. Nói chung, mọi thứ trước đây từng đi vào `desiredCapabilities` nên đi vào một nhánh `firstMatch` để đạt hiệu ứng tương tự.

Hãy lấy đối tượng capabilities đã lỗi thời này:

```json
{ "desiredCapabilities": { "browserName": "firefox" } }
```

Nó sẽ tương đương về chức năng với kiểu mới:

```json
{ "capabilities": { "firstMatch": [{ "browserName": "firefox" }] } }
```

Nhưng vì chỉ có một nhánh `firstMatch`, và chúng ta biết việc tạo session sẽ thất bại nếu server không có Firefox được cài, nó cũng tương đương với:

```json
{ "capabilities": { "alwaysMatch": { "browserName": "firefox" } } }
```

## Xem thêm

- Lệnh [New Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession)
- Lệnh [Delete Session](/en-US/docs/Web/WebDriver/Reference/Commands/NewSession)
