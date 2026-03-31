---
title: 102 Processing
slug: Web/HTTP/Reference/Status/102
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc2518.html#section-10.1
sidebar: http
---

{{deprecated_header}}

Mã trạng thái [phản hồi thông tin](/en-US/docs/Web/HTTP/Reference/Status#informational_responses) HTTP **`102 Processing`** cho biết cho client rằng toàn bộ yêu cầu đã được nhận và máy chủ đang xử lý.
Mã trạng thái này chỉ được gửi nếu máy chủ dự kiến yêu cầu sẽ mất nhiều thời gian đáng kể.

> [!NOTE]
> Các máy chủ web thông thường không trả về phản hồi này.
> Mã trạng thái này được giới thiệu lần đầu trong Web Distributed Authoring and Versioning ({{Glossary("WebDAV")}}) {{RFC("2518")}}, nhưng đã bị xóa khỏi WebDAV trong {{RFC("4918")}}.

## Trạng thái

```http
102 Processing
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

Tính năng này đã bị ngừng sử dụng và các trình duyệt sẽ bỏ qua mã trạng thái phản hồi này.

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("100")}}
- [Ghi chú xóa '102 Processing' trong rfc4918](https://www.rfc-editor.org/rfc/rfc4918#section-21.4)
