---
title: "CSSFontFeatureValuesRule: thuộc tính annotation"
short-title: annotation
slug: Web/API/CSSFontFeatureValuesRule/annotation
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesRule.annotation
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Thuộc tính chỉ đọc **annotation** của giao diện {{domXRef("CSSFontFeatureValuesRule")}} chứa một đối tượng {{domXRef("CSSFontFeatureValuesMap")}} đại diện cho [định danh do người dùng xác định](/en-US/docs/Web/CSS/Reference/Values/custom-ident) và [chỉ mục tính năng](/en-US/docs/Web/CSS/Reference/Properties/font-feature-settings#optional_value) cho một font biến đổi hỗ trợ {{CSSXRef("font-variant-alternates", "annotation()", "#annotation")}}.

## Giá trị

Một đối tượng {{domxref("CSSFontFeatureValuesMap")}}.

Mặc dù bản thân thuộc tính `annotation` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFontFeatureValuesMap`, bạn vẫn có thể gán trực tiếp cho thuộc tính `annotation`. Bạn cũng có thể sửa đổi các giá trị của `annotation` bằng cách sử dụng [các phương thức phiên bản của `CSSFontFeatureValuesMap`](/en-US/docs/Web/API/CSSFontFeatureValuesMap#instance_methods).

## Ví dụ

### Sử dụng cơ bản

#### CSS

```css
@font-feature-values "MonteCarlo" {
  @annotation {
    my-annotations: 1;
  }
}
```

#### JavaScript

```js
// look for the first stylesheet and the first cssRule in that sheet
const myRule = document.styleSheets[0].cssRules[0];
// check
if (myRule instanceof CSSFontFeatureValuesRule && myRule.annotation.size) {
  // do something with the annotation
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxRef("@font-feature-values","@annotation","#annotation")}}
- Ký pháp hàm {{cssxRef("font-variant-alternates","annotation()","#annotation")}}
- {{domxref("CSSFontFeatureValuesMap")}}
