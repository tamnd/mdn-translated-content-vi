---
title: oklch()
slug: Web/CSS/Reference/Values/color_value/oklch
page-type: css-function
browser-compat: css.types.color.oklch
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-Oklch
  - https://drafts.csswg.org/css-color/#ok-lab
sidebar: cssref
---

Ký hiệu hàm **`oklch()`** biểu diễn một màu sắc nhất định trong {{glossary("color space", "không gian màu")}} Oklab. `oklch()` là dạng hình trụ của {{CSSXref("color_value/oklab", "oklab()")}}, sử dụng cùng trục `L`, nhưng với tọa độ cực Chroma (`C`) và Hue (`h`).

## Cú pháp

```css
/* Giá trị tuyệt đối */
oklch(40.1% 0.123 21.57)
oklch(59.69% 0.156 49.77)
oklch(59.69% 0.156 49.77 / .5)

/* Giá trị tương đối */
oklch(from green l c h / 0.5)
oklch(from #123456 calc(l + 0.1) c h)
oklch(from hsl(180 100% 50%) calc(l - 0.1) c h)
oklch(from var(--color) l c h / calc(alpha - 0.1))
```

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

> [!NOTE]
> Thông thường khi các giá trị phần trăm có tương đương số trong CSS, `100%` bằng số `1`.
> Điều này không đúng cho tất cả các giá trị thành phần `oklch()`. Ở đây, `100%` bằng `0.4` cho giá trị `C`.

#### Cú pháp giá trị tuyệt đối

```plain
oklch(L C H[ / A])
```

Các tham số như sau:

- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `1`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Trong trường hợp này, số `0` tương ứng với `0%` (đen) và số `1` tương ứng với `100%` (trắng). Giá trị này chỉ định độ sáng được cảm nhận của màu, hay "độ sáng".

    > [!NOTE]
    > `L` trong `oklch()` là độ sáng được cảm nhận, đề cập đến "độ sáng" mà chúng ta nhìn thấy bằng mắt. Điều này khác với `L` trong `hsl()`, nơi nó biểu diễn độ sáng so với các màu khác.

- `C`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{CSSXref("&lt;percentage&gt;")}}, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này là thước đo chroma của màu (đại diện gần đúng cho "lượng màu"). Giá trị hữu dụng tối thiểu là `0`, trong khi tối đa về lý thuyết không giới hạn (nhưng trong thực tế không vượt quá `0.5`). Trong trường hợp này, `0%` là `0` và `100%` là số `0.4`.

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg` trong trường hợp này) biểu diễn góc {{cssxref("hue")}} của màu.

    > [!NOTE]
    > Các góc tương ứng với các hue cụ thể khác nhau giữa các không gian màu sRGB (được sử dụng bởi {{CSSXref("color_value/hsl", "hsl()")}} và {{CSSXref("color_value/hwb", "hwb()")}}), CIELAB (được sử dụng bởi {{CSSXref("color_value/lch", "lch()")}}), và Oklab (được sử dụng bởi `oklch()`). Xem ví dụ [Hues in `oklch()`](#hues_in_oklch) dưới đây và trang tham chiếu {{cssxref("hue")}} để biết thêm chi tiết và ví dụ.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

#### Cú pháp giá trị tương đối

```plain
oklch(from <color> L C H[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**: Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.

- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `1`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn giá trị lightness của màu đầu ra. Ở đây, số `0` tương ứng với `0%` (đen) và số `1` tương ứng với `100%` (trắng).

- `C`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{CSSXref("&lt;percentage&gt;")}}, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn giá trị chroma của màu đầu ra (đại diện gần đúng cho "lượng màu"). Giá trị hữu dụng tối thiểu là `0`, trong khi tối đa về lý thuyết không giới hạn (nhưng trong thực tế không vượt quá `0.5`). Trong trường hợp này, `0%` là `0` và `100%` là số `0.4`.

- `H`
  - : Một {{CSSXref("&lt;number&gt;")}}, một {{cssxref("angle")}}, hoặc từ khóa `none` (tương đương `0deg` trong trường hợp này) biểu diễn góc {{cssxref("hue")}} của màu đầu ra. Xem [mẫu các hue khác nhau](#result_3) trong phần [Ví dụ](#examples) dưới đây.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

#### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `oklch()`, trình duyệt chuyển đổi màu gốc thành màu OkLCh tương đương (nếu chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `l` (lightness), `c` (chroma) và `h` (hue) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Giá trị kênh `l` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).
- Giá trị kênh `c` được giải quyết thành `<number>` trong khoảng `0` đến `0.4` (bao gồm).
- Giá trị kênh `h` được giải quyết thành `<number>` trong khoảng `0` đến `360` (bao gồm).
- Kênh `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `oklch()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương `red`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `l`, `c` và `h` của màu gốc (`0.627966`, `0.257704` và `29.2346`) làm giá trị kênh đầu ra:

```css
oklch(from hsl(0 100% 50%) l c h)
```

Màu đầu ra của hàm này là `oklch(0.627966 0.257704 29.2346)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
oklch(from hsl(0 100% 50%) 42.1% 0.25 328.363)
```

Trong trường hợp trên, màu đầu ra là `oklch(0.421 0.25 328.363)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
oklch(from hsl(0 100% 50%) 0.8 0.4 h)
```

Ví dụ này:

- Chuyển đổi màu gốc `hsl()` thành màu tương đương `oklch()` — `oklch(0.627966 0.257704 29.2346)`.
- Đặt giá trị kênh `H` của màu đầu ra bằng giá trị kênh `H` của tương đương `oklch()` gốc — `29.2346`.
- Đặt các giá trị kênh `L` và `C` của màu đầu ra thành các giá trị mới không dựa trên màu gốc: `0.8` và `0.4`, tương ứng.

Màu đầu ra cuối cùng là `oklch(0.8 0.4 29.2346)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
oklch(from hsl(0 100% 50% / 0.8) l c h / alpha)
/* Màu đầu ra được tính: oklch(0.627966 0.257704 29.2346 / 0.8) */

oklch(from hsl(0 100% 50% / 0.8) l c h / 0.5)
/* Màu đầu ra được tính: oklch(0.627966 0.257704 29.2346 / 0.5) */
```

Trong ví dụ sau, màu gốc `hsl()` lại được chuyển đổi thành tương đương `oklch()` — `oklch(0.627966 0.257704 29.2346)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `L`, `C`, `H` và `A`, dẫn đến màu đầu ra là `oklch(0.827966 0.357704 9.23462 / 0.9)`:

```css
oklch(from hsl(0 100% 50%) calc(l + 0.2) calc(c + 0.1) calc(h - 20) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Điều chỉnh độ sáng của màu

Ví dụ này cho thấy tác động của việc thay đổi giá trị `L` (lightness) của ký hiệu hàm `oklch()`.

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
  background-color: oklch(10% 0.4 240);
}
[data-color="blue"] {
  background-color: oklch(50% 0.4 240);
}
[data-color="blue-light"] {
  background-color: oklch(90% 0.4 240);
}

[data-color="red-dark"] {
  background-color: oklch(10% 0.4 20);
}
[data-color="red"] {
  background-color: oklch(50% 0.4 20);
}
[data-color="red-light"] {
  background-color: oklch(90% 0.4 20);
}

[data-color="green-dark"] {
  background-color: oklch(10% 0.4 130);
}
[data-color="green"] {
  background-color: oklch(50% 0.4 130);
}
[data-color="green-light"] {
  background-color: oklch(90% 0.4 130);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting the brightness of a color", "", "200")}}

### Điều chỉnh cường độ màu qua chroma

Ví dụ sau cho thấy tác động của việc thay đổi giá trị `C` (chroma) của ký hiệu hàm `oklch()`, với các màu giảm cường độ khi giá trị `C` giảm từ bão hòa đầy đủ đến gần như xám.

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

Với các màu bắt đầu là xanh lam, đỏ và xanh lá, chúng ta khai báo các giá trị chroma nhỏ dần: bắt đầu từ bão hòa màu đầy đủ ở giá trị cao là `0.4` (tương đương `100%`) xuống `0.01` (tương đương `2%`), gần như xám cho tất cả các màu.

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
  background-color: oklch(50% 0.4 240);
}
[data-color="blue-chroma1"] {
  background-color: oklch(50% 0.2 240);
}
[data-color="blue-chroma2"] {
  background-color: oklch(50% 0.1 240);
}
[data-color="blue-chroma3"] {
  background-color: oklch(50% 0.01 240);
}

[data-color="red"] {
  background-color: oklch(50% 100% 20deg);
}
[data-color="red-chroma1"] {
  background-color: oklch(50% 50% 20deg);
}
[data-color="red-chroma2"] {
  background-color: oklch(50% 25% 20deg);
}
[data-color="red-chroma3"] {
  background-color: oklch(50% 2% 20deg);
}

[data-color="green"] {
  background-color: oklch(50% 0.4 130);
}
[data-color="green-chroma1"] {
  background-color: oklch(50% 0.2 130);
}
[data-color="green-chroma2"] {
  background-color: oklch(50% 0.1 130);
}
[data-color="green-chroma3"] {
  background-color: oklch(50% 0.01 130);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting color intensity via chroma", '', '200')}}

Nếu chúng ta đã sử dụng `0` thay vì `0.01` và `2%`, với cùng các giá trị lightness, tất cả các màu sẽ có cùng một sắc thái xám. Trong ví dụ này, chúng gần như xám.

### Hues trong OkLCh

Ví dụ sau cho thấy các mẫu với các giá trị `H` (hue) khác nhau của ký hiệu hàm `oklch()`.

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
  background-color: oklch(50% 0.4 0deg);
}
[data-color="20"] {
  background-color: oklch(50% 0.4 20deg);
}
[data-color="40"] {
  background-color: oklch(50% 0.4 40deg);
}
[data-color="60"] {
  background-color: oklch(50% 0.4 60deg);
}
```

và tiếp tục.

```css hidden
[data-color="80"] {
  background-color: oklch(50% 0.4 80deg);
}
[data-color="100"] {
  background-color: oklch(50% 0.4 100deg);
}
[data-color="120"] {
  background-color: oklch(50% 0.4 120deg);
}
[data-color="140"] {
  background-color: oklch(50% 0.4 140deg);
}
[data-color="160"] {
  background-color: oklch(50% 0.4 160deg);
}
[data-color="180"] {
  background-color: oklch(50% 0.4 180deg);
}
[data-color="200"] {
  background-color: oklch(50% 0.4 200deg);
}
[data-color="220"] {
  background-color: oklch(50% 0.4 220deg);
}
[data-color="240"] {
  background-color: oklch(50% 0.4 240deg);
}
[data-color="260"] {
  background-color: oklch(50% 0.4 260deg);
}
[data-color="280"] {
  background-color: oklch(50% 0.4 280deg);
}
[data-color="300"] {
  background-color: oklch(50% 0.4 300deg);
}
[data-color="320"] {
  background-color: oklch(50% 0.4 320deg);
}
[data-color="340"] {
  background-color: oklch(50% 0.4 340deg);
}
[data-color="360"] {
  background-color: oklch(50% 0.4 360deg);
}
```

#### Kết quả

{{EmbedLiveSample("hues in oklch")}}

Các góc hue trong `oklch()` khác với trong {{CSSXref("color_value/hsl", "hsl()")}}. Xem {{cssxref("hue")}} để biết thêm thông tin. Trong `hsl()`, màu sRGB `0deg` biểu diễn màu đỏ. Tuy nhiên, trong không gian màu CIELab, `0deg` tương ứng với màu tím, trong khi màu đỏ xấp xỉ `41deg`.

### Điều chỉnh giá trị alpha của màu

Ví dụ sau cho thấy tác động của việc thay đổi giá trị `A` (alpha) của hàm màu `oklch()`.
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
  background-color: oklch(100% 0.57 217);
  width: 150px;
  height: 40px;
}
```

```css
[data-color="red"] {
  background-color: oklch(50% 0.5 20);
}
[data-color="red-alpha"] {
  background-color: oklch(50% 0.5 20 / 0.4);
}
```

#### Kết quả

{{EmbedLiveSample("adjusting_the_alpha_value_of_a_color")}}

### Sử dụng màu tương đối với oklch()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử ở giữa được đặt `--base-color` chưa sửa đổi, trong khi phần tử bên trái và bên phải được đặt các biến thể sáng hơn và tối hơn của `--base-color` đó.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `oklch()`, và màu đầu ra có kênh lightness được sửa đổi để đạt được hiệu ứng mong muốn thông qua hàm `calc()`. Màu sáng hơn có `0.15` (15%) được thêm vào kênh lightness, và màu tối hơn có `0.15` (15%) bị trừ khỏi kênh lightness.

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
  background-color: oklch(from var(--base-color) calc(l + 0.15) c h);
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: oklch(from var(--base-color) calc(l - 0.15) c h);
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Using relative colors with oklch()", "100%", "200") }}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Danh sách tất cả ký hiệu màu](/vi/docs/Web/CSS/Reference/Values/color_value)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- Kiểu dữ liệu {{cssxref("hue")}}
- Các hàm màu {{cssxref("color_value/lch","lch()")}} và {{cssxref("color_value/oklab","oklab()")}}
- [Interactive post on OkLCh color space](https://abhisaha.com/blog/interactive-post-oklch-color-space) (2024)
- [OKLCH in CSS: why we moved from RGB and HSL](https://evilmartians.com/chronicles/oklch-in-css-why-quit-rgb-hsl) (2024)
- [A perceptual color space for image processing](https://bottosson.github.io/posts/oklab/) (2020)
