---
title: 409 Conflict
slug: Web/HTTP/Reference/Status/409
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.409
sidebar: http
---

Mã trạng thái HTTP **`409 Conflict`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết yêu cầu xung đột với trạng thái hiện tại của tài nguyên đích.

Trong {{glossary("WebDAV")}} remote web authoring, phản hồi lỗi 409 là lỗi gửi đến client để người dùng có thể giải quyết xung đột và gửi lại yêu cầu.
Ví dụ, xung đột xảy ra nếu yêu cầu tạo collection `/a/b/c/d/` được thực hiện mà `/a/b/c/` không tồn tại, yêu cầu phải thất bại với mã 409.
Ngoài ra, bạn có thể nhận phản hồi 409 khi tải lên tệp cũ hơn tệp hiện có trên máy chủ, dẫn đến xung đột kiểm soát phiên bản.

Trong các hệ thống khác, phản hồi 409 có thể được sử dụng cho các mục đích triển khai cụ thể, chẳng hạn để cho biết máy chủ nhận được nhiều yêu cầu cập nhật cùng một tài nguyên.

## Trạng thái

```http
409 Conflict
```

## Ví dụ

### Không cho phép các tác vụ đồng thời

Trong ví dụ sau, chúng ta muốn khởi động một quy trình tự động thực hiện một tác vụ phổ biến trong hệ thống:

```http
POST /tasks HTTP/1.1
Host: example.com
Content-Type: application/json

{
  "task": "emailDogOwners",
  "template": "pickup"
}
```

Trong triển khai này, máy chủ không cho phép hai công việc đồng thời chạy và trả về 409, cung cấp cho client cơ hội kiểm tra xem họ có muốn thực hiện hành động hay chạy một tác vụ khác không:

```http
HTTP/1.1 409 Conflict
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
Content-Type: application/json

{
  "code": "AutomationConflict",
  "task": "emailDogOwners",
  "message": "Task locked. Cannot start a new automation since job is already running.",
  "runningTaskId": "123"
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPMethod("PUT")}}
