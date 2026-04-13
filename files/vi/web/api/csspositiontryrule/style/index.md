---
title: "CSSPositionTryRule: thuộc tính style"
short-title: style
slug: Web/API/CSSPositionTryRule/style
page-type: web-api-instance-property
browser-compat: api.CSSPositionTryRule.style
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("CSSPositionTryRule")}} chứa một đối tượng {{domxref("CSSPositionTryDescriptors")}} biểu thị các descriptor có sẵn trong nội dung quy tắc {{cssxref("@position-try")}}.

## Giá trị

Một đối tượng {{domxref("CSSPositionTryDescriptors")}}.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSPositionTryDescriptors`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSPositionTryDescriptors` bằng cách sử dụng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

CSS bao gồm at-rule `@position-try` với tên `--custom-right` và ba descriptor.

```css
@position-try --custom-bottom {
  top: anchor(bottom);
  min-width: 100px;
  margin-top: 10px;
}
```

```js
const myRules = document.styleSheets[0].cssRules;
const tryOption = myRules[0]; // a CSSPositionTryRule
console.log(tryOption.style.top); // "anchor(bottom)"
console.log(tryOption.style["min-width"]); // "100px"
console.log(tryOption.style.positionArea); // ""; no position-area specified
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
