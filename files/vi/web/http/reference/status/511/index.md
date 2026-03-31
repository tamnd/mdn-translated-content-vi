---
title: 511 Network Authentication Required
slug: Web/HTTP/Reference/Status/511
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc6585#section-6
sidebar: http
---

Mã trạng thái HTTP **`511 Network Authentication Required`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết client cần xác thực để được truy cập mạng.
Trạng thái này không được tạo bởi máy chủ gốc mà bởi các {{Glossary("Proxy_server", "proxy")}} chặn kiểm soát quyền truy cập vào mạng.

Các nhà khai thác mạng đôi khi yêu cầu một số xác thực, chấp nhận các điều khoản, hoặc tương tác người dùng khác trước khi cấp quyền truy cập (ví dụ tại quán cà phê internet hoặc sân bay).
Họ thường xác định các client chưa thực hiện việc này bằng địa chỉ Media Access Control (MAC) của họ.

## Trạng thái

```http
511 Network Authentication Required
```

## Ví dụ

### Phản hồi 511 cho yêu cầu GET

Trong ví dụ sau, client cố gắng truy cập tài nguyên trên mạng.
Yêu cầu chưa được xác thực và proxy gửi mã trạng thái `511` để nhắc khách truy cập đăng nhập.
Mã `511` đảm bảo rằng các client không phải trình duyệt sẽ không diễn giải phản hồi như từ máy chủ gốc.
Các trình duyệt được tự động chuyển hướng qua thẻ {{HTMLelement("meta")}} sau 10 giây, hoặc bằng cách nhấp vào liên kết trong phần thân phản hồi:

```http
GET /document HTTP/1.1
Host: example.com
```

```http
HTTP/1.1 511 Network Authentication Required
Content-Type: text/html

<html lang="en-US">
  <head>
    <title>Network Authentication Required</title>
    <meta http-equiv="refresh" content="10; url=https://login.example.net/">
  </head>
  <body>
      <p>You need to <a href="https://login.example.net/">authenticate with the local network</a> in order to gain access.</p>
  </body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{Glossary("Proxy server")}}
