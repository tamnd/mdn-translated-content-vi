---
title: Vùng chứa văn bản trong MathML
short-title: Text containers
slug: Web/MathML/Tutorials/For_beginners/Text_containers
page-type: tutorial-chapter
sidebar: mathmlref
---

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Getting_started", "Web/MathML/Tutorials/For_beginners/Fractions_and_roots", "Web/MathML/Tutorials/For_beginners")}}

Giờ bạn đã có cái nhìn rõ hơn về MathML, chúng ta sẽ chuyển trọng tâm sang các vùng chứa văn bản (biến, số, toán tử, ...) được dùng làm khối xây dựng của các công thức MathML.

## Ký tự Unicode cho toán học

Các công thức toán học chứa nhiều ký tự đặc biệt, ví dụ các chữ cái Hy Lạp (ví dụ: Δ), chữ fraktur (ví dụ: 𝔄), chữ double-struck (ví dụ: ℂ), toán tử nhị phân (ví dụ: ≠), mũi tên (ví dụ: ⇒), ký hiệu tích phân (ví dụ: ∮), ký hiệu tổng (ví dụ: ∑), ký hiệu logic (ví dụ: ∀), ký hiệu ngoặc (ví dụ: ⌊) và còn nhiều nữa. Bài viết trên Wikipedia [Mathematical operators and symbols in Unicode](https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode) cung cấp một cái nhìn tổng quan tốt về các ký tự được dùng.

Vì hầu hết các ký tự này không thuộc khối Unicode Basic Latin, bạn nên chỉ định [mã hóa ký tự của tài liệu](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#specifying_your_documents_character_encoding) và phục vụ nó với [web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts) phù hợp. Sau đây là một mẫu cơ bản dùng mã hóa UTF-8 và phông [Latin Modern Math](/en-US/docs/Web/MathML/Guides/Fonts#fonts_with_a_math_table):

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với các ký tự toán học</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <p>∀A∊𝔰𝔩(n,𝔽),TrA=0</p>
  </body>
</html>
```

```css
p {
  font-family: "Latin Modern Math", math;
}
```

{{ EmbedLiveSample('Unicode_characters_for_mathematics', 700, 100, "", "") }}

## Một chút ngữ nghĩa

Chúng ta đã thấy trong bài [bắt đầu với MathML](/en-US/docs/Web/MathML/Tutorials/For_beginners/Getting_started) rằng văn bản trong các công thức MathML được bao trong các phần tử vùng chứa cụ thể như `<mn>` hoặc `<mo>`. Nói rộng hơn, mọi văn bản trong công thức MathML đều phải nằm trong các phần tử vùng chứa như vậy, được gọi là các phần tử _token_. Ngoài ra, MathML cung cấp nhiều phần tử token để phân biệt các ý nghĩa khác nhau của nội dung văn bản:

- Phần tử `<mi>` biểu diễn một "định danh", có thể là tên ký hiệu hoặc văn bản tùy ý. Ví dụ: `<mi>x</mi>` (biến), `<mi>cos</mi>` (tên hàm) và `<mi>π</mi>` (hằng ký hiệu).
- Phần tử `<mn>` biểu diễn một "hằng số số học" hoặc dữ liệu khác nên được hiển thị như một hằng số số học. Ví dụ: `<mn>2</mn>` (số nguyên), `<mn>0.123</mn>` (số thập phân) hoặc `<mn>0xFFEF</mn>` (giá trị thập lục phân).
- Phần tử `<mo>` biểu diễn một toán tử hoặc bất kỳ thứ gì nên được hiển thị như một toán tử. Ví dụ `<mo>+</mo>` (phép toán nhị phân), `<mo>≤</mo>` (quan hệ nhị phân), `<mo>∑</mo>` (ký hiệu tổng) hoặc `<mo>[</mo>` (ký hiệu ngoặc).
- Phần tử `<mtext>` được dùng để biểu diễn văn bản tùy ý. Ví dụ các từ ngắn trong công thức như `<mtext>if<mtext>` hoặc `<mtext>maps to</mtext>`.

### Đến lượt bạn: Nhận ra các phần tử token

Bên dưới là một ví dụ phức tạp hơn, cho biết giá trị tuyệt đối của một số thực bằng chính số đó nếu và chỉ nếu nó không âm. Chúng tôi muốn bạn thử nhận ra các phần tử token khác nhau và chúng được dùng để làm gì. Mỗi khi bạn bấm vào văn bản tương ứng, nó sẽ được tô sáng và một thông báo xác nhận sẽ hiện ra.

```html hidden live-sample___recognize_token_elements
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với các ký tự toán học</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math display="block">
      <mrow>
        <mrow>
          <mo>|</mo>
          <mi>x</mi>
          <mo>|</mo>
        </mrow>
        <mo>=</mo>
        <mi>x</mi>
      </mrow>
      <mtext>&nbsp;nếu và chỉ nếu&nbsp;</mtext>
      <mrow>
        <mi>x</mi>
        <mo>≥</mo>
        <mn>0</mn>
      </mrow>
    </math>
    <input type="button" id="clearOutput" value="Đặt lại" />
    <div id="output"></div>
  </body>
</html>
```

```css hidden live-sample___recognize_token_elements
.highlight {
  color: red;
}
math {
  font-size: 200%;
}
```

```js hidden live-sample___recognize_token_elements
const tokenElements = Array.from(
  document.querySelectorAll("mi, mo, mn, mtext"),
);
const outputDiv = document.getElementById("output");
function clearHighlight() {
  tokenElements.forEach((token) => {
    token.classList.remove("highlight");
  });
}
tokenElements.forEach((token) => {
  token.addEventListener("click", () => {
    clearHighlight();
    token.classList.add("highlight");
    outputDiv.insertAdjacentHTML(
      "beforeend",
      `<p><strong>Bạn đã bấm vào một phần tử <code>&lt;${token.tagName}&gt;</code>.</strong></p>`,
    );
  });
});
document.getElementById("clearOutput").addEventListener("click", () => {
  clearHighlight();
  outputDiv.textContent = "";
});
```

{{ EmbedLiveSample('recognize_token_elements', 700, 400, "", "") }}

Cuối cùng, hãy đọc mã nguồn MathML để kiểm tra xem nó có khớp với kỳ vọng của bạn hay không:

```xml
<math display="block">
  <mrow>
    <mrow>
      <mo>|</mo>
      <mi>x</mi>
      <mo>|</mo>
    </mrow>
    <mo>=</mo>
    <mi>x</mi>
  </mrow>
  <mtext>&nbsp;nếu và chỉ nếu&nbsp;</mtext>
  <mrow>
    <mi>x</mi>
    <mo>≥</mo>
    <mn>0</mn>
  </mrow>
</math>
```

> [!NOTE]
> Đôi khi rất khó quyết định nên dùng phần tử token nào cho một nội dung văn bản cụ thể. Trên thực tế, việc chọn sai phần tử thường không gây ra vấn đề lớn vì các phần tử token nhìn chung được các trình duyệt hiển thị giống nhau (cho cả hiển thị trực quan lẫn công nghệ hỗ trợ). Tuy nhiên, các phần tử `<mi>` và `<mo>` có những đặc điểm phân biệt riêng mà bạn nên biết. Chúng được giải thích trong các phần tiếp theo.

## Tự động nghiêng \<mi>

Một quy ước kiểu chữ trong toán học là dùng chữ nghiêng cho biến. Để hỗ trợ điều đó, các phần tử `<mi>` chỉ có một ký tự có thể được tự động hiển thị nghiêng. Điều này áp dụng cho tất cả các chữ cái trong bảng chữ cái latin và greek. Hãy so sánh cách hiển thị của hai phần tử `<mi>` trong công thức sau:

```html
<math>
  <mi>sin</mi>
  <mi>x</mi>
</math>
```

{{ EmbedLiveSample('Automatic italicization of <mi>', 700, 50) }}

> [!NOTE]
> [Bảng này từ MathML Core](https://w3c.github.io/mathml-core/#italic-mappings) cung cấp danh sách đầy đủ các ký tự chịu tác động của việc nghiêng, cùng với các ký tự nghiêng tương ứng.

## Hủy nghiêng tự động của \<mi>

Để bỏ phép biến đổi nghiêng mặc định này, bạn có thể gắn thuộc tính `mathvariant="normal"` vào phần tử `<mi>`.
Hãy so sánh cách hiển thị của các chữ gamma in hoa trong công thức sau:

```html
<math>
  <mi>Γ</mi>
  <mi mathvariant="normal">Γ</mi>
</math>
```

{{ EmbedLiveSample('Reverting automatic italicization of <mi>', 700, 50) }}

> [!NOTE]
> Dù bạn có thể áp dụng biến đổi này, thông thường bạn sẽ chỉ dùng [Mathematical Alphanumeric Symbols](https://en.wikipedia.org/wiki/Mathematical_Alphanumeric_Symbols) mong muốn.

## Thuộc tính toán tử của \<mo>

MathML chứa một [operator dictionary](https://w3c.github.io/mathml-core/#operator-dictionary-human) xác định các thuộc tính mặc định của phần tử `<mo>` tùy theo nội dung và vị trí của nó trong vùng chứa (prefix, infix hoặc postfix). Hãy xét một ví dụ cụ thể:

```html
<table>
  <tbody>
    <tr>
      <td>Phép cộng tiền tố</td>
      <td>
        <math>
          <mo>+</mo>
          <mi>i</mi>
        </math>
      </td>
    </tr>
    <tr>
      <td>Phép cộng trung tố</td>
      <td>
        <math>
          <mi>j</mi>
          <mo>+</mo>
          <mi>i</mi>
        </math>
      </td>
    </tr>
    <tr>
      <td>Tổng tiền tố</td>
      <td>
        <math>
          <mo>∑</mo>
          <mi>i</mi>
        </math>
      </td>
    </tr>
  </tbody>
</table>
```

Ví dụ này sẽ được hiển thị tương tự như ảnh chụp bên dưới. Hãy quan sát khoảng cách giữa các phần tử `<mi>i</mi>` và phần tử `<mo>` đứng trước nó: không có khoảng cách cho dấu cộng tiền tố, có khoảng cách cho dấu cộng trung tố và khoảng cách nhỏ hơn cho ký hiệu tổng tiền tố.

![Ảnh chụp công thức MathML với khoảng cách toán tử khác nhau](operator-spacing.png)

Toán tử có nhiều thuộc tính khác mà chúng ta sẽ xem kỹ hơn sau. Trước mắt, hãy nhớ dùng vùng chứa `<mo>` cho các ký tự nằm trong operator dictionary và nhóm các biểu thức con đúng cách bằng các phần tử `<mrow>` để hỗ trợ bộ hiển thị MathML.

### Nhận ra sự khác biệt

Bây giờ khi đã quen hơn với các đặc điểm đặc biệt của `<mi>` và `<mo>`, chúng tôi muốn bạn viết lại phần tử `<p>` trong [ví dụ ở đầu trang](#unicode_characters_for_mathematics) bằng MathML thật sự. Hãy so sánh cách hiển thị trong trình duyệt của bạn và giải thích sự khác nhau so với phiên bản chỉ có văn bản.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với các ký tự toán học</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <p class="text">∀A∊𝔰𝔩(n,𝔽),TrA=0</p>
    <p>
      <math>
        <mo>∀</mo>
        <mrow>
          <mi>A</mi>
          <mo>∊</mo>
          <mrow>
            <mi>𝔰𝔩</mi>
            <mrow>
              <mo>(</mo>
              <mi>n</mi>
              <mo>,</mo>
              <mi>𝔽</mi>
              <mo>)</mo>
            </mrow>
          </mrow>
        </mrow>
        <mo>,</mo>
        <mrow>
          <mrow>
            <mi>Tr</mi>
            <mi>A</mi>
          </mrow>
          <mo>=</mo>
          <mn>0</mn>
        </mrow>
      </math>
    </p>
    <input id="showSolution" type="button" value="Hiển thị lời giải" />
    <div id="solution"></div>
  </body>
</html>
```

```css hidden
div {
  padding: 0.5em;
}

.text {
  font-family: "Latin Modern Math", math;
}
```

```js hidden
document.getElementById("showSolution").addEventListener(
  "click",
  () => {
    document.getElementById("solution").insertAdjacentHTML(
      "beforeEnd",
      `<ul>
      <li><strong>Các phần tử <code>&lt;mi&gt;</code> chứa biến "A" và "n" được hiển thị nghiêng</strong>. Tuy nhiên, các phần tử <code>&lt;mi&gt;</code> có nhiều ký tự như "𝔰𝔩" hoặc có ký tự "𝔽" vẫn được hiển thị đứng.</li>
      <li><strong>Khoảng cách được tự động thêm quanh các phần tử <code>&lt;mo&gt;</code> có văn bản là "∀", "∊", "=" hoặc dấu phẩy</strong>. Tuy nhiên, một số trong đó không có khoảng cách phía trước, trong khi các dấu ngoặc vẫn không có khoảng cách xung quanh.</li>
    </ul>`,
    );
  },
  { once: true },
);
```

{{ EmbedLiveSample('spot_the_difference', 700, 500, "", "") }}

> [!NOTE]
> Một khác biệt rõ ràng là mã nguồn trở nên dài dòng hơn nhiều với MathML. Hãy nhớ rằng bài hướng dẫn này nhằm học ngôn ngữ này, nhưng trên thực tế nội dung MathML thường không được viết tay. Xem trang [Authoring MathML](/en-US/docs/Web/MathML/Guides/Authoring) để biết thêm thông tin.

### Nhận ra các toán tử co giãn

Operator dictionary xác định một thuộc tính mặc định _stretchy_ cùng với _stretch axis_ tương ứng cho một số toán tử. Ví dụ, một toán tử có thể co giãn theo chiều dọc mặc định để bao phủ chiều cao tối đa của các phần tử anh em không co giãn bên trong vùng chứa `<mrow>`. Bằng cách chỉnh một [bài tập trước](#your_turn_recognizing_token_elements), bạn có thể làm cho các toán tử co giãn theo chiều dọc. Bạn có tìm ra chúng không?

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với các toán tử co giãn</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math display="block">
      <mrow>
        <mrow>
          <mo>|</mo>
          <mfrac>
            <mn>1</mn>
            <mi>x</mi>
          </mfrac>
          <mo>|</mo>
        </mrow>
        <mo>=</mo>
        <mfrac>
          <mn>1</mn>
          <mrow>
            <mo>|</mo>
            <mi>x</mi>
            <mo>|</mo>
          </mrow>
        </mfrac>
        <mo>=</mo>
        <mfrac>
          <mn>1</mn>
          <mi>x</mi>
        </mfrac>
      </mrow>
      <mtext>&nbsp;nếu và chỉ nếu&nbsp;</mtext>
      <mrow>
        <mi>x</mi>
        <mo>≥</mo>
        <mn>0</mn>
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
const tokenElements = Array.from(
  document.querySelectorAll("mi, mo, mn, mtext"),
);
const stretchyMoElements = Array.from(
  document.getElementsByTagName("mo"),
).slice(0, 2);
const outputDiv = document.getElementById("output");
function clearHighlight() {
  tokenElements.forEach((token) => {
    token.classList.remove("highlight");
  });
}
tokenElements.forEach((token) => {
  token.addEventListener("click", () => {
    clearHighlight();
    token.classList.add("highlight");
    let message = "";
    let tagName = `<code>&lt;${token.tagName}&gt;</code>`;
    if (token.tagName !== "mo") message = `Không, đây là phần tử ${tagName}!`;
    else if (!stretchyMoElements.includes(token))
      message = `Không, đây là phần tử ${tagName}, nhưng nó không được co giãn theo chiều dọc.`;
    else
      message = `Đúng, phần tử ${tagName} này thực sự được co giãn đến chiều cao của phần tử anh em <code>&lt;mfrac&gt;</code>.`;
    outputDiv.insertAdjacentHTML(
      "beforeend",
      `<p><strong>${message}</strong></p>`,
    );
  });
});
document.getElementById("clearOutput").addEventListener("click", () => {
  clearHighlight();
  outputDiv.textContent = "";
});
```

{{ EmbedLiveSample('recognizing_stretchy_operators', 700, 400, "", "") }}

Như thường lệ, bạn được khuyến khích đọc mã nguồn sau khi hoàn thành:

```xml
<math display="block">
  <mrow>
    <mrow>
      <mo>|</mo>
      <mfrac>
        <mn>1</mn>
        <mi>x</mi>
      </mfrac>
      <mo>|</mo>
    </mrow>
    <mo>=</mo>
    <mfrac>
      <mn>1</mn>
      <mrow>
        <mo>|</mo>
        <mi>x</mi>
        <mo>|</mo>
      </mrow>
    </mfrac>
    <mo>=</mo>
    <mfrac>
      <mn>1</mn>
      <mi>x</mi>
    </mfrac>
  </mrow>
  <mtext>&nbsp;nếu và chỉ nếu&nbsp;</mtext>
  <mrow>
    <mi>x</mi>
    <mo>≥</mo>
    <mn>0</mn>
  </mrow>
</math>
```

> [!WARNING]
> Các [phông toán học](/en-US/docs/Web/MathML/Guides/Fonts) đặc biệt thường được yêu cầu để việc co giãn này hoạt động; ví dụ trước dựa vào [web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts).

## Tóm tắt

Trong bài viết này, chúng ta đã tìm hiểu một vài phần tử _token_ được dùng làm vùng chứa văn bản cùng với ngữ nghĩa khác nhau của chúng, cụ thể là `<mi>` (định danh), `<mn>` (số), `<mo>` (toán tử), `<mtext>` (văn bản tổng quát). Chúng ta đã xem các ký tự Unicode đặc biệt thường gặp trong công thức toán và có cái nhìn tổng quan về một số hành vi quan sát được của các phần tử `<mi>` và `<mo>`. Trong bài tiếp theo, chúng ta sẽ xem cách dựa vào các phần tử _token_ để xây dựng những biểu thức phức tạp hơn nhiều như [phân số và căn](/en-US/docs/Web/MathML/Tutorials/For_beginners/Fractions_and_roots).

## Xem thêm

- [Phần tử `<mi>`](/en-US/docs/Web/MathML/Reference/Element/mi)
- [Phần tử `<mn>`](/en-US/docs/Web/MathML/Reference/Element/mn)
- [Phần tử `<mo>`](/en-US/docs/Web/MathML/Reference/Element/mo)
- [Phần tử `<mtext>`](/en-US/docs/Web/MathML/Reference/Element/mtext)

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Getting_started", "Web/MathML/Tutorials/For_beginners/Fractions_and_roots", "Web/MathML/Tutorials/For_beginners")}}
