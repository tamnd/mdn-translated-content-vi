---
title: "CSSFontFeatureValuesMap: values() method"
short-title: values()
slug: Web/API/CSSFontFeatureValuesMap/values
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.values
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`values()`** của các thực thể {{domxref("CSSFontFeatureValuesMap")}} trả về một đối tượng [map iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) mới chứa các cặp `[key, value]` cho mỗi khai báo trong `CSSFontFeatureValuesMap` này theo thứ tự chèn.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) có thể lặp mới.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau gán các giá trị vào biến `swashValues` rồi ghi ra hai giá trị đầu tiên. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
// lấy các giá trị của swash
const swashValues = myRule.swash.values();
console.log(swashValues.next().value); // ghi ra [1]
console.log(swashValues.next().value); // ghi ra [2]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.values()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/values)
