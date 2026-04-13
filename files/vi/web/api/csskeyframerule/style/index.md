---
title: "CSSKeyframeRule: thuộc tính style"
short-title: style
slug: Web/API/CSSKeyframeRule/style
page-type: web-api-instance-property
browser-compat: api.CSSKeyframeRule.style
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("CSSKeyframeRule")}} chứa một đối tượng {{domxref("CSSStyleDeclaration")}} biểu thị các descriptor có sẵn trong nội dung quy tắc {{cssxref("@keyframes")}}.

## Giá trị

Một đối tượng {{domxref("CSSStyleDeclaration")}}.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSStyleDeclaration`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSStyleDeclaration` bằng cách sử dụng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

CSS bao gồm một at-rule {{cssxref("@keyframes")}}. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`. `myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}, sẽ chứa các đối tượng {{domxref("CSSKeyFrameRule")}} riêng lẻ cho mỗi keyframe.

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
console.log(keyframes[0].style); // a CSSStyleDeclaration
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
