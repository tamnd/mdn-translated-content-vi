---
title: writing-mode
slug: Web/SVG/Reference/Attribute/writing-mode
page-type: svg-attribute
browser-compat: svg.global_attributes.writing-mode
sidebar: svgref
---

Thuộc tính **`writing-mode`** chỉ định xem hướng tiến hành inline ban đầu của một phần tử {{SVGElement("text")}} có phải là từ trái sang phải, từ phải sang trái hay từ trên xuống dưới hay không. Thuộc tính `writing-mode` chỉ áp dụng cho các phần tử {{ SVGElement("text") }}; thuộc tính này bị bỏ qua đối với các phần tử con {{ SVGElement("tspan") }} và {{ SVGElement("textPath") }}. (Lưu ý rằng hướng tiến hành inline có thể thay đổi bên trong một phần tử {{ SVGElement("text") }} do thuật toán hai chiều Unicode và các thuộc tính {{SVGAttr("direction")}} và {{SVGAttr("unicode-bidi")}}.)

> [!NOTE]
> Là một thuộc tính trình bày, `writing-mode` cũng có một thuộc tính CSS tương ứng: {{cssxref("writing-mode")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>horizontal-tb</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>horizontal-tb</code> | <code>vertical-rl</code> |
        <code>vertical-lr</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `horizontal-tb`
  - : Giá trị này định nghĩa hướng dòng khối từ trên xuống dưới. Cả writing mode và typographic mode đều là ngang.
- `vertical-rl`
  - : Giá trị này định nghĩa hướng dòng khối từ phải sang trái. Cả writing mode và typographic mode đều là dọc.
- `vertical-lr`
  - : Giá trị này định nghĩa hướng dòng khối từ trái sang phải. Cả writing mode và typographic mode đều là dọc.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("writing-mode")}}
