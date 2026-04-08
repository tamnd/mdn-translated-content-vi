---
title: lab()
slug: Web/CSS/Reference/Values/color_value/lab
page-type: css-function
browser-compat: css.types.color.lab
spec-urls:
  - https://drafts.csswg.org/css-color-5/#relative-Lab
  - https://drafts.csswg.org/css-color/#lab-colors
sidebar: cssref
---

Ký hiệu hàm **`lab()`** biểu diễn một màu sắc nhất định trong {{glossary("color space", "không gian màu")}} CIE L\*a\*b\*.

Lab biểu diễn toàn bộ phạm vi màu sắc mà con người có thể nhìn thấy bằng cách chỉ định độ sáng của màu, giá trị trục đỏ/xanh lá, giá trị trục xanh lam/vàng, và tùy chọn giá trị độ trong suốt alpha.

## Cú pháp

```css
/* Giá trị tuyệt đối */
lab(29.2345% 39.3825 20.0664);
lab(52.2345% 40.1645 59.9971);
lab(52.2345% 40.1645 59.9971 / .5);

/* Giá trị tương đối */
lab(from green l a b / 0.5)
lab(from #123456 calc(l + 10) a b)
lab(from hsl(180 100% 50%) calc(l - 10) a b)
```

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả giá trị tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

#### Cú pháp giá trị tuyệt đối

```plain
lab(L a b[ / A])
```

Các tham số như sau:

- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `100`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này chỉ định độ sáng của màu. Ở đây số `0` tương ứng với `0%` (đen) và số `100` tương ứng với `100%` (trắng).
- `a`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-125` đến `125`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này chỉ định khoảng cách của màu dọc theo trục `a`, xác định màu xanh lá (hướng về `-125`) hoặc đỏ (hướng về `+125`) của màu. Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±125` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±160`.
- `b`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-125` đến `125`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này chỉ định khoảng cách của màu dọc theo trục `b`, xác định màu xanh lam (hướng về `-125`) hoặc vàng (hướng về `+125`) của màu. Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±125` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±160`.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định là 100%. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

#### Cú pháp giá trị tương đối

```plain
lab(from <color> L a b[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu diễn **màu gốc**. Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là _bất kỳ_ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả màu tương đối khác.
- `L`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `0` đến `100`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `0%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn độ sáng của màu đầu ra. Ở đây số `0` tương ứng với `0%` (đen) và số `100` tương ứng với `100%` (trắng).
- `a`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-125` đến `125`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn khoảng cách của màu đầu ra dọc theo trục `a`, xác định màu xanh lá (hướng về `-125`) hoặc đỏ (hướng về `+125`) của màu. Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±125` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±160`.
- `b`
  - : Một {{CSSXref("&lt;number&gt;")}} trong khoảng `-125` đến `125`, một {{CSSXref("&lt;percentage&gt;")}} trong khoảng `-100%` đến `100%`, hoặc từ khóa `none` (tương đương `0%` trong trường hợp này). Giá trị này biểu diễn khoảng cách của màu đầu ra dọc theo trục `b`, xác định màu xanh lam (hướng về `-125`) hoặc vàng (hướng về `+125`) của màu. Lưu ý rằng các giá trị này có dấu (cho phép cả giá trị dương và âm) và về lý thuyết không có giới hạn, nghĩa là bạn có thể đặt giá trị ngoài giới hạn `±125` (`±100%`). Trong thực tế, giá trị không thể vượt quá `±160`.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu diễn giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn mờ đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ, nó mặc định bằng giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đứng trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Thông thường khi các giá trị phần trăm có tương đương số trong CSS, `100%` bằng số `1`. Điều này không phải lúc nào cũng đúng với độ sáng của Lab và các trục `a` và `b`, như đã đề cập ở trên. Với `L`, phạm vi là từ 0 đến 100, với `100%` bằng `100`. Các giá trị `a` và `b` hỗ trợ cả giá trị âm và dương, với `100%` bằng `125` và `-100%` bằng `-125`.

#### Xác định các thành phần kênh màu đầu ra của màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `lab()`, trình duyệt chuyển đổi màu gốc thành màu Lab tương đương (nếu chưa được chỉ định như vậy). Màu được định nghĩa bởi ba giá trị kênh màu riêng biệt — `l` (lightness), `a` (trục xanh lá/đỏ) và `b` (trục xanh lam/vàng) — cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Giá trị kênh `l` được giải quyết thành `<number>` trong khoảng `0` đến `100` (bao gồm).
- Các kênh `a` và `b` đều được giải quyết thành `<number>` trong khoảng `-125` đến `125` (bao gồm).
- Kênh `alpha` được giải quyết thành `<number>` trong khoảng `0` đến `1` (bao gồm).

Khi định nghĩa màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu diễn theo nhiều cách khác nhau. Dưới đây, chúng ta sẽ xem xét một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên xuất ra màu giống như màu gốc và ví dụ thứ hai xuất ra màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn sẽ khó có thể dùng các ví dụ này trong codebase thực tế, và thay vào đó có thể sử dụng giá trị màu tuyệt đối. Chúng tôi bao gồm các ví dụ này như điểm khởi đầu cho việc học cú pháp `lab()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương `red`). Hàm sau xuất ra màu giống như màu gốc — nó sử dụng các giá trị kênh `l`, `a` và `b` của màu gốc (`54.29`, `80.8198` và `69.8997`) làm giá trị kênh đầu ra:

```css
lab(from hsl(0 100% 50%) l a b)
```

Màu đầu ra của hàm này là `lab(54.29 80.8198 69.8997)`.

Hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, xuất ra màu hoàn toàn khác không dựa trên màu gốc:

```css
lab(from hsl(0 100% 50%) 29.692% 44.89% -29.034%)
```

Trong trường hợp trên, màu đầu ra là `lab(29.692 56.1125 -36.2925)`.

Hàm sau tạo ra màu tương đối dựa trên màu gốc:

```css
lab(from hsl(0 100% 50%) l -100 b)
```

Ví dụ này:

- Chuyển đổi màu gốc `hsl()` thành màu tương đương `lab()` — `lab(54.29 80.8198 69.8997)`.
- Đặt các giá trị kênh `l` và `b` của màu đầu ra bằng các giá trị kênh `L` và `b` của tương đương `lab()` gốc — những giá trị đó là `54.29` và `69.8997`, tương ứng.
- Đặt giá trị kênh `a` của màu đầu ra thành giá trị mới không dựa trên màu gốc: `-100`.

Màu đầu ra cuối cùng là `lab(54.29 -100 69.8997)`.

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình với màu đầu ra ở phía sau để nó có thể được biểu diễn theo cách tương thích (tức là sử dụng cùng các kênh).

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha không được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha của màu đầu ra không được chỉ định, nó mặc định bằng giá trị kênh alpha của màu gốc. Khi kênh alpha của màu gốc không được chỉ định (và nó không phải là màu tương đối), nó mặc định là `1`. Do đó, các giá trị kênh alpha của màu gốc và đầu ra là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định các giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra bằng giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
lab(from hsl(0 100% 50% / 0.8) l a b / alpha)
/* Màu đầu ra được tính: lab(54.29 80.8198 69.8997 / 0.8) */

lab(from hsl(0 100% 50% / 0.8) l a b / 0.5)
/* Màu đầu ra được tính: lab(54.29 80.8198 69.8997 / 0.5) */
```

Trong ví dụ sau, màu gốc `hsl()` lại được chuyển đổi thành tương đương `lab()` — `lab(54.29 80.8198 69.8997)`. Tính toán {{cssxref("calc")}} được áp dụng cho các giá trị `L`, `a`, `b` và `A`, dẫn đến màu đầu ra là `lab(74.29 60.8198 29.8997 / 0.9)`:

```css
lab(from hsl(0 100% 50%) calc(l + 20) calc(a - 20) calc(b - 40) / calc(alpha - 0.1))
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải quyết thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong các phép tính, ngay cả trong các trường hợp mà một kênh thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Việc cộng `<percentage>` vào `<number>`, ví dụ, không hoạt động.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Điều chỉnh độ sáng

Ví dụ sau minh họa hiệu ứng của việc thay đổi giá trị độ sáng của hàm `lab()`.

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
  background-color: lab(5 125 71);
}
[data-color="red"] {
  background-color: lab(40 125 71);
}
[data-color="red-light"] {
  background-color: lab(95 125 71);
}

[data-color="green-dark"] {
  background-color: lab(10% -120 125);
}
[data-color="green"] {
  background-color: lab(50% -120 125);
}
[data-color="green-light"] {
  background-color: lab(90% -120 125);
}

[data-color="blue-dark"] {
  background-color: lab(10 -120 -120);
}
[data-color="blue"] {
  background-color: lab(50 -120 -120);
}
[data-color="blue-light"] {
  background-color: lab(90 -120 -120);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting_lightness", "", "200")}}

### Điều chỉnh trục màu

Ví dụ này minh họa tác động của việc đặt các giá trị `a` và `b` của hàm `lab()` ở các đầu và điểm giữa của trục a, đi từ xanh lá (-125) đến đỏ (125) và trục b, đi từ vàng (-125) đến xanh lam (125).

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

Sử dụng thuộc tính CSS {{cssxref("background-color")}}, chúng ta thay đổi các giá trị `a` và `b` của hàm màu `lab()` dọc theo trục a và trục b, cho thấy tác động của các giá trị tối đa, điểm giữa và tối thiểu trong mỗi trường hợp.

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
  background-color: lab(50 125 125);
}
[data-color="red-zero"] {
  background-color: lab(50 125 0);
}
[data-color="red-blue"] {
  background-color: lab(50 125 -125);
}

/* a-axis center, variable b-axis */
[data-color="zero-yellow"] {
  background-color: lab(50 0 125);
}
[data-color="zero-zero"] {
  background-color: lab(50 0 0);
}
[data-color="zero-blue"] {
  background-color: lab(50 0 -125);
}

/* a-axis min, variable b-axis */
[data-color="green-yellow"] {
  background-color: lab(50 -125 125);
}
[data-color="green-zero"] {
  background-color: lab(50 -125 0);
}
[data-color="green-blue"] {
  background-color: lab(50 -125 -125);
}
```

#### Kết quả

{{EmbedLiveSample("Adjusting_color_axes", "", "200")}}

Cột bên trái ở đầu vàng (-125) của trục b và cột bên phải ở đầu xanh lam (125). Hàng trên cùng hiển thị màu ở đầu đỏ của trục a (-125) và hàng dưới cùng ở đầu xanh lá (125). Cột và hàng giữa ở các điểm giữa (0) của mỗi trục, với ô ở giữa là màu xám; nó không chứa đỏ, xanh lá, vàng hoặc xanh lam, với giá trị `0` cho cả hai trục.

### Gradient tuyến tính dọc theo trục a và trục b

Ví dụ này bao gồm các gradient tuyến tính để minh họa tiến trình các giá trị của hàm `lab()` dọc theo trục a (từ đỏ đến xanh lá) và dọc theo trục b (từ vàng đến xanh lam). Trong mỗi hình ảnh gradient, một trục giữ nguyên trong khi trục kia tiến dần từ đầu thấp đến đầu cao của các giá trị trục.

```html hidden
<div data-color="red-to-green-yellow">
  <span>red</span><span>`b`= -125 (yellow)</span><span>green</span>
</div>
<div data-color="red-to-green-zero">
  <span>red</span><span>no yellow or blue</span><span>green</span>
</div>
<div data-color="red-to-green-blue">
  <span>red</span><span>`b`= 125 (blue)</span><span>green</span>
</div>

<div data-color="yellow-to-blue-red">
  <span>yellow</span><span>`a` = -125 (red)</span><span>blue</span>
</div>
<div data-color="yellow-to-blue-zero">
  <span>yellow</span><span>no red or green</span><span>blue</span>
</div>
<div data-color="yellow-to-blue-green">
  <span>yellow</span><span>`a` = 125 (green)</span><span>blue</span>
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
  background-image: linear-gradient(to right, lab(50 125 125), lab(50 -125 125));
}
[data-color="red-to-green-zero"] {
  background-image: linear-gradient(to right, lab(50 125 0), lab(50 -125 0));
}
[data-color="red-to-green-blue"] {
  background-image: linear-gradient(to right, lab(50 125 -125), lab(50 -125 -125));
}

/* b-axis gradients */
[data-color="yellow-to-blue-red"] {
  background-image: linear-gradient(to right, lab(50 125 125), lab(50 125 -125));
}
[data-color="yellow-to-blue-zero"] {
  background-image: linear-gradient(to right, lab(50 0 125), lab(50 0 -125));
}
[data-color="yellow-to-blue-green"] {
  background-image: linear-gradient(to right, lab(50 -125 125),lab(50 -125 -125));
}
```

#### Kết quả

{{EmbedLiveSample("Linear gradients along the a-axis and b-axis", '', '420')}}

### Điều chỉnh độ trong suốt

Ví dụ sau đây minh họa tác động của việc thay đổi giá trị `A` (alpha) của ký hiệu hàm `lab()`.
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
  background-color: lightblue;
  width: 150px;
  height: 40px;
}
```

```css
[data-color="red"] {
  background-color: lab(80 125 125);
}
[data-color="red-alpha"] {
  background-color: lab(80 125 125 / 0.4);
}
```

#### Kết quả

{{EmbedLiveSample('Adjusting_opacity')}}

### Sử dụng màu tương đối với lab()

Ví dụ này tạo kiểu cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử ở giữa được đặt `--base-color` chưa sửa đổi, trong khi phần tử bên trái và bên phải được đặt các biến thể sáng hơn và tối hơn của `--base-color` đó.

Các biến thể này được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `lab()`, và màu đầu ra có kênh lightness được sửa đổi để đạt được hiệu ứng mong muốn thông qua hàm `calc()`. Màu sáng hơn có 15% được thêm vào kênh lightness, và màu tối hơn có 15% bị trừ khỏi kênh lightness.

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
  /* equivalent of lab(75 24 79) */
}

#one {
  background-color: lab(from var(--base-color) calc(l + 15) a b);
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: lab(from var(--base-color) calc(l - 15) a b);
}
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("Using relative colors with lab", "100%", "200") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Kiểu dữ liệu [`<color-function>`](/vi/docs/Web/CSS/Guides/Colors#functions)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- Mô-đun [CSS colors](/vi/docs/Web/CSS/Guides/Colors)
- [LCH colors in CSS: what, why, and how?](https://lea.verou.me/blog/2020/04/lch-colors-in-css-what-why-and-how/) by Lea Verou (2020)
- [Safari Technology Preview 122 release notes](https://webkit.org/blog/11577/release-notes-for-safari-technology-preview-122/): bao gồm màu `lab()` và {{cssxref("color_value/lch",'lch()')}}
