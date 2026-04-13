---
title: "CSSPositionTryRule: thuộc tính name"
short-title: name
slug: Web/API/CSSPositionTryRule/name
page-type: web-api-instance-property
browser-compat: api.CSSPositionTryRule.name
---

{{APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("CSSPositionTryRule")}} biểu thị tên của tùy chọn dự phòng position try được chỉ định bởi {{cssxref("dashed-ident")}} của at-rule `@position-try`.

## Giá trị

Một chuỗi.

## Ví dụ

CSS bao gồm at-rule `@position-try` với tên `--custom-bottom` và ba descriptor.

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
console.log(tryOption.name); // "--custom-bottom"
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
