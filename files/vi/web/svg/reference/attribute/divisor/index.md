---
title: divisor
slug: Web/SVG/Reference/Attribute/divisor
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.divisor
sidebar: svgref
---

Thuộc tính **`divisor`** chỉ định giá trị mà theo đó số kết quả khi áp dụng {{SVGAttr("kernelMatrix")}} của phần tử {{SVGElement("feConvolveMatrix")}} lên giá trị màu của ảnh đầu vào sẽ được chia để tạo ra giá trị màu đích.

Một divisor là tổng của tất cả các giá trị ma trận có xu hướng tạo ra hiệu ứng làm đều cường độ màu tổng thể của kết quả.

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
    <feConvolveMatrix kernelMatrix="1 2 0 0 0 0 0 0 -1" divisor="1" />
  </filter>
  <filter id="convolveMatrix2" x="0" y="0" width="100%" height="100%">
    <feConvolveMatrix kernelMatrix="1 2 0 0 0 0 0 0 -1" divisor="8" />
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
      <td>{{cssxref("number")}}</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>
        Tổng của tất cả các giá trị trong {{SVGAttr("kernelMatrix")}} hoặc
        <code>1</code> nếu tổng bằng 0
      </td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number>`
  - : Giá trị này xác định divisor. Nếu divisor được chỉ định là `0` thì giá trị mặc định sẽ được dùng thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
