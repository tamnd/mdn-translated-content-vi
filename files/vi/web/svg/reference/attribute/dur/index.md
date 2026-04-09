---
title: dur
slug: Web/SVG/Reference/Attribute/dur
page-type: svg-attribute
browser-compat: svg.elements.animate.dur
sidebar: svgref
---

Thuộc tính **`dur`** cho biết thời lượng đơn giản của một hoạt ảnh.

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
<svg viewBox="0 0 220 150" xmlns="http://www.w3.org/2000/svg">
  <rect x="0" y="0" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="0"
      to="50"
      dur="1s"
      repeatCount="indefinite" />
  </rect>
  <rect x="120" y="0" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="0"
      to="50"
      dur="3s"
      repeatCount="indefinite" />
  </rect>
</svg>
```

{{EmbedLiveSample("Example", "220", "150")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#clock-value"
            >&#x3C;clock-value></a
          ></code
        >
        | <code>media</code> | <code>indefinite</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>indefinite</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<clock-value>`
  - : Giá trị này chỉ định độ dài của thời lượng đơn giản. Giá trị phải lớn hơn 0 và có thể được biểu diễn bằng giờ (`h`), phút (`m`), giây (`s`) hoặc mili giây (`ms`). Có thể kết hợp các biểu diễn thời gian này để tạo ra các thời lượng phức tạp như `hh:mm:ss.iii` hoặc `mm:ss.iii`.
- `media`
  - : Giá trị này chỉ định thời lượng đơn giản là thời lượng media nội tại. Giá trị này chỉ hợp lệ cho các phần tử định nghĩa media.
    (Đối với [các phần tử hoạt ảnh](/en-US/docs/Web/SVG/Reference/Element#animation_elements), thuộc tính sẽ bị bỏ qua nếu `media` được chỉ định.)
- `indefinite`
  - : Giá trị này chỉ định thời lượng đơn giản là không xác định.

> [!NOTE]
> {{Glossary("interpolation")}} sẽ không hoạt động nếu thời lượng đơn giản là không xác định (mặc dù điều này vẫn có thể hữu ích cho các phần tử {{SVGElement("set")}}).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
