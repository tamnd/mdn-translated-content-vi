---
title: preserveAlpha
slug: Web/SVG/Reference/Attribute/preserveAlpha
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.preserveAlpha
sidebar: svgref
---

Thuộc tính `preserveAlpha` cho biết phần tử {{SVGElement("feConvolveMatrix")}} xử lý độ trong suốt alpha như thế nào.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feConvolveMatrix")}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="convolveMatrix1" x="0" y="0" width="100%" height="100%">
    <feConvolveMatrix kernelMatrix="1 -1 2 0 0 0 0 0 -2" preserveAlpha="true" />
  </filter>
  <filter id="convolveMatrix2" x="0" y="0" width="100%" height="100%">
    <feConvolveMatrix
      kernelMatrix="1 -1 2 0 0 0 0 0 -2"
      preserveAlpha="false" />
  </filter>

  <image
    href="mdn_logo_only_color.png"
    width="200"
    height="200"
    filter="url(#convolveMatrix1)" />
  <image
    x="220"
    href="mdn_logo_only_color.png"
    width="200"
    height="200"
    filter="url(#convolveMatrix2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Default value</th>
      <td><code>false</code></td>
    </tr>
    <tr>
      <th scope="row">Value</th>
      <td><code>true</code> | <code>false</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `true`
  - : Giá trị này cho biết phép tích chập chỉ được áp dụng cho các kênh màu. Trong trường hợp này, bộ lọc tạm thời loại bỏ phép nhân trước alpha khỏi các giá trị thành phần màu, áp dụng kernel, rồi áp dụng lại phép nhân trước alpha như bước cuối.
- `false`
  - : Giá trị này cho biết phép tích chập được áp dụng cho tất cả các kênh, bao gồm cả kênh alpha.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
