---
title: color()
slug: Web/CSS/Reference/Values/color_value/color
page-type: css-function
browser-compat: css.types.color.color
spec-urls:
  - https://drafts.csswg.org/css-color-5/#color-function
  - https://drafts.csswg.org/css-color-5/#relative-color-function
  - https://drafts.csswg.org/css-color/#color-function
sidebar: cssref
---

Ký hiệu hàm **`color()`** cho phép chỉ định một màu sắc trong một {{glossary("color space", "không gian màu")}} cụ thể thay vì không gian màu sRGB ngầm định mà hầu hết các hàm màu khác sử dụng.

Hỗ trợ cho một không gian màu cụ thể có thể được phát hiện bằng tính năng media CSS [`color-gamut`](/vi/docs/Web/CSS/Reference/At-rules/@media/color-gamut).

## Cú pháp

```css
/* Giá trị tuyệt đối */
color(display-p3 1 0.5 0);
color(display-p3 1 0.5 0 / .5);

/* Giá trị tương đối */
color(from green srgb r g b / 0.5)
color(from #123456 xyz calc(x + 0.75) y calc(z - 0.35))
```

### Giá trị

Dưới đây là mô tả các giá trị được phép cho cả màu tuyệt đối và [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors).

#### Cú pháp giá trị tuyệt đối

```plain
color(colorspace c1 c2 c3[ / A])
```

Các tham số như sau:

- `colorspace`
  - : Một {{CSSXref("&lt;ident&gt;")}} biểu thị một trong các không gian màu được định nghĩa sẵn: `srgb`, `srgb-linear`, `display-p3`, `a98-rgb`, `prophoto-rgb`, `rec2020`, `xyz`, `xyz-d50`, hoặc `xyz-d65`.

- `c1`, `c2`, `c3`
  - : Mỗi giá trị có thể được viết dưới dạng {{CSSXref("number")}}, {{CSSXref("percentage")}}, hoặc từ khóa `none` (tương đương với `0` trong trường hợp này). Các giá trị này biểu thị các giá trị thành phần cho không gian màu. Khi sử dụng giá trị `<number>`, thông thường `0` đến `1` biểu thị phạm vi của không gian màu. Các giá trị nằm ngoài phạm vi đó được cho phép nhưng sẽ nằm ngoài {{glossary("gamut")}} của không gian màu đã cho. Khi sử dụng giá trị phần trăm, `100%` biểu thị `1` và `0%` biểu thị `0`.

- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu thị giá trị kênh alpha của màu sắc, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ ràng không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ ràng, mặc định là 100%. Nếu được bao gồm, giá trị được đặt trước bởi dấu gạch chéo (`/`).

> [!NOTE]
> Xem [Các thành phần màu bị thiếu](/vi/docs/Web/CSS/Reference/Values/color_value#missing_color_components) để biết thêm thông tin về tác động của `none`.

#### Cú pháp giá trị tương đối

```plain
color(from <color> colorspace c1 c2 c3[ / A])
```

Các tham số như sau:

- `from <color>`
  - : Từ khóa `from` luôn được bao gồm khi định nghĩa một màu tương đối, theo sau là giá trị {{cssxref("&lt;color&gt;")}} biểu thị **màu gốc**. Đây là màu ban đầu mà màu tương đối dựa trên. Màu gốc có thể là bất kỳ cú pháp {{cssxref("&lt;color&gt;")}} hợp lệ nào, kể cả một màu tương đối khác.
- `colorspace`
  - : Một {{CSSXref("&lt;ident&gt;")}} biểu thị {{glossary("color space", "không gian màu")}} của màu đầu ra, thường là một trong các không gian màu được định nghĩa sẵn: `srgb`, `srgb-linear`, `display-p3`, `a98-rgb`, `prophoto-rgb`, `rec2020`, `xyz`, `xyz-d50`, hoặc `xyz-d65`.
- `c1`, `c2`, `c3`
  - : Mỗi giá trị có thể được viết dưới dạng {{CSSXref("number")}}, {{CSSXref("percentage")}}, hoặc từ khóa `none` (tương đương với `0` trong trường hợp này). Các giá trị này biểu thị các giá trị thành phần cho màu đầu ra. Khi sử dụng giá trị `<number>`, thông thường `0` đến `1` biểu thị phạm vi của không gian màu. Các giá trị nằm ngoài phạm vi đó được cho phép nhưng sẽ nằm ngoài {{glossary("gamut")}} của không gian màu đã cho. Thông thường khi sử dụng giá trị phần trăm, `100%` biểu thị `1` và `0%` biểu thị `0`.
- `A` {{optional_inline}}
  - : Một {{CSSXref("&lt;alpha-value&gt;")}} biểu thị giá trị kênh alpha của màu đầu ra, trong đó số `0` tương ứng với `0%` (hoàn toàn trong suốt) và `1` tương ứng với `100%` (hoàn toàn đục). Ngoài ra, từ khóa `none` có thể được sử dụng để chỉ định rõ ràng không có kênh alpha. Nếu giá trị kênh `A` không được chỉ định rõ ràng, mặc định là giá trị kênh alpha của màu gốc. Nếu được bao gồm, giá trị được đặt trước bởi dấu gạch chéo (`/`).

#### Định nghĩa các thành phần kênh màu đầu ra cho màu tương đối

Khi sử dụng cú pháp màu tương đối bên trong hàm `color()`, trình duyệt chuyển đổi màu gốc thành màu tương đương trong không gian màu đã chỉ định (nếu chưa được chỉ định như vậy). Màu được định nghĩa bằng ba giá trị kênh màu riêng biệt cộng với giá trị kênh alpha (`alpha`). Các giá trị kênh này được cung cấp bên trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra:

- Ba giá trị kênh màu của màu gốc được giải thành `<number>`. Đối với các không gian màu được định nghĩa sẵn, tùy thuộc vào loại được chỉ định, các giá trị này sẽ là:
  - `r`, `g`, và `b`: Giá trị kênh màu cho các không gian màu dựa trên RGB: `srgb`, `srgb-linear`, `display-p3`, `a98-rgb`, `prophoto-rgb`, và `rec2020`.
  - `x`, `y`, và `z`: Giá trị kênh màu cho các không gian màu dựa trên CIE XYZ: `xyz`, `xyz-d50`, và `xyz-d65`.

    > [!NOTE]
    > Mỗi giá trị này thường nằm trong khoảng `0` và `1` nhưng, như đã giải thích ở trên, chúng có thể nằm ngoài các giới hạn này.

    > [!NOTE]
    > Tham chiếu đến các giá trị `r`, `g`, và `b` bên trong hàm `color()` với không gian màu dựa trên XYZ, các giá trị `x`, `y`, và `z` bên trong hàm `color()` với không gian màu dựa trên RGB, hoặc bất kỳ ký tự nào khác đều không hợp lệ. Các giá trị kênh màu gốc có sẵn bên trong hàm phải khớp với loại không gian màu đã chỉ định.

- `alpha`: Giá trị độ trong suốt của màu, được giải thành `<number>` trong khoảng `0` và `1`, bao gồm cả hai đầu.

Khi định nghĩa một màu tương đối, các kênh khác nhau của màu đầu ra có thể được biểu thị theo nhiều cách khác nhau. Dưới đây chúng ta sẽ nghiên cứu một số ví dụ để minh họa.

Trong hai ví dụ đầu tiên dưới đây, chúng ta đang sử dụng cú pháp màu tương đối. Tuy nhiên, ví dụ đầu tiên đầu ra cùng màu với màu gốc và ví dụ thứ hai đầu ra một màu không dựa trên màu gốc. Chúng không thực sự tạo ra màu tương đối! Bạn khó có thể sử dụng những cái này trong codebase thực, và thay vào đó có thể chỉ sử dụng giá trị màu tuyệt đối. Chúng ta bao gồm các ví dụ này như một điểm khởi đầu để học về cú pháp `color()` tương đối.

Hãy bắt đầu với màu gốc là `hsl(0 100% 50%)` (tương đương với `red`). Mặc dù bạn khó có thể viết các hàm sau vì chúng đầu ra cùng màu với màu gốc, điều này minh họa cách sử dụng các giá trị kênh màu gốc làm giá trị kênh đầu ra:

```css
color(from hsl(0 100% 50%) srgb r g b)
color(from hsl(0 100% 50%) xyz x y z)
```

Màu đầu ra của các hàm này lần lượt là `color(srgb 1 0 0)` và `color(xyz-d65 0.412426 0.212648 0.0193173)`.

Các hàm tiếp theo sử dụng các giá trị tuyệt đối cho các giá trị kênh màu đầu ra, tạo ra các màu hoàn toàn khác không dựa trên màu gốc:

```css
color(from hsl(0 100% 50%) srgb 0.749938 0 0.609579)
/* Màu đầu ra được tính: color(srgb 0.749938 0 0.609579) */

color(from hsl(0 100% 50%) xyz 0.75 0.6554 0.1)
/* Màu đầu ra được tính: color(xyz-d65 0.75 0.6554 0.1 */
```

Các hàm sau sử dụng hai trong số các giá trị kênh màu gốc cho các giá trị kênh màu đầu ra (`r` và `b`, và `x` và `y`, lần lượt), nhưng sử dụng giá trị mới cho giá trị kênh đầu ra còn lại (`g` và `z`, lần lượt), tạo ra một màu tương đối dựa trên màu gốc trong mỗi trường hợp:

```css
color(from hsl(0 100% 50%) srgb r 1 b)
/* Màu đầu ra được tính: color(srgb 1 1 0) */

color(from hsl(0 100% 50%) xyz x y 0.5)
/* Màu đầu ra được tính: color(xyz-d65 0.412426 0.212648 0.5) */
```

> [!NOTE]
> Như đã đề cập ở trên, nếu màu đầu ra sử dụng mô hình màu khác với màu gốc, màu gốc sẽ được chuyển đổi sang cùng mô hình với màu đầu ra trong nền để có thể được biểu thị theo cách tương thích (tức là sử dụng cùng các kênh). Ví dụ, màu {{cssxref("color_value/hsl", "hsl()")}} `hsl(0 100% 50%)` được chuyển đổi thành `color(srgb 1 0 0)` trong trường hợp đầu tiên ở trên và `color(xyz 0.412426 0.212648 0.5)` trong trường hợp thứ hai.

Trong các ví dụ chúng ta đã thấy cho đến nay trong phần này, kênh alpha chưa được chỉ định rõ ràng cho cả màu gốc và màu đầu ra. Khi kênh alpha màu đầu ra không được chỉ định, mặc định là cùng giá trị với kênh alpha màu gốc. Khi kênh alpha màu gốc không được chỉ định (và không phải là màu tương đối), mặc định là `1`. Do đó, các giá trị kênh alpha gốc và đầu ra đều là `1` cho các ví dụ trên.

Hãy xem một số ví dụ chỉ định giá trị kênh alpha gốc và đầu ra. Ví dụ đầu tiên chỉ định giá trị kênh alpha đầu ra giống với giá trị kênh alpha gốc, trong khi ví dụ thứ hai chỉ định giá trị kênh alpha đầu ra khác, không liên quan đến giá trị kênh alpha gốc.

```css
color(from hsl(0 100% 50% / 0.8) srgb r g b / alpha)
/* Màu đầu ra được tính: color(srgb 1 0 0 / 0.8) */

color(from hsl(0 100% 50% / 0.8) xyz x y z / 0.5)
/* Màu đầu ra được tính: color(xyz-d65 0.412426 0.212648 0.0193173 / 0.5) */
```

Các hàm sau sử dụng các hàm {{cssxref("calc")}} để tính các giá trị kênh mới cho màu đầu ra tương đối với các giá trị kênh màu gốc:

```css
color(from hsl(0 100% 50%) srgb calc(r - 0.4) calc(g + 0.1) calc(b + 0.6) / calc(alpha - 0.1))
/* Màu đầu ra được tính: color(srgb 0.6 0.1 0.6 / 0.9)  */

color(from hsl(0 100% 50%) xyz calc(x - 0.3) calc(y + 0.3) calc(z + 0.3) / calc(alpha - 0.1))
/* Màu đầu ra được tính: color(xyz-d65 0.112426 0.512648 0.319317 / 0.9) */
```

> [!NOTE]
> Vì các giá trị kênh màu gốc được giải thành các giá trị `<number>`, bạn phải cộng các số vào chúng khi sử dụng trong tính toán, ngay cả trong các trường hợp mà một kênh thông thường chấp nhận `<percentage>`, `<angle>`, hoặc các loại giá trị khác. Ví dụ, cộng `<percentage>` với `<number>` sẽ không hoạt động.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng các không gian màu được định nghĩa sẵn với color()

Ví dụ sau cho thấy tác động của việc thay đổi các giá trị độ sáng, trục a, và trục b của hàm `color()`.

#### HTML

```html
<div data-color="red-a98-rgb"></div>
<div data-color="red-prophoto-rgb"></div>
<div data-color="green-srgb-linear"></div>
<div data-color="green-display-p3"></div>
<div data-color="blue-rec2020"></div>
<div data-color="blue-srgb"></div>
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
```

```css
[data-color="red-a98-rgb"] {
  background-color: color(a98-rgb 1 0 0);
}
[data-color="red-prophoto-rgb"] {
  background-color: color(prophoto-rgb 1 0 0);
}
[data-color="green-srgb-linear"] {
  background-color: color(srgb-linear 0 1 0);
}
[data-color="green-display-p3"] {
  background-color: color(display-p3 0 1 0);
}
[data-color="blue-rec2020"] {
  background-color: color(rec2020 0 0 1);
}
[data-color="blue-srgb"] {
  background-color: color(srgb 0 0 1);
}
```

#### Kết quả

{{EmbedLiveSample("using_predefined_color_spaces_with_color")}}

### Sử dụng không gian màu xyz với color()

Ví dụ sau cho thấy cách sử dụng không gian màu `xyz` để chỉ định một màu.

#### HTML

```html
<div data-color="red"></div>
<div data-color="green"></div>
<div data-color="blue"></div>
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
```

```css
[data-color="red"] {
  background-color: color(xyz 45 20 0);
}

[data-color="green"] {
  background-color: color(xyz-d50 0.3 80 0.3);
}

[data-color="blue"] {
  background-color: color(xyz-d65 5 0 50);
}
```

#### Kết quả

{{EmbedLiveSample("using_the_xyz_color_space_with_color")}}

### Sử dụng media query color-gamut với color()

Ví dụ này cho thấy cách sử dụng media query [`color-gamut`](/vi/docs/Web/CSS/Reference/At-rules/@media/color-gamut) để phát hiện hỗ trợ cho một không gian màu cụ thể và sử dụng không gian màu đó để chỉ định màu.

#### HTML

```html
<div></div>
<div></div>
<div></div>
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
```

```css
@media (color-gamut: p3) {
  div {
    background-color: color(display-p3 1 0 0);
  }
}

@media (color-gamut: srgb) {
  div:nth-child(2) {
    background-color: color(srgb 1 0 0);
  }
}

@media (color-gamut: rec2020) {
  div:nth-child(3) {
    background-color: color(rec2020 1 0 0);
  }
}
```

#### Kết quả

{{EmbedLiveSample("using_color-gamut_media_queries_with_color")}}

### Sử dụng màu tương đối với color()

Ví dụ này định kiểu ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử ở giữa được gán `--base-color` không thay đổi, trong khi phần tử bên trái và bên phải được gán các biến thể sáng hơn và tối hơn của `--base-color`.

Các biến thể được định nghĩa bằng màu tương đối — [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) `--base-color` được truyền vào hàm `color()`, và các màu đầu ra có kênh `g` và `b` được sửa đổi để đạt được hiệu ứng mong muốn thông qua các hàm `calc()`. Màu sáng hơn có thêm 15% vào các kênh đó, còn màu tối hơn có 15% bị trừ khỏi các kênh đó.

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
  background-color: color(
    from var(--base-color) display-p3 r calc(g + 0.15) calc(b + 0.15)
  );
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: color(
    from var(--base-color) display-p3 r calc(g - 0.15) calc(b - 0.15)
  );
}

/* Use @supports to add in support old syntax that requires r g b values
   to be specified as percentages (with units) in calculations.
   This is required for Safari 16.4+ */
@supports (color: color(from red display-p3 r g calc(b + 30%))) {
  #one {
    background-color: color(
      from var(--base-color) display-p3 r calc(g + 15%) calc(b + 15%)
    );
  }

  #three {
    background-color: color(
      from var(--base-color) display-p3 r calc(g - 15%) calc(b - 15%)
    );
  }
}
```

#### Kết quả

Đầu ra như sau:

{{ EmbedLiveSample("Using relative colors with color()", "100%", "200") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{CSSXref("color")}}
- [Kiểu dữ liệu `<color>`](/vi/docs/Web/CSS/Reference/Values/color_value) để biết danh sách tất cả ký hiệu màu
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- [Công cụ chuyển đổi định dạng màu](/vi/docs/Web/CSS/Guides/Colors/Color_format_converter)
- [Màu sắc CSS](/vi/docs/Web/CSS/Guides/Colors)
- Tính năng media [`color-gamut`](/vi/docs/Web/CSS/Reference/At-rules/@media/color-gamut)
- [Wide Gamut Color in CSS with Display-p3](https://webkit.org/blog/10042/wide-gamut-color-in-css-with-display-p3/)
