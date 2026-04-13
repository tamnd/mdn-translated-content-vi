---
title: CSSFontPaletteValuesRule.basePalette
slug: Web/API/CSSFontPaletteValuesRule/basePalette
page-type: web-api-instance-property
browser-compat: api.CSSFontPaletteValuesRule.basePalette
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`basePalette`** của giao diện {{domxref("CSSFontPaletteValuesRule")}} trả về bảng màu cơ sở liên quan đến quy tắc.

## Giá trị

Chuỗi. Một trong các giá trị sau:

- `light`
  - : Chỉ định bảng màu ánh sáng đầu tiên trong phông chữ, được bình thường hóa bởi nhà phát triển phông chữ là có màu sáng và hoạt động tốt trên nền tối.
- `dark`
  - : Chỉ định bảng màu tối đầu tiên trong phông chữ, được bình thường hóa bởi nhà phát triển phông chữ là có màu tối và hoạt động tốt trên nền sáng.
- Số nguyên không âm
  - : Chỉ định bảng màu theo chỉ mục của nó trong phông chữ.

## Ví dụ

### Đọc bảng màu cơ sở

Ví dụ này định nghĩa một số quy tắc `@font-palette-values` và trong JavaScript, đọc thuộc tính `basePalette`:

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
console.log(fontPaletteValuesRule.basePalette); // "1"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
