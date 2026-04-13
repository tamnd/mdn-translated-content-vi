---
title: CSSFontPaletteValuesRule.name
slug: Web/API/CSSFontPaletteValuesRule/name
page-type: web-api-instance-property
browser-compat: api.CSSFontPaletteValuesRule.name
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("CSSFontPaletteValuesRule")}} trả về tên của quy tắc. Tên này bắt đầu bằng hai dấu gạch nối, đây là quy ước tiêu chuẩn cho các tên CSS tùy chỉnh.

## Giá trị

Chuỗi bắt đầu bằng hai dấu gạch nối.

## Ví dụ

### Đọc tên quy tắc

```css
@import url(https://fonts.googleapis.com/css2?family=Boogaloo&display=swap);

@font-palette-values --Grays {
  font-family: Boogaloo;
  base-palette: 1;
}
```

```js
const rules = document.styleSheets[document.styleSheets.length - 1].cssRules;
const fontPaletteValuesRule = [...rules].find(
  (r) => r instanceof CSSFontPaletteValuesRule,
);
console.log(fontPaletteValuesRule.name); // "--Grays"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
