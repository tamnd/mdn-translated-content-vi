---
title: CSSKeyframeRule
slug: Web/API/CSSKeyframeRule
page-type: web-api-interface
browser-compat: api.CSSKeyframeRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSKeyframeRule`** mô tả một đối tượng biểu thị tập hợp các kiểu cho một keyframe nhất định. Nó tương ứng với nội dung của một keyframe đơn lẻ trong [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@keyframes")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ lớp tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSKeyframeRule.keyText")}}
  - : Biểu thị key của keyframe, như `'10%'`, `'75%'`. Từ khóa `from` ánh xạ tới `'0%'` và từ khóa `to` ánh xạ tới `'100%'`.
- {{domxref("CSSKeyframeRule.style")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("CSSStyleDeclaration")}} của kiểu CSS liên kết với keyframe.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa phương thức từ lớp tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

CSS bao gồm một at-rule keyframes. Đây sẽ là {{domxref("CSSRule")}} đầu tiên được trả về bởi `document.styleSheets[0].cssRules`. `myRules[0]` trả về một đối tượng {{domxref("CSSKeyframesRule")}}, sẽ chứa các đối tượng `CSSKeyFrameRule` riêng lẻ cho mỗi keyframe.

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
console.log(keyframes[0]); // a CSSKeyframeRule representing an individual keyframe.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@keyframes")}}
- {{domxref("CSSKeyFramesRule")}}
