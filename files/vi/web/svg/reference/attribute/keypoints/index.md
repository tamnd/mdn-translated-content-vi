---
title: keyPoints
slug: Web/SVG/Reference/Attribute/keyPoints
page-type: svg-attribute
browser-compat: svg.elements.animateMotion.keyPoints
sidebar: svgref
---

Thuộc tính **`keyPoints`** cho biết thời lượng đơn của một hoạt ảnh.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <path
    d="M10,110 A120,120 -45 0,1 110 10 A120,120 -45 0,1 10,110"
    stroke="lightgrey"
    stroke-width="2"
    fill="none"
    id="motionPath" />
  <circle cx="10" cy="110" r="3" fill="lightgrey" />
  <circle cx="110" cy="10" r="3" fill="lightgrey" />

  <circle r="5" fill="red">
    <animateMotion
      dur="3s"
      repeatCount="indefinite"
      keyPoints="0;0.5;1"
      keyTimes="0;0.15;1"
      calcMode="linear">
      <mpath href="#motionPath" />
    </animateMotion>
  </circle>
</svg>
```

{{EmbedLiveSample("Example", "200", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>{{cssxref("number")}} [; {{cssxref("number")}} ]* ;?</td>
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

- `<number> [; <number>] ;?`
  - : Giá trị này định nghĩa một danh sách các giá trị số thực, ngăn cách bằng dấu chấm phẩy, nằm giữa 0 và 1, và cho biết đối tượng sẽ di chuyển bao xa dọc theo đường dẫn chuyển động tại thời điểm được chỉ định bởi giá trị {{SVGAttr("keyTimes")}} tương ứng. Khoảng cách được tính dọc theo đường dẫn do thuộc tính {{SVGAttr("path")}} xác định. Mỗi giá trị tiến trình trong danh sách tương ứng với một giá trị trong danh sách thuộc tính `keyTimes`.

    Nếu chỉ định danh sách các điểm khóa, số lượng giá trị trong danh sách `keyPoints` phải đúng bằng số lượng giá trị trong danh sách `keyTimes`.

    Nếu có dấu chấm phẩy ở cuối giá trị, tùy chọn theo sau là khoảng trắng, thì cả dấu chấm phẩy lẫn khoảng trắng ở cuối đều bị bỏ qua.

    Nếu có lỗi nào trong đặc tả giá trị, tức là giá trị không hợp lệ, quá nhiều hoặc quá ít giá trị, thì đó là lỗi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
