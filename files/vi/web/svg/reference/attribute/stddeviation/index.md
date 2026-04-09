---
title: stdDeviation
slug: Web/SVG/Reference/Attribute/stdDeviation
page-type: svg-attribute
browser-compat:
  - svg.elements.feDropShadow.stdDeviation
  - svg.elements.feGaussianBlur.stdDeviation
sidebar: svgref
---

Thuộc tính **`stdDeviation`** xác định độ lệch chuẩn cho thao tác làm mờ.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feDropShadow")}}
- {{SVGElement("feGaussianBlur")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 480 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="gaussianBlur1">
    <feGaussianBlur stdDeviation="1" />
  </filter>
  <filter id="gaussianBlur2">
    <feGaussianBlur stdDeviation="5" />
  </filter>
  <filter id="gaussianBlur3" x="-30%" y="-30%" width="160%" height="160%">
    <feGaussianBlur stdDeviation="10" />
  </filter>

  <circle cx="100" cy="100" r="50" filter="url(#gaussianBlur1)" />
  <circle cx="240" cy="100" r="50" filter="url(#gaussianBlur2)" />
  <circle cx="380" cy="100" r="50" filter="url(#gaussianBlur3)" />
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
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
            >&#x3C;number-optional-number></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number-optional-number>`
  - : Nếu cung cấp hai số, số thứ nhất biểu thị giá trị độ lệch chuẩn theo trục x. Giá trị thứ hai biểu thị độ lệch chuẩn theo trục y. Nếu chỉ cung cấp một số, thì giá trị đó được dùng cho cả X và Y.

    Giá trị âm bị cấm. Giá trị bằng 0 sẽ vô hiệu hóa hiệu ứng của bộ lọc nguyên thủy đã cho, tức là kết quả sẽ là ảnh đầu vào của bộ lọc. Nếu `stdDeviation` bằng 0 chỉ ở một trong hai trục X hoặc Y, thì hiệu ứng là độ mờ chỉ được áp dụng theo hướng có giá trị khác 0.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
