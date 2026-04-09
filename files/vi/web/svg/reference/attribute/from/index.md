---
title: from
slug: Web/SVG/Reference/Attribute/from
page-type: svg-attribute
browser-compat: svg.elements.animate.from
sidebar: svgref
---

Thuộc tính **`from`** chỉ ra giá trị ban đầu của thuộc tính sẽ được sửa đổi trong quá trình hoạt ảnh.

Khi dùng với thuộc tính {{SVGAttr("to")}}, hoạt ảnh sẽ thay đổi thuộc tính được sửa đổi từ giá trị `from` sang giá trị `to`. Khi dùng với thuộc tính {{SVGAttr("by")}}, hoạt ảnh sẽ thay đổi thuộc tính theo cách tương đối từ giá trị `from` theo giá trị được chỉ định trong `by`.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}

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
  <rect x="10" y="10" height="100">
    <animate attributeName="width" fill="freeze" from="100" to="150" dur="3s" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><em>Xem bên dưới</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Kiểu giá trị chính xác cho thuộc tính này phụ thuộc vào giá trị của thuộc tính sẽ được animate.

Khi một danh sách giá trị được định nghĩa qua thuộc tính {{SVGAttr("values")}}, thuộc tính `from` sẽ bị bỏ qua.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
