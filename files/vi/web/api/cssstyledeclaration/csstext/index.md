---
title: "CSSStyleDeclaration: thuộc tính cssText"
short-title: cssText
slug: Web/API/CSSStyleDeclaration/cssText
page-type: web-api-instance-property
browser-compat: api.CSSStyleDeclaration.cssText
---

{{APIRef("CSSOM")}}

Thuộc tính **`cssText`** của giao diện {{domxref("CSSStyleDeclaration")}} trả về hoặc thiết lập văn bản của khai báo kiểu **nội tuyến** của phần tử.

Để có thể thiết lập quy tắc **bảng kiểu** động, xem [Sử dụng thông tin kiểu động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information).

Không nhầm lẫn với quy tắc kiểu bảng kiểu {{domxref("CSSRule.cssText")}}.

## Giá trị

Một chuỗi chứa văn bản của khai báo kiểu nội tuyến của phần tử.

## Ví dụ

```html
<span id="s1" style="color: red;">Some text</span>
```

```js
const elem = document.getElementById("s1");
console.log(elem.style.cssText); // "color: red;"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
