---
title: transform-origin
slug: Web/SVG/Reference/Attribute/transform-origin
page-type: svg-attribute
browser-compat: svg.global_attributes.transform-origin
sidebar: svgref
---

Thuộc tính SVG **`transform-origin`** đặt gốc cho các phép biến đổi của một phần tử.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

> [!NOTE]
> Là một thuộc tính trình bày, `transform-origin` cũng có một thuộc tính CSS tương ứng: {{cssxref("transform-origin")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <td><strong>Giá trị</strong></td>
      <td>Xem {{cssxref("transform-origin", "", "#formal_syntax")}}</td>
    </tr>
    <tr>
      <td><strong>Giá trị mặc định</strong></td>
      <td><code>0 0</code></td>
    </tr>
    <tr>
      <td><strong>Có thể hoạt ảnh</strong></td>
      <td>Có</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Giá trị mặc định của `transform-origin` là `0 0` cho tất cả phần tử SVG ngoại trừ các phần tử `<svg>` gốc và các phần tử `<svg>` là phần tử con trực tiếp của [`foreignObject`](/en-US/docs/Web/SVG/Reference/Element/foreignObject). Những phần tử này có `transform-origin: 50% 50%`, như trong CSS thông thường.

Các độ dài, phần trăm và từ khóa (`left`, `center`, `right`, `top` và `bottom`) đều tương đối với [reference box](/en-US/docs/Web/CSS/Reference/Properties/transform-box). Vì giá trị mặc định của `transform-box` là `view-box`, các tọa độ gốc biến đổi sẽ tương đối với `viewBox` của phần tử SVG, trừ khi chính phần tử đó có một CSS layout box liên kết.

## Ví dụ

Các ví dụ sau minh họa việc xoay một hộp chữ nhật 30° quanh một số `transform-origin` khác nhau.
SVG trong mỗi trường hợp được khai báo với hộp gốc vẽ bằng viền đỏ nét đứt, tiếp theo là hộp đã xoay vẽ bằng màu xanh lá sáng, rồi `transform-origin` được vẽ như một dấu thập đỏ.

### transform-origin mặc định

Theo mặc định, `transform-origin` có giá trị `0 0`, đặt nó tại gốc của `viewBox`. Bên dưới, chúng ta mở rộng `viewBox` sang các giá trị âm, để bạn có thể thấy toàn bộ dấu thập, và cũng lưu ý rằng nó không phải lúc nào cũng là góc trên bên trái của phần tử `<svg>`.

```html
<svg
  viewBox="-10 -10 300 300"
  xmlns="http://www.w3.org/2000/svg"
  width="310"
  height="310">
  <rect
    x="60"
    y="10"
    width="180"
    height="180"
    fill="none"
    stroke="red"
    stroke-width="3"
    stroke-dasharray="3 3" />
  <rect
    x="60"
    y="10"
    width="180"
    height="180"
    fill="lime"
    opacity="0.5"
    transform="rotate(30)" />
  <g transform="translate(0 0)">
    <circle cx="0" cy="0" r="3" fill="red" opacity="0.5" />
    <path d="M -8 0 h 16 m -8 -8 v 16" fill="none" stroke="red" />
    <circle cx="0" cy="0" r="6" fill="none" stroke="red" />
  </g>
</svg>
```

{{ EmbedLiveSample('default_transform-origin', 400, 310) }}

### transform-origin ở tâm

Bên dưới, chúng ta đặt `transform-origin` thành `center`, điều này đặt gốc tại tâm của `viewBox`, nhưng không phải tâm của phần tử đang được biến đổi.

```html
<svg
  viewBox="-10 -10 300 300"
  xmlns="http://www.w3.org/2000/svg"
  width="310"
  height="310">
  <rect
    x="60"
    y="10"
    width="180"
    height="180"
    fill="none"
    stroke="red"
    stroke-width="3"
    stroke-dasharray="3 3" />
  <rect
    x="60"
    y="10"
    width="180"
    height="180"
    fill="lime"
    opacity="0.5"
    transform="rotate(30)"
    transform-origin="center" />
  <g transform="translate(150 150)">
    <circle cx="0" cy="0" r="3" fill="red" opacity="0.5" />
    <path d="M -8 0 h 16 m -8 -8 v 16" fill="none" stroke="red" />
    <circle cx="0" cy="0" r="6" fill="none" stroke="red" />
  </g>
</svg>
```

{{ EmbedLiveSample('center_transform-origin', 400, 310) }}

### transform-origin tương đối với phần tử được biến đổi

Để làm cho `transform-origin` tương đối với phần tử được biến đổi, bạn có thể dùng thuộc tính `transform-box`. Bên dưới, chúng ta đặt `transform-box` thành `fill-box`, điều này làm cho `transform-origin` tương đối với hộp bao quanh của phần tử đang được biến đổi.

```html
<svg
  viewBox="-10 -10 300 300"
  xmlns="http://www.w3.org/2000/svg"
  width="310"
  height="310">
  <rect
    x="60"
    y="10"
    width="180"
    height="180"
    fill="none"
    stroke="red"
    stroke-width="3"
    stroke-dasharray="3 3" />
  <rect
    class="transformed-elem"
    x="60"
    y="10"
    width="180"
    height="180"
    fill="lime"
    opacity="0.5"
    transform="rotate(30)"
    transform-origin="center" />
  <g transform="translate(150 100)">
    <circle cx="0" cy="0" r="3" fill="red" opacity="0.5" />
    <path d="M -8 0 h 16 m -8 -8 v 16" fill="none" stroke="red" />
    <circle cx="0" cy="0" r="6" fill="none" stroke="red" />
  </g>
</svg>
```

```css
.transformed-elem {
  transform-box: fill-box;
}
```

{{ EmbedLiveSample('transform-origin relative to the transformed element', 400, 310) }}

Xem CSS {{cssxref("transform-origin")}} để biết thêm ví dụ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("transform-origin")}}
