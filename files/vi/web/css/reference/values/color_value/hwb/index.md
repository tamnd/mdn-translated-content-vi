---
title: hwb()
slug: Web/CSS/Reference/Values/color_value/hwb
page-type: css-function
browser-compat: css.types.color.hwb
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-HWB
  - https://drafts.csswg.org/css-color/#the-hwb-notation
sidebar: cssref
---

Ký hiệu hàm **`hwb()`** biểu diễn màu sắc trong {{glossary("RGB", "sRGB")}} {{glossary("color space", "không gian màu")}} theo hue (sắc), whiteness (độ trắng) và blackness (độ đen). Thành phần alpha tùy chọn biểu diễn độ trong suốt của màu.

{{InteractiveExample("CSS Demo: hwb()")}}

```css interactive-example-choice
background: hwb(12 50% 0%);
```

```css interactive-example-choice
background: hwb(50deg 30% 40%);
```

```css interactive-example-choice
background: hwb(0.5turn 10% 0% / 0.5);
```

```css interactive-example-choice
background: hwb(0 100% 0% / 50%);
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
hwb(194 0% 0%)
hwb(194 0% 0% / .5)

/* Giá trị tương đối */
hwb(from green h w b / 0.5)
hwb(from #123456 h calc(w + 30) b)
hwb(from lch(40% 70 240deg) h w calc(b - 30))
```

## Mô tả

Hàm màu này trong [không gian màu `sRGB`](/vi/docs/Glossary/Color_space#srgb) được xác định bởi giá trị góc {{cssxref("hue")}}, giá trị whiteness, giá trị blackness, và tùy chọn giá trị alpha biểu diễn độ trong suốt của màu.

Các góc tương ứng với các hue cụ thể khác nhau giữa các không gian màu sRGB (được sử dụng bởi {{CSSXref("color_value/hsl", "hsl()")}} và `hwb()`), CIELAB (được sử dụng bởi {{CSSXref("color_value/lch", "lch()")}}), và Oklab (được sử dụng bởi {{CSSXref("color_value/oklch", "oklch()")}}). `hwb()` ở cùng không gian màu với `hsl()` và do đó có cùng các góc hue màu. Xem trang tham chiếu {{cssxref("hue")}} để biết thêm chi tiết và ví dụ, hoặc thử thay đổi hue trên [bộ chọn màu](/vi/docs/Web/CSS/Guides/Colors#colors_in_action) để xem thực tế.

Màu `hwb()` hoàn toàn bão hòa khi cả whiteness (`W`) và blackness (`B`) đều là `0`. Với bất kỳ giá trị hue `H` nào, `hwb(H 0% 0%)` là cùng màu với `hsl(H 100% 50%)`. Tăng giá trị whiteness làm màu sáng hơn. Tăng blackness làm màu tối hơn.

Khi cả blackness và whiteness đều lớn hơn 0, màu trở nên nhạt hơn, hướng đến màu xám. Khi lượng whiteness và blackness thêm vào bằng hoặc lớn hơn 100% — nói cách khác, nếu `W + B >= 100%`, hàm màu xác định một sắc thái xám. Khi tổng cả hai giá trị lớn hơn 100% (`W + B > 100%`), các giá trị whiteness và blackness của màu xám được chuẩn hóa hiệu quả là `W / (W + B)` và `B / (W + B)`, tương ứng.

## Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

### Cú pháp giá trị tuyệt đối

```plain
hwb(H W B[ / A])
```

Các tham số như sau:

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg` trong trường hợp này) biểu diễn góc {{cssxref("hue")}} của màu.

- `W`
  - : Một {{CSSXref("&lt;percentage&gt;")}} biểu diễn độ trắng của màu hoặc từ khóa `none` (tương đương `0%` trong trường hợp này) để trộn vào. `0%` biểu diễn không có whiteness. `100%` biểu diễn whiteness đầy đủ nếu `B` là `0`, nếu không cả hai giá trị `W` và `B` được chuẩn hóa.

- `B`
  - : Một {{CSSXref("&lt;percentage&gt;")}} biểu diễn độ đen của màu hoặc từ khóa `none` (tương đương `0%` trong trường hợp này) để trộn vào. `0%` biểu diễn không có blackness. `100%` biểu diễn blackness đầy đủ nếu `W` là `0`, nếu không cả hai giá trị `W` và `B` được chuẩn hóa.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

> [!NOTE]
> Màu `hwb()` tuyệt đối được tuần tự hóa thành các giá trị {{CSSXref("color_value/rgb", "rgb()")}}. Các giá trị của các thành phần đỏ, xanh lá và xanh lam có thể được làm tròn khi tuần tự hóa.

### Cú pháp giá trị tương đối

```plain
hwb(from <color> H W B[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**. Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg` trong trường hợp này) biểu diễn góc {{cssxref("hue")}} của màu đầu ra.

- `W`
  - : Một {{CSSXref("&lt;percentage&gt;")}} biểu diễn độ trắng của màu hoặc từ khóa `none` (tương đương `0%` trong trường hợp này) để trộn vào. `0%` biểu diễn không có whiteness. `100%` biểu diễn whiteness đầy đủ nếu `B` là `0`, nếu không cả hai giá trị `W` và `B` được chuẩn hóa.

- `B`
  - : Một {{CSSXref("&lt;percentage&gt;")}} biểu diễn độ đen của màu hoặc từ khóa `none` (tương đương `0%` trong trường hợp này) để trộn vào. `0%` biểu diễn không có blackness. `100%` biểu diễn blackness đầy đủ nếu `W` là `0`, nếu không cả hai giá trị `W` và `B` được chuẩn hóa.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Để đại diện đầy đủ cho toàn bộ phổ màu nhìn thấy được, đầu ra của hàm màu `hwb()` tương đối được tuần tự hóa thành `color(srgb)`. Điều đó có nghĩa là khi truy vấn giá trị màu đầu ra thông qua thuộc tính {{DOMxRef("HTMLElement.style")}} hoặc phương thức {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}} sẽ trả về màu đầu ra dưới dạng giá trị [`color(srgb ...)`](/vi/docs/Web/CSS/Reference/Values/color_value/color).

### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `hwb()`, trình duyệt chuyển đổi màu gốc thành màu HWB tương đương (nếu chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `h` (hue), `w` (white) và `b` (black) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Giá trị kênh `h` được giải quyết thành `<number>` trong khoảng `0` đến `360` (bao gồm).
- Các kênh `w` và `b` đều được giải quyết thành `<number>` trong khoảng `0` đến `100` (bao gồm).
- Kênh `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `hwb()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương `hwb(0 0% 0%)`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `h`, `w` và `b` của màu gốc (`0`, `0%` và `0%`) làm giá trị kênh đầu ra:

```css
hwb(from hsl(0 100% 50%) h w b)
```

Màu đầu ra của hàm này là tương đương sRGB `color()` của `hwb(0 0% 0%)`: `color(srgb 1 0 0)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
hwb(from hsl(0 100% 50%) 240 52% 12%)
```

Trong trường hợp trên, màu đầu ra là tương đương sRGB `color()` của `hwb(240 52% 12%)`: `color(srgb 0.52 0.52 0.88)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
hwb(from hsl(0 100% 50%) h 30% b)
```

Ví dụ này:

- Chuyển đổi màu gốc (`hsl(0 100% 50%)`) thành tương đương `hwb()` (`hwb(0 0% 0%)`).
- Đặt các giá trị kênh `H` và `B` của màu đầu ra bằng các giá trị kênh `H` và `B` của tương đương `hwb()` màu gốc — những giá trị đó là `0` và `0%`, tương ứng.
- Đặt giá trị kênh `W` của màu đầu ra thành giá trị mới không dựa trên màu gốc: `30%`.

Màu đầu ra cuối cùng là tương đương của `hwb(0 30% 0%)` trong không gian màu sRGB — `color(srgb 1 0.3 0.3)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình hoặc không gian màu với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
hwb(from hsl(0 100% 50% / 0.8) h w b / alpha)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.8) */

hwb(from hsl(0 100% 50% / 0.8) h w b / 0.5)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.5) */
```

Trong ví dụ sau, màu gốc `hsl()` lại được chuyển đổi thành biểu diễn `hwb()` — `hwb(0 0% 0%)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `H`, `W`, `B` và `A`, và màu đầu ra cuối cùng là tương đương của `hwb(120 25% 10% / 0.9)` trong không gian màu sRGB: `color(srgb 0.25 0.9 0.25 / 0.9)`.

```css
hwb(from hsl(0 100% 50%) calc(h + 120) calc(w + 25) calc(b + 10) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng màu tương đối với hwb()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử ở giữa được đặt `--base-color` chưa sửa đổi, trong khi phần tử bên trái và bên phải được đặt các biến thể sáng hơn và tối hơn của `--base-color` đó.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `hwb()`, và màu đầu ra có các kênh white và black được sửa đổi để đạt được hiệu ứng mong muốn thông qua hàm `calc()`. Màu sáng hơn có 30% được thêm vào kênh white, và màu tối hơn có 30% được thêm vào kênh black.

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
}

/* As per the spec, w and b values should resolve to a number between 0-100
   However, Chrome 121+ incorrectly resolves them to numbers between 0-1
   hence currently using calculations like w + 0.3 instead of w + 30 */

#one {
  background-color: hwb(from var(--base-color) h calc(w + 0.3) b);
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: hwb(from var(--base-color) h w calc(b + 0.3));
}

/* Use @supports to add in support for old syntax that requires % units to
   be specified in w and b calculations. This is required for Safari 16.4+. */
@supports (color: hwb(from red h w calc(b + 30%))) {
  #one {
    background-color: hwb(from var(--base-color) h calc(w + 30%) b);
  }

  #three {
    background-color: hwb(from var(--base-color) h w calc(b + 30%));
  }
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Using relative colors with hwb()", "100%", "200") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("&lt;color&gt;")}}: Để xem danh sách tất cả ký hiệu màu
- [Công cụ chuyển đổi định dạng màu](/vi/docs/Web/CSS/Guides/Colors/Color_format_converter)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- {{cssxref("hue")}}: kiểu dữ liệu biểu diễn góc hue của màu
