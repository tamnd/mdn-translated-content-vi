---
title: repeating-linear-gradient()
slug: Web/CSS/Reference/Values/gradient/repeating-linear-gradient
page-type: css-function
browser-compat: css.types.gradient.repeating-linear-gradient
sidebar: cssref
---

Hàm **`repeating-linear-gradient()`** của [CSS](/vi/docs/Web/CSS) tạo ra một hình ảnh gồm các độ dốc màu tuyến tính lặp lại. Nó tương tự như {{cssxref("gradient/linear-gradient", "linear-gradient()")}} và nhận cùng các tham số, nhưng lặp lại các điểm dừng màu vô hạn theo mọi hướng để bao phủ toàn bộ phần tử chứa nó. Kết quả của hàm là một đối tượng thuộc kiểu dữ liệu {{cssxref("gradient")}}, vốn là một loại {{cssxref("image")}} đặc biệt.

{{InteractiveExample("CSS Demo: repeating-linear-gradient()")}}

```css interactive-example-choice
background: repeating-linear-gradient(
  #e66465,
  #e66465 20px,
  #9198e5 20px,
  #9198e5 25px
);
```

```css interactive-example-choice
background: repeating-linear-gradient(45deg, #3f87a6, #ebf8e1 15%, #f69d3c 20%);
```

```css interactive-example-choice
background:
  repeating-linear-gradient(transparent, #4d9f0c 40px),
  repeating-linear-gradient(0.25turn, transparent, #3f87a6 20px);
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

Độ dài của đoạn độ dốc lặp lại là khoảng cách giữa điểm dừng màu đầu tiên và cuối cùng. Nếu màu đầu tiên không có độ dài điểm dừng, độ dài điểm dừng mặc định là 0. Với mỗi lần lặp, vị trí của các điểm dừng màu được dịch chuyển theo bội số của độ dài độ dốc tuyến tính cơ bản. Do đó, vị trí của mỗi điểm dừng màu cuối cùng trùng khớp với điểm dừng màu bắt đầu; nếu các giá trị màu khác nhau, sẽ tạo ra sự chuyển đổi trực quan sắc nét. Điều này có thể được khắc phục bằng cách lặp lại màu đầu tiên như màu cuối cùng.

Như với bất kỳ độ dốc màu nào, độ dốc tuyến tính lặp lại [không có kích thước cố hữu](/vi/docs/Web/CSS/Reference/Values/image#description); tức là nó không có kích thước tự nhiên hay ưu tiên, cũng không có tỉ lệ ưu tiên. Kích thước cụ thể của nó sẽ khớp với kích thước của phần tử mà nó áp dụng.

Vì các `<gradient>` thuộc kiểu dữ liệu `<image>`, chúng chỉ có thể được sử dụng ở nơi có thể sử dụng `<image>`. Vì lý do này, `repeating-linear-gradient()` sẽ không hoạt động trên {{Cssxref("background-color")}} và các thuộc tính khác sử dụng kiểu dữ liệu {{cssxref("&lt;color&gt;")}}.

## Cú pháp

```css
/* Độ dốc lặp lại nghiêng 45 độ,
   bắt đầu màu xanh và kết thúc màu đỏ, lặp lại 3 lần */
repeating-linear-gradient(45deg, blue, red 33.3%)

/* Độ dốc lặp lại từ góc dưới bên phải đến góc trên bên trái,
   bắt đầu màu xanh và kết thúc màu đỏ, lặp lại mỗi 20px */
repeating-linear-gradient(to left top, blue, red 20px)

/* Độ dốc từ dưới lên trên,
   bắt đầu màu xanh, chuyển sang màu xanh lá sau 40%,
   và kết thúc màu đỏ. Độ dốc này không lặp lại vì
   điểm dừng màu cuối cùng mặc định là 100% */
repeating-linear-gradient(0deg, blue, green 40%, red)

/* Độ dốc lặp lại năm lần, từ trái sang phải,
   bắt đầu màu đỏ, chuyển sang màu xanh lá, và trở lại màu đỏ */
repeating-linear-gradient(to right, red 0%, green 10%, red 20%)

/* Nội suy trong không gian màu hình chữ nhật */
repeating-linear-gradient(in oklab, blue, red 50px)

/* Nội suy trong không gian màu cực */
repeating-linear-gradient(in hsl, blue, red 50px)

/* Nội suy trong không gian màu cực
  với phương pháp nội suy sắc độ dài hơn */
repeating-linear-gradient(in hsl longer hue, blue, red 50px)
```

### Giá trị

- `<side-or-corner>`
  - : Vị trí điểm bắt đầu của đường độ dốc. Nếu được chỉ định, nó bao gồm từ `to` và tối đa hai từ khóa: một từ chỉ cạnh ngang (`left` hoặc `right`), và cạnh kia chỉ cạnh dọc (`top` hoặc `bottom`). Thứ tự của các từ khóa cạnh không quan trọng. Nếu không được chỉ định, mặc định là `to bottom`.

    Các giá trị `to top`, `to bottom`, `to left`, và `to right` tương đương với các góc `0deg`, `180deg`, `270deg`, và `90deg`. Các giá trị khác được chuyển đổi thành góc.

- {{cssxref("angle")}}
  - : Góc hướng của đường độ dốc. Giá trị `0deg` tương đương với `to top`; các giá trị tăng dần xoay theo chiều kim đồng hồ.
- `<linear-color-stop>`
  - : Giá trị {{CSSxRef("&lt;color&gt;")}} của điểm dừng màu, theo sau là một hoặc hai vị trí dừng tùy chọn (mỗi cái là {{CSSxRef("&lt;percentage&gt;")}} hoặc {{CSSxRef("&lt;length&gt;")}} dọc theo trục độ dốc). Phần trăm `0%` hoặc độ dài `0` đại diện cho điểm bắt đầu của độ dốc; giá trị `100%` là 100% kích thước hình ảnh, nghĩa là độ dốc sẽ không lặp lại.
- `<color-hint>`
  - : Gợi ý màu là một gợi ý nội suy xác định cách độ dốc tiến triển giữa các điểm dừng màu liền kề. Độ dài xác định điểm giữa hai điểm dừng màu mà màu độ dốc nên đạt đến điểm giữa của quá trình chuyển đổi màu. Nếu bỏ qua, điểm giữa của quá trình chuyển đổi màu là điểm giữa giữa hai điểm dừng màu.

> [!NOTE]
> Việc hiển thị các điểm dừng màu trong độ dốc tuyến tính lặp lại tuân theo các quy tắc giống như [điểm dừng màu trong độ dốc tuyến tính](/vi/docs/Web/CSS/Reference/Values/gradient/linear-gradient#composition_of_a_linear_gradient).

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sọc ngựa vằn

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background-image: repeating-linear-gradient(
    -45deg,
    transparent,
    transparent 20px,
    black 20px,
    black 40px
  );
  /* with multiple color stop lengths */
  background-image: repeating-linear-gradient(
    -45deg,
    transparent 0 20px,
    black 20px 40px
  );
}
```

{{EmbedLiveSample('Zebra_stripes', 120, 120)}}

### Mười thanh ngang lặp lại

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background-image: repeating-linear-gradient(
    to bottom,
    rgb(26 198 204),
    rgb(26 198 204) 7%,
    rgb(100 100 100) 10%
  );
}
```

{{EmbedLiveSample('Ten_repeating_horizontal_bars', 120, 120)}}

Vì điểm dừng màu cuối cùng là 10% và độ dốc là theo chiều dọc, mỗi độ dốc trong độ dốc lặp lại chiếm 10% chiều cao, vừa đủ 10 thanh ngang.

### Nội suy trong không gian màu hình chữ nhật

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background: repeating-linear-gradient(90deg in oklab, blue, red 100px);
}
```

{{EmbedLiveSample("Interpolation in rectangular color space", 120, 120)}}

### Nội suy với sắc độ

```html hidden
<div class="shorter">shorter hue</div>
<div class="longer">longer hue</div>
```

```css hidden
div {
  height: 50vh;
  color: #333300;
  font-weight: bolder;
  padding-left: 1.5rem;
}
```

Trong ví dụ nội suy này, hệ màu [hsl](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) được sử dụng và [sắc độ](/vi/docs/Web/CSS/Reference/Values/hue) được nội suy.

```css
.shorter {
  background: repeating-linear-gradient(
    90deg in hsl shorter hue,
    red,
    blue 300px
  );
}

.longer {
  background: repeating-linear-gradient(
    90deg in hsl longer hue,
    red,
    blue 300px
  );
}
```

Hộp ở trên sử dụng [nội suy ngắn hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#shorter), nghĩa là màu đi từ đỏ sang xanh dương theo cung ngắn hơn trên [bánh xe màu](/vi/docs/Glossary/Color_wheel). Hộp ở dưới sử dụng [nội suy dài hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#longer), nghĩa là màu đi từ đỏ sang xanh dương theo cung dài hơn, đi qua màu xanh lá, vàng và cam.

{{EmbedLiveSample("Interpolating with hue", 120, 120)}}

> [!NOTE]
> Vui lòng xem [Sử dụng độ dốc màu CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients) để có thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng độ dốc màu CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm độ dốc khác: {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("image")}}
- {{cssxref("image/image","image()")}}
- {{cssxref("element()")}}
- {{cssxref("image/image-set","image-set()")}}
- {{cssxref("cross-fade()")}}
