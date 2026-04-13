---
title: "CSSFontFeatureValuesRule: thuộc tính stylistic"
short-title: stylistic
slug: Web/API/CSSFontFeatureValuesRule/stylistic
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesRule.stylistic
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Thuộc tính chỉ đọc **stylistic** của giao diện {{domXRef("CSSFontFeatureValuesRule")}} chứa một đối tượng {{domXRef("CSSFontFeatureValuesMap")}} đại diện cho [định danh do người dùng xác định](/en-US/docs/Web/CSS/Reference/Values/custom-ident) và [chỉ mục tính năng](/en-US/docs/Web/CSS/Reference/Properties/font-feature-settings#optional_value) cho một font biến đổi hỗ trợ {{CSSXRef("font-variant-alternates", "stylistic()", "#stylistic")}}.

## Giá trị

Một đối tượng {{domxref("CSSFontFeatureValuesMap")}}.

Mặc dù bản thân thuộc tính `stylistic` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFontFeatureValuesMap`, bạn vẫn có thể gán trực tiếp cho thuộc tính `stylistic`. Bạn cũng có thể sửa đổi các giá trị của `stylistic` bằng cách sử dụng [các phương thức phiên bản của `CSSFontFeatureValuesMap`](/en-US/docs/Web/API/CSSFontFeatureValuesMap#instance_methods).

## Ví dụ

### Sử dụng cơ bản

#### CSS

```css
@font-feature-values "MonteCarlo" {
  @stylistic {
    my-stylistics: 1;
  }
}
```

#### JavaScript

```js
// look for the first stylesheet and the first cssRule in that sheet
const myRule = document.styleSheets[0].cssRules[0];
// check
if (myRule instanceof CSSFontFeatureValuesRule && myRule.stylistic.size) {
  // do something with the stylistic
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxRef("@font-feature-values","@stylistic","#stylistic")}}
- Ký pháp hàm {{cssxRef("font-variant-alternates","stylistic()","#stylistic")}}
- {{domxref("CSSFontFeatureValuesMap")}}
