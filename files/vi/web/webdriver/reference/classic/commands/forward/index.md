---
title: Forward
short-title: Forward
slug: Web/WebDriver/Reference/Classic/Commands/Forward
page-type: webdriver-command
browser-compat: webdriver.classic.Forward
sidebar: webdriver
---

Lệnh _Forward_ của API [WebDriver](/en-US/docs/Web/WebDriver) điều hướng đến trang tiếp theo trong lịch sử duyệt web. Điều này tương đương với việc nhấn nút chuyển tiếp của trình duyệt hoặc gọi {{domxref("History.forward()")}} trong JavaScript.

## Cú pháp

| Method                                                | URI template                    |
| ----------------------------------------------------- | ------------------------------- |
| [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) | `/session/{session id}/forward` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Giá trị trả về

`null` nếu thành công.

### Lỗi

- [Invalid session id](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.
- No such window
  - : Đối tượng [`window`](/en-US/docs/Web/API/Window) đã bị loại bỏ, cho biết tab hoặc cửa sổ đã bị đóng.
- Timeout
  - : Việc điều hướng không hoàn tất trước khi thời gian chờ hết hạn.

## Ví dụ

### Điều hướng tiến trong lịch sử duyệt web

Với một WebDriver server đang chạy trên `localhost:4444`, giả sử một phiên đang hoạt động đã điều hướng qua ít nhất hai trang và đã quay lại. Để chuyển tiếp đến trang tiếp theo, hãy dùng lệnh `forward`, thay `ID` bằng `sessionId` từ phản hồi của [New Session](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/NewSession):

```bash
curl -i -H "Content-Type: application/json" -d '{}' http://localhost:4444/session/ID/forward
```

Máy chủ trả về một giá trị null để báo hiệu thành công:

```http
HTTP/1.1 200 OK
content-type: application/json; charset=utf-8

{"value":null}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Back command](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/Back)
- [Refresh command](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/Refresh)
