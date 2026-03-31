---
title: 429 Too Many Requests
slug: Web/HTTP/Reference/Status/429
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc6585#section-4
sidebar: http
---

Mã trạng thái HTTP **`429 Too Many Requests`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết client đã gửi quá nhiều yêu cầu trong một khoảng thời gian nhất định.
Cơ chế yêu cầu client giảm tốc độ gửi yêu cầu này thường được gọi là "{{glossary("rate limit", "giới hạn tốc độ")}}".

Tiêu đề {{HTTPHeader("Retry-After")}} có thể được đưa vào phản hồi này để cho biết client nên chờ bao lâu trước khi thực hiện yêu cầu lại.

Các triển khai giới hạn tốc độ khác nhau; các hạn chế có thể áp dụng toàn máy chủ hoặc theo từng tài nguyên.
Thông thường, các hạn chế giới hạn tốc độ dựa trên địa chỉ IP của client nhưng có thể cụ thể theo người dùng hoặc ứng dụng được ủy quyền nếu các yêu cầu được xác thực hoặc chứa {{Glossary("cookie")}}.

## Trạng thái

```http
429 Too Many Requests
```

## Ví dụ

### Phản hồi chứa tiêu đề Retry-After

Yêu cầu sau được gửi lặp đi lặp lại trong vòng lặp bởi client được cấu hình sai:

```http
GET /reports/mdn HTTP/1.1
Host: example.com
```

Trong ví dụ này, giới hạn tốc độ toàn máy chủ được kích hoạt khi client vượt quá ngưỡng yêu cầu mỗi phút đã đặt.
Phản hồi 429 được trả về với tiêu đề {{HTTPHeader("Retry-After")}} cho biết các yêu cầu sẽ được cho phép lại cho client này sau 60 phút:

```http
HTTP/1.1 429 Too Many Requests
Content-Type: text/html
Retry-After: 3600

<html lang="en-US">
  <head>
    <title>Too Many Requests</title>
  </head>
  <body>
    <h1>Too Many Requests</h1>
    <p>You're doing that too often! Try again later.</p>
  </body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Retry-After")}}
- Python solution: [How to avoid HTTP error 429 python](https://stackoverflow.com/questions/22786068/how-to-avoid-http-error-429-too-many-requests-python)
