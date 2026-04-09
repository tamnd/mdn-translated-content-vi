---
title: rotate
slug: Web/SVG/Reference/Attribute/rotate
page-type: svg-attribute
browser-compat: svg.elements.animateMotion.rotate
sidebar: svgref
---

Thuộc tính `rotate` xác định cách phần tử được hoạt ảnh xoay khi nó di chuyển dọc theo một đường dẫn được chỉ định trong phần tử {{SVGElement("animateMotion")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("animateMotion")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> | <code>auto-reverse</code> |
        {{cssxref("number")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Giá trị `auto` và `auto-reverse` cho phép góc quay của phần tử được hoạt ảnh thay đổi linh hoạt khi nó di chuyển dọc theo đường dẫn. Nếu giá trị của `rotate` là `auto`, phần tử sẽ xoay để căn chỉnh cạnh bên phải của nó theo hướng chuyển động hiện tại. Nếu giá trị là `auto-reverse`, nó sẽ xoay để cạnh bên trái của nó theo hướng chuyển động hiện tại.

Đặt giá trị `rotate` thành một số sẽ chỉ định một góc quay cố định, tính bằng độ, không thay đổi theo hoạt ảnh. Giá trị mặc định `0` giữ nguyên hướng ban đầu của phần tử được hoạt ảnh.

## Ví dụ

### SVG

```html
<svg
  width="400"
  height="120"
  viewBox="0 0 480 120"
  xmlns="http://www.w3.org/2000/svg">
  <!-- Draw the outline of the motion path in grey -->
  <path
    d="M10,110 A120,120 -45 0,1 110 10 A120,120 -45 0,1 10,110"
    stroke="lightgrey"
    stroke-width="2"
    fill="none"
    id="theMotionPath" />

  <!-- Red arrow which will not rotate -->
  <path fill="red" d="M-5,-5 L10,0 -5,5 0,0 Z">
    <!-- Define the motion path animation -->
    <animateMotion dur="6s" repeatCount="indefinite" rotate="0">
      <mpath href="#theMotionPath" />
    </animateMotion>
  </path>

  <g transform="translate(100, 0)">
    <use href="#theMotionPath" />
    <!-- Green arrow which will rotate along the motion path -->
    <path fill="green" d="M-5,-5 L10,0 -5,5 0,0 Z">
      <!-- Define the motion path animation -->
      <animateMotion dur="6s" repeatCount="indefinite" rotate="auto">
        <mpath href="#theMotionPath" />
      </animateMotion>
    </path>
  </g>

  <g transform="translate(200, 0)">
    <use href="#theMotionPath" />
    <!-- Blue arrow which will rotate backwards along the motion path -->
    <path fill="blue" d="M-5,-5 L10,0 -5,5 0,0 Z">
      <!-- Define the motion path animation -->
      <animateMotion dur="6s" repeatCount="indefinite" rotate="auto-reverse">
        <mpath href="#theMotionPath" />
      </animateMotion>
    </path>
  </g>

  <g transform="translate(300, 0)">
    <use href="#theMotionPath" />
    <!-- Purple arrow which will have a static rotation of 210 degrees -->
    <path fill="purple" d="M-5,-5 L10,0 -5,5 0,0 Z">
      <!-- Define the motion path animation -->
      <animateMotion dur="6s" repeatCount="indefinite" rotate="210">
        <mpath href="#theMotionPath" />
      </animateMotion>
    </path>
  </g>
</svg>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
