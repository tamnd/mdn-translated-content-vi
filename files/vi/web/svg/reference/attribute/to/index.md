---
title: to
slug: Web/SVG/Reference/Attribute/to
page-type: svg-attribute
spec-urls:
  - https://svgwg.org/specs/animations/#SetElementToAttribute
  - https://svgwg.org/specs/animations/#ToAttribute
sidebar: svgref
---

Thuộc tính **`to`** cho biết giá trị cuối cùng của thuộc tính sẽ được sửa đổi trong quá trình hoạt ảnh.

Giá trị của thuộc tính sẽ thay đổi giữa giá trị của thuộc tính {{SVGAttr("from")}} và giá trị này.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <rect x="10" y="10" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="width"
      fill="freeze"
      from="100"
      to="150"
      dur="3s" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## animate, animateMotion, animateTransform

Với {{SVGElement("animate")}}, {{SVGElement("animateMotion")}} và {{SVGElement("animateTransform")}}, `to` chỉ định giá trị kết thúc của hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;value></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>None</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Kiểu giá trị chính xác cho thuộc tính này phụ thuộc vào giá trị của thuộc tính sẽ được hoạt ảnh hóa.

Nếu một danh sách giá trị được định nghĩa qua thuộc tính {{SVGAttr("values")}}, thuộc tính `to` sẽ bị bỏ qua.

## set

Với phần tử {{SVGElement("set")}}, `to` chỉ định giá trị cho thuộc tính trong suốt thời lượng của phần tử.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;value></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>None</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Kiểu giá trị chính xác cho thuộc tính này phụ thuộc vào giá trị của thuộc tính sẽ được hoạt ảnh hóa.

## Đặc tả

{{Specifications}}
