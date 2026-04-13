---
title: "CSSFontFeatureValuesRule: thuộc tính swash"
short-title: swash
slug: Web/API/CSSFontFeatureValuesRule/swash
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesRule.swash
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Thuộc tính chỉ đọc **swash** của giao diện {{domXRef("CSSFontFeatureValuesRule")}} chứa một đối tượng {{domXRef("CSSFontFeatureValuesMap")}} đại diện cho [tên do nhà phát triển cung cấp](/en-US/docs/Web/CSS/Reference/Values/custom-ident) và [chỉ mục tính năng](/en-US/docs/Web/CSS/Reference/Properties/font-feature-settings#optional_value) cho một font biến đổi hỗ trợ {{CSSXRef("font-variant-alternates", "swash()", "#swash")}}.

## Giá trị

Một đối tượng {{domxref("CSSFontFeatureValuesMap")}}.

Mặc dù bản thân thuộc tính `swash` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFontFeatureValuesMap`, bạn vẫn có thể gán trực tiếp cho thuộc tính `swash`. Bạn cũng có thể sửa đổi các giá trị của `swash` bằng cách sử dụng [các phương thức phiên bản của `CSSFontFeatureValuesMap`](/en-US/docs/Web/API/CSSFontFeatureValuesMap#instance_methods).

## Ví dụ

### Sử dụng cơ bản

#### CSS

```css
@font-feature-values "MonteCarlo" {
  @swash {
    my-swashes: 1; /* Custom name for a particular set of swash alternate glyphs */
  }
}
```

#### JavaScript

```js
// look for the first stylesheet and the first cssRule in that sheet
const myRule = document.styleSheets[0].cssRules[0];
// check
if (myRule instanceof CSSFontFeatureValuesRule && myRule.swash.size) {
  // do something with the swash
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxRef("@font-feature-values","@swash","#swash")}}
- Ký pháp hàm {{cssxRef("font-variant-alternates","swash()","#swash")}}
- {{domxref("CSSFontFeatureValuesMap")}}
