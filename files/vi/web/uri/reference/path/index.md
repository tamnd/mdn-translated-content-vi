---
title: URI path
short-title: Path
slug: Web/URI/Reference/Path
page-type: uri-component
spec-urls: https://www.rfc-editor.org/rfc/rfc3986.html#section-3.3
sidebar: urlsidebar
---

**path** của một URI là phần nằm sau [authority](/en-US/docs/Web/URI/Reference/Authority).
Nó chứa dữ liệu, thường được tổ chức theo dạng phân cấp, để xác định một tài nguyên trong phạm vi [scheme](/en-US/docs/Web/URI/Reference/Schemes) và thẩm quyền đặt tên của URI.

## Cú pháp

```url
http://example.com:80<path>
urn:<path>
```

Path có thể chứa gần như mọi ký tự, ngoại trừ `?` và `#` (lần lượt bắt đầu [query](/en-US/docs/Web/URI/Reference/Query) và [fragment](/en-US/docs/Web/URI/Reference/Fragment)), cùng các ký tự khác được scheme URI dành riêng. Một số scheme (được gọi là _hierarchical schemes_) còn phân tích path thành một chuỗi các đoạn được ngăn bởi ký tự gạch chéo (`/`); các scheme khác coi nó là một chuỗi đơn, không có cấu trúc.

## Mô tả

Path theo sau authority và kết thúc tại dấu hỏi (`?`) đầu tiên, dấu thăng (`#`) đầu tiên, hoặc khi URI kết thúc.
Trong hai URI sau:

```url
urn:nbn:de:bvb:19-epub-5359-3
https://example.com:80/images/animated/ayse.gif
```

`nbn:de:bvb:19-epub-5359-3` là path của [URN](/en-US/docs/Web/URI/Reference/Schemes/urn). `/images/animated/ayse.gif` là path của URI `https`.

Mọi URI đều có một thành phần path, nghĩa là các path trong ví dụ sau lần lượt là một dấu gạch chéo đơn (`/`) ở URL đầu tiên và một thành phần path rỗng ở URL thứ hai:

```url
https://example.com/
https://example.com
```

Trình duyệt, bao gồm cả web API {{domxref("URL")}}, chuẩn hóa các path rỗng thành `/`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
