---
title: border-bottom-left-radius
slug: Web/CSS/Reference/Properties/border-bottom-left-radius
page-type: css-property
browser-compat: css.properties.border-bottom-left-radius
sidebar: cssref
---

Thuộc tính **`border-bottom-left-radius`** trong [CSS](/en-US/docs/Web/CSS) làm tròn góc dưới bên trái của một phần tử bằng cách chỉ định bán kính (hoặc bán kính trục lớn và trục nhỏ) của hình elip xác định độ cong của góc.

{{InteractiveExample("CSS Demo: border-bottom-left-radius")}}

```css interactive-example-choice
border-bottom-left-radius: 80px 80px;
```

```css interactive-example-choice
border-bottom-left-radius: 250px 100px;
```

```css interactive-example-choice
border-bottom-left-radius: 50%;
```

```css interactive-example-choice
border-bottom-left-radius: 50%;
border: black 10px double;
background-clip: content-box;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a bottom left rounded corner.
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
/* border-bottom-left-radius: radius */
border-bottom-left-radius: 3px;

/* Giá trị phần trăm */

/* hình tròn nếu hộp là hình vuông hoặc hình elip nếu hộp là hình chữ nhật */
border-bottom-left-radius: 20%;

/* giống như trên: 20% theo chiều ngang (rộng) và dọc (cao) */
border-bottom-left-radius: 20% 20%;

/* 20% theo chiều ngang (rộng) và 10% theo chiều dọc (cao) */
border-bottom-left-radius: 20% 10%;

/* góc là hình elip */
/* border-bottom-left-radius: horizontal vertical */
border-bottom-left-radius: 0.5em 1em;

/* Giá trị toàn cục */
border-bottom-left-radius: inherit;
border-bottom-left-radius: initial;
border-bottom-left-radius: revert;
border-bottom-left-radius: revert-layer;
border-bottom-left-radius: unset;
```

Với một giá trị:

- giá trị là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị bán kính của hình tròn dùng cho đường viền ở góc đó.

Với hai giá trị:

- giá trị đầu tiên là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị trục bán lớn ngang của hình elip dùng cho đường viền ở góc đó.
- giá trị thứ hai là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} biểu thị trục bán lớn dọc của hình elip dùng cho đường viền ở góc đó.

### Giá trị

- `<length-percentage>`
  - : Biểu thị kích thước bán kính hình tròn hoặc các trục bán lớn và bán nhỏ của hình elip. Là độ dài tuyệt đối, nó có thể được biểu thị bằng bất kỳ đơn vị nào được phép bởi kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}. Phần trăm theo trục ngang tham chiếu đến chiều rộng của hộp, phần trăm theo trục dọc tham chiếu đến chiều cao của hộp. Giá trị âm không hợp lệ.

## Mô tả

Việc làm tròn có thể là hình tròn hoặc hình elip, hoặc nếu một trong các giá trị là `0` thì không có làm tròn và góc là hình vuông.

![border-bottom-left-radius.png](border-bottom-left-radius.png)

Nền, dù là hình ảnh hay màu sắc, đều bị cắt theo đường viền, kể cả đường viền tròn; vị trí cắt chính xác được xác định bởi giá trị của thuộc tính {{cssxref("background-clip")}}.

> [!NOTE]
> Nếu giá trị của thuộc tính này không được đặt trong thuộc tính viết tắt {{cssxref("border-radius")}} được áp dụng cho phần tử sau thuộc tính CSS `border-bottom-left-radius`, thì giá trị của thuộc tính này sẽ được đặt lại về giá trị ban đầu bởi [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties).

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cung của hình tròn

Một giá trị `<length>` duy nhất tạo ra cung của hình tròn.

```html hidden
<div></div>
```

```css
div {
  border-bottom-left-radius: 40px;
  background-color: lightgreen;
  border: solid 1px black;
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("Arc_of_a_circle")}}

### Cung của hình elip

Hai giá trị `<length>` khác nhau tạo ra cung của hình elip.

```html hidden
<div></div>
```

```css
div {
  border-bottom-left-radius: 40px 20px;
  background-color: lightgreen;
  border: solid 1px black;
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("Arc_of_an_ellipse")}}

### Phần tử hình vuông với bán kính phần trăm

Phần tử hình vuông với một giá trị `<percentage>` duy nhất tạo ra cung của hình tròn.

```html hidden
<div></div>
```

```css
div {
  border-bottom-left-radius: 40%;
  background-color: lightgreen;
  border: solid 1px black;
  width: 100px;
  height: 100px;
}
```

{{EmbedLiveSample("Square_element_with_percentage_radius")}}

### Phần tử không vuông với bán kính phần trăm

Phần tử không vuông với một giá trị `<percentage>` duy nhất tạo ra cung của hình elip.

```html hidden
<div></div>
```

```css
div {
  border-bottom-left-radius: 40%;
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
- {{cssxref("border-top-right-radius")}}, {{cssxref("border-bottom-right-radius")}} và {{cssxref("border-top-left-radius")}}
