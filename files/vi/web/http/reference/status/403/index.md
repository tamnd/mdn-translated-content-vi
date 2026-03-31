---
title: 403 Forbidden
slug: Web/HTTP/Reference/Status/403
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.403
sidebar: http
---

Mã trạng thái HTTP **`403 Forbidden`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ đã hiểu yêu cầu nhưng từ chối xử lý.
Mã trạng thái này tương tự {{HTTPStatus("401")}}, ngoại trừ đối với phản hồi **`403 Forbidden`**, việc xác thực hoặc xác thực lại không tạo ra sự khác biệt nào.
Sự thất bại của yêu cầu gắn liền với logic ứng dụng, chẳng hạn như không đủ quyền truy cập vào tài nguyên hoặc hành động.

Client nhận được phản hồi `403` nên hiểu rằng việc lặp lại yêu cầu mà không sửa đổi sẽ thất bại với cùng lỗi đó.
Chủ sở hữu máy chủ có thể quyết định gửi phản hồi {{HTTPStatus("404")}} thay vì 403 nếu không muốn để lộ sự tồn tại của tài nguyên cho các client không có đủ quyền.

## Trạng thái

```http
403 Forbidden
```

## Ví dụ

### Yêu cầu thất bại do không đủ quyền

Yêu cầu ví dụ sau được gửi đến một API quản lý người dùng.
Yêu cầu chứa tiêu đề {{HTTPHeader("Authorization")}} sử dụng [sơ đồ xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) `Bearer` chứa access token:

```http
DELETE /users/123 HTTP/1.1
Host: example.com
Authorization: Bearer abcd123
```

Máy chủ đã xác thực yêu cầu, nhưng hành động thất bại do không đủ quyền và nội dung phản hồi chứa lý do thất bại:

```http
HTTP/1.1 403 Forbidden
Date: Tue, 02 Jul 2024 12:56:49 GMT
Content-Type: application/json
Content-Length: 88

{
  "error": "InsufficientPermissions",
  "message": "Deleting users requires the 'admin' role."
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("401")}}
- [HTTP Status Code Definitions](https://httpwg.org/specs/rfc9110.html#status.403)
