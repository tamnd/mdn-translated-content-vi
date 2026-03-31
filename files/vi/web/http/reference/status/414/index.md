---
title: 414 URI Too Long
slug: Web/HTTP/Reference/Status/414
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.414
sidebar: http
---

Mã trạng thái HTTP **`414 URI Too Long`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết URI được yêu cầu bởi client dài hơn mức máy chủ sẵn sàng diễn giải.

Có một vài điều kiện hiếm gặp khi lỗi này có thể xảy ra:

- client đã chuyển đổi không đúng cách yêu cầu {{HTTPMethod("POST")}} thành yêu cầu {{HTTPMethod("GET")}} với thông tin truy vấn dài,
- client đã đi vào vòng lặp chuyển hướng (ví dụ, tiền tố URI chuyển hướng trỏ đến hậu tố của chính nó), hoặc
- máy chủ đang bị tấn công bởi client đang cố khai thác các lỗ hổng bảo mật tiềm ẩn.

Một số hệ thống triển khai `414 URI Too Long` như `414 Request-URI Too Large`.

## Trạng thái

```http
414 URI Too Long
```

## Ví dụ

### Gửi biểu mẫu bằng GET

Trong ví dụ sau, [phương thức `<form>`](/en-US/docs/Web/HTML/Reference/Elements/form#method) trong HTML vô tình sử dụng `get` thay vì `post`.
Một lượng lớn dữ liệu biểu mẫu được nối vào URL được chỉ định tại thuộc tính `action` của biểu mẫu và được gửi dưới dạng yêu cầu GET:

```http
GET /search?feedback=it+was+the+best+of+times+it+was+the+worst+of+times… HTTP/1.1
Host: example.com
```

Giới hạn độ dài URI của máy chủ cụ thể bị vượt quá với yêu cầu này và phản hồi 414 được gửi:

```http
HTTP/1.1 414 URI Too Long
Content-Type: text/html; charset=UTF-8
Date: Fri, 28 Jun 2024 11:40:58 GMT
Content-Length: 1234

<!doctype html>
<head>
  <title>414 - URI Too Long</title>
</head>
  <body>
    <h1>414 - URI Too Long</h1>
    <p>The URI provided was too long for the server to process.</p>
  </body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{Glossary("URI")}}
