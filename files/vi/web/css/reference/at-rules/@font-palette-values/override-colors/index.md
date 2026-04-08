---
title: override-colors
slug: Web/CSS/Reference/At-rules/@font-palette-values/override-colors
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-palette-values.override-colors
sidebar: cssref
---

[Descriptor](/en-US/docs/Glossary/CSS_Descriptor) [CSS](/en-US/docs/Web/CSS) **`override-colors`** được dùng để ghi đè màu trong [base-palette](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values/base-palette) đã chọn cho một font màu.

## Cú pháp

```css
/* cú pháp cơ bản */
override-colors: <index of color> <color>;

/* sử dụng tên màu */
override-colors: 0 red;

/* sử dụng hex-color */
override-colors: 0 #ff0000;

/* sử dụng rgb */
override-colors: 0 rgb(255 0 0);

/* ghi đè nhiều màu */
override-colors:
  0 red,
  1 green,
  2 blue;
```

[Descriptor](/en-US/docs/Glossary/CSS_Descriptor) `override-colors` nhận một danh sách phân cách bằng dấu phẩy gồm chỉ mục màu và giá trị màu mới.

Chỉ mục màu bắt đầu từ 0 và bất kỳ [giá trị màu](/en-US/docs/Web/CSS/Reference/Values/color_value) nào đều có thể sử dụng.

Với mỗi cặp chỉ mục-màu, màu có chỉ mục trong [base-palette](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values/base-palette) được chỉ định sẽ bị ghi đè. Nếu font màu không có màu tại chỉ mục được chỉ định, nó sẽ bị bỏ qua.

### Giá trị

- `[ <integer [0,∞]> <absolute-color-base> ]`
  - : Chỉ định chỉ mục của một màu trong [base-palette](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values/base-palette) và màu để ghi đè lên đó.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thay đổi màu của emoji

Ví dụ này cho thấy cách ghi đè màu trong font màu [Noto Color Emoji](https://fonts.google.com/noto/specimen/Noto+Color+Emoji) để phù hợp với thương hiệu của trang web.

#### HTML

```html
<section class="hats">
  <div class="hat">
    <h2>Original Hat</h2>
    <div class="emoji">🎩</div>
  </div>
  <div class="hat">
    <h2>Red Hat</h2>
    <div class="emoji red-hat">🎩</div>
  </div>
</section>
```

#### CSS

```css hidden
.hats {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
```

```css
@font-face {
  font-family: "Noto Color Emoji";
  font-style: normal;
  font-weight: normal;
  src: url("https://fonts.gstatic.com/l/font?kit=Yq6P-KqIXTD0t4D9z1ESnKM3-HpFabts6diywYkdG3gjD0U&skey=a373f7129eaba270&v=v24")
    format("woff2");
}

.emoji {
  font-family: "Noto Color Emoji", emoji;
  font-size: 3rem;
}
@font-palette-values --red {
  font-family: "Noto Color Emoji";
  override-colors:
    0 rgb(74 11 0),
    1 rgb(149 22 1),
    2 rgb(183 27 1),
    3 rgb(193 28 1),
    4 rgb(230 34 1);
}
.red-hat {
  font-palette: --red;
}
```

#### Kết quả

{{EmbedLiveSample("Changing colors of emojis")}}

### Thay đổi một màu trong một base-palette thay thế

Sử dụng [Rocher Color Font](https://www.harbortype.com/fonts/rocher-color/), ví dụ này cho thấy cách ghi đè một màu trong font.

#### HTML

```html
<h2 class="normal-palette">Normal Palette</h2>
<h2 class="override-palette">Override Palette</h2>
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
@font-palette-values --override-palette {
  font-family: "Rocher";
  base-palette: 3;
}
@font-palette-values --override-palette {
  font-family: "Rocher";
  base-palette: 3;
  override-colors: 0 rebeccapurple;
}
.normal-palette {
  font-palette: --normal-palette;
}
.override-palette {
  font-palette: --override-palette;
}
```

#### Kết quả

Ví dụ này cho thấy rằng trong `base-palette` `3`, màu tại chỉ mục 0 bị ghi đè bằng `rebeccapurple`.

![Ví dụ cho thấy base-palette và base-palette với 1 màu bị ghi đè](override-base-palette-color.jpg)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-palette-values")}}
- {{cssxref("@font-palette-values/base-palette", "base-palette")}}
- {{cssxref("@font-palette-values/font-family", "font-family")}}
- {{cssxref("font-palette")}}
- {{domxref("CSSFontPaletteValuesRule.overrideColors")}}
