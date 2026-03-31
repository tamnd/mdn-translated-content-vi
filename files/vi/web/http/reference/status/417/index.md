---
title: 417 Expectation Failed
slug: Web/HTTP/Reference/Status/417
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.417
sidebar: http
---

Mã trạng thái HTTP **`417 Expectation Failed`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết kỳ vọng được đưa ra trong tiêu đề {{HTTPHeader("Expect")}} của yêu cầu không thể được đáp ứng.
Sau khi nhận được phản hồi 417, client nên lặp lại yêu cầu mà không có tiêu đề yêu cầu `Expect`, bao gồm tệp trong phần thân yêu cầu mà không chờ phản hồi {{HTTPStatus("100")}}.
Xem tài liệu tiêu đề {{HTTPHeader("Expect")}} để biết thêm chi tiết.

## Trạng thái

```http
417 Expectation Failed
```

## Ví dụ

### Các kỳ vọng không được hỗ trợ

Yêu cầu PUT sau gửi thông tin về một tệp tải lên dự kiến đến máy chủ.
Client sử dụng tiêu đề `Expect: 100-continue` và không có phần thân yêu cầu để tránh gửi dữ liệu qua mạng có thể dẫn đến lỗi như phản hồi {{HTTPStatus("405")}}, {{HTTPStatus("401")}}, hoặc {{HTTPStatus("403")}}:

```http
PUT /videos HTTP/1.1
Host: uploads.example.com
Content-Type: video/h264
Content-Length: 1234567890987
Expect: 100-continue
```

Trong ví dụ triển khai máy chủ này, các kỳ vọng không được hỗ trợ và sự hiện diện của tiêu đề `Expect` với bất kỳ giá trị nào dẫn đến phản hồi 417:

```http
HTTP/1.1 417 Expectation Failed
Date: Fri, 28 Jun 2024 11:40:58 GMT
```

Client phản hồi bằng cách thực hiện yêu cầu không có kỳ vọng và với {{Glossary("HTTP Content", "nội dung")}} trong phần thân yêu cầu:

```http
PUT /videos HTTP/1.1
Host: uploads.example.com
Content-Type: video/h264
Content-Length: 1234567890987

[…]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("100", "100 Continue")}}
- {{HTTPHeader("Expect")}}
