---
title: flex-shrink
slug: Web/CSS/Reference/Properties/flex-shrink
page-type: css-property
browser-compat: css.properties.flex-shrink
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`flex-shrink`** thiết lập hệ số co rút flex (flex shrink factor) của một flex item. Nếu tổng kích thước của tất cả flex item lớn hơn flex container, các [flex item có thể co lại](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios#the_flex-shrink_property) theo giá trị `flex-shrink` của chúng. [Không gian trống âm](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios#positive_and_negative_free_space) của mỗi dòng flex được phân phối cho các flex item trong dòng có giá trị `flex-shrink` lớn hơn `0`.

> [!NOTE]
> Nên sử dụng thuộc tính viết tắt {{cssxref("flex")}} với giá trị từ khóa như `auto` hoặc `initial` thay vì thiết lập `flex-shrink` riêng lẻ. [Các giá trị từ khóa](/en-US/docs/Web/CSS/Reference/Properties/flex#values) mở rộng thành các tổ hợp đáng tin cậy của {{cssxref("flex-grow")}}, `flex-shrink` và {{cssxref("flex-basis")}}, giúp đạt được các hành vi flex thông dụng.

{{InteractiveExample("CSS Demo: flex-shrink")}}

```css interactive-example-choice
flex-shrink: 0;
```

```css interactive-example-choice
flex-shrink: 1;
```

```css interactive-example-choice
flex-shrink: 2;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">I shrink</div>
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
  flex-basis: 300px;
}
```

## Cú pháp

```css
/* Giá trị <number> */
flex-shrink: 2;
flex-shrink: 0.6;

/* Giá trị toàn cục */
flex-shrink: inherit;
flex-shrink: initial;
flex-shrink: revert;
flex-shrink: revert-layer;
flex-shrink: unset;
```

## Mô tả

Thuộc tính `flex-shrink` xác định hệ số co rút flex, quyết định mức độ co lại của flex item so với phần còn lại của các flex item trong flex container khi không gian trống âm được phân phối.

Thuộc tính này xử lý các tình huống khi trình duyệt tính toán các giá trị flex-basis của flex item và nhận thấy chúng quá lớn để vừa vào flex container. Miễn là flex-shrink có giá trị dương, các item sẽ co lại để không tràn ra ngoài container.

Thuộc tính `flex-grow` xử lý việc phân phối không gian trống dương tỷ lệ với hệ số tăng trưởng của mỗi item. Thuộc tính `flex-shrink` quản lý việc loại bỏ không gian trống âm để các hộp vừa vào container mà không tràn ra ngoài. Việc loại bỏ không gian phức tạp hơn một chút so với thêm không gian. Hệ số co rút flex được nhân với kích thước cơ sở flex; điều này phân phối không gian âm theo tỷ lệ với khả năng co lại của item. Điều này ngăn các item nhỏ hơn co xuống `0px` trước khi item lớn hơn bị thu nhỏ đáng kể.

Thông thường, `flex-shrink` được dùng cùng với các thuộc tính {{cssxref("flex-grow")}} và {{cssxref("flex-basis")}}. Trong thuộc tính viết tắt `flex`, hệ số co rút luôn là `<number>` thứ hai. Nếu thuộc tính viết tắt chỉ bao gồm một giá trị số, giá trị đó được coi là giá trị `flex-grow`.

## Giá trị

Thuộc tính `flex-shrink` được xác định bằng một giá trị `<number>` duy nhất.

- `<number>`
  - : Xem {{cssxref("&lt;number&gt;")}}. Giá trị âm không hợp lệ. Mặc định là 1.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập hệ số co rút cho flex item

Ví dụ này minh họa cách không gian trống âm được phân phối dựa trên hệ số co rút của item. Nó bao gồm năm flex item với giá trị `flex-shrink` lớn hơn 0, có tổng chiều rộng lớn hơn chiều rộng flex container cha.

#### HTML

```html
<div id="content">
  <div class="box1">A</div>
  <div class="box2">B</div>
  <div class="box3">C</div>
  <div class="box4">D</div>
  <div class="box5">E</div>
</div>
```

#### CSS

Chúng ta cung cấp cho mỗi flex item {{cssxref("width")}} là `200px`. Vì thuộc tính {{cssxref("flex-basis")}} mặc định là `auto`, flex-basis của mỗi item là `200px`. Điều này cho flex item tổng chiều rộng `1000px`, gấp đôi kích thước của container. Chúng ta đặt tất cả flex item có thể co rút, với giá trị `flex-shrink` lớn hơn `0`. Hai item cuối có giá trị `flex-shrink` lớn hơn nên sẽ co lại nhiều hơn.

```css
#content {
  display: flex;
  width: 500px;
}

#content div {
  width: 200px;
}

.box1,
.box2,
.box3 {
  flex-shrink: 1;
}

.box4 {
  flex-shrink: 1.5;
}

.box5 {
  flex-shrink: 2;
}
```

```css hidden
#content {
  margin: 5px;
}
div {
  font-family: monospace;
  outline: 1px solid;
  line-height: 4em;
  text-align: center;
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
  background-color: lightsalmon;
}
.box5 {
  background-color: lightgreen;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_flex_item_shrink_factor', 500, 100)}}

Các flex item không tràn ra ngoài container vì chúng có thể co lại: `500px` không gian trống âm được phân phối cho năm item dựa trên giá trị `flex-shrink` của chúng. Ba item đầu có `flex-shrink: 1`. D có `flex-shrink: 1.5` và E có `flex-shrink: 2`. Chiều rộng cuối cùng của D và E nhỏ hơn các item khác, với E nhỏ hơn D.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Kiểm soát tỷ lệ flex item trên trục chính](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Controlling_flex_item_ratios)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
