---
title: letter-spacing
slug: Web/CSS/Reference/Properties/letter-spacing
page-type: css-property
browser-compat: css.properties.letter-spacing
sidebar: cssref
---

Thuộc tính **`letter-spacing`** trong [CSS](/vi/docs/Web/CSS) thiết lập khoảng cách giữa các ký tự văn bản. Giá trị này được cộng thêm vào khoảng cách tự nhiên giữa các ký tự khi hiển thị văn bản. Giá trị dương của `letter-spacing` tăng khoảng cách giữa các ký tự, trong khi giá trị âm của `letter-spacing` thu hẹp khoảng cách giữa các ký tự.

{{InteractiveExample("CSS Demo: letter-spacing")}}

```css interactive-example-choice
letter-spacing: normal;
```

```css interactive-example-choice
letter-spacing: 0.2rem;
```

```css interactive-example-choice
letter-spacing: 1px;
```

```css interactive-example-choice
letter-spacing: 30%;
```

```css interactive-example-choice
letter-spacing: -1px;
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
letter-spacing: normal;

/* Giá trị <length-percentage> */
letter-spacing: 0.3em;
letter-spacing: 3px;
letter-spacing: -0.5px;
letter-spacing: 50%;

/* Giá trị toàn cục */
letter-spacing: inherit;
letter-spacing: initial;
letter-spacing: revert;
letter-spacing: revert-layer;
letter-spacing: unset;
```

### Giá trị

- `normal`
  - : Khoảng cách chữ bình thường của phông chữ hiện tại. Không giống như giá trị `0`, từ khóa này cho phép {{glossary("user agent")}} thay đổi khoảng cách giữa các ký tự để căn chỉnh văn bản.
- {{cssxref("&lt;length-percentage&gt;")}}
  - : Chỉ định thêm khoảng cách giữa các ký tự _ngoài_ khoảng cách mặc định. Mặc dù giá trị có thể âm, nhưng chúng có thể bị giới hạn bởi các giới hạn dành riêng cho từng triển khai. Các tác nhân người dùng không thể tiếp tục tăng hoặc giảm thêm khoảng cách giữa các ký tự để căn chỉnh văn bản.

    Giá trị phần trăm được tính tương đối so với chiều rộng của ký tự khoảng trắng của phông chữ được áp dụng cho văn bản.

## Khả năng tiếp cận

Giá trị `letter-spacing` lớn dương hoặc âm sẽ làm cho (các) từ được áp dụng kiểu không thể đọc được. Đối với văn bản được tạo kiểu với giá trị dương rất lớn, các chữ cái sẽ cách xa nhau đến mức (các) từ trông giống như một loạt các chữ cái riêng lẻ, không kết nối. Đối với văn bản được tạo kiểu với giá trị âm rất lớn, các chữ cái có thể chồng lên nhau đến mức (các) từ có thể không nhận ra được.

Khoảng cách chữ có thể đọc được phải được xác định theo từng trường hợp, vì các họ phông chữ khác nhau có chiều rộng ký tự khác nhau. Không có một giá trị nào có thể đảm bảo tất cả các họ phông chữ tự động duy trì khả năng đọc.

- [MDN Understanding WCAG, Guideline 1.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Understanding Success Criterion 1.4.8 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-visual-presentation.html)

## Mối quan tâm quốc tế hóa

Một số ngôn ngữ viết không nên áp dụng khoảng cách chữ. Ví dụ, các ngôn ngữ sử dụng chữ viết Ả Rập mong muốn các chữ cái được kết nối vẫn kết nối về mặt trực quan, như trong ví dụ sau. Áp dụng khoảng cách chữ có thể dẫn đến văn bản trông bị vỡ.

```html live-sample___i18n-sample
<p lang="ar" dir="rtl">شسيبتنمك</p>
```

```css hidden live-sample___i18n-sample
p {
  font-size: 3em;
  margin-inline-start: 5px;
}
```

{{ EmbedLiveSample("i18n-sample", "100%", 180) }}

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập letter-spacing với giá trị độ dài

Ví dụ này hiển thị một số đoạn văn với các giá trị `letter-spacing` độ dài khác nhau, cho phép bạn so sánh chúng.

#### HTML

HTML chứa một số phần tử {{htmlelement("p")}} có nội dung văn bản.

```html live-sample___length-letter-spacing
<p class="normal">letter spacing</p>
<p class="em-wide">letter spacing</p>
<p class="em-wider">letter spacing</p>
<p class="em-tight">letter spacing</p>
<p class="px-wide">letter spacing</p>
```

#### CSS

CSS áp dụng giá trị `letter-spacing` khác nhau cho mỗi đoạn văn.

```css live-sample___length-letter-spacing
.normal {
  letter-spacing: normal;
}
.em-wide {
  letter-spacing: 0.4em;
}
.em-wider {
  letter-spacing: 1em;
}
.em-tight {
  letter-spacing: -0.05em;
}
.px-wide {
  letter-spacing: 6px;
}
```

#### Kết quả

Kết quả hiển thị trông như thế này:

{{ EmbedLiveSample("length-letter-spacing", "100%", 200) }}

### So sánh letter-spacing được đặt với độ dài và phần trăm

Ví dụ này minh họa rằng giá trị `letter-spacing` phần trăm hữu ích cho kích thước văn bản phản hồi.

Mã hiển thị một số đoạn văn có cùng `letter-spacing` được đặt trên văn bản với cỡ chữ tăng dần. Chúng tôi cung cấp chức năng chuyển đổi giữa giá trị `letter-spacing` độ dài và phần trăm, để bạn có thể quan sát các đặc tính phản hồi khi sử dụng giá trị phần trăm.

#### HTML

HTML chứa một số phần tử {{htmlelement("p")}} có nội dung văn bản, và một [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) dùng để chuyển đổi giữa giá trị `letter-spacing` độ dài và phần trăm.

```html live-sample___percentage-versus-length
<p class="x-small">X-small font-size (0.8em)</p>
<p class="small">Small font-size (1.3em)</p>
<p class="medium">Medium font-size (2em)</p>
<p class="large">Large font-size (3em)</p>
<p class="x-large">X-Large (3.5em)</p>

<form>
  <label for="ls-toggle">
    Toggle <code>letter-spacing</code> (off: <code>8px</code>, on:
    <code>12%</code>)
  </label>
  <input type="checkbox" id="ls-toggle" />
</form>
```

#### CSS

CSS của chúng ta bắt đầu bằng cách áp dụng các giá trị {{cssxref("font-size")}} tăng dần cho mỗi đoạn văn liên tiếp:

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

Chúng ta áp dụng giá trị `letter-spacing` là `8px` cho tất cả đoạn văn theo mặc định. Tuy nhiên, khi hộp kiểm được chọn, chúng ta thay đổi giá trị `letter-spacing` thành `12%`:

```css live-sample___percentage-versus-length
p {
  letter-spacing: 8px;
}

p:has(~ form > input:checked) {
  letter-spacing: 12%;
}
```

#### Kết quả

Kết quả hiển thị trông như thế này:

{{ EmbedLiveSample("percentage-versus-length", "100%", 460) }}

Đầu tiên, hãy chú ý cách giá trị khoảng cách chữ độ dài ban đầu trông ổn khi áp dụng cho cỡ chữ lớn hơn, nhưng không đẹp trên cỡ chữ nhỏ hơn. Bây giờ bật hộp kiểm, và chú ý cách khoảng cách chữ phần trăm trông phù hợp trên tất cả các dòng, vì nó tỷ lệ theo cỡ chữ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-kerning")}}
- {{cssxref("word-spacing")}}
- Thuộc tính SVG {{SVGAttr("letter-spacing")}}
