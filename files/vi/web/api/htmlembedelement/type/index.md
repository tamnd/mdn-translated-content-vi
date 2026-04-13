---
title: "HTMLEmbedElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLEmbedElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLEmbedElement.type
---

{{APIRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLEmbedElement")}} trả về một chuỗi phản ánh thuộc tính `type` của phần tử {{HTMLElement("embed")}}, cho biết {{glossary("MIME type")}} của tài nguyên. Nó phản ánh thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/embed#type) của phần tử {{htmlelement("embed")}}.

## Giá trị

Một chuỗi; kiểu MIME của tài nguyên.

## Ví dụ

```js
const el = document.getElementById("el");
console.log(el.type); // Kết quả: "video/webp"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLObjectElement.type")}}
- {{domxref("HTMLSourceElement.type")}}
- [Các kiểu media trên web](/en-US/docs/Web/Media/Guides/Formats)
- [Các kiểu MIME quan trọng dành cho nhà phát triển web](/en-US/docs/Web/HTTP/Guides/MIME_types#important_mime_types_for_web_developers)
