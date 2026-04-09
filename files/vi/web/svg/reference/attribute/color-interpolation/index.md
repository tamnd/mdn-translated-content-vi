---
title: color-interpolation
slug: Web/SVG/Reference/Attribute/color-interpolation
page-type: svg-attribute
browser-compat: svg.global_attributes.color-interpolation
sidebar: svgref
---

Thuộc tính **`color-interpolation`** chỉ định không gian màu cho các phép nội suy gradient, hoạt ảnh màu và phép ghép alpha.

> [!NOTE]
> Đối với hiệu ứng bộ lọc, thuộc tính {{SVGAttr("color-interpolation-filters")}} điều khiển không gian màu nào được dùng.

Thuộc tính `color-interpolation` chọn giữa các phép màu xảy ra trong không gian màu sRGB hoặc trong không gian màu RGB tuyến tính đã tuyến tính hóa (tức năng lượng ánh sáng tuyến tính). Sau khi đã chọn không gian màu phù hợp, phép nội suy tuyến tính theo từng thành phần sẽ được dùng.

Khi một phần tử con được pha trộn vào nền, giá trị của thuộc tính `color-interpolation` trên phần tử con xác định kiểu pha trộn, chứ không phải giá trị của `color-interpolation` trên phần tử cha. Với các gradient sử dụng thuộc tính {{SVGAttr("href")}} hoặc thuộc tính đã lỗi thời {{SVGAttr("xlink:href")}} để tham chiếu một gradient khác, gradient sẽ dùng giá trị của thuộc tính từ phần tử gradient được tham chiếu trực tiếp bởi thuộc tính {{SVGAttr("fill")}} hoặc {{SVGAttr("stroke")}}. Khi animate màu, phép nội suy màu được thực hiện theo giá trị của thuộc tính `color-interpolation` trên phần tử đang được animate.

> [!NOTE]
> Với vai trò là một presentation attribute, `color-interpolation` cũng có thuộc tính CSS tương ứng: {{cssxref("color-interpolation")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("circle")}}
- {{SVGElement("clipPath")}}
- {{SVGElement("defs")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- {{SVGElement("g")}}
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("linearGradient")}}
- {{SVGElement("marker")}}
- {{SVGElement("mask")}}
- {{SVGElement("path")}}
- {{SVGElement("pattern")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("radialGradient")}}
- {{SVGElement("rect")}}
- {{SVGElement("svg")}}
- {{SVGElement("switch")}}
- {{SVGElement("symbol")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- {{SVGElement("use")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>auto</code> | <code>sRGB</code> | <code>linearRGB</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>sRGB</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Cho biết rằng user agent có thể chọn không gian `sRGB` hoặc `linearRGB` cho phép nội suy màu. Tùy chọn này cho biết tác giả không yêu cầu việc nội suy màu diễn ra trong một không gian màu cụ thể.
- `sRGB`
  - : Cho biết rằng phép nội suy màu nên diễn ra trong không gian màu sRGB.
- `linearRGB`
  - : Cho biết rằng phép nội suy màu nên diễn ra trong không gian màu RGB tuyến tính như mô tả trong [đặc tả sRGB](https://webstore.iec.ch/en/publication/6169).

## Ví dụ

Ví dụ này cho thấy bốn SVG, mỗi SVG có một phần tử {{SVGElement("rect")}} và một gradient khác nhau được dùng làm phần tô cho `<rect>`. Hai SVG đầu dùng các phần tử {{SVGElement("linearGradient")}} và hai SVG sau dùng các phần tử {{SVGElement("radialGradient")}}. Trong các trình duyệt không hỗ trợ, gradient trông giống nhau.

Trong SVG đầu tiên này, thuộc tính `color-interpolation` không được đưa vào phần tử `<linearGradient>`, nên mặc định là `sRGB`.

```css hidden
svg {
  display: block;
}
```

```html
<svg width="450" height="70">
  <title>
    Example of linearGradient excluding the color-interpolation attribute
  </title>
  <defs>
    <linearGradient id="gradientDefault">
      <stop offset="0%" stop-color="white" />
      <stop offset="25%" stop-color="blue" />
      <stop offset="50%" stop-color="white" />
      <stop offset="75%" stop-color="red" />
      <stop offset="100%" stop-color="white" />
    </linearGradient>
  </defs>
  <rect
    x="0"
    y="0"
    width="400"
    height="40"
    fill="url(#gradientDefault)"
    stroke="black" />
  <text x="0" y="60" font-family="courier" font-size="16">
    color-interpolation not set
  </text>
</svg>
```

Trong SVG thứ hai này, thuộc tính `color-interpolation` được đưa vào phần tử `<linearGradient>` và đặt thành `linearRGB`.

```html
<svg width="450" height="70">
  <title>
    Example of linearGradient using the color-interpolation attribute
  </title>
  <defs>
    <linearGradient id="gradientLinearRGB" color-interpolation="linearRGB">
      <stop offset="0%" stop-color="white" />
      <stop offset="25%" stop-color="blue" />
      <stop offset="50%" stop-color="white" />
      <stop offset="75%" stop-color="red" />
      <stop offset="100%" stop-color="white" />
    </linearGradient>
  </defs>
  <rect
    x="0"
    y="0"
    width="400"
    height="40"
    fill="url(#gradientLinearRGB)"
    stroke="black" />
  <text x="0" y="60" font-family="courier" font-size="16">
    color-interpolation="linearRGB"
  </text>
</svg>
```

Trong SVG thứ ba này, thuộc tính `color-interpolation` không được đưa vào phần tử `<radialGradient>`, nên mặc định là `sRGB`.

```html
<svg width="450" height="70">
  <title>
    Example of radialGradient excluding the color-interpolation attribute
  </title>
  <defs>
    <radialGradient id="none">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="gold" />
    </radialGradient>
  </defs>
  <rect x="0" y="0" width="400" height="40" fill="url(#none)" stroke="black" />
  <text x="0" y="60" font-family="courier" font-size="16">
    color-interpolation not set
  </text>
</svg>
```

Trong SVG thứ tư này, thuộc tính `color-interpolation` được đưa vào phần tử `<radialGradient>` và đặt thành `linearRGB`.

```html
<svg width="450" height="70">
  <title>
    Example of radialGradient using the color-interpolation attribute
  </title>
  <defs>
    <radialGradient id="radLinearRGB" color-interpolation="linearRGB">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="gold" />
    </radialGradient>
  </defs>
  <rect
    x="0"
    y="0"
    width="400"
    height="40"
    fill="url(#radLinearRGB)"
    stroke="black" />
  <text x="0" y="60" font-family="courier" font-size="16">
    color-interpolation="linearRGB" (SVG attr)
  </text>
</svg>
```

{{EmbedLiveSample("Example", "100%", "280")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("linearGradient")}}
- {{SVGElement("radialGradient")}}
- Thuộc tính CSS {{cssxref("color-interpolation")}}
- [đặc tả sRGB](https://webstore.iec.ch/en/publication/6169)
- {{SVGAttr("color-interpolation-filters")}}
- [Computer color is broken](https://www.youtube.com/watch?v=LKnqECcg6Gw) - minh họa phổ biến về linearRGB
