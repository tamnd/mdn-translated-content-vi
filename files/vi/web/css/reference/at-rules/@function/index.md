---
title: "@function"
slug: Web/CSS/Reference/At-rules/@function
page-type: css-at-rule
status:
  - experimental
browser-compat: css.at-rules.function
sidebar: cssref
---

{{SeeCompatTable}}

At-rule [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) **`@function`** cho phép định nghĩa [các hàm CSS tùy chỉnh](/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions). Sau khi được định nghĩa, một hàm tùy chỉnh có thể được gọi bằng cú pháp {{cssxref("&lt;dashed-function>")}} (ví dụ: `--my-function(30px, 3)`) trong bất kỳ giá trị thuộc tính nào.

## Cú pháp

```css
@function --function-name(<function-parameter>#?) [returns <css-type>]? {
  <declaration-rule-list>
}

<function-parameter> = --param-name <css-type>? [ : <default-value> ]?
```

Các phần khác nhau của cú pháp `@function` như sau:

- `--function-name`
  - : Tên định danh của hàm, là {{cssxref("dashed-ident")}} bắt đầu bằng `--` và theo sau là một định danh hợp lệ do người dùng xác định. Nó phân biệt chữ hoa chữ thường.
- `<function-parameter>#?` {{optional_inline}}
  - : Không hoặc nhiều định nghĩa tham số hàm. Nhiều định nghĩa tham số được phân cách bằng dấu phẩy. Mỗi tham số bao gồm:
    - `--param-name`
      - : Tên [thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--*) để định danh tham số, là {{cssxref("dashed-ident")}} bắt đầu bằng `--` và theo sau là định danh hợp lệ do người dùng xác định. Nó phân biệt chữ hoa chữ thường. Các tham số hàm có thể được coi là các thuộc tính tùy chỉnh có phạm vi cục bộ trong thân hàm.
    - `<css-type>` {{optional_inline}}
      - : Kiểu dữ liệu CSS hoặc hàm {{cssxref("type()")}} xác định các kiểu dữ liệu được chấp nhận cho tham số. Nếu không được chỉ định, bất kỳ kiểu dữ liệu nào đều hợp lệ cho tham số (tương đương với việc chỉ định `type(*)`).
    - `<default-value>` {{optional_inline}}
      - : Giá trị CSS chỉ định giá trị mặc định để gán cho tham số nếu nó không được chỉ định khi gọi hàm. Giá trị này phải hợp lệ theo `<css-type>` nếu được chỉ định. Giá trị mặc định được phân cách với các phần khác của định nghĩa tham số bằng dấu hai chấm (`:`).
- `[returns <css-type>]?` {{optional_inline}}
  - : Kiểu dữ liệu CSS hoặc hàm {{cssxref("type()")}}, đứng trước từ khóa `returns`, xác định các kiểu trả về được chấp nhận cho tham số. Nếu không được chỉ định, bất kỳ kiểu dữ liệu nào đều hợp lệ cho tham số (tương đương với việc chỉ định `returns type(*)`), mặc dù cần lưu ý rằng hàm sẽ không hợp lệ nếu kiểu trả về không khớp với kiểu được tạo ra bởi descriptor `result`.
- `<declaration-rule-list>`
  - : Một hoặc nhiều khai báo CSS hoặc at-rule xác định thân hàm, chứa logic của nó. Các khai báo có thể bao gồm:
    - Các thuộc tính tùy chỉnh CSS, có phạm vi cục bộ trong thân hàm.
    - Descriptor `result`, trực tiếp bên trong at-rule `@function` hoặc bên trong một at-rule lồng nhau.

### Các descriptor

- `result`
  - : Giá trị thuộc tính hợp lệ xác định kết quả trả về bởi hàm CSS tùy chỉnh. Biểu thức chứa trong giá trị được đánh giá và kết quả được trả về.

## Mô tả

Các hàm CSS tùy chỉnh cho phép bạn định nghĩa các đoạn logic có thể tái sử dụng, trả về các giá trị khác nhau tùy thuộc vào các tham số chúng nhận làm đầu vào và logic được định nghĩa bên trong thân hàm.

Một hàm CSS điển hình trông như sau:

```css
@function --transparent(--color, --alpha) {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Hàm có tên `--transparent` và nhận hai thuộc tính tùy chỉnh làm tham số, `--color` và `--alpha`, có thể được dùng cục bộ bên trong thân hàm. Thân hàm chứa một dòng duy nhất là descriptor `result` xác định giá trị trả về bởi hàm. Giá trị của descriptor `result` sử dụng [cú pháp màu tương đối CSS](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors) để chuyển đổi giá trị đầu vào `--color` thành màu {{cssxref("color_value/oklch")}} với giá trị kênh alpha được chỉ định trong giá trị đầu vào `--alpha`.

Sau đó bạn có thể gọi hàm này ở bất kỳ đâu bạn muốn tạo phiên bản bán trong suốt của một màu hiện có, ví dụ:

```css
section {
  --base-color: #faa6ff;
  background-color: --transparent(var(--base-color), 0.8);
}
```

Hàm được gọi bằng cú pháp {{cssxref("&lt;dashed-function>")}}, là tên hàm với dấu ngoặc đơn ở cuối. Các giá trị đối số mong muốn được chỉ định bên trong dấu ngoặc đơn.

> [!NOTE]
> Nếu nhiều hàm CSS có cùng tên, hàm trong {{cssxref("@layer")}} cascade mạnh hơn sẽ thắng. Nếu tất cả chúng ở cùng layer, hàm được định nghĩa cuối cùng theo thứ tự nguồn sẽ thắng.

### Chỉ định kiểu dữ liệu

Có thể chỉ định kiểu dữ liệu cho các tham số hàm và kiểu trả về. Ví dụ:

```css
@function --transparent(--color <color>, --alpha <number>) returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Bây giờ hàm chỉ tạo ra giá trị hợp lệ nếu các đối số đầu vào lần lượt là {{cssxref("&lt;color&gt;")}} và {{cssxref("&lt;number&gt;")}}, và `result` là {{cssxref("&lt;color&gt;")}}. Nếu không, ví dụ:

```css
section {
  --base-color: #faa6ff;
  background-color: --transparent(var(--base-color), 50%);
}
```

thì giá trị sẽ trở nên không hợp lệ tại thời điểm tính toán giá trị (vì đối số `--alpha` được chỉ định là `<percentage>` chứ không phải `<number>` như mong đợi) và `background-color` sẽ được đặt thành `transparent`.

Bạn có thể chỉ định nhiều kiểu dữ liệu được chấp nhận bằng hàm {{cssxref("type()")}} với ký hiệu `|` làm dấu phân cách, ví dụ:

```css
@function --transparent(--color <color>, --alpha type(<number> | <percentage>))
  returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Với điều chỉnh này, lời gọi hàm `--transparent(var(--base-color), 50%)` bây giờ hợp lệ.

### Chỉ định giá trị mặc định

Bạn cũng có thể chỉ định giá trị mặc định cho tham số, sau dấu hai chấm ở cuối định nghĩa của chúng. Ví dụ:

```css
@function --transparent(--color <color>, --alpha <number>: 0.8) returns <color> {
  result: oklch(from var(--color) l c h / var(--alpha));
}
```

Giá trị mặc định của tham số `--alpha` bây giờ là `0.8`. Nếu bạn muốn sử dụng giá trị này, bạn có thể bỏ qua đối số thứ hai khi gọi hàm:

```css
section {
  --base-color: #faa6ff;
  background-color: --transparent(var(--base-color));
}
```

> [!NOTE]
> Nếu một giá trị không hợp lệ được truyền vào như đối số hàm và giá trị mặc định được chỉ định trong định nghĩa tham số đó, giá trị không hợp lệ sẽ bị bỏ qua và giá trị mặc định sẽ được sử dụng thay thế.

### Truyền các giá trị chứa dấu phẩy làm đối số

Trong ví dụ tiếp theo, hàm `--max-plus-x()` mong đợi nhận một danh sách phân cách bằng dấu phẩy gồm các độ dài và một độ dài đơn làm đối số. Nó sử dụng hàm CSS {{cssxref("max()")}} để xác định độ dài lớn nhất trong danh sách, cộng nó với độ dài đơn, rồi trả về kết quả.

```css
@function --max-plus-x(--list <length>#, --x <length>) {
  result: calc(max(var(--list)) + var(--x));
}
```

Đối số đầu tiên cần là một danh sách phân cách bằng dấu phẩy, có thể bị hiểu nhầm là ba đối số riêng biệt. Để giải quyết vấn đề này, bạn có thể bọc giá trị trong dấu ngoặc nhọn khi truyền vào lời gọi hàm:

```css
div {
  width: --max-plus-x({1px, 7px, 2px}, 3px); /* 10px */
}
```

### Bao gồm thuộc tính tùy chỉnh bên trong hàm

Như chúng ta đã thấy, các tham số hàm được định nghĩa như các thuộc tính tùy chỉnh, sau đó có thể sử dụng bên trong thân hàm.

Bạn cũng có thể chỉ định các thuộc tính tùy chỉnh bên trong thân hàm sẽ hoạt động như các hằng số có phạm vi cục bộ. Trong ví dụ sau, chúng ta định nghĩa một hàm có tên `--anim-1s()`, trả về giá trị rút gọn {{cssxref("animation")}} trong đó các giá trị thời lượng và easing luôn giống nhau, chỉ tên animation và số lần đếm thay đổi.

```css
@function --anim-1s(--animation, --count) {
  --duration: 1s;
  --easing: linear;
  result: var(--animation) var(--duration) var(--count) var(--easing);
}
```

Loại sử dụng này cho phép bạn viết cú pháp dễ hơn, biểu đạt hơn cho các animation, miễn là bạn biết rằng bạn luôn muốn thời lượng và hàm easing là giống nhau:

```css
animation: --anim-1s(bounce, 2);
```

Cũng đáng lưu ý rằng bạn có thể gọi một hàm tùy chỉnh từ bên trong một hàm khác. Trong những trường hợp như vậy, một hàm tùy chỉnh có thể truy cập các biến cục bộ và tham số hàm từ các hàm cao hơn trong ngăn xếp lời gọi. Ở đây, tham số của hàm bên ngoài và thuộc tính tùy chỉnh cục bộ sẽ có sẵn trong phạm vi của hàm bên trong:

```css
@function --outer(--outer-arg) {
  --outer-local: 2;
  result: --inner();
}

@function --inner() returns <number> {
  result: calc(var(--outer-arg) + var(--outer-local));
}

div {
  z-index: --outer(1); /* 3 */
}
```

Ngoài ra, các thuộc tính tùy chỉnh được định nghĩa trên cùng phần tử mà hàm tùy chỉnh đang được gọi sẽ có sẵn cho nó:

```css
@function --double-z() returns <number> {
  result: calc(var(--z) * 2);
}

div {
  --z: 3;
  z-index: --double-z(); /* 6 */
}
```

Khi một thuộc tính tùy chỉnh cùng tên được định nghĩa ở nhiều nơi, các tham số hàm ghi đè các thuộc tính tùy chỉnh được định nghĩa trên cùng phần tử, và các thuộc tính tùy chỉnh cục bộ được định nghĩa bên trong thân hàm ghi đè cả hai. Trong ví dụ sau, hàm `--add-a-b-c()` sử dụng thuộc tính `--a` từ thuộc tính tùy chỉnh của quy tắc `div`, thuộc tính `--b` từ tham số hàm và thuộc tính tùy chỉnh cục bộ `--c`.

```css
@function --add-a-b-c(--b, --c) {
  --c: 300;
  result: calc(var(--a) + var(--b) + var(--c));
}

div {
  --a: 1;
  --b: 2;
  --c: 3;
  z-index: --add-a-b-c(20, 30); /* 321 */
}
```

### Bao gồm logic phức tạp

Bạn có thể bao gồm logic phức tạp hơn trong các hàm bằng cách sử dụng các cấu trúc như at-rule {{cssxref("@media")}} và các hàm {{cssxref("if()")}}. Ví dụ, hàm tiếp theo nhận hai đối số, một cho bố cục màn hình hẹp và một cho bố cục màn hình rộng. Nó trả về cái sau theo mặc định, nhưng trả về cái trước khi chiều rộng viewport nhỏ hơn `700px`, được phát hiện bằng media query.

```css
@function --narrow-wide(--narrow, --wide) {
  result: var(--wide);
  @media (width < 700px) {
    result: var(--narrow);
  }
}
```

Bạn có thể bao gồm nhiều descriptor `result` để biểu đạt các kết quả khác nhau cho các kết quả logic khác nhau.

> [!NOTE]
> Các hàm CSS hoạt động giống như phần còn lại của CSS về việc giải quyết xung đột — cái cuối cùng theo thứ tự nguồn thắng. Do đó, trong hàm trên, `result` là `var(--wide)` trừ khi bài kiểm tra media query trả về true, trong trường hợp đó nó bị ghi đè bởi `var(--narrow)`.
>
> Không có các lệnh return sớm trong hàm CSS như có trong hàm JavaScript. Trong hàm trên, nếu media query được viết trước, trước dòng `result` đơn, `result` sẽ luôn là `var(--wide)` vì nó sẽ ghi đè `var(--narrow)` trong các trường hợp bài kiểm tra media query trả về true.

Chúng ta có thể viết lại hàm CSS tùy chỉnh để sử dụng hàm `if()` thay thế:

```css
@function --narrow-wide(--narrow, --wide) {
  result: if(media(width < 700px): var(--narrow) ; else: var(--wide));
}
```

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Để xem thêm ví dụ, hãy tham khảo hướng dẫn [Sử dụng hàm CSS tùy chỉnh](/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions).

### Sử dụng cơ bản `@function`

Ví dụ này cho thấy một hàm cơ bản nhân đôi giá trị được truyền vào nó.

#### HTML

Markup gồm một phần tử {{htmlelement("p")}} chứa một số nội dung văn bản:

```html live-sample___basic-example
<p>Some content</p>
```

#### CSS

Trong các style, chúng ta đầu tiên định nghĩa hàm CSS tùy chỉnh. Hàm có tên `--double`, nhận một tham số của bất kỳ kiểu nào, mà chúng ta đặt tên là `--value`. Bên trong thân hàm, chúng ta bao gồm descriptor `result` sử dụng hàm {{cssxref("calc()")}} để nhân đôi đối số được truyền vào:

```css live-sample___basic-example
@function --double(--value) {
  result: calc(var(--value) * 2);
}
```

Tiếp theo, chúng ta định nghĩa thuộc tính tùy chỉnh `--base-spacing` với giá trị `10px`. Chúng ta gán thuộc tính đó cho giá trị {{cssxref("border-radius")}}, nhưng sau đó nhân đôi nó cho giá trị {{cssxref("padding")}} bằng hàm tùy chỉnh `--double()`.

```css hidden live-sample___basic-example
html,
body {
  height: 100%;
}

body {
  margin: 0;
  display: grid;
  place-items: center;
  font-family: system-ui;
}
```

```css live-sample___basic-example
p {
  --base-spacing: 10px;
  border-radius: var(--base-spacing);
  padding: --double(var(--base-spacing));
  width: 50%;
  background-color: wheat;
}
```

#### Kết quả

{{ EmbedLiveSample('basic-example', '100%', '150px') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Reference/Properties/--)
- Kiểu dữ liệu {{cssxref("&lt;dashed-function>")}}
- Hàm [`type()`](/en-US/docs/Web/CSS/Reference/Values/type)
- [Sử dụng hàm CSS tùy chỉnh](/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins/Using_custom_functions)
- Module [CSS custom functions and mixins](/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins)
