---
title: "CSSFontFeatureValuesMap: set() method"
short-title: set()
slug: Web/API/CSSFontFeatureValuesMap/set
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.set
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`set()`** của các thực thể {{domxref("CSSFontFeatureValuesMap")}} thêm một mục mới với khóa và giá trị được chỉ định vào `CSSFontFeatureValuesMap` này, hoặc cập nhật mục hiện có nếu khóa đã tồn tại.

## Cú pháp

```js-nolint
set(key, value)
```

### Tham số

- `key`
  - : Khóa của mục cần thêm hoặc sửa đổi trong đối tượng `CSSFontFeatureValuesMap`. Có thể là bất kỳ giá trị nào.
- `value`
  - : Giá trị của mục cần thêm hoặc sửa đổi trong đối tượng `CSSFontFeatureValuesMap`. Phải là một số nguyên khớp với `index` của tính năng phông chữ thay thế.

### Giá trị trả về

Đối tượng `CSSFontFeatureValuesMap`.

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau cập nhật giá trị cho `swashy` và thêm khai báo thứ ba. Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
function logSwashes(value, key) {
  console.log(`('${key}') = ${value}`);
}
// lấy các quy tắc
const myRule = document.styleSheets[0].cssRules[0];
// ghi ra các swash hiện tại
myRule.swash.forEach(logSwashes); // ghi ra "('swishy') = 1", "('swashy') = 2"

// cập nhật swash với khóa swashy
myRule.swash.set("swashy", 3);
myRule.swash.forEach(logSwashes); // ghi ra "('swishy') = 1", "('swashy') = 3"

// thêm swash mới với khóa swooshy
myRule.swash.set("swooshy", 2);
myRule.swash.forEach(logSwashes); // ghi ra "('swishy') = 1", "('swooshy') = 2", "('swashy') = 3"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.keys()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/set)
