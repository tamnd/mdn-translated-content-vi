---
title: border-top-left-radius
slug: Web/CSS/Reference/Properties/border-top-left-radius
page-type: css-property
browser-compat: css.properties.border-top-left-radius
sidebar: cssref
---

Thuộc tính **`border-top-left-radius`** trong [CSS](/en-US/docs/Web/CSS) bo tròn góc trên bên trái của một phần tử bằng cách chỉ định bán kính (hoặc bán trục lớn và bán trục nhỏ) của hình elip định nghĩa độ cong của góc.

{{InteractiveExample("CSS Demo: border-top-left-radius")}}

```css interactive-example-choice
border-top-left-radius: 80px 80px;
```

```css interactive-example-choice
border-top-left-radius: 250px 100px;
```

```css interactive-example-choice
border-top-left-radius: 50%;
```

```css interactive-example-choice
border-top-left-radius: 50%;
border: black 10px double;
background-clip: content-box;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a top left rounded corner.
  </div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  justify-content: center;
  flex-direction: column;
  background-color: #5b6dcd;
  color: white;
  padding: 10px;
}
```

## Cú pháp

```css
/* góc là hình tròn */
/* border-top-left-radius: radius */
border-top-left-radius: 3px;

/* góc là hình elip */
/* border-top-left-radius: horizontal vertical */
border-top-left-radius: 0.5em 1em;

border-top-left-radius: inherit;

/* Giá trị toàn cục */
border-top-left-radius: inherit;
border-top-left-radius: initial;
border-top-left-radius: revert;
border-top-left-radius: revert-layer;
border-top-left-radius: unset;
```

Với một giá trị:

- Giá trị là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính hình tròn dùng cho đường viền tại góc đó.

Với hai giá trị:

- Giá trị đầu tiên là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị bán trục lớn ngang của hình elip dùng cho đường viền tại góc đó.
- Giá trị thứ hai là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị bán trục lớn dọc của hình elip dùng cho đường viền tại góc đó.

### Giá trị

- `<length-percentage>`
  - : Biểu thị kích thước của bán kính hình tròn hoặc các trục bán lớn và bán nhỏ của hình elip. Dưới dạng độ dài tuyệt đối, nó có thể được biểu thị bằng bất kỳ đơn vị nào được phép trong kiểu dữ liệu {{cssxref("&lt;length&gt;")}} của CSS. Tỷ lệ phần trăm cho trục ngang tham chiếu đến chiều rộng của hộp, tỷ lệ phần trăm cho trục dọc tham chiếu đến chiều cao của hộp. Giá trị âm không hợp lệ.

## Mô tả

Độ bo tròn có thể là hình tròn hoặc hình elip, hoặc nếu một trong các giá trị là `0`, không có bo tròn nào được thực hiện và góc sẽ là góc vuông.

![border-radius.png](border-radius.png)

Nền, dù là hình ảnh hay màu sắc, đều được cắt tại đường viền, kể cả khi có bo tròn; vị trí chính xác của việc cắt được xác định bởi giá trị của thuộc tính {{cssxref("background-clip")}}.

> [!NOTE]
> Nếu giá trị của thuộc tính này không được đặt trong thuộc tính viết tắt {{cssxref("border-radius")}} được áp dụng cho phần tử sau thuộc tính CSS `border-top-left-radius`, thì giá trị của thuộc tính này sẽ được đặt lại về giá trị ban đầu của nó bởi [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties).

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cung tròn

Một giá trị `<length>` duy nhất tạo ra một cung tròn.

```html hidden
<div></div>
```

```css
div {
  border-top-left-radius: 40px;
  background-color: lightgreen;
  border: solid 1px black;
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("Arc_of_a_circle")}}

### Cung elip

Hai giá trị `<length>` khác nhau tạo ra một cung elip.

```html hidden
<div></div>
```

```css
div {
  border-top-left-radius: 40px 20px;
  background-color: lightgreen;
  border: solid 1px black;
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("Arc_of_an_ellipse")}}

### Phần tử hình vuông với bán kính phần trăm

Một phần tử hình vuông với một giá trị `<percentage>` duy nhất tạo ra một cung tròn.

```html hidden
<div></div>
```

```css
div {
  border-top-left-radius: 40%;
  background-color: lightgreen;
  border: solid 1px black;
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("Square_element_with_percentage_radius")}}

### Phần tử không hình vuông với bán kính phần trăm

Một phần tử không hình vuông với một giá trị `<percentage>` duy nhất tạo ra một cung elip.

```html hidden
<div></div>
```

```css
div {
  border-top-left-radius: 40%;
  background-color: lightgreen;
  border: solid 1px black;
  width: 200px;
  height: 100px;
}
```

{{EmbedLiveSample("Non-square_element_with_percentage_radius")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính viết tắt {{cssxref("border-radius")}}
- {{cssxref("border-top-right-radius")}}, {{cssxref("border-bottom-right-radius")}}, và {{cssxref("border-bottom-left-radius")}}
