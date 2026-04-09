---
title: baseProfile
slug: Web/SVG/Reference/Attribute/baseProfile
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.elements.svg.baseProfile
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`baseProfile`** mô tả hồ sơ ngôn ngữ SVG tối thiểu mà tác giả tin là cần thiết để hiển thị đúng nội dung. Thuộc tính này không chỉ định bất kỳ hạn chế xử lý nào; có thể xem nó là siêu dữ liệu.

Ví dụ, giá trị của thuộc tính này có thể được dùng bởi một công cụ tạo nội dung để cảnh báo người dùng khi họ đang sửa đổi tài liệu vượt ra ngoài phạm vi của base profile đã chỉ định.

Mỗi hồ sơ SVG nên định nghĩa văn bản phù hợp cho thuộc tính này.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("svg")}}

## Ghi chú ngữ cảnh

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>Tên hồ sơ</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>none</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Ví dụ

```svg
<svg width="120" height="120" version="1.1"
 xmlns="http://www.w3.org/2000/svg" baseProfile="full">

  ...

</svg>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
