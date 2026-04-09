---
title: New Session
short-title: New Session
slug: Web/WebDriver/Reference/Classic/Commands/NewSession
page-type: webdriver-command
browser-compat: webdriver.classic.NewSession
sidebar: webdriver
---

Lệnh _New Session_ của API [WebDriver](/en-US/docs/Web/WebDriver) tạo một phiên WebDriver mới với trình duyệt.
Định danh phiên được trả về trong phản hồi là bắt buộc cho mọi lệnh tiếp theo.

## Cú pháp

| Method                                                | URI template |
| ----------------------------------------------------- | ------------ |
| [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) | `/session`   |

### Dữ liệu gửi lên

- `capabilities`
  - : Dùng để xác định các tính năng mà driver phải đáp ứng khi tạo phiên mới.
    Xem [Capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities#list_of_capabilities) để biết các tùy chọn có sẵn.

### Phản hồi

Phần dữ liệu phản hồi là một đối tượng JSON với:

- `sessionId`
  - : Định danh duy nhất của phiên.
- `capabilities`
  - : Các capability đã được thương lượng của phiên.

### Lỗi

- Session not created
  - : Không thể tạo phiên mới.

## Ví dụ

### Khởi tạo một phiên mới

Với một WebDriver server đang chạy trên `localhost:4444`, lệnh sau sẽ khởi động một phiên WebDriver mới yêu cầu Firefox làm trình duyệt:

```bash
curl -i -H "Content-Type: application/json" -d '{"capabilities": {"alwaysMatch": {"browserName": "firefox"}}}' http://localhost:4444/session
```

Kết quả sẽ trông tương tự như sau, trong đó `27c8437e-5e42-43f9-a26f-2db0fd509ec1` là định danh duy nhất của phiên này:

```http
HTTP/1.1 200 OK
content-type: application/json; charset=utf-8

{"value":{"sessionId":"27c8437e-5e42-43f9-a26f-2db0fd509ec1","capabilities":{"acceptInsecureCerts":false,"browserName":"firefox","browserVersion":"147.0.4","pageLoadStrategy":"normal","platformName":"mac","proxy":{},"setWindowRect":true,"strictFileInteractability":false,"timeouts":{"implicit":0,"pageLoad":300000,"script":30000}}}}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities)
