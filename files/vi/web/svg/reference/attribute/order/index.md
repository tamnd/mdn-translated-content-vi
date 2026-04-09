---
title: order
slug: Web/SVG/Reference/Attribute/order
page-type: svg-attribute
browser-compat: svg.elements.feConvolveMatrix.order
sidebar: svgref
---

Thuộc tính **`order`** cho biết kích thước của ma trận sẽ được dùng bởi phần tử {{SVGElement("feConvolveMatrix")}}.

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
  <filter id="emboss1" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" seed="0" />
    <feConvolveMatrix kernelMatrix="3 0 0 -4" order="2" />
  </filter>
  <filter id="emboss2" x="0" y="0" width="100%" height="100%">
    <feTurbulence baseFrequency="0.025" seed="0" />
    <feConvolveMatrix kernelMatrix="3 0 0 0 0 0 0 0 -4" order="3" />
  </filter>

  <rect x="0" y="0" width="200" height="200" filter="url(#emboss1)" />
  <rect x="220" y="0" width="200" height="200" filter="url(#emboss2)" />
</svg>
```

{{EmbedLiveSample("Example", "480", "200")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
            >&#x3C;number-optional-number></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>3</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number-optional-number>`
  - : Giá trị này cho biết số ô trong mỗi chiều cho kernel matrix. Các giá trị được cung cấp phải là {{cssxref("integer")}} lớn hơn zero. Các giá trị không phải số nguyên sẽ bị cắt bớt, tức là làm tròn về số nguyên gần nhất theo hướng về zero. Số đầu tiên cho biết số cột trong ma trận. Số thứ hai cho biết số hàng trong ma trận. Nếu không cung cấp số thứ hai, nó mặc định bằng số đầu tiên.

    Nên chỉ dùng các giá trị nhỏ (ví dụ: 3); các giá trị lớn hơn có thể dẫn đến chi phí CPU rất cao và thường không tạo ra kết quả đủ để bù cho tác động lên hiệu năng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
