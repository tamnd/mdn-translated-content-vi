---
title: top
slug: Web/CSS/Reference/Properties/top
page-type: css-property
browser-compat: css.properties.top
sidebar: cssref
---

Thuộc tính **`top`** của [CSS](/vi/docs/Web/CSS) đặt vị trí theo chiều dọc của một [phần tử được định vị](/vi/docs/Web/CSS/Reference/Properties/position). {{glossary("inset properties", "Thuộc tính inset")}} này không có hiệu lực trên các phần tử không được định vị.

{{InteractiveExample("CSS Demo: top")}}

```css interactive-example-choice
top: 0;
```

```css interactive-example-choice
top: 4em;
```

```css interactive-example-choice
top: 10%;
```

```css interactive-example-choice
top: 20px;
```

```html interactive-example
<section id="default-example">
  <div class="example-container">
    <div id="example-element">I am absolutely positioned.</div>
    <p>
      As much mud in the streets as if the waters had but newly retired from the
      face of the earth, and it would not be wonderful to meet a Megalosaurus,
      forty feet long or so, waddling like an elephantine lizard up Holborn
      Hill.
    </p>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 0.75em solid;
  padding: 0.75em;
  text-align: left;
  position: relative;
  width: 100%;
  min-height: 200px;
}

#example-element {
  background-color: #264653;
  border: 4px solid #ffb500;
  color: white;
  position: absolute;
  width: 140px;
  height: 60px;
}
```

Hiệu lực của `top` phụ thuộc vào cách phần tử được định vị (tức là, giá trị của thuộc tính {{cssxref("position")}}):

- Khi `position` được đặt thành `absolute` hoặc `fixed`, thuộc tính `top` xác định khoảng cách giữa margin ngoài của cạnh trên phần tử và border trong của cạnh trên khối chứa của nó, hoặc, trong trường hợp [phần tử được định vị theo anchor](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using) khi hàm {{cssxref("anchor()")}} được dùng trong giá trị, tương đối so với cạnh [`<anchor-side>`](/en-US/docs/Web/CSS/Reference/Values/anchor#anchor-side) được chỉ định. Thuộc tính `top` [tương thích](/en-US/docs/Web/CSS/Reference/Values/anchor#compatibility_of_inset_properties_and_anchor-side_values) với các giá trị `top`, `bottom`, `start`, `end`, `self-start`, `self-end`, `center` và `<percentage>`.
- Khi `position` được đặt thành `relative`, thuộc tính `top` xác định khoảng cách cạnh trên của phần tử được dịch chuyển xuống so với vị trí bình thường của nó.
- Khi `position` được đặt thành `sticky`, thuộc tính `top` được dùng để tính toán hình chữ nhật ràng buộc sticky.
- Khi `position` được đặt thành `static`, thuộc tính `top` _không có hiệu lực_.

Khi cả hai giá trị `top` và {{cssxref("bottom")}} được chỉ định, có ba trường hợp khác nhau:

- Nếu `position` được đặt thành `absolute` hoặc `fixed` và {{cssxref("height")}} không được xác định (là `auto` hoặc `100%`), cả hai giá trị `top` và `bottom` đều được áp dụng.
- Nếu `position` được đặt thành `relative` hoặc `height` bị giới hạn, thuộc tính `top` được ưu tiên và thuộc tính `bottom` bị bỏ qua.
- Nếu `position` được đặt thành `sticky`, cả hai giá trị `top` và `bottom` đều được xem xét. Điều này có nghĩa là một phần tử sticky có thể di chuyển lên và xuống trong khối chứa của nó dựa trên các giá trị của hai thuộc tính này miễn là hộp vị trí của phần tử vẫn nằm trong khối chứa của nó.

## Cú pháp

```css
/* Giá trị <length> */
top: 3px;
top: 2.4em;
top: anchor(bottom);
top: anchor-size(--my-anchor self-block, 10%);

/* <percentage> của chiều cao khối chứa */
top: 10%;

/* Giá trị từ khóa */
top: auto;

/* Giá trị toàn cục */
top: inherit;
top: initial;
top: revert;
top: revert-layer;
top: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Một {{cssxref("&lt;length&gt;")}} âm, không hoặc dương:
    - đối với _phần tử được định vị tuyệt đối_, nó biểu thị khoảng cách đến cạnh trên của khối chứa.
    - đối với _phần tử được định vị theo anchor_, hàm {{cssxref("anchor()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với vị trí của cạnh trên hoặc cạnh dưới của _phần tử anchor_ liên kết (xem [Sử dụng thuộc tính inset với giá trị hàm `anchor()`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#using_inset_properties_with_anchor_function_values)), và hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với chiều rộng hoặc chiều cao của phần tử anchor liên kết (xem [Đặt vị trí phần tử dựa trên kích thước anchor](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_position_based_on_anchor_size)).
    - đối với _phần tử được định vị tương đối_, nó biểu thị khoảng cách phần tử được dịch chuyển xuống so với vị trí bình thường của nó.

- {{cssxref("&lt;percentage&gt;")}}
  - : Một {{cssxref("&lt;percentage&gt;")}} của chiều cao khối chứa.
- `auto`
  - : Xác định rằng:
    - đối với _phần tử được định vị tuyệt đối_, vị trí của phần tử dựa trên thuộc tính {{Cssxref("bottom")}}, trong khi `height: auto` được xử lý như chiều cao dựa trên nội dung; hoặc nếu `bottom` cũng là `auto`, phần tử được định vị theo chiều dọc như khi nó là phần tử tĩnh.
    - đối với _phần tử được định vị tương đối_, khoảng cách của phần tử từ vị trí bình thường của nó dựa trên thuộc tính {{Cssxref("bottom")}}; hoặc nếu `bottom` cũng là `auto`, phần tử không bị dịch chuyển theo chiều dọc.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Phần tử được định vị cách 10% từ trên

```css
body {
  background: beige;
}

div {
  position: absolute;
  top: 10%;
  right: 40%;
  bottom: 20%;
  left: 15%;
  background: gold;
  border: 1px solid blue;
}
```

```html
<div>The size of this content is determined by the position of its edges.</div>
```

{{EmbedLiveSample('Examples','100%','200')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("bottom")}}, {{cssxref("left")}} và {{cssxref("right")}}
- Viết tắt {{cssxref("inset")}}
- {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}} và {{cssxref("inset-inline-end")}}
- Viết tắt {{cssxref("inset-block")}} và {{cssxref("inset-inline")}}
- {{cssxref("position")}}
- Mô-đun [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
