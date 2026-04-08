---
title: font-variant-caps
slug: Web/CSS/Reference/Properties/font-variant-caps
page-type: css-property
browser-compat: css.properties.font-variant-caps
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-variant-caps`** kiểm soát việc sử dụng các glyph thay thế dùng cho chữ hoa nhỏ, chữ hoa petite, hoặc cho tiêu đề.

{{InteractiveExample("CSS Demo: font-variant-caps")}}

```css interactive-example-choice
font-variant-caps: normal;
```

```css interactive-example-choice
font-variant-caps: small-caps;
```

```css interactive-example-choice
font-variant-caps: all-small-caps;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>Difficult waffles</p>
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
```

## Cú pháp

```css
/* Giá trị từ khóa */
font-variant-caps: normal;
font-variant-caps: small-caps;
font-variant-caps: all-small-caps;
font-variant-caps: petite-caps;
font-variant-caps: all-petite-caps;
font-variant-caps: unicase;
font-variant-caps: titling-caps;

/* Giá trị toàn cục */
font-variant-caps: inherit;
font-variant-caps: initial;
font-variant-caps: revert;
font-variant-caps: revert-layer;
font-variant-caps: unset;
```

Thuộc tính `font-variant-caps` được chỉ định bằng một giá trị từ khóa từ danh sách bên dưới. Trong mỗi trường hợp, nếu phông chữ không hỗ trợ giá trị OpenType, thì trình duyệt sẽ tổng hợp các glyph.

### Giá trị

- `normal`
  - : Hủy kích hoạt việc sử dụng các glyph thay thế.
- `small-caps`
  - : Kích hoạt hiển thị chữ hoa nhỏ (tính năng OpenType: `smcp`). Các glyph chữ hoa nhỏ thường sử dụng dạng chữ hoa nhưng được hiển thị với kích thước tương tự chữ thường.
- `all-small-caps`
  - : Kích hoạt hiển thị chữ hoa nhỏ cho cả chữ hoa và chữ thường (tính năng OpenType: `c2sc`, `smcp`).
- `petite-caps`
  - : Kích hoạt hiển thị chữ hoa petite (tính năng OpenType: `pcap`).
- `all-petite-caps`
  - : Kích hoạt hiển thị chữ hoa petite cho cả chữ hoa và chữ thường (tính năng OpenType: `c2pc`, `pcap`).
- `unicase`
  - : Kích hoạt hiển thị hỗn hợp chữ hoa nhỏ cho chữ hoa với chữ thường thông thường (tính năng OpenType: `unic`).
- `titling-caps`
  - : Kích hoạt hiển thị chữ hoa tiêu đề (tính năng OpenType: `titl`). Các glyph chữ hoa thường được thiết kế để dùng với chữ thường. Khi dùng trong các chuỗi tiêu đề toàn chữ hoa, chúng có thể trông quá nặng. Chữ hoa tiêu đề được thiết kế đặc biệt cho tình huống này.

## Mô tả

Khi một phông chữ nhất định bao gồm các glyph chữ hoa có nhiều kích thước khác nhau, thuộc tính này chọn ra các glyph phù hợp nhất. Nếu các glyph chữ hoa petite không có sẵn, chúng sẽ được hiển thị bằng các glyph chữ hoa nhỏ. Nếu những glyph này cũng không có, trình duyệt sẽ tổng hợp chúng từ các glyph chữ hoa.

Phông chữ đôi khi bao gồm các glyph đặc biệt cho các ký tự không phân biệt hoa thường (như dấu câu) để khớp tốt hơn với các ký tự viết hoa xung quanh chúng. Tuy nhiên, các glyph chữ hoa nhỏ không bao giờ được tổng hợp cho các ký tự không phân biệt hoa thường.

### Quy tắc theo ngôn ngữ

Thuộc tính này tính đến các quy tắc ánh xạ chữ hoa-thường theo ngôn ngữ. Ví dụ:

- Trong các ngôn ngữ Turkic, như tiếng Thổ Nhĩ Kỳ (tr), tiếng Azerbaijan (az), tiếng Tatar Crimea (crh), tiếng Tatar Volga (tt) và tiếng Bashkir (ba), có hai loại `i` (một có chấm, một không có) và hai cặp hoa-thường: `i`/`İ` và `ı`/`I`.
- Trong tiếng Đức (de), `ß` có thể trở thành `ẞ` (U+1E9E) khi viết hoa.
- Trong tiếng Hy Lạp (el), các nguyên âm mất dấu khi cả từ đều viết hoa (`ά`/`Α`), ngoại trừ eta phân cách (`ή`/`Ή`). Ngoài ra, các nguyên âm đôi có dấu trên nguyên âm đầu tiên sẽ mất dấu và nhận dấu phụ trên nguyên âm thứ hai (`άι`/`ΑΪ`).

## Khả năng tiếp cận

Các đoạn văn bản dài được đặt với giá trị `font-variant` là `all-small-caps` hoặc `all-petite-caps` có thể khó đọc đối với những người có vấn đề về nhận thức như chứng khó đọc.

- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [W3C Understanding WCAG 2.2](https://w3c.github.io/wcag/guidelines/22/#visual-presentation)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt biến thể phông chữ small-caps

#### HTML

```html
<p class="small-caps">Firefox rocks, small caps!</p>
<p class="normal">Firefox rocks, normal caps!</p>
```

#### CSS

```css
.small-caps {
  font-variant-caps: small-caps;
  font-style: italic;
}
.normal {
  font-variant-caps: normal;
  font-style: italic;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_the_small-caps_font_variant') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-variant")}}
- {{cssxref("font-variant-alternates")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-numeric")}}
- {{cssxref("font-variant-position")}}
