---
title: stop-opacity
slug: Web/SVG/Reference/Attribute/stop-opacity
page-type: svg-attribute
browser-compat: svg.global_attributes.stop-opacity
sidebar: svgref
---

Thuộc tính **`stop-opacity`** xác định độ mờ của một điểm dừng màu gradient cụ thể.

Giá trị độ mờ dùng cho phép tính gradient là tích của giá trị `stop-opacity` và độ mờ của giá trị thuộc tính {{SVGAttr("stop-color")}}. Với các giá trị `stop-color` không bao gồm thông tin độ mờ rõ ràng, độ mờ được coi là `1`.

> [!NOTE]
> Khi được dùng như một thuộc tính trình bày, `stop-opacity` cũng có một thuộc tính CSS tương ứng: {{cssxref("stop-opacity")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("stop")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#opacity_value"
            >&#x3C;opacity-value></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<opacity-value>`
  - : Giá trị này là một {{cssxref("number")}} giữa `0` và `1`, hoặc một giá trị {{cssxref("percentage")}} chỉ định độ mờ của điểm dừng màu gradient.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stop-opacity")}}
- {{SVGAttr("stop-color")}}
- {{SVGAttr("opacity")}}
- {{SVGAttr("fill-opacity")}}
- {{SVGAttr("stroke-opacity")}}
