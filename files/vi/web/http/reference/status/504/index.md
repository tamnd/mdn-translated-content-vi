---
title: 504 Gateway Timeout
slug: Web/HTTP/Reference/Status/504
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.504
sidebar: http
---

Mã trạng thái HTTP **`504 Gateway Timeout`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết máy chủ, trong khi hoạt động như một gateway hoặc {{Glossary("Proxy_server", "proxy")}}, không nhận được phản hồi kịp thời từ máy chủ upstream để hoàn thành yêu cầu.
Điều này tương tự như {{HTTPStatus("502", "502 Bad Gateway")}}, ngoại trừ ở trạng thái `504`, proxy hoặc gateway không nhận được bất kỳ phản hồi HTTP nào từ máy chủ gốc trong một khoảng thời gian nhất định.

Có nhiều nguyên nhân dẫn đến lỗi `504`, và việc khắc phục các vấn đề như vậy có thể cần điều tra và gỡ lỗi của quản trị viên máy chủ, hoặc trang web có thể hoạt động lại vào lúc khác.
Ngoại lệ là các lỗi mạng phía client, đặc biệt nếu dịch vụ hoạt động với các khách truy cập khác và nếu client sử dụng VPN hoặc cài đặt mạng tùy chỉnh khác.
Trong những trường hợp như vậy, client nên kiểm tra cài đặt mạng, cấu hình tường lửa, cài đặt proxy, cấu hình DNS, v.v.

## Trạng thái

```http
504 Gateway Timeout
```

## Ví dụ

### Phản hồi hết thời gian gateway 504

Yêu cầu sau thử lấy trang web nhưng nhận được phản hồi `504`.
Phần thân phản hồi chứa trang mô tả trạng thái máy chủ với liên kết đến trang hỗ trợ cho khách truy cập.

```http
GET /highlights HTTP/1.1
Host: example.com
User-Agent: curl/8.6.0
Accept: */*
```

```http
HTTP/1.1 504 Gateway Timeout
Content-Type: text/html;
Content-Length: 123

<!doctype html>
<html lang="en">
<head>
  <title>504 Gateway Timeout</title>
</head>
<body>
  <h1>Gateway timeout</h1>
  <p>The server did not respond in time. Please try again later.</p>
  <p>If this problem persists, please <a href="https://example.com/support">contact support</a>.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("502", "502 Bad Gateway")}}
