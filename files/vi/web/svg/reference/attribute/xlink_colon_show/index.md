---
title: xlink:show
slug: Web/SVG/Reference/Attribute/xlink:show
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.elements.a.xlink_show
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`xlink:show`** cho biết cách một tài nguyên được liên kết nên được mở và dành cho các bộ xử lý hiểu {{Glossary("XLink")}}. Trong trường hợp xung đột, thuộc tính {{SVGAttr("target")}} sẽ có ưu tiên, vì nó có thể biểu đạt một phạm vi giá trị rộng hơn.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("a")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>new</code> | <code>replace</code> | <code>embed</code> |
        <code>other</code> | <code>none</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>replace</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `new`
  - : Giá trị này chỉ định rằng tài nguyên được tham chiếu sẽ được mở trong một cửa sổ hoặc thẻ mới. Điều này tương tự với hiệu ứng đạt được bởi phần tử HTML {{HTMLElement("a")}} với [target](/en-US/docs/Web/HTML/Reference/Elements/a#target) đặt là `_blank`.
- `replace`
  - : Giá trị này chỉ định rằng tài nguyên được tham chiếu sẽ được mở trong cùng cửa sổ hoặc thẻ. Điều này tương tự với hiệu ứng đạt được bởi phần tử HTML {{HTMLElement("a")}} với [target](/en-US/docs/Web/HTML/Reference/Elements/a#target) đặt là `_self`.
- `embed`
  - : Giá trị này chỉ định rằng thay vì liên kết tới tài nguyên, nó sẽ được tải và hiển thị bên trong tài liệu. Điều này tương tự với hiệu ứng đạt được bởi phần tử HTML {{HTMLElement("img")}}.
- `other`
  - : Giá trị này cho biết rằng các đánh dấu khác có trong liên kết, tức là thuộc tính {{SVGAttr("target")}}, sẽ quyết định hành vi của nó.
- `none`
  - : Giá trị này chỉ định rằng không có chỉ dẫn nào về cách tham chiếu tới tài nguyên được liên kết.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Định nghĩa của thuộc tính `xlink:show` trong đặc tả XLink](https://www.w3.org/TR/xlink/#show-att)
