---
title: "CSSFontFeatureValuesMap: has() method"
short-title: has()
slug: Web/API/CSSFontFeatureValuesMap/has
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.has
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`has()`** của giao diện {{domxref("CSSFontFeatureValuesMap")}} trả về một giá trị boolean cho biết liệu có mục nào với khóa được chỉ định tồn tại trong `CSSFontFeatureValuesMap` này hay không.

## Cú pháp

```js-nolint
has(property)
```

### Tham số

- `key`
  - : Khóa của giá trị cần trả về từ đối tượng `CSSFontFeatureValuesMap`.

### Giá trị trả về

Giá trị được liên kết với khóa được chỉ định trong đối tượng `CSSFontFeatureValuesMap`. Nếu không tìm thấy khóa, trả về [undefined](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined).

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau trả về `true` hoặc `false` tùy theo quy tắc `@swash` có chứa `key` hay không. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
console.log(myRule.swash.has("swishy")); // ghi ra true
console.log(myRule.swash.has("swooshy")); // ghi ra false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.has()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/has)
