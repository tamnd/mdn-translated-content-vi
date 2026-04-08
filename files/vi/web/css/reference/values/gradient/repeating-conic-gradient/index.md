---
title: repeating-conic-gradient()
slug: Web/CSS/Reference/Values/gradient/repeating-conic-gradient
page-type: css-function
browser-compat: css.types.gradient.repeating-conic-gradient
sidebar: cssref
---

Hàm **`repeating-conic-gradient()`** trong [CSS](/vi/docs/Web/CSS) tạo ra một hình ảnh bao gồm gradient lặp lại (thay vì [gradient đơn lẻ](/vi/docs/Web/CSS/Reference/Values/gradient/conic-gradient)) với các chuyển đổi màu xoay quanh một điểm trung tâm (thay vì [tỏa ra từ trung tâm](/vi/docs/Web/CSS/Reference/Values/gradient/repeating-radial-gradient)).

{{InteractiveExample("CSS Demo: repeating-conic-gradient()")}}

```css interactive-example-choice
background: repeating-conic-gradient(red 0%, yellow 15%, red 33%);
```

```css interactive-example-choice
background: repeating-conic-gradient(
  from 45deg at 10% 50%,
  brown 0deg 10deg,
  darkgoldenrod 10deg 20deg,
  chocolate 20deg 30deg
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
/* Ngôi sao bùng nổ: ngôi sao bùng nổ màu xanh lam trên nền xanh lam: gradient
   là ngôi sao bùng nổ gồm màu xanh lam sáng và tối hơn,
   đặt ở tâm góc trên bên trái,
   lệch 3 độ để không có đường thẳng đứng */
repeating-conic-gradient(
  from 3deg at 25% 25%,
  hsl(200 100% 50%) 0deg 15deg,
  hsl(200 100% 60%) 10deg 30deg
)

/* Nội suy trong không gian màu cực
  với phương pháp nội suy màu sắc ngắn hơn */
repeating-conic-gradient(in hsl shorter hue, red, blue 90deg, green 180deg)
```

### Giá trị

- {{cssxref("angle")}}
  - : Preceded by the `from` keyterm, and taking an angle as its value, defines the gradient rotation in clockwise direction.
- `<position>`
  - : Using the same length, order and keyterm values as the [background-position](/vi/docs/Web/CSS/Reference/Properties/background-position) property, the position defines center of the gradient. If omitted, the default value is `center`, meaning the gradient will be centered.
- `<angular-color-stop>`
  - : Giá trị {{CSSxRef("&lt;color&gt;")}} của điểm dừng màu, theo sau là một hoặc hai vị trí dừng tùy chọn (một {{cssxref("angle")}} dọc theo trục chu vi của gradient). Góc điểm dừng màu cuối cùng trừ góc điểm dừng màu đầu tiên xác định kích thước của gradient lặp lại.
- `<color-hint>`
  - : Gợi ý {{Glossary("interpolation")}} xác định cách gradient tiến triển giữa các điểm dừng màu liền kề. Độ dài xác định điểm nào giữa hai điểm dừng màu mà màu gradient sẽ đạt đến điểm giữa của quá trình chuyển đổi màu. Nếu bỏ qua, điểm giữa của quá trình chuyển đổi màu là điểm giữa giữa hai điểm dừng màu.

> [!NOTE]
> Việc render điểm dừng màu trong repeating conic gradient tuân theo các quy tắc giống như [điểm dừng màu trong linear gradient](/vi/docs/Web/CSS/Reference/Values/gradient/linear-gradient#composition_of_a_linear_gradient).

## Mô tả

Ví dụ về repeating conic gradient bao gồm các ngôi sao bùng nổ. Kết quả của hàm `repeating-conic-gradient()` là một đối tượng của kiểu dữ liệu {{cssxref("gradient")}}, đây là một loại {{cssxref("image")}} đặc biệt.

Nếu cả điểm dừng màu đầu tiên lẫn điểm dừng màu cuối cùng đều không có góc điểm dừng màu lớn hơn 0deg hoặc nhỏ hơn 360 độ tương ứng, conic-gradient sẽ không lặp lại.

Như với bất kỳ gradient nào, repeating-conic gradient [không có kích thước nội tại](/vi/docs/Web/CSS/Reference/Values/image#description); tức là, nó không có kích thước tự nhiên hoặc ưu tiên, cũng không có tỷ lệ ưu tiên. Kích thước thực tế của nó sẽ khớp với kích thước của phần tử mà nó áp dụng, hoặc kích thước mà `<image>` được đặt nếu nó được đặt thành thứ gì đó khác với kích thước phần tử.

Vì `<gradient>` thuộc kiểu dữ liệu `<image>`, chúng chỉ có thể được dùng ở những nơi `<image>` có thể được dùng. Vì lý do này, `repeating-conic-gradient()` sẽ không hoạt động trên {{CSSxRef("background-color")}} và các thuộc tính khác dùng kiểu dữ liệu {{CSSxRef("&lt;color&gt;")}}.

> [!NOTE]
> Để tạo conic gradient không lặp lại, hãy làm cho gradient xoay đầy đủ 360 độ, hoặc dùng hàm {{cssxref("gradient/conic-gradient", "conic-gradient()")}} thay thế.

### Hiểu về repeating conic gradient

Cú pháp repeating-conic-gradient tương tự như cú pháp {{cssxref("gradient/conic-gradient", "conic-gradient()")}} và {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}. Giống như conic-gradient không lặp lại, các điểm dừng màu được đặt xung quanh một cung gradient. Giống như repeating radial gradient, kích thước của phần lặp lại là điểm dừng màu đầu tiên trừ đi góc của điểm dừng màu cuối cùng.

![So sánh các điểm dừng màu cho repeating và non-repeating conic và radial gradient](repeatingconicgradient.png)

Các gradient ở trên được xác định là một phần ba xanh lam, một phần ba đỏ, và một phần ba vàng.

```css
repeating-conic-gradient(from 0deg, red 0deg 30deg, yellow 30deg 60deg, blue 60deg 90deg);

repeating-radial-gradient(red 0 8%, yellow 8% 16%, blue 16% 24%);

conic-gradient(red 120deg, yellow 120deg 240deg, blue 240deg);

radial-gradient(red 33%, yellow 33% 66%, blue 66%);
```

Để một repeating gradient lặp lại, chúng ta xác định điểm dừng màu đầu tiên và cuối cùng. Giống như trong các gradient không lặp lại, điểm dừng màu đầu tiên và cuối cùng được giả định là 0 và 100% hoặc 360deg nếu không được khai báo rõ ràng. Khi mặc định theo các giá trị này, cung lặp lại là 360 độ, và do đó không lặp lại.

Giống như conic gradient không lặp lại, các điểm dừng màu được đặt xung quanh một cung gradient — chu vi của một vòng tròn, thay vì trên đường gradient xuất phát từ tâm gradient. Các màu chuyển đổi như thể xoay quanh tâm của một vòng tròn, bắt đầu từ trên cùng nếu không có `from <angle>` được khai báo, và đi theo chiều kim đồng hồ trong kích thước của góc là sự khác biệt giữa góc màu lớn nhất và nhỏ nhất, sau đó lặp lại.

Repeating conic gradient được chỉ định bằng cách chỉ ra góc xoay, tâm của gradient, sau đó chỉ định danh sách điểm dừng màu. Giống như conic gradient không lặp lại, các điểm dừng màu của repeating conic gradient được chỉ định với {{cssxref('angle')}}. Các đơn vị bao gồm `deg` cho độ, `grad` cho gradian, `rad` cho radian, và `turn` cho vòng. Có 360 độ, 400 gradian, 2π radian, và 1 vòng trong một vòng tròn. Các trình duyệt hỗ trợ repeating conic gradient cũng chấp nhận giá trị phần trăm, với 100% tương đương 360 độ, nhưng điều này không có trong đặc tả kỹ thuật.

Cú pháp gradient hướng tâm và hình nón cho phép định vị tâm của gradient ở bất kỳ đâu trong hoặc thậm chí bên ngoài hình ảnh. Các giá trị cho vị trí tương tự như cú pháp cho {{cssxref('background-position')}} hai giá trị.

Cung gradient là một phần của chu vi của gradient. 0 độ là phía bắc, hoặc 12:00 chiều. Màu sắc của gradient được xác định bởi các điểm dừng màu theo góc, điểm bắt đầu, điểm kết thúc, và giữa chúng là các điểm dừng màu theo góc tùy chọn. Các chuyển đổi giữa các màu có thể được thay đổi bằng các gợi ý màu giữa các điểm dừng màu của các màu liền kề.

#### Tùy chỉnh gradient

Bằng cách thêm nhiều điểm dừng màu theo góc hơn trên cung gradient, bạn có thể tạo ra sự chuyển đổi được tùy chỉnh cao giữa nhiều màu sắc. Vị trí của điểm dừng màu có thể được xác định rõ ràng bằng cách dùng {{cssxref("angle")}}. Nếu bạn không chỉ định vị trí của điểm dừng màu, nó được đặt ở giữa điểm trước nó và điểm sau nó. Giống như gradient không lặp lại, nếu bạn không chỉ định góc cho điểm dừng màu đầu tiên hoặc cuối cùng, các giá trị sẽ là 0deg và 360deg. Nếu bạn không khai báo góc cho cả hai, bạn sẽ nhận được conic gradient không lặp lại. Nếu bạn khai báo góc không phải 0 hoặc 360 độ cho đầu tiên hoặc cuối cùng tương ứng, gradient sẽ lặp lại dựa trên giá trị đó. Hai gradient sau là tương đương:

```css
repeating-conic-gradient(red, orange, yellow, green, blue 50%);
repeating-conic-gradient(from -45deg, red 45deg, orange, yellow, green, blue 225deg)
```

Theo mặc định, màu chuyển đổi mượt mà từ màu tại một điểm dừng màu đến màu tại điểm dừng màu tiếp theo, với điểm giữa giữa các màu là điểm giữa của quá trình chuyển đổi màu. Bạn có thể di chuyển điểm giữa chuyển đổi màu này đến bất kỳ điểm nào giữa hai điểm dừng màu bằng cách thêm gợi ý màu, chỉ ra nơi điểm giữa của quá trình chuyển đổi màu nên nằm.

Nếu hai hoặc nhiều điểm dừng màu ở cùng vị trí, quá trình chuyển đổi sẽ là một đường cứng giữa màu đầu tiên và màu cuối cùng được khai báo tại vị trí đó.

Mặc dù bạn có thể kết hợp các đơn vị góc khác nhau, đừng làm vậy. Điều đó làm cho CSS khó đọc.

## Cú pháp chính thức

{{CSSSyntax}}

## Khả năng tiếp cận

Các trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt gì cho người dùng của nó. Mặc dù có thể tạo biểu đồ tròn, bàn cờ và các hiệu ứng khác với conic gradient, các hình ảnh CSS không cung cấp cách gốc nào để gán văn bản thay thế, và do đó hình ảnh được đại diện bởi conic gradient sẽ không thể tiếp cận được với người dùng trình đọc màn hình. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó về mặt ngữ nghĩa trong tài liệu.

- [MDN Hiểu WCAG, Giải thích Hướng dẫn 1.1](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Hiểu Tiêu chí Thành công 1.1.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Ví dụ

### Ngôi sao bùng nổ đen trắng

```css hidden
div {
  width: 200px;
  height: 200px;
}
```

```html hidden
<div></div>
```

```css
div {
  background-image: repeating-conic-gradient(white 0 9deg, black 9deg 18deg);
}
```

{{EmbedLiveSample("Black_and_white_starburst", 220, 220)}}

### Gradient lệch tâm

Gradient này lặp lại 18 lần, nhưng vì chúng ta chỉ thấy nửa bên phải, chúng ta chỉ thấy 9 lần lặp.

```css hidden
div {
  width: 200px;
  height: 200px;
}
```

```html hidden
<div></div>
```

```css
div {
  background: repeating-conic-gradient(
    from 3deg at 25% 25%,
    green,
    blue 2deg 5deg,
    green,
    yellow 15deg 18deg,
    green 20deg
  );
}
```

{{EmbedLiveSample("Off-centered_gradient", 220, 220)}}

### Nội suy với màu sắc

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

Trong ví dụ nội suy này, hệ màu [hsl](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) đang được sử dụng và [màu sắc](/vi/docs/Web/CSS/Reference/Values/hue) đang được nội suy.

```css
.shorter {
  background-image: repeating-conic-gradient(
    in hsl shorter hue,
    red,
    blue 180deg
  );
}

.longer {
  background-image: repeating-conic-gradient(
    in hsl longer hue,
    red,
    blue 180deg
  );
}
```

Hộp bên trái sử dụng [nội suy ngắn hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#shorter), có nghĩa là màu đi thẳng từ đỏ đến xanh lam bằng cung ngắn hơn trên [bánh xe màu](/vi/docs/Glossary/Color_wheel). Hộp bên phải sử dụng [nội suy dài hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#longer), có nghĩa là màu đi từ đỏ đến xanh lam bằng cung dài hơn, đi qua các màu xanh lá, vàng, và cam.

{{EmbedLiveSample("Interpolating with hue", 240, 200)}}

### Thêm ví dụ về repeating-conic-gradient

Vui lòng xem [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm gradient khác: {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("image")}}
- {{cssxref("image/image","image()")}}
- {{cssxref("element()")}}
- {{cssxref("image/image-set","image-set()")}}
- {{cssxref("cross-fade()")}}
