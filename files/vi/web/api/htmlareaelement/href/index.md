---
title: "HTMLAreaElement: thuộc tính href"
short-title: href
slug: Web/API/HTMLAreaElement/href
page-type: web-api-instance-property
browser-compat: api.HTMLAreaElement.href
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`href`** của giao diện {{domxref("HTMLAreaElement")}} là một {{Glossary("stringifier")}} trả về chuỗi chứa toàn bộ URL và cho phép cập nhật href.

Nó phản ánh thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/area#href) của phần tử {{htmlelement("area")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// A <area id="myArea" href="https://developer.mozilla.org/en-US/HTMLAreaElement"> element is in the document
const area = document.getElementById("myArea");
area.href; // returns 'https://developer.mozilla.org/en-US/HTMLAreaElement'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAreaElement")}} mà nó thuộc về.
