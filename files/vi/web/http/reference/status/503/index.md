---
title: 503 Service Unavailable
slug: Web/HTTP/Reference/Status/503
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.503
sidebar: http
---

Mã trạng thái HTTP **`503 Service Unavailable`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết máy chủ chưa sẵn sàng xử lý yêu cầu.

Các nguyên nhân phổ biến là máy chủ đang bảo trì hoặc quá tải.
Trong quá trình bảo trì, quản trị viên máy chủ có thể tạm thời chuyển hướng tất cả lưu lượng đến trang `503`, hoặc điều này có thể xảy ra tự động trong quá trình cập nhật phần mềm.
Trong trường hợp quá tải, một số ứng dụng phía máy chủ sẽ từ chối các yêu cầu với trạng thái `503` khi đạt đến các ngưỡng tài nguyên như giới hạn bộ nhớ, CPU hoặc connection pool.
Việc loại bỏ các yêu cầu đến tạo ra áp lực ngược giúp ngăn tài nguyên tính toán của máy chủ bị kiệt sức, tránh các sự cố nghiêm trọng hơn.
Nếu các yêu cầu từ client cụ thể bị hạn chế do {{Glossary("Rate_limit", "giới hạn tốc độ")}}, phản hồi phù hợp là {{HTTPStatus("429", "429 Too Many Requests")}}.

Phản hồi này nên được sử dụng cho các điều kiện tạm thời và tiêu đề HTTP {{HTTPHeader("Retry-After")}} nên chứa thời gian ước tính để dịch vụ phục hồi, nếu có thể.

Một trang thân thiện với người dùng giải thích vấn đề nên được gửi cùng với phản hồi này.

> [!NOTE]
> Các tiêu đề liên quan đến bộ nhớ đệm được gửi với phản hồi này cần được chú ý đặc biệt; `503` cho biết sự cố tạm thời và các phản hồi thường không nên được lưu vào bộ nhớ đệm vì client có thể nhận được trang lỗi lỗi thời sau khi bản sửa lỗi được triển khai.

## Trạng thái

```http
503 Service Unavailable
```

## Ví dụ

### Phản hồi lỗi máy chủ 503

Yêu cầu sau thử lấy trang web nhưng nhận được phản hồi `503`.
Phần thân phản hồi chứa trang mô tả trạng thái máy chủ với liên kết đến trang hỗ trợ cho khách truy cập.
Một mã định danh được chứa trong phần thân phản hồi để minh họa phương pháp có thể giúp quản trị viên máy chủ thu hẹp nguyên nhân gốc rễ của vấn đề:

```http
GET /highlights HTTP/1.1
Host: example.com
User-Agent: curl/8.6.0
Accept: */*
```

```http
HTTP/1.1 503 Service Unavailable
Content-Type: text/html;
Content-Length: 123

<!doctype html>
<html lang="en">
<head>
  <title>503 Service Unavailable</title>
</head>
<body>
  <h1>503 Service Unavailable</h1>
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
- {{HTTPHeader("Retry-After")}}
