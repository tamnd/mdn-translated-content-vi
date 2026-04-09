---
title: k3
slug: Web/SVG/Reference/Attribute/k3
page-type: svg-attribute
browser-compat: svg.elements.feComposite.k3
sidebar: svgref
---

Thuộc tính **`k3`** định nghĩa một trong các giá trị được dùng trong phép toán `arithmetic` của primitive bộ lọc {{SVGElement("feComposite")}}.

Việc kết hợp các pixel được tính theo công thức sau:

```js
result = k1 * i1 * i2 + k2 * i1 + k3 * i2 + k4;
```

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feComposite")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="composite1" x="0" y="0" width="100%" height="100%">
    <feComposite
      in2="SourceGraphic"
      operator="arithmetic"
      k1="1"
      k2="0"
      k3="1"
      k4="0" />
  </filter>
  <filter id="composite2" x="0" y="0" width="100%" height="100%">
    <feComposite
      in2="SourceGraphic"
      operator="arithmetic"
      k1="1"
      k2="0"
      k3="10"
      k4="0" />
  </filter>

  <image
    href="mdn.svg"
    x="0"
    y="0"
    width="200"
    height="200"
    filter="url(#composite1)" />
  <image
    href="mdn.svg"
    x="220"
    y="0"
    width="200"
    height="200"
    filter="url(#composite2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
