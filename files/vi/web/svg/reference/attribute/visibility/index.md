---
title: visibility
slug: Web/SVG/Reference/Attribute/visibility
page-type: svg-attribute
browser-compat: svg.global_attributes.visibility
sidebar: svgref
---

Thuộc tính **`visibility`** cho phép bạn kiểm soát độ hiển thị của các phần tử đồ họa. Với giá trị `hidden` hoặc `collapse`, phần tử đồ họa hiện tại sẽ không nhìn thấy được.

> [!NOTE]
> Nếu thuộc tính `visibility` được đặt thành `hidden` trên một phần tử văn bản, thì văn bản sẽ không nhìn thấy nhưng vẫn chiếm không gian trong các phép tính bố cục văn bản.

Tùy theo giá trị của thuộc tính {{SVGAttr("pointer-events")}}, các phần tử đồ họa có thuộc tính `visibility` được đặt thành `hidden` vẫn có thể nhận sự kiện.

> [!NOTE]
> Là một thuộc tính trình bày, `visibility` cũng có một thuộc tính CSS tương ứng: {{cssxref("visibility")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- `<audio>`
- `<canvas>`
- {{SVGElement("circle")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- `<iframe>`
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("path")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- `<video>`

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>visible</code> | <code>hidden</code> | <code>collapse</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>visible</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `visible`
  - : Giá trị này cho biết phần tử sẽ được vẽ.
- `hidden`
  - : Giá trị này cho biết phần tử sẽ không được vẽ. Dù nó vẫn là một phần của cây kết xuất, nó có thể nhận sự kiện con trỏ tùy theo thuộc tính {{SVGAttr("pointer-events")}}, có thể nhận focus tùy theo thuộc tính {{SVGAttr("tabindex")}}, góp phần vào tính toán hộp bao và đường cắt, và vẫn ảnh hưởng đến bố cục văn bản.
- `collapse`
  - : Giá trị này tương đương với `hidden`.

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
<svg viewBox="0 0 220 120" xmlns="http://www.w3.org/2000/svg">
  <rect
    x="10"
    y="10"
    width="200"
    height="100"
    stroke="black"
    stroke-width="5"
    fill="transparent" />
  <g stroke="seagreen" stroke-width="5" fill="skyblue">
    <rect x="20" y="20" width="80" height="80" visibility="visible" />
    <rect x="120" y="20" width="80" height="80" visibility="hidden" />
  </g>
</svg>
```

{{EmbedLiveSample("Example 1", "250", "100")}}

### Ví dụ 2

Ví dụ sau bật tắt `visibility` CSS của đường dẫn ảnh SVG.

#### HTML

```html
<button id="nav-toggle-button">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    class="button-icon">
    <path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z" />
    <path
      d="M12 8l-6 6 1.41 1.41L12 10.83l4.59 4.58L18 14z"
      class="invisible" />
    <path d="M0 0h24v24H0z" fill="none" />
  </svg>
  <span> click me </span>
</button>
```

#### CSS

```css
svg {
  display: inline !important;
}
span {
  vertical-align: 50%;
}
button {
  line-height: 1em;
}
.invisible {
  visibility: hidden;
}
```

#### JavaScript

```js
const button = document.querySelector("button");
button.addEventListener("click", (evt) => {
  button
    .querySelector("svg > path:nth-of-type(1)")
    .classList.toggle("invisible");
  button
    .querySelector("svg > path:nth-of-type(2)")
    .classList.toggle("invisible");
});
```

#### Kết quả

{{EmbedLiveSample("Example 2", "100%", "80")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{SVGAttr("display")}}
- Thuộc tính CSS {{cssxref("visibility")}}
