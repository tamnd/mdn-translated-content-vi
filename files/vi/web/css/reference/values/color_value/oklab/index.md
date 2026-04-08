---
title: oklab()
slug: Web/CSS/Reference/Values/color_value/oklab
page-type: css-function
browser-compat: css.types.color.oklab
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-Oklab
  - https://drafts.csswg.org/css-color/#ok-lab
sidebar: cssref
---

Ký hiệu hàm **`oklab()`** biểu diễn một màu sắc nhất định trong {{glossary("color space", "không gian màu")}} Oklab, vốn cố gắng mô phỏng cách con người cảm nhận màu sắc.

Oklab là không gian màu cảm nhận và hữu ích để:

- Chuyển đổi hình ảnh sang thang độ xám, mà không thay đổi độ sáng của nó.
- Sửa đổi độ bão hòa màu, trong khi vẫn giữ nguyên nhận thức của người dùng về hue và lightness.
- Tạo gradient màu sắc mượt mà và đồng đều (khi nội suy thủ công, ví dụ, trong phần tử {{HTMLElement("canvas")}}).

`oklab()` hoạt động với hệ tọa độ Descartes trên không gian màu Oklab — các trục a và b. Nó có thể biểu diễn dải màu rộng hơn RGB, bao gồm cả màu wide-gamut và P3. Nếu bạn muốn hệ thống màu cực (chroma và hue), hãy sử dụng {{cssxref("color_value/oklch", "oklch()")}}.

## Cú pháp

```css
/* Giá trị tuyệt đối */
oklab(40.1% 0.1143 0.045);
oklab(59.69% 0.1007 0.1191);
oklab(59.69% 0.1007 0.1191 / 0.5);

/* Giá trị tương đối */
oklab(from green l a b / 0.5)
oklab(from #123456 calc(l + 0.1) a b / calc(alpha * 0.9))
oklab(from hsl(180 100% 50%) calc(l - 0.1) a b)
```

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

#### Cú pháp giá trị tuyệt đối

```plain
oklab(L a b[ / A])
```

Các tham số như sau:

- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `1`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này chỉ định độ sáng cảm nhận của màu. Số `0` tương ứng với `0%` (đen) và số `1` tương ứng với `100%` (trắng).
- `a`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-0.4` đến `0.4`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này chỉ định khoảng cách của màu dọc theo trục `a` trong không gian màu Oklab, xác định màu xanh lá (hướng về `-0.4`) hoặc đỏ (hướng về `+0.4`) của màu. Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±0.4` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±0.5`.
- `b`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-0.4` đến `0.4`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này chỉ định khoảng cách của màu dọc theo trục `b` trong không gian màu Oklab, xác định màu xanh lam (hướng về `-0.4`) hoặc vàng (hướng về `+0.4`) của màu. Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±0.4` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±0.5`.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

#### Cú pháp giá trị tương đối

```plain
oklab(from <color> L a b[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**. Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.
- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `1`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn độ sáng của màu đầu ra. Số `0` tương ứng với `0%` (đen) và số `1` tương ứng với `100%` (trắng).
- `a`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-0.4` đến `0.4`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn khoảng cách của màu đầu ra dọc theo trục `a` trong không gian màu Oklab, xác định màu xanh lá (hướng về `-0.4`) hoặc đỏ (hướng về `+0.4`) của màu. Lưu ý rằng các giá trị này có dấu và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±0.4` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±0.5`.
- `b`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-0.4` đến `0.4`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn khoảng cách của màu đầu ra dọc theo trục `b` trong không gian màu Oklab, xác định màu xanh lam (hướng về `-0.4`) hoặc vàng (hướng về `+0.4`) của màu. Lưu ý rằng các giá trị này có dấu và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±0.4` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±0.5`.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

#### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `oklab()`, trình duyệt chuyển đổi màu gốc thành màu Oklab tương đương (nếu chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `l` (lightness), `a` (trục xanh lá/đỏ) và `b` (trục xanh lam/vàng) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Giá trị kênh `l` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).
- Các kênh `a` và `b` đều được giải quyết thành `<number>` trong khoảng `-0.4` đến `0.4` (bao gồm).
- Kênh `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `oklab()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương `red`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `l`, `a` và `b` của màu gốc (`0.627966`, `0.22488` và `0.125859`) làm giá trị kênh đầu ra:

```css
oklab(from hsl(0 100% 50%) l a b)
```

Màu đầu ra của hàm này là `oklab(0.627966 0.22488 0.125859)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
oklab(from hsl(0 100% 50%) 42.1% 0.165 -0.101)
```

Trong trường hợp trên, màu đầu ra là `oklab(0.421 0.165 -0.101)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
oklab(from hsl(0 100% 50%) l -0.3 b)
```

Ví dụ này:

- Chuyển đổi màu gốc `hsl()` thành màu tương đương `oklab()` — `oklab(0.627966 0.22488 0.125859)`.
- Đặt các giá trị kênh `L` và `b` của màu đầu ra bằng các giá trị kênh `L` và `b` của tương đương `oklab()` gốc — những giá trị đó là `0.627966` và `0.125859`, tương ứng.
- Đặt giá trị kênh `a` của màu đầu ra thành giá trị mới không dựa trên màu gốc: `-0.3`.

Màu đầu ra cuối cùng là `oklab(0.627966 -0.3 0.125859)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
oklab(from hsl(0 100% 50% / 0.8) l a b / alpha)
/* Màu đầu ra được tính: oklab(0.627966 0.22488 0.125859 / 0.8) */

oklab(from hsl(0 100% 50% / 0.8) l a b / 0.5)
/* Màu đầu ra được tính: oklab(0.627966 0.22488 0.125859 / 0.5) */
```

Trong ví dụ sau, màu gốc `hsl()` lại được chuyển đổi thành tương đương `oklab()` — `oklab(0.627966 0.22488 0.125859)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `L`, `a`, `b` và `A`, dẫn đến màu đầu ra là `oklab(0.827966 0.14488 -0.0741406 / 0.9)`:

```css
oklab(from hsl(0 100% 50%) calc(l + 0.2) calc(a - 0.08) calc(b - 0.2) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Điều chỉnh độ sáng

Ví dụ sau cho thấy tác động của việc thay đổi giá trị lightness, trục a và trục b của hàm `oklab()`.

#### HTML

```html
<div data-color="red-dark"></div>
<div data-color="red"></div>
<div data-color="red-light"></div>

<div data-color="green-dark"></div>
<div data-color="green"></div>
<div data-color="green-light"></div>

<div data-color="blue-dark"></div>
<div data-color="blue"></div>
<div data-color="blue-light"></div>
```

#### CSS

```css hidden
body {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}
div {
  height: 50px;
  flex: 0 0 28%;
  border: 1px solid black;
}
```

```css
[data-color="red-dark"] {
  background-color: oklab(0.05 0.4 0.4);
}
[data-color="red"] {
  background-color: oklab(0.5 0.4 0.4);
}
[data-color="red-light"] {
  background-color: oklab(0.95 0.4 0.4);
}

[data-color="green-dark"] {
  background-color: oklab(5% -100% 0.4);
}
[data-color="green"] {
  background-color: oklab(50% -100% 0.4);
}
[data-color="green-light"] {
  background-color: oklab(95% -100% 0.4);
}

[data-color="blue-dark"] {
  background-color: oklab(0.05 -0.3 -0.4);
}
[data-color="blue"] {
  background-color: oklab(0.5 -0.3 -0.4);
}
[data-color="blue-light"] {
  background-color: oklab(0.95 -0.3 -0.4);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting", "", "200")}}

### Điều chỉnh độ trong suốt

Ví dụ sau minh họa tác động của việc thay đổi giá trị `A` (alpha) của hàm `oklab()`.
Các phần tử `red` và `red-alpha` chồng lên phần tử `#background-div` để minh họa tác động của độ trong suốt.
Đặt độ trong suốt của phần tử `red-alpha` là `0.4` làm nó trong suốt hơn phần tử `red`.

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
  background-color: lightblue;
  width: 150px;
  height: 40px;
}
```

```css
[data-color="red"] {
  background-color: oklab(0.628 0.225 0.126);
}
[data-color="red-alpha"] {
  background-color: oklab(0.628 0.225 0.126 / 0.4);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting_opacity", "100%", 155)}}

### Điều chỉnh trục màu

Ví dụ này minh họa tác động của việc đặt các giá trị `a` và `b` của hàm `oklab()` ở các đầu và điểm giữa của trục a và trục b. Trục a đi từ xanh lá (`-0.4`) đến đỏ (`0.4`) và trục b đi từ vàng (`-0.4`) đến xanh lam (`0.4`).

#### HTML

```html
<div data-color="red-yellow"></div>
<div data-color="red-zero"></div>
<div data-color="red-blue"></div>

<div data-color="zero-yellow"></div>
<div data-color="zero-zero"></div>
<div data-color="zero-blue"></div>

<div data-color="green-yellow"></div>
<div data-color="green-zero"></div>
<div data-color="green-blue"></div>
```

#### CSS

Sử dụng thuộc tính CSS {{cssxref("background-color")}}, chúng ta thay đổi các giá trị `a` và `b` của hàm màu `oklab()` dọc theo trục a và trục b, cho thấy tác động của các giá trị tối đa, điểm giữa và tối thiểu trong mỗi trường hợp.

```css hidden
body {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 10px;
}
div {
  height: 50px;
  flex: 0 0 28%;
  border: 1px solid black;
}
```

```css
/* a-axis max, variable b-axis */
[data-color="red-yellow"] {
  background-color: oklab(0.5 0.4 0.4);
}
[data-color="red-zero"] {
  background-color: oklab(0.5 0.4 0);
}
[data-color="red-blue"] {
  background-color: oklab(0.5 0.4 -0.4);
}

/* a-axis center, variable b-axis */
[data-color="zero-yellow"] {
  background-color: oklab(0.5 0 0.4);
}
[data-color="zero-zero"] {
  background-color: oklab(0.5 0 0);
}
[data-color="zero-blue"] {
  background-color: oklab(0.5 0 -0.4);
}

/* a-axis min, variable b-axis */
[data-color="green-yellow"] {
  background-color: oklab(0.5 -0.4 0.4);
}
[data-color="green-zero"] {
  background-color: oklab(0.5 -0.4 0);
}
[data-color="green-blue"] {
  background-color: oklab(0.5 -0.4 -0.4);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting_color_axes", "", "200")}}

Cột bên trái ở đầu vàng (`-0.4`) của trục b và cột bên phải ở đầu xanh lam (`0.4`). Hàng trên cùng hiển thị màu ở đầu đỏ của trục a (`-0.4`) và hàng dưới cùng ở đầu xanh lá (`0.4`). Cột và hàng giữa ở các điểm giữa của mỗi trục, với ô ở giữa là màu xám; nó không chứa đỏ, xanh lá, vàng hoặc xanh lam, với giá trị `0` cho cả hai trục.

### Gradient tuyến tính dọc theo trục a và trục b

Ví dụ này bao gồm các gradient tuyến tính để minh họa tiến trình các giá trị của hàm `oklab()` dọc theo trục a (từ đỏ đến xanh lá) và dọc theo trục b (từ vàng đến xanh lam). Trong mỗi hình ảnh gradient, một trục giữ nguyên trong khi trục kia tiến dần từ thấp đến cao.

```html hidden
<div data-color="red-to-green-yellow">
  <span>red</span><span>`b`= -0.4 (yellow)</span><span>green</span>
</div>
<div data-color="red-to-green-zero">
  <span>red</span><span>no yellow or blue</span><span>green</span>
</div>
<div data-color="red-to-green-blue">
  <span>red</span><span>`b`= 0.4 (blue)</span><span>green</span>
</div>

<div data-color="yellow-to-blue-red">
  <span>yellow</span><span>`a` = -0.4 (red)</span><span>blue</span>
</div>
<div data-color="yellow-to-blue-zero">
  <span>yellow</span><span>no red or green</span><span>blue</span>
</div>
<div data-color="yellow-to-blue-green">
  <span>yellow</span><span>`a` = 0.4 (green)</span><span>blue</span>
</div>
```

#### CSS

```css hidden
div {
  height: 50px;
  padding: 5px;
  margin: 5px;
  border: 1px solid black;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
span {
  background-color: #ffffffcc;
  padding: 3px;
}
```

```css-nolint
/* a-axis gradients */
[data-color="red-to-green-yellow"] {
  background-image: linear-gradient(to right, oklab(50% 0.4 0.4), oklab(50% -0.4 0.4));
}
[data-color="red-to-green-zero"] {
  background-image: linear-gradient(to right, oklab(50% 0.4 0), oklab(50% -0.4 0));
}
[data-color="red-to-green-blue"] {
  background-image: linear-gradient(to right, oklab(50% 0.4 -0.4), oklab(50% -0.4 -0.4));
}

/* b-axis gradients */
[data-color="yellow-to-blue-red"] {
  background-image: linear-gradient(to right, oklab(50% 0.4 0.4), oklab(50% 0.4 -0.4));
}
[data-color="yellow-to-blue-zero"] {
  background-image: linear-gradient(to right, oklab(50% 0 0.4), oklab(50% 0 -0.4));
}
[data-color="yellow-to-blue-green"] {
  background-image: linear-gradient(to right, oklab(50% -0.4 0.4),oklab(50% -0.4 -0.4));
}
```

#### Kết quả

{{EmbedLiveSample("Linear gradients along the a-axis and b-axis", '', '420')}}

### Sử dụng màu tương đối với oklab()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử ở giữa được đặt `--base-color` chưa sửa đổi, trong khi phần tử bên trái và bên phải được đặt các biến thể sáng hơn và tối hơn của `--base-color` đó.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `oklab()`, và màu đầu ra có kênh lightness được sửa đổi để đạt được hiệu ứng mong muốn thông qua hàm `calc()`. Màu sáng hơn có `0.15` (15%) được thêm vào kênh lightness, và màu tối hơn có `0.15` (15%) bị trừ khỏi kênh lightness.

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
  background-color: oklab(from var(--base-color) calc(l + 0.15) a b);
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: oklab(from var(--base-color) calc(l - 0.15) a b);
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Using relative colors with oklab()", "100%", "200") }}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kiểu dữ liệu `<color>`](/vi/docs/Web/CSS/Reference/Values/color_value) để biết danh sách tất cả các ký hiệu màu
- Các hàm màu {{cssxref("color_value/lab","lab()")}} và {{cssxref("color_value/oklch","oklch()")}}
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- [A perceptual color space for image processing](https://bottosson.github.io/posts/oklab/) trên bottosson.github.io (2023)
- [OKLAB color wheel](https://observablehq.com/@shan/oklab-color-wheel) trên observablehq.com
