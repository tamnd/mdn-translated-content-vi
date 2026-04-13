---
title: "CSSFontFeatureValuesRule: thuộc tính styleset"
short-title: styleset
slug: Web/API/CSSFontFeatureValuesRule/styleset
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesRule.styleset
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Thuộc tính chỉ đọc **styleset** của giao diện {{domXRef("CSSFontFeatureValuesRule")}} chứa một đối tượng {{domXRef("CSSFontFeatureValuesMap")}} đại diện cho [định danh do người dùng xác định](/en-US/docs/Web/CSS/Reference/Values/custom-ident) và [chỉ mục tính năng](/en-US/docs/Web/CSS/Reference/Properties/font-feature-settings#optional_value) cho một font biến đổi hỗ trợ {{CSSXRef("font-variant-alternates", "styleset()", "#styleset")}}.

## Giá trị

Một đối tượng {{domxref("CSSFontFeatureValuesMap")}}.

Mặc dù bản thân thuộc tính `styleset` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFontFeatureValuesMap`, bạn vẫn có thể gán trực tiếp cho thuộc tính `styleset`. Bạn cũng có thể sửa đổi các giá trị của `styleset` bằng cách sử dụng [các phương thức phiên bản của `CSSFontFeatureValuesMap`](/en-US/docs/Web/API/CSSFontFeatureValuesMap#instance_methods).

## Ví dụ

### Sử dụng cơ bản

#### CSS

```css
@font-feature-values "MonteCarlo" {
  @styleset {
    my-styleset: 1;
  }
}
```

#### JavaScript

```js
// look for the first stylesheet and the first cssRule in that sheet
const myRule = document.styleSheets[0].cssRules[0];
// check
if (myRule instanceof CSSFontFeatureValuesRule && myRule.styleset.size) {
  // do something with the styleset
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxRef("@font-feature-values","@styleset","#styleset")}}
- Ký pháp hàm {{cssxRef("font-variant-alternates","styleset()","#styleset")}}
- {{domxref("CSSFontFeatureValuesMap")}}
