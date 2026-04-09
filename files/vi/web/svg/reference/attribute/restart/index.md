---
title: restart
slug: Web/SVG/Reference/Attribute/restart
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#RestartAttribute
sidebar: svgref
---

Thuộc tính **`restart`** chỉ định liệu một animation có thể khởi động lại hay không.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}

a {
  fill: blue;
  text-decoration: underline;
  cursor: pointer;
}
```

```html
<svg viewBox="0 0 220 200" xmlns="http://www.w3.org/2000/svg">
  <rect y="30" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="30"
      to="100"
      dur="5s"
      repeatCount="1"
      restart="always" />
  </rect>
  <rect x="120" y="30" width="100" height="100">
    <animate
      attributeType="XML"
      attributeName="y"
      from="30"
      to="100"
      dur="5s"
      repeatCount="1"
      restart="whenNotActive" />
  </rect>
  <a id="restart"><text y="20">Restart animation</text></a>
</svg>
```

```js
document.getElementById("restart").addEventListener("click", (evt) => {
  document.querySelectorAll("animate").forEach((element) => {
    element.beginElement();
  });
});
```

{{EmbedLiveSample("Example", "220", "150")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <code>always</code> | <code>whenNotActive</code> | <code>never</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td><code>always</code></td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>No</td>
    </tr>
  </tbody>
</table>

- `always`
  - : Giá trị này cho biết animation có thể được khởi động lại bất cứ lúc nào.
- `whenNotActive`
  - : Giá trị này cho biết animation chỉ có thể được khởi động lại khi nó không hoạt động (tức là sau khi active end). Các nỗ lực khởi động lại animation trong thời gian hoạt động của nó sẽ bị bỏ qua.
- `never`
  - : Giá trị này cho biết animation không thể được khởi động lại.

## Specifications

{{Specifications}}
