---
title: 205 Reset Content
slug: Web/HTTP/Reference/Status/205
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.205
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`205 Reset Content`** cho biết rằng yêu cầu đã được xử lý thành công và client nên đặt lại chế độ xem tài liệu.

Phản hồi này nhằm hỗ trợ các trường hợp sử dụng trong đó người dùng nhận nội dung hỗ trợ nhập dữ liệu, gửi dữ liệu do người dùng chỉnh sửa trong một yêu cầu và nội dung cần được đặt lại cho lần nhập tiếp theo.
Hướng dẫn "đặt lại nội dung" có thể có nghĩa là xóa nội dung biểu mẫu, đặt lại trạng thái canvas, hoặc làm mới giao diện người dùng; việc triển khai phụ thuộc vào client.

> [!NOTE]
> Trong các ứng dụng web sử dụng trạng thái `205`, người ta giả định rằng client xử lý việc đặt lại nội dung sau phản hồi `205`.
> Điều này thường được thực hiện thông qua JavaScript, vì việc đặt lại nội dung như biểu mẫu sau phản hồi `205` không được các trình duyệt xử lý một cách tự nhiên.

Lưu ý rằng phản hồi không được bao gồm bất kỳ nội dung nào, và các trình duyệt có thể từ chối các phản hồi có nội dung.
Phản hồi cũng không nên bao gồm tiêu đề {{HTTPHeader("Content-Length")}}, nhưng nếu có thì giá trị phải là `0`.
Phản hồi trống cũng có thể được chỉ ra bằng tiêu đề {{HTTPHeader("Transfer-Encoding", "Transfer-Encoding: chunked")}} với một chunk trống.

## Trạng thái

```http
205 Reset Content
```

## Ví dụ

### Đặt lại biểu mẫu sau khi nhận `205 Reset Content`

Client trong ví dụ này gửi yêu cầu `POST` để gửi biểu mẫu với bình luận `Hello!`:

```http
POST /submit HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 16

comment=Hello%21
```

Sau khi xử lý thành công việc gửi biểu mẫu, máy chủ phản hồi với phản hồi `205` sau đây, chỉ ra rằng client nên đặt lại biểu mẫu.

```http
HTTP/1.1 205 Reset Content
Content-Type: text/html; charset=utf-8
Date: Wed, 26 Jun 2024 12:00:00 GMT
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPStatus(204)}} No Content
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
