---
title: result
slug: Web/SVG/Reference/Attribute/result
page-type: svg-attribute
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-filter-primitive-result
sidebar: svgref
---

Thuộc tính **`result`** xác định tên được gán cho bộ lọc nguyên thủy này. Nếu được cung cấp, thì phần đồ họa thu được từ việc xử lý bộ lọc nguyên thủy này có thể được tham chiếu bằng thuộc tính {{SVGAttr("in")}} trên một bộ lọc nguyên thủy tiếp theo trong cùng phần tử {{SVGElement("filter")}}. Nếu không cung cấp giá trị, đầu ra sẽ chỉ có sẵn để dùng lại như đầu vào ngầm định cho bộ lọc nguyên thủy kế tiếp nếu bộ lọc nguyên thủy đó không cung cấp giá trị cho thuộc tính `in` của nó.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feBlend")}}
- {{SVGElement("feColorMatrix")}}
- {{SVGElement("feComponentTransfer")}}
- {{SVGElement("feComposite")}}
- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feDisplacementMap")}}
- {{SVGElement("feDropShadow")}}
- {{SVGElement("feFlood")}}
- {{SVGElement("feGaussianBlur")}}
- {{SVGElement("feImage")}}
- {{SVGElement("feMerge")}}
- {{SVGElement("feMorphology")}}
- {{SVGElement("feOffset")}}
- {{SVGElement("feSpecularLighting")}}
- {{SVGElement("feTile")}}
- {{SVGElement("feTurbulence")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 220 220" xmlns="http://www.w3.org/2000/svg">
  <filter id="displacementFilter">
    <feTurbulence
      type="turbulence"
      baseFrequency="0.05"
      numOctaves="2"
      result="turbulence" />
    <feDisplacementMap
      in2="turbulence"
      in="SourceGraphic"
      scale="50"
      xChannelSelector="R"
      yChannelSelector="G" />
  </filter>

  <circle cx="100" cy="100" r="100" filter="url(#displacementFilter)" />
</svg>
```

{{EmbedLiveSample("Example", 220, 220)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;filter-primitive-reference></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<filter-primitive-reference>`
  - : Giá trị này là một {{cssxref("custom-ident")}} và xác định tên cho bộ lọc nguyên thủy. Nó chỉ có ý nghĩa trong phạm vi của một phần tử {{SVGElement("filter")}} cụ thể và vì vậy chỉ có phạm vi cục bộ. Việc cùng một `<filter-primitive-reference>` xuất hiện nhiều lần trong cùng một phần tử `<filter>` là hợp lệ. Khi được tham chiếu, giá trị này sẽ dùng bộ lọc nguyên thủy đứng trước gần nhất có cùng `result`.

## Thông số kỹ thuật

{{Specifications}}
