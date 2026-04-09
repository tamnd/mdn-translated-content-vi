---
title: Chứng minh định lý Pythagoras
short-title: Pythagorean theorem
slug: Web/MathML/Guides/Proving_the_Pythagorean_theorem
page-type: guide
sidebar: mathmlref
---

Trang này phác thảo phép chứng minh [định lý Pythagoras](https://en.wikipedia.org/wiki/Pythagorean_theorem). Ba phương trình được sắp xếp trong phần tử {{MathMLElement("mtable")}} để căn chỉnh các bước chứng minh theo dấu bằng. Bản chứng minh cũng được biểu diễn ở định dạng [LaTeX](https://www.latex-project.org/) trong phần tử {{MathMLElement("annotation")}}.

## Chứng minh

**Phát biểu:** Trong một tam giác vuông, bình phương cạnh huyền bằng tổng bình phương của hai cạnh còn lại. Cụ thể, nếu <math><mi>a</mi></math> và <math><mi>b</mi></math> là hai cạnh góc vuông và <math><mi>c</mi></math> là cạnh huyền, thì <math><semantics><mrow><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup><mo>=</mo><msup><mi>c</mi><mn>2</mn></msup></mrow><annotation encoding="application/x-tex">a^2 + b^2 = c^2</annotation></semantics></math>.

**Chứng minh:** Ta có thể chứng minh định lý bằng đại số bằng cách chỉ ra rằng trong [hình này](https://www.cut-the-knot.org/pythagoras/proof31.gif), diện tích hình vuông lớn bằng diện tích hình vuông bên trong (bình phương cạnh huyền) cộng với diện tích của bốn tam giác:

{{ EmbedLiveSample("Proof", "", "100px") }}

<!-- prettier-ignore-start -->
```html
<math display="block">
  <semantics>
    <mtable>
      <!-- Step one -->
      <mtr>
        <mtd>
          <msup>
            <mrow>
              <mo>(</mo>
              <mi>a</mi>
              <mo>+</mo>
              <mi>b</mi>
              <mo>)</mo>
            </mrow>
            <mn>2</mn>
          </msup>
        </mtd>
        <mtd>
          <mo>=</mo>
        </mtd>
        <mtd>
          <msup>
            <mi>c</mi>
            <mn>2</mn>
          </msup>
          <mo>+</mo>
          <mn>4</mn>
          <mo>⋅</mo>
          <mo>(</mo>
          <mfrac>
            <mn>1</mn>
            <mn>2</mn>
          </mfrac>
          <mi>a</mi>
          <mi>b</mi>
          <mo>)</mo>
        </mtd>
      </mtr>
      <!-- Step two -->
      <mtr>
        <mtd>
          <msup>
            <mi>a</mi>
            <mn>2</mn>
          </msup>
          <mo>+</mo>
          <mn>2</mn>
          <mi>a</mi>
          <mi>b</mi>
          <mo>+</mo>
          <msup>
            <mi>b</mi>
            <mn>2</mn>
          </msup>
        </mtd>
        <mtd>
          <mo>=</mo>
        </mtd>
        <mtd>
          <msup>
            <mi>c</mi>
            <mn>2</mn>
          </msup>
          <mo>+</mo>
          <mn>2</mn>
          <mi>a</mi>
          <mi>b</mi>
        </mtd>
      </mtr>
      <!-- Step three -->
      <mtr>
        <mtd>
          <msup>
            <mi>a</mi>
            <mn>2</mn>
          </msup>
          <mo>+</mo>
          <msup>
            <mi>b</mi>
            <mn>2</mn>
          </msup>
        </mtd>
        <mtd>
          <mo>=</mo>
        </mtd>
        <mtd>
          <msup>
            <mi>c</mi>
            <mn>2</mn>
          </msup>
        </mtd>
      </mtr>
    </mtable>
    <!-- Representation in TeX format -->
    <annotation encoding="application/x-tex">
      \begin{aligned}
      (a + b)^2 &= c^2 + 4 \cdot \left( \frac{1}{2} ab \right) \\
      a^2 + 2ab + b^2 &= c^2 + 2ab \\
      a^2 + b^2 &= c^2
      \end{aligned}
    </annotation>
  </semantics>
</math>
```
<!-- prettier-ignore-end -->
