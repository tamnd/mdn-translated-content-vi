---
title: "@font-palette-values"
slug: Web/CSS/Reference/At-rules/@font-palette-values
page-type: css-at-rule
browser-compat: css.at-rules.font-palette-values
sidebar: cssref
---

At-rule [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) **`@font-palette-values`** cho phép bạn tùy chỉnh các giá trị mặc định của [font-palette](/en-US/docs/Web/CSS/Reference/Properties/font-palette) được tạo bởi nhà thiết kế font.

## Cú pháp

```css
@font-palette-values --identifier {
  font-family: "Bixa";
}
.my-class {
  font-palette: --identifier;
}
```

[&lt;dashed-ident&gt;](/en-US/docs/Web/CSS/Reference/Values/dashed-ident) là định danh do người dùng xác định, mặc dù trông giống như [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) nhưng hoạt động theo cách khác và không được bọc trong [hàm CSS var()](/en-US/docs/Web/CSS/Reference/Values/var).

### Các descriptor

- {{cssxref("@font-palette-values/base-palette", "base-palette")}}
  - : Chỉ định tên hoặc chỉ mục của base-palette, được tạo bởi nhà thiết kế font, để sử dụng.
- {{cssxref("@font-palette-values/font-family", "font-family")}}
  - : Chỉ định tên font-family mà palette này có thể áp dụng. Tên `font-family` là bắt buộc để quy tắc `@font-palette-values` có hiệu lực.
- {{cssxref("@font-palette-values/override-colors", "override-colors")}}
  - : Chỉ định các màu trong base palette cần ghi đè.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ghi đè màu trong một palette hiện có

Ví dụ này cho thấy cách bạn có thể thay đổi một số hoặc tất cả màu trong một font màu.

#### HTML

```html
<p>default colors</p>
<p class="alternate">alternate colors</p>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Bungee+Spice";
p {
  font-family: "Bungee Spice", fantasy;
  font-size: 2rem;
}
@font-palette-values --Alternate {
  font-family: "Bungee Spice";
  override-colors:
    0 #00ffbb,
    1 #007744;
}
.alternate {
  font-palette: --Alternate;
}
```

#### Kết quả

Khi ghi đè màu của palette thông thường hoặc base-palette tại chỉ mục 0, bạn không cần khai báo base-palette nào sẽ sử dụng. Điều này chỉ cần thực hiện khi ghi đè một base-palette khác. Nếu bạn đang ghi đè tất cả màu thì cũng không cần chỉ định base-palette để sử dụng.

{{EmbedLiveSample("Overriding colors in an existing palette")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("font-palette", "font-palette")}}
- Descriptor {{cssxref("@font-palette-values/font-family", "font-family")}}
- Descriptor {{cssxref("@font-palette-values/base-palette", "base-palette")}}
- Descriptor {{cssxref("@font-palette-values/override-colors", "override-colors")}}
- {{domxref("CSSFontPaletteValuesRule")}}
