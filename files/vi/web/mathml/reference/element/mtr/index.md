---
title: <mtr>
slug: Web/MathML/Reference/Element/mtr
page-type: mathml-element
browser-compat: mathml.elements.mtr
sidebar: mathmlref
---

**`<mtr>`** [MathML](/en-US/docs/Web/MathML) element đại diện cho một hàng trong bảng hoặc ma trận. Nó chỉ có thể xuất hiện trong phần tử {{ MathMLElement("mtable") }} và các phần tử con của nó là các phần tử {{ MathMLElement("mtd") }} đại diện cho các ô. Phần tử này tương tự như phần tử {{ HTMLElement("tr") }} của [HTML](/en-US/docs/Web/HTML).

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes). Một số trình duyệt cũng có thể hỗ trợ các thuộc tính sau:

- `columnalign` {{Non-standard_Inline}}
  - : Ghi đè căn chỉnh theo chiều ngang của các ô do {{ MathMLElement("mtable") }} chỉ định cho hàng này. Có thể dùng nhiều giá trị, ngăn cách bằng dấu cách, và chúng sẽ áp dụng cho các cột tương ứng (ví dụ `columnalign="left center right"`). Các giá trị có thể có là: `left`, `center` và `right`.
- `rowalign` {{Non-standard_Inline}}
  - : Ghi đè căn chỉnh theo chiều dọc của các ô do {{ MathMLElement("mtable") }} chỉ định cho hàng này. Các giá trị có thể có là: `axis`, `baseline`, `bottom`, `center` và `top`.

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
- {{ MathMLElement("mtd") }}
