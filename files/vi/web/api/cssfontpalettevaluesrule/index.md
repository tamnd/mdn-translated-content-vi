---
title: CSSFontPaletteValuesRule
slug: Web/API/CSSFontPaletteValuesRule
page-type: web-api-interface
browser-compat: api.CSSFontPaletteValuesRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSFontPaletteValuesRule`** đại diện cho quy tắc at-rule {{cssxref("@font-palette-values")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên của nó {{domxref("CSSRule")}}._

- {{domxref("CSSFontPaletteValuesRule.name")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị tên của bảng màu phông chữ.
- {{domxref("CSSFontPaletteValuesRule.fontFamily")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết bộ phông chữ mà quy tắc áp dụng.
- {{domxref("CSSFontPaletteValuesRule.basePalette")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị bảng màu cơ sở liên quan đến quy tắc này.
- {{domxref("CSSFontPaletteValuesRule.overrideColors")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị màu của bảng màu cơ sở được ghi đè và các giá trị màu mới.

## Phương thức phiên bản

_Không có phương thức nào cụ thể; kế thừa các phương thức từ tổ tiên của nó {{domxref("CSSRule")}}._

## Ví dụ

### Đọc các giá trị `@font-palette-values` liên quan

Ví dụ này định nghĩa `@font-palette-values` trong stylesheet và sau đó ghi chú nó bằng JavaScript.

#### HTML

```html
<div class="hat">
  <div class="emoji">🎩</div>
</div>
<div class="logs"></div>
```

#### CSS

```css
@import url(https://fonts.googleapis.com/css2?family=Boogaloo&display=swap);

.hat {
  font-family: "Boogaloo";
  font-palette: --melting-pot;
  font-size: 9rem;
}

@font-palette-values --melting-pot {
  font-family: "Boogaloo";
  base-palette: 2;
  override-colors:
    0 hotpink,
    1 cyan,
    3 green;
}
```

#### JavaScript

```js
const rules = document.styleSheets[document.styleSheets.length - 1].cssRules;
const fontPaletteValuesRule = [...rules].find(
  (r) => r instanceof CSSFontPaletteValuesRule,
);
const logs = document.querySelector(".logs");

if (fontPaletteValuesRule) {
  logs.innerHTML = `<div><code>name:</code> ${fontPaletteValuesRule.name}</div>
<div><code>font-family:</code> ${fontPaletteValuesRule.fontFamily}</div>
<div><code>base-palette:</code> ${fontPaletteValuesRule.basePalette}</div>
<div><code>override-colors:</code> ${fontPaletteValuesRule.overrideColors}</div>`;
}
```

#### Kết quả

{{EmbedLiveSample("Reading_associated_@font-palette-values_values", "100", "250")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
