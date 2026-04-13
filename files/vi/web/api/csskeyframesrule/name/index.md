---
title: "CSSKeyframesRule: thuộc tính name"
short-title: name
slug: Web/API/CSSKeyframesRule/name
page-type: web-api-instance-property
browser-compat: api.CSSKeyframesRule.name
---

{{APIRef("CSSOM") }}

Thuộc tính **`name`** của giao diện {{domxref("CSSKeyframeRule")}} lấy và đặt tên của hoạt hình được sử dụng bởi thuộc tính {{cssxref("animation-name")}}.

## Giá trị

Một chuỗi.

## Ví dụ

CSS bao gồm một keyframes at-rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}} với `name` được đặt thành `"slide-in"`.

```css
@keyframes slide-in {
  from {
    transform: translateX(0%);
  }

  to {
    transform: translateX(100%);
  }
}
```

```js
let myRules = document.styleSheets[0].cssRules;
let keyframes = myRules[0]; // a CSSKeyframesRule
console.log(keyframes.name); // "slide-in"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
