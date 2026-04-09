---
title: slope
slug: Web/SVG/Reference/Attribute/slope
page-type: svg-attribute
browser-compat: svg.elements.feFuncR
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomponenttransfer-slope
sidebar: svgref
---

Thuộc tính **`slope`** xác định các giá trị cho bộ lọc tuyến tính, chẳng hạn như độ sáng.

Thuộc tính `slope` được hỗ trợ bởi các phần tử con của bộ lọc nguyên thủy {{SVGElement("feComponentTransfer")}}, bao gồm các hàm chuyển đổi `feFunc-RGBA`. Khi `type` của một hàm chuyển đổi là `linear`, `slope` sẽ xác định độ dốc của hàm tuyến tính.

Bạn có thể dùng thuộc tính này với các phần tử hàm chuyển đổi thành phần SVG sau khi đặt `type="linear"`:

- {{SVGElement("feFuncR")}}
- {{SVGElement("feFuncG")}}
- {{SVGElement("feFuncB")}}
- {{SVGElement("feFuncA")}}

> [!NOTE]
> Ban đầu, thuộc tính `slope` được dùng trong `<font-face>` để chỉ góc nét dọc của phông chữ. Trường hợp sử dụng này đã bị loại bỏ.

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></code
        >
      </td>
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

- `<number>`
  - : Giá trị này cho biết độ dốc của các hàm chuyển đổi thành phần tuyến tính.

## Ví dụ

Trong ví dụ này, một hộp gradient có hai phần tử văn bản được áp dụng các bộ lọc tuyến tính. Độ dốc của các hàm chuyển đổi bộ lọc ở mỗi bộ lọc là khác nhau.

```html
<svg
  width="8cm"
  height="4cm"
  viewBox="0 0 800 400"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1">
  <title>Examples of feComponentTransfer operations</title>
  <desc>
    Text strings showing the effects of the slope attribute of the
    feComponentTransfer filter function linear options.
  </desc>
  <defs>
    <linearGradient
      id="MyGradient"
      gradientUnits="userSpaceOnUse"
      x1="100"
      y1="0"
      x2="600"
      y2="0">
      <stop offset="0" stop-color="red" />
      <stop offset="1" stop-color="blue" />
    </linearGradient>
    <filter
      id="Linear1"
      filterUnits="objectBoundingBox"
      x="0%"
      y="0%"
      width="100%"
      height="100%">
      <feComponentTransfer>
        <feFuncR type="linear" slope="1" />
        <feFuncG type="linear" slope="1" />
        <feFuncB type="linear" slope="1" />
      </feComponentTransfer>
    </filter>
    <filter
      id="Linear2"
      filterUnits="objectBoundingBox"
      x="0%"
      y="0%"
      width="100%"
      height="100%">
      <feComponentTransfer>
        <feFuncR type="linear" slope="0.5" />
        <feFuncG type="linear" slope="2.5" />
        <feFuncB type="linear" slope="5" />
      </feComponentTransfer>
    </filter>
  </defs>
  <rect fill="none" stroke="blue" x="1" y="1" width="798" height="398" />
  <g
    font-family="Verdana"
    font-size="100"
    font-weight="bold"
    fill="url(#MyGradient)">
    <text x="100" y="190" filter="url(#Linear1)">Slope1</text>
    <text x="100" y="290" filter="url(#Linear2)">Slope2</text>
  </g>
</svg>
```

{{EmbedLiveSample('Examples', 300, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
