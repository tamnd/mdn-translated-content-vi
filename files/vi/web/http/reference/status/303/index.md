---
title: 303 See Other
slug: Web/HTTP/Reference/Status/303
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.303
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`303 See Other`** cho biết rằng trình duyệt nên chuyển hướng đến URL trong tiêu đề {{HTTPHeader("Location")}} thay vì hiển thị tài nguyên được yêu cầu.

Mã phản hồi này thường được gửi lại là kết quả của các phương thức {{HTTPMethod("PUT")}} hoặc {{HTTPMethod("POST")}} để client có thể lấy xác nhận, hoặc xem biểu diễn của đối tượng trong thế giới thực (xem [HTTP range-14](https://en.wikipedia.org/wiki/HTTPRange-14)).
Phương thức để lấy tài nguyên được chuyển hướng luôn là {{HTTPMethod("GET")}}.

## Trạng thái

```http
303 See Other
```

## Ví dụ

### Phản hồi 303 khi gửi biểu mẫu

Client trong ví dụ này gửi yêu cầu {{HTTPMethod("POST")}} để gửi biểu mẫu đến đăng ký chung.

```http
POST /subscribe HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 50

name=Brian%20Smith&email=brian.smith%40example.com
```

Máy chủ có thể gửi phản hồi với trạng thái `303` và trang xác nhận trong tiêu đề {{HTTPHeader("Location")}}, để người dùng được chuyển hướng đến đó sau khi nhận phản hồi.

```http
HTTP/1.1 303 See Other
Location: https://www.example.com/confirmation/event/123
Content-Type: text/html; charset=UTF-8
Content-Length: 0
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("302", "302 Found")}}, chuyển hướng tạm thời
- {{HTTPStatus("307", "307 Temporary Redirect")}}, chuyển hướng tạm thời trong đó phương thức yêu cầu không bị sửa đổi
