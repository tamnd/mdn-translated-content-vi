---
title: "CSSFontFeatureValuesMap: size property"
short-title: size
slug: Web/API/CSSFontFeatureValuesMap/size
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.size
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("CSSFontFeatureValuesMap")}} trả về một số nguyên dương chứa kích thước của đối tượng `CSSFontFeatureValuesMap`.

## Giá trị

Một số nguyên dương.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau xuất ra một số nguyên biểu thị số lượng khai báo trong khối tính năng [`@swash`](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#swash). Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

#### CSS

```css
@font-feature-values "MonteCarlo" {
  @swash {
    swishy: 1;
    swashy: 2;
  }
}
```

#### JavaScript

```js
// lấy các quy tắc
const myRule = document.styleSheets[0].cssRules[0];
console.log(myRule.swash.size); // ghi ra 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
