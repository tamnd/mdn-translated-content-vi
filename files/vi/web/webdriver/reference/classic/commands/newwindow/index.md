---
title: New Window
slug: Web/WebDriver/Reference/Classic/Commands/NewWindow
page-type: webdriver-command
browser-compat: webdriver.classic.NewWindow
sidebar: webdriver
---

Lệnh _New Window_ của API [WebDriver](/en-US/docs/Web/WebDriver) mở một ngữ cảnh duyệt cấp cao mới kiểu _window_ hoặc _tab_, và trả về một từ điển chứa _handle_ của [`WebWindow`](/en-US/docs/Web/WebDriver/Reference/WebWindow) mới cùng _type_ đã được tạo. Nếu kiểu _type_ được yêu cầu không thể được trình duyệt tạo, kiểu thay thế sẽ được thử tạo.

## Cú pháp

| Method                                                  | URI template                       |
| ------------------------------------------------------- | ---------------------------------- |
| [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/DELETE) | `/session/{session id}/window/new` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Dữ liệu gửi lên

Dữ liệu đầu vào là một đối tượng:

- `type`
  - : Loại ngữ cảnh duyệt cấp cao được yêu cầu.

### Phản hồi

Phần dữ liệu phản hồi là một đối tượng:

- handle
  - : Handle của [WebWindow](/en-US/docs/Web/WebDriver/Reference/WebWindow) mới.
- type
  - : Loại ngữ cảnh duyệt cấp cao đã được tạo.

### Lỗi

- [Invalid session ID](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.
- [No such window](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchWindow)
  - : Nếu [`window`](/en-US/docs/Web/API/Window) đã bị đóng.
- [Unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen)
  - : Một lời nhắc của người dùng, chẳng hạn như [`window.alert`](/en-US/docs/Web/API/Window/alert), chặn việc thực thi lệnh cho đến khi nó được xử lý.
- [Unsupported Operation](/en-US/docs/Web/WebDriver/Reference/Errors/UnsupportedOperation)
  - : Driver hoặc trình duyệt không hỗ trợ lệnh này vì một lý do nào đó, ví dụ khi không thể tạo tab hoặc cửa sổ mới.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Close Window](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/CloseWindow) command
