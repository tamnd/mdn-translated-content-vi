---
title: Close Window
slug: Web/WebDriver/Reference/Classic/Commands/CloseWindow
page-type: webdriver-command
browser-compat: webdriver.classic.CloseWindow
sidebar: webdriver
---

Lệnh _Close Window_ của API [WebDriver](/en-US/docs/Web/WebDriver) đóng ngữ cảnh duyệt cấp cao hiện tại (cửa sổ hoặc tab) và trả về danh sách các [`WebWindow`](/en-US/docs/Web/WebDriver/Reference/WebWindow) hiện đang mở. Nếu đây là cửa sổ cuối cùng bị đóng, phiên WebDriver sẽ bị xóa ngầm định. Mọi lệnh tiếp theo sau khi phiên kết thúc sẽ vì thế gây ra lỗi [invalid session ID](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID).

## Cú pháp

| Method                                                    | URI template                   |
| --------------------------------------------------------- | ------------------------------ |
| [`DELETE`](/en-US/docs/Web/HTTP/Reference/Methods/DELETE) | `/session/{session id}/window` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Lỗi

- [Invalid session ID](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.
- [Unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen)
  - : Một lời nhắc của người dùng, chẳng hạn như [`window.alert`](/en-US/docs/Web/API/Window/alert), chặn việc thực thi lệnh cho đến khi nó được xử lý.

## Ví dụ

Python:

```python
from selenium import webdriver

session = webdriver.Firefox()
original_window = session.window_handle

new_window = session.execute_script("return window.open()")
session.switch_to.window(new_window)

session.close()
session.switch_to.window(original_window)
```

C#:

```cs
using OpenQA.Selenium.Firefox;

namespace MDNWebDriverExamples
{
    class Example
    {
        public static void Main(string[] args)
        {
            FirefoxDriver session = new FirefoxDriver();
            string original_window = session.CurrentWindowHandle;// Tùy chọn nếu bạn muốn lưu handle trong một biến

            session.ExecuteScript("window.open()");
            session.SwitchTo().Window(session.WindowHandles[1]); // Chuyển sang cửa sổ thứ hai

            session.Close(); // Đóng cửa sổ hiện tại
            session.SwitchTo().Window(session.WindowHandles[0]); // Chuyển lại cửa sổ đầu tiên
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
- [Get Window Handles](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetWindowHandles) command
