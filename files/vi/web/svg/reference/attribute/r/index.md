---
title: r
slug: Web/SVG/Reference/Attribute/r
page-type: svg-attribute
browser-compat:
  - svg.elements.circle.r
  - svg.elements.radialGradient.r
sidebar: svgref
---

Thuộc tính **`r`** xác định bán kính của một hình tròn.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("circle")}}
- {{SVGElement("radialGradient")}}

Phần trăm tham chiếu đến đường chéo chuẩn hóa của viewport SVG hiện tại, được tính như <math><mfrac><msqrt><mrow><msup><mi>&lt;width&gt;</mi><mn>2</mn></msup><mo>+</mo><msup><mi>&lt;height&gt;</mi><mn>2</mn></msup></mrow></msqrt><msqrt><mn>2</mn></msqrt></mfrac></math>.

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 300 200" xmlns="http://www.w3.org/2000/svg">
  <radialGradient r="0" id="myGradient000">
    <stop offset="0" stop-color="white" />
    <stop offset="100%" stop-color="black" />
  </radialGradient>
  <radialGradient r="50%" id="myGradient050">
    <stop offset="0" stop-color="white" />
    <stop offset="100%" stop-color="black" />
  </radialGradient>
  <radialGradient r="100%" id="myGradient100">
    <stop offset="0" stop-color="white" />
    <stop offset="100%" stop-color="black" />
  </radialGradient>

  <circle cx="50" cy="50" r="0" />
  <circle cx="150" cy="50" r="25" />
  <circle cx="250" cy="50" r="50" />

  <rect x="20" y="120" width="60" height="60" fill="url(#myGradient000)" />
  <rect x="120" y="120" width="60" height="60" fill="url(#myGradient050)" />
  <rect x="220" y="120" width="60" height="60" fill="url(#myGradient100)" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## circle

Với {{SVGElement('circle')}}, `r` xác định bán kính của hình tròn và do đó là kích thước của nó. Với giá trị nhỏ hơn hoặc bằng 0, hình tròn sẽ không được vẽ.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
        |
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#percentage"
            >&#x3C;percentage></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Kích thước bán kính của một `<circle>` cũng có thể được xác định bằng thuộc tính hình học {{cssxref("r")}}.

## radialGradient

Với {{ SVGElement("radialGradient") }}, `r` xác định bán kính của hình tròn cuối cùng cho gradient xuyên tâm.

Gradient sẽ được vẽ sao cho điểm dừng gradient **100%** được ánh xạ tới chu vi của hình tròn cuối này. Giá trị nhỏ hơn hoặc bằng 0 sẽ khiến vùng đó được tô bằng một màu đơn, sử dụng màu và độ trong suốt của {{ SVGElement("stop") }} gradient cuối cùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#length"
            >&#x3C;length></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>50%</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- Thuộc tính CSS {{cssxref("r")}}
