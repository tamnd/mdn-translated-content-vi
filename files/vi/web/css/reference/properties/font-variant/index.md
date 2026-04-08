---
title: font-variant
slug: Web/CSS/Reference/Properties/font-variant
page-type: css-shorthand-property
browser-compat: css.properties.font-variant
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`font-variant`** cho phép bạn đặt tất cả các biến thể phông chữ cho một phông chữ.

Bạn cũng có thể đặt các giá trị `<font-variant-css2>` của `font-variant` được định nghĩa trong CSS Cấp độ 2.1, (tức là `normal` hoặc `small-caps`), bằng cách sử dụng thuộc tính viết tắt {{cssxref("font")}}.

{{InteractiveExample("CSS Demo: font-variant")}}

```css interactive-example-choice
font-variant: normal;
```

```css interactive-example-choice
font-variant: no-common-ligatures proportional-nums;
```

```css interactive-example-choice
font-variant: common-ligatures tabular-nums;
```

```css interactive-example-choice
font-variant: small-caps slashed-zero;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>Difficult waffles</p>
    <table>
      <tbody>
        <tr>
          <td><span class="tabular">0O</span></td>
        </tr>
        <tr>
          <td><span class="tabular">3.14</span></td>
        </tr>
        <tr>
          <td><span class="tabular">2.71</span></td>
        </tr>
      </tbody>
    </table>
  </div>
</section>
```

```css interactive-example
@font-face {
  font-family: "Fira Sans";
  src:
    local("FiraSans-Regular"),
    url("/shared-assets/fonts/FiraSans-Regular.woff2") format("woff2");
  font-weight: normal;
  font-style: normal;
}

section {
  font-family: "Fira Sans", sans-serif;
  margin-top: 10px;
  font-size: 1.5em;
}

#example-element table {
  margin-left: auto;
  margin-right: auto;
}

.tabular {
  border: 1px solid;
}
```

## Thuộc tính cấu thành

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("font-variant-alternates")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-numeric")}}
- {{cssxref("font-variant-position")}}

## Cú pháp

```css
font-variant: small-caps;
font-variant: common-ligatures small-caps;

/* Giá trị toàn cục */
font-variant: inherit;
font-variant: initial;
font-variant: revert;
font-variant: revert-layer;
font-variant: unset;
```

### Giá trị

- `normal`
  - : Chỉ định kiểu chữ bình thường. Mỗi thuộc tính dài hạn có giá trị khởi tạo là `normal`.

- `none`
  - : Đặt giá trị của {{cssxref("font-variant-ligatures")}} thành `none` và các giá trị của các thuộc tính dài hạn khác thành `normal`, giá trị khởi tạo của chúng.

- `<common-lig-values>`, `<discretionary-lig-values>`, `<historical-lig-values>`, `<contextual-alt-values>`
  - : Chỉ định các từ khóa liên quan đến thuộc tính dài hạn {{cssxref("font-variant-ligatures")}}. Các giá trị có thể là `common-ligatures`, `no-common-ligatures`, `discretionary-ligatures`, `no-discretionary-ligatures`, `historical-ligatures`, `no-historical-ligatures`, `contextual`, và `no-contextual`.

- `stylistic()`, `historical-forms`, `styleset()`, `character-variant()`, `swash()`, `ornaments()`, `annotation()`
  - : Chỉ định các từ khóa và hàm liên quan đến thuộc tính dài hạn {{cssxref("font-variant-ligatures")}}.

- `small-caps`, `all-small-caps`, `petite-caps`, `all-petite-caps`, `unicase`, `titling-caps`
  - : Chỉ định các từ khóa và hàm liên quan đến thuộc tính dài hạn {{cssxref("font-variant-caps")}}. Giá trị `small-caps` là giá trị biến thể phông chữ không phải `normal` duy nhất hợp lệ trong thuộc tính viết tắt {{cssxref("font")}}.

- `<numeric-figure-values>`, `<numeric-spacing-values>`, `<numeric-fraction-values>`, `ordinal`, `slashed-zero`
  - : Chỉ định các từ khóa liên quan đến thuộc tính dài hạn {{cssxref("font-variant-numeric")}}. Các giá trị có thể là `lining-nums`, `oldstyle-nums`, `proportional-nums`, `tabular-nums`, `diagonal-fractions`, `stacked-fractions`, `ordinal`, và `slashed-zero`.

- `<east-asian-variant-values>`, `<east-asian-width-values>`, `ruby`
  - : Chỉ định các từ khóa liên quan đến thuộc tính dài hạn {{cssxref("font-variant-east-asian")}}. Các giá trị có thể là `jis78`, `jis83`, `jis90`, `jis04`, `simplified`, `traditional`, `full-width`, `proportional-width`, và `ruby`.

- `sub`, `super`
  - : Chỉ định các từ khóa và hàm liên quan đến thuộc tính dài hạn {{cssxref("font-variant-position")}}.

- `text`, `emoji`, `unicode`
  - : Chỉ định các từ khóa và hàm liên quan đến thuộc tính dài hạn {{cssxref("font-variant-emoji")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt biến thể phông chữ small-caps

#### HTML

```html
<p class="normal">Firefox rocks!</p>
<p class="small">Firefox rocks!</p>
```

#### CSS

```css
p.normal {
  font-variant: normal;
}
p.small {
  font-variant: small-caps;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting the small-caps font variant') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-transform")}}
- {{cssxref("text-combine-upright")}}
- {{cssxref("text-orientation")}}
- SVG {{SVGAttr("font-variant")}} attribute
