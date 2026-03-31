---
title: 508 Loop Detected
slug: Web/HTTP/Reference/Status/508
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc5842#section-7.2
sidebar: http
---

Mã trạng thái HTTP **`508 Loop Detected`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) cho biết toàn bộ thao tác thất bại vì nó gặp vòng lặp vô hạn trong khi xử lý yêu cầu với `Depth: infinity`.

Trạng thái này có thể được trả về trong ngữ cảnh Web Distributed Authoring and Versioning ({{Glossary("WebDAV")}}).
Nó được giới thiệu như một phương án dự phòng cho các trường hợp client WebDAV không hỗ trợ phản hồi {{HTTPStatus("208", "208 Already Reported")}} (khi các yêu cầu không bao gồm tiêu đề `DAV` một cách rõ ràng).

## Trạng thái

```http
508 Loop Detected
```

## Ví dụ

### Vòng lặp vô hạn trong tìm kiếm WebDAV

```http
PROPFIND /Coll/ HTTP/1.1
Host: example.com
Depth: infinity
Content-Type: application/xml; charset="utf-8"
Content-Length: 125

<?xml version="1.0" encoding="utf-8" ?>
<D:propfind xmlns:D="DAV:">
  <D:prop> <D:displayname/> </D:prop>
</D:propfind>
```

```http
HTTP/1.1 508 Loop Detected
Content-Type: application/json; charset=utf-8
Server: Microsoft-IIS/8.0
Date: Wed, 15 May 2013 02:38:57 GMT
Content-Length: 72

{
  "Message": "Please check the resources for cyclic references and try again."
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("208", "208 Already Reported")}}
