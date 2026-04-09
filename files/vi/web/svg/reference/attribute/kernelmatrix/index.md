---
title: kernelMatrix
slug: Web/SVG/Reference/Attribute/kernelMatrix
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.kernelMatrix
sidebar: svgref
---

Thuộc tính **`kernelMatrix`** định nghĩa danh sách các số tạo thành kernel matrix cho phần tử {{SVGElement("feConvolveMatrix")}}.

Các giá trị được phân tách bằng khoảng trắng và/hoặc dấu phẩy. Số lượng mục trong danh sách phải bằng `<orderX>` nhân với `<orderY>` như được định nghĩa trong thuộc tính {{SVGAttr("order")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("feConvolveMatrix")}}

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
  <filter id="convolveMatrix1" x="0" y="0" width="100%" height="100%">
    <feConvolveMatrix kernelMatrix="1 1 0 0 0 0 0 0 -1" />
  </filter>
  <filter id="convolveMatrix2" x="0" y="0" width="100%" height="100%">
    <feConvolveMatrix kernelMatrix="-1 0 0 0 0 0 0 0 1" />
  </filter>

  <image
    href="mdn_logo_only_color.png"
    width="200"
    height="200"
    filter="url(#convolveMatrix1)" />
  <image
    x="220"
    href="mdn_logo_only_color.png"
    width="200"
    height="200"
    filter="url(#convolveMatrix2)" />
</svg>
```

{{EmbedLiveSample("Example", "420", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts"
            >&#x3C;list of numbers></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<list of numbers>`
  - : Danh sách các {{cssxref("number")}} tạo thành kernel matrix cho phép tích chập. Các giá trị được phân tách bằng khoảng trắng và/hoặc dấu phẩy. Số lượng mục trong danh sách phải bằng `<orderX>` nhân với `<orderY>`.

    Nếu kết quả của `orderX` \* `orderY` không bằng số lượng mục trong danh sách giá trị, primitive bộ lọc sẽ hoạt động như một bộ lọc truyền qua.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
