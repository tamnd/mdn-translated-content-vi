---
title: word-spacing
slug: Web/CSS/Reference/Properties/word-spacing
page-type: css-property
browser-compat: css.properties.word-spacing
sidebar: cssref
---

Thuộc tính **`word-spacing`** của [CSS](/vi/docs/Web/CSS) đặt khoảng cách giữa các từ và giữa các thẻ.

{{InteractiveExample("CSS Demo: word-spacing")}}

```css interactive-example-choice
word-spacing: normal;
```

```css interactive-example-choice
word-spacing: 1rem;
```

```css interactive-example-choice
word-spacing: 4px;
```

```css interactive-example-choice
word-spacing: 50%;
```

```css interactive-example-choice
word-spacing: -0.4ch;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    As much mud in the streets as if the waters had but newly retired from the
    face of the earth, and it would not be wonderful to meet a Megalosaurus,
    forty feet long or so, waddling like an elephantine lizard up Holborn Hill.
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

## Cú pháp

```css
/* Giá trị từ khóa */
word-spacing: normal;

/* Giá trị <length> */
word-spacing: 3px;
word-spacing: 0.3em;
word-spacing: 65%;
word-spacing: -1ex;

/* Giá trị toàn cục */
word-spacing: inherit;
word-spacing: initial;
word-spacing: revert;
word-spacing: revert-layer;
word-spacing: unset;
```

### Giá trị

- `normal`
  - : Khoảng cách giữa các từ thông thường, được xác định bởi phông chữ hiện tại và/hoặc trình duyệt.
- {{cssxref("length-percentage")}}
  - : Chỉ định khoảng cách thêm ngoài khoảng cách giữa các từ nội tại được xác định bởi phông chữ. Các giá trị phần trăm được tính tương đối với {{cssxref("font-size")}} của văn bản.

## Khả năng tiếp cận

Giá trị `word-spacing` dương hoặc âm lớn sẽ làm cho các câu được áp dụng kiểu dáng này không thể đọc được. Đối với văn bản được áp dụng giá trị dương rất lớn, các từ sẽ cách xa nhau đến mức không còn trông như một câu nữa. Đối với văn bản được áp dụng giá trị âm lớn, các từ có thể chồng lên nhau đến mức điểm đầu và điểm cuối của mỗi từ không thể nhận ra được.

`word-spacing` có thể đọc được phải được xác định theo từng trường hợp cụ thể, vì các phông chữ khác nhau có chiều rộng ký tự khác nhau. Không có một giá trị nào có thể đảm bảo tất cả các phông chữ tự động duy trì khả năng đọc của chúng.

- [MDN Giải thích WCAG, Hướng dẫn 1.4](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.8 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

## Ví dụ

### Cách dùng cơ bản

Ví dụ này minh họa cách dùng cơ bản của `word-spacing`.

#### HTML

HTML của chúng ta chứa hai đoạn văn bản:

```html live-sample___basic-usage
<p id="mozdiv1">Lorem ipsum dolor sit amet.</p>
<p id="mozdiv2">Lorem ipsum dolor sit amet.</p>
```

#### CSS

CSS của chúng ta áp dụng `word-spacing` khác nhau cho mỗi đoạn:

```css live-sample___basic-usage
#mozdiv1 {
  word-spacing: 15px;
}

#mozdiv2 {
  word-spacing: 5em;
}
```

#### Kết quả

Ví dụ hiển thị như sau:

{{ EmbedLiveSample("live-sample___basic-usage", "100%", "100") }}

### So sánh word-spacing đặt bằng độ dài và phần trăm

Ví dụ này minh họa rằng các giá trị phần trăm `word-spacing` hữu ích cho việc chỉnh kích thước văn bản responsive.

Code hiển thị nhiều đoạn văn có cùng `word-spacing` được đặt trên văn bản với kích thước phông chữ ngày càng tăng. Chúng ta cung cấp chức năng chuyển đổi giữa giá trị độ dài và giá trị phần trăm `word-spacing`, để bạn có thể quan sát chất lượng responsive khi dùng giá trị phần trăm.

#### HTML

HTML chứa nhiều phần tử {{htmlelement("p")}} với nội dung văn bản, và một [`<input type="checkbox">`](/vi/docs/Web/HTML/Reference/Elements/input/checkbox) mà chúng ta sẽ dùng để chuyển đổi giữa giá trị `word-spacing` độ dài và phần trăm.

```html live-sample___percentage-versus-length
<p class="x-small">X-small font-size (0.8em)</p>
<p class="small">Small font-size (1.3em)</p>
<p class="medium">Medium font-size (2em)</p>
<p class="large">Large font-size (3em)</p>
<p class="x-large">X-Large (3.5em)</p>

<form>
  <label for="ls-toggle">
    Toggle <code>word-spacing</code> (off: <code>10px</code>, on:
    <code>15%</code>)
  </label>
  <input type="checkbox" id="ls-toggle" />
</form>
```

#### CSS

CSS của chúng ta bắt đầu bằng cách áp dụng các giá trị {{cssxref("font-size")}} ngày càng tăng cho mỗi đoạn:

```css hidden live-sample___percentage-versus-length
html {
  font-family: Arial, Helvetica, sans-serif;
}
```

```css live-sample___percentage-versus-length
.x-small {
  font-size: 0.8em;
}

.small {
  font-size: 1.3em;
}

.medium {
  font-size: 2em;
}

.large {
  font-size: 3em;
}

.x-large {
  font-size: 3.5em;
}
```

Chúng ta áp dụng giá trị `word-spacing` là `10px` cho tất cả các đoạn văn theo mặc định. Tuy nhiên, khi hộp kiểm được chọn, chúng ta thay đổi giá trị `word-spacing` thành `15%`:

```css live-sample___percentage-versus-length
p {
  word-spacing: 10px;
}

p:has(~ form > input:checked) {
  word-spacing: 15%;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{ EmbedLiveSample("percentage-versus-length", "100%", 460) }}

Đầu tiên, lưu ý cách giá trị khoảng cách chữ theo độ dài ban đầu trông ổn khi áp dụng cho các kích thước phông chữ lớn hơn, nhưng không trông tốt ở các kích thước phông chữ nhỏ hơn. Bây giờ bật hộp kiểm, và lưu ý cách khoảng cách chữ theo phần trăm trông phù hợp ở tất cả các dòng, vì nó tỷ lệ với kích thước phông chữ.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("letter-spacing")}}
- Thuộc tính SVG {{SVGAttr("word-spacing")}}
