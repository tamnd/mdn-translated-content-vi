---
title: markerWidth
slug: Web/SVG/Reference/Attribute/markerWidth
page-type: svg-attribute
browser-compat: svg.elements.marker.markerWidth
sidebar: svgref
---

Thuộc tính **`markerWidth`** đại diện cho chiều rộng của viewport mà {{SVGElement("marker")}} sẽ được vừa vào khi được kết xuất theo các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("marker")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        {{cssxref("length-percentage")}} |
        {{cssxref("number")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>3</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<length-percentage>`
  - : Giá trị này xác định chiều rộng tuyệt đối hoặc tương đối của marker.
    Giá trị tương đối tham chiếu tới chiều rộng được chỉ định qua các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.
- `<number>`
  - : Giá trị này xác định chiều rộng của marker theo các đơn vị được xác định bởi thuộc tính {{SVGAttr("markerUnits")}}.

Giá trị bằng không sẽ vô hiệu hóa việc kết xuất của phần tử và các giá trị âm là lỗi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("marker")}}
- {{SVGAttr("markerHeight")}}
- {{SVGAttr("markerUnits")}}
- {{SVGAttr("viewBox")}}
- {{SVGAttr("preserveAspectRatio")}}
