---
title: <math>
slug: Web/MathML/Reference/Element/math
page-type: mathml-element
browser-compat: mathml.elements.math
sidebar: mathmlref
---

Phần tử **`<math>`** [MathML](/en-US/docs/Web/MathML) là phần tử MathML cấp cao nhất, dùng để viết một công thức toán học duy nhất. Nó có thể được đặt trong nội dung HTML ở nơi [flow content](/en-US/docs/Web/HTML/Guides/Content_categories#flow_content) được phép.

> [!NOTE]
> Xem trang [Authoring MathML](/en-US/docs/Web/MathML/Guides/Authoring#using_mathml) để có mẹo tích hợp đúng cách các công thức MathML vào trang web của bạn và xem trang [Guides](/en-US/docs/Web/MathML/Guides) để có thêm các ví dụ minh họa.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với thuộc tính sau:

- `display`
  - : Thuộc tính [enumerated](/en-US/docs/Glossary/Enumerated) này chỉ định cách phần đánh dấu MathML bên trong sẽ được hiển thị. Nó có thể nhận một trong các giá trị sau:
    - `block`, nghĩa là phần tử này sẽ được hiển thị thành một khối riêng bên ngoài dòng văn bản hiện tại và với {{cssxref("math-style")}} được đặt thành `normal`.
    - `inline`, nghĩa là phần tử này sẽ được hiển thị bên trong dòng văn bản hiện tại và với {{cssxref("math-style")}} được đặt thành `compact`.

    Nếu không có thuộc tính này, giá trị mặc định là `inline`.

## Trợ năng

Phần tử `<math>` có vai trò ARIA ngầm định [`math`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/math_role). Các công nghệ hỗ trợ có thể dùng vai trò này để nhận biết nội dung là một biểu thức toán học và truyền đạt nó cho người dùng.

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

Ví dụ, trình đọc màn hình sẽ biểu diễn công thức bậc hai sau tương tự như:

> x bằng phân số bắt đầu, trừ b cộng hoặc trừ căn bậc hai của b bình phương trừ bốn a c, hết căn, trên hai a, hết phân số, toán học

<details>
<summary>Đánh dấu cho công thức bậc hai</summary>

```html
<math display="block">
  <mrow>
    <mi>x</mi>
    <mo>=</mo>
    <mfrac>
      <mrow>
        <mrow>
          <mo>−</mo>
          <mi>b</mi>
        </mrow>
        <mo>±</mo>
        <msqrt>
          <mrow>
            <msup>
              <mi>b</mi>
              <mn>2</mn>
            </msup>
            <mo>−</mo>
            <mrow>
              <mn>4</mn>
              <mo>⁢</mo>
              <mi>a</mi>
              <mo>⁢</mo>
              <mi>c</mi>
            </mrow>
          </mrow>
        </msqrt>
      </mrow>
      <mrow>
        <mn>2</mn>
        <mo>⁢</mo>
        <mi>a</mi>
      </mrow>
    </mfrac>
  </mrow>
</math>
```

</details>

{{ EmbedLiveSample('accessibility') }}

## Ví dụ

Ví dụ này chứa hai công thức MathML. Công thức đầu tiên được hiển thị thành một khối riêng ở giữa, chiếm đúng lượng không gian cần thiết. Công thức thứ hai được hiển thị ngay trong đoạn văn, với kích thước và khoảng cách giảm đi để tối thiểu hóa chiều cao của nó.

```html
<p>
  Tổng vô hạn
  <math display="block">
    <mrow>
      <munderover>
        <mo>∑</mo>
        <mrow>
          <mi>n</mi>
          <mo>=</mo>
          <mn>1</mn>
        </mrow>
        <mrow>
          <mo>+</mo>
          <mn>∞</mn>
        </mrow>
      </munderover>
      <mfrac>
        <mn>1</mn>
        <msup>
          <mi>n</mi>
          <mn>2</mn>
        </msup>
      </mfrac>
    </mrow>
  </math>
  bằng số thực
  <math display="inline">
    <mfrac>
      <msup>
        <mi>π</mi>
        <mn>2</mn>
      </msup>
      <mn>6</mn>
    </mfrac>
  </math>
  .
</p>
```

{{ EmbedLiveSample('math_example', 700, 200, "", "") }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/math_role">
        <code>math</code>
      </a>
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử cấp cao nhất HTML: {{ HTMLElement("html") }}
- Phần tử cấp cao nhất SVG: {{ SVGElement("svg") }}
