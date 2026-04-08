---
title: radial-gradient()
slug: Web/CSS/Reference/Values/gradient/radial-gradient
page-type: css-function
browser-compat: css.types.gradient.radial-gradient
sidebar: cssref
---

Hàm **`radial-gradient()`** trong [CSS](/vi/docs/Web/CSS) tạo ra một hình ảnh bao gồm sự chuyển đổi dần dần giữa hai hoặc nhiều màu sắc tỏa ra từ một điểm gốc. Hình dạng của nó có thể là một hình tròn hoặc hình ellipse. Kết quả của hàm là một đối tượng của kiểu dữ liệu {{cssxref("gradient")}}, đây là một loại {{cssxref("image")}} đặc biệt.

{{InteractiveExample("CSS Demo: radial-gradient()")}}

```css interactive-example-choice
background: radial-gradient(#e66465, #9198e5);
```

```css interactive-example-choice
background: radial-gradient(closest-side, #3f87a6, #ebf8e1, #f69d3c);
```

```css interactive-example-choice
background: radial-gradient(
  circle at 100%,
  #333333,
  #333333 50%,
  #eeeeee 75%,
  #333333 75%
);
```

```css interactive-example-choice
background:
  radial-gradient(ellipse at top, #e66465, transparent),
  radial-gradient(ellipse at bottom, #4d9f0c, transparent);
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
radial-gradient(red)

/* Gradient ở trung tâm của vùng chứa,
   bắt đầu bằng màu đỏ, chuyển sang màu xanh lam, và kết thúc bằng màu xanh lá */
radial-gradient(circle at center, red 0, blue, green 100%)

/* Không gian màu hsl với nội suy màu sắc dài hơn */
radial-gradient(circle at center in hsl longer hue, red 0, blue, green 100%)
```

Radial gradient được chỉ định bằng cách chỉ ra tâm của gradient (nơi ellipse 0% sẽ nằm) và kích thước và hình dạng của _hình dạng kết thúc_ (ellipse 100%).

### Giá trị

- {{cssxref("&lt;position&gt;")}}
  - : Vị trí của gradient, được giải thích theo cách giống như {{cssxref("background-position")}} hoặc {{cssxref("transform-origin")}}. Nếu không được chỉ định, mặc định là `center`.
- `<ending-shape>`
  - : Hình dạng kết thúc của gradient. Giá trị có thể là `circle` (có nghĩa là hình dạng gradient là hình tròn với bán kính không đổi) hoặc `ellipse` (có nghĩa là hình dạng là hình ellipse căn chỉnh theo trục). Nếu không được chỉ định, mặc định là `ellipse`.
- `<size>`
  - : Xác định kích thước của hình dạng kết thúc của gradient. Nếu bỏ qua, mặc định là farthest-corner. Nó có thể được cho rõ ràng hoặc bằng từ khóa. Để phục vụ cho các định nghĩa từ khóa, hãy xem các cạnh hộp gradient kéo dài vô hạn theo cả hai hướng, thay vì là các đoạn đường hữu hạn.

    Cả gradient hình tròn và hình ellipse đều chấp nhận các từ khóa sau cho `<size>`:

    | Từ khóa           | Mô tả                                                                                                                                                                                    |
    | ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `closest-side`    | Hình dạng kết thúc của gradient gặp cạnh hộp gần nhất với tâm của nó (đối với hình tròn) hoặc gặp cả cạnh dọc và ngang gần nhất với tâm (đối với hình ellipse). |
    | `closest-corner`  | Hình dạng kết thúc của gradient được định kích thước sao cho nó khớp chính xác với góc gần nhất của hộp từ tâm của nó.                                                                  |
    | `farthest-side`   | Tương tự như `closest-side`, ngoại trừ hình dạng kết thúc được định kích thước để gặp cạnh hộp xa nhất với tâm của nó (hoặc cạnh dọc và ngang).                                        |
    | `farthest-corner` | Giá trị mặc định, hình dạng kết thúc của gradient được định kích thước sao cho nó khớp chính xác với góc xa nhất của hộp từ tâm của nó.                                                |

    Nếu `<ending-shape>` được chỉ định là `circle`, kích thước có thể được cho rõ ràng là {{cssxref("length")}}, cung cấp bán kính hình tròn rõ ràng. Giá trị âm không hợp lệ.

    Nếu `<ending-shape>` được chỉ định là `ellipse`, kích thước có thể được cho là {{cssxref("length-percentage")}} với hai giá trị để cung cấp kích thước ellipse rõ ràng. Giá trị đầu tiên đại diện cho bán kính ngang và giá trị thứ hai là bán kính dọc. Giá trị phần trăm tương đối so với chiều tương ứng của hộp gradient. Giá trị âm không hợp lệ.

    Khi từ khóa `<ending-shape>` bị bỏ qua, hình dạng gradient được xác định bởi kích thước đã cho. Một giá trị `<length>` tạo ra hình tròn, trong khi hai giá trị trong đơn vị `<length-percentage>` tạo ra hình ellipse. Một giá trị `<percentage>` đơn lẻ không hợp lệ.

- `<linear-color-stop>`
  - : Giá trị {{cssxref("&lt;color&gt;")}} của điểm dừng màu, theo sau là một hoặc hai vị trí dừng tùy chọn (một {{cssxref("&lt;percentage&gt;")}} hoặc {{cssxref("&lt;length&gt;")}} dọc theo trục gradient). Phần trăm `0%`, hoặc độ dài `0`, đại diện cho tâm của gradient; giá trị `100%` đại diện cho giao điểm của hình dạng kết thúc với tia gradient ảo. Các giá trị phần trăm ở giữa được đặt tuyến tính trên tia gradient. Bao gồm hai vị trí dừng tương đương với việc khai báo hai điểm dừng màu với cùng màu tại hai vị trí.
- `<color-hint>`
  - : Gợi ý màu là gợi ý nội suy xác định cách gradient tiến triển giữa các điểm dừng màu liền kề. Độ dài xác định điểm nào giữa hai điểm dừng màu mà màu gradient sẽ đạt đến điểm giữa của quá trình chuyển đổi màu. Nếu bỏ qua, điểm giữa của quá trình chuyển đổi màu là điểm giữa giữa hai điểm dừng màu.

## Mô tả

Như với bất kỳ gradient nào, radial gradient [không có kích thước nội tại](/vi/docs/Web/CSS/Reference/Values/image#description); tức là, nó không có kích thước tự nhiên hoặc ưu tiên, cũng không có tỷ lệ ưu tiên. Kích thước thực tế của nó sẽ khớp với kích thước của phần tử mà nó áp dụng.

Để tạo radial gradient lặp lại để lấp đầy vùng chứa, hãy dùng hàm {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}} thay thế.

Vì `<gradient>` thuộc kiểu dữ liệu `<image>`, chúng chỉ có thể được dùng ở những nơi `<image>` có thể được dùng. Vì lý do này, `radial-gradient()` sẽ không hoạt động trên {{Cssxref("background-color")}} và các thuộc tính khác dùng kiểu dữ liệu {{cssxref("&lt;color&gt;")}}.

### Thành phần của radial gradient

![Đồ thị giải thích radial gradient: tia bức xạ ảo là nằm ngang bắt đầu từ điểm giữa. Gradient hình ellipse, và do đó hình dạng kết thúc, có cùng tỷ lệ khung hình với hộp mà nó được khai báo.](radial_gradient.png)

Radial gradient được xác định bởi _điểm trung tâm_, _hình dạng kết thúc_, và hai hoặc nhiều _điểm dừng màu_.

Để tạo gradient mượt mà, hàm `radial-gradient()` vẽ một loạt các hình dạng đồng tâm tỏa ra từ tâm đến _hình dạng kết thúc_ (và có thể xa hơn). Hình dạng kết thúc có thể là hình tròn hoặc hình ellipse.

Các điểm dừng màu được đặt trên một _tia gradient ảo_ kéo dài ngang từ tâm về phía phải. Các vị trí điểm dừng màu dựa trên phần trăm tương đối so với giao điểm giữa hình dạng kết thúc và tia gradient này, đại diện cho `100%`. Mỗi hình dạng là một màu duy nhất được xác định bởi màu trên tia gradient mà nó giao nhau.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Gradient cơ bản

```html hidden
<div class="radial-gradient"></div>
```

```css hidden
.radial-gradient {
  width: 240px;
  height: 120px;
}
```

```css
.radial-gradient {
  background-image: radial-gradient(cyan 0%, transparent 20%, salmon 40%);
}
```

{{EmbedLiveSample('Basic_gradient', 120, 120)}}

### Gradient không ở trung tâm

```html hidden
<div class="radial-gradient"></div>
```

```css hidden
.radial-gradient {
  width: 240px;
  height: 120px;
}
```

```css
.radial-gradient {
  background-image: radial-gradient(
    farthest-corner at 40px 40px,
    #ff3355 0%,
    #4433ee 100%
  );
}
```

{{EmbedLiveSample('Non-centered_gradient', 240, 120)}}

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
  background-image: radial-gradient(
    circle at center in hsl shorter hue,
    red,
    blue
  );
}

.longer {
  background-image: radial-gradient(
    circle at center in hsl longer hue,
    red,
    blue
  );
}
```

Hộp bên trái sử dụng [nội suy ngắn hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#shorter), có nghĩa là màu đi thẳng từ đỏ đến xanh lam bằng cung ngắn hơn trên [bánh xe màu](/vi/docs/Glossary/Color_wheel). Hộp bên phải sử dụng [nội suy dài hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#longer), có nghĩa là màu đi từ đỏ đến xanh lam bằng cung dài hơn, đi qua các màu xanh lá, vàng, và cam.

{{EmbedLiveSample("Interpolating with hue", 240, 200)}}

### Thêm ví dụ về radial-gradient

Vui lòng xem [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS gradients](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm gradient khác: {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("image")}}
- {{cssxref("image/image","image()")}}
- {{cssxref("element()")}}
- {{cssxref("image/image-set","image-set()")}}
- {{cssxref("cross-fade()")}}
