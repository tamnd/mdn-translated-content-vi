---
title: tableValues
slug: Web/SVG/Reference/Attribute/tableValues
page-type: svg-attribute
spec-urls: https://drafts.csswg.org/filter-effects-1/#element-attrdef-fecomponenttransfer-tablevalues
sidebar: svgref
---

Thuộc tính **`tableValues`** định nghĩa một danh sách các số tạo thành bảng tra cứu giá trị cho một hàm chuyển đổi thành phần màu.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feFuncA")}}
- {{SVGElement("feFuncB")}}
- {{SVGElement("feFuncG")}}
- {{SVGElement("feFuncR")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient
      id="gradient"
      gradientUnits="userSpaceOnUse"
      x1="0"
      y1="0"
      x2="200"
      y2="0">
      <stop offset="0" stop-color="red" />
      <stop offset="0.5" stop-color="lime" />
      <stop offset="1" stop-color="blue" />
    </linearGradient>
  </defs>

  <filter id="componentTransfer1" x="0" y="0" width="100%" height="100%">
    <feComponentTransfer>
      <feFuncR type="table" tableValues="0 1" />
      <feFuncG type="table" tableValues="0 1" />
      <feFuncB type="table" tableValues="0 1" />
    </feComponentTransfer>
  </filter>
  <filter id="componentTransfer2" x="0" y="0" width="100%" height="100%">
    <feComponentTransfer>
      <feFuncR type="table" tableValues="1 0" />
      <feFuncG type="table" tableValues="1 0" />
      <feFuncB type="table" tableValues="1 0" />
    </feComponentTransfer>
  </filter>

  <rect
    x="0"
    y="0"
    width="200"
    height="200"
    fill="url(#gradient)"
    filter="url(#componentTransfer1)" />
  <rect
    x="220"
    y="0"
    width="200"
    height="200"
    fill="url(#gradient)"
    filter="url(#componentTransfer2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts"
            >&#x3C;list-of-numbers></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Danh sách rỗng dẫn đến phép chuyển đổi đồng nhất</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

- `<list-of-numbers>`
  - : Giá trị này chứa một danh sách các số {{cssxref("number")}} được phân tách bằng dấu phẩy và/hoặc khoảng trắng, xác định một bảng tra cứu cho hàm chuyển đổi thành phần màu. Mỗi số có thể nằm trong khoảng từ `0` đến `1`.

    Một danh sách rỗng dẫn đến một hàm chuyển đổi đồng nhất.

## Đặc tả

{{Specifications}}
