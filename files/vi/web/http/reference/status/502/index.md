---
title: 502 Bad Gateway
slug: Web/HTTP/Reference/Status/502
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.502
sidebar: http
---

Mã trạng thái HTTP **`502 Bad Gateway`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết máy chủ đang hoạt động như một gateway hoặc {{Glossary("Proxy_server", "proxy")}} và nhận được phản hồi không hợp lệ từ máy chủ upstream.

Phản hồi này tương tự phản hồi {{HTTPStatus("500", "500 Internal Server Error")}} ở chỗ nó là phản hồi "bắt tất cả" chung cho các lỗi máy chủ.
Sự khác biệt là nó cụ thể cho điểm trong chuỗi yêu cầu nơi lỗi xảy ra.
Nếu máy chủ gốc gửi phản hồi lỗi HTTP hợp lệ đến gateway, phản hồi đó nên được chuyển tiếp đến client thay vì `502` để làm rõ lý do thất bại.
Nếu proxy hoặc gateway không nhận được bất kỳ phản hồi HTTP nào từ máy chủ gốc, nó sẽ gửi {{HTTPStatus("504", "504 Gateway Timeout")}} đến client thay thế.

Có nhiều nguyên nhân dẫn đến lỗi `502`, và việc khắc phục các vấn đề như vậy có thể cần điều tra của chủ sở hữu hoặc quản trị viên máy chủ.
Ngoại lệ là các lỗi mạng phía client, đặc biệt nếu dịch vụ hoạt động với các khách truy cập khác và nếu client sử dụng VPN hoặc cài đặt mạng tùy chỉnh khác.
Trong những trường hợp như vậy, client nên kiểm tra cài đặt mạng, cấu hình tường lửa, cài đặt proxy, cấu hình DNS, v.v.

## Trạng thái

```http
502 Bad Gateway
```

## Ví dụ

### Phản hồi lỗi gateway 502

Yêu cầu sau thử lấy trang web nhưng nhận được phản hồi `502`.
Phần thân phản hồi chứa trang mô tả trạng thái máy chủ với liên kết đến trang hỗ trợ cho khách truy cập.

```http
GET /highlights HTTP/1.1
Host: example.com
User-Agent: curl/8.6.0
Accept: */*
```

```http
HTTP/1.1 502 Bad Gateway
Content-Type: text/html;
Content-Length: 123

<!doctype html>
<html lang="en">
<head>
  <title>502 Bad Gateway</title>
</head>
<body>
  <h1>Bad Gateway</h1>
  <p>The server was unable to complete your request. Please try again later.</p>
  <p>If this problem persists, please <a href="https://example.com/support">contact support</a>.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("504", "504 Gateway Timeout")}}
