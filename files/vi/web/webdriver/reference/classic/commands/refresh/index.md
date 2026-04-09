---
title: Refresh
short-title: Refresh
slug: Web/WebDriver/Reference/Classic/Commands/Refresh
page-type: webdriver-command
browser-compat: webdriver.classic.Refresh
sidebar: webdriver
---

Lệnh _Refresh_ của API [WebDriver](/en-US/docs/Web/WebDriver) tải lại trang hiện tại trong ngữ cảnh duyệt đang hoạt động. Điều này tương đương với việc nhấn nút tải lại của trình duyệt hoặc gọi {{domxref("Location.reload()")}} trong JavaScript.

## Cú pháp

| Method                                                | URI template                    |
| ----------------------------------------------------- | ------------------------------- |
| [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) | `/session/{session id}/refresh` |

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
- Unexpected alert open
  - : Một hộp thoại mô hình đang mở, chặn thao tác này.

## Ví dụ

### Tải lại trang hiện tại

Với một WebDriver server đang chạy trên `localhost:4444`, giả sử một phiên đang hoạt động đã điều hướng đến một trang. Để tải lại trang hiện tại, hãy dùng lệnh `refresh`, thay `ID` bằng `sessionId` từ phản hồi của [New Session](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/NewSession):

```bash
curl -i -H "Content-Type: application/json" -d '{}' http://localhost:4444/session/ID/refresh
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
- [Forward command](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/Forward)
