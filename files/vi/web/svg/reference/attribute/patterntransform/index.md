---
title: patternTransform
slug: Web/SVG/Reference/Attribute/patternTransform
page-type: svg-attribute
browser-compat: svg.elements.pattern.patternTransform
sidebar: svgref
---

Thuộc tính **`patternTransform`** xác định một danh sách [định nghĩa biến đổi](/en-US/docs/Web/SVG/Reference/Attribute/transform#transform_functions) được áp dụng cho một tile pattern.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement('pattern')}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- Apply a transform on the tile -->
  <pattern
    id="p1"
    width=".25"
    height=".25"
    patternTransform="rotate(20)
                      skewX(30)
                      scale(1 0.5)">
    <circle cx="10" cy="10" r="10" />
  </pattern>

  <!-- Apply the transformed pattern tile -->
  <rect x="10" y="10" width="80" height="80" fill="url(#p1)" />
</svg>
```

{{EmbedLiveSample("Examples", '100%', 300)}}

## Các phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG được mô tả trong các phần bên dưới.

### `<pattern>`

Đối với {{SVGElement('pattern')}}, `patternTransform` xác định một danh sách [định nghĩa biến đổi](/en-US/docs/Web/SVG/Reference/Attribute/transform#transform_functions) được áp dụng cho một tile pattern.

> [!NOTE]
> Kể từ SVG2, cũng được phép dùng thuộc tính CSS {{ cssxref('transform') }}. Tuy nhiên, trạng thái triển khai hiện tại không thực sự tốt. Vì lý do tương thích ngược, nên tiếp tục dùng thuộc tính `patternTransform`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <a href="/en-US/docs/Web/SVG/Reference/Attribute/transform#transform_functions"
          >&#x3C;transform-list></a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Phép biến đổi đồng nhất</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### Các hàm biến đổi

Để biết thêm về định nghĩa của các hàm biến đổi, xem định nghĩa thuộc tính {{ SVGAttr("transform") }}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
