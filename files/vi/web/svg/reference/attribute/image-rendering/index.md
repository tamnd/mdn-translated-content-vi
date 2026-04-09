---
title: image-rendering
slug: Web/SVG/Reference/Attribute/image-rendering
page-type: svg-attribute
browser-compat: svg.global_attributes.image-rendering
sidebar: svgref
---

Thuộc tính **`image-rendering`** cung cấp một gợi ý cho trình duyệt về cách cân bằng giữa tốc độ và chất lượng khi nó thực hiện xử lý hình ảnh.

Việc lấy mẫu lại luôn được thực hiện trong không gian màu true color (ví dụ: 24-bit) ngay cả khi dữ liệu gốc và/hoặc thiết bị đích là màu lập chỉ mục.

> [!NOTE]
> Là một thuộc tính trình bày, `image-rendering` cũng có một thuộc tính CSS tương ứng: {{cssxref("image-rendering")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("image")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> | <code>optimizeSpeed</code> |
        <code>optimizeQuality</code>
      </td>
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

- `auto`
  - : Cho biết user agent sẽ đưa ra các đánh đổi phù hợp để cân bằng giữa tốc độ và chất lượng, nhưng chất lượng sẽ được ưu tiên hơn tốc độ.
- `optimizeSpeed`
  - : Cho biết user agent sẽ nhấn mạnh tốc độ hiển thị hơn chất lượng.
- `optimizeQuality`
  - : Cho biết user agent sẽ nhấn mạnh chất lượng hơn tốc độ hiển thị.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("image-rendering")}}
