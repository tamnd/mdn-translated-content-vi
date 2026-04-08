---
title: box-pack
slug: Web/CSS/Reference/Properties/box-pack
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-pack
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính thuộc bản thảo đặc tả gốc của CSS Flexible Box Layout Module, và đã được thay thế bởi một tiêu chuẩn mới hơn. Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện hành.

Các thuộc tính [CSS](/en-US/docs/Web/CSS) **`-moz-box-pack`** và **`-webkit-box-pack`** chỉ định cách một `-moz-box` hoặc `-webkit-box` đóng gói nội dung của nó theo hướng bố trí. Tác dụng của thuộc tính này chỉ hiển thị khi có không gian thừa trong hộp.

Hướng bố trí phụ thuộc vào hướng của phần tử: ngang hay dọc.

## Cú pháp

```css
/* Keyword values */
box-pack: start;
box-pack: center;
box-pack: end;
box-pack: justify;

/* Global values */
box-pack: inherit;
box-pack: initial;
box-pack: unset;
```

Thuộc tính `box-pack` được chỉ định là một trong các giá trị từ khóa được liệt kê bên dưới.

### Giá trị

- `start`
  - : Hộp đóng gói nội dung ở đầu, để lại bất kỳ không gian thừa nào ở cuối.
- `center`
  - : Hộp đóng gói nội dung ở giữa, chia đều bất kỳ không gian thừa nào giữa đầu và cuối.
- `end`
  - : Hộp đóng gói nội dung ở cuối, để lại bất kỳ không gian thừa nào ở đầu.
- `justify`
  - : Không gian được chia đều giữa mỗi phần tử con, không có không gian thừa nào đặt trước phần tử con đầu tiên hoặc sau phần tử con cuối cùng. Nếu chỉ có một phần tử con, hãy xử lý giá trị như thể là `start`.

## Ghi chú

Cạnh của hộp được chỉ định là _start_ cho mục đích đóng gói phụ thuộc vào hướng và chiều của hộp:

- Đối với các phần tử ngang, _start_ là cạnh trên cùng.
- Đối với các phần tử dọc, _start_ là cạnh bên trái.

<table class="standard-table">
  <tbody>
    <tr>
      <th></th>
      <th><strong>Normal</strong></th>
      <th><strong>Reverse</strong></th>
    </tr>
    <tr>
      <th><strong>Horizontal</strong></th>
      <td>left</td>
      <td>right</td>
    </tr>
    <tr>
      <th><strong>Vertical</strong></th>
      <td>top</td>
      <td>bottom</td>
    </tr>
  </tbody>
</table>

Cạnh đối diện với đầu được gọi là _end_.

Nếu việc đóng gói được đặt bằng thuộc tính `pack` của phần tử, thì kiểu dáng sẽ bị bỏ qua.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-pack = start | center | end | justify`)}}

## Ví dụ

### Ví dụ về box-pack

```css
div.example {
  border-style: solid;

  display: -moz-box; /* Mozilla */
  display: -webkit-box; /* WebKit */

  /* Make this box taller than the children,
     so there is room for the box-pack */
  height: 300px;
  /* Make this box wide enough to show the contents
     are centered horizontally */
  width: 300px;

  /* Children should be oriented vertically */
  -moz-box-orient: vertical; /* Mozilla */
  -webkit-box-orient: vertical; /* WebKit */

  /* Align children to the horizontal center of this box */
  -moz-box-align: center; /* Mozilla */
  -webkit-box-align: center; /* WebKit */

  /* Pack children to the bottom of this box */
  -moz-box-pack: end; /* Mozilla */
  -webkit-box-pack: end; /* WebKit */
}

div.example p {
  /* Make children narrower than their parent,
     so there is room for the box-align */
  width: 200px;
}
```

```html
<div class="example">
  <p>I will be second from the bottom of div.example, centered horizontally.</p>
  <p>I will be on the bottom of div.example, centered horizontally.</p>
</div>
```

{{EmbedLiveSample('Examples', 310, 310)}}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("box-orient")}}
- {{CSSxRef("box-direction")}}
- {{CSSxRef("box-align")}}
