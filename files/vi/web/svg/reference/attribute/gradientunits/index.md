---
title: gradientUnits
slug: Web/SVG/Reference/Attribute/gradientUnits
page-type: svg-attribute
browser-compat:
  - svg.elements.linearGradient.gradientUnits
  - svg.elements.radialGradient.gradientUnits
sidebar: svgref
---

Thuộc tính **`gradientUnits`** xác định hệ tọa độ được dùng cho các thuộc tính được chỉ định trên các phần tử gradient.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("linearGradient")}}
- {{SVGElement("radialGradient")}}

## linearGradient

Với {{SVGElement("linearGradient")}}, `gradientUnits` xác định hệ tọa độ được dùng cho các thuộc tính {{SVGAttr("x1")}}, {{SVGAttr("y1")}}, {{SVGAttr("x2")}}, và {{SVGAttr("y2")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>userSpaceOnUse</code> | <code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `userSpaceOnUse`
  - : Giá trị này cho biết các thuộc tính biểu thị các giá trị trong hệ tọa độ thu được bằng cách lấy hệ tọa độ người dùng hiện tại tại thời điểm phần tử gradient được tham chiếu (tức là hệ tọa độ người dùng của phần tử tham chiếu tới phần tử gradient thông qua thuộc tính {{SVGAttr("fill")}} hoặc {{SVGAttr("stroke")}}) rồi áp dụng phép biến đổi được chỉ định bởi thuộc tính {{SVGAttr("gradientTransform")}}.
    Các giá trị phần trăm biểu thị giá trị tương đối so với viewport SVG hiện tại.
- `objectBoundingBox`
  - : Giá trị này cho biết hệ tọa độ người dùng cho các thuộc tính được thiết lập bằng cách dùng khung bao của phần tử mà gradient được áp dụng rồi áp dụng phép biến đổi được chỉ định bởi thuộc tính `gradientTransform`.

    Các giá trị phần trăm biểu thị giá trị tương đối so với khung bao của đối tượng.

    Với giá trị này và `gradientTransform` là ma trận đơn vị, pháp tuyến của linear gradient vuông góc với vector gradient trong không gian object bounding box (tức hệ tọa độ trừu tượng nơi (0,0) ở góc trên/trái của khung bao đối tượng và (1,1) ở góc dưới/phải của khung bao đối tượng). Khi khung bao của đối tượng không phải hình vuông, pháp tuyến gradient vốn ban đầu vuông góc với vector gradient trong không gian object bounding box có thể được hiển thị không vuông góc tương đối với vector gradient trong không gian người dùng. Nếu vector gradient song song với một trong các trục của khung bao, pháp tuyến gradient sẽ vẫn vuông góc. Sự biến đổi này là do phép biến đổi co giãn không đồng đều từ không gian khung bao sang không gian người dùng.

## radialGradient

Với {{SVGElement("radialGradient")}}, `gradientUnits` xác định hệ tọa độ được dùng cho các thuộc tính {{SVGAttr("cx")}}, {{SVGAttr("cy")}}, {{SVGAttr("r")}}, {{SVGAttr("fx")}}, {{SVGAttr("fy")}}, và {{SVGAttr("fr")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>userSpaceOnUse</code> | <code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>objectBoundingBox</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `userSpaceOnUse`
  - : {{SVGAttr("cx")}}, {{SVGAttr("cy")}}, {{SVGAttr("r")}}, {{SVGAttr("fx")}}, {{SVGAttr("fy")}}, và {{SVGAttr("fr")}} biểu thị các giá trị trong hệ tọa độ thu được bằng cách lấy hệ tọa độ người dùng hiện tại tại thời điểm phần tử gradient được tham chiếu (tức là hệ tọa độ người dùng của phần tử tham chiếu gradient qua thuộc tính {{SVGAttr("fill")}} hoặc {{SVGAttr("stroke")}}) rồi áp dụng phép biến đổi được chỉ định bởi thuộc tính {{SVGAttr("gradientTransform")}}.
- `objectBoundingBox`
  - : Đối với {{SVGElement("radialGradient")}}, hệ tọa độ người dùng cho các thuộc tính {{SVGAttr("cx")}}, {{SVGAttr("cy")}}, {{SVGAttr("r")}}, {{SVGAttr("fx")}}, {{SVGAttr("fy")}}, và {{SVGAttr("fr")}} được thiết lập bằng cách dùng khung bao của phần tử mà gradient được áp dụng (xem Object bounding box units) rồi áp dụng phép biến đổi được chỉ định bởi thuộc tính `gradientTransform`.
    Với giá trị này và `gradientTransform` là ma trận đơn vị, các vòng của radial gradient là hình tròn tương đối với không gian object bounding box (tức hệ tọa độ trừu tượng nơi (0,0) ở góc trên/trái của khung bao đối tượng và (1,1) ở góc dưới/phải của khung bao đối tượng). Khi khung bao của đối tượng không phải hình vuông, các vòng vốn được xem là hình tròn trong không gian object bounding box sẽ được hiển thị thành hình elip do áp dụng phép biến đổi co giãn không đồng đều từ không gian khung bao sang không gian người dùng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
