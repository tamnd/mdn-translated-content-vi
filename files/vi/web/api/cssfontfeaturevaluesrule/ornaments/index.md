---
title: "CSSFontFeatureValuesRule: thuộc tính ornaments"
short-title: ornaments
slug: Web/API/CSSFontFeatureValuesRule/ornaments
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesRule.ornaments
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Thuộc tính chỉ đọc **ornaments** của giao diện {{domXRef("CSSFontFeatureValuesRule")}} chứa một đối tượng {{domXRef("CSSFontFeatureValuesMap")}} đại diện cho [định danh do người dùng xác định](/en-US/docs/Web/CSS/Reference/Values/custom-ident) và [chỉ mục tính năng](/en-US/docs/Web/CSS/Reference/Properties/font-feature-settings#optional_value) cho một font biến đổi hỗ trợ {{CSSXRef("font-variant-alternates", "ornaments()", "#ornaments")}}.

## Giá trị

Một đối tượng {{domxref("CSSFontFeatureValuesMap")}}.

Mặc dù bản thân thuộc tính `ornaments` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFontFeatureValuesMap`, bạn vẫn có thể gán trực tiếp cho thuộc tính `ornaments`. Bạn cũng có thể sửa đổi các giá trị của `ornaments` bằng cách sử dụng [các phương thức phiên bản của `CSSFontFeatureValuesMap`](/en-US/docs/Web/API/CSSFontFeatureValuesMap#instance_methods).

## Ví dụ

### Sử dụng cơ bản

#### CSS

```css
@font-feature-values "MonteCarlo" {
  @ornaments {
    my-ornaments: 1;
  }
}
```

#### JavaScript

```js
// look for the first stylesheet and the first cssRule in that sheet
const myRule = document.styleSheets[0].cssRules[0];
// check
if (myRule instanceof CSSFontFeatureValuesRule && myRule.ornaments.size) {
  // do something with the ornaments
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxRef("@font-feature-values","@ornaments","#ornaments")}}
- Ký pháp hàm {{cssxRef("font-variant-alternates","ornaments()","#ornaments")}}
- {{domxref("CSSFontFeatureValuesMap")}}
