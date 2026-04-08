---
title: flex-direction
slug: Web/CSS/Reference/Properties/flex-direction
page-type: css-property
browser-compat: css.properties.flex-direction
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`flex-direction`** xác định cách các flex item được sắp xếp bên trong flex container, định nghĩa trục chính và hướng sắp xếp (thuận chiều hoặc ngược chiều).

{{InteractiveExample("CSS Demo: flex-direction")}}

```css interactive-example-choice
flex-direction: row;
```

```css interactive-example-choice
flex-direction: row-reverse;
```

```css interactive-example-choice
flex-direction: column;
```

```css interactive-example-choice
flex-direction: column-reverse;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    <div>Item One</div>
    <div>Item Two</div>
    <div>Item Three</div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  width: 80%;
  display: flex;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  width: 60px;
  margin: 10px;
}
```

Lưu ý rằng các giá trị `row` và `row-reverse` bị ảnh hưởng bởi hướng chữ viết của flex container. Nếu thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) của container là `ltr`, `row` đại diện cho trục nằm ngang từ trái sang phải, và `row-reverse` từ phải sang trái; nếu thuộc tính `dir` là `rtl`, `row` đại diện cho trục từ phải sang trái, và `row-reverse` từ trái sang phải.

## Cú pháp

```css
/* Hướng bố trí văn bản theo dòng */
flex-direction: row;

/* Giống <row>, nhưng ngược chiều */
flex-direction: row-reverse;

/* Hướng xếp chồng các dòng văn bản */
flex-direction: column;

/* Giống <column>, nhưng ngược chiều */
flex-direction: column-reverse;

/* Giá trị toàn cục */
flex-direction: inherit;
flex-direction: initial;
flex-direction: revert;
flex-direction: revert-layer;
flex-direction: unset;
```

### Giá trị

Các giá trị được chấp nhận gồm:

- `row`
  - : Trục chính của flex container được xác định giống với hướng văn bản. Điểm **main-start** và **main-end** trùng với hướng nội dung.
- `row-reverse`
  - : Hoạt động giống `row` nhưng điểm **main-start** và **main-end** ngược lại so với hướng nội dung.
- `column`
  - : Trục chính của flex container là trục khối. Điểm **main-start** và **main-end** tương ứng với các điểm **before** và **after** của chế độ viết (writing-mode).
- `column-reverse`
  - : Hoạt động giống `column` nhưng điểm **main-start** và **main-end** ngược lại so với hướng nội dung.

## Khả năng tiếp cận

Sử dụng thuộc tính `flex-direction` với giá trị `row-reverse` hoặc `column-reverse` sẽ tạo ra sự không khớp giữa trình bày trực quan của nội dung và thứ tự trong DOM. Điều này ảnh hưởng tiêu cực đến người dùng có thị lực kém khi điều hướng với sự trợ giúp của công nghệ hỗ trợ như trình đọc màn hình. Nếu thứ tự trực quan (CSS) quan trọng, thì người dùng trình đọc màn hình sẽ không có quyền truy cập vào thứ tự đọc chính xác.

- [Flexbox & the keyboard navigation disconnect — Tink](https://tink.uk/flexbox-the-keyboard-navigation-disconnect/)
- [Source Order Matters | Adrian Roselli](https://adrianroselli.com/2015/09/source-order-matters.html)
- [MDN Understanding WCAG, Guideline 1.3 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.3_%e2%80%94_create_content_that_can_be_presented_in_different_ways)
- [Understanding Success Criterion 1.3.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/content-structure-separation-sequence.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đảo ngược cột và hàng flex container

#### HTML

```html
<h4>This is a Column-Reverse</h4>
<div id="col-rev" class="content">
  <div class="box red">A</div>
  <div class="box lightblue">B</div>
  <div class="box yellow">C</div>
</div>
<h4>This is a Row-Reverse</h4>
<div id="row-rev" class="content">
  <div class="box red">A</div>
  <div class="box lightblue">B</div>
  <div class="box yellow">C</div>
</div>
```

#### CSS

```css
.content {
  width: 200px;
  height: 200px;
  border: 1px solid #c3c3c3;
  display: flex;
}

.box {
  width: 50px;
  height: 50px;
}

#col-rev {
  flex-direction: column-reverse;
}

#row-rev {
  flex-direction: row-reverse;
}

.red {
  background-color: red;
}

.lightblue {
  background-color: lightblue;
}

.yellow {
  background-color: yellow;
}
```

#### Kết quả

{{EmbedLiveSample('Reversing_flex_container_columns_and_rows', '', '550')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính viết tắt CSS {{CSSXRef("flex-flow")}} cho các thuộc tính `flex-direction` và {{CSSXRef("flex-wrap")}}.
- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Sắp xếp thứ tự các flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)
