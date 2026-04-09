---
title: "Thử thách: Ba công thức toán nổi tiếng"
short-title: Famous formulas
slug: Web/MathML/Tutorials/For_beginners/Three_famous_mathematical_formulas
page-type: tutorial-chapter
sidebar: mathmlref
---

{{PreviousMenu("Web/MathML/Tutorials/For_beginners/Tables", "Web/MathML/Tutorials/For_beginners")}}

Với những gì bạn đã học trong các bài trước, bạn hẳn đã có thể viết các công thức MathML tương đối tinh vi. Thử thách này cho bạn cơ hội để làm điều đó.

## Một bài toán nhỏ

Mục tiêu là viết lại bài toán sau bằng HTML và MathML:

![Ảnh chụp đầu ra PDF được tạo bởi XeLaTeX](xelatex-output.png)

Mặc dù bạn không cần phải quen thuộc với [LaTeX](https://en.wikipedia.org/wiki/LaTeX), nhưng có thể hữu ích nếu biết mã nguồn LaTeX dùng để tạo ra nó:

```latex
\documentclass{article}

\usepackage{amsmath}
\usepackage{amssymb}

\begin{document}

Để giải phương trình bậc ba $t^3 + pt + q = 0$ (trong đó các số thực
$p, q$ thỏa mãn ${4p^3 + 27q^2} > 0$) ta có thể dùng công thức Cardano:

\[
  \sqrt[{3}]{
    -\frac{q}{2}
    +\sqrt{\frac{q^2}{4} + {\frac{p^{3}}{27}}}
  }+
  \sqrt[{3}]{
    -\frac{q}{2}
    -\sqrt{\frac{q^2}{4} + {\frac{p^{3}}{27}}}
  }
\]

Với mọi $u_1, \dots, u_n \in \mathbb{C}$ và
$v_1, \dots, v_n \in \mathbb{C}$, bất đẳng thức Cauchy–Bunyakovsky–Schwarz
có thể được viết như sau:

\[
  \left| \sum_{k=1}^n {u_k \bar{v_k}} \right|^2
  \leq
  {
    \left( \sum_{k=1}^n {|u_k|} \right)^2
    \left( \sum_{k=1}^n {|v_k|} \right)^2
  }
\]

Cuối cùng, định thức của một ma trận Vandermonde có thể được tính bằng
biểu thức sau:

\[
  \begin{vmatrix}
  1 & x_1 & x_1^2 & \dots & x_1^{n-1} \\
  1 & x_2 & x_2^2 & \dots & x_2^{n-1} \\
  1 & x_3 & x_3^2 & \dots & x_3^{n-1} \\
  \vdots & \vdots & \vdots & \ddots & \vdots \\
  1 & x_n & x_n^2 & \dots & x_n^{n-1} \\
  \end{vmatrix}
  = {\prod_{1 \leq {i,j} \leq n} {(x_i - x_j)}}
\]

\end{document}
```

## Điểm bắt đầu

Để bắt đầu bài kiểm tra này, bạn có thể dựa vào mẫu HTML quen thuộc của chúng ta. Mặc định, nó dùng mã hóa UTF-8, các web fonts đặc biệt cho các thẻ `<body>` và `<math>` (có giao diện tương tự đầu ra LaTeX). Mục tiêu là thay các dấu hỏi `???` bằng nội dung MathML thật sự.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Ba công thức toán nổi tiếng</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body class="htmlmathparagraph">
    <p>
      Để giải phương trình bậc ba ??? (trong đó các số thực ??? thỏa mãn ???) ta
      có thể dùng công thức Cardano: ???
    </p>

    <p>
      Với mọi ??? và ???, bất đẳng thức Cauchy–Bunyakovsky–Schwarz có thể được
      viết như sau: ???
    </p>

    <p>
      Cuối cùng, định thức của một ma trận Vandermonde có thể được tính bằng
      biểu thức sau: ???
    </p>
  </body>
</html>
```

## Gợi ý

- Hãy bắt đầu bằng cách chèn các thẻ `<math>` trống, rồi quyết định xem chúng có nên có thuộc tính `display="block"` hay không.
- Kiểm tra văn bản được dùng và tìm các [ký tự Unicode](https://en.wikipedia.org/wiki/Mathematical_operators_and_symbols_in_Unicode) của chúng ("−", "ℂ", "∑", ...).
- Phân tích ngữ nghĩa của từng phần văn bản (biến? toán tử? số?) và xác định phần tử token phù hợp để dùng cho từng phần.
- Tìm các cấu trúc nâng cao (phân số? căn? chỉ số? ma trận?) và xác định phần tử MathML phù hợp cần dùng.
- Đừng quên dựa vào `<mrow>` để nhóm các biểu thức con.
- Hãy chú ý tới các toán tử co giãn và toán tử lớn!
- Dùng [W3C validator](https://validator.w3.org/nu/) để phát hiện các lỗi ngoài ý muốn trong đánh dấu HTML/MathML của bạn.
- Nếu bạn bị kẹt, hoặc nhận ra việc viết MathML bằng tay quá khó, hãy thoải mái dùng các công cụ hỗ trợ [viết MathML](/en-US/docs/Web/MathML/Guides/Authoring) như [TeXZilla](https://fred-wang.github.io/TeXZilla/).

{{PreviousMenu("Web/MathML/Tutorials/For_beginners/Tables", "Web/MathML/Tutorials/For_beginners")}}
