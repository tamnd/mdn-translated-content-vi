---
title: <mmultiscripts>
slug: Web/MathML/Reference/Element/mmultiscripts
page-type: mathml-element
browser-compat: mathml.elements.mmultiscripts
sidebar: mathmlref
---

Phần tử **`<mmultiscripts>`** [MathML](/en-US/docs/Web/MathML) được dùng để gắn một số lượng tùy ý các chỉ số dưới và chỉ số trên vào một biểu thức cùng lúc, tổng quát hóa phần tử {{ MathMLElement("msubsup") }}. Các chỉ số có thể là chỉ số trước (đặt **trước** biểu thức) hoặc chỉ số sau (đặt **sau** nó).

MathML dùng cú pháp bên dưới, tức là một biểu thức cơ sở, theo sau là một số tùy ý các cặp chỉ số dưới và chỉ số trên phía sau (được gắn theo thứ tự đã cho), tùy chọn theo sau bởi một phần tử {{ MathMLElement("mprescripts") }} và một số tùy ý các cặp chỉ số dưới và chỉ số trên phía trước (được gắn theo thứ tự đã cho). Ngoài ra, các phần tử {{ MathMLElement("mrow") }} rỗng có thể được dùng để biểu diễn các chỉ số bị thiếu.

```html-nolint
<mmultiscripts>
  base
  post-sub-script-1 post-sup-script-1
  post-sub-script-2 post-sup-script-2
  post-sub-script-3 post-sup-script-3
  ...
  post-sub-script-N post-sup-script-N
  <mprescripts />                    ⎫
  pre-sub-script-1 pre-sup-script-1  ⎪
  pre-sub-script-2 pre-sup-script-2  ⎬ Tùy chọn
  pre-sub-script-3 pre-sup-script-3  ⎪
  ...                                ⎪
  pre-sub-script-M pre-sup-script-N  ⎭
</mmultiscripts>
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính đã lỗi thời sau:

- `subscriptshift` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết lượng tối thiểu để hạ baseline của chỉ số dưới xuống.
- `superscriptshift` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết lượng tối thiểu để nâng baseline của chỉ số trên lên.

> [!NOTE]
> Đối với các thuộc tính `subscriptshift` và `superscriptshift`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

### Dùng `<mprescripts>`

Các phần tử con sau phần tử `<mprescripts>` sẽ được đặt làm chỉ số trước (trước biểu thức cơ sở):

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html-nolint
<math display="block">
  <mmultiscripts>
    <mi>X</mi> <!-- biểu thức cơ sở -->
    <mi>a</mi> <!-- chỉ số dưới phía sau -->
    <mi>b</mi> <!-- chỉ số trên phía sau -->
    <mprescripts />
    <mi>c</mi> <!-- chỉ số dưới phía trước -->
    <mi>d</mi> <!-- chỉ số trên phía trước -->
  </mmultiscripts>
</math>
```

{{ EmbedLiveSample('using_mprescripts', 700, 200, "", "") }}

### Chỉ số rỗng

Các phần tử `<mrow>` rỗng có thể được dùng để biểu diễn các chỉ số bị thiếu:

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html-nolint
<math display="block">
  <mmultiscripts>
    <mi>X</mi>    <!-- biểu thức cơ sở -->
    <mrow></mrow> <!-- chỉ số dưới phía sau -->
    <mi>b</mi>    <!-- chỉ số trên phía sau -->
    <mprescripts />
    <mi>c</mi>    <!-- chỉ số dưới phía trước -->
    <mrow></mrow> <!-- chỉ số trên phía trước -->
  </mmultiscripts>
</math>
```

{{ EmbedLiveSample('empty_scripts', 700, 200, "", "") }}

### Thứ tự của các chỉ số

Đây là một ví dụ phức tạp hơn với nhiều chỉ số, để bạn có thể thấy chúng được gắn vào biểu thức cơ sở theo thứ tự nào:

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html-nolint
<math display="block">
  <mmultiscripts>
    <mi>X</mi> <!-- biểu thức cơ sở -->
    <mn>1</mn> <!-- chỉ số dưới phía sau 1 -->
    <mn>2</mn> <!-- chỉ số trên phía sau 1 -->
    <mn>3</mn> <!-- chỉ số dưới phía sau 2 -->
    <mn>4</mn> <!-- chỉ số trên phía sau 2 -->
    <mprescripts />
    <mn>5</mn> <!-- chỉ số dưới phía trước 1 -->
    <mn>6</mn> <!-- chỉ số trên phía trước 1 -->
    <mn>7</mn> <!-- chỉ số dưới phía trước 2 -->
    <mn>8</mn> <!-- chỉ số trên phía trước 2 -->
  </mmultiscripts>
</math>
```

{{ EmbedLiveSample('order_of_scripts', 700, 200, "", "") }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không có
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ MathMLElement("msub") }} (Chỉ số dưới)
- {{ MathMLElement("msup") }} (Chỉ số trên)
- {{ MathMLElement("msubsup") }} (Cặp chỉ số dưới-trên)
