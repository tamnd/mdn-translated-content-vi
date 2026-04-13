---
title: CSSPositionTryRule
slug: Web/API/CSSPositionTryRule
page-type: web-api-interface
browser-compat: api.CSSPositionTryRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSPositionTryRule`** mô tả một đối tượng biểu thị at-rule {{cssxref("@position-try")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ lớp tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSPositionTryRule.name")}} {{ReadOnlyInline}}
  - : Biểu thị tên của tùy chọn position try được chỉ định bởi {{cssxref("dashed-ident")}} của at-rule `@position-try`.
- {{domxref("CSSPositionTryRule.style")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("CSSPositionTryDescriptors")}} biểu thị các khai báo được đặt trong nội dung của at-rule `@position-try`.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa phương thức từ lớp tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

CSS bao gồm at-rule `@position-try` với tên `--custom-left` và ba descriptor.

```css
@position-try --custom-left {
  position-area: left;
  width: 20%;
  max-width: 200px;
  margin-right: 10px;
}
```

```js
const myRules = document.styleSheets[0].cssRules;
const tryOption = myRules[0]; // a CSSPositionTryRule
console.log(tryOption); // "[object CSSPositionTryRule]"
console.log(tryOption.name); // "--custom-left"
console.log(tryOption.style); // "[object CSSPositionTryDescriptors]"
console.log(tryOption.style.maxWidth); // "200px"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("CSSPositionTryDescriptors")}}
- {{cssxref("@position-try")}}
- {{cssxref("position-try-fallbacks")}}
- Mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- [Sử dụng CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- [Xử lý tràn: tùy chọn thử và ẩn có điều kiện](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
