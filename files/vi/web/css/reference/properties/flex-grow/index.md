---
title: flex-grow
slug: Web/CSS/Reference/Properties/flex-grow
page-type: css-property
browser-compat: css.properties.flex-grow
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`flex-grow`** thiết lập hệ số co giãn tăng trưởng (flex grow factor), xác định bao nhiêu [**không gian trống dương**](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios) trong flex container (nếu có) sẽ được phân bổ cho [kích thước chính](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox#the_flex_model) của flex item.

Khi kích thước chính của flex container lớn hơn tổng kích thước chính của các flex item, không gian trống dương này có thể được phân phối cho các flex item, với mức tăng trưởng của mỗi item tỷ lệ với giá trị hệ số tăng trưởng của nó so với tổng tất cả hệ số tăng trưởng.

> [!NOTE]
> Nên sử dụng thuộc tính viết tắt {{cssxref("flex")}} với giá trị từ khóa như `auto` hoặc `initial` thay vì thiết lập `flex-grow` riêng lẻ. [Các giá trị từ khóa](/en-US/docs/Web/CSS/Reference/Properties/flex#values) mở rộng thành các tổ hợp đáng tin cậy của `flex-grow`, {{cssxref("flex-shrink")}} và {{cssxref("flex-basis")}}, giúp đạt được các hành vi flex thông dụng.

{{InteractiveExample("CSS Demo: flex-grow")}}

```css interactive-example-choice
flex-grow: 1;
```

```css interactive-example-choice
flex-grow: 2;
```

```css interactive-example-choice
flex-grow: 3;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">I grow</div>
  <div>Item Two</div>
  <div>Item Three</div>
</section>
```

```css interactive-example
.default-example {
  border: 1px solid #c5c5c5;
  width: auto;
  max-height: 300px;
  display: flex;
}

.default-example > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  margin: 10px;
  flex-grow: 1;
  flex-shrink: 1;
  flex-basis: 0;
}
```

## Cú pháp

```css
/* Giá trị <number> */
flex-grow: 3;
flex-grow: 0.6;

/* Giá trị toàn cục */
flex-grow: inherit;
flex-grow: initial;
flex-grow: revert;
flex-grow: revert-layer;
flex-grow: unset;
```

Thuộc tính `flex-grow` được xác định bằng một giá trị `<number>` duy nhất.

### Giá trị

- `<number>`
  - : Xem {{cssxref("&lt;number&gt;")}}. Giá trị âm không hợp lệ. Mặc định là 0, ngăn flex item tăng trưởng.

## Mô tả

Thuộc tính này xác định bao nhiêu không gian còn lại trong flex container sẽ được phân bổ cho item (hệ số tăng trưởng flex).

[Kích thước chính](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox#the_flex_model) là chiều rộng hoặc chiều cao của item, tùy thuộc vào giá trị {{cssxref("flex-direction")}}.

Không gian còn lại, hay không gian trống dương, là kích thước flex container trừ đi tổng kích thước của tất cả các flex item. Nếu tất cả các item anh em có cùng hệ số tăng trưởng, chúng sẽ nhận được cùng một phần không gian còn lại. Thông lệ phổ biến là đặt `flex-grow: 1`, nhưng đặt hệ số tăng trưởng cho tất cả flex item là `88`, `100`, `1.2`, hoặc bất kỳ giá trị nào lớn hơn `0` đều cho kết quả tương tự: giá trị là tỷ lệ.

Nếu các giá trị `flex-grow` khác nhau, không gian trống dương được phân phối theo tỷ lệ được xác định bởi các hệ số tăng trưởng khác nhau. Tất cả giá trị hệ số tăng trưởng của các flex item anh em được cộng lại. Không gian trống dương của flex container (nếu có) được chia cho tổng đó. Kích thước chính của mỗi flex item có giá trị `flex-grow` lớn hơn `0` sẽ tăng bằng thương số này nhân với hệ số tăng trưởng riêng của nó.

Ví dụ, nếu bốn flex item `100px` nằm trong container `700px` và các flex item có hệ số `flex-grow` lần lượt là `0`, `1`, `2`, `3`, tổng kích thước chính của bốn item là `400px`, nghĩa là có `300px` không gian trống dương để phân phối. Tổng bốn hệ số tăng trưởng (`0 + 1 + 2 + 3 = 6`) bằng sáu. Do đó, mỗi đơn vị hệ số tăng trưởng bằng `50px` (`300px / 6`). Mỗi flex item nhận được 50px không gian trống nhân với hệ số `flex-grow` của nó: `0`, `50px`, `100px` và `150px` tương ứng. Tổng kích thước flex item trở thành `100px`, `150px`, `200px` và `250px` tương ứng.

`flex-grow` thường được dùng cùng với các thuộc tính viết tắt {{cssxref("flex")}} khác là {{cssxref("flex-shrink")}} và {{cssxref("flex-basis")}}. Nên sử dụng thuộc tính viết tắt `flex` để đảm bảo tất cả giá trị được thiết lập.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập hệ số tăng trưởng cho flex item

Trong ví dụ này, tổng sáu hệ số flex-grow bằng tám, nghĩa là mỗi đơn vị hệ số tăng trưởng chiếm `12.5%` không gian còn lại.

#### HTML

```html
<h1>This is a <code>flex-grow</code> example</h1>
<p>
  A, B, C, and F have <code>flex-grow: 1</code> set. D and E have
  <code>flex-grow: 2</code> set.
</p>
<div id="content">
  <div class="box1">A</div>
  <div class="box2">B</div>
  <div class="box3">C</div>
  <div class="box4">D</div>
  <div class="box5">E</div>
  <div class="box6">F</div>
</div>
```

#### CSS

```css
#content {
  display: flex;
}

div > div {
  border: 3px solid rgb(0 0 0 / 20%);
}

.box1,
.box2,
.box3,
.box6 {
  flex-grow: 1;
}

.box4,
.box5 {
  flex-grow: 2;
  border: 3px solid rgb(0 0 0 / 20%);
}

.box1 {
  background-color: red;
}
.box2 {
  background-color: lightblue;
}
.box3 {
  background-color: yellow;
}
.box4 {
  background-color: brown;
}
.box5 {
  background-color: lightgreen;
}
.box6 {
  background-color: brown;
}
```

#### Kết quả

{{EmbedLiveSample('Setting flex item grow factor')}}

Khi sáu flex item được phân bổ dọc theo trục chính của container, nếu tổng nội dung chính của các flex item đó nhỏ hơn kích thước trục chính của container, không gian thừa được phân phối cho các flex item, với `A`, `B`, `C` và `F` mỗi item nhận `12.5%` không gian còn lại và `D` và `E` mỗi item nhận `25%` không gian thừa.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính viết tắt {{cssxref("flex")}}
- [Khái niệm cơ bản về Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Kiểm soát tỷ lệ flex item trên trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- [`flex-grow` is weird. Or is it?](https://css-tricks.com/flex-grow-is-weird/) via CSS-Tricks (2017)
