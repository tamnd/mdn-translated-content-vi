---
title: calc()
slug: Web/CSS/Reference/Values/calc
page-type: css-function
browser-compat: css.types.calc
sidebar: cssref
---

Hàm **`calc()`** trong [CSS](/vi/docs/Web/CSS) cho phép bạn thực hiện tính toán khi chỉ định giá trị thuộc tính CSS. Nó có thể được sử dụng với các giá trị {{cssxref("&lt;length&gt;")}}, {{cssxref("&lt;frequency&gt;")}}, {{cssxref("angle")}}, {{cssxref("&lt;time&gt;")}}, {{cssxref("&lt;percentage&gt;")}}, {{cssxref("&lt;number&gt;")}}, {{cssxref("&lt;integer&gt;")}}, và {{cssxref("color_value", "&lt;color-function&gt;")}}.

{{InteractiveExample("CSS Demo: calc()")}}

```css interactive-example-choice
width: calc(10px + 100px);
```

```css interactive-example-choice
width: calc(100% - 30px);
```

```css interactive-example-choice
width: calc(2em * 5);
```

```css interactive-example-choice
width: calc(var(--variable-width) + 20px);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">Change my width.</div>
</section>
```

```css interactive-example
:root {
  --variable-width: 100px;
}

#example-element {
  border: 10px solid black;
  padding: 10px;
}
```

## Cú pháp

```css
/* calc(biểu thức) */
calc(100% - 80px)

/* Biểu thức với hàm CSS */
calc(100px * sin(pi / 2))

/* Biểu thức chứa biến */
calc(var(--hue) + 180)

/* Biểu thức với các kênh màu trong màu tương đối */
lch(from aquamarine l c calc(h + 180))
```

Hàm `calc()` nhận một biểu thức duy nhất làm tham số, và kết quả của biểu thức được sử dụng làm giá trị cho thuộc tính CSS. Trong biểu thức này, các {{Glossary("operand", "toán hạng")}} có thể được kết hợp bằng các {{Glossary("operator", "toán tử")}} được liệt kê bên dưới. Khi biểu thức chứa nhiều toán hạng, `calc()` sử dụng [quy tắc ưu tiên toán tử](/vi/docs/Learn_web_development/Core/Scripting/Math#operator_precedence) tiêu chuẩn:

- `+`
  - : Cộng các toán hạng được chỉ định.
- `-`
  - : Trừ toán hạng thứ hai khỏi toán hạng thứ nhất.
- `*`
  - : Nhân các toán hạng được chỉ định.
- `/`
  - : Chia toán hạng bên trái (số bị chia) cho toán hạng bên phải (số chia).

Tất cả các toán hạng, ngoại trừ những toán hạng thuộc kiểu {{cssxref("&lt;number&gt;")}}, phải được thêm hậu tố bằng chuỗi đơn vị thích hợp, chẳng hạn như `px`, `em`, hoặc `%`. Bạn có thể sử dụng các đơn vị khác nhau với từng toán hạng trong biểu thức. Bạn cũng có thể sử dụng dấu ngoặc để thiết lập thứ tự tính toán khi cần.

## Mô tả

Có một số điểm cần lưu ý về `calc()`, được trình bày chi tiết trong các phần bên dưới.

### Giá trị kết quả

Hàm `calc()` phải đứng thay thế cho giá trị CSS đầy đủ của một trong các kiểu sau:

- {{cssxref("&lt;length&gt;")}}
- {{cssxref("&lt;frequency&gt;")}}
- {{cssxref("angle")}}
- {{cssxref("&lt;time&gt;")}}
- {{cssxref("flex_value", "&lt;flex&gt;")}}
- {{cssxref("resolution")}}
- {{cssxref("&lt;percentage&gt;")}}
- {{cssxref("&lt;number&gt;")}}
- {{cssxref("&lt;integer&gt;")}}
- Một trong các kiểu hỗn hợp như {{cssxref("&lt;length-percentage&gt;")}}

`calc()` không thể chỉ thay thế phần số của giá trị phần trăm, giá trị độ dài, v.v., mà không thay thế cả đơn vị sau nó. Ví dụ, `calc(100 / 4)%` không hợp lệ, trong khi `calc(100% / 4)` hợp lệ.

Giá trị kết quả của `calc()` phải tương thích với ngữ cảnh mà nó được sử dụng. Ví dụ, `margin: calc(1px + 2px)` hợp lệ, nhưng `margin: calc(1 + 2)` thì không: nó tương đương với việc chỉ định `margin: 3`, dẫn đến thuộc tính bị bỏ qua.

Khi một {{cssxref("&lt;integer&gt;")}} được mong đợi, biểu thức `calc()` cũng có thể đánh giá thành `<number>`, sẽ được làm tròn đến số nguyên gần nhất. Vì vậy, `calc(1.4)` sẽ dẫn đến giá trị `1`. Nếu phần thập phân của giá trị chính xác là `0.5`, giá trị được làm tròn về phía vô cực dương. Ví dụ, `calc(1.5)` sẽ dẫn đến giá trị `2`, trong khi `calc(-1.5)` sẽ làm tròn thành `-1`.

`calc()` thực hiện tính toán dấu phẩy động theo tiêu chuẩn IEEE-754, dẫn đến một số lưu ý liên quan đến các giá trị `infinity` và `NaN`. Để biết thêm chi tiết về cách các hằng số được tuần tự hóa, xem trang {{cssxref("calc-keyword")}}.

### Các lưu ý về đầu vào

- `calc()` không thể thực hiện tính toán trên [giá trị kích thước nội tại](/vi/docs/Glossary/Intrinsic_Size) như {{cssxref("auto")}} và {{cssxref("fit-content")}}. Thay vào đó, hãy sử dụng hàm {{cssxref("calc-size()")}}.
- Các toán tử `*` và `/` không yêu cầu khoảng trắng, nhưng việc thêm khoảng trắng để nhất quán được khuyến nghị.
- Được phép lồng các hàm `calc()`, trong trường hợp đó, các hàm bên trong được xử lý như dấu ngoặc đơn.
- Các biểu thức toán học liên quan đến phần trăm cho chiều rộng và chiều cao trên các cột bảng, nhóm cột bảng, hàng bảng, nhóm hàng bảng và ô bảng trong cả bảng bố cục tự động và cố định _có thể_ được xử lý như thể `auto` được chỉ định.
- Xem {{cssxref("calc-sum", "&lt;calc-sum&gt;")}} để biết thêm thông tin về cú pháp của các biểu thức `+` và `-`.

### Số học kiểu CSS

Khi sử dụng `calc()` để nhân các giá trị bằng toán tử `*`, chỉ một giá trị có thể chứa đơn vị. Các phép tính như `200px * 4px` không được hỗ trợ vì 800px<sup>2</sup> vô nghĩa trong CSS.

Ngược lại, `200px / 4px` giải thành `50`, điều này có ý nghĩa trong CSS. Do đó, khi sử dụng hàm `calc()` để chia các số với toán tử `/`, [các trình duyệt hỗ trợ](#browser_compatibility) cho phép đơn vị ở cả hai phía của toán hạng, miễn là chúng thuộc cùng kiểu dữ liệu. Ví dụ, `100vw / 1px` hợp lệ và dẫn đến một giá trị không có đơn vị.

Thương số sau đó có thể được sử dụng trong các giá trị của thuộc tính hoặc hàm chấp nhận {{cssxref("number")}} làm giá trị hoặc tham số, hoặc được chuyển đổi thành kiểu dữ liệu khác bằng cách nhân với một giá trị có kiểu.

Để có giải thích đầy đủ về số học kiểu trong CSS, cùng với ví dụ, xem [Sử dụng số học kiểu CSS](/vi/docs/Web/CSS/Guides/Values_and_units/Using_typed_arithmetic).

### Hỗ trợ tính toán các kênh màu trong màu tương đối

Hàm `calc()` có thể được sử dụng để thao tác trực tiếp các kênh màu trong ngữ cảnh [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors). Điều này cho phép điều chỉnh động các kênh màu trong các mô hình màu như [`rgb()`](/vi/docs/Web/CSS/Reference/Values/color_value/rgb), [`hsl()`](/vi/docs/Web/CSS/Reference/Values/color_value/hsl), và [`lch()`](/vi/docs/Web/CSS/Reference/Values/color_value/lch).

Cú pháp màu tương đối định nghĩa một số từ khóa kênh màu, mỗi từ khóa đại diện cho giá trị của kênh màu dưới dạng {{cssxref("&lt;number&gt;")}} (xem [Giá trị kênh giải thành giá trị `<number>`](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors#channel_values_resolve_to_number_values) để biết thêm thông tin). Hàm `calc()` có thể sử dụng các từ khóa kênh màu này để thực hiện điều chỉnh động trên các kênh màu, ví dụ, `calc(r + 10)`.

## Cú pháp hình thức

{{csssyntax}}

## Khả năng truy cập

Khi `calc()` được sử dụng để kiểm soát kích thước văn bản, hãy đảm bảo rằng một trong các giá trị bao gồm [đơn vị độ dài tương đối](/vi/docs/Web/CSS/Reference/Values/length#relative_length_units), ví dụ:

```css
h1 {
  font-size: calc(1.5rem + 3vw);
}
```

Điều này đảm bảo rằng kích thước văn bản sẽ tỷ lệ nếu trang được phóng to.

- [MDN Hiểu WCAG, Giải thích hướng dẫn 1.4](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.4 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Ví dụ

### Định vị đối tượng trên màn hình với lề

`calc()` cho phép định vị đối tượng với lề cố định. Trong ví dụ này, CSS tạo ra một banner trải rộng qua cửa sổ, với khoảng cách 40 pixel giữa cả hai phía của banner và các cạnh cửa sổ:

```css
.banner {
  position: absolute;
  left: 40px;
  width: calc(100% - 80px);
  border: solid black 1px;
  box-shadow: 1px 2px;
  background-color: yellow;
  padding: 6px;
  text-align: center;
  box-sizing: border-box;
}
```

```html
<div class="banner">This is a banner!</div>
```

{{EmbedLiveSample('Positioning_an_object_on_screen_with_a_margin', 'auto', '60')}}

### Tự động điều chỉnh kích thước trường form để vừa với vùng chứa

Một trường hợp sử dụng khác của `calc()` là giúp đảm bảo rằng các trường form vừa với không gian có sẵn, mà không vượt quá cạnh của vùng chứa trong khi duy trì lề thích hợp.

Hãy xem một số CSS:

```css
input {
  padding: 2px;
  display: block;
  width: calc(100% - 1em);
}

#form-box {
  width: calc(100% / 6);
  border: 1px solid black;
  padding: 4px;
}
```

Ở đây, form được thiết lập để sử dụng 1/6 chiều rộng cửa sổ có sẵn. Sau đó, để đảm bảo các trường input giữ kích thước phù hợp, chúng ta sử dụng lại `calc()` để thiết lập rằng chúng phải có chiều rộng bằng chiều rộng vùng chứa trừ 1em. HTML sau đây sử dụng CSS này:

```html
<form>
  <div id="form-box">
    <label for="misc">Type something:</label>
    <input type="text" id="misc" name="misc" />
  </div>
</form>
```

{{EmbedLiveSample('Automatically_sizing_form_fields_to_fit_their_container', '700', '80')}}

### Lồng với biến CSS

Bạn có thể sử dụng `calc()` với [biến CSS](/vi/docs/Web/CSS/Guides/Cascading_variables). Hãy xem đoạn code sau:

```css
.foo {
  --width-a: 100px;
  --width-b: calc(var(--width-a) / 2);
  --width-c: calc(var(--width-b) / 2);
  width: var(--width-c);
}
```

Sau khi tất cả các biến được mở rộng, giá trị của `--width-c` sẽ là `calc(calc(100px / 2) / 2)`. Khi nó được gán cho thuộc tính width của `.foo`, tất cả các hàm `calc()` bên trong (dù lồng sâu đến đâu) sẽ được rút gọn thành chỉ còn dấu ngoặc đơn. Do đó, giá trị của thuộc tính `width` cuối cùng sẽ là `calc((100px / 2) / 2)`, bằng `25px`. Nói ngắn gọn, một `calc()` bên trong một `calc()` giống như sử dụng dấu ngoặc đơn.

### Điều chỉnh các kênh màu trong màu tương đối

Hàm `calc()` có thể được sử dụng để điều chỉnh các kênh màu riêng lẻ trong [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors) mà không cần lưu trữ các giá trị kênh màu làm biến.

Trong ví dụ bên dưới, đoạn văn bản đầu tiên sử dụng {{cssxref("named-color")}}.
Trong các đoạn tiếp theo, `calc()` được sử dụng với các hàm [`rgb()`](/vi/docs/Web/CSS/Reference/Values/color_value/rgb) và [`hsl()`](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) để điều chỉnh giá trị của từng kênh màu so với màu được đặt tên ban đầu.

```html
<p class="original">Original text color in rebeccapurple</p>
<p class="increase-hue">Hue increased by 80</p>
<p class="increase-lightness">Lightness increased by 20</p>
<p class="decrease-lightness">Lightness decreased by 10</p>
```

```css hidden
p {
  font-family: monospace;
  font-size: 16px;
}
```

```css
.original {
  color: rebeccapurple;
}

.increase-hue {
  color: lch(from rebeccapurple l c calc(h + 80));
}

.increase-lightness {
  color: lch(from rebeccapurple calc(l + 20) c h);
}

.decrease-lightness {
  color: lch(from rebeccapurple calc(l - 10) c h);
}
```

{{EmbedLiveSample('Adjusting color channels in relative colors', '700', '300')}}

Để xem ví dụ khác về việc sử dụng hàm `calc()` để tạo màu tương đối, xem phần [Sử dụng hàm toán học](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors#using_math_functions) trên trang _Sử dụng màu tương đối_.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("&lt;calc-sum&gt;")}}
- {{CSSxRef("&lt;calc-keyword&gt;")}}
- [Hàm CSS](/vi/docs/Web/CSS/Reference/Values/Functions)
- [Hướng dẫn đầy đủ về calc() trong CSS](https://css-tricks.com/a-complete-guide-to-calc-in-css/) (CSS-Tricks)
