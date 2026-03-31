---
title: 202 Accepted
slug: Web/HTTP/Reference/Status/202
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.202
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`202 Accepted`** cho biết rằng yêu cầu đã được chấp nhận để xử lý, nhưng quá trình xử lý chưa hoàn thành hoặc có thể chưa bắt đầu.
Việc xử lý thực tế của yêu cầu không được đảm bảo; một tác vụ hoặc hành động có thể thất bại hoặc bị từ chối khi máy chủ cố gắng xử lý.

Phản hồi `202` không cam kết, có nghĩa là không có cách nào để sau đó gửi phản hồi HTTP bất đồng bộ để cho biết kết quả của quá trình xử lý.
Mã phản hồi này thường được dùng khi yêu cầu được xử lý bởi tiến trình hoặc máy chủ khác, hoặc khi các yêu cầu được xử lý theo lô.

## Trạng thái

```http
202 Accepted
```

## Ví dụ

### Bắt đầu tác vụ tự động

Trong ví dụ sau đây, chúng ta muốn khởi động một tiến trình tự động hóa để gửi email cho chủ sở hữu chó về tác vụ đón chó:

```http
POST /tasks HTTP/1.1
Host: example.com
Content-Type: application/json

{
  "task": "emailDogOwners",
  "template": "pickup"
}
```

Phản hồi cho biết yêu cầu bắt đầu tác vụ đã được chấp nhận để xử lý.
Một URL được gửi trong thân phản hồi để client có thể theo dõi các thay đổi về trạng thái của tác vụ:

```http
HTTP/1.1 202 Accepted
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
Content-Type: application/json

{
  "message": "Request accepted. Starting to process task.",
  "taskId": "123",
  "monitorUrl": "http://example.com/tasks/123/status"
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPHeader("Accept")}}
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
