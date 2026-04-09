---
title: Văn bản
slug: Web/SVG/Tutorials/SVG_from_scratch/Texts
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Patterns", "Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations") }}

Khi nói về văn bản trong SVG, chúng ta phải phân biệt hai chủ đề gần như hoàn toàn tách biệt. Một là việc chèn và hiển thị văn bản trong ảnh, còn lại là SVG fonts. Phần sau sẽ được mô tả ở một phần sau của hướng dẫn, còn trang này sẽ tập trung vào phần đầu tiên: đưa văn bản vào một ảnh SVG.

## Cơ bản

Chúng ta đã thấy trong [ví dụ giới thiệu](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Getting_started) rằng phần tử `text` có thể được dùng để đặt văn bản bất kỳ trong tài liệu SVG:

```xml
<text x="10" y="10">Hello World!</text>
```

Các thuộc tính `x` và `y` xác định vị trí văn bản sẽ xuất hiện trong viewport. Thuộc tính {{SVGAttr("text-anchor")}}, có thể nhận các giá trị `"start"`, `"middle"`, `"end"` hoặc `"inherit"`, quyết định văn bản chảy theo hướng nào từ điểm này. Thuộc tính {{SVGAttr("dominant-baseline")}} quyết định căn chỉnh theo chiều dọc.

Giống như với các phần tử hình dạng, văn bản có thể được tô màu bằng thuộc tính `fill` và được tạo stroke bằng thuộc tính `stroke`. Cả hai cũng có thể tham chiếu tới gradient hoặc pattern, khiến việc tô màu văn bản trong SVG rất mạnh mẽ.

## Thiết lập thuộc tính phông chữ

Một phần thiết yếu của văn bản là phông chữ mà nó được hiển thị. SVG cung cấp một tập thuộc tính, nhiều thuộc tính tương tự với các đối ứng CSS của chúng, để cho phép chọn phông chữ. Mỗi thuộc tính sau đây có thể được đặt dưới dạng thuộc tính hoặc qua khai báo CSS: {{SVGAttr("font-family")}}, {{SVGAttr("font-style")}}, {{SVGAttr("font-weight")}}, {{SVGAttr("font-variant")}}, {{SVGAttr("font-stretch")}}, {{SVGAttr("font-size")}}, {{SVGAttr("font-size-adjust")}}, {{SVGAttr("letter-spacing")}}, {{SVGAttr("word-spacing")}} và {{SVGAttr("text-decoration")}}.

## Các phần tử liên quan đến văn bản khác

### tspan

Phần tử này được dùng để đánh dấu các phần con của một đoạn văn bản lớn hơn. Nó phải là phần tử con của phần tử `text` hoặc một phần tử `tspan` khác. Một trường hợp sử dụng điển hình là tô một từ trong câu thành chữ đậm màu đỏ.

```html
<svg width="350" height="60" xmlns="http://www.w3.org/2000/svg">
  <text>
    This is
    <tspan font-weight="bold" fill="red">bold and red</tspan>
  </text>

  <style>
    <![CDATA[
      text {
        dominant-baseline: hanging;
        font: 28px Verdana, Helvetica, Arial, sans-serif;
      }
    ]]>
  </style>
</svg>
```

{{ EmbedLiveSample('tspan', '100%', 100) }}

Phần tử `tspan` có các thuộc tính riêng sau:

- `x`
  - : Đặt một tọa độ `x` tuyệt đối mới cho văn bản chứa nó. Điều này ghi đè vị trí văn bản hiện tại mặc định. Thuộc tính này cũng có thể chứa một danh sách số được áp dụng từng cái một cho các ký tự đơn lẻ của phần tử `tspan`.
- `dx`
  - : Bắt đầu vẽ văn bản với độ lệch ngang `dx` so với vị trí hiện tại mặc định. Ở đây cũng vậy, bạn có thể cung cấp một danh sách giá trị được áp dụng cho các ký tự liên tiếp, từ đó dồn độ lệch lại theo thời gian.

    Tương tự, có **`y`** và **`dy`** cho độ dời theo chiều dọc.

- `rotate`
  - : Xoay tất cả ký tự theo số độ này. Một danh sách số sẽ làm từng ký tự xoay theo giá trị tương ứng, còn các ký tự còn lại xoay theo giá trị cuối cùng.
- `textLength`
  - : Cho độ dài được tính toán của chuỗi. Đây là một thuộc tính ít gặp hơn, và nó nhằm cho phép bộ dựng hiển thị tinh chỉnh vị trí của các glyph khi độ dài văn bản nó đo được không khớp với độ dài được cung cấp ở đây.

### textPath

Phần tử này tìm nạp qua thuộc tính `href` của nó một đường dẫn bất kỳ và căn các ký tự mà nó bao quanh dọc theo đường dẫn này:

```html
<svg width="200" height="100" xmlns="http://www.w3.org/2000/svg">
  <path id="my_path" d="M 20,20 C 80,60 100,40 120,20" fill="transparent" />
  <text>
    <textPath xmlns:xlink="http://www.w3.org/1999/xlink" href="#my_path">
      A curve.
    </textPath>
  </text>

  <style>
    <![CDATA[
      text {
        dominant-baseline: hanging;
        font: 28px Verdana, Helvetica, Arial, sans-serif;
      }
    ]]>
  </style>
</svg>
```

{{ EmbedLiveSample('textPath', '100%', 100) }}

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Patterns", "Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations") }}
