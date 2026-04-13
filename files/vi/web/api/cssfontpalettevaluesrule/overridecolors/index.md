---
title: CSSFontPaletteValuesRule.overrideColors
slug: Web/API/CSSFontPaletteValuesRule/overrideColors
page-type: web-api-instance-property
browser-compat: api.CSSFontPaletteValuesRule.overrideColors
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`overrideColors`** của giao diện {{domxref("CSSFontPaletteValuesRule")}} trả về một chuỗi với danh sách chỉ mục màu và các giá trị màu mới để ghi đè.

## Giá trị

Chuỗi.

## Ví dụ

### Đọc màu được ghi đè

Ví dụ này đọc thuộc tính `overrideColors` của một quy tắc `@font-palette-values`:

```css
@import url(https://fonts.googleapis.com/css2?family=Boogaloo&display=swap);

@font-palette-values --Reds {
  font-family: Boogaloo;
  base-palette: 2;
  override-colors:
    0 red,
    1 orange,
    2 blue;
}
```

```js
const rules = document.styleSheets[document.styleSheets.length - 1].cssRules;
const fontPaletteValuesRule = [...rules].find(
  (r) => r instanceof CSSFontPaletteValuesRule,
);
console.log(fontPaletteValuesRule.overrideColors); // "0 red, 1 orange, 2 blue"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
