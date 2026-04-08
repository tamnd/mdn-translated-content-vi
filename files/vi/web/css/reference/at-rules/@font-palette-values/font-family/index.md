---
title: font-family
slug: Web/CSS/Reference/At-rules/@font-palette-values/font-family
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.font-palette-values.font-family
sidebar: cssref
---

[Descriptor](/en-US/docs/Glossary/CSS_Descriptor) **`font-family`** của [@font-palette-values](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values) được dùng để chỉ định font-family nào sẽ áp dụng các giá trị palette. Tên này cần khớp chính xác với các giá trị được dùng khi đặt CSS [font-family](/en-US/docs/Web/CSS/Reference/Properties/font-family).

## Cú pháp

```css
@font-palette-values --Dark-mode {
  font-family: "Bungee Spice";
  /* các thiết lập palette khác tiếp theo */
}
```

Các giá trị palette khác theo sau chỉ áp dụng cho font-family được chỉ định. Bạn có thể tạo các [@font-palette-values](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values) cho các font-family khác bằng cách dùng cùng [&lt;dashed-ident&gt;s](/en-US/docs/Web/CSS/Reference/Values/dashed-ident). Điều này có nghĩa là nếu bạn có nhiều Color Font, bạn có thể dùng cùng một định danh cho mỗi font.

### Giá trị

- `<family-name>`
  - : Chỉ định tên của [font-family](/en-US/docs/Web/CSS/Reference/Properties/font-family).

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng tên family khớp nhau

Trong ví dụ này, khi descriptor `font-family` được dùng trong at-rule [@font-palette-values](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values), cùng giá trị đó được dùng cho `font-family`, như khi nó được khai báo.

#### HTML

```html
<h2>This is spicy</h2>
<h2 class="extra-spicy">This is extra hot & spicy</h2>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Bungee+Spice";
@font-palette-values --bungee-extra-spicy {
  font-family: "Bungee Spice";
  override-colors:
    0 darkred,
    1 red;
}

h2 {
  font-family: "Bungee Spice", fantasy;
}

h2.extra-spicy {
  font-palette: --bungee-extra-spicy;
}
```

#### Kết quả

{{EmbedLiveSample("Using matching family names")}}

### Sử dụng cùng định danh palette cho nhiều font-family

Trong ví dụ này, hai at-rule [@font-palette-values](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values) được đặt cho hai font-family, nhưng cả hai at-rule đều sử dụng cùng định danh dashed-ident là `--Dark-Mode`. Điều này giúp đặt thuộc tính [font-palette](/en-US/docs/Web/CSS/Reference/Properties/font-palette) cho nhiều phần tử, `h1` và `h2` trong trường hợp này, cùng một lúc. Điều này có thể hữu ích khi bạn muốn cập nhật màu font để phù hợp với thương hiệu của trang web.

```css
@font-palette-values --Dark-Mode {
  font-family: "Bungee Spice";
  /* palette settings for Bungee Spice */
}

@font-palette-values --Dark-Mode {
  font-family: "Bixa";
  /* palette settings for Bixa */
}

h1,
h2 {
  font-palette: --Dark-Mode;
}

h1 {
  font-family: "Bungee Spice", fantasy;
}

h2 {
  font-family: "Bixa", fantasy;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-face/font-family", "font-family")}}
- {{cssxref("@font-palette-values")}}
- Descriptor {{cssxref("@font-palette-values/override-colors", "override-colors")}}
- Thuộc tính {{cssxref("font-palette")}}
- {{domxref("CSSFontPaletteValuesRule.fontFamily")}}
