---
title: hsl()
slug: Web/CSS/Reference/Values/color_value/hsl
page-type: css-function
browser-compat: css.types.color.hsl
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-HSL
  - https://drafts.csswg.org/css-color/#the-hsl-notation
sidebar: cssref
---

> [!NOTE]
> Ký hiệu hàm `hsla()` là bí danh của `hsl()`. Chúng hoàn toàn tương đương nhau. Khuyến nghị sử dụng `hsl()`.

Ký hiệu hàm **`hsl()`** biểu diễn màu sắc trong {{glossary("RGB", "sRGB")}} {{glossary("color space", "không gian màu")}} theo các thành phần _hue_ (sắc), _saturation_ (độ bão hòa) và _lightness_ (độ sáng). Thành phần _alpha_ tùy chọn biểu diễn độ trong suốt của màu.

{{InteractiveExample("CSS Demo: hsl()")}}

```css interactive-example-choice
background: hsl(50 80% 40%);
```

```css interactive-example-choice
background: hsl(150deg 30% 60%);
```

```css interactive-example-choice
background: hsl(0.3turn 60% 45% / 0.7);
```

```css interactive-example-choice
background: hsl(0 80% 50% / 25%);
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

Việc xác định _màu bổ sung_ với `hsl()` có thể được thực hiện bằng cách cộng hoặc trừ 180 độ khỏi giá trị hue, vì chúng được đặt trên cùng đường kính của {{glossary("color wheel", "bánh xe màu")}}. Ví dụ, nếu góc hue của một màu là `10deg`, màu bổ sung của nó có góc hue là `190deg`.

## Cú pháp

```css
/* Giá trị tuyệt đối */
hsl(120deg 75% 25%)
hsl(120 75 25) /* đơn vị deg và % là tùy chọn */
hsl(120deg 75% 25% / 60%)
hsl(none 75% 25%)

/* Giá trị tương đối */
hsl(from green h s l / 0.5)
hsl(from #123456 h s calc(l + 20))
hsl(from rgb(200 0 0) calc(h + 30) s calc(l + 30))

/* Bí danh 'hsla()' cũ */
hsla(120deg 75% 25% / 60%)

/* Định dạng cũ */
hsl(120, 75%, 25%)
hsl(120deg, 75%, 25%, 0.8)
```

> [!NOTE]
> `hsl()`/`hsla()` cũng có thể được viết ở dạng cũ trong đó tất cả các giá trị được phân cách bằng dấu phẩy, ví dụ `hsl(120, 75%, 25%)` hoặc `hsla(120deg, 75%, 25%, 0.8)`. Giá trị `none` không được phép trong cú pháp cũ phân cách bằng dấu phẩy, đơn vị `deg` trên giá trị hue là tùy chọn, và đơn vị `%` là bắt buộc cho các giá trị saturation và lightness.

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

#### Cú pháp giá trị tuyệt đối

```plain
hsl(H S L[ / A])
```

Các tham số như sau:

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg` trong trường hợp này) biểu diễn góc {{cssxref("hue")}} của màu.

    > [!NOTE]
    > Các góc tương ứng với các hue cụ thể khác nhau giữa các không gian màu sRGB (được sử dụng bởi `hsl()` và {{CSSXref("color_value/hwb", "hwb()")}}), CIELAB (được sử dụng bởi {{CSSXref("color_value/lch", "lch()")}}), và Oklab (được sử dụng bởi {{CSSXref("color_value/oklch", "oklch()")}}). Xem trang tham chiếu {{cssxref("hue")}} để biết thêm chi tiết và ví dụ.

- `S`
  - : Một {{CSSXref("&lt;percentage&gt;")}} hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn độ bão hòa của màu. Ở đây `100%` là hoàn toàn bão hòa, trong khi `0%` là hoàn toàn không bão hòa (xám).
- `L`
  - : Một {{CSSXref("&lt;percentage&gt;")}} hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn độ sáng của màu. Ở đây `100%` là trắng, `0%` là đen, và `50%` là "bình thường".
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

> [!NOTE]
> Màu `hsl()` tuyệt đối được tuần tự hóa thành các giá trị {{CSSXref("color_value/rgb", "rgb()")}}. Các giá trị của các thành phần đỏ, xanh lá và xanh lam có thể được làm tròn khi tuần tự hóa.

#### Cú pháp giá trị tương đối

```plain
hsl(from <color> H S L[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**. Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.
- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg` trong trường hợp này) biểu diễn góc {{cssxref("hue")}} của màu đầu ra.
- `S`
  - : Một {{CSSXref("&lt;percentage&gt;")}} hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Biểu diễn độ bão hòa của màu đầu ra. Ở đây `100%` là hoàn toàn bão hòa, trong khi `0%` là hoàn toàn không bão hòa (xám).
- `L`
  - : Một {{CSSXref("&lt;percentage&gt;")}} hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Biểu diễn độ sáng của màu đầu ra. Ở đây `100%` là trắng, `0%` là đen, và `50%` là "bình thường".
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Để đại diện đầy đủ cho toàn bộ phổ màu nhìn thấy được, đầu ra của hàm màu `hsl()` tương đối được tuần tự hóa thành `color(srgb)`. Điều đó có nghĩa là khi truy vấn giá trị màu đầu ra thông qua thuộc tính {{DOMxRef("HTMLElement.style")}} hoặc phương thức {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}} sẽ trả về màu đầu ra dưới dạng giá trị [`color(srgb ...)`](/vi/docs/Web/CSS/Reference/Values/color_value/color).

#### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `hsl()`, trình duyệt chuyển đổi màu gốc thành màu HSL tương đương (nếu chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `h` (hue), `s` (saturation) và `l` (lightness) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Giá trị `h` được giải quyết thành {{cssxref("&lt;number&gt;")}} trong khoảng `0` đến `360` (bao gồm), biểu diễn giá trị độ hue của màu gốc.
- Các giá trị `s` và `l` đều được giải quyết thành `<number>` trong khoảng `0` đến `100` (bao gồm), trong đó `100` tương đương với `100%`.
- Giá trị `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `hsl()` tương đối.

Hãy bắt đầu với màu gốc là `rgb(255 0 0)` (tương đương `hsl(0 100% 50%)`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `h`, `s` và `l` của màu gốc (`0`, `100%` và `50%`) làm giá trị kênh đầu ra:

```css
hsl(from rgb(255 0 0) h s l)
```

Màu đầu ra của hàm này là tương đương sRGB `color()` của `hsl(0 100% 50%)`: `color(srgb 1 0 0)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
hsl(from rgb(255 0 0) 240 60% 70%)
```

Trong trường hợp trên, màu đầu ra là tương đương sRGB `color()` của `hsl(240 60% 70%)`: `color(srgb 0.52 0.52 0.88)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
hsl(from rgb(255 0 0) h 30% 60%)
```

Ví dụ này:

- Chuyển đổi màu gốc (`rgb(255 0 0)`) thành tương đương `hsl()` (`hsl(0 100% 50%)`).
- Đặt giá trị kênh `H` của màu đầu ra bằng giá trị kênh `H` của tương đương `hsl()` màu gốc — `0`.
- Đặt các giá trị kênh `S` và `L` của màu đầu ra thành các giá trị mới không dựa trên màu gốc: `30%` và `60%`, tương ứng.

Màu đầu ra cuối cùng là tương đương của `hsl(0 30% 60%)` trong không gian màu sRGB — `color(srgb 0.72 0.48 0.48)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
hsl(from rgb(255 0 0 / 0.8) h s l / alpha)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.8) */

hsl(from rgb(255 0 0 / 0.8) h s l / 0.5)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.5) */
```

Trong ví dụ sau, màu gốc `rgb()` lại được chuyển đổi thành biểu diễn `hsl()` — `hsl(0 100% 50% / 0.8)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `H`, `S`, `L` và `A`, và màu đầu ra cuối cùng là tương đương của `hsl(60 80% 30% / 0.7)` trong không gian màu sRGB: `color(srgb 0.72 0.72 0.08 / 0.7)`.

```css
hsl(from rgb(255 0 0 / 0.8) calc(h + 60) calc(s - 20) calc(l - 10) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng hsl() với conic-gradient()

Hàm `hsl()` hoạt động tốt với [`conic-gradient()`](/vi/docs/Web/CSS/Reference/Values/gradient/conic-gradient) vì cả hai đều liên quan đến góc.

```html hidden
<div></div>
```

#### CSS

```css
div {
  width: 100px;
  height: 100px;
  background: conic-gradient(
    hsl(360 100% 50%),
    hsl(315 100% 50%),
    hsl(270 100% 50%),
    hsl(225 100% 50%),
    hsl(180 100% 50%),
    hsl(135 100% 50%),
    hsl(90 100% 50%),
    hsl(45 100% 50%),
    hsl(0 100% 50%)
  );
  clip-path: circle(closest-side);
}
```

#### Kết quả

{{EmbedLiveSample("using_hsl_with_conic-gradient", "100%", 140)}}

### Sử dụng màu tương đối với hsl()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử ở giữa được đặt `--base-color` chưa sửa đổi, trong khi phần tử bên trái và bên phải được đặt các biến thể sáng hơn và tối hơn của `--base-color` đó.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `hsl()`, và màu đầu ra có kênh lightness được sửa đổi để đạt được hiệu ứng mong muốn thông qua hàm `calc()`, trong khi hue và saturation không thay đổi. Màu sáng hơn có 20% được thêm vào kênh lightness, và màu tối hơn có 20% bị trừ đi.

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

#one {
  background-color: hsl(from var(--base-color) h s calc(l + 20));
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: hsl(from var(--base-color) h s calc(l - 20));
}

/* Use @supports to add in support for old syntax that requires % units to
   be specified in lightness calculations */
@supports (color: hsl(from red h s calc(l - 20%))) {
  #one {
    background-color: hsl(from var(--base-color) h s calc(l + 20%));
  }

  #three {
    background-color: hsl(from var(--base-color) h s calc(l - 20%));
  }
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Using relative colors with hsl()", "100%", "200") }}

### Cú pháp cũ: các giá trị phân cách bằng dấu phẩy

Vì lý do cũ, hàm `hsl()` chấp nhận một dạng trong đó tất cả các giá trị được phân cách bằng dấu phẩy.

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
  background-color: hsl(0 100% 50% / 50%);
}

div.comma-separated {
  background-color: hsl(0, 100%, 50%, 0.5);
}
```

#### Kết quả

{{EmbedLiveSample("legacy_syntax_comma-separated_values", "100%", 150)}}

### Cú pháp cũ và hiện đại

Ví dụ này minh họa cú pháp `hsla()` là bí danh của `hsl()`; cả hai đều được hỗ trợ bằng cú pháp hiện đại và cũ (phân cách bằng dấu phẩy).

#### HTML

```html
<div class="modern">HSL</div>
<div class="legacy">HSL</div>
<div class="modernWithAlpha">HSL</div>
<div class="modernHSLA">HSLA</div>
<div class="legacyHSLA">HSLA</div>
```

#### CSS

```css
div {
  width: 100px;
  min-height: 50px;
  font-family: sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
}
body {
  display: flex;
  gap: 20px;
}
```

```css
div.modern {
  background-color: hsl(90 80% 50%);
}

div.legacy {
  background-color: hsl(90, 80%, 50%);
}

div.modernWithAlpha {
  background-color: hsl(90 80% 50% / 50%);
}

div.modernHSLA {
  background-color: hsla(90 80% 50% / 50%);
}

div.legacyHSLA {
  background-color: hsla(90, 80%, 50%, 0.5);
}
```

#### Kết quả

{{EmbedLiveSample("legacy_versus_modern_syntax", "100%", 70)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{cssxref("hue")}}
- Các hàm màu [`lch()`](/vi/docs/Web/CSS/Reference/Values/color_value/lch) và [`hwb()`](/vi/docs/Web/CSS/Reference/Values/color_value/hwb)
- [Nội suy hue trong `color-mix()`](/vi/docs/Web/CSS/Reference/Values/color_value/color-mix#using_hue_interpolation_in_color-mix)
- [Danh sách tất cả ký hiệu màu](/vi/docs/Web/CSS/Reference/Values/color_value)
- [Công cụ chuyển đổi định dạng màu](/vi/docs/Web/CSS/Guides/Colors/Color_format_converter)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- [Color picker tool](https://apps.colorjs.io/picker/) by Lea Verou
