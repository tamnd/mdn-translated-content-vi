---
title: version
slug: Web/SVG/Reference/Attribute/version
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.elements.svg.version
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`version`** được dùng để cho biết một tài liệu SVG tuân theo đặc tả nào. Nó chỉ được phép trên phần tử gốc {{SVGElement("svg")}}. Nó chỉ mang tính tham khảo và không có ảnh hưởng đến việc hiển thị hay xử lý.

Mặc dù đặc tả cho phép nhận bất kỳ số nào, hiện tại chỉ có hai lựa chọn hợp lệ là `1.0` và `1.1`.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("svg")}}

```html
<svg version="1.1" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <rect x="10" y="10" width="80" height="80" />
</svg>
```

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number"
            >&#x3C;number></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>None</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
