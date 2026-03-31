---
title: 208 Already Reported
slug: Web/HTTP/Reference/Status/208
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc5842.html#section-7.1
sidebar: http
---

Mã trạng thái [phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) HTTP **`208 Already Reported`** được dùng trong phản hồi {{HTTPStatus("207", "207 Multi-Status")}} để tiết kiệm không gian và tránh xung đột.
Phản hồi này được dùng riêng trong ngữ cảnh Web Distributed Authoring and Versioning ({{Glossary("WebDAV")}}).

Nếu cùng một tài nguyên được yêu cầu nhiều lần (ví dụ như một phần của bộ sưu tập) với các đường dẫn khác nhau, thì chỉ có cái đầu tiên được báo cáo với {{HTTPStatus("200")}}.
Các phản hồi cho tất cả các liên kết khác sẽ báo cáo với mã trạng thái `208` này, vì vậy không có xung đột nào được tạo ra và phản hồi ngắn hơn.

> [!NOTE]
> Khả năng _liên kết_ một tài nguyên với nhiều đường dẫn là phần mở rộng của giao thức {{Glossary("WebDAV")}} (nó có thể được nhận bởi các ứng dụng web truy cập máy chủ WebDAV).
> Các trình duyệt truy cập trang web sẽ không bao giờ gặp mã trạng thái này.

## Trạng thái

```http
208 Already Reported
```

## Ví dụ

### Nhận `208` trong phản hồi `207 Multi-Status`

Sau đây là ví dụ phản hồi `207 Multi-Status` từ máy chủ WebDAV, bao gồm phản hồi `208`.
Lưu ý `208` trong phần tử `<D:status>` cuối cùng, cho biết tài nguyên có tên `Loop Demo` đã được báo cáo trước đó trong phản hồi `207`.

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
    <D:href>http://www.example.com/Coll/Foo</D:href>
    <D:propstat>
      <D:prop>
        <D:displayname>Bird Inventory</D:displayname>
        <D:resource-id>
          <D:href>urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf9</D:href>
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

- {{HTTPStatus("200")}}
- {{HTTPStatus("508", "508 Loop Detected")}}
- [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
