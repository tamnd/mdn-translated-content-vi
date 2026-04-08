---
title: rgb()
slug: Web/CSS/Reference/Values/color_value/rgb
page-type: css-function
browser-compat: css.types.color.rgb
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-RGB
  - https://drafts.csswg.org/css-color/#rgb-functions
sidebar: cssref
---

> [!NOTE]
> Ký hiệu hàm `rgba()` là bí danh của `rgb()`. Chúng hoàn toàn tương đương nhau. Khuyến nghị sử dụng `rgb()`.

Ký hiệu hàm **`rgb()`** biểu diễn màu sắc trong {{glossary("RGB", "sRGB")}} {{glossary("color space", "không gian màu")}} theo các thành phần đỏ, xanh lá và xanh lam. Thành phần alpha tùy chọn biểu diễn độ trong suốt của màu.

{{InteractiveExample("CSS Demo: rgb()")}}

```css interactive-example-choice
background: rgb(31 120 50);
```

```css interactive-example-choice
background: rgb(30% 20% 50%);
```

```css interactive-example-choice
background: rgb(255 122 127 / 80%);
```

```css interactive-example-choice
background: rgb(255 122 127 / 0.2);
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  min-width: 100%;
  min-height: 100%;
  padding: 10%;
}
```

## Cú pháp

```css
/* Giá trị tuyệt đối */
rgb(255 255 255)
rgb(255 255 255 / 50%)

/* Giá trị tương đối */
rgb(from green r g b / 0.5)
rgb(from #123456 calc(r + 40) calc(g + 40) b)
rgb(from hwb(120deg 10% 20%) r g calc(b + 200))

/* Bí danh 'rgba()' cũ */
rgba(0 255 255)

/* Định dạng cũ */
rgb(0, 255, 255)
rgb(0, 255, 255, 50%)
```

> [!NOTE]
> Vì lý do tương thích, các giá trị màu được tuần tự hóa bởi [Web API](/vi/docs/Web/API/Window/getComputedStyle) được biểu diễn dưới dạng màu `rgb()` nếu giá trị kênh alpha chính xác là 1, và màu `rgba()` trong các trường hợp khác. Trong cả hai trường hợp, cú pháp cũ được sử dụng, với dấu phẩy làm dấu phân cách (ví dụ `rgb(255, 0, 0)`).

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

#### Cú pháp giá trị tuyệt đối

```plain
rgb(R G B[ / A])
```

Các tham số như sau:

- `R`, `G`, `B`
  - : Mỗi giá trị có thể được biểu diễn dưới dạng {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `255`, {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Các giá trị này lần lượt biểu diễn các kênh đỏ, xanh lá và xanh lam.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

#### Cú pháp giá trị tương đối

```plain
rgb(from <color> R G B[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**: Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.
- `R`, `G`, `B`
  - : Mỗi giá trị có thể được biểu diễn dưới dạng {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `255`, {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Các giá trị này lần lượt biểu diễn giá trị kênh đỏ, xanh lá và xanh lam của màu đầu ra.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Để đại diện đầy đủ cho toàn bộ phổ màu nhìn thấy được, đầu ra của hàm màu `rgb()` tương đối được tuần tự hóa thành `color(srgb)`. Điều đó có nghĩa là khi truy vấn giá trị màu đầu ra thông qua thuộc tính {{DOMxRef("HTMLElement.style")}} hoặc phương thức {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}} sẽ trả về màu đầu ra dưới dạng giá trị [`color(srgb ...)`](/vi/docs/Web/CSS/Reference/Values/color_value/color).

#### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `rgb()`, trình duyệt chuyển đổi màu gốc thành màu RGB tương đương (nếu nó chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `r` (đỏ), `g` (xanh lá) và `b` (xanh lam) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Các giá trị `r`, `g` và `b` đều được giải quyết thành `<number>` trong khoảng `0` đến `255` (bao gồm).
- Kênh `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa các cách này.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `rgb()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương `rgb(255 0 0)`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `r`, `g` và `b` của màu gốc (`255`, `0` và `0`) làm giá trị kênh đầu ra:

```css
rgb(from hsl(0 100% 50%) r g b)
```

Màu đầu ra của hàm này là tương đương sRGB `color()` của `rgb(255 0 0)`: `color(srgb 1 0 0)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
rgb(from hsl(0 100% 50%) 132 132 224)
```

Trong trường hợp trên, màu đầu ra là tương đương sRGB `color()` của `rgb(132 132 224)`: `color(srgb 0.517647 0.517647 0.878431)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
rgb(from hsl(0 100% 50%) r 80 80)
```

Ví dụ này:

- Chuyển đổi màu gốc (`hsl(0 100% 50%)`) thành tương đương `rgb()` (`rgb(255 0 0)`).
- Đặt giá trị kênh `R` của màu đầu ra bằng giá trị kênh `R` của tương đương `rgb()` màu gốc — `255`.
- Đặt các giá trị kênh `G` và `B` của màu đầu ra thành các giá trị mới không dựa trên màu gốc: `80` và `80`, tương ứng.

Màu đầu ra cuối cùng là tương đương của `rgb(255 80 80)` trong không gian màu sRGB — `color(srgb 1 0.313726 0.313726)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình hoặc không gian màu với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
rgb(from hsl(0 100% 50% / 0.8) r g b / alpha)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.8) */

rgb(from hsl(0 100% 50% / 0.8) r g b / 0.5)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.5) */
```

Trong ví dụ sau, màu gốc `hsl()` lại được chuyển đổi thành biểu diễn `rgb()` — `rgb(255 0 0)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `R`, `G`, `B` và `A`. Sau khi tính toán, các giá trị R, G, B và A lần lượt là `127.5`, `25`, `175` và `0.9`. Màu đầu ra cuối cùng là tương đương của `rgb(127.5 25 175 / 0.9)` trong không gian màu sRGB: `color(srgb 0.5 0.0980392 0.686275 / 0.9)`.

```css
rgb(from hsl(0 100% 50%) calc(r/2) calc(g + 25) calc(b + 175) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Cú pháp cơ bản

Trong ví dụ này, chúng ta có ba phần tử {{htmlelement("div")}} với các màu nền khác nhau được hiển thị trên nền có sọc.

#### HTML

```html
<div>
  <div id="integer"></div>
  <div id="percent"></div>
  <div id="alpha"></div>
</div>
```

#### CSS

Màu nền được đặt bằng hàm màu `rgb()`. Ba màu giống nhau. Màu thứ ba nửa trong suốt, vì vậy chúng tôi đã thêm {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}} trên phần tử {{htmlelement("body")}} để thể hiện rõ hơn độ trong suốt của kênh alpha.

```css hidden
div {
  display: flex;
  gap: 20px;
  height: 50px;
  flex: 1;
}
body {
  height: calc(100vh - 20px);
}
```

```css
body {
  background: repeating-linear-gradient(-45deg, #eeeeee 0 2px, white 2px 6px);
  padding: 10px;
}

#integer {
  background-color: rgb(189 85 218);
}

#percent {
  background-color: rgb(74% 33% 85%);
}

#alpha {
  background-color: rgb(189 85 218 / 0.25);
}
```

#### Kết quả

{{ EmbedLiveSample("Basic syntax", "100%", "75") }}

### Sử dụng màu tương đối với rgb()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử bên trái được đặt `--base-color` chưa sửa đổi, trong khi phần tử giữa và bên phải được đặt các biến thể của `--base-color` đó lần lượt bỏ bớt nhiều hơn từ kênh đỏ và thêm nhiều hơn vào kênh xanh lam.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `rgb()`, và màu đầu ra có kênh đỏ và xanh lam được sửa đổi để đạt được hiệu ứng mong muốn thông qua các hàm `calc()`, trong khi kênh xanh lá không thay đổi.

```html hidden
<div id="container">
  <div class="item" id="one"></div>
  <div class="item" id="two"></div>
  <div class="item" id="three"></div>
</div>
```

#### CSS

```css hidden
#container {
  display: flex;
  width: 100vw;
  height: 100vh;
  box-sizing: border-box;
}

.item {
  flex: 1;
  margin: 20px;
}
```

```css
:root {
  --base-color: orange;
  /* equal to rgb(255 165 0) */
}

#one {
  background-color: var(--base-color);
}

#two {
  background-color: rgb(from var(--base-color) calc(r - 76.5) g calc(b + 76.5));
  /* 76.5 is 30% of 255 */
}

#three {
  background-color: rgb(from var(--base-color) calc(r - 153) g calc(b + 153));
  /* 153 is 60% of 255 */
}

/* Use @supports to add in support for old syntax that requires r g b values to
   be specified as percentages (with units) in calculations. This is required
   for Safari 16.4+. */
@supports (color: rgb(from red r g calc(b + 30%))) {
  #two {
    background-color: rgb(from var(--base-color) calc(r - 30%) g calc(b + 30%));
  }

  #three {
    background-color: rgb(from var(--base-color) calc(r - 60%) g calc(b + 60%));
  }
}
```

#### Kết quả

{{ EmbedLiveSample("Using relative colors with rgb()", "100%", "200") }}

### Cú pháp cũ: các giá trị phân cách bằng dấu phẩy

Vì lý do cũ, hàm `rgb()` chấp nhận một dạng trong đó tất cả các giá trị được phân cách bằng dấu phẩy.

#### HTML

```html
<div class="space-separated"></div>
<div class="comma-separated"></div>
```

#### CSS

```css
div {
  width: 100px;
  height: 50px;
  margin: 1rem;
}

div.space-separated {
  background-color: rgb(255 0 0 / 50%);
}

div.comma-separated {
  background-color: rgb(255, 0, 0, 0.5);
}
```

#### Kết quả

{{EmbedLiveSample('Legacy syntax: comma-separated values', '100%', '150px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{CSSXref("&lt;color&gt;")}} để xem danh sách tất cả ký hiệu màu
- [Công cụ chuyển đổi định dạng màu](/vi/docs/Web/CSS/Guides/Colors/Color_format_converter)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
