---
title: "CSSFontFeatureValuesMap: clear() method"
short-title: clear()
slug: Web/API/CSSFontFeatureValuesMap/clear
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.clear
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`clear()`** của giao diện {{domxref("CSSFontFeatureValuesMap")}} xóa tất cả các khai báo trong `CSSFontFeatureValuesMap`.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau xóa tất cả các khai báo trong khối tính năng [`@swash`](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#swash). Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
myRule.swash.clear();
console.log(myRule.swash.size); // ghi ra 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.clear()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/clear)
