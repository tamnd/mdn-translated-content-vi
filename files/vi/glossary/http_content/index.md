---
title: HTTP content
slug: Glossary/HTTP_Content
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong các thông điệp HTTP, **nội dung** mô tả 'thông tin' được truyền đạt trong phần thân thông điệp (theo sau phần header), sau khi bất kỳ việc đóng khung thông điệp nào từ mã hóa truyền tải theo khối HTTP/1.1 đã được loại bỏ. Điều này được gọi là "payload" trong HTTP/1.1, nhưng "nội dung" thông điệp phân biệt với payload của khung trong HTTP/2 và HTTP/3 nơi dữ liệu trong một khung duy nhất có thể là dữ liệu header, dữ liệu thân, hoặc thông tin điều khiển khác.

Mục đích của nội dung thông điệp trong các yêu cầu và phản hồi HTTP phụ thuộc vào phương thức yêu cầu và mã trạng thái phản hồi. Ví dụ, trong yêu cầu {{HTTPMethod("PUT")}}, nội dung đại diện cho trạng thái mong muốn của tài nguyên, nhưng trong yêu cầu {{HTTPMethod("POST")}}, đó là thông tin cần được xử lý. Phản hồi {{HTTPStatus("200", "200 OK")}} đối với yêu cầu {{HTTPMethod("GET")}} hiển thị trạng thái hiện tại của tài nguyên, trong khi phản hồi lỗi mô tả lỗi.

Một số phản hồi, như những phản hồi đối với yêu cầu {{HTTPMethod("HEAD")}} hoặc mã trạng thái {{HTTPStatus("204", "204 No Content")}} và {{HTTPStatus("204", "304 Not Modified")}}, không bao gồm nội dung nào cả.

Trong phản hồi HTTP/1.1 sau, phần thân thông điệp chứa nội dung `Mozilla Developer Network`:

```http
HTTP/1.1 200 OK
Content-Type: text/plain

Mozilla Developer Network
```

Trong phản hồi HTTP/1.1 tiếp theo, mã hóa truyền tải mã hóa dữ liệu thành các khối. Nội dung vẫn là `Mozilla Developer Network` ở cuối, nhưng phần thân thông điệp bao gồm dữ liệu thông điệp khác nhau để phân tách các khối:

```http
HTTP/1.1 200 OK
Content-Type: text/plain
Transfer-Encoding: chunked

7\r\n
Mozilla\r\n
9\r\n
Developer\r\n
7\r\n
Network\r\n
0\r\n
\r\n
```

## Xem thêm

- {{HTTPHeader("Content-Location")}}
- {{HTTPStatus("413", "413 Content Too Large")}}
- {{Glossary("Content header")}}
- [RFC 9110, phần 6.4: Content](https://httpwg.org/specs/rfc9110.html#rfc.section.6.4) (thay thế [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-3.3) Payload Semantics)
  - [Các thay đổi từ RFC 7231](https://httpwg.org/specs/rfc9110.html#changes.from.rfc.7231)
