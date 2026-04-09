---
title: by
slug: Web/SVG/Reference/Attribute/by
page-type: svg-attribute
browser-compat: svg.elements.animateTransform.by
sidebar: svgref
---

Thuộc tính **`by`** chỉ định một giá trị độ lệch tương đối cho một thuộc tính sẽ được sửa đổi trong quá trình hoạt ảnh.

Giá trị bắt đầu cho thuộc tính hoặc được chỉ ra bằng cách đặt nó làm giá trị cho thuộc tính được cung cấp trong {{SVGAttr("attributeName")}} hoặc trong thuộc tính {{SVGAttr("from")}}.

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
  <rect x="10" y="10" width="100" height="100">
    <animate attributeName="width" fill="freeze" by="50" dur="3s" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Ghi chú sử dụng

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
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Kiểu giá trị chính xác của thuộc tính này phụ thuộc vào giá trị của thuộc tính sẽ được hoạt ảnh.

Khi một danh sách giá trị được định nghĩa qua thuộc tính {{SVGAttr("values")}}, thuộc tính `by` sẽ bị bỏ qua.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
