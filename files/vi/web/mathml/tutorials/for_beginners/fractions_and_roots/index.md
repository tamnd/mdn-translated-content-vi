---
title: Phân số và căn trong MathML
short-title: Fractions and roots
slug: Web/MathML/Tutorials/For_beginners/Fractions_and_roots
page-type: tutorial-chapter
sidebar: mathmlref
---

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Text_containers", "Web/MathML/Tutorials/For_beginners/Scripts", "Web/MathML/Tutorials/For_beginners")}}

Dựa trên các vùng chứa văn bản, bài viết này mô tả cách xây dựng các biểu thức MathML phức tạp hơn bằng cách lồng phân số và căn.

## Cây con của \<mfrac>, \<msqrt> và \<mroot>

Trong bài [bắt đầu với MathML](/en-US/docs/Web/MathML/Tutorials/For_beginners/Getting_started), chúng ta đã gặp phần tử `<mfrac>` để mô tả một phân số. Hãy xem một ví dụ cơ bản, thêm các phần tử mới cho căn (`<msqrt>` và `<mroot>`):

```html
<math>
  <mfrac>
    <mtext>child1</mtext>
    <mtext>child2</mtext>
  </mfrac>
</math>
<br />
<math>
  <msqrt>
    <mtext>child1</mtext>
    <mtext>child2</mtext>
    <mtext>...</mtext>
    <mtext>childN</mtext>
  </msqrt>
</math>
<br />
<math>
  <mroot>
    <mtext>child1</mtext>
    <mtext>child2</mtext>
  </mroot>
</math>
```

Bên dưới là ảnh chụp cách trình duyệt hiển thị:

![Ảnh chụp mfrac, msqrt, mroot](mfrac-msqrt-mroot.png)

- Chúng ta đã biết phần tử `<mfrac>` được hiển thị như một phân số: phần tử con đầu tiên (tử số) nằm phía trên phần tử con thứ hai (mẫu số), được ngăn cách bởi một đường ngang.
- Phần tử `<msqrt>` được hiển thị như căn bậc hai: các phần tử con của nó được bố trí giống như một [`<mrow>`](/en-US/docs/Web/MathML/Tutorials/For_beginners/Getting_started#grouping_with_the_mrow_element), đứng sau ký hiệu căn √ và được phủ hoàn toàn bởi một gạch ngang phía trên.
- Cuối cùng, phần tử `<mroot>` được hiển thị như căn bậc n: phần tử đầu tiên được bao bởi ký hiệu căn, còn phần tử thứ hai được dùng làm số mũ của căn và hiển thị dưới dạng chỉ số trên ở phía trước.

### Lồng các phần tử khác nhau

Đây là một bài tập để kiểm tra xem bạn đã hiểu mối quan hệ giữa cây con MathML và cách nó được hiển thị trực quan hay chưa. Tài liệu chứa một công thức MathML và bạn phải kiểm tra mọi cây con tương ứng với một cây con trong công thức đó. Khi xong, bạn có thể xem mã nguồn của công thức MathML và kiểm tra xem nó có khớp với dự đoán của bạn không.

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Trang của tôi với ký tự toán học</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <p>
      <math>
        <mfrac id="mfrac1">
          <msqrt id="msqrt1">
            <mn>2</mn>
          </msqrt>
          <mroot id="mroot1">
            <mn>4</mn>
            <mn>3</mn>
          </mroot>
        </mfrac>
        <mo>+</mo>
        <mroot id="mroot2">
          <mn>5</mn>
          <mfrac id="mfrac2">
            <mn>6</mn>
            <mn>7</mn>
          </mfrac>
        </mroot>
        <mo>+</mo>
        <msqrt id="msqrt2">
          <mn>8</mn>
          <mo>−</mo>
          <mn>9</mn>
        </msqrt>
      </math>
    </p>

    <ol id="options">
      <li>
        <input
          type="checkbox"
          data-comment="Hãy kiểm tra thứ tự của các phần tử con trong một mfrac!" />
        Một mfrac với một mroot làm phần tử con thứ nhất và một msqrt làm phần
        tử con thứ hai.
      </li>
      <li>
        <input
          type="checkbox"
          data-highlight="mroot2"
          data-comment="Căn bậc '6 trên 7' của năm." />
        Một mroot với một mn làm phần tử con thứ nhất và mfrac làm phần tử con
        thứ hai.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Công thức này không có phân số nào bên trong căn bậc hai!" />
        Một msqrt chứa một phần tử mfrac.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Căn bậc hai của hai."
          data-highlight="msqrt1" />
        Một msqrt với một phần tử con mn.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Hãy kiểm tra thứ tự của các phần tử con trong một mroot!" />
        Một mroot với một mfrac làm phần tử con thứ nhất và mn làm phần tử con
        thứ hai.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Căn bậc hai của 'tám trừ chín'."
          data-highlight="msqrt2" />
        Một msqrt với danh sách phần tử con sau: mn, mo, mn.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Căn bậc hai của hai chia cho căn bậc ba của bốn."
          data-highlight="mfrac1" />
        Một mfrac với một msqrt làm phần tử con thứ nhất và một mroot làm phần
        tử con thứ hai.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="mfrac phải có đúng hai phần tử con!" />
        Một mfrac với danh sách phần tử con sau: msqrt, mn, msqrt.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="mroot phải có đúng hai phần tử con!" />
        Một mroot với một phần tử con mn.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Phân số sáu trên bảy."
          data-highlight="mfrac2" />
        Một mfrac với hai phần tử con mn.
      </li>
      <li>
        <input
          type="checkbox"
          data-comment="Công thức này không có căn bậc hai nào với hơn hai số!" />
        Một msqrt với năm phần tử con mn.
      </li>
      <li>
        <input
          type="checkbox"
          data-highlight="mroot1"
          data-comment="Căn bậc ba của bốn." />
        Một mroot với hai phần tử con mn.
      </li>
    </ol>
    <p>
      <strong id="comment"></strong>
    </p>
    <p>
      <strong id="status"></strong>
    </p>
  </body>
</html>
```

```css hidden
math {
  font-family: "Latin Modern Math", "STIX Two Math", math;
  font-size: 200%;
}
math .highlight {
  background: pink;
}
math [id] .highlight {
  background: lightblue;
}
p {
  padding: 0.5em;
}
```

```js hidden
const options = document.getElementById("options");
const comment = document.getElementById("comment");
const checkboxes = Array.from(options.getElementsByTagName("input"));
const status = document.getElementById("status");
function verifyOption(checkbox) {
  const mathml = checkbox.dataset.highlight
    ? document.getElementById(checkbox.dataset.highlight)
    : null;
  if (checkbox.checked) {
    comment.textContent = checkbox.dataset.comment;
    if (mathml) {
      mathml.classList.add("highlight");
    } else {
      checkbox.checked = false;
    }
  } else {
    comment.textContent = "";
    if (mathml) {
      mathml.classList.remove("highlight");
    }
  }
  const finished = checkboxes.every(
    (checkbox) => !!checkbox.checked === !!checkbox.dataset.highlight,
  );
  status.textContent = finished
    ? "Chúc mừng, bạn đã chọn đúng tất cả các câu trả lời!"
    : "";
}
checkboxes.forEach((checkbox) => {
  checkbox.addEventListener("change", () => {
    verifyOption(checkbox);
  });
});
```

{{ EmbedLiveSample('nesting_different_elements', 700, 600, "", "") }}

## Ký hiệu căn co giãn

Như đã thấy trước đó, gạch ngang của các phần tử `<msqrt>` và `<mroot>` kéo dài theo chiều ngang để bao phủ nội dung của chúng. Nhưng thực ra ký hiệu căn √ cũng co giãn để cao bằng nội dung.

```html hidden
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
```

```html
<math display="block">
  <mroot>
    <msqrt>
      <mfrac>
        <mn>1</mn>
        <mn>2</mn>
      </mfrac>
    </msqrt>
    <mn>3</mn>
  </mroot>
</math>
```

{{ EmbedLiveSample('Stretchy_radical_symbols', 700, 200, "", "") }}

> [!WARNING]
> Các [phông toán học](/en-US/docs/Web/MathML/Guides/Fonts) đặc biệt thường được yêu cầu để việc co giãn này hoạt động; ví dụ trước dựa vào [web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts).

## Phân số không có vạch

Một số khái niệm toán học đôi khi được viết bằng ký hiệu giống phân số như [hệ số nhị thức](https://en.wikipedia.org/wiki/Combination) hoặc [ký hiệu Legendre](https://en.wikipedia.org/wiki/Legendre_symbol). Việc dùng phần tử `<mfrac>` để đánh dấu những ký hiệu như vậy là phù hợp. Với các ký hiệu giống phân số không vẽ đường ngang, hãy gắn thuộc tính `linethickness="0"` vào phần tử `<mfrac>`:

```html hidden
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
```

```html
<math display="block">
  <mrow>
    <mo>(</mo>
    <mfrac linethickness="0">
      <mn>3</mn>
      <mn>2</mn>
    </mfrac>
    <mo>)</mo>
  </mrow>
  <mo>=</mo>
  <mn>3</mn>
  <mo>≠</mo>
  <mfrac>
    <mn>3</mn>
    <mn>2</mn>
  </mfrac>
</math>
```

{{ EmbedLiveSample('Fraction_without_bar', 700, 200, "", "") }}

> [!NOTE]
> Dù thuộc tính `linethickness` có thể được dùng để chỉ định độ dày tùy ý, tốt hơn là nên giữ giá trị mặc định, vì giá trị này được tính từ các tham số được chỉ định trong phông toán học.

## Tóm tắt

Trong bài học này, chúng ta đã xem cách xây dựng phân số và căn bằng các phần tử `<mfrac>`, `<msqrt>` và `<mroot>`. Chúng ta đã nhận ra một vài đặc tính đặc biệt của các phần tử này, cụ thể là ký hiệu phân số và ký hiệu căn. Chúng ta cũng đã xem cách dùng thuộc tính `linethickness` để vẽ phân số không có vạch. Trong bài tiếp theo, chúng ta sẽ tiếp tục với các ký hiệu toán cơ bản và xem xét [chỉ số](/en-US/docs/Web/MathML/Tutorials/For_beginners/Scripts).

## Xem thêm

- [Phần tử `<mfrac>`](/en-US/docs/Web/MathML/Reference/Element/mfrac)
- [Phần tử `<msqrt>`](/en-US/docs/Web/MathML/Reference/Element/msqrt)
- [Phần tử `<mroot>`](/en-US/docs/Web/MathML/Reference/Element/mroot)

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Text_containers", "Web/MathML/Tutorials/For_beginners/Scripts", "Web/MathML/Tutorials/For_beginners")}}
