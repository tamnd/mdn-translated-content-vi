---
title: color-interpolation
slug: Web/CSS/Reference/Properties/color-interpolation
page-type: css-property
browser-compat: css.properties.color-interpolation
sidebar: cssref
---

Thuộc tính CSS `color-interpolation` được dùng trong SVG để chỉ định không gian màu nào sẽ được sử dụng cho các phần tử SVG {{SVGElement("linearGradient")}} và {{SVGElement("radialGradient")}}.

## Cú pháp

```css
/* Giá trị từ khóa */
color-interpolation: auto;
color-interpolation: sRGB;
color-interpolation: linearRGB;
```

### Giá trị

- `auto`
  - : Chỉ ra rằng tác nhân người dùng có thể chọn không gian `sRGB` hoặc `linearRGB` cho phép nội suy màu. Tùy chọn này chỉ ra rằng tác giả không yêu cầu phép nội suy màu phải xảy ra trong một không gian màu cụ thể.
- `sRGB`
  - : Chỉ ra rằng phép nội suy màu phải xảy ra trong không gian màu sRGB.
    Mặc định là giá trị ban đầu này nếu không có thuộc tính `color-interpolation` nào được đặt.
- `linearRGB`
  - : Chỉ ra rằng phép nội suy màu phải xảy ra trong không gian RGB được tuyến tính hóa như được mô tả trong [đặc tả sRGB](https://webstore.iec.ch/en/publication/6169).

## Định nghĩa hình thức

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>auto</code> | <code>sRGB</code> | <code>linearRGB</code></td>
    </tr>
    <tr>
      <th scope="row">Áp dụng cho</th>
      <td>{{SVGElement("linearGradient")}} và {{SVGElement("radialGradient")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>rời rạc</td>
    </tr>
  </tbody>
</table>

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Trong SVG đầu tiên, thuộc tính `color-interpolation` không được thêm vào phần tử `<linearGradient>` và phép nội suy màu mặc định là `sRGB`.
Ví dụ thứ hai cho thấy phép nội suy màu sử dụng giá trị `linearRGB`.

```html
<svg width="450" height="70">
  <title>Example of using the color-interpolation CSS Property</title>
  <defs>
    <linearGradient id="sRGB">
      <stop offset="0%" stop-color="white" />
      <stop offset="25%" stop-color="blue" />
      <stop offset="50%" stop-color="white" />
      <stop offset="75%" stop-color="red" />
      <stop offset="100%" stop-color="white" />
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="400" height="40" fill="url(#sRGB)" stroke="black" />
  <text x="0" y="60" font-family="courier" font-size="16">
    no color-interpolation (CSS property)
  </text>
</svg>
```

```html
<svg width="450" height="70">
  <title>Example of using the color-interpolation CSS Property</title>
  <defs>
    <linearGradient id="linearRGB">
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
    fill="url(#linearRGB)"
    stroke="black" />
  <text x="0" y="60" font-family="courier" font-size="16">
    color-interpolation: linearRGB; (CSS property)
  </text>
</svg>
```

```css
svg {
  display: block;
}

#linearRGB {
  color-interpolation: linearRGB;
}
```

{{EmbedLiveSample("Example", "100%", "140")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("linearGradient")}}
- {{SVGElement("radialGradient")}}
- Thuộc tính SVG {{SVGAttr("color-interpolation")}}
