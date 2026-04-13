---
title: "CSSFontFeatureValuesMap: [Symbol.iterator]() method"
short-title: "[Symbol.iterator]()"
slug: Web/API/CSSFontFeatureValuesMap/Symbol.iterator
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.@@iterator
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`[Symbol.iterator]()`** của giao diện {{domxref("CSSFontFeatureValuesMap")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép các iterator tích hợp sẵn được sử dụng bởi hầu hết các cú pháp mong đợi iterable, chẳng hạn như [spread syntax](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), là chính đối tượng iterator.

## Cú pháp

```js-nolint
iterator[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), là chính đối tượng iterator.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau sử dụng iterator tích hợp sẵn của `CSSFontFeatureValuesMap` để ghi ra các giá trị bằng vòng lặp `for...of`. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
for (const value of myRule.swash.keys()) {
  console.log(value);
}
// Ghi ra: "swishy", "swashy"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Iterator.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.iterator)
- {{jsxref("Iterator")}}
