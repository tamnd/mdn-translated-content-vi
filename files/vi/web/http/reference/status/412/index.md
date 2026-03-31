---
title: 412 Precondition Failed
slug: Web/HTTP/Reference/Status/412
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.412
sidebar: http
---

Mã trạng thái HTTP **`412 Precondition Failed`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết quyền truy cập tài nguyên đích bị từ chối.
Điều này xảy ra với [yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests) trên các phương thức khác ngoài {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}} khi điều kiện được xác định bởi tiêu đề {{HTTPHeader("If-Unmodified-Since")}} hoặc {{HTTPHeader("If-Match")}} không được thỏa mãn.
Trong trường hợp đó, yêu cầu (thường là tải lên hoặc sửa đổi tài nguyên) không thể được thực hiện và phản hồi lỗi này được gửi trả lại.

## Trạng thái

```http
412 Precondition Failed
```

## Ví dụ

### Điều kiện tiên quyết không thỏa mãn

```http
ETag: "33a64df551425fcc55e4d42a148795d9f25f89d4"
ETag: W/"0815"
```

### Tránh xung đột đồng thời

Với sự trợ giúp của `ETag` và tiêu đề {{HTTPHeader("If-Match")}}, bạn có thể ngăn chặn xung đột hoặc va chạm đồng thời.
Ví dụ, khi chỉnh sửa một số trang wiki, nội dung được băm và đặt vào `ETag` trong các phản hồi thành công:

```http
ETag: "33a64df551425fcc55e4d42a148795d9f25f89d4"
```

Khi lưu các thay đổi vào trang wiki (đăng dữ liệu), yêu cầu {{HTTPMethod("POST")}} sẽ chứa tiêu đề {{HTTPHeader("If-Match")}} chứa các giá trị `ETag` mà client đã lưu từ lần chỉnh sửa cuối để kiểm tra độ mới của tài nguyên trên máy chủ:

```http
If-Match: "33a64df551425fcc55e4d42a148795d9f25f89d4"
```

Nếu các băm không khớp, tài liệu đã được chỉnh sửa ở giữa và lỗi `412 Precondition Failed` được ném ra.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- {{HTTPStatus("304")}}
- {{HTTPHeader("If-Unmodified-Since")}}, {{HTTPHeader("If-Match")}}
- {{HTTPStatus("428")}}
