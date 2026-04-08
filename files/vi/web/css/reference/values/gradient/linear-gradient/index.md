---
title: linear-gradient()
slug: Web/CSS/Reference/Values/gradient/linear-gradient
page-type: css-function
browser-compat: css.types.gradient.linear-gradient
sidebar: cssref
---

Hàm **`linear-gradient()`** trong [CSS](/vi/docs/Web/CSS) tạo ra một hình ảnh bao gồm sự chuyển đổi dần dần giữa hai hoặc nhiều màu sắc dọc theo một đường thẳng. Kết quả của nó là một đối tượng của kiểu dữ liệu {{cssxref("gradient")}}, đây là một loại {{cssxref("image")}} đặc biệt.

{{InteractiveExample("CSS Demo: linear-gradient()")}}

```css interactive-example-choice
background: linear-gradient(#e66465, #9198e5);
```

```css interactive-example-choice
background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
```

```css interactive-example-choice
background: linear-gradient(
  to left,
  #333333,
  #333333 50%,
  #eeeeee 75%,
  #333333 75%
);
```

```css interactive-example-choice
background:
  linear-gradient(217deg, rgb(255 0 0 / 0.8), transparent 70.71%),
  linear-gradient(127deg, rgb(0 255 0 / 0.8), transparent 70.71%),
  linear-gradient(336deg, rgb(0 0 255 / 0.8), transparent 70.71%);
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

## Cú pháp

```css
/* Gradient với một màu đỏ duy nhất */
linear-gradient(red)

/* Gradient nghiêng 45 độ,
   bắt đầu bằng màu xanh lam và kết thúc bằng màu đỏ */
linear-gradient(45deg, blue, red)

/* Gradient từ góc dưới bên phải đến góc trên bên trái,
   bắt đầu bằng màu xanh lam và kết thúc bằng màu đỏ */
linear-gradient(to left top, blue, red)

/* Nội suy trong không gian màu hình chữ nhật */
linear-gradient(in oklab, blue, red)

/* Nội suy trong không gian màu cực */
linear-gradient(in hsl, blue, red)

/* Nội suy trong không gian màu cực
  với phương pháp nội suy màu sắc dài hơn */
linear-gradient(in hsl longer hue, blue, red)

/* Điểm dừng màu: Gradient từ dưới lên trên,
   bắt đầu bằng màu xanh lam, chuyển sang màu xanh lá ở 40% độ dài,
   và kết thúc bằng màu đỏ */
linear-gradient(0deg, blue, green 40%, red)

/* Gợi ý màu: Gradient từ trái sang phải,
   bắt đầu bằng màu đỏ, đến màu giữa điểm
   ở 10% chiều dài gradient,
   phần còn lại 90% chiều dài để chuyển sang màu xanh lam */
linear-gradient(.25turn, red, 10%, blue)

/* Điểm dừng màu nhiều vị trí: Gradient nghiêng 45 độ,
   với nửa dưới bên trái màu đỏ và nửa trên bên phải màu xanh lam,
   với đường cứng nơi gradient chuyển từ đỏ sang xanh lam */
linear-gradient(45deg, red 0 50%, blue 50% 100%)
```

### Giá trị

- `<side-or-corner>`
  - : Vị trí điểm bắt đầu của đường gradient. Nếu được chỉ định, nó bao gồm từ `to` và tối đa hai từ khóa: một chỉ cạnh ngang (`left` hoặc `right`), và cạnh kia chỉ cạnh dọc (`top` hoặc `bottom`). Thứ tự của các từ khóa cạnh không quan trọng. Nếu không được chỉ định, mặc định là `to bottom`.

    Các giá trị `to top`, `to bottom`, `to left`, và `to right` tương đương với các góc `0deg`, `180deg`, `270deg`, và `90deg`. Các giá trị khác được dịch thành góc.

- {{cssxref("angle")}}
  - : Góc hướng của đường gradient. Giá trị `0deg` tương đương với `to top`; các giá trị tăng dần xoay theo chiều kim đồng hồ.
- `<linear-color-stop>`
  - : Giá trị {{CSSxRef("&lt;color&gt;")}} của điểm dừng màu, theo sau là một hoặc hai vị trí dừng tùy chọn (mỗi giá trị là {{CSSxRef("&lt;percentage&gt;")}} hoặc {{CSSxRef("&lt;length&gt;")}} dọc theo trục gradient).
- `<color-hint>`
  - : Gợi ý {{glossary("interpolation")}} xác định cách gradient tiến triển giữa các điểm dừng màu liền kề. Độ dài xác định điểm nào giữa hai điểm dừng màu mà màu gradient sẽ đạt đến điểm giữa của quá trình chuyển đổi màu. Nếu bỏ qua, điểm giữa của quá trình chuyển đổi màu là điểm giữa giữa hai điểm dừng màu.

> [!NOTE]
> Việc render [điểm dừng màu trong gradient CSS](#composition_of_a_linear_gradient) tuân theo các quy tắc giống như điểm dừng màu trong [gradient SVG](/vi/docs/Web/SVG/Tutorials/SVG_from_scratch/Gradients).

## Mô tả

Như với bất kỳ gradient nào, linear gradient [không có kích thước nội tại](/vi/docs/Web/CSS/Reference/Values/image#description); tức là, nó không có kích thước tự nhiên hoặc ưu tiên, cũng không có tỷ lệ ưu tiên. Kích thước thực tế của nó sẽ khớp với kích thước của phần tử mà nó áp dụng.

Để tạo linear gradient lặp lại để lấp đầy vùng chứa, hãy dùng hàm {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}} thay thế.

Vì `<gradient>` thuộc kiểu dữ liệu `<image>`, chúng chỉ có thể được dùng ở những nơi {{cssxref("image")}} có thể được dùng. Vì lý do này, `linear-gradient()` sẽ không hoạt động trên {{CSSxRef("background-color")}} và các thuộc tính khác dùng kiểu dữ liệu {{CSSxRef("&lt;color&gt;")}}.

### Thành phần của linear gradient

Linear gradient được xác định bởi một trục — _đường gradient_ — và hai hoặc nhiều _điểm dừng màu_. Mỗi điểm trên trục có một màu khác biệt; để tạo gradient mượt mà, hàm `linear-gradient()` vẽ một loạt các đường màu vuông góc với đường gradient, mỗi đường khớp với màu của điểm nơi nó giao nhau với đường gradient.

![linear-gradient.png](linear-gradient.png)

Đường gradient được xác định bởi tâm của hộp chứa hình ảnh gradient và bởi một góc. Màu sắc của gradient được xác định bởi hai hoặc nhiều điểm: điểm bắt đầu, điểm kết thúc, và giữa chúng là các điểm dừng màu tùy chọn.

_Điểm bắt đầu_ là vị trí trên đường gradient nơi màu đầu tiên bắt đầu. _Điểm kết thúc_ là điểm nơi màu cuối cùng kết thúc. Mỗi điểm trong hai điểm này được xác định bởi giao điểm của đường gradient với đường vuông góc đi qua góc hộp nằm trong cùng góc phần tư. Điểm kết thúc có thể được hiểu là điểm đối xứng của điểm bắt đầu. Các định nghĩa phức tạp này dẫn đến một hiệu ứng thú vị đôi khi được gọi là _magic corners_: các góc gần nhất với điểm bắt đầu và kết thúc có màu giống như điểm bắt đầu hoặc kết thúc tương ứng của chúng.

#### Tùy chỉnh gradient

Bằng cách thêm nhiều điểm dừng màu hơn trên đường gradient, bạn có thể tạo ra sự chuyển đổi được tùy chỉnh cao giữa nhiều màu sắc. Vị trí của điểm dừng màu có thể được xác định rõ ràng bằng cách dùng {{CSSxRef("&lt;length&gt;")}} hoặc {{CSSxRef("&lt;percentage&gt;")}}. Nếu bạn không chỉ định vị trí của màu, nó được đặt ở giữa màu trước nó và màu sau nó. Hai gradient sau đây là tương đương.

```css
linear-gradient(red, orange, yellow, green, blue);
linear-gradient(red 0%, orange 25%, yellow 50%, green 75%, blue 100%);
```

Theo mặc định, màu chuyển đổi mượt mà từ màu tại một điểm dừng màu đến màu tại điểm dừng màu tiếp theo, với điểm giữa giữa các màu là điểm giữa của quá trình chuyển đổi màu. Bạn có thể di chuyển điểm giữa này đến bất kỳ vị trí nào giữa hai điểm dừng màu bằng cách thêm gợi ý màu không có nhãn % giữa hai màu để chỉ ra nơi điểm giữa của quá trình chuyển đổi màu. Ví dụ sau là màu đỏ đặc từ đầu đến mốc 10% và màu xanh lam đặc từ 90% đến cuối. Giữa 10% và 90%, màu chuyển từ đỏ sang xanh lam, tuy nhiên điểm giữa của quá trình chuyển đổi ở mốc 30% thay vì 50% như sẽ xảy ra nếu không có gợi ý màu 30%.

```css
linear-gradient(red 10%, 30%, blue 90%);
```

Nếu hai hoặc nhiều điểm dừng màu ở cùng vị trí, quá trình chuyển đổi sẽ là một đường cứng giữa màu đầu tiên và màu cuối cùng được khai báo tại vị trí đó.

Các điểm dừng màu nên được liệt kê theo thứ tự tăng dần. Các điểm dừng màu tiếp theo có giá trị thấp hơn sẽ ghi đè giá trị của điểm dừng màu trước đó tạo ra quá trình chuyển đổi cứng. Sau đây thay đổi từ đỏ sang vàng ở mốc 40%, sau đó chuyển đổi từ vàng sang xanh lam trên 25% gradient:

```css
linear-gradient(red 40%, yellow 30%, blue 65%);
```

Các điểm dừng màu nhiều vị trí được phép. Một màu có thể được khai báo là hai điểm dừng màu liền kề bằng cách bao gồm cả hai vị trí trong khai báo CSS. Ba gradient sau là tương đương:

```css
linear-gradient(red 0%, orange 10%, orange 30%, yellow 50%, yellow 70%, green 90%, green 100%);
linear-gradient(red, orange 10% 30%, yellow 50% 70%, green 90%);
linear-gradient(red 0%, orange 10% 30%, yellow 50% 70%, green 90% 100%);
```

Theo mặc định, nếu không có màu nào với điểm dừng `0%`, màu đầu tiên được khai báo sẽ ở điểm đó. Tương tự, màu cuối cùng sẽ tiếp tục đến mốc `100%`, hoặc ở mốc `100%` nếu không có độ dài nào được khai báo trên điểm dừng cuối cùng đó.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Gradient ở góc 45 độ

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background: linear-gradient(45deg, red, blue);
}
```

{{EmbedLiveSample("Gradient_at_a_45-degree_angle", 120, 120)}}

### Gradient bắt đầu từ 60% của đường gradient

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background: linear-gradient(135deg, orange 60%, cyan);
}
```

{{EmbedLiveSample("Gradient_that_starts_at_60_of_the_gradient_line", 120, 120)}}

### Nội suy trong không gian màu hình chữ nhật

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background: linear-gradient(90deg in oklab, blue, red);
}
```

{{EmbedLiveSample("Interpolation in rectangular color space", 120, 120)}}

### Nội suy với màu sắc

```html hidden
<div class="shorter">shorter hue</div>
<div class="longer">longer hue</div>
```

```css hidden
div {
  height: 50vh;
  color: white;
  font-weight: bolder;
}
```

Trong ví dụ nội suy này, hệ màu [hsl](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) đang được sử dụng và [màu sắc](/vi/docs/Web/CSS/Reference/Values/hue) đang được nội suy.

```css
.shorter {
  background: linear-gradient(90deg in hsl shorter hue, red, blue);
}

.longer {
  background: linear-gradient(90deg in hsl longer hue, red, blue);
}
```

Hộp phía trên sử dụng [nội suy ngắn hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#shorter), có nghĩa là màu đi thẳng từ đỏ đến xanh lam bằng cung ngắn hơn trên [bánh xe màu](/vi/docs/Glossary/Color_wheel). Hộp phía dưới sử dụng [nội suy dài hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#longer), có nghĩa là màu đi từ đỏ đến xanh lam bằng cung dài hơn, đi qua các màu xanh lá, vàng, và cam.

{{EmbedLiveSample("Interpolating with hue", 120, 120)}}

### Gradient với các điểm dừng màu nhiều vị trí

Ví dụ này sử dụng các điểm dừng màu nhiều vị trí, với các màu liền kề có cùng giá trị điểm dừng màu, tạo ra hiệu ứng sọc.

```css hidden
body {
  width: 100vw;
  height: 100vh;
}
```

```css
body {
  background: linear-gradient(
    to right,
    red 20%,
    orange 20% 40%,
    yellow 40% 60%,
    green 60% 80%,
    blue 80%
  );
}
```

{{EmbedLiveSample("Gradient_with_multi-position_color_stops", 120, 120)}}

### Thêm ví dụ về linear-gradient

Vui lòng xem [sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm gradient khác: {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("image")}}
- [Module CSS images](/vi/docs/Web/CSS/Guides/Images)
