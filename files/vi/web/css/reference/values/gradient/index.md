---
title: <gradient>
slug: Web/CSS/Reference/Values/gradient
page-type: css-type
browser-compat: css.types.gradient
sidebar: cssref
---

Kiểu dữ liệu **`<gradient>`** trong [CSS](/vi/docs/Web/CSS) là một kiểu đặc biệt của {{cssxref("image")}} bao gồm sự chuyển đổi dần dần giữa hai hoặc nhiều màu sắc.

{{InteractiveExample("CSS Demo: &lt;gradient&gt;")}}

```css interactive-example-choice
background: linear-gradient(#f69d3c, #3f87a6);
```

```css interactive-example-choice
background: radial-gradient(#f69d3c, #3f87a6);
```

```css interactive-example-choice
background: repeating-linear-gradient(#f69d3c, #3f87a6 50px);
```

```css interactive-example-choice
background: repeating-radial-gradient(#f69d3c, #3f87a6 50px);
```

```css interactive-example-choice
background: conic-gradient(#f69d3c, #3f87a6);
```

```html interactive-example
<section class="display-block" id="default-example">
  <div id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  min-height: 100%;
}
```

Một gradient CSS [không có kích thước nội tại](/vi/docs/Web/CSS/Reference/Values/image#description); tức là nó không có kích thước tự nhiên hay ưa thích, cũng không có tỷ lệ ưa thích. Kích thước cụ thể của nó sẽ khớp với kích thước của phần tử mà nó áp dụng.

## Cú pháp

Kiểu dữ liệu `<gradient>` được định nghĩa bằng một trong các loại hàm được liệt kê bên dưới.

### Gradient tuyến tính

Gradient tuyến tính chuyển đổi màu sắc dần dần dọc theo một đường thẳng tưởng tượng. Chúng được tạo ra bằng hàm {{cssxref("gradient/linear-gradient", "linear-gradient()")}}.

### Gradient hướng tâm

Gradient hướng tâm chuyển đổi màu sắc dần dần từ một điểm trung tâm (gốc). Chúng được tạo ra bằng hàm {{cssxref("gradient/radial-gradient", "radial-gradient()")}}.

### Gradient hình nón

Gradient hình nón chuyển đổi màu sắc dần dần xung quanh một vòng tròn. Chúng được tạo ra bằng hàm {{cssxref("gradient/conic-gradient", "conic-gradient()")}}.

### Gradient lặp lại

Gradient lặp lại nhân đôi một gradient nhiều lần khi cần thiết để lấp đầy một vùng nhất định. Chúng được tạo ra bằng các hàm {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, và {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}.

## Nội suy

Như với bất kỳ phép nội suy nào liên quan đến màu sắc, các gradient được tính toán trong không gian màu alpha-premultiplied. Điều này ngăn các sắc thái xám không mong muốn xuất hiện khi cả màu sắc lẫn độ trong suốt đều thay đổi. (Lưu ý rằng các trình duyệt cũ có thể không sử dụng hành vi này khi sử dụng [từ khóa transparent](/vi/docs/Web/CSS/Reference/Values/named-color#transparent).)

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ gradient tuyến tính

Một gradient tuyến tính.

```html hidden
<div class="linear-gradient">Linear gradient</div>
```

```css hidden
div {
  width: 240px;
  height: 80px;
}
```

```css
.linear-gradient {
  background: linear-gradient(
    to right,
    red,
    orange,
    yellow,
    green,
    blue,
    indigo,
    violet
  );
}
```

{{EmbedLiveSample('Linear_gradient_example', 240, 120)}}

### Ví dụ gradient hướng tâm

Một gradient hướng tâm.

```html hidden
<div class="radial-gradient">Radial gradient</div>
```

```css hidden
div {
  width: 240px;
  height: 80px;
}
```

```css
.radial-gradient {
  background: radial-gradient(red, yellow, dodgerblue);
}
```

{{EmbedLiveSample('Radial_gradient_example', 240, 120)}}

### Ví dụ gradient hình nón

Một ví dụ gradient hình nón.

```html hidden
<div class="conic-gradient">Conic gradient</div>
```

```css hidden
div {
  width: 200px;
  height: 200px;
}
```

```css
.conic-gradient {
  background: conic-gradient(pink, coral, lime);
}
```

{{EmbedLiveSample('Conic_gradient_example', 240, 240)}}

### Ví dụ gradient lặp lại

Ví dụ về gradient tuyến tính và hướng tâm lặp lại.

```html hidden
<div class="linear-repeat"></div>
<span>Repeating linear gradient</span>
<hr />
<div class="radial-repeat"></div>
<span>Repeating radial gradient</span>
<hr />
<div class="conic-repeat"></div>
<span>Repeating conic gradient</span>
```

```css hidden
div {
  display: inline-block;
  width: 240px;
  height: 80px;
}

span {
  font-weight: bold;
  vertical-align: top;
}
```

```css
.linear-repeat {
  background: repeating-linear-gradient(
    to top left,
    pink,
    pink 5px,
    white 5px,
    white 10px
  );
}

.radial-repeat {
  background: repeating-radial-gradient(
    lime,
    lime 15px,
    white 15px,
    white 30px
  );
}

.conic-repeat {
  background: repeating-conic-gradient(lime, pink 30deg);
}
```

{{EmbedLiveSample('Repeating_gradient_examples', 240, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng gradient CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm gradient: {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- [Kiểu dữ liệu cơ bản CSS](/vi/docs/Web/CSS/Reference/Values/Data_types)
- [Giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
- [Học: Giá trị và đơn vị](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
