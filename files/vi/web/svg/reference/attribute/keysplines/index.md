---
title: keySplines
slug: Web/SVG/Reference/Attribute/keySplines
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#KeySplinesAttribute
sidebar: svgref
---

Thuộc tính **`keySplines`** xác định một tập hợp các điểm điều khiển của [đường cong Bézier](/en-US/docs/Glossary/Bezier_curve) được liên kết với danh sách {{SVGAttr("keyTimes")}}, qua đó xác định một hàm Bézier bậc ba điều khiển nhịp độ giữa các khoảng.

Thuộc tính này sẽ bị bỏ qua trừ khi thuộc tính {{SVGAttr("calcMode")}} được đặt thành `spline`.

Nếu có bất kỳ lỗi nào trong đặc tả keySplines (giá trị không hợp lệ, quá nhiều hoặc quá ít giá trị), hoạt ảnh sẽ không xảy ra.

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
      calcMode="spline"
      repeatCount="indefinite"
      values="60; 110; 60; 10; 60"
      keyTimes="0; 0.25; 0.5; 0.75; 1"
      keySplines="0.5 0 0.5 1; 0.5 0 0.5 1; 0.5 0 0.5 1; 0.5 0 0.5 1" />
    <animate
      attributeName="cy"
      dur="4s"
      calcMode="spline"
      repeatCount="indefinite"
      values="10; 60; 110; 60; 10"
      keyTimes="0; 0.25; 0.5; 0.75; 1"
      keySplines="0.5 0 0.5 1; 0.5 0 0.5 1; 0.5 0 0.5 1; 0.5 0 0.5 1" />
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
        <code>&#x3C;control-point></code> [ <code>;</code>
        <code>&#x3C;control-point></code> ]* <code>;</code>?
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

Giá trị thuộc tính là một danh sách các mô tả điểm điều khiển, ngăn cách bằng dấu chấm phẩy.

- `<control-point>`
  - : Mỗi mô tả điểm điều khiển là một tập hợp bốn giá trị: `x1 y1 x2 y2`, mô tả các điểm điều khiển Bézier cho một đoạn thời gian. Các giá trị {{SVGAttr("keyTimes")}} xác định đoạn tương ứng là các "điểm neo" của Bézier, còn các giá trị `keySplines` là các điểm điều khiển. Vì vậy, số tập điểm điều khiển phải ít hơn đúng một so với số giá trị {{SVGAttr("keyTimes")}}.

    Các giá trị `x1 y1 x2 y2` phải đều nằm trong khoảng từ 0 đến 1.

- Vấn đề với Safari
  - : Các giá trị `keyTimes` nên được phân tách bằng dấu chấm phẩy mà không có khoảng trắng phía trước, ví dụ: `keyTimes="0; 0.25; 0.5; 0.75; 1"`

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Đường cong Bézier](/en-US/docs/Glossary/Bezier_curve)
