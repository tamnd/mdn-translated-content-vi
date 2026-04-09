---
title: spreadMethod
slug: Web/SVG/Reference/Attribute/spreadMethod
page-type: svg-attribute
browser-compat:
  - svg.elements.linearGradient.spreadMethod
  - svg.elements.radialGradient.spreadMethod
sidebar: svgref
---

Thuộc tính **`spreadMethod`** xác định cách một hình dạng được tô ngoài các mép được xác định của gradient.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("linearGradient")}}
- {{SVGElement("radialGradient")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>pad</code> | <code>reflect</code> | <code>repeat</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị ban đầu</th>
      <td><code>pad</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `pad`
  - : Giá trị này cho biết màu cuối cùng của gradient sẽ tô hình dạng vượt ra ngoài mép của gradient.
- `reflect`
  - : Giá trị này cho biết gradient lặp lại theo chiều ngược lại vượt ra ngoài mép của nó.
- `repeat`
  - : Giá trị này chỉ định rằng gradient lặp lại theo thứ tự ban đầu vượt ra ngoài mép của nó.

### Xác định mép của gradient

Theo mặc định, một gradient vươn tới các mép của hình dạng đang được tô. Để thấy tác động của thuộc tính này, bạn cần đặt kích thước gradient nhỏ hơn hình dạng.

Trong trường hợp gradient tuyến tính, các mép có thể được xác định như một hình chữ nhật bằng các thuộc tính `x1`, `x2`, `y1` và `y2`. Trong trường hợp gradient xuyên tâm, các mép có thể được xác định bằng các hình tròn ngoài và trong thông qua các thuộc tính `cx`, `cy` và `r` (ngoài) và `fx`, `fy` và `fr` (trong).

## Ví dụ về spreadMethod với gradient tuyến tính

### SVG

```html
<svg width="220" height="150" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="PadGradient" x1="33%" x2="67%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </linearGradient>
    <linearGradient
      id="ReflectGradient"
      spreadMethod="reflect"
      x1="33%"
      x2="67%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </linearGradient>
    <linearGradient id="RepeatGradient" spreadMethod="repeat" x1="33%" x2="67%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </linearGradient>
  </defs>

  <rect fill="url(#PadGradient)" x="10" y="0" width="200" height="40" />
  <rect fill="url(#ReflectGradient)" x="10" y="50" width="200" height="40" />
  <rect fill="url(#RepeatGradient)" x="10" y="100" width="200" height="40" />
</svg>
```

### Kết quả

{{EmbedLiveSample('Examples_of_spreadMethod_with_linear_gradients')}}

Lưu ý rằng một phần ba ở giữa của mỗi gradient là giống nhau. Hai phần ba ngoài cho thấy sự khác biệt giữa ba phương thức trải.

## Ví dụ về spreadMethod với gradient xuyên tâm

### SVG

```html
<svg width="340" height="120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="RadialPadGradient"
      cx="75%"
      cy="25%"
      r="33%"
      fx="64%"
      fy="18%"
      fr="17%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </radialGradient>
    <radialGradient
      id="RadialReflectGradient"
      spreadMethod="reflect"
      cx="75%"
      cy="25%"
      r="33%"
      fx="64%"
      fy="18%"
      fr="17%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </radialGradient>
    <radialGradient
      id="RadialRepeatGradient"
      spreadMethod="repeat"
      cx="75%"
      cy="25%"
      r="33%"
      fx="64%"
      fy="18%"
      fr="17%">
      <stop offset="0%" stop-color="fuchsia" />
      <stop offset="100%" stop-color="orange" />
    </radialGradient>
  </defs>

  <rect fill="url(#RadialPadGradient)" x="10" y="10" width="100" height="100" />
  <rect
    fill="url(#RadialReflectGradient)"
    x="120"
    y="10"
    width="100"
    height="100" />
  <rect
    fill="url(#RadialRepeatGradient)"
    x="230"
    y="10"
    width="100"
    height="100" />
</svg>
```

### Kết quả

{{EmbedLiveSample('Examples_of_spreadMethod_with_radial_gradients')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
