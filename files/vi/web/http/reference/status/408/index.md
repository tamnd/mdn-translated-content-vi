---
title: 408 Request Timeout
slug: Web/HTTP/Reference/Status/408
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.408
sidebar: http
---

Mã trạng thái HTTP **`408 Request Timeout`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ muốn đóng kết nối không sử dụng này.
`408` được gửi trên kết nối nhàn rỗi bởi một số máy chủ, _ngay cả khi không có yêu cầu nào từ client trước đó_.

Máy chủ nên gửi trường tiêu đề {{HTTPHeader("Connection", "Connection: close")}} trong phản hồi, vì `408` ngụ ý máy chủ đã quyết định đóng kết nối thay vì tiếp tục chờ đợi.

Phản hồi này được dùng nhiều hơn kể từ khi một số trình duyệt, như Chrome và Firefox, sử dụng cơ chế kết nối trước HTTP để tăng tốc độ duyệt web.

> [!NOTE]
> Một số máy chủ sẽ đóng kết nối mà không gửi thông điệp này.

## Trạng thái

```http
408 Request Timeout
```

## Ví dụ

### Hết thời gian trong gửi biểu mẫu

Ví dụ sau cho thấy những gì client có thể gửi khi phần tử [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file) sử dụng một hình ảnh khi gửi biểu mẫu với `method="post"`:

```http
POST /upload HTTP/1.1
Host: example.com
Content-Type: multipart/form-data; boundary=----Boundary1234
Content-Length: 4012345

------Boundary1234
Content-Disposition: form-data; name="file"; filename="myImage.jpg"
Content-Type: image/jpeg

\xFF\xD8\xFF\xE0\x00...(binary data)
------Boundary1234--
```

Nếu dữ liệu không được nhận đầy đủ do sự cố mạng hoặc độ trễ, máy chủ có thể hết thời gian cho kết nối.
Client có thể lặp lại yêu cầu, và một kết nối mới sẽ được sử dụng:

```http
HTTP/1.1 408 Request Timeout
Content-Type: text/html

<html>
<head>
    <title>408 Request Timeout</title>
</head>
<body>
    <h1>408 Request Timeout</h1>
    <p>Failed to process request in time. Please try again.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Connection")}}
- {{HTTPHeader("X-DNS-Prefetch-Control")}}
