---
title: clip
slug: Web/SVG/Reference/Attribute/clip
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.clip
sidebar: svgref
---

{{deprecated_header}}

Thuộc tính **`clip`** xác định vùng hiển thị của một phần tử. Bạn nên dùng {{svgattr("clip-path")}} thay thế.

> [!NOTE]
> Là một thuộc tính trình bày, `clip` cũng có một thuộc tính CSS tương ứng: {{cssxref("clip")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Thuộc tính này có cùng các giá trị tham số như được định nghĩa cho thuộc tính CSS {{cssxref("clip")}}. Các giá trị không có đơn vị, biểu thị tọa độ người dùng hiện tại, được phép dùng trong các giá trị tọa độ của `rect()`. Giá trị `auto` xác định một đường cắt dọc theo ranh giới của viewport được tạo bởi phần tử đã cho.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{ SVGElement("svg") }}
- {{ SVGElement("symbol") }}
- {{ SVGElement("image") }}
- {{ SVGElement("foreignObject") }}
- {{ SVGElement("pattern") }}
- {{ SVGElement("marker") }}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 20 10" xmlns="http://www.w3.org/2000/svg">
  <!-- Auto clipping -->
  <svg x="0" width="10" height="10" clip="auto">
    <circle cx="5" cy="5" r="4" stroke="green" />
  </svg>

  <!-- Rect(top, right, bottom, left) clipping -->
  <svg x="10" width="10" height="10" clip="rect(1, 9, 8, 2)">
    <circle cx="5" cy="5" r="4" stroke="green" />
  </svg>
</svg>
```

{{EmbedLiveSample("Example", '100%', 150)}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>auto</code> | <code>rect()</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Giá trị `auto` xác định một đường cắt dọc theo ranh giới của viewport được tạo bởi phần tử đã cho. Giá trị `rect()` xác định một hình chữ nhật cắt theo cú pháp sau: `rect(<top>, <right>, <bottom>, <left>)`. Các giá trị `<top>` và `<bottom>` chỉ định độ lệch tính từ _cạnh viền trên cùng_ của viewport phần tử, trong khi `<right>` và `<left>` chỉ định độ lệch tính từ _cạnh viền trái_ của viewport phần tử.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
