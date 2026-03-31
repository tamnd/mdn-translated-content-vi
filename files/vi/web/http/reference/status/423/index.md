---
title: 423 Locked
slug: Web/HTTP/Reference/Status/423
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc4918#section-11.3
sidebar: http
---

Mã trạng thái HTTP **`423 Locked`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết một tài nguyên đang bị _khóa_, nghĩa là nó không thể được truy cập.
Phần thân phản hồi của nó nên chứa thông tin ở định dạng XML của {{glossary("WebDAV")}}.

> [!NOTE]
> Khả năng _khóa_ tài nguyên để ngăn chặn xung đột là đặc thù của một số máy chủ {{Glossary("WebDAV")}}.
> Các trình duyệt truy cập trang web sẽ không bao giờ gặp mã trạng thái này; trong các trường hợp lỗi khi nó xảy ra, chúng sẽ xử lý nó như mã trạng thái {{HTTPStatus(400)}} thông thường.

## Trạng thái

```http
423 Locked
```

## Ví dụ

### Phản hồi WebDAV 423 Locked

```http
HTTP/1.1 423 Locked
Content-Type: application/xml; charset="utf-8"
Content-Length: xxxx

<?xml version="1.0" encoding="utf-8" ?>
<D:error xmlns:D="DAV:">
  <D:lock-token-submitted>
    <D:href>/workspace/web-dav/</D:href>
  </D:lock-token-submitted>
</D:error>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
