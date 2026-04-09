---
title: text-rendering
slug: Web/SVG/Reference/Attribute/text-rendering
page-type: svg-attribute
browser-compat: svg.global_attributes.text-rendering
sidebar: svgref
---

Thuộc tính **`text-rendering`** cung cấp gợi ý cho bộ kết xuất về việc nên đánh đổi điều gì khi hiển thị văn bản.

> [!NOTE]
> Là một thuộc tính trình bày, `text-rendering` cũng có một thuộc tính CSS tương ứng: {{cssxref("text-rendering")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("text")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 140 40" xmlns="http://www.w3.org/2000/svg">
  <text y="15" text-rendering="geometricPrecision">Độ chính xác hình học</text>
  <text y="35" text-rendering="optimizeLegibility">Tối ưu khả năng đọc</text>
</svg>
```

{{EmbedLiveSample("Example", "420", "140")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> | <code>optimizeSpeed</code> |
        <code>optimizeLegibility</code> | <code>geometricPrecision</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>discrete</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Giá trị này cho biết user agent sẽ đưa ra các đánh đổi phù hợp để cân bằng giữa tốc độ, khả năng đọc và độ chính xác hình học, nhưng ưu tiên khả năng đọc hơn tốc độ và độ chính xác hình học.
- `optimizeSpeed`
  - : Giá trị này cho biết user agent sẽ nhấn mạnh tốc độ hiển thị hơn khả năng đọc và độ chính xác hình học. Tùy chọn này đôi khi sẽ khiến một số user agent tắt khử răng cưa cho văn bản.
- `optimizeLegibility`
  - : Giá trị này cho biết user agent sẽ nhấn mạnh khả năng đọc hơn tốc độ hiển thị và độ chính xác hình học. User agent thường sẽ chọn có áp dụng kỹ thuật khử răng cưa, hinting phông chữ tích hợp hay cả hai để tạo ra văn bản dễ đọc nhất.
- `geometricPrecision`
  - : Giá trị này cho biết user agent sẽ nhấn mạnh độ chính xác hình học hơn khả năng đọc và tốc độ hiển thị. Tùy chọn này thường sẽ khiến user agent tạm dừng việc dùng hinting để đường viền {{Glossary("glyph")}} được vẽ với độ chính xác hình học tương đương với việc hiển thị dữ liệu path.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("text-rendering")}}
