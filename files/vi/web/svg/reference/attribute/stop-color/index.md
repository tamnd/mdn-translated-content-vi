---
title: stop-color
slug: Web/SVG/Reference/Attribute/stop-color
page-type: svg-attribute
browser-compat: svg.global_attributes.stop-color
sidebar: svgref
---

Thuộc tính **`stop-color`** cho biết màu nào sẽ được dùng tại một điểm dừng của gradient.

> [!NOTE]
> Xét theo gradient, SVG xử lý từ khóa `transparent` khác với CSS. SVG không tính gradient trong không gian tiền nhân, vì vậy `transparent` thực sự có nghĩa là đen trong suốt. Do đó, việc chỉ định `stop-color` với giá trị `transparent` tương đương với việc chỉ định `stop-color` với giá trị `black` và một {{SVGAttr("stop-opacity")}} có giá trị `0`.

> [!NOTE]
> Khi được dùng như một thuộc tính trình bày, `stop-color` cũng có một thuộc tính CSS tương ứng: {{cssxref("stop-color")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("stop")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        {{cssxref("color_value", "&lt;color&gt;")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>black</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- [`<color>`](/en-US/docs/Web/SVG/Guides/Content_type#color)
  - : Giá trị này biểu thị một giá trị màu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stop-color")}}
- {{SVGAttr("stop-opacity")}}
