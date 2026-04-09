---
title: Bắt đầu với MathML
short-title: Getting started
slug: Web/MathML/Tutorials/For_beginners/Getting_started
page-type: tutorial-chapter
sidebar: mathmlref
---

{{NextMenu("Web/MathML/Tutorials/For_beginners/Text_containers", "Web/MathML/Tutorials/For_beginners")}}

Trong bài viết này, chúng ta sẽ lấy một tài liệu HTML đơn giản và xem cách thêm các công thức MathML vào đó, đồng thời giới thiệu một vài phần tử trong quá trình thực hiện.

## Chèn công thức trong HTML qua phần tử \<math>

MathML dùng cùng cú pháp với HTML để biểu diễn một cây gồm các phần tử và thuộc tính. Cụ thể, mỗi công thức toán được biểu diễn bằng một phần tử `<math>` có thể đặt bên trong một trang HTML. Trong tài liệu sau đây, nó nằm bên trong một đoạn văn bản:

```html live-sample___inserting_formulas_in_HTML
<p>
  Phân số
  <math>
    <mfrac>
      <mn>1</mn>
      <mn>3</mn>
    </mfrac>
  </math>
  không phải là một số thập phân.
</p>
```

Phần tử `<mfrac>` chỉ định một phân số với tử số (phần tử con đầu tiên) và mẫu số (phần tử con thứ hai). Đây là cách nó được hiển thị trong trình duyệt của bạn:

{{ EmbedLiveSample('Inserting_formulas_in_HTML', 700, 100, "", "") }}

> [!WARNING]
> Nếu bạn chỉ thấy "1 3" thay vì một phân số, thì trình duyệt của bạn có thể không hỗ trợ MathML. Hãy xem [bảng tương thích trình duyệt](/en-US/docs/Web/MathML/Reference/Element/math#browser_compatibility) để biết thêm chi tiết.

### Thuộc tính display

Lưu ý rằng trong ví dụ trước, công thức nằm trên cùng dòng với văn bản của đoạn văn. Tuy nhiên, khá phổ biến khi hiển thị các công thức toán lớn ở giữa và trên một dòng riêng như bên dưới. Để làm được điều đó, bạn cần gắn thuộc tính `display="block"` vào phần tử `<math>`.

```html hidden live-sample___the_display_attribute
<p>
  Phân số
  <math display="block">
    <mfrac>
      <mn>1</mn>
      <mn>3</mn>
    </mfrac>
  </math>
  không phải là một số thập phân.
</p>
```

{{ EmbedLiveSample('The_display_attribute', 700, 100, "", "") }}

Bạn cũng có thể nhận thấy một thay đổi tinh tế về hình thức: văn bản và khoảng cách dọc của phân số trở nên lớn hơn một chút. Khi không có thuộc tính `display="block"`, chiều cao được giữ tối thiểu để không làm xáo trộn dòng chảy của văn bản xung quanh. Khi có thuộc tính `display="block"`, ưu tiên được đặt vào khả năng đọc của công thức toán.

> [!NOTE]
> Điều này tương ứng với khái niệm _inline_ của LaTeX, là các công thức được ngăn cách bằng dấu `$...$`, và các công thức _display_, được ngăn cách bằng `\[...\]`.

> [!NOTE]
> Thay đổi về hình thức nói trên thực ra được điều khiển bởi thuộc tính {{cssxref("math-style")}}, vốn ban đầu là `normal` cho `<math display="block">` và là `compact` trong các trường hợp khác. Trong một số cây con MathML, thuộc tính này có thể tự động chuyển thành `compact`, nhưng chúng ta sẽ bỏ qua chi tiết nhỏ này trong bài hướng dẫn nhập môn này. Một lần nữa, điều này khá giống LaTeX.

## Gom nhóm với phần tử \<mrow>

Phần tử `<math>` thực ra có thể chứa bất kỳ số lượng phần tử con nào và về cơ bản sẽ hiển thị chúng trên một hàng. Ví dụ, công thức đơn giản "1 + 2 + 3" sẽ được mã hóa như sau trong MathML:

```html
<math>
  <mn>1</mn>
  <mo>+</mo>
  <mn>2</mn>
  <mo>+</mo>
  <mn>3</mn>
</math>
```

Phần tử `<mrow>` là một vùng chứa tổng quát có bố cục tương tự nhưng có thể đặt ở bất kỳ đâu trong cây con MathML. Nó hữu ích khi cần nhóm nhiều phần tử lại với nhau. Chẳng hạn, tử số của phân số sau đây (phần tử con đầu tiên) là "một cộng hai".

```html
<math>
  <mfrac>
    <mrow>
      <mn>1</mn>
      <mo>+</mo>
      <mn>2</mn>
    </mrow>
    <mn>3</mn>
  </mfrac>
</math>
```

### Đến lượt bạn: Viết biểu thức lồng nhau

Hãy thử viết các biểu thức sau chỉ bằng những phần tử MathML mà chúng ta đã gặp cho đến giờ. Nếu bạn bị kẹt hoặc muốn kiểm tra lời giải, hãy xem mã nguồn của ví dụ.

```html hidden live-sample___nested-expressions
<ol>
  <li>
    "một phần hai" cộng "hai phần ba":
    <!-- Cách nhóm các phần tử con của phần tử math bằng mrow là đúng nhưng không bắt buộc. -->
    <math>
      <mfrac>
        <mn>1</mn>
        <mn>2</mn>
      </mfrac>
      <mo>+</mo>
      <mfrac>
        <mn>2</mn>
        <mn>3</mn>
      </mfrac>
    </math>
  </li>
  <li>
    "một cộng hai cộng ba" chia cho "bốn cộng năm":
    <math>
      <mfrac>
        <mrow>
          <mn>1</mn>
          <mo>+</mo>
          <mn>2</mn>
          <mo>+</mo>
          <mn>3</mn>
        </mrow>
        <mrow>
          <mn>4</mn>
          <mo>+</mo>
          <mn>5</mn>
        </mrow>
      </mfrac>
    </math>
  </li>
  <li>
    "một phần tư" chia cho "hai cộng ba":
    <math>
      <mfrac>
        <mfrac>
          <mn>1</mn>
          <mn>4</mn>
        </mfrac>
        <mrow>
          <mn>2</mn>
          <mo>+</mo>
          <mn>3</mn>
        </mrow>
      </mfrac>
    </math>
  </li>
</ol>
```

{{ EmbedLiveSample('nested_expressions', 700, 200, "", "") }}

## Tóm tắt

Trong bài viết này, chúng ta đã xem cách dùng phần tử `<math>` để chèn một công thức toán vào tài liệu HTML. Chúng ta đã tìm hiểu sự khác nhau trong cách hiển thị giữa các phần tử `<math>` có dùng `display="block"` và các phần tử không dùng nó. Ngoài ra, chúng ta cũng đã gặp một vài phần tử MathML khác: `<mfrac>` cho phân số, `<mrow>` để nhóm và cuối cùng là một vài phần tử văn bản. Chúng ta sẽ phân tích thêm các [vùng chứa văn bản](/en-US/docs/Web/MathML/Tutorials/For_beginners/Text_containers) này trong bài tiếp theo.

## Xem thêm

- [Sử dụng MathML](/en-US/docs/Web/MathML/Guides/Authoring#using_mathml)
- [Phần tử `<math>`](/en-US/docs/Web/MathML/Reference/Element/math)
- [Phần tử `<mfrac>`](/en-US/docs/Web/MathML/Reference/Element/mfrac)
- [Phần tử `<mrow>`](/en-US/docs/Web/MathML/Reference/Element/mrow)
- Thuộc tính {{cssxref("math-style")}}
- Thuộc tính {{cssxref("math-depth")}}

{{NextMenu("Web/MathML/Tutorials/For_beginners/Text_containers", "Web/MathML/Tutorials/For_beginners")}}
