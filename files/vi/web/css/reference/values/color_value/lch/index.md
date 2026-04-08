---
title: lch()
slug: Web/CSS/Reference/Values/color_value/lch
page-type: css-function
browser-compat: css.types.color.lch
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-LCH
  - https://drafts.csswg.org/css-color/#lab-colors
sidebar: cssref
---

Ký hiệu hàm **`lch()`** biểu diễn một màu sắc nhất định bằng cách sử dụng {{glossary("color space", "không gian màu")}} LCH, biểu diễn lightness (độ sáng), chroma (độ bão hòa màu) và hue (sắc). Nó sử dụng cùng trục `L` như hàm màu {{cssxref("color_value/lab","lab()")}} của [không gian màu CIELab](/vi/docs/Glossary/Color_space#cielab_color_spaces), nhưng sử dụng tọa độ cực `C` (Chroma) và `H` (Hue).

## Cú pháp

```css
/* Giá trị tuyệt đối */
lch(29.2345% 44.2 27);
lch(52.2345% 72.2 56.2);
lch(52.2345% 72.2 56.2 / .5);

/* Giá trị tương đối */
lch(from green l c h / 0.5)
lch(from #123456 calc(l + 10) c h)
lch(from hsl(180 100% 50%) calc(l - 10) c h)
lch(from var(--color-value) l c h / calc(alpha - 0.1))
```

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

> [!NOTE]
> Thông thường khi các giá trị phần trăm có tương đương số trong CSS, `100%` bằng số `1`.
> Điều này không đúng cho `lch()`. Ở đây `100%` bằng số `100` cho giá trị `L` và `150` cho giá trị `C`.

#### Cú pháp giá trị tuyệt đối

```plain
lch(L C H[ / A])
```

Các tham số như sau:

- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `100`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%`). Số `0` tương ứng với `0%` (đen), và số `100` tương ứng với `100%` (trắng). Giá trị này chỉ định độ sáng của màu trong [không gian màu CIELab](/vi/docs/Glossary/Color_space#cielab_color_spaces).

    > [!NOTE]
    > `L` trong `lch()` là độ sáng được cảm nhận, đề cập đến "độ sáng" mà chúng ta nhìn thấy bằng mắt. Điều này khác với `L` trong `hsl()`, nơi nó biểu diễn độ sáng so với các màu khác.

- `C`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{CSSXref("&lt;percentage&gt;")}}, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này là thước đo chroma của màu (đại diện gần đúng cho "lượng màu"). Giá trị hữu dụng tối thiểu là `0%` hoặc `0`, trong khi tối đa về lý thuyết không giới hạn (nhưng trong thực tế không vượt quá `230`), với `100%` tương đương với `150`.

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg`) biểu diễn góc {{cssxref("hue")}} của màu.

    > [!NOTE]
    > Các góc tương ứng với các hue cụ thể khác nhau giữa các không gian màu sRGB (được sử dụng bởi {{CSSXref("color_value/hsl", "hsl()")}} và {{CSSXref("color_value/hwb", "hwb()")}}), CIELAB (được sử dụng bởi `lch()`), và Oklab (được sử dụng bởi {{CSSXref("color_value/oklch", "oklch()")}}). Xem ví dụ [hues in LCH](#hues_in_lch) dưới đây và trang tham chiếu {{cssxref("hue")}} để biết thêm chi tiết và ví dụ.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

#### Cú pháp giá trị tương đối

```plain
lch(from <color> L C H[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**. Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.

- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `100`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%`). Số `0` tương ứng với `0%` (đen), và số `100` tương ứng với `100%` (trắng). Giá trị này chỉ định độ sáng của màu trong không gian màu CIELab.

- `C`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{CSSXref("&lt;percentage&gt;")}}, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn giá trị chroma của màu đầu ra (đại diện gần đúng cho "lượng màu"). Giá trị hữu dụng tối thiểu là `0%` hoặc `0`, trong khi tối đa về lý thuyết không giới hạn (nhưng trong thực tế không vượt quá `230`), với `100%` tương đương với `150`.

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg`) biểu diễn góc {{cssxref("hue")}} của màu đầu ra. Xem [ví dụ hue](#result_3) dưới đây.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

#### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `lch()`, trình duyệt chuyển đổi màu gốc thành màu Lch tương đương (nếu chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `l` (lightness), `c` (chroma) và `h` (hue) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Giá trị kênh `l` được giải quyết thành `<number>` trong khoảng `0` đến `100` (bao gồm).
- Giá trị kênh `c` được giải quyết thành `<number>` trong khoảng `0` đến `150` (bao gồm).
- Giá trị kênh `h` được giải quyết thành `<number>` trong khoảng `0` đến `360` (bao gồm).
- Kênh `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `lch()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương `red`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `l`, `c` và `h` của màu gốc (`54.29`, `106.854` và `40.856`) làm giá trị kênh đầu ra:

```css
lch(from hsl(0 100% 50%) l c h)
```

Màu đầu ra của hàm này là `lch(54.29 106.854 40.856)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
lch(from hsl(0 100% 50%) 29.6871% 66.83 327.109)
```

Trong trường hợp trên, màu đầu ra là `lch(29.6871 66.83 327.109)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
lch(from hsl(0 100% 50%) 70 150 h)
```

Ví dụ này:

- Chuyển đổi màu gốc `hsl()` thành màu tương đương `lch()` — `lch(54.29 106.854 40.856)`.
- Đặt giá trị kênh `H` của màu đầu ra bằng giá trị kênh `H` của tương đương `lch()` gốc — `40.856`.
- Đặt các giá trị kênh `L` và `C` của màu đầu ra thành các giá trị mới không dựa trên màu gốc: `70` và `150`, tương ứng.

Màu đầu ra cuối cùng là `lch(70 150 40.856)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
lch(from hsl(0 100% 50% / 0.8) l c h / alpha)
/* Màu đầu ra được tính: lch(54.29 106.854 40.856 / 0.8) */

lch(from hsl(0 100% 50% / 0.8) l c h / 0.5)
/* Màu đầu ra được tính: lch(54.29 106.854 40.856 / 0.5) */
```

Trong ví dụ sau, màu gốc `hsl()` lại được chuyển đổi thành tương đương `lch()` — `lch(54.29 106.854 40.856)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `L`, `C`, `H` và `A`, dẫn đến màu đầu ra là `lch(74.29 86.8541 0.856018 / 0.9)`:

```css
lch(from hsl(0 100% 50%) calc(l + 20) calc(c - 20) calc(h - 40) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Điều chỉnh độ sáng của màu

Ví dụ này cho thấy tác động của việc thay đổi giá trị `L` (lightness) của ký hiệu hàm `lch()`.

#### HTML

```html
<div data-color="blue-dark"></div>
<div data-color="blue"></div>
<div data-color="blue-light"></div>

<div data-color="red-dark"></div>
<div data-color="red"></div>
<div data-color="red-light"></div>

<div data-color="green-dark"></div>
<div data-color="green"></div>
<div data-color="green-light"></div>
```

#### CSS

```css hidden
body {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 20px;
}
div {
  height: 50px;
  border: 1px solid black;
}
```

```css
[data-color="blue-dark"] {
  background-color: lch(10% 100 240);
}
[data-color="blue"] {
  background-color: lch(50% 100 240);
}
[data-color="blue-light"] {
  background-color: lch(90% 100 240);
}

[data-color="red-dark"] {
  background-color: lch(10% 130 20);
}
[data-color="red"] {
  background-color: lch(50% 130 20);
}
[data-color="red-light"] {
  background-color: lch(90% 130 20);
}

[data-color="green-dark"] {
  background-color: lch(10% 132 130);
}
[data-color="green"] {
  background-color: lch(50% 132 130);
}
[data-color="green-light"] {
  background-color: lch(90% 132 130);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting the brightness of a color", "", "200")}}

### Điều chỉnh cường độ màu qua chroma

Ví dụ sau cho thấy tác động của việc thay đổi giá trị `C` (chroma) của ký hiệu hàm `lch()`, với các màu giảm cường độ khi giá trị `C` giảm từ bão hòa đầy đủ đến gần như xám.

#### HTML

```html
<div data-color="blue"></div>
<div data-color="blue-chroma1"></div>
<div data-color="blue-chroma2"></div>
<div data-color="blue-chroma3"></div>

<div data-color="red"></div>
<div data-color="red-chroma1"></div>
<div data-color="red-chroma2"></div>
<div data-color="red-chroma3"></div>

<div data-color="green"></div>
<div data-color="green-chroma1"></div>
<div data-color="green-chroma2"></div>
<div data-color="green-chroma3"></div>
```

#### CSS

Với các màu bắt đầu là xanh lam, đỏ và xanh lá, chúng ta khai báo các giá trị chroma nhỏ dần: bắt đầu từ bão hòa màu đầy đủ ở giá trị cao nhất là `150` (tương đương `100%`) xuống `3` (tương đương `2%`), gần như xám cho tất cả các màu.

```css hidden
body {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  gap: 20px;
}
div {
  height: 50px;
  border: 1px solid black;
}
```

```css
[data-color="blue"] {
  background-color: lch(50% 150 240);
}
[data-color="blue-chroma1"] {
  background-color: lch(50% 105 240);
}
[data-color="blue-chroma2"] {
  background-color: lch(50% 54 240);
}
[data-color="blue-chroma3"] {
  background-color: lch(50% 3 240);
}

[data-color="red"] {
  background-color: lch(50% 100% 20deg);
}
[data-color="red-chroma1"] {
  background-color: lch(50% 70% 20deg);
}
[data-color="red-chroma2"] {
  background-color: lch(50% 36% 20deg);
}
[data-color="red-chroma3"] {
  background-color: lch(50% 2% 20deg);
}

[data-color="green"] {
  background-color: lch(50% 150 130);
}
[data-color="green-chroma1"] {
  background-color: lch(50% 105 130);
}
[data-color="green-chroma2"] {
  background-color: lch(50% 54 130);
}
[data-color="green-chroma3"] {
  background-color: lch(50% 3 130);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting color intensity via chroma", '', '200')}}

Nếu chúng ta đã sử dụng `0` thay vì `3` và `2%`, với cùng các giá trị lightness, tất cả các màu sẽ có cùng một sắc thái xám. Trong ví dụ này, chúng gần như xám.

### Hues trong LCH

Ví dụ sau cho thấy các mẫu với các giá trị `H` (hue) khác nhau của ký hiệu hàm `lch()`.

#### HTML

```html
<div data-color="0">0deg</div>
<div data-color="20">20deg</div>
<div data-color="40">40deg</div>
<div data-color="60">60deg</div>
```

và tiếp tục.

```html hidden
<div data-color="80">80deg</div>
<div data-color="100">100deg</div>
<div data-color="120">120deg</div>
<div data-color="140">140deg</div>
<div data-color="160">160deg</div>
<div data-color="180">180deg</div>
<div data-color="200">200deg</div>
<div data-color="220">220deg</div>
<div data-color="240">240deg</div>
<div data-color="260">260deg</div>
<div data-color="280">280deg</div>
<div data-color="300">300deg</div>
<div data-color="320">320deg</div>
<div data-color="340">340deg</div>
<div data-color="360">360deg</div>
```

#### CSS

```css hidden
body {
  display: flex;
  flex-wrap: wrap;
  gap: 3px;
}
div {
  flex: 0 0 4em;
  text-align: center;
  line-height: 4em;
  display: inline-block;
  border: 1px solid black;
  color: white;
  font-family: monospace;
}
```

```css
[data-color="0"] {
  background-color: lch(50% 150 0deg);
}
[data-color="20"] {
  background-color: lch(50% 150 20deg);
}
[data-color="40"] {
  background-color: lch(50% 150 40deg);
}
[data-color="60"] {
  background-color: lch(50% 150 60deg);
}
```

và tiếp tục.

```css hidden
[data-color="80"] {
  background-color: lch(50% 150 80deg);
}
[data-color="100"] {
  background-color: lch(50% 150 100deg);
}
[data-color="120"] {
  background-color: lch(50% 150 120deg);
}
[data-color="140"] {
  background-color: lch(50% 150 140deg);
}
[data-color="160"] {
  background-color: lch(50% 150 160deg);
}
[data-color="180"] {
  background-color: lch(50% 150 180deg);
}
[data-color="200"] {
  background-color: lch(50% 150 200deg);
}
[data-color="220"] {
  background-color: lch(50% 150 220deg);
}
[data-color="240"] {
  background-color: lch(50% 150 240deg);
}
[data-color="260"] {
  background-color: lch(50% 150 260deg);
}
[data-color="280"] {
  background-color: lch(50% 150 280deg);
}
[data-color="300"] {
  background-color: lch(50% 150 300deg);
}
[data-color="320"] {
  background-color: lch(50% 150 320deg);
}
[data-color="340"] {
  background-color: lch(50% 150 340deg);
}
[data-color="360"] {
  background-color: lch(50% 150 360deg);
}
```

#### Kết quả

{{EmbedLiveSample("hues in lch")}}

Các góc hue trong `lch()` khác với trong {{CSSXref("color_value/hsl", "hsl()")}}. Xem {{cssxref("hue")}} để biết thêm thông tin. Trong `hsl()`, màu sRGB `0deg` biểu diễn màu đỏ. Tuy nhiên, trong không gian màu CIELab, `0deg` tương ứng với màu tím, trong khi màu đỏ xấp xỉ `41deg`.

### Điều chỉnh độ trong suốt với lch()

Ví dụ sau minh họa tác động của việc thay đổi giá trị `A` (alpha) của ký hiệu hàm `lch()`.
Các phần tử `red` và `red-alpha` chồng lên phần tử `#background-div` để minh họa tác động của độ trong suốt.
Đặt `A` là `0.4` làm màu trong suốt 40%.

#### HTML

```html
<div id="background-div">
  <div data-color="red"></div>
  <div data-color="red-alpha"></div>
</div>
```

#### CSS

```css hidden
div {
  width: 50px;
  height: 50px;
  padding: 5px;
  margin: 5px;
  display: inline-block;
  border: 1px solid black;
}
#background-div {
  background-color: lch(100% 100 240);
  width: 150px;
  height: 40px;
}
```

```css
[data-color="red"] {
  background-color: lch(50% 130 20);
}
[data-color="red-alpha"] {
  background-color: lch(50% 130 20 / 0.4);
}
```

#### Kết quả

{{EmbedLiveSample("adjusting_opacity_with_lch")}}

### Sử dụng màu tương đối với lch()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau, minh họa cách sử dụng màu tương đối để thay đổi độ sáng của màu bằng hàm màu `lch()`. Phần tử `<div>` ở giữa giữ nguyên `--base-color` gốc, trong khi các phần tử `<div>` bên trái và bên phải được đặt các biến thể sáng hơn và tối hơn của `--base-color`.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `lch()`, và màu đầu ra có kênh lightness được sửa đổi để đạt được hiệu ứng mong muốn thông qua hàm `calc()`. Màu sáng hơn có 15% được thêm vào kênh lightness, và màu tối hơn có 15% bị trừ khỏi kênh lightness.

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
  background-color: lch(from var(--base-color) calc(l + 15) c h);
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: lch(from var(--base-color) calc(l - 15) c h);
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Using relative colors with lch()", "100%", "200") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Danh sách tất cả ký hiệu màu](/vi/docs/Web/CSS/Reference/Values/color_value)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- Kiểu dữ liệu {{cssxref("hue")}}
- [LCH colors in CSS: what, why, and how?](https://lea.verou.me/blog/2020/04/lch-colors-in-css-what-why-and-how/) by Lea Verou (2020)
