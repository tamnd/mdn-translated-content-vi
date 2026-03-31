---
title: 500 Internal Server Error
slug: Web/HTTP/Reference/Status/500
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.500
sidebar: http
---

Mã trạng thái HTTP **`500 Internal Server Error`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết máy chủ gặp điều kiện không mong đợi ngăn nó hoàn thành yêu cầu.
Lỗi này là phản hồi "bắt tất cả" chung cho các sự cố máy chủ, cho biết máy chủ không thể tìm thấy [lỗi 5XX](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) phù hợp hơn để phản hồi.

Nếu bạn là khách truy cập thấy lỗi `500` trên trang web, các vấn đề này cần được điều tra bởi chủ sở hữu hoặc quản trị viên máy chủ.
Có nhiều nguyên nhân có thể dẫn đến lỗi `500`, bao gồm: cấu hình máy chủ không đúng, vấn đề hết bộ nhớ (OOM), ngoại lệ không được xử lý, quyền tệp không đúng hoặc các yếu tố phức tạp khác.
Quản trị viên máy chủ có thể chủ động ghi log các sự cố phản hồi lỗi máy chủ, như mã trạng thái `500`, với các chi tiết về các yêu cầu khởi phát để cải thiện sự ổn định của dịch vụ trong tương lai.

## Trạng thái

```http
500 Internal Server Error
```

## Ví dụ

### Phản hồi lỗi máy chủ 500

Yêu cầu sau thử lấy trang web nhưng nhận được phản hồi 500.
Phần thân phản hồi chứa trang mô tả trạng thái máy chủ với liên kết đến trang hỗ trợ cho khách truy cập.
Một mã định danh được chứa trong phần thân phản hồi để minh họa phương pháp có thể giúp quản trị viên máy chủ thu hẹp nguyên nhân gốc rễ của vấn đề:

```http
GET /highlights HTTP/1.1
Host: example.com
User-Agent: curl/8.6.0
Accept: */*
```

```http
HTTP/1.1 500 Internal Server Error
Content-Type: text/html;
Content-Length: 123

<!doctype html>
<html lang="en">
<head>
  <title>500 Internal Server Error</title>
</head>
<body>
  <h1>Internal Server Error</h1>
  <p>The server was unable to complete your request. Please try again later.</p>
  <p>If this problem persists, please <a href="https://example.com/support">contact support</a>.</p>
  <p>Server logs contain details of this error with request ID: ABC-123.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
