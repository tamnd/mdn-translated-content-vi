---
title: font-style
slug: Web/CSS/Reference/Properties/font-style
page-type: css-property
browser-compat: css.properties.font-style
sidebar: cssref
---

Thuộc tính **`font-style`** [CSS](/en-US/docs/Web/CSS) thiết lập liệu phông chữ có nên được tạo kiểu với mặt bình thường, in nghiêng (italic) hay xiên (oblique) từ {{cssxref("font-family")}} của nó.

{{InteractiveExample("CSS Demo: font-style")}}

```css interactive-example-choice
font-style: normal;
```

```css interactive-example-choice
font-style: italic;
```

```css interactive-example-choice
font-style: oblique;
```

```css interactive-example-choice
font-style: oblique 40deg;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
@font-face {
  src: url("/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.ttf");
  font-family: "Amstelvar";
  font-style: normal;
}

section {
  font-size: 1.2em;
  font-family: "Amstelvar", serif;
}
```

Mặt phông chữ **in nghiêng** thường có tính chất chữ viết tay, thường dùng ít không gian ngang hơn so với phiên bản không có kiểu dáng, trong khi mặt **xiên** thường chỉ là phiên bản nghiêng của mặt thông thường. Khi kiểu được chỉ định không khả dụng, cả mặt in nghiêng và xiên đều được mô phỏng bằng cách nghiêng nhân tạo các glyph của mặt thông thường (sử dụng {{cssxref("font-synthesis")}} để kiểm soát hành vi này).

## Cú pháp

```css
font-style: normal;
font-style: italic;
font-style: oblique;
font-style: oblique 10deg;

/* Giá trị toàn cục */
font-style: inherit;
font-style: initial;
font-style: revert;
font-style: revert-layer;
font-style: unset;
```

Thuộc tính `font-style` được chỉ định là một từ khóa đơn được chọn từ danh sách các giá trị bên dưới, có thể tùy chọn bao gồm một góc nếu từ khóa là `oblique`.

### Giá trị

- `normal`
  - : Chọn phông chữ được phân loại là `normal` trong {{Cssxref("font-family")}}.
- `italic`
  - : Chọn phông chữ được phân loại là `italic`. Nếu không có phiên bản in nghiêng của mặt phông chữ, thì phiên bản được phân loại là `oblique` sẽ được sử dụng thay thế. Nếu cả hai đều không khả dụng, kiểu dáng sẽ được mô phỏng nhân tạo.
- `oblique`
  - : Chọn phông chữ được phân loại là `oblique`. Nếu không có phiên bản xiên của mặt phông chữ, thì phiên bản được phân loại là `italic` sẽ được sử dụng thay thế. Nếu cả hai đều không khả dụng, kiểu dáng sẽ được mô phỏng nhân tạo.
- `oblique` {{cssxref("angle")}}
  - : Chọn phông chữ được phân loại là `oblique`, và ngoài ra chỉ định một góc cho độ nghiêng của văn bản. Nếu một hoặc nhiều mặt xiên có sẵn trong họ phông chữ được chọn, mặt khớp gần nhất với góc được chỉ định sẽ được chọn. Nếu không có mặt xiên nào khả dụng, trình duyệt sẽ tổng hợp phiên bản xiên của phông chữ bằng cách nghiêng mặt bình thường theo lượng được chỉ định. Các giá trị hợp lệ là giá trị độ từ `-90deg` đến `90deg` bao gồm cả hai đầu. Nếu không chỉ định góc, góc 14 độ được sử dụng. Các giá trị dương nghiêng về phía cuối dòng, trong khi các giá trị âm nghiêng về phía đầu dòng.

    Nói chung, đối với góc yêu cầu từ 14 độ trở lên, các góc lớn hơn được ưu tiên hơn; ngược lại, các góc nhỏ hơn được ưu tiên hơn (xem [phần khớp phông chữ](https://drafts.csswg.org/css-fonts-4/#font-matching-algorithm) trong đặc tả để biết thuật toán chính xác).

### Phông chữ biến thể

Phông chữ biến thể có thể cung cấp kiểm soát tinh tế hơn đối với mức độ mặt xiên bị nghiêng. Bạn có thể chọn điều này bằng cách sử dụng bộ điều chỉnh `<angle>` cho từ khóa `oblique`.

Đối với các phông chữ biến thể TrueType hoặc OpenType, biến thể `"slnt"` được sử dụng để triển khai các góc nghiêng khác nhau cho phông chữ xiên, và biến thể `"ital"` với giá trị 1 được sử dụng để triển khai các giá trị in nghiêng. Xem {{cssxref("font-variation-settings")}}.

Nhấp vào "Play" trong các khối code bên dưới để chỉnh sửa ví dụ trong MDN Playground. Thay đổi giá trị góc để xem độ nghiêng của văn bản thay đổi.

```html live-sample___oblique-example
<p class="sample">
  ...it would not be wonderful to meet a Megalosaurus, forty feet long or so,
  waddling like an elephantine lizard up Holborn Hill.
</p>
```

```css live-sample___oblique-example
@font-face {
  src: url("https://mdn.github.io/shared-assets/fonts/variable-fonts/AmstelvarAlpha-VF.ttf");
  font-family: "AmstelvarAlpha";
  font-style: normal;
}

.sample {
  font:
    2rem "AmstelvarAlpha",
    sans-serif;
  /* font-variation-settings: "slnt" 12; */
  font-style: oblique 23deg;
}
```

{{EmbedLiveSample("oblique-example", "", "200px")}}

## Khả năng tiếp cận

Các đoạn văn bản lớn được đặt với giá trị `font-style` là `italic` có thể khó đọc đối với những người có vấn đề về nhận thức như chứng khó đọc (Dyslexia).

- [MDN Hiểu WCAG, Giải thích Nguyên tắc 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [W3C Hiểu WCAG 2.2](https://w3c.github.io/wcag/guidelines/22/#visual-presentation)

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Kiểu dáng phông chữ

```html hidden
<p class="normal">This paragraph is normal.</p>
<p class="italic">This paragraph is italic.</p>
<p class="oblique">This paragraph is oblique.</p>
```

```css
.normal {
  font-style: normal;
}

.italic {
  font-style: italic;
}

.oblique {
  font-style: oblique;
}
```

{{ EmbedLiveSample('Font_styles') }}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-family")}}
- {{cssxref("font-weight")}}
- Thuộc tính SVG {{SVGAttr("font-style")}}
- [Học: Kiểu dáng văn bản và phông chữ cơ bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
