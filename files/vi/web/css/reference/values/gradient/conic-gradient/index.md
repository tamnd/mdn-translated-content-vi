---
title: conic-gradient()
slug: Web/CSS/Reference/Values/gradient/conic-gradient
page-type: css-function
browser-compat: css.types.gradient.conic-gradient
sidebar: cssref
---

Hàm **`conic-gradient()`** trong [CSS](/vi/docs/Web/CSS) tạo ra một hình ảnh bao gồm gradient với các chuyển đổi màu sắc được xoay xung quanh một điểm trung tâm (thay vì tỏa ra từ trung tâm). Ví dụ về gradient hình nón bao gồm biểu đồ hình tròn và {{glossary("color wheel", "vòng màu sắc")}}. Kết quả của hàm `conic-gradient()` là một đối tượng thuộc kiểu dữ liệu {{cssxref("gradient")}}, đây là một loại đặc biệt của {{cssxref("image")}}.

{{InteractiveExample("CSS Demo: conic-gradient()")}}

```css interactive-example-choice
background: conic-gradient(red, orange, yellow, green, blue);
```

```css interactive-example-choice
background: conic-gradient(
  from 0.25turn at 50% 30%,
  #f69d3c,
  10deg,
  #3f87a6,
  350deg,
  #ebf8e1
);
```

```css interactive-example-choice
background: conic-gradient(from 3.1416rad at 10% 50%, #e66465, #9198e5);
```

```css interactive-example-choice
background: conic-gradient(
  red 6deg,
  orange 6deg 18deg,
  yellow 18deg 45deg,
  green 45deg 110deg,
  blue 110deg 200deg,
  purple 200deg
);
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
/* Một gradient với một màu duy nhất là màu đỏ */
conic-gradient(red)

/* Một gradient hình nón được xoay 45 độ,
   bắt đầu màu xanh lam và kết thúc màu đỏ */
conic-gradient(from 45deg, blue, red)

/* Một hộp màu xanh tím: gradient đi từ xanh lam sang đỏ,
   nhưng chỉ góc dưới bên phải được nhìn thấy, vì
   tâm của gradient hình nón nằm ở góc trên bên trái */
conic-gradient(from 90deg at 0 0, blue, red)

/* Nội suy trong không gian màu cực
  với phương pháp nội suy hue dài hơn */
conic-gradient(in hsl longer hue, red, blue, green, red)

/* Vòng màu sắc */
conic-gradient(
  hsl(360 100% 50%),
  hsl(315 100% 50%),
  hsl(270 100% 50%),
  hsl(225 100% 50%),
  hsl(180 100% 50%),
  hsl(135 100% 50%),
  hsl(90 100% 50%),
  hsl(45 100% 50%),
  hsl(0 100% 50%)
)
```

### Giá trị

- {{cssxref("angle")}}
  - : Đứng trước từ khóa `from`, nhận một góc làm giá trị, xác định hướng xoay gradient theo chiều kim đồng hồ.
- `<position>`
  - : Sử dụng các giá trị độ dài, thứ tự và từ khóa giống như thuộc tính {{cssxref("background-position")}}, giá trị `position` xác định tâm của gradient. Nếu không được chỉ định, giá trị mặc định cho `position` là `center`, nghĩa là gradient sẽ được căn giữa.
- `<angular-color-stop>`
  - : Giá trị {{CSSxRef("&lt;color&gt;")}} của một điểm dừng màu, theo sau bởi một hoặc hai vị trí dừng tùy chọn (một {{cssxref("angle")}} dọc theo trục chu vi của gradient).
- `<color-hint>`
  - : Một gợi ý {{Glossary("interpolation", "nội suy")}} xác định cách gradient tiến triển giữa các điểm dừng màu kề nhau. Độ dài xác định tại điểm nào giữa hai điểm dừng màu thì màu gradient nên đạt đến điểm giữa của chuyển đổi màu. Nếu bỏ qua, điểm giữa của chuyển đổi màu là điểm giữa giữa hai điểm dừng màu.

> [!NOTE]
> Cách hiển thị các điểm dừng màu trong gradient hình nón tuân theo các quy tắc giống như [điểm dừng màu trong gradient tuyến tính](/vi/docs/Web/CSS/Reference/Values/gradient/linear-gradient#composition_of_a_linear_gradient).

## Mô tả

Như với bất kỳ gradient nào, gradient hình nón [không có kích thước nội tại](/vi/docs/Web/CSS/Reference/Values/image#description); tức là nó không có kích thước tự nhiên hay ưa thích, cũng không có tỷ lệ ưa thích. Kích thước cụ thể của nó sẽ khớp với kích thước của phần tử mà nó áp dụng, hoặc kích thước của `<image>` nếu được đặt thành thứ gì đó khác với kích thước phần tử.

Để tạo một gradient hình nón lặp lại để lấp đầy một vòng xoay 360 độ, hãy sử dụng hàm {{CSSxRef("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}} thay thế.

Vì `<gradient>` thuộc kiểu dữ liệu `<image>`, chúng chỉ có thể được sử dụng ở những nơi có thể sử dụng `<image>`. Vì lý do này, `conic-gradient()` sẽ không hoạt động trên {{CSSxRef("background-color")}} và các thuộc tính khác sử dụng kiểu dữ liệu {{CSSxRef("&lt;color&gt;")}}.

> [!NOTE]
> Tại sao nó được gọi là gradient "hình nón"? Nếu các điểm dừng màu sáng hơn nhiều ở một bên so với bên kia, nó có thể trông giống như một hình nón nhìn từ trên xuống.

### Cấu tạo của gradient hình nón

Cú pháp conic-gradient tương tự như cú pháp radial-gradient, nhưng các điểm dừng màu được đặt xung quanh một cung gradient, là chu vi của một vòng tròn, thay vì trên đường gradient xuất phát từ tâm của gradient. Với gradient hình nón, các màu sắc chuyển đổi như thể đang quay xung quanh tâm của một vòng tròn, bắt đầu từ phía trên và đi theo chiều kim đồng hồ. Trong gradient hướng tâm, các màu sắc chuyển đổi từ tâm của một hình elip, ra ngoài, theo mọi hướng.

![các điểm dừng màu dọc theo chu vi của gradient hình nón và trục của gradient hướng tâm.](screenshot_2018-11-29_21.09.19.png)

Một gradient hình nón được chỉ định bằng cách chỉ định một góc xoay, tâm của gradient, và sau đó chỉ định một danh sách các điểm dừng màu. Không giống như gradient tuyến tính và hướng tâm, trong đó các điểm dừng màu được đặt bằng cách chỉ định {{cssxref("length")}}, các điểm dừng màu của gradient hình nón được chỉ định bằng [góc](/vi/docs/Web/CSS/Reference/Values/angle). Các đơn vị bao gồm `deg` cho độ, `grad` cho gradian, `rad` cho radian, và `turn` cho vòng quay. Có 360 độ, 400 gradian, 2π radian và 1 vòng trong một vòng tròn. Các trình duyệt hỗ trợ gradient hình nón cũng chấp nhận giá trị phần trăm, với 100% bằng 360 độ, nhưng điều này không có trong thông số kỹ thuật.

Tương tự như gradient hướng tâm, cú pháp gradient hình nón cho phép định vị tâm của gradient ở bất kỳ đâu trong, hoặc thậm chí ngoài, hình ảnh. Các giá trị cho vị trí tương tự như cú pháp background-position 2 giá trị.

Cung gradient là chu vi của gradient. Điểm _bắt đầu_ của gradient hoặc cung là phía bắc, hay 12:00 giờ. Gradient sau đó được xoay theo góc _from_. Các màu của gradient được xác định bởi các điểm dừng màu theo góc, điểm bắt đầu, điểm kết thúc của chúng, và ở giữa là các điểm dừng màu theo góc tùy chọn. Các chuyển đổi giữa các màu có thể được thay đổi bằng các gợi ý màu giữa các điểm dừng màu của các màu kề nhau.

#### Tùy chỉnh gradient

Bằng cách thêm nhiều điểm dừng màu theo góc hơn trên cung gradient, bạn có thể tạo ra một chuyển đổi tùy chỉnh cao giữa nhiều màu. Vị trí của một điểm dừng màu có thể được xác định rõ ràng bằng cách sử dụng {{cssxref("angle")}}. Nếu bạn không chỉ định vị trí của một điểm dừng màu, nó sẽ được đặt ở giữa điểm trước và điểm sau nó. Nếu bạn không chỉ định góc cho điểm dừng màu đầu tiên hoặc cuối cùng, giá trị của chúng là 0deg và 360deg tương ứng. Hai gradient sau đây tương đương:

```css
conic-gradient(red, orange, yellow, green, blue);
conic-gradient(red 0deg, orange 90deg, yellow 180deg, green 270deg, blue 360deg);
```

Theo mặc định, các màu chuyển đổi mượt mà từ màu tại một điểm dừng màu sang màu tại điểm dừng màu tiếp theo, với điểm giữa giữa các màu là điểm giữa của chuyển đổi màu. Bạn có thể di chuyển điểm giữa chuyển đổi màu này đến bất kỳ điểm nào giữa hai điểm dừng màu bằng cách thêm gợi ý màu, chỉ định nơi giữa của chuyển đổi màu nên là. Phần sau đây là màu đỏ đặc từ đầu đến điểm 10%, chuyển đổi từ đỏ sang xanh trong 80% vòng quay, với 10% cuối cùng là màu xanh đặc. Tuy nhiên, điểm giữa của sự thay đổi gradient từ đỏ sang xanh là ở điểm 20% thay vì 50% như đã xảy ra nếu không có gợi ý màu 80grad, hay 20%.

```css
conic-gradient(red 40grad, 80grad, blue 360grad);
```

Nếu hai hoặc nhiều điểm dừng màu ở cùng một vị trí, chuyển đổi sẽ là một đường cứng giữa màu đầu tiên và màu cuối cùng được khai báo tại vị trí đó. Để sử dụng gradient hình nón tạo biểu đồ hình tròn — đây KHÔNG phải là cách đúng để tạo biểu đồ hình tròn vì hình ảnh nền không thể truy cập — hãy sử dụng các điểm dừng màu cứng, trong đó các góc điểm dừng màu cho hai điểm dừng màu kề nhau là như nhau. Cách dễ nhất để thực hiện điều này là sử dụng các điểm dừng màu nhiều vị trí. Hai khai báo sau đây tương đương:

```css
conic-gradient(white 0.09turn, #bbbbbb 0.09turn, #bbbbbb 0.27turn, #666666 0.27turn, #666666 0.54turn, black 0.54turn);
conic-gradient(white 0turn 0.09turn, #bbbbbb 0.09turn 0.27turn, #666666 0.27turn 0.54turn, black 0.54turn 1turn);
```

Các điểm dừng màu nên được liệt kê theo thứ tự tăng dần. Các điểm dừng màu tiếp theo có giá trị thấp hơn sẽ ghi đè giá trị của điểm dừng màu trước đó tạo ra một chuyển đổi cứng. Phần sau đây thay đổi từ đỏ sang vàng ở điểm 30%, và sau đó chuyển đổi từ vàng sang xanh trong 35% của gradient:

```css
conic-gradient(red .8rad, yellow .6rad, blue 1.3rad);
```

Có nhiều hiệu ứng khác mà bạn có thể tạo ra với gradient hình nón. Kỳ lạ thay, một bàn cờ là một trong số đó. Bằng cách tạo các góc phần tư với góc phần tư trên bên trái và dưới bên phải màu trắng và các góc phần tư dưới bên trái và trên bên phải màu đen, sau đó lặp lại gradient 16 lần (bốn lần ngang và bốn lần dọc) bạn có thể tạo ra một bàn cờ.

```css
conic-gradient(white 90deg, black 0.25turn 0.5turn, white calc(pi * 1rad) calc(pi * 1.5rad), black 300grad);
background-size: 25% 25%;
```

Và có, bạn có thể kết hợp các đơn vị góc khác nhau, nhưng đừng làm vậy. Đoạn trên rất khó đọc.

## Cú pháp chính thức

{{csssyntax}}

## Khả năng tiếp cận

Các trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt bất cứ điều gì cho người dùng. Mặc dù có thể tạo biểu đồ hình tròn, bàn cờ và các hiệu ứng khác với gradient hình nón, các hình ảnh CSS không cung cấp cách gốc để gán văn bản thay thế, và do đó hình ảnh được biểu diễn bởi gradient hình nón sẽ không thể truy cập được đối với người dùng trình đọc màn hình. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả ngữ nghĩa trong tài liệu.

- [MDN Hiểu WCAG, Hướng dẫn 1.1 giải thích](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Hiểu Tiêu chí Thành công 1.1.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Ví dụ

### Gradient ở góc 40 độ

```css hidden
div {
  width: 100px;
  height: 100px;
}
```

```html hidden
<div></div>
```

```css
div {
  background-image: conic-gradient(from 40deg, white, black);
}
```

{{EmbedLiveSample("Gradient_at_40-degrees", 120, 120)}}

### Gradient lệch tâm

```css hidden
div {
  width: 100px;
  height: 100px;
}
```

```html hidden
<div></div>
```

```css
div {
  background: conic-gradient(from 0deg at 0% 25%, blue, green, yellow 180deg);
}
```

{{EmbedLiveSample("Off-centered_gradient", 120, 120)}}

### Biểu đồ hình tròn gradient

Ví dụ này sử dụng các điểm dừng màu nhiều vị trí, với các màu kề nhau có cùng giá trị điểm dừng màu, tạo ra hiệu ứng sọc.

```css hidden
div {
  width: 100px;
  height: 100px;
}
```

```html hidden
<div></div>
```

```css
div {
  background: conic-gradient(red 36deg, orange 36deg 170deg, yellow 170deg);
  border-radius: 50%;
}
```

{{EmbedLiveSample("Gradient_pie-chart", 120, 120)}}

### Bàn cờ

```css hidden
div {
  width: 100px;
  height: 100px;
}
```

```html hidden
<div></div>
```

```css
div {
  background: conic-gradient(
      white 0.25turn,
      black 0.25turn 0.5turn,
      white 0.5turn 0.75turn,
      black 0.75turn
    )
    top left / 25% 25% repeat;
  border: 1px solid;
}
```

{{EmbedLiveSample("Checkerboard", 120, 120)}}

### Nội suy với hue

```html hidden
<div class="shorter"></div>
<div class="longer"></div>
```

```css hidden
div {
  display: inline-block;
  margin-top: 1rem;
  width: 45vw;
  height: 80vh;
}

.shorter::before {
  content: "shorter hue";
  display: block;
  margin-top: -1rem;
}

.longer::before {
  content: "longer hue";
  display: block;
  margin-top: -1rem;
}
```

Trong ví dụ nội suy này, hệ thống màu [hsl](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) đang được sử dụng và [hue](/vi/docs/Web/CSS/Reference/Values/hue) đang được nội suy.

```css
.shorter {
  background-image: conic-gradient(in hsl shorter hue, red, blue);
}

.longer {
  background-image: conic-gradient(in hsl longer hue, red, blue);
}
```

Hộp bên trái sử dụng [nội suy shorter](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#shorter), nghĩa là màu sắc đi thẳng từ đỏ sang xanh lam sử dụng cung ngắn hơn trên [vòng màu sắc](/vi/docs/Glossary/Color_wheel). Hộp bên phải sử dụng [nội suy longer](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#longer), nghĩa là màu sắc đi từ đỏ sang xanh lam sử dụng cung dài hơn, đi qua xanh lá, vàng và cam.

{{EmbedLiveSample("Interpolating with hue", 240, 200)}}

### Thêm ví dụ conic-gradient

Vui lòng xem [Sử dụng gradient CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng gradient CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm gradient khác: {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}, {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("image")}}
- {{cssxref("image/image","image()")}}
- {{cssxref("element()")}}
- {{cssxref("image/image-set","image-set()")}}
- {{cssxref("cross-fade()")}}
