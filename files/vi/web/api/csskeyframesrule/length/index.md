---
title: "CSSKeyframesRule: thuộc tính length"
short-title: length
slug: Web/API/CSSKeyframesRule/length
page-type: web-api-instance-property
browser-compat: api.CSSKeyframesRule.length
---

{{APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("CSSKeyframesRule")}} trả về số lượng đối tượng {{domxref("CSSKeyframeRule")}} trong danh sách của nó. Bạn có thể truy cập từng quy tắc keyframe theo chỉ mục trực tiếp trên đối tượng `CSSKeyframeRule`.

## Giá trị

Một số nguyên không âm. Nó phải có cùng giá trị với `length` của thuộc tính {{domxref("CSSKeyframesRule.cssRules", "cssRules")}}.

## Ví dụ

CSS bao gồm một keyframes at-rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}. Thuộc tính `cssRules` trả về một {{domxref("CSSRuleList")}} chứa hai quy tắc.

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
const myRules = document.styleSheets[0].cssRules;
const keyframes = myRules[0]; // a CSSKeyframesRule
console.log(keyframes.length); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
