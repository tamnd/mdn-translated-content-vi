---
title: Get Window Handles
slug: Web/WebDriver/Reference/Classic/Commands/GetWindowHandles
page-type: webdriver-command
browser-compat: webdriver.classic.GetWindowHandles
sidebar: webdriver
---

Lệnh _Get Window Handles_ của API [WebDriver](/en-US/docs/Web/WebDriver) trả về danh sách tất cả các [`WebWindow`](/en-US/docs/Web/WebDriver/Reference/WebWindow). Mỗi tab hoặc cửa sổ, tùy bạn đang dùng trình duyệt dạng tab hay không, được liên kết bằng một _window handle_ được dùng làm tham chiếu khi [chuyển sang cửa sổ](/en-US/docs/Web/WebDriver/Reference/Commands/SwitchToWindow).

Để xác định một tương tác cụ thể với trình duyệt có mở một cửa sổ mới hay không, bạn có thể lấy tập hợp các window handle trước khi thực hiện tương tác và so sánh nó với tập hợp sau khi hành động đã thực hiện.

## Cú pháp

| Method                                              | URI template                           |
| --------------------------------------------------- | -------------------------------------- |
| [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) | `/session/{session id}/window/handles` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Lỗi

- Invalid session ID
  - : Phiên không tồn tại.

## Ví dụ

C#:

```cs
using System.Collections.ObjectModel;
using OpenQA.Selenium.Firefox;

namespace MDNWebDriverExamples
{
    class Example
    {
        public static void Main(string[] args)
        {
            FirefoxDriver session = new FirefoxDriver();

            session.ExecuteScript("window.open()");

            ReadOnlyCollection<string> currentWindowHandles = session.WindowHandles;
        }
    }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Switch To Window](/en-US/docs/Web/WebDriver/Reference/Commands/SwitchToWindow) command
- [Get Window Handle](/en-US/docs/Web/WebDriver/Reference/Commands/GetWindowHandle) command
- [Close Window](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/CloseWindow) command
