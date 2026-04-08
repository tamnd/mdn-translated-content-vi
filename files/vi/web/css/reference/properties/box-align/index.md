---
title: box-align
slug: Web/CSS/Reference/Properties/box-align
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-align
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính của bản thảo Module bố cục hộp linh hoạt CSS ban đầu, và đã được thay thế bởi một tiêu chuẩn mới hơn.

Thuộc tính **`box-align`** [CSS](/en-US/docs/Web/CSS) chỉ định cách một phần tử căn chỉnh nội dung của nó theo hướng vuông góc trong bố cục. Hiệu ứng của thuộc tính chỉ có thể nhìn thấy nếu có không gian thừa trong hộp.

Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện tại.

Hướng bố cục phụ thuộc vào hướng của phần tử: ngang hoặc dọc.

## Cú pháp

```css
/* Giá trị từ khóa */
box-align: start;
box-align: center;
box-align: end;
box-align: baseline;
box-align: stretch;

/* Giá trị toàn cục */
box-lines: inherit;
box-lines: initial;
box-lines: unset;
```

Thuộc tính `box-align` được chỉ định bằng một trong các giá trị từ khóa liệt kê dưới đây.

### Giá trị

- `start`
  - : Hộp căn chỉnh nội dung ở đầu, để không gian thừa ở cuối.
- `center`
  - : Hộp căn chỉnh nội dung ở giữa, chia đều không gian thừa giữa đầu và cuối.
- `end`
  - : Hộp căn chỉnh nội dung ở cuối, để không gian thừa ở đầu.
- `baseline`
  - : Hộp căn chỉnh đường cơ sở của các nội dung (căn chỉnh văn bản). Điều này chỉ áp dụng nếu hướng của hộp là ngang.
- `stretch`
  - : Hộp kéo dài nội dung để không có không gian thừa trong hộp.

## Ghi chú

Cạnh của hộp được chỉ định là _start_ cho mục đích căn chỉnh phụ thuộc vào hướng của hộp:

- Đối với phần tử ngang, _start_ là cạnh trên.
- Đối với phần tử dọc, _start_ là cạnh trái.

Cạnh đối diện với start được gọi là _end_.

Nếu căn chỉnh được đặt bằng thuộc tính `align` của phần tử, thì style sẽ bị bỏ qua.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-align = start | center | end | baseline | stretch`)}}

## Ví dụ

### Đặt căn chỉnh hộp

```html
<div class="example">
  <p>I will be second from the bottom of div.example, centered horizontally.</p>
  <p>I will be on the bottom of div.example, centered horizontally.</p>
</div>
```

```css
div.example {
  display: box; /* As specified */
  display: -moz-box; /* Mozilla */
  display: -webkit-box; /* WebKit */

  /* Make this box taller than the children,
     so there is room for the box-pack */
  height: 400px;

  /* Make this box wider than the children
     so there is room for the box-align */
  width: 300px;

  /* Children should be oriented vertically */
  box-orient: vertical; /* As specified */
  -moz-box-orient: vertical; /* Mozilla */
  -webkit-box-orient: vertical; /* WebKit */

  /* Align children to the horizontal center of this box */
  box-align: center; /* As specified */
  -moz-box-align: center; /* Mozilla */
  -webkit-box-align: center; /* WebKit */

  /* Pack children to the bottom of this box */
  box-pack: end; /* As specified */
  -moz-box-pack: end; /* Mozilla */
  -webkit-box-pack: end; /* WebKit */
}

div.example > p {
  /* Make children narrower than their parent,
     so there is room for the box-align */
  width: 200px;
}
```

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("align-items")}}, {{cssxref("box-orient")}}, {{cssxref("box-direction")}}, {{cssxref("box-pack")}}
