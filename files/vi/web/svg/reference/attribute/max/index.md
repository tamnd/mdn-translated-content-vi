---
title: max
slug: Web/SVG/Reference/Attribute/max
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#MaxAttribute
sidebar: svgref
---

Thuộc tính **`max`** chỉ định giá trị tối đa của thời lượng hoạt ảnh đang hoạt động.

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
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
  <circle cx="60" cy="10" r="10">
    <animate
      attributeName="cx"
      dur="4s"
      max="6s"
      repeatCount="indefinite"
      values="60 ; 110 ; 60 ; 10 ; 60"
      keyTimes="0 ; 0.25 ; 0.5 ; 0.75 ; 1" />
    <animate
      attributeName="cy"
      dur="4s"
      max="6s"
      repeatCount="indefinite"
      values="10 ; 60 ; 110 ; 60 ; 10"
      keyTimes="0 ; 0.25 ; 0.5 ; 0.75 ; 1" />
  </circle>
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

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
      </td>
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

- `<clock-value>`
  - : Chỉ định độ dài của giá trị tối đa của thời lượng đang hoạt động, được đo theo thời gian cục bộ. Giá trị phải lớn hơn 0.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{SVGAttr("min")}}
