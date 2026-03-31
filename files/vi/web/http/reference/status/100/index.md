---
title: 100 Continue
slug: Web/HTTP/Reference/Status/100
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.100
sidebar: http
---

Mã trạng thái [phản hồi thông tin](/en-US/docs/Web/HTTP/Reference/Status#informational_responses) HTTP **`100 Continue`** cho biết phần đầu tiên của yêu cầu đã được nhận và chưa bị máy chủ từ chối.
Client nên tiếp tục yêu cầu hoặc bỏ qua phản hồi 100 nếu yêu cầu đã hoàn tất.

Khi một yêu cầu có tiêu đề {{HTTPHeader("Expect", "Expect: 100-continue")}}, phản hồi 100 Continue cho biết rằng máy chủ đã sẵn sàng hoặc có khả năng nhận nội dung yêu cầu.
Việc chờ phản hồi 100 Continue có thể hữu ích nếu client dự đoán rằng có thể xảy ra lỗi, ví dụ khi gửi các thao tác thay đổi trạng thái mà không có thông tin xác thực đã được xác minh trước.

## Trạng thái

```http
100 Continue
```

## Ví dụ

### Yêu cầu PUT với 100 Continue

Yêu cầu {{HTTPMethod("PUT")}} sau đây gửi thông tin đến máy chủ về việc tải lên một tệp.
Client cho biết sẽ tiến hành với nội dung nếu nhận được phản hồi 100 để tránh gửi dữ liệu qua mạng có thể dẫn đến lỗi như {{HTTPStatus("405")}}, {{HTTPStatus("401")}}, hoặc {{HTTPStatus("403")}}.
Ban đầu, client chỉ gửi các tiêu đề, bao gồm tiêu đề {{HTTPHeader("Expect", "Expect: 100-continue")}}:

```http
PUT /videos HTTP/1.1
Host: uploads.example.com
Content-Type: video/h264
Content-Length: 123456789
Expect: 100-continue
```

Máy chủ cho biết yêu cầu có thể tiếp tục:

```http
HTTP/1.1 100 Continue
```

Client hoàn tất yêu cầu bằng cách gửi dữ liệu thực tế:

```http
[Dữ liệu video là nội dung cho yêu cầu PUT]
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPHeader("Expect")}}
- {{HTTPStatus(417)}}
