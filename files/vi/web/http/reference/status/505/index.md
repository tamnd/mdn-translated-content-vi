---
title: 505 HTTP Version Not Supported
slug: Web/HTTP/Reference/Status/505
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.505
sidebar: http
---

Mã trạng thái HTTP **`505 HTTP Version Not Supported`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết phiên bản HTTP được sử dụng trong yêu cầu không được máy chủ hỗ trợ.

Lỗi này thường gặp khi dòng yêu cầu được tạo không đúng định dạng như `GET /path to resource HTTP/1.1` hoặc khi dòng yêu cầu kết thúc bằng `\n` thay vì `\r\n`.
Ví dụ, các thành phần trung gian như bộ cân bằng tải có thể không xử lý đúng các dòng yêu cầu của yêu cầu được chuyển tiếp như được minh họa trong ví dụ bên dưới.

## Trạng thái

```http
505 HTTP Version Not Supported
```

## Ví dụ

### Lỗi 505 do dòng yêu cầu không đúng định dạng

Trong ví dụ sau, client yêu cầu `example.com/dog%20trainers`, nhưng do cấu hình bộ cân bằng tải không đúng, {{Glossary("Percent-encoding", "percent encoding")}} trong URL không được xử lý đúng cách.
Trong trường hợp này, máy chủ gốc thấy `trainers` thay vì phiên bản HTTP, và phản hồi `505` được trả về thay vì.
Một mã định danh yêu cầu được chứa trong phần thân phản hồi để minh họa cách có thể giúp quản trị viên máy chủ thu hẹp nguyên nhân gốc rễ của vấn đề:

```http
GET /dog trainers HTTP/1.1
Host: example.com
```

```http
HTTP/1.1 505 HTTP Version Not Supported
Content-Type: text/html;
Content-Length: 123

<!doctype html>
<html lang="en">
<head>
  <title>505 HTTP Version Not Supported</title>
</head>
<body>
  <h1>505 HTTP Version Not Supported</h1>
  <p>If this problem persists, please <a href="https://example.com/support">contact support</a>.</p>
  <p>Server logs contain details of this error with request ID: ABC-123.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- Tiêu đề {{HTTPHeader("Upgrade")}}
