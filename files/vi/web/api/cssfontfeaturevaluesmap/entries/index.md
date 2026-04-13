---
title: "CSSFontFeatureValuesMap: entries() method"
short-title: entries()
slug: Web/API/CSSFontFeatureValuesMap/entries
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.entries
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`entries()`** của các thực thể {{domxref("CSSFontFeatureValuesMap")}} trả về một đối tượng [map iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) mới chứa các cặp `[key, value]` cho mỗi khai báo trong `CSSFontFeatureValuesMap` này theo thứ tự chèn.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) có thể lặp mới.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau gán các mục vào biến `swashes` rồi ghi ra hai giá trị đầu tiên. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
// lấy các mục của swash
const swashes = myRule.swash.entries();
console.log(swashes.next().value); // ghi ra ["swishy", [1]]
console.log(swashes.next().value); // ghi ra ["swashy", [2]]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.entries()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/entries)
