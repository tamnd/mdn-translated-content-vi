---
title: stroke-miterlimit
slug: Web/SVG/Reference/Attribute/stroke-miterlimit
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-miterlimit
sidebar: svgref
---

Thuộc tính **`stroke-miterlimit`** là một thuộc tính trình bày xác định một giới hạn cho tỷ lệ giữa độ dài miter và {{ SVGAttr("stroke-width") }} được dùng để vẽ một miter join. Khi giới hạn bị vượt quá, join sẽ được chuyển từ miter sang bevel.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-miterlimit` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-miterlimit")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 38 30" xmlns="http://www.w3.org/2000/svg">
  <!-- Ảnh hưởng của miter limit mặc định -->
  <path
    stroke="black"
    fill="none"
    stroke-linejoin="miter"
    id="p1"
    d="M1,9 l7   ,-3 l7   ,3
       m2,0 l3.5 ,-3 l3.5 ,3
       m2,0 l2   ,-3 l2   ,3
       m2,0 l0.75,-3 l0.75,3
       m2,0 l0.5 ,-3 l0.5 ,3" />

  <!-- Ảnh hưởng của miter limit nhỏ nhất (1) -->
  <path
    stroke="black"
    fill="none"
    stroke-linejoin="miter"
    stroke-miterlimit="1"
    id="p2"
    d="M1,19 l7   ,-3 l7   ,3
       m2, 0 l3.5 ,-3 l3.5 ,3
       m2, 0 l2   ,-3 l2   ,3
       m2, 0 l0.75,-3 l0.75,3
       m2, 0 l0.5 ,-3 l0.5 ,3" />

  <!-- Ảnh hưởng của miter limit lớn (8) -->
  <path
    stroke="black"
    fill="none"
    stroke-linejoin="miter"
    stroke-miterlimit="8"
    id="p3"
    d="M1,29 l7   ,-3 l7   ,3
       m2, 0 l3.5 ,-3 l3.5 ,3
       m2, 0 l2   ,-3 l2   ,3
       m2, 0 l0.75,-3 l0.75,3
       m2, 0 l0.5 ,-3 l0.5 ,3" />

  <!-- các đường màu hồng sau đây làm nổi bật vị trí của path cho từng stroke -->
  <path
    stroke="pink"
    fill="none"
    stroke-width="0.05"
    d="M1, 9 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3
      M1,19 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3
      M1,29 l7,-3 l7,3 m2,0 l3.5,-3 l3.5,3 m2,0 l2,-3 l2,3 m2,0 l0.75,-3 l0.75,3 m2,0 l0.5,-3 l0.5,3" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 400)}}

Khi hai đoạn thẳng gặp nhau tại một góc nhọn và đã chỉ định join `miter` cho {{ SVGAttr("stroke-linejoin") }}, miter có thể kéo dài rất xa vượt quá độ dày của stroke vẽ path. Tỷ lệ `stroke-miterlimit` được dùng để xác định khi nào giới hạn bị vượt quá, nếu vậy join sẽ được chuyển từ miter sang bevel.

Tỷ lệ giữa chiều dài miter (khoảng cách giữa đầu ngoài và góc trong của miter) và {{ SVGAttr("stroke-width") }} có liên hệ trực tiếp với góc (theta) giữa các đoạn trong không gian người dùng bằng công thức:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mstyle displaystyle="true"><mi>stroke-miterlimit</mi><mo>=</mo><mfrac><mrow><mi>miterLength</mi></mrow><mrow><mi>stroke-width</mi></mrow></mfrac><mo>=</mo><mfrac><mrow><mn>1</mn></mrow><mrow><mrow><mi>sin</mi><mrow><mo>(</mo><mfrac><mrow><mo>θ</mo></mrow><mrow><mn>2</mn></mrow></mfrac><mo>)</mo></mrow></mrow></mrow></mfrac></mstyle><annotation encoding="TeX">\text{stroke-miterlimit} = \frac{\text{miterLength}}{\text{stroke-width}} = \frac{1}{\sin\left(\frac{\theta}{2}\right)}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Ví dụ, miter limit là 1.414 sẽ chuyển miter thành bevel khi theta nhỏ hơn 90 độ, limit 4.0 sẽ chuyển chúng khi theta nhỏ hơn khoảng 29 độ, và limit 10.0 sẽ chuyển chúng khi theta nhỏ hơn khoảng 11.5 độ.

## Ngữ cảnh sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>4</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

Giá trị của `stroke-miterlimit` phải lớn hơn hoặc bằng 1.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-miterlimit")}}
