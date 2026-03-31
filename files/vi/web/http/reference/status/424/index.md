---
title: 424 Failed Dependency
slug: Web/HTTP/Reference/Status/424
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc4918#section-11.4
sidebar: http
---

Mã trạng thái HTTP **`424 Failed Dependency`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết phương thức không thể được thực hiện trên tài nguyên vì hành động được yêu cầu phụ thuộc vào một hành động khác và hành động đó đã thất bại.

Các máy chủ web thông thường thường không trả về mã trạng thái này, nhưng một số giao thức như {{Glossary("WebDAV")}} có thể trả về nó.
Ví dụ, trong {{Glossary("WebDAV")}}, nếu yêu cầu `PROPPATCH` được phát ra và một lệnh thất bại, thì tự động mọi lệnh khác cũng sẽ thất bại với `424 Failed Dependency`.

## Trạng thái

```http
424 Failed Dependency
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("403")}} (Forbidden)
- {{HTTPStatus("501", "501 Not Implemented")}}, {{HTTPStatus("510", "510 Not Extended")}}
