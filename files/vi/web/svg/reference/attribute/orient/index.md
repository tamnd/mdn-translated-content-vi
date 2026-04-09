---
title: orient
slug: Web/SVG/Reference/Attribute/orient
page-type: svg-attribute
browser-compat: svg.elements.marker.orient
sidebar: svgref
---

Thuộc tính **`orient`** cho biết marker được xoay như thế nào khi nó được đặt tại vị trí của nó trên hình dạng.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("marker")}}

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
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>

    <marker
      id="dataArrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="-65deg">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="red" />
    </marker>
  </defs>

  <polyline
    points="10,10 10,90 90,90"
    fill="none"
    stroke="black"
    marker-start="url(#arrow)"
    marker-end="url(#arrow)" />

  <polyline
    points="15,80 29,50 43,60 57,30 71,40 85,15"
    fill="none"
    stroke="grey"
    marker-start="url(#dataArrow)"
    marker-mid="url(#dataArrow)"
    marker-end="url(#dataArrow)" />
</svg>
```

{{EmbedLiveSample("Example", "220", "220")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> | <code>auto-start-reverse</code> |
        {{cssxref("angle")}} | {{cssxref("number")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có (không tích lũy)</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Giá trị này cho biết marker được định hướng sao cho trục x dương của nó chỉ theo một hướng tương đối với đường dẫn tại vị trí marker được đặt.
- `auto-start-reverse`
  - : Nếu được đặt bởi {{SVGAttr("marker-start")}}, marker được định hướng lệch 180° so với hướng sẽ được dùng nếu chỉ định `auto`. Với mọi marker khác, `auto-start-reverse` có nghĩa giống `auto`.

    > [!NOTE]
    > Điều này cho phép định nghĩa một marker đầu mũi tên duy nhất có thể dùng cho cả đầu và cuối của một đường dẫn, tức là chỉ ra ngoài từ cả hai đầu.

- `<angle>`
  - : Giá trị này cho biết marker được định hướng sao cho góc được chỉ định là góc đo giữa trục x dương của hình dạng và trục x dương của marker.

    > [!NOTE]
    > Ví dụ, nếu giá trị `45` được đưa ra, trục x dương của marker sẽ chỉ xuống và sang phải trong hệ tọa độ của hình dạng.

- `<number>`
  - : Giá trị này cho biết một góc tính bằng độ. Marker được định hướng sao cho góc được chỉ định là góc đo giữa trục x dương của hình dạng và trục x dương của marker.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
