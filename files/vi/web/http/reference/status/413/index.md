---
title: 413 Content Too Large
slug: Web/HTTP/Reference/Status/413
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.413
sidebar: http
---

Mã trạng thái HTTP **`413 Content Too Large`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết thực thể yêu cầu lớn hơn giới hạn do máy chủ định nghĩa.
Máy chủ có thể đóng kết nối hoặc trả về trường tiêu đề {{HTTPHeader("Retry-After")}}.

Trước {{rfc("9110")}} cụm từ phản hồi cho trạng thái này là **`Payload Too Large`**.
Thông điệp này vẫn được sử dụng rộng rãi.

## Trạng thái

```http
413 Content Too Large
```

## Ví dụ

### Vượt quá giới hạn tải lên tệp

Ví dụ sau cho thấy những gì client có thể gửi khi phần tử [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file) bao gồm một hình ảnh khi gửi biểu mẫu với `method="post"`:

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

Máy chủ có thể từ chối tải lên nếu có giới hạn về kích thước tệp tối đa mà nó sẽ xử lý, và nội dung phản hồi bao gồm `message` với một số bối cảnh:

```http
HTTP/1.1 413 Content Too Large
Content-Type: application/json
Content-Length: 97

{
  "error": "Upload failed",
  "message": "Maximum allowed upload size is 4MB",
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Connection")}}
- {{HTTPHeader("Retry-After")}}
