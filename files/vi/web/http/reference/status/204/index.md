---
title: 204 No Content
slug: Web/HTTP/Reference/Status/204
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.204
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`204 No Content`** cho biết rằng yêu cầu đã thành công, nhưng client không cần điều hướng khỏi trang hiện tại.
Phản hồi `204` có thể lưu đệm theo mặc định, và tiêu đề {{HTTPHeader("ETag")}} được đưa vào trong các trường hợp như vậy.

Phản hồi `204 No Content` với các phương thức yêu cầu này có ý nghĩa và kết quả như sau:

- {{HTTPMethod("DELETE")}}: Hành động đã thành công và không cần cung cấp thêm thông tin.
- {{HTTPMethod("PUT")}}: Hành động đã thành công và giá trị {{HTTPHeader("ETag")}} chứa entity tag cho biểu diễn mới của tài nguyên mục tiêu đó.

Phản hồi `204` có thể được dùng khi triển khai chức năng "lưu và tiếp tục chỉnh sửa" cho các ứng dụng như trang wiki.
Trong trường hợp này, yêu cầu {{HTTPMethod("PUT")}} có thể được dùng để lưu nội dung trang, và phản hồi `204 No Content` cho trình duyệt biết rằng trình soạn thảo không nên bị thay thế bởi nội dung khác.

Lưu ý rằng phản hồi không được bao gồm bất kỳ nội dung nào hoặc tiêu đề {{HTTPHeader("Content-Length")}} (các trình duyệt có thể từ chối các phản hồi có nội dung).

## Trạng thái

```http
204 No Content
```

## Ví dụ

### Nhận phản hồi sau khi xóa hình ảnh

Trong ví dụ này, client gửi yêu cầu để xóa hình ảnh bằng phương thức `DELETE`.
Yêu cầu bao gồm tiêu đề {{HTTPHeader("Authorization")}} với token để xác thực yêu cầu:

```http
DELETE /image/123 HTTP/1.1
Host: example.com
Authorization: Bearer 1234abcd
```

Sau khi xóa hình ảnh thành công, máy chủ phản hồi với phản hồi `204` không có thân, cho biết không cần gửi thêm thông tin cho client.

```http
HTTP/1.1 204 No Content
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
```

### Nhận phản hồi sau khi cập nhật bằng PUT

Trong ví dụ này, client gửi yêu cầu `PUT` để cập nhật thông tin hồ sơ người dùng.
Yêu cầu bao gồm tiêu đề {{HTTPHeader("Authorization")}} với token để xác thực yêu cầu:

```http
PUT /users/123 HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer 1234abcd

{
  "name": "Jane Doe",
  "email": "jane@example.com"
}
```

Sau khi cập nhật hồ sơ người dùng thành công, máy chủ phản hồi với phản hồi `204`.
Tiêu đề {{HTTPHeader("ETag")}} chứa entity tag cho tài nguyên đã được cập nhật:

```http
HTTP/1.1 204 No Content
Date: Wed, 26 Jun 2024 12:00:00 GMT
ETag: "33a64df551425fcc55e4d42a148795d9f25f89d4"
Server: Apache/2.4.1 (Unix)
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
