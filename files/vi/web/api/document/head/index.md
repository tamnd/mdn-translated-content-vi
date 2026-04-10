---
title: "Document: thuộc tính head"
short-title: head
slug: Web/API/Document/head
page-type: web-api-instance-property
browser-compat: api.Document.head
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`head`** của giao diện {{domxref("Document")}} trả về phần tử {{HTMLElement("head")}} của tài liệu hiện tại.

## Giá trị

Một {{domxref("HTMLHeadElement")}}.

## Ví dụ

```html
<!doctype html>
<head id="my-document-head">
  <title>Ví dụ: sử dụng document.head</title>
</head>
```

```js
const theHead = document.head;

console.log(theHead.id); // "my-document-head";
console.log(theHead === document.querySelector("head")); // true
```

## Ghi chú

`document.head` là chỉ đọc. Cố gắng gán giá trị cho thuộc tính này sẽ thất bại âm thầm hoặc, trong [Strict Mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), ném ra {{jsxref("TypeError")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.body")}}
