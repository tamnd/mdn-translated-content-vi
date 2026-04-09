---
title: Bảng trong MathML
short-title: Tables
slug: Web/MathML/Tutorials/For_beginners/Tables
page-type: tutorial-chapter
sidebar: mathmlref
---

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Scripts", "Web/MathML/Tutorials/For_beginners/Three_famous_mathematical_formulas", "Web/MathML/Tutorials/For_beginners")}}

Khi đã biết các ký hiệu toán cơ bản, vẫn còn một vấn đề là xem xét bố cục dạng bảng, vốn có thể dùng cho các biểu thức kiểu ma trận và các bố cục toán nâng cao khác.

## Các phần tử bảng của MathML

Các phần tử bảng của MathML tương tự như [bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics): phần tử `<mtable>` biểu diễn một bảng toán học, nó có các phần tử `<mtr>` làm phần tử con (biểu diễn các hàng), và mỗi phần tử đó lại có các phần tử `<mtd>` làm phần tử con (biểu diễn các ô). Phần tử `<mtable>` có thể được chèn ở bất kỳ đâu trong một công thức MathML. Phần tử `<mtd>` có thể chứa bất kỳ số lượng phần tử MathML nào và sẽ sắp xếp chúng như một vùng chứa `<mrow>`.

Bảng thường được dùng cho các biểu thức kiểu ma trận (bao gồm cả vectơ). Sau đây là một ví dụ cơ bản lấy từ [bài viết về hàm CSS `matrix()`](/en-US/docs/Web/CSS/Reference/Values/transform-function/matrix):

```html hidden
<link
  rel="stylesheet"
  href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
```

```html
<math display="block">
  <mrow>
    <mo>(</mo>
    <mtable>
      <mtr>
        <mtd>
          <mi>a</mi>
        </mtd>
        <mtd>
          <mi>c</mi>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <msub>
            <mi>t</mi>
            <mi>x</mi>
          </msub>
        </mtd>
      </mtr>
      <mtr>
        <mtd>
          <mi>b</mi>
        </mtd>
        <mtd>
          <mi>d</mi>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <msub>
            <mi>t</mi>
            <mi>y</mi>
          </msub>
        </mtd>
      </mtr>
      <mtr>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <mn>1</mn>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
      </mtr>
      <mtr>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <mn>0</mn>
        </mtd>
        <mtd>
          <mn>1</mn>
        </mtd>
      </mtr>
    </mtable>
    <mo>)</mo>
  </mrow>
</math>
```

{{ EmbedLiveSample('MathML_tabular_elements', 700, 200, "", "") }}

## Cho phép ô trải dài qua nhiều hàng và cột

Điều này cũng tương tự như [bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics#allowing_cells_to_span_multiple_rows_and_columns). Phần tử `<mtd>` chấp nhận các thuộc tính `columnspan` và `rowspan` để cho biết ô trải qua nhiều hàng và cột. Bên dưới, ma trận bên trong trải qua hai cột của ma trận bên ngoài:

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Ma trận của tôi với columnspan</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math display="block">
      <mrow>
        <mo>(</mo>
        <mtable>
          <mtr>
            <mtd columnspan="2">
              <mrow>
                <mo>(</mo>
                <mtable>
                  <mtr>
                    <mtd>
                      <mi>a</mi>
                    </mtd>
                    <mtd>
                      <mi>c</mi>
                    </mtd>
                  </mtr>
                  <mtr>
                    <mtd>
                      <mi>b</mi>
                    </mtd>
                    <mtd>
                      <mi>d</mi>
                    </mtd>
                  </mtr>
                </mtable>
                <mo>)</mo>
              </mrow>
            </mtd>
            <mtd>
              <mn>0</mn>
            </mtd>
            <mtd>
              <mi>T</mi>
            </mtd>
          </mtr>
          <mtr>
            <mtd>
              <mn>0</mn>
            </mtd>
            <mtd>
              <mn>0</mn>
            </mtd>
            <mtd>
              <mn>1</mn>
            </mtd>
            <mtd>
              <mn>0</mn>
            </mtd>
          </mtr>
          <mtr>
            <mtd>
              <mn>0</mn>
            </mtd>
            <mtd>
              <mn>0</mn>
            </mtd>
            <mtd>
              <mn>0</mn>
            </mtd>
            <mtd>
              <mn>1</mn>
            </mtd>
          </mtr>
        </mtable>
        <mo>)</mo>
      </mrow>
    </math>
  </body>
</html>
```

{{ EmbedLiveSample('allowing_cells_to_span_multiple_rows_and_columns', 700, 200, "", "") }}

> [!NOTE]
> Vì lý do lịch sử, thuộc tính MathML cho việc trải qua nhiều cột được gọi là `columnspan` chứ không phải `colspan`.

## Cách dùng cho bố cục nâng cao

Ngoài việc biểu diễn các đối tượng kiểu ma trận, bảng MathML đôi khi còn được dùng cho bố cục nâng cao bên trong các công thức toán, chẳng hạn trong [định nghĩa ký hiệu Legendre trên Wikipedia](https://en.wikipedia.org/wiki/Legendre_symbol). Ở đây, các trường hợp khác nhau được viết trên ba hàng khác nhau trong khi các giá trị và điều kiện được đặt trên hai cột khác nhau.

```html hidden
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Ma trận đầu tiên của tôi</title>
    <link
      rel="stylesheet"
      href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css" />
  </head>
  <body>
    <math display="block">
      <mrow>
        <mrow>
          <mo>(</mo>
          <mfrac>
            <mi>a</mi>
            <mi>b</mi>
          </mfrac>
          <mo>)</mo>
        </mrow>
        <mo>=</mo>
        <mrow>
          <mo>{</mo>
          <mtable>
            <mtr>
              <mtd>
                <mn>1</mn>
              </mtd>
              <mtd>
                <mtext>nếu&nbsp;</mtext>
                <mi>a</mi>
                <mtext>&nbsp;là phần dư bình phương modulo&nbsp;</mtext>
                <mi>p</mi>
                <mtext>&nbsp;và&nbsp;</mtext>
                <mi>a</mi>
                <mtext>&nbsp;không phải bội số của&nbsp;</mtext>
                <mi>p</mi>
                <mo>;</mo>
              </mtd>
            </mtr>
            <mtr>
              <mtd>
                <mo>−</mo>
                <mn>1</mn>
              </mtd>
              <mtd>
                <mtext>nếu&nbsp;</mtext>
                <mi>a</mi>
                <mtext
                  >&nbsp;là phần dư không phải bình phương modulo&nbsp;</mtext
                >
                <mi>p</mi>
                <mo>;</mo>
              </mtd>
            </mtr>
            <mtr>
              <mtd>
                <mn>0</mn>
              </mtd>
              <mtd>
                <mtext>nếu&nbsp;</mtext>
                <mi>a</mi>
                <mtext>&nbsp;là bội số của&nbsp;</mtext>
                <mi>p</mi>
                <mo>.</mo>
              </mtd>
            </mtr>
          </mtable>
        </mrow>
      </mrow>
    </math>
  </body>
</html>
```

{{ EmbedLiveSample('Usage_for_advanced_layout', 700, 200, "", "") }}

> [!WARNING]
> [Bài viết `<mtable>`](/en-US/docs/Web/MathML/Reference/Element/mtable) cung cấp thêm nhiều tùy chọn bố cục nâng cao thông qua các thuộc tính đặc biệt như căn chỉnh hoặc khoảng cách. Những thuộc tính này xuất hiện trước các tương đương CSS và ban đầu được thiết kế cho các bộ hiển thị không nhận biết CSS. Tuy nhiên, chúng có thể không được triển khai trong mọi trình duyệt. Trong tương lai, rất có thể các cách dùng `<mtable>` chỉ để bố cục (tức không phải đối tượng kiểu ma trận thực sự) sẽ được thay thế bằng các lựa chọn thay thế dựa trên CSS.

## Tóm tắt

Trong bài viết này, chúng ta đã xem xét các phần tử `<mtable>`, `<mtr>` và `<mtd>`, là các phần tử tương đương với những phần tử HTML dùng cho bảng. Chúng ta đã thấy cách dùng chúng để biểu diễn các đối tượng kiểu ma trận và cách chúng đôi khi được dùng cho bố cục nâng cao.

Bạn gần như đã hoàn thành mô-đun này rồi, chúng ta chỉ còn một việc nữa. Trong [bài kiểm tra ba công thức toán nổi tiếng](/en-US/docs/Web/MathML/Tutorials/For_beginners/Three_famous_mathematical_formulas) bạn sẽ dùng kiến thức mới của mình để viết lại một bài toán nhỏ bằng HTML và MathML.

## Xem thêm

- [Tìm hiểu về bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
- [Phần tử `<mtable>`](/en-US/docs/Web/MathML/Reference/Element/mtable)
- [Phần tử `<mtr>`](/en-US/docs/Web/MathML/Reference/Element/mtr)
- [Phần tử `<mtd>`](/en-US/docs/Web/MathML/Reference/Element/mtd)

{{PreviousMenuNext("Web/MathML/Tutorials/For_beginners/Scripts", "Web/MathML/Tutorials/For_beginners/Three_famous_mathematical_formulas", "Web/MathML/Tutorials/For_beginners")}}
