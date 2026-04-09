---
title: Get Window Rect
slug: Web/WebDriver/Reference/Classic/Commands/GetWindowRect
page-type: webdriver-command
browser-compat: webdriver.classic.GetWindowRect
sidebar: webdriver
---

Lệnh _Get Window Rect_ của API [WebDriver](/en-US/docs/Web/WebDriver) trả về kích thước và vị trí của [WebElement](/en-US/docs/Web/WebDriver/Reference/WebElement) được cung cấp. Nhiều [WebDriver clients](/en-US/docs/Web/WebDriver/Reference/Clients) cung cấp các phương thức API riêng cho vị trí và kích thước của phần tử, nhưng để tối ưu hóa, cả hai đều dùng primitive này.

Lệnh này hoạt động trên cửa sổ hiện đang được chọn và trả về kích thước cùng vị trí của cửa sổ hệ điều hành. Giá trị [`WindowRect`](/en-US/docs/Web/WebDriver/Reference/WindowRect) trả về có thể được dùng làm đầu vào cho lệnh [Set Window Rect](/en-US/docs/Web/WebDriver/Reference/SetWindowRect), lệnh này dùng để thao tác vị trí và kích thước của cửa sổ.

## Cú pháp

| Method                                              | URI template                        |
| --------------------------------------------------- | ----------------------------------- |
| [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) | `/session/{session id}/window/rect` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Phản hồi

Phần dữ liệu phản hồi là một [`WindowRect`](/en-US/docs/Web/WebDriver/Reference/WebWindow):

- `x`
  - : Vị trí ngang của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.screenX`](/en-US/docs/Web/API/Window/screenX).
- `y`
  - : Vị trí dọc của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.screenY`](/en-US/docs/Web/API/Window/screenY).
- `width`
  - : Chiều rộng của ranh giới ngoài của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.outerWidth`](/en-US/docs/Web/API/Window/outerWidth).
- `height`
  - : Chiều cao của ranh giới ngoài của cửa sổ hệ điều hành được liên kết với [`window`](/en-US/docs/Web/API/Window), tương đương với [`Window.outerHeight`](/en-US/docs/Web/API/Window/outerHeight).

### Lỗi

- [Invalid session ID](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.
- [Unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen)
  - : Một lời nhắc của người dùng, chẳng hạn như [`window.alert`](/en-US/docs/Web/API/Window/alert), chặn việc thực thi lệnh cho đến khi nó được xử lý.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- WebWindow
- Các lệnh liên quan:
  - [Set Window Rect](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/SetWindowRect)
  - [Get Window Handle](/en-US/docs/Web/WebDriver/Reference/Commands/GetWindowHandle)
  - [Get Window Handles](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/GetWindowHandles)
  - [Close Window](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/CloseWindow)
