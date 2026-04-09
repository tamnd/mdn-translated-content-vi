---
title: dir
slug: Web/MathML/Reference/Global_attributes/dir
page-type: mathml-attribute
browser-compat: mathml.global_attributes.dir
sidebar: mathmlref
---

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`dir`** là một thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) cho biết hướng của phần tử MathML.

## Cú pháp

```html-nolint
<math dir="ltr">
<math dir="rtl">
```

### Giá trị

- `ltr`
  - : Hiển thị biểu thức toán học từ trái sang phải (ví dụ tiếng Anh hoặc Maroc).
- `rtl`
  - : Hiển thị biểu thức toán học từ phải sang trái (ví dụ tiếng Ả Rập, Hebrew, Thaana, Maghreb, Machrek, v.v.).

## Mô tả

Hướng hiển thị kiểm soát việc công thức toán được dựng theo chiều trái sang phải hay phải sang trái.

### Phản chiếu và giãn công thức MathML trong chế độ RTL

Khi hiển thị một ngôn ngữ viết từ phải sang trái, các ký hiệu trong một công thức MathML có thể cần được phản chiếu/lật quanh trục dọc, và có thể cũng cần được kéo giãn theo chiều dọc.

Việc phản chiếu có thể đạt được bằng những cách khác nhau để tìm một "glyph cơ sở":

- _Phản chiếu ở mức ký tự_: thay thế một ký tự bằng điểm mã Unicode phản chiếu tương đương theo thuộc tính `Bidi_Mirrored` của Unicode (ví dụ thay `>` bằng `<`, hoặc `]` bằng `[`) .
- _Phản chiếu ở mức glyph_: thay thế một ký tự bằng glyph có thể biểu diễn nó trong dạng nội dung phản chiếu (nếu không có thay thế trực tiếp).
  Điều này đòi hỏi phông chữ đang dùng hỗ trợ tính năng phông [Right to left mirror forms (`rtlm`)](https://en.wikipedia.org/wiki/List_of_typographic_features#Features_depending_on_writing_direction).

Glyph cơ sở sau đó có thể được dùng làm khóa trong bảng OpenType MathVariant để lấy glyph lớn hơn hoặc một tổ hợp glyph.

Lưu ý rằng phản chiếu và giãn hiệu quả cần một phông có cả bảng OpenType MathVariant lẫn hỗ trợ tính năng `rtlm`, chẳng hạn XITS.

### Ưu tiên `dir` hơn thuộc tính CSS `direction`

Thuộc tính này có thể bị ghi đè bởi thuộc tính CSS {{ cssxref("direction") }} nếu trang CSS đang hoạt động và phần tử hỗ trợ các thuộc tính này.
Vì hướng của toán học liên quan về mặt ngữ nghĩa tới nội dung chứ không phải cách trình bày, nên khi có thể, nhà phát triển web được khuyến nghị dùng thuộc tính này thay vì các thuộc tính CSS liên quan.
Như vậy, các công thức sẽ hiển thị đúng ngay cả trên trình duyệt không hỗ trợ CSS hoặc đã tắt CSS.

> [!NOTE]
> Thuộc tính `dir` thường được đặt là `rtl` ở thế giới nói tiếng Ả Rập.
> Tuy nhiên, các ngôn ngữ viết từ phải sang trái thường nhúng nội dung toán học viết từ trái sang phải.
> Do đó, từ khóa `auto` của thuộc tính HTML `dir` không được nhận diện và theo mặc định, [user agent stylesheet](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user-agent_stylesheets) sẽ đặt lại thuộc tính direction trên phần tử [`math`](/en-US/docs/Web/MathML/Reference/Element/math).

## Ví dụ

### Cách dùng cơ bản

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 1.5rem;
}
```

```html
<!-- Kiểu Maroc -->
<math display="block" dir="ltr">
  <msqrt>
    <mi>س</mi>
  </msqrt>
  <mo>=</mo>
  <msup>
    <mn>3</mn>
    <mi>ب</mi>
  </msup>
</math>

<!-- Kiểu Maghreb/Machrek -->
<math display="block" dir="rtl">
  <msqrt>
    <mi>س</mi>
  </msqrt>
  <mo>=</mo>
  <msup>
    <mn>٣</mn>
    <mi>ب</mi>
  </msup>
</math>
```

{{ EmbedLiveSample("Basic usage", "", 150) }}

### Phản chiếu và giãn

Ví dụ này minh họa tác động của hướng `ltr` và `rtl` đối với một công thức MathML phức tạp hơn, bao gồm tác động của việc đặt `largeop` và `stretchy` trên phần tử [`<mo>`](/en-US/docs/Web/MathML/Reference/Element/mo).

#### MathML

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  font-size: 1.5rem;
}
```

Trước hết ta liên kết một stylesheet cho phông XITS, phông này hỗ trợ tính năng `rtlm` và bảng MathVariant cần thiết để phản chiếu và giãn glyph đúng cách.

```html
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/XITS/mathfonts.css" />
```

Hai công thức đầu đặt `largeop` và `stretchy` thành false cho các phần tử tương ứng, và được hiển thị theo `ltr` và `rtl`.

```html
<math dir="ltr" display="block">
  <mrow>
    <munderover>
      <mo largeop="false">∑</mo>
      <mrow>
        <mi>n</mi>
        <mo>=</mo>
        <mn>1</mn>
      </mrow>
      <mn>∞</mn>
    </munderover>
    <mfrac>
      <mn>1</mn>
      <msup>
        <mi>n</mi>
        <mn>2</mn>
      </msup>
    </mfrac>
  </mrow>
  <mo>∊</mo>
  <mrow>
    <mo stretchy="false">(</mo>
    <mfrac>
      <mn>3</mn>
      <mn>2</mn>
    </mfrac>
    <mo>,</mo>
    <mfrac>
      <mn>7</mn>
      <mn>4</mn>
    </mfrac>
    <mo stretchy="false">]</mo>
  </mrow>
</math>
```

```html
<math dir="rtl" display="block">
  <mrow>
    <munderover>
      <mo largeop="false">∑</mo>
      <mrow>
        <mi>n</mi>
        <mo>=</mo>
        <mn>1</mn>
      </mrow>
      <mn>∞</mn>
    </munderover>
    <mfrac>
      <mn>1</mn>
      <msup>
        <mi>n</mi>
        <mn>2</mn>
      </msup>
    </mfrac>
  </mrow>
  <mo>∊</mo>
  <mrow>
    <mo stretchy="false">(</mo>
    <mfrac>
      <mn>3</mn>
      <mn>2</mn>
    </mfrac>
    <mo>,</mo>
    <mfrac>
      <mn>7</mn>
      <mn>4</mn>
    </mfrac>
    <mo stretchy="false">]</mo>
  </mrow>
</math>
```

Công thức này cũng là `rtl`, nhưng đặt `largeop` thành true cho toán tử `∑`, làm nó hiển thị lớn hơn.
Nó cũng đặt `stretchy` thành `true` cho các dấu ngoặc, khiến chúng giãn theo chiều cao của phân số chứa bên trong trên các trình duyệt hỗ trợ.

```html
<math dir="rtl" display="block">
  <mrow>
    <munderover>
      <mo largeop="true">∑</mo>
      <mrow>
        <mi>n</mi>
        <mo>=</mo>
        <mn>1</mn>
      </mrow>
      <mn>∞</mn>
    </munderover>
    <mfrac>
      <mn>1</mn>
      <msup>
        <mi>n</mi>
        <mn>2</mn>
      </msup>
    </mfrac>
  </mrow>
  <mo>∊</mo>
  <mrow>
    <mo stretchy="true">(</mo>
    <mfrac>
      <mn>3</mn>
      <mn>2</mn>
    </mfrac>
    <mo>,</mo>
    <mfrac>
      <mn>7</mn>
      <mn>4</mn>
    </mfrac>
    <mo stretchy="true">]</mo>
  </mrow>
</math>
```

#### Kết quả

Trên trình duyệt hỗ trợ phản chiếu và giãn RTL, đầu ra của ba công thức sẽ giống như hình bên dưới.
Hai công thức đầu hiển thị theo chiều trái sang phải, và phải sang trái mà không có giãn.
Công thức cuối dùng `rtl` với `stretching`, và `largeop` cho ký hiệu tổng.

![Ảnh chụp ba biến thể công thức trên Firefox, hỗ trợ cả phản chiếu glyph lẫn giãn phần tử](example_with_stretchy_and_largeop.png)

Trên trình duyệt này, nó trông như sau:

{{ EmbedLiveSample("Mirroring and stretching", "", 250) }}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
