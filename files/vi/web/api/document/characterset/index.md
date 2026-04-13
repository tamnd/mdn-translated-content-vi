---
title: "Document: thuộc tính characterSet"
short-title: characterSet
slug: Web/API/Document/characterSet
page-type: web-api-instance-property
browser-compat: api.Document.characterSet
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Document.characterSet`** trả về [bảng mã ký tự](/en-US/docs/Glossary/Character_encoding) của tài liệu hiện đang được kết xuất.

> [!NOTE]
> "character set" (bộ ký tự) và "character encoding" (bảng mã ký tự) có liên quan nhưng khác nhau. Mặc dù tên của thuộc tính này, nó trả về _encoding_ (bảng mã).

## Giá trị

Một chuỗi.

## Ví dụ

```js
console.log(document.characterSet);
// document's character encoding, such as "ISO-8859-1" or "UTF-8"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
