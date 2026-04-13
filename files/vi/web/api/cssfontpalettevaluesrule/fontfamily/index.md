---
title: CSSFontPaletteValuesRule.fontFamily
slug: Web/API/CSSFontPaletteValuesRule/fontFamily
page-type: web-api-instance-property
browser-compat: api.CSSFontPaletteValuesRule.fontFamily
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`fontFamily`** của giao diện {{domxref("CSSFontPaletteValuesRule")}} liệt kê các bộ phông chữ mà quy tắc áp dụng. Các phông chữ phải là các phông chữ màu.

## Giá trị

Chuỗi chứa danh sách phông chữ được phân cách bằng dấu phẩy.

## Ví dụ

### Đọc họ phông chữ liên quan

Ví dụ này định nghĩa một số quy tắc `@font-palette-values` và trong JavaScript, đọc thuộc tính `fontFamily`:

```css
@import url(https://fonts.googleapis.com/css2?family=Boogaloo&display=swap);

@font-palette-values --Grays {
  font-family: Boogaloo;
  base-palette: 1;
}

@font-palette-values --Reds {
  font-family: Boogaloo;
  base-palette: 2;
}

@font-palette-values --Blues {
  font-family: Boogaloo;
  base-palette: 3;
}
```

```js
const rules = document.styleSheets[document.styleSheets.length - 1].cssRules;
const fontPaletteValuesRule = [...rules].find(
  (r) => r instanceof CSSFontPaletteValuesRule,
);
console.log(fontPaletteValuesRule.fontFamily); // "Boogaloo"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
