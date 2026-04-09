---
title: keyTimes
slug: Web/SVG/Reference/Attribute/keyTimes
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#KeyTimesAttribute
sidebar: svgref
---

Thuộc tính **`keyTimes`** biểu thị một danh sách các giá trị thời gian được dùng để điều khiển nhịp độ của hoạt ảnh.

Mỗi thời điểm trong danh sách tương ứng với một giá trị trong danh sách thuộc tính {{SVGAttr("values")}}, và xác định thời điểm giá trị đó được dùng trong hoạt ảnh. Mỗi giá trị thời gian trong danh sách `keyTimes` được chỉ định dưới dạng một giá trị số thực từ 0 đến 1, bao gồm cả hai đầu, biểu thị một độ lệch theo tỷ lệ trong thời lượng của phần tử hoạt ảnh.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
  <circle cx="60" cy="10" r="10">
    <animate
      attributeName="cx"
      dur="4s"
      repeatCount="indefinite"
      values="60; 110; 60; 10; 60"
      keyTimes="0; 0.25; 0.5; 0.75; 1" />
    <animate
      attributeName="cy"
      dur="4s"
      repeatCount="indefinite"
      values="10; 60; 110; 60; 10"
      keyTimes="0; 0.25; 0.5; 0.75; 1" />
  </circle>
</svg>
```

{{EmbedLiveSample("Example", "200", "200")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        {{cssxref("number")}} [
        <code>;</code> {{cssxref("number")}} ]* <code>;</code>?
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

Giá trị của thuộc tính `keyTimes` là một danh sách các giá trị được ngăn cách bằng dấu chấm phẩy.

Phải có đúng số lượng giá trị trong danh sách `keyTimes` bằng số lượng giá trị trong danh sách `values`.

Mỗi giá trị thời gian tiếp theo phải lớn hơn hoặc bằng giá trị thời gian đứng trước nó.

Ý nghĩa của danh sách `keyTimes` phụ thuộc vào {{Glossary("interpolation")}} mode:

- Với hoạt ảnh tuyến tính và spline, giá trị thời gian đầu tiên trong danh sách phải là 0, và giá trị cuối cùng trong danh sách phải là `1`. Thời điểm khóa gắn với mỗi giá trị xác định khi nào giá trị đó được đặt; các giá trị được nội suy giữa các thời điểm khóa.
- Với hoạt ảnh rời rạc, giá trị thời gian đầu tiên trong danh sách phải là `0`. Thời điểm gắn với mỗi giá trị xác định khi nào giá trị đó được đặt; hàm hoạt ảnh dùng giá trị đó cho đến thời điểm tiếp theo được định nghĩa trong danh sách.

Nếu thuộc tính {{SVGAttr("calcMode")}} được đặt thành `paced`, thuộc tính `keyTimes` sẽ bị bỏ qua.

Nếu thời lượng của hoạt ảnh là vô hạn, mọi đặc tả `keyTimes` sẽ bị bỏ qua.

- Vấn đề với Safari: các giá trị `keyTimes` nên được phân tách bằng dấu chấm phẩy mà không có khoảng trắng phía trước, ví dụ: `keyTimes="0; 0.25; 0.5; 0.75; 1"`

## Thông số kỹ thuật

{{Specifications}}
