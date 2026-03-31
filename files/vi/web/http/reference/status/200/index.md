---
title: 200 OK
slug: Web/HTTP/Reference/Status/200
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.200
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`200 OK`** cho biết rằng yêu cầu đã thành công.
Phản hồi `200 OK` có thể lưu đệm theo mặc định.

Phản hồi `200 OK` có ý nghĩa và định dạng khác nhau tùy thuộc vào phương thức yêu cầu HTTP.
Dưới đây là cách chúng thay đổi cho các phương thức khác nhau:

- {{HTTPMethod("GET")}}: Tài nguyên đã được máy chủ lấy và đưa vào thân phản hồi.
- {{HTTPMethod("POST")}}: Một hành động đã thành công; phản hồi có thân thông điệp mô tả kết quả.
- {{HTTPMethod("HEAD")}}: Giống với `GET`, ngoại trừ không có thân thông điệp.
- {{HTTPMethod("TRACE")}}: Phản hồi có thân thông điệp chứa yêu cầu như máy chủ đã nhận.

Mặc dù có thể xảy ra, các yêu cầu {{HTTPMethod("PUT")}} hoặc {{HTTPMethod("DELETE")}} thành công thường không dẫn đến phản hồi `200 OK`.
Thường thấy hơn là {{HTTPStatus("201", "201 Created")}} nếu tài nguyên được tải lên hoặc tạo lần đầu, hoặc {{HTTPStatus("204", "204 No Content")}} khi xóa tài nguyên thành công.

## Trạng thái

```http
200 OK
```

## Ví dụ

### Nhận phản hồi `200 OK` cho yêu cầu `GET`

Trong ví dụ này, một yêu cầu `GET` thành công đến `https://example.com` trả về phản hồi `200 OK`.
Phản hồi bao gồm các tiêu đề trình bày và thân thông điệp với nội dung HTML:

```http
HTTP/1.1 200 OK
Accept-Ranges: bytes
Age: 294510
Cache-Control: max-age=604800
Content-Type: text/html; charset=UTF-8
Date: Fri, 21 Jun 2024 14:18:33 GMT
Etag: "3147526947"
Expires: Fri, 28 Jun 2024 14:18:33 GMT
Last-Modified: Thu, 17 Oct 2019 07:18:26 GMT
Server: ECAcc (nyd/D10E)
X-Cache: HIT
Content-Length: 1256

<!doctype html>
<!-- Nội dung HTML theo sau đây -->
```

### Nhận phản hồi `200 OK` cho yêu cầu `POST` khi gửi biểu mẫu

Giả sử một biểu mẫu tồn tại để gửi dữ liệu đến endpoint quản lý đăng ký tại `http://example.com/subscribe`.
Yêu cầu `POST` để đăng ký người dùng có thể trông như sau:

```http
POST /subscribe HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 50

name=Brian%20Smith&email=brian.smith%40example.com
```

Trong ví dụ này, phản hồi với trạng thái `200 OK` có thể trông như thế này:

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "message": "User subscription pending. A confirmation email has been sent.",
  "subscription": {
    "name": "Brian Smith",
    "email": "brian.smith@example.com",
    "id": 123,
    "feed": "default"
  }
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- Bảng thuật ngữ: {{Glossary("Idempotent")}}
