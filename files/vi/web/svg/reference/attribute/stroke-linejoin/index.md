---
title: stroke-linejoin
slug: Web/SVG/Reference/Attribute/stroke-linejoin
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-linejoin
sidebar: svgref
---

Thuộc tính **`stroke-linejoin`** là một thuộc tính trình bày xác định hình dạng sẽ được dùng ở các góc của path khi chúng được vẽ stroke.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-linejoin` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-linejoin")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}
- {{SVGElement('text')}}
- {{SVGElement('textPath')}}
- {{SVGElement('tspan')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 18 12" xmlns="http://www.w3.org/2000/svg">
  <!--
  Path góc trên bên trái:
  Hiệu ứng của giá trị "miter"
  -->
  <path
    d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="miter" />

  <!--
  Path ở giữa:
  Hiệu ứng của giá trị "round"
  -->
  <path
    d="M7,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="round" />

  <!--
  Path góc trên bên phải:
  Hiệu ứng của giá trị "bevel"
  -->
  <path
    d="M13,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="bevel" />

  <!--
  Path góc dưới bên trái:
  Hiệu ứng của giá trị "miter-clip"
  với fallback sang "miter" nếu không được hỗ trợ.
  -->
  <path
    d="M3,11 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="miter-clip" />

  <!--
  Path góc dưới bên phải:
  Hiệu ứng của giá trị "arcs"
  với fallback sang "miter" nếu không được hỗ trợ.
  -->
  <path
    d="M9,11 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
    stroke="black"
    fill="none"
    stroke-linejoin="arcs" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <g id="highlight">
    <path
      d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3.5"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5.5" r="0.05" fill="pink" />
  </g>
  <use href="#highlight" x="6" />
  <use href="#highlight" x="12" />
  <use href="#highlight" x="2" y="6" />
  <use href="#highlight" x="8" y="6" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 400)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>arcs</code> | <code>bevel</code> | <code>miter</code> |
        <code>miter-clip</code> | <code>round</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>miter</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

### arcs

> [!NOTE]
> Giá trị `arcs` chưa được hỗ trợ rộng rãi.

Giá trị `arcs` cho biết một góc arcs sẽ được dùng để nối các đoạn path. Hình arcs được tạo bằng cách kéo dài các cạnh ngoài của stroke tại điểm nối bằng các cung có cùng độ cong với các cạnh ngoài tại điểm nối.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "arcs" -->
  <path
    d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="arcs" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <g id="p">
    <path
      d="M1,5 a2,2 0,0,0 2,-3 a3,3 0 0 1 2,3"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
```

{{EmbedLiveSample('arcs', '100%', 200)}}

### bevel

Giá trị `bevel` cho biết một góc vát sẽ được dùng để nối các đoạn path.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "bevel" -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="bevel" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <g id="p">
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
```

{{EmbedLiveSample('bevel', '100%', 200)}}

### miter

Giá trị `miter` cho biết một góc nhọn sẽ được dùng để nối các đoạn path. Góc này được tạo bằng cách kéo dài các cạnh ngoài của stroke tại các tiếp tuyến của các đoạn path cho đến khi chúng giao nhau.

> [!NOTE]
> Nếu {{SVGAttr('stroke-miterlimit')}} bị vượt quá, line join sẽ chuyển sang `bevel`.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 -1 10 7" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "miter" -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter" />

  <!-- Hiệu ứng của giá trị "miter" trên một góc nhọn
       nơi miter limit mặc định bị vượt quá -->
  <path
    d="M7,5 l0.75,-3 l0.75,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter" />

  <!-- đường chấm đỏ sau đây cho thấy nơi
       giá trị miter rơi xuống giá trị bevel -->
  <path
    d="M0,0 h10"
    stroke="red"
    stroke-dasharray="0.05"
    stroke-width="0.025" />

  <!-- các đường màu hồng sau đây làm nổi bật vị trí của path cho từng stroke -->
  <g>
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />

    <path
      d="M7,5 l0.75,-3 l0.75,3"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="7" cy="5" r="0.05" fill="pink" />
    <circle cx="7.75" cy="2" r="0.05" fill="pink" />
    <circle cx="8.5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
```

{{EmbedLiveSample('miter', '100%', 200)}}

### miter-clip

> [!NOTE]
> Giá trị `miter-clip` chưa được hỗ trợ rộng rãi.

Giá trị `miter-clip` cho biết một góc nhọn sẽ được dùng để nối các đoạn path. Góc này được tạo bằng cách kéo dài các cạnh ngoài của stroke tại các tiếp tuyến của các đoạn path cho đến khi chúng giao nhau.

Nếu {{SVGAttr('stroke-miterlimit')}} bị vượt quá, miter sẽ bị cắt ở một khoảng cách bằng một nửa giá trị {{SVGAttr('stroke-miterlimit')}} nhân với độ rộng stroke tính từ giao điểm của các đoạn path. Điều này cho khả năng hiển thị tốt hơn `miter` trên các góc nối rất nhọn hoặc trong trường hợp hoạt ảnh.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 -1 10 7" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "miter-clip" -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter-clip" />

  <!-- Hiệu ứng của giá trị "miter-clip" trên một góc nhọn
       nơi miter limit mặc định bị vượt quá -->
  <path
    d="M7,5 l0.75,-3 l0.75,3"
    stroke="black"
    fill="none"
    stroke-linejoin="miter-clip" />

  <!-- đường chấm đỏ sau đây cho thấy nơi việc cắt nên xảy ra -->
  <path
    d="M0,0 h10"
    stroke="red"
    stroke-dasharray="0.05"
    stroke-width="0.025" />

  <!-- các đường màu hồng sau đây làm nổi bật vị trí của path cho từng stroke -->
  <g>
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />

    <path
      d="M7,5 l0.75,-3 l0.75,3"
      stroke="pink"
      fill="none"
      stroke-width="0.025" />
    <circle cx="7" cy="5" r="0.05" fill="pink" />
    <circle cx="7.75" cy="2" r="0.05" fill="pink" />
    <circle cx="8.5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
```

{{EmbedLiveSample('miter-clip', '100%', 200)}}

### round

Giá trị `round` cho biết một góc tròn sẽ được dùng để nối các đoạn path.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "round" -->
  <path
    d="M1,5 l2,-3 l2,3"
    stroke="black"
    fill="none"
    stroke-linejoin="round" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <g id="p">
    <path d="M1,5 l2,-3 l2,3" stroke="pink" fill="none" stroke-width="0.025" />
    <circle cx="1" cy="5" r="0.05" fill="pink" />
    <circle cx="3" cy="2" r="0.05" fill="pink" />
    <circle cx="5" cy="5" r="0.05" fill="pink" />
  </g>
</svg>
```

{{EmbedLiveSample('round', '100%', 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-linejoin")}}
