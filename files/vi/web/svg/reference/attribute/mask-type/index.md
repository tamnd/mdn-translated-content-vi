---
title: mask-type
slug: Web/SVG/Reference/Attribute/mask-type
page-type: svg-attribute
browser-compat: svg.elements.mask.mask-type
sidebar: svgref
---

Thuộc tính **`mask-type`** cho biết chế độ mặt nạ nào, _alpha_ hay _luminance_, sẽ được dùng cho nội dung của phần tử {{ SVGElement("mask") }} khi masking.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement('mask')}}

> [!NOTE]
> Presentation attribute này có thuộc tính CSS tương ứng: {{cssxref("mask-type")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Two identical masks other than the id and mask-type values -->
  <mask id="myMask1" mask-type="alpha">
    <rect
      fill="rgb(10% 10% 10% / 0.4)"
      x="0"
      y="0"
      width="100%"
      height="100%" />
    <circle fill="rgb(90% 90% 90% / 0.6)" cx="50" cy="50" r="35" />
  </mask>

  <mask id="myMask2" mask-type="luminance">
    <rect
      fill="rgb(10% 10% 10% / 0.4)"
      x="0"
      y="0"
      width="100%"
      height="100%" />
    <circle fill="rgb(90% 90% 90% / 0.6)" cx="50" cy="50" r="35" />
  </mask>

  <!-- The first rect is masked with an alpha mask -->
  <rect x="0" y="0" width="45" height="45" mask="url(#myMask1)" fill="red" />

  <!-- The last rect is masked with a luminance mask -->
  <rect x="55" y="0" width="45" height="45" mask="url(#myMask2)" fill="red" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## mask

Đối với {{SVGElement("mask")}}, `mask-type` xác định nội dung của phần tử mask được xử lý như một mặt nạ luminance hay alpha.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>alpha</code> | <code>luminance</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>luminance</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Discrete</td>
    </tr>
  </tbody>
</table>

- `alpha`
  - : Giá trị này cho biết các giá trị alpha của phần tử {{SVGElement('mask')}} sẽ được dùng; các pixel của đối tượng bị mask khớp với độ đục của vùng mask, không xét đến độ sáng của màu trong mask.
- `luminance`
  - : Giá trị này cho biết các giá trị luminance của phần tử {{SVGElement('mask')}} sẽ được dùng; độ đục của đối tượng bị mask phụ thuộc vào độ trong suốt và độ sáng của mask. Độ đục của một mask `luminance` được xác định bởi các kênh `R`, `G`, `B`, và `A` của mask, theo công thức `((0.2125 * R) + (0.7154 * G) + (0.0721 * B)) * A`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("mask-type")}}
- Thuộc tính CSS {{cssxref("mask-mode")}}
- [Giới thiệu về CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
