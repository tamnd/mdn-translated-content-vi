---
title: Using CSS custom functions
slug: Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions
page-type: guide
sidebar: cssref
---

CSS custom functions cho phép bạn tạo các khối mã CSS có thể tái sử dụng, có thể nhận đối số, chứa logic phức tạp (được định nghĩa bằng các tính năng như hàm CSS {{cssxref("if()")}} và at-rule {{cssxref("@media")}}), và trả về giá trị dựa trên logic đó. Chúng hoạt động tương tự như [CSS custom properties](/en-US/docs/Web/CSS/Reference/Properties/--*), nhưng linh hoạt hơn.

Trong bài viết này, chúng ta sẽ xem cách sử dụng chúng và trình bày một số ví dụ thực tế.

## Cơ bản về function

Một định nghĩa CSS custom function cơ bản trông như sau:

```css
@function --half-opacity() {
  result: 0.5;
}
```

Sau cú pháp `@function`, chúng ta định nghĩa tên cho function: `--half-opacity`. Đây phải là kiểu {{cssxref("&lt;dashed-ident>")}} — nó phải bắt đầu bằng hai dấu gạch ngang, và phân biệt chữ hoa chữ thường. Tên function được theo ngay sau bởi một cặp dấu ngoặc đơn (`()`) và một cặp dấu ngoặc nhọn (`{}`).

> [!NOTE]
> Nếu có nhiều CSS function được đặt cùng tên, function trong cascade {{cssxref("@layer")}} mạnh hơn sẽ thắng. Nếu tất cả đều ở cùng một layer, function được định nghĩa cuối cùng theo thứ tự nguồn sẽ thắng.

Bên trong dấu ngoặc nhọn là **body** của function, nơi logic của function được định nghĩa. Phần này có thể chứa nhiều khai báo, bao gồm custom properties (sẽ được scoped cục bộ vào body của function), các at-rule như {{cssxref("@media")}}, và descriptor [`result`](/en-US/docs/Web/CSS/Reference/At-rules/@function#result_2). Giá trị của descriptor `result` được đánh giá để xác định giá trị được trả về bởi function.

Ở đây, chúng ta đang đặt `result` thành giá trị `0.5`: function `--half-opacity()` sẽ luôn trả về `0.5`.

### Tại sao là "result" chứ không phải "return"?

Descriptor `result` nghe có vẻ tương tự về chức năng với câu lệnh JavaScript [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return). Tuy nhiên, `return` không được sử dụng trong CSS function. Điều này là vì, không giống như câu lệnh JavaScript `return`, CSS function không trả về giá trị ngay khi khai báo `result` được đến.

Body của một CSS function được đánh giá từ đầu đến cuối. Nếu có nhiều khai báo `result` trong body, khai báo cuối cùng theo thứ tự nguồn sẽ ghi đè lên các khai báo trước.

### Gọi một CSS function

Một CSS function có thể được gọi thay cho bất kỳ giá trị thuộc tính phù hợp nào bằng cú pháp {{cssxref("&lt;dashed-function>")}}, bao gồm tên function theo sau bởi dấu ngoặc đơn chứa các đối số truyền vào function, nếu có. Ví dụ, chúng ta có thể gọi function `--half-opacity()` như sau:

```css
h2 {
  opacity: --half-opacity();
}
```

Vì function này luôn trả về giá trị `0.5`, khai báo trước đó tương đương với `opacity: 0.5`. Điều này không hữu ích lắm. Bạn cũng có thể chỉ dùng một custom property, hoặc giá trị thực `0.5`.

Hãy xem cách chúng ta có thể sử dụng CSS function.

## Phát hiện tính năng CSS function

Một cách sử dụng thực tế của CSS function không có tham số là phát hiện tính năng. Trong tất cả [các ví dụ chúng ta sẽ xem](https://github.com/mdn/dom-examples/tree/main/css-custom-functions) trong bài viết này, chúng ta định nghĩa một function `--supports()` trông như sau:

```css
@function --supports() {
  result: none;
}
```

Bạn có thể định nghĩa một banner "tính năng không được hỗ trợ", và đặt thuộc tính {{cssxref("display")}} của nó thành `--supports()`:

```html
<p class="support">
  ⚠️ Your browser doesn't currently support CSS custom functions.
</p>
```

```css
.support {
  /* ... */
  display: --supports();
}
```

Trong các trình duyệt hỗ trợ custom function, `display` sẽ được đặt thành `none`, và banner hỗ trợ sẽ bị ẩn. Trong các trình duyệt không hỗ trợ, khai báo `display: --supports()` sẽ không hợp lệ và do đó bị bỏ qua; vì vậy, banner sẽ được hiển thị.

## Chỉ định tham số cho function

Các tham số của CSS function được chỉ định dưới dạng các custom properties được phân cách bằng dấu phẩy bên trong dấu ngoặc đơn theo sau tên function. Ví dụ:

```css
@function --transparent(--color, --alpha) {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Function này có tên `--transparent` và nhận hai custom properties làm tham số, `--color` và `--alpha`, có thể được sử dụng cục bộ bên trong body của function. Body chứa một descriptor `result`, sử dụng [cú pháp màu tương đối CSS](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors) để chuyển đổi giá trị `--color` đầu vào thành màu [`oklch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklch) với giá trị kênh alpha như được chỉ định trong giá trị `--alpha` đầu vào.

Bạn có thể gọi function này ở bất kỳ đâu bạn muốn tạo ra một phiên bản bán trong suốt của một màu hiện có.

Ví dụ:

```css
section {
  --base-color: #faa6ff;
  background-color: --transparent(var(--base-color), 0.8);
}
```

## Chỉ định kiểu dữ liệu

Có thể chỉ định các kiểu dữ liệu được phép cho tham số function và giá trị trả về. Khi bạn không chỉ định, function sẽ chấp nhận bất kỳ kiểu nào cho các giá trị này.

Hãy sửa đổi function trước để cung cấp kiểu dữ liệu:

```css
@function --transparent(--color type(<color>), --alpha type(<number>)) returns
  type(<color>) {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Kiểu dữ liệu của mỗi tham số được chỉ định sau tên tham số, và kiểu dữ liệu của `result` được chỉ định ngay trước dấu ngoặc nhọn mở, đứng trước bởi từ khóa `returns`. Hàm {{cssxref("type()")}} được sử dụng để chỉ định kiểu dữ liệu.

Lưu ý rằng, trong trường hợp bạn chỉ chỉ định một kiểu dữ liệu, bạn có thể bỏ qua cú pháp `type()` và chỉ cần viết kiểu dưới dạng tốc ký:

```css
@function --transparent(--color <color>, --alpha <number>) returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Bây giờ function sẽ chỉ tạo ra giá trị hợp lệ nếu các đối số đầu vào lần lượt là {{cssxref("&lt;color>")}} và {{cssxref("&lt;number>")}}, và `result` là {{cssxref("&lt;color>")}}. Nếu không, ví dụ:

```css
section {
  --base-color: #faa6ff;
  background-color: --transparent(var(--base-color), 50%);
}
```

thì giá trị sẽ trở nên không hợp lệ tại thời điểm tính giá trị (vì `50%` không phải là `<number>` mà là `<percentage>`) và `background-color` sẽ được đặt thành `transparent`.

### Chỉ định nhiều kiểu được phép

Bạn có thể chỉ định nhiều kiểu dữ liệu được chấp nhận bằng cách sử dụng ký hiệu `|` làm dấu phân cách, ví dụ:

```css
@function --transparent(--color <color>, --alpha type(<number> | <percentage>))
  returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Trong trường hợp đó, cú pháp `type()` đầy đủ phải được sử dụng.

Với điều chỉnh này, lời gọi function `--transparent(var(--base-color), 50%)` bây giờ hợp lệ.

## Chỉ định giá trị mặc định

Bạn cũng có thể chỉ định các giá trị mặc định cho tham số, sau dấu hai chấm ở cuối định nghĩa của chúng. Ví dụ:

```css
@function --transparent(--color <color>, --alpha <number>: 0.8) returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Giá trị mặc định của tham số `--alpha` bây giờ là `0.8`. Nếu bạn muốn sử dụng giá trị này, bạn có thể bỏ qua đối số thứ hai khi gọi function:

```css
section {
  --base-color: #faa6ff;
  background-color: --transparent(var(--base-color));
}
```

> [!NOTE]
> Nếu một giá trị không hợp lệ được truyền vào làm đối số function và một giá trị mặc định được chỉ định trong định nghĩa tham số đó, giá trị không hợp lệ sẽ bị bỏ qua, và giá trị mặc định sẽ được sử dụng thay thế.

### Ví dụ về các function điều chỉnh màu

Bạn có thể thấy function `--transparent()` hoạt động trong ví dụ [color-adjust-functions](https://mdn.github.io/dom-examples/css-custom-functions/color-adjust-functions/) của chúng ta (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-custom-functions/color-adjust-functions)).

Ví dụ này cũng bao gồm các function `--lighter()` và `--darker()` hoạt động tương tự như `--transparent()`, nhưng trả về các biến thể sáng hơn và tối hơn của một màu:

```css
@function --transparent(--color <color>, --alpha <number>: 0.8) returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}

@function --lighter(--color <color>, --lightness-adjust <number>: 0.2) returns
  <color> {
  result: oklch(from var(--color) calc(l + var(--lightness-adjust)) c h);
}

@function --darker(--color <color>, --lightness-adjust <number>: 0.2) returns
  <color> {
  result: oklch(from var(--color) calc(l - var(--lightness-adjust)) c h);
}
```

Một thư viện các function như thế này có thể trở nên rất hữu ích để định nghĩa các bảng màu dựa trên một màu duy nhất:

```css
:root {
  --base-color: #faa6ff;
}

section {
  background-color: --transparent(var(--base-color));
  border: 3px solid --lighter(var(--base-color), 0.1);
  color: --darker(var(--base-color), 0.55);
}
```

## Bao gồm logic phức tạp

Bạn có thể bao gồm logic phức tạp hơn trong các function bằng cách sử dụng các cấu trúc như at-rule {{cssxref("@media")}} và hàm {{cssxref("if()")}}.

Ví dụ [responsive-narrow-wide](https://mdn.github.io/dom-examples/css-custom-functions/responsive-narrow-wide/) của chúng ta (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-custom-functions/responsive-narrow-wide)) có một function `--narrow-wide()`, có thể được sử dụng để cung cấp hai tùy chọn giá trị cho bất kỳ thuộc tính nào. Một sẽ được đặt nếu viewport nhỏ hơn một breakpoint cụ thể, và một sẽ được đặt nếu nó lớn hơn.

Function `--narrow-wide()` nhận hai tham số, `--narrow` và `--wide`. `result` trả về là thuộc tính `--wide`, trừ khi viewport nhỏ hơn `700px` chiều rộng, trong trường hợp đó `--narrow` được trả về.

```css
@function --narrow-wide(--narrow, --wide) {
  result: var(--wide);
  @media (width < 700px) {
    result: var(--narrow);
  }
}
```

Function này có thể được sử dụng để cung cấp các tùy chọn giá trị responsive trong nhiều ngữ cảnh:

```css
body {
  display: grid;
  grid-template-columns: repeat(--narrow-wide(1, 3), 1fr);
  gap: --narrow-wide(0, 20px);
  padding: 0 20px;
}

h2 {
  font-size: --narrow-wide(2.5rem, 2rem);
}

p {
  font-size: --narrow-wide(1.4rem, 1rem);
  line-height: 1.5;
}
```

### Sử dụng hàm `if()`

Chúng ta có thể viết lại function `--narrow-wide()` để sử dụng hàm `if()` thay thế:

```css
@function --narrow-wide(--narrow, --wide) {
  result: if(media(width < 700px): var(--narrow) ; else: var(--wide));
}
```

## Viết cú pháp phức tạp một lần, rồi tái sử dụng

Một trường hợp sử dụng chính của CSS function là định nghĩa một phần cú pháp phức tạp một lần, và có thể tái sử dụng nó nhiều lần với một lời gọi function đơn giản hơn nhiều.

Ví dụ [gradient-function](https://mdn.github.io/dom-examples/css-custom-functions/gradient-function/) của chúng ta (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-custom-functions/gradient-function)) cung cấp một ví dụ về điều này. Nó có một function `--shippo-pattern()` nhận các đối số độ dài và màu, và trả về một giá trị {{cssxref("background")}} phức tạp với nhiều nền {{cssxref("radial-gradient()")}}:

```css
@function --shippo-pattern(--size <length>, --tint <color>) {
  result:
    radial-gradient(closest-side, transparent 98%, rgb(0 0 0 / 0.3) 99%) 0 0 /
      var(--size) var(--size),
    radial-gradient(closest-side, transparent 98%, rgb(0 0 0 / 0.3) 99%)
      calc(var(--size) / 2) calc(var(--size) / 2) / var(--size) var(--size)
      var(--tint);
}
```

Với function này được định nghĩa, bây giờ chúng ta có thể tạo ra các biến thể của giá trị background này với các màu sắc và kích thước vòng tròn khác nhau:

```css
#one {
  background: --shippo-pattern(100px, #ddeeff);
}

#two {
  background: --shippo-pattern(3.5rem, lime);
}

#three {
  background: --shippo-pattern(10vw, purple);
}
```

## Xem thêm

- [CSS custom properties](/en-US/docs/Web/CSS/Reference/Properties/--*)
- [CSS custom functions and mixins](/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins) module
- [Custom CSS Functions in the Browser](https://www.oddbird.net/2025/04/11/custom-functions/) by Miriam Suzanne (2025)
- [CSS @function + CSS if()](https://www.bram.us/2025/02/18/css-at-function-and-css-if/) by Bramus (2025)
- [5 Useful CSS functions using the new @function rule](https://una.im/5-css-functions/) by Una Kravets (2025)
