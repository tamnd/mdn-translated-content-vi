---
title: Phần tử có chỉ số trong MathML
short-title: Scripted elements
slug: Web/MathML/Tutorials/For_beginners/Scripts
page-type: tutorial-chapter
sidebar: mathmlref
---

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Fractions_and_roots", "Web/MathML/Tutorials/For_beginners/Tables", "Web/MathML/Tutorials/For_beginners")}}

Chúng ta tiếp tục xem xét các ký hiệu toán cơ bản và tập trung vào việc xây dựng các phần tử MathML có chỉ số.

## Chỉ số dưới và chỉ số trên

Tương tự như những gì chúng ta đã thấy trong [bài trước](/en-US/docs/Web/MathML/Tutorials/For_beginners/Fractions_and_roots), các phần tử `<msub>`, `<msup>` và `<msubsup>` có cấu trúc đặc biệt, chỉ chấp nhận đúng hai phần tử con (đối với `<msub>`, `<msup>`) hoặc ba phần tử con (đối với `<msubsup>`):

```html
<p>
  msub:
  <math>
    <msub>
      <mtext>child1</mtext>
      <mtext>child2</mtext>
    </msub>
  </math>
</p>

<p>
  msup:
  <math>
    <msup>
      <mtext>child1</mtext>
      <mtext>child2</mtext>
    </msup>
  </math>
</p>
<p>
  msubsup:
  <math>
    <msubsup>
      <mtext>child1</mtext>
      <mtext>child2</mtext>
      <mtext>child3</mtext>
    </msubsup>
  </math>
</p>
```

Bên dưới là cách ví dụ trên được hiển thị trong trình duyệt của bạn.

{{ EmbedLiveSample('Subtrees_of_msub_msup_msubsup', 700, 200, "", "") }}

Bạn nên chú ý rằng:

- Phần tử con thứ hai của phần tử `<msub>` được gắn làm chỉ số dưới của phần tử con thứ nhất.
- Phần tử con thứ hai của phần tử `<msup>` được gắn làm chỉ số trên của phần tử con thứ nhất.
- Phần tử con thứ hai và thứ ba của phần tử `<msubsup>` lần lượt được gắn làm chỉ số dưới và chỉ số trên của phần tử con thứ nhất.
- Văn bản bên trong các chỉ số được thu nhỏ lại.

> [!NOTE]
> Các phần tử MathML `<msub>` và `<msup>` khác với các phần tử HTML [`<sub>`](/en-US/docs/Web/HTML/Reference/Elements/sub) và [`<sup>`](/en-US/docs/Web/HTML/Reference/Elements/sup). Chúng cho phép tác giả cung cấp các cây con MathML tùy ý làm chỉ số, chứ không chỉ là văn bản.

## Chỉ số dưới và chỉ số trên phía dưới

Các phần tử `<munder>`, `<mover>` và `<munderover>` rất giống nhau, chỉ khác là chúng được dùng để gắn chỉ số dưới và chỉ số trên phía trên. Thay vì giải thích ngay, chúng ta sẽ để bạn tự suy ra định nghĩa của chúng qua bài tập sau.

### Nhận ra chỉ số dưới/trên

Trong ví dụ sau, hãy thử đoán tên của các phần tử bí ẩn (được viết bằng dấu hỏi) và bấm nút để xem lời giải:

```html hidden
<p>
  Phần tử <code>&lt;<span>????????</span>&gt;</code> với đúng hai phần tử con
  (child1, child2):
  <math>
    <mover>
      <mtext>child1</mtext>
      <mtext>child2</mtext>
    </mover>
  </math>
</p>
<p>
  Phần tử <code>&lt;<span>????????</span>&gt;</code> với đúng ba phần tử con
  (child1, child2 và child3):
  <math>
    <munderover>
      <mtext>child1</mtext>
      <mtext>child2</mtext>
      <mtext>child3</mtext>
    </munderover>
  </math>
</p>
<p>
  Phần tử <code>&lt;<span>????????</span>&gt;</code> với đúng hai phần tử con
  (child1, child2):
  <math>
    <munder>
      <mtext>child1</mtext>
      <mtext>child2</mtext>
    </munder>
  </math>
</p>

<p><input type="button" id="showSolution" value="Hiển thị lời giải" /></p>
```

```css hidden
p {
  padding: 0.5em;
}
```

```js hidden
document.getElementById("showSolution").addEventListener("click", () => {
  const maths = Array.from(document.getElementsByTagName("math"));
  Array.from(document.getElementsByTagName("span")).forEach((span, index) => {
    span.textContent = maths[index].firstElementChild.tagName;
  });
});
```

{{ EmbedLiveSample('Recognizing under/over scripts', 700, 400, "", "") }}

### Nhận ra các phần tử có chỉ số

Công thức MathML sau đây chứa một biểu thức phức tạp hơn, lồng phân số, căn và các chỉ số. Hãy thử đoán các phần tử được bố trí bằng những phần tử có chỉ số `<msub>`, `<msup>`, `<msubsup>`, `<munder>`, `<mover>`, `<munderover>`. Mỗi khi bạn bấm vào một phần tử như vậy, nó sẽ được tô sáng và một thông báo xác nhận sẽ hiện ra. Cuối cùng, hãy đọc mã nguồn MathML để kiểm tra xem nó có khớp với dự đoán của bạn không.

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với các phần tử có chỉ số</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math display="block">
      <mroot>
        <mrow>
          <munder>
            <mi>β</mi>
            <mo>⎵</mo>
          </munder>
        </mrow>
        <mn>3</mn>
      </mroot>
      <mo>+</mo>
      <mfrac>
        <mrow>
          <mo>|</mo>
          <mover>
            <mi>α</mi>
            <mo>→</mo>
          </mover>
          <mo>|</mo>
        </mrow>
        <msup>
          <mi>s</mi>
          <mn>3</mn>
        </msup>
      </mfrac>
      <mo>−</mo>
      <mrow>
        <munderover>
          <mo>∑</mo>
          <mrow>
            <mi>i</mi>
            <mo>=</mo>
            <mn>1</mn>
          </mrow>
          <mi>n</mi>
        </munderover>
        <msqrt>
          <mrow>
            <msub>
              <mi>a</mi>
              <mi>i</mi>
            </msub>
            <mo>−</mo>
            <msubsup>
              <mi>K</mi>
              <mn>0</mn>
              <mi>i</mi>
            </msubsup>
          </mrow>
        </msqrt>
      </mrow>
    </math>
    <input type="button" id="clearOutput" value="Đặt lại" />
    <div id="output"></div>
  </body>
</html>
```

```css hidden
.highlight {
  color: red;
}
math {
  font-size: 200%;
}
```

```js hidden
const scriptedElements = Array.from(
  document.querySelectorAll("msub, msup, msubsup, munder, mover, munderover"),
);
const outputDiv = document.getElementById("output");
function clearHighlight() {
  scriptedElements.forEach((scripted) => {
    scripted.classList.remove("highlight");
  });
}
scriptedElements.forEach((scripted) => {
  scripted.addEventListener("click", () => {
    clearHighlight();
    scripted.classList.add("highlight");
    outputDiv.insertAdjacentHTML(
      "beforeend",
      `<p><strong>Bạn đã bấm vào một phần tử <code>&lt;${scripted.tagName}&gt;</code>.</strong></p>`,
    );
  });
});
document.getElementById("clearOutput").addEventListener("click", () => {
  clearHighlight();
  outputDiv.textContent = "";
});
```

{{ EmbedLiveSample('Recognizing scripted elements', 700, 400, "", "") }}

## Thêm thuộc tính của toán tử

Trước đó chúng ta đã thấy một vài [thuộc tính của phần tử `<mo>`](/en-US/docs/Web/MathML/Tutorials/For_beginners/Text_containers#operator_properties_of_mo), cụ thể là khả năng co giãn theo chiều dọc và khoảng cách. Bây giờ khi các phần tử có chỉ số đã sẵn có, chúng ta có thể mở rộng danh sách đó. Chúng ta sẽ làm điều đó bằng cách chỉnh lại [ví dụ trước](#recognizing_scripted_elements).

### Co giãn theo chiều ngang

Trước hết, hãy thực hiện các phép thay thế <math><mi>β</mi><mo>≔</mo><mrow><msub><mi>z</mi><mn>1</mn></msub><mo>+</mo><msub><mi>z</mi><mn>2</mn></msub></mrow><annotation encoding="TeX">\beta := z*{1} + z*{2}</annotation></math> và <math><mi>α</mi><mo>≔</mo><mrow><msub><mi>v</mi><mn>1</mn></msub><mo>+</mo><msub><mi>v</mi><mn>2</mn></msub></mrow><annotation encoding="TeX">\alpha := v*{1} + v*{2}</annotation></math>:

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với toán tử co giãn theo chiều ngang</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math display="block">
      <mroot>
        <mrow>
          <munder>
            <mrow>
              <msub>
                <mi>z</mi>
                <mn>1</mn>
              </msub>
              <mo>+</mo>
              <msub>
                <mi>z</mi>
                <mn>2</mn>
              </msub>
            </mrow>
            <mo>⎵</mo>
          </munder>
        </mrow>
        <mn>3</mn>
      </mroot>
      <mo>+</mo>
      <mfrac>
        <mrow>
          <mo>|</mo>
          <mover>
            <mrow>
              <msub>
                <mi>v</mi>
                <mn>1</mn>
              </msub>
              <mo>+</mo>
              <msub>
                <mi>v</mi>
                <mn>2</mn>
              </msub>
            </mrow>
            <mo>→</mo>
          </mover>
          <mo>|</mo>
        </mrow>
        <msup>
          <mi>s</mi>
          <mn>3</mn>
        </msup>
      </mfrac>
      <mo>−</mo>
      <mrow>
        <munderover>
          <mo>∑</mo>
          <mrow>
            <mi>i</mi>
            <mo>=</mo>
            <mn>1</mn>
          </mrow>
          <mi>n</mi>
        </munderover>
        <msqrt>
          <mrow>
            <msub>
              <mi>a</mi>
              <mi>i</mi>
            </msub>
            <mo>−</mo>
            <msubsup>
              <mi>K</mi>
              <mn>0</mn>
              <mi>i</mi>
            </msubsup>
          </mrow>
        </msqrt>
      </mrow>
    </math>
  </body>
</html>
```

```css hidden
.highlight {
  color: red;
}
math {
  font-size: 200%;
}
```

{{ EmbedLiveSample('Stretching_in_horizontal_direction', 700, 200, "", "") }}

Ta nhận ra rằng dấu ngoặc dưới "⎵" và mũi tên sang phải "→" co giãn theo chiều ngang để bao phủ độ rộng của các giá trị đã thay thế. Hãy nhớ rằng [một số toán tử theo chiều dọc có thể co giãn](/en-US/docs/Web/MathML/Tutorials/For_beginners/Text_containers#recognizing_stretchy_operators) để bao phủ chiều cao của các phần tử anh em không co giãn trong một phần tử `<mrow>`. Tương tự, một số toán tử theo chiều ngang có thể co giãn để bao phủ chiều rộng của các phần tử anh em không co giãn trong phần tử `<munder>`, `<mover>` hoặc `<munderover>`.

> [!NOTE]
> Việc co giãn có thể xảy ra với bất kỳ phần tử con nào của phần tử `<munder>`, `<mover>` hoặc `<munderover>`, không chỉ riêng chỉ số dưới hay chỉ số trên.

### Toán tử lớn và giới hạn

Cho đến giờ ví dụ của chúng ta thực ra đã được hiển thị với thuộc tính [`display="block"`](/en-US/docs/Web/MathML/Tutorials/For_beginners/Getting_started#the_display_attribute). Hãy xem cùng ví dụ đó, nhưng không có thuộc tính này:

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với giới hạn được chuyển và largeop nhỏ</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math>
      <mroot>
        <mrow>
          <munder>
            <mrow>
              <msub>
                <mi>z</mi>
                <mn>1</mn>
              </msub>
              <mo>+</mo>
              <msub>
                <mi>z</mi>
                <mn>2</mn>
              </msub>
            </mrow>
            <mo>⎵</mo>
          </munder>
        </mrow>
        <mn>3</mn>
      </mroot>
      <mo>+</mo>
      <mfrac>
        <mrow>
          <mo>|</mo>
          <mover>
            <mrow>
              <msub>
                <mi>v</mi>
                <mn>1</mn>
              </msub>
              <mo>+</mo>
              <msub>
                <mi>v</mi>
                <mn>2</mn>
              </msub>
            </mrow>
            <mo>→</mo>
          </mover>
          <mo>|</mo>
        </mrow>
        <msup>
          <mi>s</mi>
          <mn>3</mn>
        </msup>
      </mfrac>
      <mo>−</mo>
      <mrow>
        <munderover>
          <mo>∑</mo>
          <mrow>
            <mi>i</mi>
            <mo>=</mo>
            <mn>1</mn>
          </mrow>
          <mi>n</mi>
        </munderover>
        <msqrt>
          <mrow>
            <msub>
              <mi>a</mi>
              <mi>i</mi>
            </msub>
            <mo>−</mo>
            <msubsup>
              <mi>K</mi>
              <mn>0</mn>
              <mi>i</mi>
            </msubsup>
          </mrow>
        </msqrt>
      </mrow>
    </math>
  </body>
</html>
```

```css hidden
.highlight {
  color: red;
}
math {
  font-size: 200%;
}
```

{{ EmbedLiveSample('Large_operator_and_limits', 700, 200, "", "") }}

Đúng như mong đợi, công thức không còn được căn giữa và cách hiển thị được chỉnh để giảm chiều cao tối đa. Khi tập trung vào ký hiệu tổng, ta có thể thấy sigma được vẽ nhỏ hơn và các chỉ số của phần tử `<munderover>` giờ được gắn như chỉ số dưới và chỉ số trên! Điều này là do hai thuộc tính của toán tử "∑":

- _largeop_: Toán tử được vẽ bằng glyph lớn hơn nếu thẻ `<math>` có thuộc tính `display="block"`.
- _movablelimits_: Các chỉ số dưới và chỉ số trên gắn với toán tử sẽ lần lượt được hiển thị như chỉ số dưới và chỉ số trên nếu thẻ `<math>` không có thuộc tính `display="block"`.

> [!NOTE]
> Thuộc tính _largeop_ thực ra không liên quan đến chỉ số, dù các toán tử có thuộc tính này thường có chỉ số. Thuộc tính _movablelimits_ cũng được áp dụng cho các phần tử `<munder>` và `<mover>`.

## Tóm tắt

Trong bài viết này, chúng ta đã hoàn tất phần xem xét bố cục cơ bản bằng cách giới thiệu các phần tử `<msub>`, `<msup>`, `<msubsup>`, `<munder>`, `<mover>`, `<munderover>` cho chỉ số dưới, chỉ số trên, chỉ số dưới phía dưới và chỉ số trên phía trên. Dùng các phần tử này, chúng ta cũng đã giới thiệu ngắn gọn một vài thuộc tính mới của phần tử `<mo>`. Trong bài tiếp theo, chúng ta sẽ tiếp tục tập trung vào [bố cục dạng bảng](/en-US/docs/Web/MathML/Tutorials/For_beginners/Tables).

## Xem thêm

- [Phần tử `<msub>`](/en-US/docs/Web/MathML/Reference/Element/msub)
- [Phần tử `<msup>`](/en-US/docs/Web/MathML/Reference/Element/msup)
- [Phần tử `<msubsup>`](/en-US/docs/Web/MathML/Reference/Element/msubsup)
- [Phần tử `<munder>`](/en-US/docs/Web/MathML/Reference/Element/munder)
- [Phần tử `<mover>`](/en-US/docs/Web/MathML/Reference/Element/mover)
- [Phần tử `<munderover>`](/en-US/docs/Web/MathML/Reference/Element/munderover)

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Fractions_and_roots", "Web/MathML/Tutorials/For_beginners/Tables", "Web/MathML/Tutorials/For_beginners")}}
