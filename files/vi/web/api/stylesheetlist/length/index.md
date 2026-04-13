---
title: "StyleSheetList: thuộc tính length"
short-title: length
slug: Web/API/StyleSheetList/length
page-type: web-api-instance-property
browser-compat: api.StyleSheetList.length
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("StyleSheetList")}} trả về số lượng đối tượng {{domxref("CSSStyleSheet")}} trong bộ sưu tập.

## Giá trị

Một số nguyên chỉ số lượng item trong bộ sưu tập.

## Ví dụ

Trong ví dụ sau, `length` được in ra console và cũng được dùng trong vòng lặp for để in ra mỗi đối tượng {{domxref("CSSStyleSheet")}} riêng lẻ ra console.

```js
let length = document.styleSheets.length;
console.log(length);

for (let i = 0; i < length; i++) {
  console.log(document.styleSheets[i]);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
