---
title: fetchpriority
slug: Web/SVG/Reference/Attribute/fetchpriority
page-type: svg-attribute
status:
  - experimental
  - non-standard
browser-compat:
  - svg.elements.feImage.fetchpriority
  - svg.elements.image.fetchpriority
  - svg.elements.script.fetchpriority
sidebar: svgref
---

{{SeeCompatTable}}{{non-standard_header}}

Thuộc tính `fetchpriority` cung cấp cho trình duyệt một gợi ý về mức độ ưu tiên tương đối cần dùng khi tìm nạp một tài nguyên bên ngoài. Nó hoạt động giống như thuộc tính `fetchpriority` cho các phần tử HTML {{HTMLElement("img", "", "#fetchpriority")}} và {{HTMLElement("script", "", "#fetchpriority")}}.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGelement("feimage")}}
- {{SVGelement("image")}}
- {{SVGelement("script")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>high</code> | <code>low</code> | <code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
  </tbody>
</table>

- `high`
  - : Tìm nạp tài nguyên bên ngoài với mức ưu tiên cao so với các tài nguyên bên ngoài khác.
- `low`
  - : Tìm nạp tài nguyên bên ngoài với mức ưu tiên thấp so với các tài nguyên bên ngoài khác.
- `auto`
  - : Không đặt ưu tiên cho việc tìm nạp.
    Nó được dùng nếu không có giá trị nào hoặc giá trị không hợp lệ được đặt.
    Đây là giá trị mặc định.

## Ví dụ

Ví dụ này cho thấy cách đặt mức ưu tiên của một phần tử SVG {{SVGelement("script")}} thành `high`.

```html
<svg
  viewBox="0 0 10 10"
  height="120px"
  width="120px"
  xmlns="http://www.w3.org/2000/svg">
  <circle id="normal" cx="5" cy="5" r="4" />
  <script href="./color-change.js" fetchpriority="high"></script>
</svg>
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{SVGelement("script")}}
- Thuộc tính HTML [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority)
