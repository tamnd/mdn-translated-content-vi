---
title: "CSSFontFeatureValuesMap: forEach() method"
short-title: forEach()
slug: Web/API/CSSFontFeatureValuesMap/forEach
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.forEach
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`forEach()`** của các thực thể {{domxref("CSSFontFeatureValuesMap")}} thực thi một hàm được cung cấp một lần cho mỗi cặp khóa/giá trị trong map này, theo thứ tự chèn.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm được thực thi cho mỗi mục trong map. Hàm được gọi với các đối số sau:
    - `value`
      - : Giá trị của mỗi lần lặp.
    - `key`
      - : Khóa của mỗi lần lặp.
    - `map`
      - : Map đang được lặp.
- `thisArg` {{optional_inline}}
  - : Giá trị sử dụng làm `this` khi thực thi `callbackFn`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau ghi ra `key` và `value` cho mỗi mục trong quy tắc `@swash`. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
// hàm được dùng làm hàm gọi lại
function logSwashes(value, key, map) {
  console.log(`('${key}') = ${value}`);
}
// lấy các quy tắc
const myRule = document.styleSheets[0].cssRules[0];
myRule.swash.forEach(logSwashes);
// ghi ra:
// "('swishy') = 1"
// "('swashy') = 2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.forEach()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/forEach)
