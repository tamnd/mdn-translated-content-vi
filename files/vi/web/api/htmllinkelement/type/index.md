---
title: "HTMLLinkElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLLinkElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.type
---

{{APIRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLLinkElement")}} là một chuỗi phản ánh [kiểu MIME]({{glossary("MIME type")}}) của tài nguyên được liên kết.

Nó phản ánh thuộc tính `type` của phần tử {{HTMLElement("link")}}.

## Giá trị

Một chuỗi, phải là một chuỗi kiểu MIME hợp lệ.

## Ví dụ

```html
<link
  id="el"
  rel="apple-touch-icon"
  sizes="114x114"
  href="apple-icon-114.png"
  type="image/png" />
```

```js
const el = document.getElementById("el");
console.log(el.type); // Output: "image/png"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
