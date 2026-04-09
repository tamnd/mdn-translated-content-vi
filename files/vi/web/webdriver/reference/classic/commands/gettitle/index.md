---
title: Get Title
short-title: Get Title
slug: Web/WebDriver/Reference/Classic/Commands/GetTitle
page-type: webdriver-command
browser-compat: webdriver.classic.GetTitle
sidebar: webdriver
---

Lệnh _Get Title_ của API [WebDriver](/en-US/docs/Web/WebDriver) trả về tiêu đề tài liệu của ngữ cảnh duyệt cấp cao hiện tại. Điều này tương đương với việc đọc thuộc tính {{domxref("Document.title")}} trong JavaScript.

## Cú pháp

| Method                                              | URI template                  |
| --------------------------------------------------- | ----------------------------- |
| [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) | `/session/{session id}/title` |

### Tham số URL

- `session id`
  - : Định danh của phiên.

### Giá trị trả về

Một chuỗi chứa tiêu đề của tài liệu hiện tại, tương đương với giá trị của {{domxref("Document.title")}}.

### Lỗi

- [Invalid session id](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)
  - : Phiên không tồn tại.
- No such window
  - : Đối tượng [`window`](/en-US/docs/Web/API/Window) đã bị loại bỏ, cho biết tab hoặc cửa sổ đã bị đóng.

## Ví dụ

### Lấy tiêu đề trang

Với một WebDriver server đang chạy trên `localhost:4444`, giả sử một phiên đang hoạt động đã điều hướng đến `https://example.org`. Bạn có thể lấy tiêu đề tài liệu bằng lệnh sau, thay `ID` bằng `sessionId` từ phản hồi của [New Session](/en-US/docs/Web/WebDriver/Reference/Classic/Commands/NewSession):

```bash
curl -i http://localhost:4444/session/ID/title
```

Máy chủ trả về tiêu đề tài liệu như sau:

```http
HTTP/1.1 200 OK
content-type: application/json; charset=utf-8

{"value":"Example Domain"}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
