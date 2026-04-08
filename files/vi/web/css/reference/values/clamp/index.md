---
title: clamp()
slug: Web/CSS/Reference/Values/clamp
page-type: css-function
browser-compat: css.types.clamp
sidebar: cssref
---

Hàm **`clamp()`** trong [CSS](/vi/docs/Web/CSS) giới hạn một giá trị trong một khoảng giá trị nằm giữa giới hạn tối thiểu và giới hạn tối đa được xác định. Hàm nhận ba tham số: giá trị tối thiểu, giá trị ưu tiên và giá trị tối đa cho phép.

{{InteractiveExample("CSS Demo: clamp()")}}

```css interactive-example-choice
font-size: clamp(1rem, 2.5vw, 2rem);
```

```css interactive-example-choice
font-size: clamp(1.5rem, 2.5vw, 4rem);
```

```css interactive-example-choice
font-size: clamp(1rem, 10vw, 2rem);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    The font-size of this text varies depending on the base font of the page,
    and the size of the viewport.
  </div>
</section>
```

Lưu ý rằng việc sử dụng `clamp()` cho cỡ chữ, như trong các ví dụ này, cho phép bạn thiết lập cỡ chữ tăng theo kích thước của viewport, nhưng không nhỏ hơn cỡ chữ tối thiểu hay lớn hơn cỡ chữ tối đa. Nó có tác dụng tương tự như đoạn mã trong [Fluid Typography](https://css-tricks.com/snippets/css/fluid-typography/) nhưng chỉ trong một dòng và không cần dùng media query.

## Cú pháp

```css
/* Giá trị tĩnh */
width: clamp(200px, 40%, 400px);
width: clamp(20rem, 30vw, 70rem);
width: clamp(10vw, 20em, 100vw);

/* Giá trị tính toán */
width: clamp(min(10vw, 20rem), 300px, max(90vw, 55rem));
width: clamp(100px, calc(30% / 2rem + 10px), 900px);
```

### Tham số

Hàm `clamp(min, val, max)` nhận ba biểu thức được phân tách bằng dấu phẩy làm tham số của nó.

- `min`
  - : Giá trị tối thiểu là giá trị nhỏ nhất (âm nhất). Đây là giới hạn dưới trong khoảng giá trị được phép. Nếu giá trị ưu tiên nhỏ hơn giá trị này, giá trị tối thiểu sẽ được sử dụng.

- `val`
  - : Giá trị ưu tiên là biểu thức có giá trị sẽ được sử dụng miễn là kết quả nằm giữa giá trị tối thiểu và tối đa.

- `max`
  - : Giá trị tối đa là giá trị biểu thức lớn nhất (dương nhất) sẽ được gán cho thuộc tính nếu giá trị ưu tiên lớn hơn giới hạn trên này.

Các biểu thức có thể là hàm toán học (xem {{cssxref("calc()")}} để biết thêm thông tin), các giá trị trực tiếp, các biểu thức khác cho kết quả là kiểu đối số hợp lệ (như {{CSSxRef("&lt;length&gt;")}}), hoặc các hàm {{cssxref("min()")}} và {{cssxref("max()")}} lồng nhau. Với biểu thức toán học, bạn có thể sử dụng phép cộng, trừ, nhân và chia mà không cần dùng hàm `calc()` chính nó. Bạn cũng có thể dùng dấu ngoặc đơn để xác định thứ tự tính toán khi cần.

Bạn có thể sử dụng các đơn vị khác nhau cho mỗi giá trị trong biểu thức và các đơn vị khác nhau trong bất kỳ hàm toán học nào tạo nên các đối số.

Hãy lưu ý các khía cạnh sau khi làm việc với hàm:

- Biểu thức toán học liên quan đến phần trăm cho chiều rộng và chiều cao trên các cột bảng, nhóm cột bảng, hàng bảng, nhóm hàng bảng và ô bảng trong cả bảng bố cục tự động và cố định _có thể_ được coi như là `auto` đã được chỉ định.
- Được phép lồng các hàm `max()` và `min()` làm giá trị biểu thức, trong trường hợp đó các hàm bên trong được coi như dấu ngoặc đơn thông thường. Các biểu thức là biểu thức toán học đầy đủ, vì vậy bạn có thể sử dụng phép cộng, trừ, nhân và chia trực tiếp mà không cần dùng hàm calc() chính nó.
- Biểu thức có thể là các giá trị kết hợp toán tử cộng (`+`), trừ (`-`), nhân (`*`) và chia (`/`), sử dụng quy tắc ưu tiên toán tử chuẩn. Hãy đặt khoảng trắng ở mỗi bên của toán hạng `+` và `-`. Các toán hạng trong biểu thức có thể là bất kỳ giá trị cú pháp {{CSSxRef("&lt;length&gt;")}} nào. Bạn có thể sử dụng các đơn vị khác nhau cho mỗi giá trị trong biểu thức. Bạn cũng có thể dùng dấu ngoặc đơn để xác định thứ tự tính toán khi cần.
- Thường bạn sẽ muốn sử dụng {{cssxref("min()")}} và {{cssxref("max()")}} bên trong hàm `clamp()`.

### Giá trị trả về

`clamp(MIN, VAL, MAX)` được tính toán như `max(MIN, min(VAL, MAX))`.

Dựa trên các tham số được cung cấp, hàm trả về {{CSSxRef("&lt;length&gt;")}}, {{CSSxRef("&lt;frequency&gt;")}}, {{cssxref("angle")}}, {{CSSxRef("&lt;time&gt;")}}, {{CSSxRef("&lt;percentage&gt;")}}, {{CSSxRef("&lt;number&gt;")}}, hoặc {{CSSxRef("&lt;integer&gt;")}}.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### So sánh min(), max() và clamp()

Trong ví dụ này, chúng ta có một trang web sử dụng {{cssxref("min()")}}, {{cssxref("max()")}} và `clamp()` để thiết lập kích thước theo cách responsive.

Ví dụ điều chỉnh kích thước của các phần tử trang theo ba cách:

- độ dài của các dòng văn bản
- cỡ chữ của văn bản đoạn
- cỡ chữ của văn bản tiêu đề

Trong cả ba trường hợp, trang sử dụng kết hợp các đơn vị tương đối với viewport ([`vw`](/vi/docs/Web/CSS/Reference/Values/length#vw) và {{cssxref("percentage")}}), để thiết lập kích thước thay đổi theo chiều rộng viewport, và giá trị không tương đối với viewport ([`rem`](/vi/docs/Web/CSS/Reference/Values/length#rem) và [`px`](/vi/docs/Web/CSS/Reference/Values/length#px)) để thực hiện kích thước tối thiểu và/hoặc tối đa.

Ví dụ nằm tại <https://mdn.github.io/css-examples/min-max-clamp/>. Mở nó trong một cửa sổ mới và thử điều chỉnh chiều rộng cửa sổ.

**Độ dài dòng** (được điều khiển bởi {{cssxref("width")}} của phần tử [`<body>`](/vi/docs/Web/HTML/Reference/Elements/body)) sẽ tăng khi chiều rộng cửa sổ tăng, nhưng chỉ đến một điểm nhất định (`1000px`), và sau đó nó sẽ không tăng nữa. Chúng ta đang dùng `min()` để thiết lập **độ dài dòng tối đa**: nó có thể dưới `1000px`, nhưng sẽ không vượt quá. Điều này hữu ích vì dòng quá dài khó đọc hơn, vì vậy chúng ta thường muốn giới hạn độ dài dòng. Để đạt được điều này, chúng ta dùng `min(1000px, calc(70% + 100px))`: khi kết quả của phép tính theo phần trăm vượt quá `1000px`, chúng ta chuyển sang giá trị cố định `1000px`.

**Cỡ chữ của văn bản đoạn**, được điều khiển bởi {{cssxref("font-size")}} của phần tử [`<p>`](/vi/docs/Web/HTML/Reference/Elements/p), giảm khi cửa sổ trở nên hẹp hơn, nhưng chỉ đến một điểm nhất định, và sau điểm đó (điểm mà `1.2vw` nhỏ hơn `1.2rem`) nó không giảm nữa: nó giữ nguyên ở `1.2rem`. Chúng ta đang dùng `max()` để thiết lập **cỡ chữ tối thiểu**: chữ có thể lớn hơn `1.2rem` nhưng sẽ không bao giờ nhỏ hơn. Điều này hữu ích vì văn bản quá nhỏ khó đọc. Để đạt được điều này, chúng ta dùng `max(1.2rem, 1.2vw)`. Điều này có nghĩa là `font-size` sẽ được thiết lập ở `1.2rem`, trừ khi giá trị tính toán của `1.2vw` lớn hơn `1.2rem`, trong trường hợp đó sẽ được thiết lập thành `1.2vw`.

**Cỡ chữ của văn bản tiêu đề**, được điều khiển bởi {{cssxref("font-size")}} của phần tử [`<h1>`](/vi/docs/Web/HTML/Reference/Elements/Heading_Elements), có giá trị tương đối với viewport với cả ngưỡng tối đa và tối thiểu. Để đạt được điều này, chúng ta dùng `clamp(1.8rem, 2.5vw, 2.8rem)`. Giá trị tương đối với viewport là `2.5vw` nhưng được kẹp giữa `1.8rem` và `2.8rem`, vì vậy:

- nếu giá trị tính toán của `2.5vw` nhỏ hơn `1.8rem`, thì `1.8rem` sẽ được sử dụng
- nếu giá trị tính toán của `2.5vw` lớn hơn `2.8rem`, thì `2.8rem` sẽ được sử dụng.

Điều này ngăn văn bản tiêu đề trở nên quá nhỏ trong cửa sổ rất hẹp, hoặc quá lớn trong cửa sổ rất rộng.

#### HTML

```html
<h1>Basic responsive test</h1>
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. In orci orci,
  eleifend id risus nec, mattis rutrum velit. Suspendisse fringilla egestas erat
  eu convallis. Phasellus eu velit ut magna dapibus elementum cursus at ligula.
  Ut tempus varius nibh, nec auctor sapien iaculis sit amet. Fusce iaculis,
  libero quis elementum viverra, nulla ante accumsan lectus, sit amet convallis
  lacus ipsum vel est. Curabitur et urna non est consectetur pulvinar vel id
  risus. Ut vestibulum, sem in semper aliquet, felis arcu euismod sapien, ac
  imperdiet massa nisl quis sem. Vestibulum ac elementum felis, in tempor velit.
  Pellentesque purus ex, mattis at ornare quis, porta condimentum mi. Donec
  vestibulum ligula vel nulla blandit, quis euismod nulla vestibulum.
  Suspendisse potenti. Nunc neque mauris, tempor sed facilisis at, ultrices eget
  nulla. Pellentesque convallis ante nec augue porttitor, id tempus ante luctus.
</p>

<p>
  Integer rutrum sollicitudin tellus, quis cursus nulla scelerisque nec. Nunc eu
  facilisis lorem. Maecenas faucibus sapien eleifend, semper tellus at, pharetra
  quam. Cras feugiat vulputate tortor at rhoncus. Class aptent taciti sociosqu
  ad litora torquent per conubia nostra, per inceptos himenaeos. Nam non felis
  quis sem lobortis sodales vel id libero. Phasellus sit amet placerat lorem.
</p>
```

#### CSS

```css
html {
  font-family: sans-serif;
}

body {
  margin: 0 auto;
  width: min(1000px, calc(70% + 100px));
}

h1 {
  letter-spacing: 2px;
  font-size: clamp(1.8rem, 2.5vw, 2.8rem);
}

p {
  line-height: 1.5;
  font-size: max(1.2rem, 1.2vw);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("calc()")}}
- {{cssxref("max()")}}
- {{cssxref("min()")}}
- [Học: Giá trị và đơn vị CSS](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
