---
title: <mtd>
slug: Web/MathML/Reference/Element/mtd
page-type: mathml-element
browser-compat: mathml.elements.mtd
sidebar: mathmlref
---

**`<mtd>`** [MathML](/en-US/docs/Web/MathML) element đại diện cho một ô trong bảng hoặc ma trận. Nó chỉ có thể xuất hiện bên trong phần tử {{ MathMLElement("mtr") }}. Phần tử này tương tự như phần tử {{ HTMLElement("td") }} của [HTML](/en-US/docs/Web/HTML).

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính sau:

- `columnspan`
  - : Một giá trị số nguyên không âm cho biết ô kéo dài qua bao nhiêu cột.
- `rowspan`
  - : Một giá trị số nguyên không âm cho biết ô kéo dài qua bao nhiêu hàng.

Một số trình duyệt cũng có thể hỗ trợ các thuộc tính sau:

- `columnalign` {{Non-standard_Inline}}
  - : Chỉ định căn chỉnh theo chiều ngang của ô này và ghi đè các giá trị do {{ MathMLElement("mtable") }} hoặc {{ MathMLElement("mtr") }} chỉ định.
    Các giá trị có thể có là: `left`, `center` và `right`.
- `rowalign` {{Non-standard_Inline}}
  - : Chỉ định căn chỉnh theo chiều dọc của ô này và ghi đè các giá trị do {{ MathMLElement("mtable") }} hoặc {{ MathMLElement("mtr") }} chỉ định.
    Các giá trị có thể có là: `axis`, `baseline`, `bottom`, `center` và `top`.

## Ví dụ

### Ma trận sử dụng mtable, mrow, mtr và mtd

```html
<math display="block">
  <mfrac>
    <mi>A</mi>
    <mn>2</mn>
  </mfrac>
  <mo>=</mo>
  <mrow>
    <mo>(</mo>
    <mtable>
      <mtr>
        <mtd><mn>1</mn></mtd>
        <mtd><mn>2</mn></mtd>
        <mtd><mn>3</mn></mtd>
      </mtr>
      <mtr>
        <mtd><mn>4</mn></mtd>
        <mtd><mn>5</mn></mtd>
        <mtd><mn>6</mn></mtd>
      </mtr>
      <mtr>
        <mtd><mn>7</mn></mtd>
        <mtd><mn>8</mn></mtd>
        <mtd><mn>9</mn></mtd>
      </mtr>
    </mtable>
    <mo>)</mo>
  </mrow>
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

- {{ MathMLElement("mtable") }}
- {{ MathMLElement("mtr") }}
