---
title: stroke-linecap
slug: Web/SVG/Reference/Attribute/stroke-linecap
page-type: svg-attribute
browser-compat: svg.global_attributes.stroke-linecap
sidebar: svgref
---

Thuộc tính **`stroke-linecap`** là một thuộc tính trình bày xác định hình dạng sẽ được dùng ở cuối các subpath mở khi chúng được vẽ stroke.

> [!NOTE]
> Là một thuộc tính trình bày, `stroke-linecap` cũng có một thuộc tính CSS tương ứng: {{cssxref("stroke-linecap")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('path')}}
- {{SVGElement('polyline')}}
- {{SVGElement('line')}}
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
<svg viewBox="0 0 6 6" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị (mặc định) "butt" -->
  <line x1="1" y1="1" x2="5" y2="1" stroke="black" stroke-linecap="butt" />

  <!-- Hiệu ứng của giá trị "round" -->
  <line x1="1" y1="3" x2="5" y2="3" stroke="black" stroke-linecap="round" />

  <!-- Hiệu ứng của giá trị "square" -->
  <line x1="1" y1="5" x2="5" y2="5" stroke="black" stroke-linecap="square" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <path d="M1,1 h4 M1,3 h4 M1,5 h4" stroke="pink" stroke-width="0.025" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>butt</code> | <code>round</code> | <code>square</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>butt</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

### butt

Giá trị `butt` cho biết stroke của mỗi subpath không kéo dài vượt quá hai điểm cuối của nó. Với một subpath có độ dài bằng không, path sẽ không được hiển thị gì cả.

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 6 4" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "butt" -->
  <path d="M1,1 h4" stroke="black" stroke-linecap="butt" />

  <!-- Hiệu ứng của giá trị "butt" trên một path có độ dài bằng không -->
  <path d="M3,3 h0" stroke="black" stroke-linecap="butt" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <path d="M1,1 h4" stroke="pink" stroke-width="0.025" />
  <circle cx="1" cy="1" r="0.05" fill="pink" />
  <circle cx="5" cy="1" r="0.05" fill="pink" />
  <circle cx="3" cy="3" r="0.05" fill="pink" />
</svg>
```

{{EmbedLiveSample('butt', '100%', 200)}}

### round

Giá trị `round` cho biết ở cuối mỗi subpath, stroke sẽ được kéo dài thêm bởi một nửa hình tròn có đường kính bằng với độ rộng stroke. Với một subpath có độ dài bằng không, stroke sẽ là một hình tròn đầy đủ có tâm tại điểm của subpath.

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 6 4" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "round" -->
  <path d="M1,1 h4" stroke="black" stroke-linecap="round" />

  <!-- Hiệu ứng của giá trị "round" trên một path có độ dài bằng không -->
  <path d="M3,3 h0" stroke="black" stroke-linecap="round" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <path d="M1,1 h4" stroke="pink" stroke-width="0.025" />
  <circle cx="1" cy="1" r="0.05" fill="pink" />
  <circle cx="5" cy="1" r="0.05" fill="pink" />
  <circle cx="3" cy="3" r="0.05" fill="pink" />
</svg>
```

{{EmbedLiveSample('round', '100%', 200)}}

### square

Giá trị `square` cho biết ở cuối mỗi subpath, stroke sẽ được kéo dài thêm bởi một hình chữ nhật có chiều rộng bằng nửa độ rộng stroke và chiều cao bằng độ rộng stroke. Với một subpath có độ dài bằng không, stroke sẽ là một hình vuông có độ rộng bằng độ rộng stroke, đặt tâm tại điểm của subpath.

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 6 4" xmlns="http://www.w3.org/2000/svg">
  <!-- Hiệu ứng của giá trị "square" -->
  <path d="M1,1 h4" stroke="black" stroke-linecap="square" />

  <!-- Hiệu ứng của giá trị "square" trên một path có độ dài bằng không -->
  <path d="M3,3 h0" stroke="black" stroke-linecap="square" />

  <!--
  các đường màu hồng sau đây làm nổi bật
  vị trí của path cho từng stroke
  -->
  <path d="M1,1 h4" stroke="pink" stroke-width="0.025" />
  <circle cx="1" cy="1" r="0.05" fill="pink" />
  <circle cx="5" cy="1" r="0.05" fill="pink" />
  <circle cx="3" cy="3" r="0.05" fill="pink" />
</svg>
```

{{EmbedLiveSample('square', '100%', 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("stroke-linecap")}}
