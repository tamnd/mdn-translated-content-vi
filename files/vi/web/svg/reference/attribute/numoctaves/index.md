---
title: numOctaves
slug: Web/SVG/Reference/Attribute/numOctaves
page-type: svg-attribute
browser-compat: svg.elements.feTurbulence.numOctaves
sidebar: svgref
---

Thuộc tính **`numOctaves`** xác định số lượng octave cho hàm nhiễu của primitive {{SVGElement("feTurbulence")}}.

Một octave là một hàm nhiễu được xác định bởi tần số và biên độ của nó. Một turbulence được tạo bằng cách tích lũy nhiều octave với tần số tăng dần và biên độ giảm dần.
Số octave càng cao thì nhiễu càng trông tự nhiên. Tuy nhiên, nhiều octave hơn cũng đòi hỏi nhiều phép tính hơn, dẫn đến tác động tiêu cực đến hiệu năng.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feTurbulence")}}

## Ví dụ

### Ví dụ 1

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="noise1" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" numOctaves="1" />
  </filter>
  <filter id="noise2" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" numOctaves="3" />
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#noise1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#noise2)" />
</svg>
```

{{EmbedLiveSample("Example 1", "420", "200")}}

### Ví dụ 2

```html
<svg
  width="200"
  height="200"
  viewBox="0 0 220 220"
  xmlns="http://www.w3.org/2000/svg">
  <filter id="displacementFilter">
    <feTurbulence baseFrequency="0.05" numOctaves="3" result="turbulence" />
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

{{EmbedLiveSample("Example 2", "220", "250")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("integer")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<integer>`
  - : Xác định số octave. Giá trị âm không được phép.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Understanding Perlin Noise](https://adrianb.io/2014/08/09/perlinnoise.html)
- {{SVGAttr("baseFrequency")}}
