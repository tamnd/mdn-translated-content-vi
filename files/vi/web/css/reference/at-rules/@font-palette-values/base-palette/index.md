---
title: base-palette
slug: Web/CSS/Reference/At-rules/@font-palette-values/base-palette
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-palette-values.base-palette
sidebar: cssref
---

[Descriptor](/en-US/docs/Glossary/CSS_Descriptor) [CSS](/en-US/docs/Web/CSS) **`base-palette`** được dùng để chỉ định tên hoặc chỉ mục của một palette được định nghĩa sẵn để tạo palette mới. Nếu `base-palette` được chỉ định không tồn tại, palette được định nghĩa tại chỉ mục 0 sẽ được sử dụng.

## Cú pháp

```css
@font-palette-values --one {
  base-palette: 1;
}
```

[Descriptor](/en-US/docs/Glossary/CSS_Descriptor) `base-palette` được chỉ định bằng chỉ mục bắt đầu từ 0 của các palette được tạo bởi nhà thiết kế font.

### Giá trị

- `<index>`
  - : Chỉ định chỉ mục của palette được định nghĩa sẵn cần sử dụng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thay đổi palette mặc định trong một font

Sử dụng [Rocher Color Font](https://www.harbortype.com/fonts/rocher-color/), ví dụ này cho thấy hai trường hợp chuyển đổi palette mặc định trong font sang một palette thay thế được tạo bởi nhà thiết kế font.

#### HTML

```html
<h2>default base-palette</h2>
<h2 class="two">base-palette at index 2</h2>
<h2 class="five">base-palette at index 5</h2>
```

#### CSS

```css
@font-face {
  font-family: "Rocher";
  src: url("[path-to-font]/RocherColorGX.woff2") format("woff2");
}

h2 {
  font-family: "Rocher", fantasy;
}

@font-palette-values --two {
  font-family: "Rocher";
  base-palette: 2;
}

@font-palette-values --five {
  font-family: "Rocher";
  base-palette: 5;
}

.two {
  font-palette: --two;
}

.five {
  font-palette: --five;
}
```

#### Kết quả

![Ví dụ cho thấy 3 base-palette khác nhau của font màu Rocher](./rocher-color-font-alt-base-palettes.jpg)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-palette-values")}}
- Descriptor {{cssxref("@font-palette-values/font-family", "font-family")}}
- Descriptor {{cssxref("@font-palette-values/override-colors", "override-colors")}}
- Thuộc tính {{cssxref("font-palette")}}
- {{domxref("CSSFontPaletteValuesRule.basePalette")}}
