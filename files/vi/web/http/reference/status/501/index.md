---
title: 501 Not Implemented
slug: Web/HTTP/Reference/Status/501
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.501
sidebar: http
---

Mã trạng thái HTTP **`501 Not Implemented`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) có nghĩa là máy chủ không hỗ trợ chức năng cần thiết để hoàn thành yêu cầu.

Phản hồi với mã trạng thái này cũng có thể bao gồm tiêu đề {{HTTPHeader("Retry-After")}}, thông báo cho client rằng họ có thể thử lại yêu cầu sau khi thời gian chỉ định đã trôi qua.
Phản hồi `501` được lưu vào bộ nhớ đệm theo mặc định trừ khi tiêu đề bộ nhớ đệm hướng dẫn khác.

`501` là phản hồi phù hợp khi máy chủ không nhận ra phương thức yêu cầu và không có khả năng hỗ trợ nó cho bất kỳ tài nguyên nào.
Máy chủ được yêu cầu hỗ trợ {{HTTPMethod("GET")}} và {{HTTPMethod("HEAD")}}, và do đó không được trả về `501` cho các yêu cầu với các phương thức này.
Nếu máy chủ nhận ra phương thức nhưng cố tình không cho phép nó, phản hồi phù hợp là {{HTTPStatus("405", "405 Method Not Allowed")}}.

Nếu bạn đã truy cập một trang web và đang thấy lỗi `501`, các vấn đề này cần được điều tra và sửa chữa bởi chủ sở hữu hoặc quản trị viên máy chủ.
Bạn có thể xóa bộ nhớ đệm trình duyệt cho tên miền, tắt proxy nếu đang dùng, hoặc thử lại sau để xem có hoạt động như mong đợi không.

Phản hồi `501` có thể xảy ra nếu proxy không xử lý được các phương thức yêu cầu được sử dụng trong ngữ cảnh ứng dụng HTTP Extension Framework ({{RFC("2774")}}).
Mã trạng thái này cũng có thể xảy ra trong Web Distributed Authoring and Versioning ({{Glossary("WebDAV")}}) khi phương thức yêu cầu (`SEARCH`, `PROPFIND`) không có trình xử lý URL được cấu hình để xử lý nó.

## Trạng thái

```http
501 Not Implemented
```

## Ví dụ

### Phương thức mở rộng không được hỗ trợ

Trong ví dụ HTTP Extension Framework sau, client gửi yêu cầu với một phần mở rộng bắt buộc được chỉ định trong tiêu đề `C-MAN`.
Tiêu đề {{HTTPHeader("Connection")}} chỉ định rằng các phần mở rộng này phải được xử lý trên cơ sở [hop-by-hop](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers).
Proxy từ chối chuyển tiếp phương thức `M-GET` và gửi lỗi `501` trong phản hồi:

```http
M-GET /document HTTP/1.1
Host: example.com
C-Man: "http://www.example.org/"
Connection: C-Man
```

```http
HTTP/1.1 501 Not Implemented
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("510", "510 Not Extended")}}
- [HTTP 501 errors](https://learn.microsoft.com/en-us/aspnet/web-api/overview/testing-and-debugging/troubleshooting-http-405-errors-after-publishing-web-api-applications) trong tài liệu Microsoft ASP.NET
