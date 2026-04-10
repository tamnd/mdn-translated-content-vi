---
title: "Document: thuộc tính all"
short-title: all
slug: Web/API/Document/all
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.all
---

{{APIRef("DOM")}}{{Deprecated_Header}}

Thuộc tính chỉ đọc **`all`** của giao diện {{DOMxRef("Document")}} trả về một {{DOMxRef("HTMLAllCollection")}} có gốc tại nút tài liệu.

Thay vì sử dụng `document.all` để trả về một {{DOMxRef("HTMLAllCollection")}} của tất cả các phần tử trong tài liệu theo thứ tự tài liệu, bạn có thể sử dụng {{DOMxRef("Document.querySelectorAll")}} để trả về một {{DOMxRef("NodeList")}} của tất cả các phần tử trong tài liệu theo thứ tự tài liệu:

```js
const allElements = document.querySelectorAll("*");
```

## Giá trị

Một {{DOMxRef("HTMLAllCollection")}} chứa mọi phần tử trong tài liệu.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
