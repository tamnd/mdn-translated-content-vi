---
title: fill-rule
slug: Web/SVG/Reference/Attribute/fill-rule
page-type: svg-attribute
browser-compat: svg.global_attributes.fill-rule
sidebar: svgref
---

Thuộc tính trình bày **`fill-rule`** định nghĩa thuật toán dùng để xác định phần _bên trong_ của một hình dạng.

> [!NOTE]
> Là một thuộc tính trình bày, `fill-rule` cũng có một thuộc tính CSS tương ứng: {{cssxref("fill-rule")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
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
<svg viewBox="-10 -10 220 120" xmlns="http://www.w3.org/2000/svg">
  <!-- Default value for fill-rule -->
  <polygon
    fill-rule="nonzero"
    stroke="red"
    points="50,0 21,90 98,35 2,35 79,90" />

  <!--
  The center of the shape has two
  path segments (shown by the red stroke)
  between it and infinity. It is therefore
  considered outside the shape, and not filled.
  -->
  <polygon
    fill-rule="evenodd"
    stroke="red"
    points="150,0 121,90 198,35 102,35 179,90" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>nonzero</code> | <code>evenodd</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>nonzero</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

Thuộc tính `fill-rule` cung cấp hai tùy chọn về cách xác định phần bên trong (tức là vùng sẽ được tô) của một hình dạng:

### nonzero

Giá trị `nonzero` xác định độ "ở trong" của một điểm trong hình bằng cách bắn một tia từ điểm đó tới vô cực theo bất kỳ hướng nào, rồi kiểm tra các vị trí mà một đoạn của hình cắt qua tia đó. Bắt đầu với số đếm bằng không, cộng một mỗi khi một đoạn path cắt tia từ trái sang phải và trừ một mỗi khi một đoạn path cắt tia từ phải sang trái. Sau khi đếm các giao cắt, nếu kết quả bằng không thì điểm nằm ngoài path. Ngược lại, nó nằm bên trong.

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-10 -10 320 120" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of nonzero fill rule on crossing path segments -->
  <polygon
    fill-rule="nonzero"
    stroke="red"
    points="50,0 21,90 98,35 2,35 79,90" />

  <!--
  Effect of nonzero fill rule on a shape inside a shape
  with the path segment moving in the same direction
  (both squares drawn clockwise, to the "right")
  -->
  <path
    fill-rule="nonzero"
    stroke="red"
    d="M110,0  h90 v90 h-90 z
           M130,20 h50 v50 h-50 z" />

  <!--
  Effect of nonzero fill rule on a shape inside a shape
  with the path segment moving in the opposite direction
  (one square drawn clockwise, the other anti-clockwise)
  -->
  <path
    fill-rule="nonzero"
    stroke="red"
    d="M210,0  h90 v90 h-90 z
           M230,20 v50 h50 v-50 z" />
</svg>
```

{{EmbedLiveSample('nonzero', '100%', 200)}}

### evenodd

Giá trị `evenodd` xác định độ "ở trong" của một điểm trong hình bằng cách bắn một tia từ điểm đó tới vô cực theo bất kỳ hướng nào và đếm số đoạn path của hình đã cho mà tia đó cắt qua. Nếu số này là lẻ, điểm nằm bên trong; nếu chẵn, điểm nằm bên ngoài.

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-10 -10 320 120" xmlns="http://www.w3.org/2000/svg">
  <!-- Effect of evenodd fill rule on crossing path segments -->
  <polygon
    fill-rule="evenodd"
    stroke="red"
    points="50,0 21,90 98,35 2,35 79,90" />

  <!--
  Effect of evenodd fill rule on a shape inside a shape
  with the path segment moving in the same direction
  (both squares drawn clockwise, to the "right")
  -->
  <path
    fill-rule="evenodd"
    stroke="red"
    d="M110,0  h90 v90 h-90 z
           M130,20 h50 v50 h-50 z" />

  <!--
  Effect of evenodd fill rule on a shape inside a shape
  with the path segment moving in opposite direction
  (one square drawn clockwise, the other anti-clockwise)
  -->
  <path
    fill-rule="evenodd"
    stroke="red"
    d="M210,0  h90 v90 h-90 z
           M230,20 v50 h50 v-50 z" />
</svg>
```

{{EmbedLiveSample('evenodd', '100%', 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("fill-rule")}}
