---
title: clip-rule
slug: Web/SVG/Reference/Attribute/clip-rule
page-type: svg-attribute
browser-compat: svg.global_attributes.clip-rule
sidebar: svgref
---

Thuộc tính `clip-rule` chỉ áp dụng cho các phần tử đồ họa nằm trong một phần tử {{ SVGElement("clipPath") }}. Thuộc tính `clip-rule` về cơ bản hoạt động như thuộc tính {{ SVGAttr("fill-rule") }}, ngoại trừ việc nó áp dụng cho các định nghĩa {{ SVGElement("clipPath") }}.

> [!NOTE]
> Là một thuộc tính trình bày, `clip-rule` cũng có một thuộc tính CSS tương ứng: {{cssxref("clip-rule")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Đoạn mã sau sẽ khiến một quy tắc cắt evenodd được áp dụng cho đường cắt vì `clip-rule` được chỉ định trên phần tử {{ SVGElement("path") }} định nghĩa hình dạng cắt:

```html
<g>
  <clipPath id="MyClip">
    <path d="..." clip-rule="evenodd" />
  </clipPath>
  <rect clip-path="url(#MyClip)" ... />
</g>
```

trong khi đoạn mã sau sẽ không khiến quy tắc cắt evenodd được áp dụng vì `clip-rule` được chỉ định trên phần tử tham chiếu, không phải trên đối tượng định nghĩa hình dạng cắt:

```html
<g>
  <clipPath id="MyClip">
    <path d="..." />
  </clipPath>
  <rect clip-path="url(#MyClip)" clip-rule="evenodd" ... />
</g>
```

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>nonzero | evenodd | inherit</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>nonzero</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- nonzero
  - : Xem mô tả của thuộc tính {{ SVGAttr("fill-rule") }}.
- evenodd
  - : Xem mô tả của thuộc tính {{ SVGAttr("fill-rule") }}.

## Ví dụ

```html
<svg
  width="100"
  viewBox="0 0 100 90"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1">
  <!-- Define star path -->
  <defs>
    <path d="M50,0 21,90 98,35 2,35 79,90z" id="star" />
  </defs>

  <!-- Left: evenodd -->
  <clipPath id="emptyStar">
    <use href="#star" clip-rule="evenodd" />
  </clipPath>
  <rect clip-path="url(#emptyStar)" width="50" height="90" fill="blue" />

  <!-- Right: nonzero -->
  <clipPath id="filledStar">
    <use href="#star" clip-rule="nonzero" />
  </clipPath>
  <rect clip-path="url(#filledStar)" width="50" height="90" x="50" fill="red" />
</svg>
```

{{ EmbedLiveSample('Example', '100%', '110') }}

## Phần tử

Các phần tử sau có thể dùng thuộc tính `clip-rule`, nhưng chỉ khi chúng nằm bên trong một phần tử {{ SVGElement("clipPath") }}.

- [Graphics elements](/en-US/docs/Web/SVG/Reference/Element#graphics_elements)

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ SVGElement("clipPath") }}
- Thuộc tính CSS {{cssxref("clip-rule")}}
