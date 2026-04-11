---
title: "CSSStyleRule: selectorText property"
short-title: selectorText
slug: Web/API/CSSStyleRule/selectorText
page-type: web-api-instance-property
browser-compat: api.CSSStyleRule.selectorText
---

{{APIRef("CSSOM") }}

Thuộc tính **`selectorText`** của giao diện {{domxref("CSSStyleRule")}} lấy và đặt các bộ chọn gắn với `CSSStyleRule`.

## Giá trị

Một chuỗi.

## Ví dụ

CSS gồm một style rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`. Do đó `myRules[0].selectorText` trả về một chuỗi literal của bộ chọn, trong trường hợp này là `"h1"`.

```css
h1 {
  color: pink;
}
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].selectorText); // a string containing "h1".
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
