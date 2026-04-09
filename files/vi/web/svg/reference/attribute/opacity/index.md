---
title: opacity
slug: Web/SVG/Reference/Attribute/opacity
page-type: svg-attribute
browser-compat: svg.global_attributes.opacity
sidebar: svgref
---

Thuộc tính **`opacity`** chỉ định độ trong suốt của một đối tượng hoặc một nhóm đối tượng, tức là mức độ mà nền phía sau phần tử bị phủ lên.

> [!NOTE]
> Với vai trò là một presentation attribute, `opacity` cũng có thuộc tính CSS tương ứng: {{cssxref("opacity")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("circle")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- {{SVGElement("g")}}
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("marker")}}
- {{SVGElement("path")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("svg")}}
- {{SVGElement("switch")}}
- {{SVGElement("symbol")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- {{SVGElement("use")}}

Không giống như {{SVGAttr("fill-opacity")}}, {{SVGAttr("stroke-opacity")}}, và {{SVGAttr("stop-opacity")}}, vốn được áp dụng cho từng thao tác riêng lẻ và được kết xuất _khi_ phần tử được kết xuất, `opacity` được áp dụng cho toàn bộ đối tượng hoặc nhóm, và giống như một thao tác hậu xử lý trên hình ảnh đã kết xuất của đối tượng hoặc nhóm đó. Vì vậy, khi bạn có cả `opacity` và các thuộc tính opacity khác trong cùng một khu vực, chúng sẽ chồng lên nhau và làm cho độ mờ bị nhân lên.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="gradient" x1="0%" y1="0%" x2="0" y2="100%">
      <stop offset="0%" stop-color="skyblue" />
      <stop offset="100%" stop-color="seagreen" />
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="100%" height="100%" fill="url(#gradient)" />
  <circle cx="50" cy="50" r="40" fill="black" />
  <circle cx="150" cy="50" r="40" fill="black" opacity="0.3" />
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;alpha-value></code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<alpha-value>`
  - : Thiết lập độ mờ đồng nhất áp dụng cho toàn bộ đối tượng, dưới dạng {{cssxref("number")}}. Bất kỳ giá trị nào ngoài phạm vi 0.0 (hoàn toàn trong suốt) đến 1.0 (hoàn toàn không trong suốt) sẽ được giới hạn trong phạm vi này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("opacity")}}
- {{SVGAttr("fill-opacity")}}
- {{SVGAttr("stop-opacity")}}
- {{SVGAttr("stroke-opacity")}}
