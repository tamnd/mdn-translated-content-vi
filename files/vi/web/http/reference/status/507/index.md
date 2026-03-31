---
title: 507 Insufficient Storage
slug: Web/HTTP/Reference/Status/507
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc4918#section-11.5
sidebar: http
---

Mã trạng thái HTTP **`507 Insufficient Storage`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết không thể thực hiện hành động vì máy chủ không có đủ bộ nhớ khả dụng để hoàn thành yêu cầu thành công.

Mã trạng thái này lần đầu được sử dụng trong ngữ cảnh Web Distributed Authoring and Versioning ({{Glossary("WebDAV")}}) nhưng đã được áp dụng sang các trường hợp sử dụng khác để mô tả các tình huống khi tài nguyên máy chủ bị cạn kiệt.
Các nguyên nhân phổ biến của lỗi này có thể là do các thư mục máy chủ hết dung lượng khả dụng, không đủ RAM để thực hiện một thao tác, hoặc đạt đến các giới hạn nội bộ (chẳng hạn như giới hạn bộ nhớ dành riêng cho ứng dụng).
Yêu cầu gây ra lỗi này không nhất thiết phải bao gồm nội dung, vì nó có thể là yêu cầu sẽ tạo tài nguyên trên máy chủ nếu thành công.

Vấn đề này được coi là tạm thời, trái ngược với {{HTTPStatus("413", "413 Content Too Large")}}, cho biết yêu cầu client quá lớn để máy chủ xử lý bất kể các ràng buộc tài nguyên của máy chủ.

## Trạng thái

```http
507 Insufficient Storage
```

## Ví dụ

### Phản hồi 507 cho biết vấn đề lưu trữ

Yêu cầu sau cố gắng tải lên tệp lên máy chủ có dung lượng lưu trữ không đủ.
Máy chủ phản hồi với `507` để cho biết tài nguyên của nó đã cạn kiệt:

```http
POST /upload HTTP/1.1
Host: example.com
Content-Type: image/jpeg
Content-Length: 123456

[JPG file data]
```

```http
HTTP/1.1 507 Insufficient Storage
Date: Mon, 22 Jul 2024 10:00:00 GMT
Server: Apache/2.4.41 (Unix)
Content-Type: text/html; charset=UTF-8
Content-Length: 230

<html>
<head>
  <title>507 Insufficient Storage</title>
</head>
<body>
  <h1>Insufficient Storage</h1>
  <p>The server is unable to store the included resource to complete the request.</p>
  <p>Please try again later.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("413", "413 Content Too Large")}}
