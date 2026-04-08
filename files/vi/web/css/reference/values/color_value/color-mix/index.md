---
title: color-mix()
slug: Web/CSS/Reference/Values/color_value/color-mix
page-type: css-function
browser-compat: css.types.color.color-mix
sidebar: cssref
---

Ký hiệu hàm **`color-mix()`** nhận hai giá trị {{cssxref("&lt;color&gt;")}} và trả về kết quả trộn chúng trong một không gian màu nhất định theo một tỷ lệ nhất định.

## Cú pháp

```css
/* Không gian màu cực */
color-mix(in hsl, hsl(200 50 80), coral)
color-mix(in hsl, hsl(200 50 80) 20%, coral 80%)

/* Không gian màu chữ nhật */
color-mix(in srgb, plum, #123456)
color-mix(in lab, plum 60%, #123456 50%)

/* Với phương pháp nội suy hue */
color-mix(in lch increasing hue, hsl(200deg 50% 80%), coral)
color-mix(in lch longer hue, hsl(200deg 50% 80%) 44%, coral 16%)
```

### Tham số

`color-mix( <color-interpolation-method>, <color> [<percentage>], <color> [<percentage>] )` chấp nhận các tham số sau:

- {{CSSXref("&lt;color-interpolation-method&gt;")}}
  - : Chỉ định phương pháp nội suy nào sẽ được sử dụng để trộn màu. Nó bao gồm từ khóa `in` theo sau là một {{glossary("color space", "không gian màu")}} (một trong các không gian màu được liệt kê trong [cú pháp chính thức](#formal_syntax)), và tùy chọn một {{CSSXref("&lt;hue-interpolation-method&gt;")}}.

- {{CSSXref("&lt;color&gt;")}}
  - : Màu cần trộn; có thể là bất kỳ giá trị `<color>` hợp lệ nào.

- {{CSSXref("&lt;percentage&gt;")}} {{optional_inline}}
  - : Giá trị phần trăm chỉ định lượng màu tương ứng cần trộn; có thể là bất kỳ giá trị `<percentage>` nào từ `0%` đến `100%`, bao gồm.

### Giá trị trả về

Một `<color>`; kết quả trộn các màu trong `<color-space>` đã cho, theo các lượng và hướng hue đã chỉ định.

## Mô tả

Hàm `color-mix()` cho phép trộn hai giá trị {{cssxref("&lt;color&gt;")}} thuộc bất kỳ loại nào, theo một tỷ lệ cụ thể, trong một không gian màu nhất định, sử dụng phương pháp nội suy hue ngắn hơn hoặc dài hơn. Trình duyệt hỗ trợ rất nhiều không gian màu; hàm `color-mix()` cho phép trộn nhiều loại màu, không giới hạn ở không gian màu sRGB.

{{EmbedGHLiveSample("css-examples/tools/color-mixer/", '100%', 400)}}

Demo này cho phép bạn chọn hai màu, `color-one` và `color-two`, và trộn chúng, có thể đặt phần trăm của mỗi màu, không gian màu để trộn màu, và phương pháp nội suy. Các màu nguồn được hiển thị ở bên ngoài, và màu trộn được hiển thị ở giữa. Bạn có thể thay đổi màu bằng cách nhấp vào chúng và chọn màu mới từ bộ chọn màu. Thay đổi các giá trị phần trăm của mỗi màu bằng thanh trượt. Thay đổi không gian màu qua menu thả xuống.

### Chọn không gian màu

Việc chọn không gian màu phù hợp rất quan trọng để tạo ra kết quả mong muốn. Với cùng một cặp màu để trộn, các không gian màu khác nhau có thể phù hợp hơn tùy thuộc vào trường hợp sử dụng nội suy.

- Nếu muốn kết quả trộn hai ánh sáng màu về mặt vật lý, không gian màu CIE XYZ hoặc srgb-linear là phù hợp vì chúng tuyến tính về cường độ ánh sáng.
- Nếu cần phân bố màu đều đặn theo nhận thức (chẳng hạn trong gradient), các không gian màu Oklab (và Lab cũ hơn) phù hợp vì chúng được thiết kế để đồng đều về nhận thức.
- Nếu muốn tránh hiện tượng màu trở nên xám khi trộn, tức là tối đa hóa chroma trong suốt quá trình chuyển tiếp, các không gian màu Oklch (và LCH cũ hơn) hoạt động tốt.
- Chỉ sử dụng sRGB nếu cần khớp hành vi của một thiết bị hoặc phần mềm cụ thể sử dụng sRGB. Không gian màu sRGB không tuyến tính và không đồng đều về nhận thức, và tạo ra kết quả kém hơn như màu trộn tối quá hoặc xám quá.

### Phương pháp nội suy màu

{{CSSXref("&lt;color-interpolation-method&gt;")}} chỉ định phương pháp nội suy nào được sử dụng để trộn màu. Nó bao gồm từ khóa `in` và không gian màu để trộn màu.
Không gian màu phải là một trong các không gian màu có sẵn được liệt kê trong [cú pháp chính thức](#formal_syntax). Tùy thuộc vào không gian màu được sử dụng, bạn có thể tùy chọn hướng hue được trộn dọc theo đường dài hơn hoặc ngắn hơn.

Danh mục [`<rectangular-color-space>`](/vi/docs/Web/CSS/Reference/Values/color-interpolation-method#rectangular-color-space) bao gồm [`srgb`](/vi/docs/Glossary/Color_space#srgb), [`srgb-linear`](/vi/docs/Glossary/Color_space#srgb-linear), [`display-p3`](/vi/docs/Glossary/Color_space#display-p3), [`a98-rgb`](/vi/docs/Glossary/Color_space#a98-rgb), [`prophoto-rgb`](/vi/docs/Glossary/Color_space#prophoto-rgb), [`rec2020`](/vi/docs/Glossary/Color_space#rec2020), [`lab`](/vi/docs/Glossary/Color_space#cielab_color_spaces), [`oklab`](/vi/docs/Glossary/Color_space#oklab), [`xyz`](/vi/docs/Glossary/Color_space#xyz_color_spaces), [`xyz-d50`](/vi/docs/Glossary/Color_space#xyz), và [`xyz-d65`](/vi/docs/Glossary/Color_space#xyz-d50).

Danh mục `<polar-color-space>` bao gồm [`hsl`](/vi/docs/Web/CSS/Reference/Values/color_value/hsl), [`hwb`](/vi/docs/Web/CSS/Reference/Values/color_value/hwb), [`lch`](/vi/docs/Web/CSS/Reference/Values/color_value/lch), và [`oklch`](/vi/docs/Web/CSS/Reference/Values/color_value/oklch). Với các không gian màu này, bạn có thể tùy chọn theo sau tên không gian màu bằng một {{CSSXref("&lt;hue-interpolation-method&gt;")}}. Giá trị này mặc định là `shorter hue`, nhưng cũng có thể đặt là `longer hue`, `increasing hue`, hoặc `decreasing hue`.

### Phần trăm màu

Mỗi trong hai màu có thể được khai báo với giá trị `<percentage>` từ `0%` đến `100%`, chỉ định lượng màu tương ứng cần trộn. Các phần trăm được chuẩn hóa nếu tổng giá trị các phần trăm đã khai báo không bằng `100%`.

Hai phần trăm màu (chúng ta sẽ gọi chúng là `p1` và `p2`) được chuẩn hóa như sau:

- Nếu cả `p1` và `p2` đều bị bỏ qua, thì `p1 = p2 = 50%`.
- Nếu `p1` bị bỏ qua, thì `p1 = 100% - p2`.
- Nếu `p2` bị bỏ qua, thì `p2 = 100% - p1`.
- Nếu `p1 = p2 = 0%`, hàm không hợp lệ.
- Nếu `p1 + p2 ≠ 100%`, thì `p1' = p1 / (p1 + p2)` và `p2' = p2 / (p1 + p2)`, trong đó `p1'` và `p2'` là kết quả chuẩn hóa.
  - Nếu `p1 + p2 < 100%`, thì một hệ số nhân alpha là `p1 + p2` được áp dụng cho màu kết quả. Điều này tương tự như trộn với [`transparent`](/vi/docs/Web/CSS/Reference/Values/named-color#transparent), với phần trăm `pt = 100% - p1 - p2`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Trộn hai màu

Ví dụ này minh họa việc trộn hai màu, đỏ `#a71e14` theo các phần trăm khác nhau và trắng không có phần trăm. Phần trăm của `#a71e14` càng cao thì màu đầu ra càng đỏ và càng ít trắng.

#### HTML

```html
<ul>
  <li>0%</li>
  <li>25%</li>
  <li>50%</li>
  <li>75%</li>
  <li>100%</li>
  <li></li>
</ul>
```

#### CSS

Hàm `color-mix()` được sử dụng để thêm các phần trăm đỏ tăng dần, lên đến 100%. Phần tử {{htmlelement("li")}} thứ 6 không bao gồm phần trăm cho cả hai màu.

```css hidden
ul {
  display: flex;
  list-style-type: none;
  font-size: 150%;
  gap: 10px;
  border: 2px solid;
  padding: 10px;
}

li {
  padding: 10px;
  flex: 1;
  box-sizing: border-box;
  font-family: monospace;
  outline: 3px solid #a71e14;
  text-align: center;
}
```

```css
li:nth-child(1) {
  background-color: color-mix(in oklab, #a71e14 0%, white);
}

li:nth-child(2) {
  background-color: color-mix(in oklab, #a71e14 25%, white);
}

li:nth-child(3) {
  background-color: color-mix(in oklab, #a71e14 50%, white);
}

li:nth-child(4) {
  background-color: color-mix(in oklab, #a71e14 75%, white);
}

li:nth-child(5) {
  background-color: color-mix(in oklab, #a71e14 100%, white);
}

li:nth-child(6) {
  background-color: color-mix(in oklab, #a71e14, white);
}
```

#### Kết quả

{{EmbedLiveSample("mixing_two_colors", "100%", 120)}}

Tổng giá trị của cả hai màu trong hàm `color-mix()` là 100%, ngay cả khi các giá trị do nhà phát triển đặt không cộng lại bằng 100%. Trong ví dụ này, vì chỉ một màu được gán phần trăm, màu còn lại ngầm được gán giá trị phần trăm sao cho tổng cộng bằng 100%. Trong phần tử {{htmlelement("li")}} cuối cùng, nơi không có màu nào được gán phần trăm, cả hai mặc định là 50%.

### Thêm độ trong suốt

Ví dụ này minh họa việc sử dụng hàm `color-mix()` để thêm độ trong suốt cho một màu bằng cách trộn bất kỳ màu nào với [`transparent`](/vi/docs/Web/CSS/Reference/Values/named-color#transparent).

#### HTML

```html
<ul>
  <li>0%</li>
  <li>25%</li>
  <li>50%</li>
  <li>75%</li>
  <li>100%</li>
  <li></li>
</ul>
```

#### CSS

Hàm `color-mix()` được sử dụng để thêm các phần trăm `red` tăng dần, được khai báo bằng [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) có tên `--base`, được định nghĩa trên {{cssxref(":root")}}. Phần tử {{htmlelement("li")}} thứ 6 không bao gồm phần trăm, tạo ra màu đầu ra có độ trong suốt bằng một nửa màu `--base`. Chúng ta bao gồm nền có sọc trên {{htmlelement("ul")}} để làm cho độ trong suốt hiển thị.

```css hidden
ul {
  display: flex;
  list-style-type: none;
  font-size: 150%;
  gap: 10px;
  border: 2px solid;
  padding: 10px;
}

li {
  padding: 10px;
  flex: 1;
  box-sizing: border-box;
  font-family: monospace;
  outline: 1px solid var(--base);
  text-align: center;
}
```

```css
:root {
  --base: red;
}

ul {
  background: repeating-linear-gradient(
    45deg,
    chocolate 0px 2px,
    white 2px 12px
  );
}

li:nth-child(1) {
  background-color: color-mix(in srgb, var(--base) 0%, transparent);
}

li:nth-child(2) {
  background-color: color-mix(in srgb, var(--base) 25%, transparent);
}

li:nth-child(3) {
  background-color: color-mix(in srgb, var(--base) 50%, transparent);
}

li:nth-child(4) {
  background-color: color-mix(in srgb, var(--base) 75%, transparent);
}

li:nth-child(5) {
  background-color: color-mix(in srgb, var(--base) 100%, transparent);
}

li:nth-child(6) {
  background-color: color-mix(in srgb, var(--base), transparent);
}
```

#### Kết quả

{{EmbedLiveSample("adding transparency", "100%", 120)}}

Theo cách này, hàm `color-mix()` có thể được sử dụng để thêm độ trong suốt cho bất kỳ màu nào, ngay cả khi màu đó đã không hoàn toàn mờ đục (với giá trị kênh alpha < 1). Tuy nhiên, `color-mix()` không thể được sử dụng để làm cho màu nửa trong suốt trở nên hoàn toàn mờ đục. Đối với điều này, hãy sử dụng [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors) với [hàm màu](/vi/docs/Web/CSS/Guides/Colors#functions) CSS. Màu tương đối có thể thay đổi giá trị của bất kỳ kênh màu nào, kể cả tăng kênh alpha của màu để làm cho màu trở nên hoàn toàn mờ đục.

### Sử dụng nội suy hue trong color-mix()

Ví dụ này minh họa các phương pháp nội suy hue có sẵn cho hàm `color-mix()`. Khi sử dụng [nội suy](/vi/docs/Web/CSS/Reference/Values/color_value#interpolation) hue, hue kết quả nằm giữa các giá trị hue của hai màu được trộn. Giá trị sẽ khác nhau dựa trên lộ trình nào được thực hiện xung quanh bánh xe màu.

Để biết thêm thông tin, xem {{cssxref("&lt;hue-interpolation-method&gt;")}}.

```html hidden
<p>longer</p>
<ul>
  <li>100%</li>
  <li>80%</li>
  <li>60%</li>
  <li>40%</li>
  <li>20%</li>
  <li>0%</li>
</ul>
<p>shorter</p>
<ul>
  <li>100%</li>
  <li>80%</li>
  <li>60%</li>
  <li>40%</li>
  <li>20%</li>
  <li>0%</li>
</ul>
<p>increasing</p>
<ul>
  <li>100%</li>
  <li>80%</li>
  <li>60%</li>
  <li>40%</li>
  <li>20%</li>
  <li>0%</li>
</ul>
<p>decreasing</p>
<ul>
  <li>100%</li>
  <li>80%</li>
  <li>60%</li>
  <li>40%</li>
  <li>20%</li>
  <li>0%</li>
</ul>
```

#### CSS

Phương pháp nội suy `shorter hue` đi theo lộ trình ngắn hơn xung quanh bánh xe màu, trong khi phương pháp `longer hue` đi theo lộ trình dài hơn. Với `increasing hue`, lộ trình bắt đầu với các giá trị tăng dần. Với `decreasing hue`, giá trị giảm dần. Chúng ta trộn hai giá trị {{cssxref("named-color")}} để tạo ra một loạt màu trung gian `lch()` khác nhau dựa trên lộ trình nào được thực hiện xung quanh bánh xe màu. Các màu trộn bao gồm `red`, `blue`, và `yellow` với giá trị hue LCH xấp xỉ 41deg, 301deg, và 100deg, tương ứng.

Để giảm dư thừa code, chúng ta sử dụng [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Reference/Properties/--*) cho cả hai màu và phương pháp nội suy, đặt các giá trị khác nhau trên mỗi {{htmlelement("ul")}}.

```css hidden
body {
  font-family: monospace;
}
ul {
  display: flex;
  list-style-type: none;
  font-size: 150%;
  gap: 10px;
  padding: 10px;
  margin: 0;
}

li {
  padding: 10px;
  flex: 1;
  outline: 1px solid var(--base);
  text-align: center;
}
```

```css
ul:nth-of-type(1) {
  --distance: longer; /* tăng 52 độ hue */
  --base: red;
  --mixin: blue;
}
ul:nth-of-type(2) {
  /* giảm 20 độ hue */
  --distance: shorter;
  --base: red;
  --mixin: blue;
}
ul:nth-of-type(3) {
  /* tăng 40 độ hue */
  --distance: increasing;
  --base: yellow;
  --mixin: blue;
}
ul:nth-of-type(4) {
  /* giảm 32 độ hue */
  --distance: decreasing;
  --base: yellow;
  --mixin: blue;
}

li:nth-child(1) {
  background-color: color-mix(
    in lch var(--distance) hue,
    var(--base) 100%,
    var(--mixin)
  );
}

li:nth-child(2) {
  background-color: color-mix(
    in lch var(--distance) hue,
    var(--base) 80%,
    var(--mixin)
  );
}

li:nth-child(3) {
  background-color: color-mix(
    in lch var(--distance) hue,
    var(--base) 60%,
    var(--mixin)
  );
}

li:nth-child(4) {
  background-color: color-mix(
    in lch var(--distance) hue,
    var(--base) 40%,
    var(--mixin)
  );
}

li:nth-child(5) {
  background-color: color-mix(
    in lch var(--distance) hue,
    var(--base) 20%,
    var(--mixin)
  );
}

li:nth-child(6) {
  background-color: color-mix(
    in lch var(--distance) hue,
    var(--base) 0%,
    var(--mixin)
  );
}
```

#### Kết quả

{{EmbedLiveSample("using_hue_interpolation_in_color_mix", "100%", 440)}}

Với `longer hue`, các mức tăng hoặc giảm giữa các màu sẽ luôn bằng hoặc lớn hơn khi sử dụng `shorter hue`. Sử dụng `increasing hue` hoặc `decreasing hue` khi hướng thay đổi của giá trị hue quan trọng hơn độ dài giữa các giá trị.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("&lt;color&gt;")}}
- {{CSSXref("&lt;color-interpolation-method&gt;")}}
- {{cssxref("hue")}}
- [Màu tương đối CSS](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
