---
title: "CSSFontFeatureValuesMap: get() method"
short-title: get()
slug: Web/API/CSSFontFeatureValuesMap/get
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.get
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`get()`** của giao diện {{domxref("CSSFontFeatureValuesMap")}} trả về giá trị tương ứng với khóa trong `CSSFontFeatureValuesMap` này, hoặc `undefined` nếu không có.

## Cú pháp

```js-nolint
get(property)
```

### Tham số

- `key`
  - : Khóa của giá trị cần trả về từ đối tượng `CSSFontFeatureValuesMap`.

### Giá trị trả về

Trả về `true` nếu có một mục với khóa được chỉ định trong đối tượng `CSSFontFeatureValuesMap`; nếu không, trả về `false`.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau lấy các giá trị khớp với các `key` trong quy tắc `@swash`. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
console.log(myRule.swash.get("swishy")); // ghi ra [1]
console.log(myRule.swash.get("swashy")); // ghi ra [2]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.get()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/get)
