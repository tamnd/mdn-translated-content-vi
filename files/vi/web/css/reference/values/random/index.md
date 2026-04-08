---
title: random()
slug: Web/CSS/Reference/Values/random
page-type: css-function
status:
  - experimental
browser-compat: css.types.random
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`random()`** trong [CSS](/vi/docs/Web/CSS) tạo ra một giá trị ngẫu nhiên trong phạm vi được chỉ định, tùy chọn giới hạn các giá trị có thể theo khoảng bước giữa các giới hạn đó. Nó có thể được dùng khi xác định {{CSSxRef("&lt;length&gt;")}}, {{CSSxRef("&lt;frequency&gt;")}}, {{cssxref("angle")}}, {{CSSxRef("&lt;time&gt;")}}, {{CSSxRef("&lt;resolution&gt;")}}, {{CSSxRef("&lt;percentage&gt;")}}, {{CSSxRef("&lt;number&gt;")}}, hoặc {{CSSxRef("&lt;integer&gt;")}} trong giá trị thuộc tính.

{{InteractiveExample("CSS Demo: random()")}}

```html interactive-example
<div class="box"></div>
```

```css interactive-example
.box {
  rotate: random(element-shared, 0deg, 360deg);
  width: random(element-shared, 50px, 300px);
  background-color: hsl(random(element-shared, 0, 360) 50% 50%);
  height: random(element-shared, 50px, 300px);
}

@supports not (order: random(1, 2)) {
  body::before {
    content: "Your browser doesn't support the random() function.";
  }
}
```

## Cú pháp

```css
/* Sử dụng cơ bản */
random(0, 100)
random(10px, 500px)
random(0deg, 360deg)

/* Với khoảng bước */
random(0, 100, 10)
random(0rad, 1turn, 30deg)

/* Với giá trị cơ sở */
random(auto, 0, 360)
random(element-shared, 0s, 5s)
random(--unique-base, 400px, 100px)
random(fixed 0.5, 1em, 40vw)
random(--unique-base element-shared, 100dpi, 300dpi)

/* Với giá trị cơ sở và bước */
random(element-shared, 0deg, 360deg, 45deg)
random(--my-base, 1em, 3rem, 2px)
```

### Tham số

- `<random-value-sharing>` {{optional_inline}}
  - : Kiểm soát các hàm `random()` nào trong tài liệu sẽ chia sẻ một giá trị cơ sở ngẫu nhiên chung và cái nào sẽ nhận các giá trị riêng biệt.
    Đây có thể là một trong các giá trị sau, hoặc cả khóa tùy chỉnh và từ khóa `element-shared`, phân tách bằng dấu cách:
    - `auto`
      - : Mỗi lần sử dụng `random()` trong style của phần tử nhận giá trị cơ sở ngẫu nhiên độc nhất của riêng nó.
    - {{cssxref("dashed-ident")}}
      - : Khóa tùy chỉnh (ví dụ: `--my-random-key`) để chia sẻ cùng một giá trị cơ sở ngẫu nhiên giữa các thuộc tính của một phần tử.
    - `element-shared`
      - : Giá trị cơ sở ngẫu nhiên được chia sẻ giữa tất cả các phần tử cho cùng một thuộc tính sử dụng từ khóa này. Giá trị cơ sở này độc lập với các hàm `random()` được đưa vào trong các giá trị thuộc tính khác trên cùng phần tử đó, trừ khi các hàm random cũng bao gồm cùng một khóa tùy chỉnh.
    - `fixed <number>`
      - : Chỉ định một giá trị cơ sở giữa `0` và `1` (bao gồm) cho giá trị ngẫu nhiên được tạo ra.

- `<calc-sum>, <calc-sum>`
  - : Hai giá trị `<number>`, `<dimension>` hoặc `<percentage>` phân tách bằng dấu phẩy bắt buộc, hoặc các phép tính cho kết quả một trong các loại này, xác định lần lượt giá trị tối thiểu và tối đa. Cả hai giá trị phải có thể phân giải về cùng [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types). Nếu giá trị tối đa nhỏ hơn tối thiểu, hàm sẽ trả về giá trị `<calc-sum>` đầu tiên.

- `<calc-sum>` {{optional_inline}}
  - : `<calc-sum>` thứ ba tùy chọn, đứng trước là dấu phẩy, xác định khoảng bước. Nếu có, và cùng kiểu dữ liệu với hai giá trị `<calc-sum>` tối thiểu và tối đa phân tách bằng dấu phẩy, nó xác định giá trị trả về là giá trị tối thiểu hoặc ở các bước tăng của giá trị bước từ giá trị tối thiểu, lên đến giá trị tối đa.

### Giá trị trả về

Trả về một `<number>`, `<dimension>` hoặc `<percentage>` ngẫu nhiên giữa các giá trị phạm vi tối thiểu và tối đa (bao gồm), cùng kiểu với các tham số `<calc-sum>`.

## Mô tả

Hàm `random(SEED, MIN, MAX, STEP)` xác định các giá trị tối thiểu và tối đa cùng các bước tăng tùy chọn, bắt đầu từ giá trị tối thiểu. Hàm tạo ra kết quả ngẫu nhiên trong phạm vi đã chỉ định. Seed — tham số [`<random-value-sharing>`](#random-value-sharing) tùy chọn — cho phép chia sẻ hoặc thay đổi các giá trị cơ sở ngẫu nhiên giữa các thuộc tính và phần tử khác nhau.

Các giá trị tối thiểu, tối đa và bước được chỉ định phải cùng kiểu dữ liệu để hàm hợp lệ. Trong khi các đơn vị trong hai đến ba tham số `<calc-sum>` không cần giống nhau, chúng cần cùng kiểu dữ liệu, chẳng hạn {{cssxref("number")}}, {{cssxref("percentage")}}, {{cssxref("length")}}, {{cssxref("angle")}}, {{cssxref("time")}} hoặc {{cssxref("frequency")}}, để hợp lệ.

### Giá trị cơ sở ngẫu nhiên

Giá trị cơ sở ngẫu nhiên hoạt động như [seed cho tính ngẫu nhiên](/vi/docs/Glossary/RNG). Đây là số khởi đầu được dùng để tạo ra kết quả ngẫu nhiên cuối cùng. Khi hai hàm `random()` chia sẻ cùng một giá trị cơ sở, kết quả của chúng thay đổi cùng nhau theo một mẫu có thể dự đoán. Khi chúng có các giá trị cơ sở khác nhau, kết quả của chúng hoàn toàn độc lập nhau.

Tham số `<random-value-sharing>` tùy chọn đầu tiên kiểm soát cách giá trị cơ sở ngẫu nhiên được chia sẻ. Chia sẻ cho phép tái sử dụng cùng một giá trị được tạo ra ngẫu nhiên, cần thiết cho một số hiệu ứng thiết kế. Giá trị có thể được đặt là `auto`, từ khóa `element-shared`, {{cssxref("dashed-ident")}} tùy chỉnh, hoặc `fixed <number>`. Kết hợp {{cssxref("dashed-ident")}} tùy chỉnh với từ khóa `element-shared`, phân tách bằng dấu cách, cũng hợp lệ.

#### Từ khóa `element-shared`

Tất cả các hàm `random()` có từ khóa `element-shared` chia sẻ cùng một giá trị cơ sở ngẫu nhiên cho một thuộc tính duy nhất trên tất cả các phần tử. Ví dụ, khi khai báo sau, A, B và C sẽ là các hình chữ nhật có kích thước giống hệt nhau, tất cả có cùng chiều rộng ngẫu nhiên và tất cả có cùng chiều cao ngẫu nhiên được tạo độc lập:

```css
A,
B,
C {
  width: random(element-shared, 10px, 200px);
  height: random(element-shared, 10px, 200px);
}
```

#### Tên tùy chỉnh

Khi bạn chỉ định một `<dashed-ident>` (ví dụ: `--custom-name`), mỗi phần tử trong style của phần tử có cùng tên chia sẻ cùng giá trị cơ sở ngẫu nhiên, và những phần tử có giá trị `<dashed-ident>` khác sẽ được gán các giá trị cơ sở ngẫu nhiên riêng biệt. Khi khai báo sau, A, B và C sẽ đều là hình vuông, vì trong mỗi phần tử, tất cả các thuộc tính tham chiếu cùng ident sẽ chia sẻ cùng giá trị cơ sở. Do đó, chiều rộng của mỗi phần tử sẽ bằng chiều cao của nó. Lưu ý rằng trong trường hợp này, A, B và C sẽ có kích thước riêng biệt vì chia sẻ giá trị cơ sở là giữa các thuộc tính của một phần tử, không phải giữa các phần tử.

```css
A,
B,
C {
  width: random(--custom-name, 10px, 200px);
  height: random(--custom-name, 10px, 200px);
}
```

#### Đặt cả `<dashed-ident>` và `element-shared`

Kết hợp `<dashed-ident>` với `element-shared` (ví dụ: `random(--custom-name element-shared, 0, 100)`) chia sẻ giá trị cơ sở ngẫu nhiên giữa cả các phần tử và các thuộc tính sử dụng cùng tham số `<random-value-sharing>`. Với khai báo sau, A, B và C sẽ đều là hình vuông có cùng kích thước:

```css
A,
B,
C {
  width: random(--custom-name element-shared, , 10px, 200px);
  height: random(--custom-name element-shared, 10px, 200px);
}
```

#### Hành vi tự động

Khi tham số đầu tiên bị bỏ qua, hoặc được đặt tường minh là `auto`, một ident được tự động tạo từ tên thuộc tính và vị trí. Hành vi này có thể gây ra một số chia sẻ giá trị cơ sở ngẫu nhiên bất ngờ.

```css
.foo {
  width: random(100px, 200px);
}
.foo:hover {
  width: random(100px, 200px);
}
.bar {
  margin: random(1px, 100px) random(1px, 100px);
}
.bar:hover {
  margin: random(1px, 100px) random(1px, 100px) random(1px, 100px)
    random(1px, 100px);
}
```

Khi `<random-value-sharing>` mặc định hoặc được đặt tường minh là `auto`, tác nhân người dùng tự tạo tên seed, hay _định danh chia sẻ giá trị được tạo_, theo các quy tắc nhất quán dựa trên tên thuộc tính và thứ tự. Vì điều này, các hàm `random()` có thể có cùng tên seed và do đó cùng giá trị cơ sở ngẫu nhiên. Trong ví dụ này, định danh chia sẻ giá trị được tạo cho hàm `random()` trong giá trị thuộc tính `width` của `.foo` giống với `.foo:hover`, nên giá trị sẽ không thay đổi giữa các trạng thái. Tương tự, hai hàm `random()` đầu tiên trong cả hai khai báo `margin` có cùng định danh chia sẻ giá trị được tạo, nghĩa là hai giá trị đầu tiên trong tốc ký `margin` sẽ không thay đổi khi hover; khi hover, margin trên và phải của `bar` sẽ giữ nguyên, nhưng margin dưới và trái sẽ nhận giá trị ngẫu nhiên độc lập. Để nhận giá trị độc lập cho mỗi hàm `random()`, hãy cung cấp {{cssxref("dashed-ident")}} độc nhất.

### Thuộc tính tùy chỉnh

Như với tất cả các hàm CSS, khi hàm `random()` được đưa vào trong giá trị thuộc tính tùy chỉnh, giá trị vẫn là một hàm; hoạt động như cơ chế thay thế văn bản, không lưu trữ một giá trị trả về duy nhất.

```css
--random-size: random(1px, 100px);
```

Trong ví dụ này, thuộc tính tùy chỉnh `--random-size` không "lưu trữ" kết quả được tạo ngẫu nhiên. Khi `var(--random-size)` được phân tích cú pháp, nó thực sự được thay thế bằng `random(1px, 100px)`, nghĩa là mỗi lần sử dụng tạo ra một lần gọi hàm `random()` mới với giá trị cơ sở riêng phụ thuộc vào ngữ cảnh sử dụng.

Điều này không đúng trong trường hợp dùng `random()` khi đăng ký thuộc tính tùy chỉnh với {{cssxref("@property")}}. Các thuộc tính tùy chỉnh được đăng ký tính toán các giá trị ngẫu nhiên và lưu trữ chúng.

Trong ví dụ này, vì `--defaultSize` được đăng ký, A, B và C sẽ là các hình vuông có cùng kích thước, nhưng màu sắc của chúng sẽ ngẫu nhiên, vì `--random-angle` không được đăng ký:

```css
@property --defaultSize {
  syntax: "<length> | <percentage>";
  inherits: true;
  initial-value: random(100px, 200px);
}
:root {
  --random-angle: random(0deg, 360deg);
}
A,
B,
C {
  background-color: hsl(var(--random-angle) 100% 50%);
  height: var(--defaultSize);
  width: var(--defaultSize);
}
```

## Khả năng tiếp cận

Vì `random()` có thể tạo ra một giá trị không xác định trong một phạm vi, bạn không có toàn quyền kiểm soát những gì bạn nhận được. Điều này có thể dẫn đến kết quả không thể tiếp cận. Ví dụ, nếu bạn dùng `random()` để tạo màu chữ, bạn có thể nhận được giá trị có độ tương phản thấp với nền. Điều quan trọng là phải chú ý đến ngữ cảnh sử dụng `random()`, đảm bảo kết quả luôn có thể tiếp cận.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng cơ bản

Trong ví dụ này, chúng ta sẽ tạo màu ngẫu nhiên cho một số huy hiệu tròn để minh họa cách sử dụng cơ bản của hàm `random()`.

#### HTML

Chúng ta có năm huy hiệu, một dùng class `desaturated` và hai dùng class `unique`.

```html
<div class="badge"></div>
<div class="badge"></div>
<div class="badge desaturated"></div>
<div class="badge unique"></div>
<div class="badge unique"></div>
```

#### CSS

Chúng ta hiển thị năm huy hiệu dưới dạng hình tròn. Chúng ta dùng hàm `random()` trong hàm màu {{cssxref("hsl()")}} để xác định {{cssxref("angle")}} của {{cssxref("hue")}}. Chúng ta đặt `element-shared` để chia sẻ giá trị cơ sở ngẫu nhiên giữa `badge` mặc định và `badge` `desaturated`, để nó là phiên bản ít bão hòa hơn của cùng {{cssxref("hue")}}. Sau đó chúng ta ghi đè các huy hiệu `unique` để có `hue` thực sự ngẫu nhiên bằng cách để tham số chia sẻ giá trị cơ sở mặc định là `auto`.

```css
.badge {
  display: inline-block;
  width: 5em;
  aspect-ratio: 1/1;
  border-radius: 50%;
  background: hsl(random(element-shared, 0, 360) 50% 50%);
}
.badge.desaturated {
  background: hsl(random(element-shared, 0, 360) 10% 50%);
}
.badge.unique {
  background: hsl(random(0, 360) 50% 50%);
}

@supports not (order: random(1, 2)) {
  :root::after {
    content: "Your browser doesn't support the random() function.";
  }
}
```

#### Kết quả

{{EmbedLiveSample('Generate random colors for circular badge', '100%', '300px')}}

### Chia sẻ giá trị ngẫu nhiên giữa các thuộc tính

Trong ví dụ này, chúng ta tạo một nền sao để minh họa cách dùng `<dashed-ident>` để chia sẻ giá trị seed giữa các thuộc tính của phần tử.

#### HTML

Chúng ta có năm particle, tất cả chia sẻ cùng tên class.

```html
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
<div class="particle"></div>
```

#### CSS

Mỗi particle có cùng style. Chúng ta dùng hàm `random()` cho các giá trị {{cssxref("height")}}, {{cssxref("width")}}, {{cssxref("top")}} và {{cssxref("left")}} để định kích thước và vị trí ngẫu nhiên cho mỗi particle. Chúng ta dùng `<dashed-ident>` làm giá trị cơ sở cho `height` và `width`, nghĩa là kích thước của các particle độc lập với nhau trong phạm vi đã chỉ định, nhưng `height` của mỗi particle sẽ bằng `width` của nó. Chúng ta để giá trị cơ sở phân giải thành `auto` cho các thuộc tính `top` và `left`, nên giá trị cơ sở cho mỗi thuộc tính và phần tử độc lập với nhau.

```css
body {
  background: black;
}

.particle {
  border-radius: 50%;
  background: white;
  position: fixed;
  width: random(--particle-size, 0.25em, 1em);
  height: random(--particle-size, 0.25em, 1em);
  top: random(0%, 100%);
  left: random(0%, 100%);
  animation: move 1s alternate-reverse infinite;
}
```

```css hidden
@supports not (order: random(1, 2)) {
  body::before {
    color: white;
    content: "Your browser doesn't support the random() function.";
  }
}
```

#### Kết quả

{{EmbedLiveSample('Random value sharing between properties', '100%', '300px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("calc()")}}
- Mô-đun [CSS units and values](/vi/docs/Web/CSS/Guides/Values_and_units)
- {{domxref("Math.random()")}}
- [Rolling the Dice with CSS random()](https://webkit.org/blog/17285/rolling-the-dice-with-css-random/) qua webkit.org (2025)
- [CSS Almanac: random()](https://css-tricks.com/almanac/functions/r/random/) qua CSS-Tricks.com
