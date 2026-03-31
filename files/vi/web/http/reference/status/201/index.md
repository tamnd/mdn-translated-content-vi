---
title: 201 Created
slug: Web/HTTP/Reference/Status/201
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.201
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`201 Created`** cho biết rằng yêu cầu HTTP đã dẫn đến việc tạo ra một tài nguyên.
Mã trạng thái này thường được gửi là kết quả của yêu cầu {{HTTPMethod("POST")}}.

Tài nguyên mới, hoặc mô tả và liên kết đến tài nguyên mới, được tạo trước khi phản hồi được trả về.
Các mục mới được tạo có thể được trả về trong thân thông điệp phản hồi, nhưng phải có thể định vị được bằng **URL của yêu cầu khởi tạo** hoặc URL trong giá trị của tiêu đề {{HTTPHeader("Location")}} được cung cấp cùng phản hồi.

## Trạng thái

```http
201 Created
```

## Ví dụ

### Nhận phản hồi chỉ ra việc tạo người dùng

Giả sử có một REST API để quản lý người dùng với endpoint tại `http://example.com/users`. Trong ví dụ này, chúng ta gửi yêu cầu `POST` với thân sau để tạo người dùng:

```http
POST /users HTTP/1.1
Host: example.com
Content-Type: application/json

{
  "firstName": "Brian",
  "lastName": "Smith",
  "email": "brian.smith@example.com"
}
```

Sau khi tạo người dùng thành công, phản hồi `201 Created` sẽ trông như thế này:

```http
HTTP/1.1 201 Created
Content-Type: application/json
Location: http://example.com/users/123

{
  "message": "New user created",
  "user": {
    "id": 123,
    "firstName": "Brian",
    "lastName": "Smith",
    "email": "brian.smith@example.com"
  }
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
