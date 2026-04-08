---
title: repeating-radial-gradient()
slug: Web/CSS/Reference/Values/gradient/repeating-radial-gradient
page-type: css-function
browser-compat: css.types.gradient.repeating-radial-gradient
sidebar: cssref
---

Hàm **`repeating-radial-gradient()`** của [CSS](/vi/docs/Web/CSS) tạo ra một hình ảnh gồm các độ dốc màu lặp lại tỏa ra từ một điểm gốc. Nó tương tự như {{cssxref("gradient/radial-gradient", "radial-gradient()")}} và nhận cùng các tham số, nhưng lặp lại các điểm dừng màu vô hạn theo mọi hướng để bao phủ toàn bộ phần tử chứa nó, tương tự như {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}. Kết quả của hàm là một đối tượng thuộc kiểu dữ liệu {{cssxref("gradient")}}, vốn là một loại {{cssxref("image")}} đặc biệt.

{{InteractiveExample("CSS Demo: repeating-radial-gradient()")}}

```css interactive-example-choice
background: repeating-radial-gradient(#e66465, #9198e5 20%);
```

```css interactive-example-choice
background: repeating-radial-gradient(closest-side, #3f87a6, #ebf8e1, #f69d3c);
```

```css interactive-example-choice
background: repeating-radial-gradient(
  circle at 100%,
  #333333,
  #333333 10px,
  #eeeeee 10px,
  #eeeeee 20px
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

Với mỗi lần lặp, vị trí của các điểm dừng màu được dịch chuyển theo bội số của kích thước độ dốc hướng tâm cơ bản (khoảng cách giữa điểm dừng màu cuối cùng và điểm dừng màu đầu tiên). Do đó, vị trí của mỗi điểm dừng màu cuối cùng trùng khớp với điểm dừng màu bắt đầu; nếu các giá trị màu khác nhau, sẽ tạo ra sự chuyển đổi trực quan sắc nét, có thể giảm thiểu bằng cách lặp lại màu đầu tiên như màu cuối cùng.

Như với bất kỳ độ dốc màu nào, độ dốc hướng tâm lặp lại [không có kích thước cố hữu](/vi/docs/Web/CSS/Reference/Values/image#description); tức là nó không có kích thước tự nhiên hay ưu tiên, cũng không có tỉ lệ ưu tiên. Kích thước cụ thể của nó sẽ khớp với kích thước của phần tử mà nó áp dụng.

Vì các `<gradient>` thuộc kiểu dữ liệu `<image>`, chúng chỉ có thể được sử dụng ở nơi có thể sử dụng `<image>`. Vì lý do này, `repeating-radial-gradient()` sẽ không hoạt động trên {{cssxref("background-color")}} và các thuộc tính khác sử dụng kiểu dữ liệu {{cssxref("&lt;color&gt;")}}.

## Cú pháp

```css
/* Độ dốc ở trung tâm phần tử chứa,
   bắt đầu màu đỏ, chuyển sang màu xanh dương và kết thúc màu xanh lá,
   với các màu lặp lại mỗi 30px */
repeating-radial-gradient(circle at center, red 0, blue, green 30px)

/* Độ dốc hình elip gần góc trên bên trái của phần tử chứa,
   bắt đầu màu đỏ, chuyển sang màu xanh lá và trở lại,
   lặp lại năm lần giữa tâm và góc dưới bên phải,
   và chỉ một lần giữa tâm và góc trên bên trái */
repeating-radial-gradient(farthest-corner at 20% 20%, red 0, green, red 20%)
```

### Giá trị

- {{cssxref("&lt;position&gt;")}}
  - : Vị trí của độ dốc, được diễn giải theo cách tương tự như {{cssxref("background-position")}} hoặc {{cssxref("transform-origin")}}. Nếu không được chỉ định, mặc định là `center`.
- `<shape>`
  - : Hình dạng của độ dốc. Giá trị có thể là `circle` (nghĩa là hình dạng độ dốc là hình tròn với bán kính cố định) hoặc `ellipse` (nghĩa là hình dạng là hình elip căn chỉnh theo trục). Nếu không được chỉ định, mặc định là `ellipse`.
- `<extent-keyword>`
  - : Từ khóa mô tả kích thước của hình dạng kết thúc. Các giá trị có thể là:

    | Từ khóa           | Mô tả                                                                                                                                                                                      |
    | ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
    | `closest-side`    | Hình dạng kết thúc của độ dốc tiếp xúc với cạnh hộp gần nhất với tâm của nó (đối với hình tròn) hoặc tiếp xúc với cả hai cạnh dọc và ngang gần tâm nhất (đối với hình elip).              |
    | `closest-corner`  | Hình dạng kết thúc của độ dốc được định kích thước để tiếp xúc chính xác với góc hộp gần tâm nhất.                                                                                        |
    | `farthest-side`   | Tương tự như `closest-side`, ngoại trừ hình dạng kết thúc được định kích thước để tiếp xúc với cạnh hộp xa nhất so với tâm của nó (hoặc các cạnh dọc và ngang).                           |
    | `farthest-corner` | Hình dạng kết thúc của độ dốc được định kích thước để tiếp xúc chính xác với góc hộp xa tâm nhất.                                                                                         |

    > [!NOTE]
    > Các triển khai ban đầu của hàm này bao gồm các từ khóa khác (`cover` và `contain`) như từ đồng nghĩa của `farthest-corner` và `closest-side` tiêu chuẩn. Chỉ sử dụng các từ khóa tiêu chuẩn, vì một số triển khai đã bỏ các biến thể cũ đó.

- `<color-stop>`
  - : Giá trị {{cssxref("&lt;color&gt;")}} của điểm dừng màu, theo sau là vị trí dừng tùy chọn (là {{cssxref("&lt;percentage&gt;")}} hoặc {{cssxref("&lt;length&gt;")}} dọc theo trục độ dốc). Phần trăm `0%` hoặc độ dài `0` đại diện cho tâm của độ dốc; giá trị `100%` đại diện cho giao điểm của hình dạng kết thúc với tia độ dốc ảo. Các giá trị phần trăm ở giữa được định vị tuyến tính trên tia độ dốc ảo.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Độ dốc đen và trắng

```html hidden
<div class="radial-gradient"></div>
```

```css hidden
.radial-gradient {
  width: 120px;
  height: 120px;
}
```

```css
.radial-gradient {
  background: repeating-radial-gradient(
    black,
    black 5px,
    white 5px,
    white 10px
  );
}
```

{{EmbedLiveSample('Black_and_white_gradient', 120, 120)}}

### Farthest-corner

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
  background: repeating-radial-gradient(
    ellipse farthest-corner at 20% 20%,
    red,
    black 5%,
    blue 5%,
    green 10%
  );
  background: repeating-radial-gradient(
    ellipse farthest-corner at 20% 20%,
    red 0 5%,
    green 5% 10%
  );
}
```

{{EmbedLiveSample('Farthest-corner', 120, 120)}}

Độ dốc hình elip sẽ được căn giữa ở 20% từ góc trên bên trái, và sẽ lặp lại 10 lần giữa tâm và góc xa nhất (góc dưới bên phải). Các trình duyệt hỗ trợ điểm dừng màu đa vị trí sẽ hiển thị một hình elip sọc đỏ và xanh lá. Các trình duyệt chưa hỗ trợ cú pháp này sẽ thấy một độ dốc đi từ đỏ sang đen rồi từ xanh dương sang xanh lá.

### Nội suy với sắc độ

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

Trong ví dụ nội suy này, hệ màu [hsl](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) được sử dụng và [sắc độ](/vi/docs/Web/CSS/Reference/Values/hue) được nội suy.

```css
.shorter {
  background-image: repeating-radial-gradient(
    circle at center in hsl shorter hue,
    red 30px,
    blue 60px
  );
}

.longer {
  background-image: repeating-radial-gradient(
    circle at center in hsl longer hue,
    red 30px,
    blue 60px
  );
}
```

Hộp bên trái sử dụng [nội suy ngắn hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#shorter), nghĩa là màu đi từ đỏ sang xanh dương theo cung ngắn hơn trên [bánh xe màu](/vi/docs/Glossary/Color_wheel). Hộp bên phải sử dụng [nội suy dài hơn](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#longer), nghĩa là màu đi từ đỏ sang xanh dương theo cung dài hơn, đi qua màu xanh lá, vàng và cam.

{{EmbedLiveSample("Interpolating with hue", 240, 200)}}

> [!NOTE]
> Vui lòng xem [Sử dụng độ dốc màu CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients) để có thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng độ dốc màu CSS](/vi/docs/Web/CSS/Guides/Images/Using_gradients)
- Các hàm độ dốc khác: {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("image")}}
- {{cssxref("image/image","image()")}}
- {{cssxref("element()")}}
- {{cssxref("image/image-set","image-set()")}}
- {{cssxref("cross-fade()")}}
