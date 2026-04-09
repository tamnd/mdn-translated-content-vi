---
title: pathLength
slug: Web/SVG/Reference/Attribute/pathLength
page-type: svg-attribute
spec-urls: https://svgwg.org/svg2-draft/paths.html#PathLengthAttribute
sidebar: svgref
---

Thuộc tính **`pathLength`** cho phép tác giả chỉ định tổng chiều dài cho path, tính bằng đơn vị người dùng. Giá trị này sau đó được dùng để hiệu chỉnh các phép tính khoảng cách của trình duyệt theo các phép tính của tác giả, bằng cách nhân tỷ lệ cho mọi phép tính khoảng cách theo tỷ lệ `pathLength` / (_giá trị tính toán của độ dài path_).

Điều này có thể ảnh hưởng đến các chiều dài thực được kết xuất của path; bao gồm text path, motion path, và các thao tác stroke khác nhau. Về cơ bản, mọi phép tính cần đến chiều dài của path. {{SVGAttr('stroke-dasharray')}}, chẳng hạn, sẽ coi đầu path là 0 và điểm cuối là giá trị được định nghĩa trong thuộc tính `pathLength`.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement('circle')}}
- {{SVGElement('ellipse')}}
- {{SVGElement('line')}}
- {{SVGElement('path')}}
- {{SVGElement('polygon')}}
- {{SVGElement('polyline')}}
- {{SVGElement('rect')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 60" xmlns="http://www.w3.org/2000/svg">
  <style>
    path {
      fill: none;
      stroke: black;
      stroke-width: 2;
      stroke-dasharray: 10;
    }
  </style>

  <!-- No pathLength, the real length of the path is used. In that case, 100 user units -->
  <path d="M 0,10 h100" />

  <!-- compute everything like if the path length was 90 user units long -->
  <path d="M 0,20 h100" pathLength="90" />

  <!-- compute everything like if the path length was 50 user units long -->
  <path d="M 0,30 h100" pathLength="50" />

  <!-- compute everything like if the path length was 30 user units long -->
  <path d="M 0,40 h100" pathLength="30" />

  <!-- compute everything like if the path length was 10 user units long -->
  <path d="M 0,50 h100" pathLength="10" />
</svg>
```

{{EmbedLiveSample("Example", '100%', 200)}}

## circle

Đối với {{SVGElement('circle')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho hình tròn, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## ellipse

Đối với {{SVGElement('ellipse')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho hình ellipse, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## line

Đối với {{SVGElement('line')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho đường thẳng, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## path

Đối với {{SVGElement('path')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho path, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## polygon

Đối với {{SVGElement('polygon')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho hình dạng, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## polyline

Đối với {{SVGElement('polyline')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho hình dạng, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## rect

Đối với {{SVGElement('rect')}}, `pathLength` cho phép tác giả chỉ định tổng chiều dài cho hình chữ nhật, tính bằng đơn vị người dùng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number">&#x3C;number></a></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}
