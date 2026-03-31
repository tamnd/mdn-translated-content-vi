---
title: 207 Multi-Status
slug: Web/HTTP/Reference/Status/207
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc4918#section-11.1
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`207 Multi-Status`** cho biết một hỗn hợp các phản hồi.
Phản hồi này được dùng riêng trong ngữ cảnh Web Distributed Authoring and Versioning ({{Glossary("WebDAV")}}).

Thân phản hồi là một thực thể HTTP `text/xml` hoặc `application/xml` với phần tử gốc `multistatus` liệt kê các mã phản hồi riêng lẻ.

> [!NOTE]
> Các trình duyệt truy cập các trang web sẽ không bao giờ gặp mã trạng thái này.
> Khả năng trả về _tập hợp tài nguyên_ là một phần của giao thức {{Glossary("WebDAV")}} và chỉ gặp bởi các ứng dụng web truy cập máy chủ WebDAV.

## Trạng thái

```http
207 Multi-Status
```

## Ví dụ

### Nhận phản hồi `207` trong ngữ cảnh WebDAV

Phản hồi sau đây là ví dụ phản hồi `207` mà máy chủ {{Glossary("WebDAV")}} gửi đến client.
Có một phần tử gốc `multistatus` với thông tin chi tiết về các bộ sưu tập riêng lẻ:

```http
HTTP/1.1 207 Multi-Status
Content-Type: application/xml; charset="utf-8"
Content-Length: 1241

<?xml version="1.0" encoding="utf-8" ?>
<D:multistatus xmlns:D="DAV:">
  <D:response>
    <D:href>http://www.example.com/Coll/</D:href>
    <D:propstat>
      <D:prop>
        <D:displayname>Loop Demo</D:displayname>
        <D:resource-id>
          <D:href>urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf8</D:href>
        </D:resource-id>
      </D:prop>
      <D:status>HTTP/1.1 200 OK</D:status>
    </D:propstat>
  </D:response>
  <D:response>
    <D:href>http://www.example.com/Coll/Bar</D:href>
    <D:propstat>
      <D:prop>
        <D:displayname>Loop Demo</D:displayname>
        <D:resource-id>
          <D:href>urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf8</D:href>
        </D:resource-id>
      </D:prop>
      <D:status>HTTP/1.1 208 Already Reported</D:status>
    </D:propstat>
  </D:response>
</D:multistatus>
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPStatus("204")}}
- {{HTTPStatus("403")}}
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
