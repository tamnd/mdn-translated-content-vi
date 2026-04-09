---
title: Back
short-title: Back
slug: Web/WebDriver/Reference/Classic/Commands/Back
page-type: webdriver-command
browser-compat: webdriver.classic.Back
sidebar: webdriver
---

Lệnh _Back_ của API [WebDriver](/en-US/docs/Web/WebDriver) điều hướng đến trang trước đó trong lịch sử duyệt web. Điều này tương đương với việc nhấn nút quay lại của trình duyệt hoặc gọi {{domxref("History.back()")}} trong JavaScript.

## Cú pháp

| Method                                                | URI template                 |
| ----------------------------------------------------- | ---------------------------- |
| [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) | `/session/{session id}/back` |

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

### Điều hướng lùi trong lịch sử duyệt web

Với một WebDriver server đang chạy trên `localhost:4444`, giả sử một phiên đang hoạt động đã điều hướng qua ít nhất hai trang. Để quay về trang trước đó, hãy dùng lệnh `back`, thay `ID` bằng `sessionId` từ phản hồi của [New Session](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/NewSession):

```bash
curl -i -H "Content-Type: application/json" -d '{}' http://localhost:4444/session/ID/back
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

- [Forward command](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/Forward)
- [Refresh command](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/Refresh)
