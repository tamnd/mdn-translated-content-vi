---
title: <mtable>
slug: Web/MathML/Reference/Element/mtable
page-type: mathml-element
browser-compat: mathml.elements.mtable
sidebar: mathmlref
---

**`<mtable>`** [MathML](/en-US/docs/Web/MathML) element cho phép bạn tạo bảng hoặc ma trận. Các phần tử con của nó là các phần tử {{ MathMLElement("mtr") }} (đại diện cho các hàng), và mỗi phần tử đó lại có các phần tử {{ MathMLElement("mtd") }} làm phần tử con (đại diện cho các ô). Các phần tử này tương tự như các phần tử {{ HTMLElement("table") }}, {{ HTMLElement("tr") }} và {{ HTMLElement("td") }} của [HTML](/en-US/docs/Web/HTML).

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes). Một số trình duyệt cũng có thể hỗ trợ các thuộc tính sau:

- `align` {{Non-standard_Inline}}
  - : Chỉ định căn chỉnh **theo chiều dọc** của bảng so với môi trường xung quanh.
    Các giá trị có thể có là:
    - `axis` (mặc định): Tâm theo chiều dọc của bảng được căn với trục của môi trường (thường là dấu trừ).
    - `baseline`: Tâm theo chiều dọc của bảng được căn với baseline của môi trường.
    - `bottom`: Đáy của bảng được căn với baseline của môi trường.
    - `center`: Xem `baseline`.
    - `top`: Đỉnh của bảng được căn với baseline của môi trường.

    Ngoài ra, giá trị của thuộc tính `align` có thể kết thúc bằng một _số hàng_ (ví dụ `align="center 3"`). Điều này cho phép bạn căn chỉnh hàng được chỉ định của bảng thay vì toàn bộ bảng. Giá trị số nguyên âm sẽ đếm hàng từ dưới lên.

- `columnalign` {{Non-standard_Inline}}
  - : Chỉ định căn chỉnh theo chiều ngang của các ô. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các cột tương ứng (ví dụ `columnalign="left right center"`). Các giá trị có thể có là: `left`, `center` (mặc định) và `right`.
- `columnlines` {{Non-standard_Inline}}
  - : Chỉ định đường viền cột. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các cột tương ứng (ví dụ `columnlines="none none solid"`). Các giá trị có thể có là: `none` (mặc định), `solid` và `dashed`.
- `columnspacing` {{Non-standard_Inline}}
  - : Chỉ định khoảng cách giữa các cột trong bảng. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các cột tương ứng (ví dụ `columnspacing="1em 2em"`). Các giá trị có thể có là {{cssxref("length-percentage")}}.
- `frame` {{Non-standard_Inline}}
  - : Chỉ định đường viền của toàn bộ bảng. Các giá trị có thể có là: `none` (mặc định), `solid` và `dashed`.
- `framespacing` {{Non-standard_Inline}}
  - : Chỉ định khoảng trống bổ sung giữa bảng và khung. Giá trị đầu tiên chỉ khoảng cách bên phải và bên trái; giá trị thứ hai chỉ khoảng cách bên trên và bên dưới. Các giá trị có thể có là {{cssxref("length-percentage")}}.
- `rowalign` {{Non-standard_Inline}}
  - : Chỉ định căn chỉnh theo chiều dọc của các ô. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các hàng tương ứng (ví dụ `rowalign="top bottom axis"`). Các giá trị có thể có là: `axis`, `baseline` (mặc định), `bottom`, `center` và `top`.
- `rowlines` {{Non-standard_Inline}}
  - : Chỉ định đường viền hàng. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các hàng tương ứng (ví dụ `rowlines="none none solid"`). Các giá trị có thể có là: `none` (mặc định), `solid` và `dashed`.
- `rowspacing` {{Non-standard_Inline}}
  - : Chỉ định khoảng cách giữa các hàng trong bảng. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các hàng tương ứng (ví dụ `rowspacing="1em 2em"`). Các giá trị có thể có là {{cssxref("length-percentage")}}.
- `width` {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết độ rộng của toàn bộ bảng.

> [!NOTE]
> Với thuộc tính `width`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

### Căn chỉnh với số hàng

```html
<math display="block">
  <mi>X</mi>
  <mo>=</mo>
  <mtable frame="solid" rowlines="solid" align="axis 3">
    <mtr>
      <mtd><mi>A</mi></mtd>
      <mtd><mi>B</mi></mtd>
    </mtr>
    <mtr>
      <mtd><mi>C</mi></mtd>
      <mtd><mi>D</mi></mtd>
    </mtr>
    <mtr>
      <mtd><mi>E</mi></mtd>
      <mtd><mi>F</mi></mtd>
    </mtr>
  </mtable>
</math>
```

{{EmbedLiveSample('Alignment with row number')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ MathMLElement("mtd") }} (Ô bảng)
- {{ MathMLElement("mtr") }} (Hàng bảng)
