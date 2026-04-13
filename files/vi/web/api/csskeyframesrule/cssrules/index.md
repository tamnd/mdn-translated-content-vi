---
title: "CSSKeyframesRule: thuộc tính cssRules"
short-title: cssRules
slug: Web/API/CSSKeyframesRule/cssRules
page-type: web-api-instance-property
browser-compat: api.CSSKeyframesRule.cssRules
---

{{APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`cssRules`** của giao diện {{domxref("CSSKeyframeRule")}} trả về một {{domxref("CSSRuleList")}} chứa các quy tắc trong keyframes [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).

> [!NOTE]
> Bản thân `CSSKeyframeRule` có thể được lập chỉ mục như một mảng và hoạt động tương tự như thuộc tính `cssRules` của nó.

## Giá trị

Một {{domxref('CSSRuleList')}}.

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
let myRules = document.styleSheets[0].cssRules;
let keyframes = myRules[0]; // a CSSKeyframesRule
console.log(keyframes.cssRules); // a CSSRuleList object with two rules
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
