---
title: markerHeight
slug: Web/SVG/Reference/Attribute/markerHeight
page-type: svg-attribute
browser-compat: svg.elements.marker.markerHeight
sidebar: svgref
---

Thuộc tính **`markerHeight`** biểu thị chiều cao của viewport mà {{SVGElement("marker")}} sẽ được đặt vừa vào khi nó được hiển thị theo các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.

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
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<length-percentage>`
  - : Giá trị này xác định chiều cao tuyệt đối hoặc tương đối của marker.
    Các giá trị tương đối tham chiếu đến chiều cao được chỉ định qua các thuộc tính {{SVGAttr("viewBox")}} và {{SVGAttr("preserveAspectRatio")}}.
- `<number>`
  - : Giá trị này xác định chiều cao của marker theo các đơn vị được xác định bởi thuộc tính {{SVGAttr("markerUnits")}}.

Giá trị bằng không sẽ vô hiệu hóa việc hiển thị phần tử, và các giá trị âm là lỗi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("marker")}}
- {{SVGAttr("markerWidth")}}
- {{SVGAttr("markerUnits")}}
- {{SVGAttr("viewBox")}}
- {{SVGAttr("preserveAspectRatio")}}
