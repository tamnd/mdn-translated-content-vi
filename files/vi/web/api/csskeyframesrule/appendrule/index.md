---
title: "CSSKeyframesRule: phương thức appendRule()"
short-title: appendRule()
slug: Web/API/CSSKeyframesRule/appendRule
page-type: web-api-instance-method
browser-compat: api.CSSKeyframesRule.appendRule
---

{{APIRef("CSSOM") }}

Phương thức **`appendRule()`** của giao diện {{domxref("CSSKeyframeRule")}} thêm một {{domxref("CSSKeyFrameRule")}} vào cuối các quy tắc.

## Cú pháp

```js-nolint
appendRule(rule)
```

### Tham số

- `rule`
  - : Một chuỗi chứa một quy tắc keyframe.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

CSS bao gồm một keyframes at-rule. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`.
`myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}. Trả về thuộc tính `cssRules` sẽ trả về một {{domxref("CSSRuleList")}} chứa một quy tắc.

Sau khi thêm một quy tắc khác với `appendRule`, thuộc tính `cssRules` trả về một {{domxref("CSSRuleList")}} chứa hai quy tắc.

```css
@keyframes slide-in {
  from {
    transform: translateX(0%);
  }
}
```

```js
let myRules = document.styleSheets[0].cssRules;
let keyframes = myRules[0]; // a CSSKeyframesRule
keyframes.appendRule("to {transform: translateX(100%);}");
console.log(keyframes.cssRules); // a CSSRuleList object with two rules
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
