---
title: viewBox
slug: Web/SVG/Reference/Attribute/viewBox
page-type: svg-attribute
spec-urls: https://svgwg.org/svg2-draft/coords.html#ViewBoxAttribute
sidebar: svgref
---

Thuộc tính **`viewBox`** định nghĩa vị trí và kích thước, trong không gian người dùng, của một viewport SVG.

Giá trị của thuộc tính `viewBox` là một danh sách bốn số được phân tách bằng khoảng trắng và/hoặc dấu phẩy: `min-x`, `min-y`, `width` và `height`. `min-x` và `min-y` biểu thị các tọa độ X và Y nhỏ nhất mà `viewBox` có thể có (các tọa độ gốc của `viewBox`) và `width` cùng `height` chỉ định kích thước của `viewBox`. `viewBox` thu được là một hình chữ nhật trong không gian người dùng được ánh xạ tới giới hạn của viewport của một phần tử SVG (không phải [browser viewport](/en-US/docs/Glossary/Viewport)).
Khi một SVG chứa thuộc tính `viewBox` (thường kết hợp với thuộc tính [`preserveAspectRatio`](/en-US/docs/Web/SVG/Reference/Attribute/preserveAspectRatio)), một phép biến đổi sẽ kéo giãn hoặc thay đổi kích thước viewport SVG để vừa với một phần tử chứa cụ thể.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG được mô tả trong các phần bên dưới.

### `<marker>`

Với {{SVGElement('marker')}}, `viewBox` định nghĩa vị trí và kích thước cho nội dung của phần tử `<marker>`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### `<pattern>`

Với {{SVGElement('pattern')}}, `viewBox` định nghĩa vị trí và kích thước cho nội dung của ô pattern.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### `<svg>`

Với {{SVGElement('svg')}}, `viewBox` định nghĩa vị trí và kích thước cho nội dung của phần tử `<svg>`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### `<symbol>`

Với {{SVGElement('symbol')}}, `viewBox` định nghĩa vị trí và kích thước cho nội dung của phần tử `<symbol>`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### `<view>`

Với {{SVGElement('view')}}, `viewBox` định nghĩa vị trí và kích thước cho nội dung của phần tử `<view>`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >,?
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
  vertical-align: top;
}
svg:not(:root) {
  display: inline-block;
}
```
