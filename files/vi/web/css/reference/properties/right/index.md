---
title: right
slug: Web/CSS/Reference/Properties/right
page-type: css-property
browser-compat: css.properties.right
sidebar: cssref
---

Thuộc tính **`right`** của [CSS](/vi/docs/Web/CSS) tham gia vào việc xác định vị trí ngang của một [phần tử được định vị](/en-US/docs/Web/CSS/Reference/Properties/position). {{glossary("inset properties", "Thuộc tính inset")}} này không có tác dụng với các phần tử không được định vị.

{{InteractiveExample("CSS Demo: right")}}

```css interactive-example-choice
right: 0;
```

```css interactive-example-choice
right: 4em;
```

```css interactive-example-choice
right: 10%;
```

```css interactive-example-choice
right: 20px;
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

## Cú pháp

```css
/* Giá trị <length> */
right: 3px;
right: 2.4em;
right: anchor(--my-anchor 50%);
right: anchor-size(--my-anchor height, 65px);

/* <percentage> theo chiều rộng của khối chứa */
right: 10%;

/* Giá trị từ khóa */
right: auto;

/* Giá trị toàn cục */
right: inherit;
right: initial;
right: revert;
right: revert-layer;
right: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Một {{cssxref("&lt;length&gt;")}} âm, không hoặc dương:
    - với _phần tử định vị tuyệt đối_, đại diện cho khoảng cách đến cạnh phải của khối chứa.
    - với _phần tử định vị neo (anchor-positioned)_, hàm {{cssxref("anchor()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với vị trí cạnh trái hoặc phải của _phần tử neo_ liên kết (xem [Using inset properties with `anchor()` function values](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#using_inset_properties_with_anchor_function_values)), và hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối so với chiều rộng hoặc chiều cao của phần tử neo liên kết (xem [Setting element position based on anchor size](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_position_based_on_anchor_size)).
    - với _phần tử định vị tương đối_, đại diện cho khoảng cách phần tử dịch chuyển sang trái so với vị trí bình thường của nó.

- {{cssxref("&lt;percentage&gt;")}}
  - : Một {{cssxref("&lt;percentage&gt;")}} theo chiều rộng của khối chứa.
- `auto`
  - : Chỉ định rằng:
    - với _phần tử định vị tuyệt đối_, vị trí của phần tử dựa trên thuộc tính {{Cssxref("left")}}, còn `width: auto` được coi là chiều rộng dựa trên nội dung; hoặc nếu `left` cũng là `auto`, phần tử được đặt ở vị trí ngang mà nó sẽ ở nếu là phần tử tĩnh.
    - với _phần tử định vị tương đối_, khoảng cách của phần tử từ vị trí bình thường dựa trên thuộc tính {{Cssxref("left")}}; hoặc nếu `left` cũng là `auto`, phần tử không dịch chuyển theo chiều ngang.

## Mô tả

Tác động của `right` phụ thuộc vào cách phần tử được định vị (tức là giá trị của thuộc tính {{cssxref("position")}}):

- Khi `position` được đặt thành `absolute` hoặc `fixed`, thuộc tính `right` xác định khoảng cách giữa outer margin của cạnh phải phần tử và inner border của cạnh phải khối chứa. Nếu phần tử được định vị có [_phần tử neo_](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using) liên kết và giá trị thuộc tính bao gồm hàm {{cssxref("anchor()")}}, `right` định vị cạnh phải của phần tử tương đối so với cạnh [`<anchor-side>`](/en-US/docs/Web/CSS/Reference/Values/anchor#anchor-side) đã chỉ định. Thuộc tính `right` [tương thích](/en-US/docs/Web/CSS/Reference/Values/anchor#compatibility_of_inset_properties_and_anchor-side_values) với các giá trị `left`, `right`, `start`, `end`, `self-start`, `self-end`, `center`, và `<percentage>`.
- Khi `position` được đặt thành `relative`, thuộc tính `right` xác định khoảng cách cạnh phải của phần tử dịch chuyển sang trái so với vị trí bình thường.
- Khi `position` được đặt thành `sticky`, thuộc tính `right` được dùng để tính toán hình chữ nhật ràng buộc sticky.
- Khi `position` được đặt thành `static`, thuộc tính `right` _không có tác dụng_.

Khi cả {{cssxref("left")}} và `right` đều được khai báo, nếu không bị ngăn cản bởi các thuộc tính khác, phần tử sẽ giãn ra để thỏa mãn cả hai. Nếu phần tử không thể giãn để thỏa mãn cả hai — ví dụ nếu `width` đã được khai báo — vị trí của phần tử bị _over-constrained_. Trong trường hợp này, giá trị `left` có ưu tiên khi container là left-to-right; giá trị `right` có ưu tiên khi container là right-to-left.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định vị tuyệt đối và tương đối sử dụng right

#### HTML

```html
<div id="relative">Relatively positioned</div>
<div id="absolute">Absolutely positioned</div>
```

#### CSS

```css
#relative {
  width: 100px;
  height: 100px;
  background-color: #ffc7e4;
  position: relative;
  top: 20px;
  left: 20px;
}

#absolute {
  width: 100px;
  height: 100px;
  background-color: #ffd7c2;
  position: absolute;
  bottom: 10px;
  right: 20px;
}
```

#### Kết quả

{{ EmbedLiveSample('Absolute_and_relative_positioning_using_right', 500, 220) }}

### Khai báo cả left và right

Khi cả `left` và `right` đều được khai báo, phần tử sẽ giãn ra để thỏa mãn cả hai, trừ khi các ràng buộc khác ngăn cản. Khi vị trí của phần tử bị _overspecified_, thứ tự ưu tiên dựa trên hướng của container: `left` sẽ có ưu tiên nếu container là left-to-right. `right` sẽ có ưu tiên nếu container là right-to-left.

#### HTML

```html
<div id="parent">
  Parent
  <div id="noWidth">No width</div>
  <div id="width">width: 100px</div>
</div>
```

#### CSS

```css
div {
  outline: 1px solid #cccccc;
}
#parent {
  width: 200px;
  height: 200px;
  background-color: #ffc7e4;
  position: relative;
}
/* khai báo cả left và right */
#width,
#noWidth {
  background-color: #c2ffd7;
  position: absolute;
  left: 0;
  right: 0;
}
/* khai báo width */
#width {
  width: 100px;
  top: 60px;
}
```

#### Kết quả

{{ EmbedLiveSample('Declaring_both_left_and_right', 500, 220) }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("top")}}, {{cssxref("bottom")}}, và {{cssxref("left")}}
- Shorthand {{cssxref("inset")}}
- {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}}, và {{cssxref("inset-inline-end")}}
- Shorthand {{cssxref("inset-block")}} và {{cssxref("inset-inline")}}
- {{cssxref("position")}}
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
