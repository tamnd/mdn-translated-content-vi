---
title: session.new command
short-title: session.new
slug: Web/WebDriver/Reference/BiDi/Modules/session/new
page-type: webdriver-command
browser-compat: webdriver.bidi.session.new
sidebar: webdriver
---

Lệnh `session.new` của module [command](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules#commands) [`session`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session) tạo một phiên BiDi mới với trình duyệt.

Vì lệnh này được dùng để tạo một phiên mới, nó chạy mà không có phiên nào đang hoạt động sẵn. (Trong BiDi, một lệnh như vậy được gọi là lệnh tĩnh.)

> [!NOTE]
> Phiên được tạo theo cách này chỉ có thể truy cập qua WebSocket và không thể được quản lý bằng các lệnh HTTP WebDriver cổ điển.

## Cú pháp

```json-nolint
{
  "method": "session.new",
  "params": {
    "capabilities": {}
  }
}
```

### Tham số

Trường `params` chứa:

- `capabilities`
  - : Một đối tượng xác định các tính năng được yêu cầu cho phiên. Nó có thể bao gồm các trường sau:
    - `alwaysMatch` {{optional_inline}}
      - : Một đối tượng xác định các tính năng được yêu cầu mà trình duyệt phải thỏa mãn tất cả để tạo phiên.
        Nếu trình duyệt không thể thỏa mãn tất cả các tính năng được yêu cầu trong đối tượng này, phiên sẽ không được tạo.
    - `firstMatch` {{optional_inline}}
      - : Một mảng các đối tượng, mỗi đối tượng xác định một tập hợp thay thế các tính năng được yêu cầu để tạo phiên.
        Trình duyệt sẽ thử từng tập hợp theo thứ tự đã chỉ định và tạo phiên bằng tập hợp đầu tiên mà tất cả các tính năng được yêu cầu đều có thể thỏa mãn.
        Nếu trình duyệt không thể thỏa mãn tất cả các tính năng được yêu cầu trong bất kỳ tập hợp nào, phiên sẽ không được tạo.

Các đối tượng `alwaysMatch` và `firstMatch` có thể bao gồm các tính năng sau:

- [`acceptInsecureCerts`](/en-US/docs/Web/WebDriver/Reference/Capabilities/acceptInsecureCerts) {{optional_inline}}
  - : Một giá trị boolean cho biết liệu chứng chỉ TLS không đáng tin cậy, chẳng hạn tự ký hoặc đã hết hạn, có được chấp nhận trong suốt thời lượng phiên hay không.
- `browserName` {{optional_inline}}
  - : Một chuỗi chỉ định tên trình duyệt cần dùng, ví dụ `"firefox"` hoặc `"chrome"`.
- `browserVersion` {{optional_inline}}
  - : Một chuỗi chỉ định phiên bản trình duyệt cần khớp, ví dụ `"120.0"`.
- `platformName` {{optional_inline}}
  - : Một chuỗi chỉ định hệ điều hành cần khớp, ví dụ `"windows"`, `"mac"`, `"android"`, hoặc `"linux"`.
- `proxy` {{optional_inline}}
  - : Một đối tượng chỉ định cấu hình proxy mà trình duyệt nên dùng cho các yêu cầu mạng.
- `unhandledPromptBehavior` {{optional_inline}}
  - : Một đối tượng chỉ định hành vi mặc định khi gặp hộp thoại của người dùng, chẳng hạn `alert`, `confirm`, hoặc `prompt`, trong một lệnh.

### Giá trị trả về

Các trường sau trong đối tượng `result` của phản hồi mô tả đặc điểm của phiên được tạo:

- `sessionId`
  - : Một chuỗi chứa mã định danh duy nhất cho phiên mới được tạo.
- `capabilities`
  - : Một đối tượng mô tả các khả năng đã được thương lượng và hiện đang hoạt động cho phiên. Nó bao gồm các trường sau:
    - [`acceptInsecureCerts`](/en-US/docs/Web/WebDriver/Reference/Capabilities/acceptInsecureCerts)
      - : Một giá trị boolean cho biết liệu chứng chỉ TLS không đáng tin cậy, chẳng hạn tự ký hoặc đã hết hạn, có được chấp nhận trong suốt thời lượng phiên hay không.
    - `browserName`
      - : Một chuỗi chứa tên trình duyệt.
    - `browserVersion`
      - : Một chuỗi chứa phiên bản của trình duyệt.
    - `platformName`
      - : Một chuỗi chứa tên của hệ điều hành.
    - `setWindowRect`
      - : Một giá trị boolean cho biết liệu cửa sổ trình duyệt có thể được thay đổi kích thước và vị trí bằng lệnh [Set Window Rect](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/SetWindowRect) hay không.
    - `userAgent`
      - : Một chuỗi chứa user agent của trình duyệt, ví dụ `"Mozilla/5.0 (X11; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0"`.
    - `proxy` {{optional_inline}}
      - : Một đối tượng mô tả cấu hình proxy đang hoạt động. Một đối tượng rỗng (`{}`) cho biết không có proxy nào được cấu hình.
    - `unhandledPromptBehavior` {{optional_inline}}
      - : Một đối tượng mô tả hành vi mặc định khi gặp hộp thoại của người dùng, chẳng hạn `alert`, `confirm`, hoặc `prompt`, trong một lệnh. Trường này chỉ xuất hiện khi được chỉ định trong tham số `capabilities`.
    - [`webSocketUrl`](/en-US/docs/Web/WebDriver/Reference/Capabilities/webSocketUrl) {{optional_inline}}
      - : Một chuỗi chứa URL WebSocket cho phiên.

Trình duyệt cũng có thể trả về các khả năng đặc thù của nhà cung cấp, có tiền tố là mã định danh trình duyệt, ví dụ `moz:buildID` cho Firefox.

### Lỗi

- session not created
  - : Một phiên đã tồn tại, hoặc trình duyệt không thể tạo phiên mới, ví dụ vì một khả năng được yêu cầu không thể được thỏa mãn.

## Ví dụ

### Tạo một phiên với các khả năng mặc định

Khi đã thiết lập kết nối WebDriver BiDi, hãy gửi thông điệp sau để tạo một phiên mới với các khả năng mặc định:

```json
{
  "id": 1,
  "method": "session.new",
  "params": {
    "capabilities": {}
  }
}
```

Trình duyệt phản hồi với mã định danh phiên và các khả năng đã được thương lượng:

```json
{
  "id": 1,
  "type": "success",
  "result": {
    "sessionId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
    "capabilities": {
      "acceptInsecureCerts": false,
      "browserName": "firefox",
      "browserVersion": "147.0.4",
      "platformName": "mac",
      "setWindowRect": true,
      "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:147.0) Gecko/20100101 Firefox/147.0",
      "proxy": {}
    }
  }
}
```

### Tạo một phiên với các khả năng bắt buộc

Để yêu cầu một trình duyệt cụ thể và chấp nhận chứng chỉ không an toàn bằng `alwaysMatch`, hãy gửi thông điệp sau:

```json
{
  "id": 1,
  "method": "session.new",
  "params": {
    "capabilities": {
      "alwaysMatch": {
        "browserName": "firefox",
        "acceptInsecureCerts": true
      }
    }
  }
}
```

Nếu trình duyệt có thể thỏa mãn các khả năng được yêu cầu, nó sẽ phản hồi bằng mã định danh phiên và các khả năng đã được thương lượng như sau:

```json
{
  "id": 1,
  "type": "success",
  "result": {
    "sessionId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
    "capabilities": {
      "acceptInsecureCerts": true,
      "browserName": "firefox",
      "browserVersion": "147.0.4",
      "platformName": "mac",
      "setWindowRect": true,
      "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:147.0) Gecko/20100101 Firefox/147.0",
      "proxy": {}
    }
  }
}
```

### Thử tạo một phiên khi đã có một phiên tồn tại

Trong các trình duyệt không hỗ trợ nhiều phiên, ví dụ Firefox, việc gửi `session.new` khi một phiên đã đang hoạt động sẽ dẫn đến phản hồi lỗi:

```json
{
  "type": "error",
  "id": 1,
  "error": "session not created",
  "message": "Maximum number of active sessions",
  "stacktrace": ""
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Lệnh [`session.status`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/status)
- Lệnh [`session.end`](/en-US/docs/Web/WebDriver/Reference/BiDi/Modules/session/end)
