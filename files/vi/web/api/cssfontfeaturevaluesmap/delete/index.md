---
title: "CSSFontFeatureValuesMap: delete() method"
short-title: delete()
slug: Web/API/CSSFontFeatureValuesMap/delete
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap.delete
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Phương thức **`delete()`** của giao diện {{domxref("CSSFontFeatureValuesMap")}} xóa khai báo CSS có thuộc tính được chỉ định trong `CSSFontFeatureValuesMap`.

## Cú pháp

```js-nolint
delete(property)
```

### Tham số

- `property`
  - : Một định danh chỉ ra khai báo cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau xóa khai báo đầu tiên trong khối tính năng [`@swash`](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#swash). Ví dụ này sử dụng `@swash` nhưng cũng hoạt động với các [khối giá trị tính năng](/en-US/docs/Web/CSS/Reference/At-rules/@font-feature-values#feature_value_blocks) khác.

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
myRule.swash.delete("swishy");
console.log(myRule.swash.has("swishy")); // ghi ra false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Map.prototype.delete()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/delete)
