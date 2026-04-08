---
title: <calc-keyword>
slug: Web/CSS/Reference/Values/calc-keyword
page-type: css-type
browser-compat: css.types.calc-keyword
sidebar: cssref
---

Kiểu dữ liệu **`<calc-keyword>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho các hằng số được định nghĩa rõ ràng như `e` và `pi`. Thay vì yêu cầu tác giả gõ thủ công nhiều chữ số của các hằng số toán học này hoặc tính toán chúng, một số hằng số được CSS cung cấp trực tiếp để thuận tiện.

## Cú pháp

Kiểu `<calc-keyword>` định nghĩa các hằng số số có thể được sử dụng trong [các hàm toán học CSS](/vi/docs/Web/CSS/Reference/Values/Functions#math_functions).

### Giá trị

- `e`
  - : Cơ số của logarit tự nhiên, xấp xỉ bằng `2.7182818284590452354`.

- `pi`
  - : Tỷ số chu vi của vòng tròn so với đường kính của nó, xấp xỉ bằng `3.1415926535897932`.

- `infinity` & `-infinity`
  - : Một giá trị vô cực, được sử dụng để chỉ ra giá trị lớn nhất/nhỏ nhất có thể.

- `NaN`
  - : Một giá trị đại diện cho "Not a Number" (không phải số) với quy tắc viết hoa chính tắc.

### Ghi chú

Việc tuần tự hóa các đối số bên trong [`calc()`](/vi/docs/Web/CSS/Reference/Values/calc) tuân theo tiêu chuẩn IEEE-754 cho toán học dấu phẩy động, có nghĩa là có một số trường hợp cần lưu ý liên quan đến các hằng số như `infinity` và `NaN`:

- Chia cho không sẽ trả về `infinity` dương hoặc âm tùy thuộc vào dấu của tử số.
- Cộng, trừ hoặc nhân `infinity` với bất kỳ thứ gì sẽ trả về `infinity` trừ khi nó tạo ra `NaN` (xem bên dưới).
- Bất kỳ phép toán nào có ít nhất một đối số `NaN` sẽ trả về `NaN`.
  Điều này có nghĩa là `0 / 0`, `infinity / infinity`, `0 * infinity`, `infinity + (-infinity)`, và `infinity - infinity` đều sẽ trả về `NaN`.

- Không dương và không âm là các giá trị có thể (`0⁺` và `0⁻`).
  Điều này có các tác động sau:
  - Phép nhân hoặc chia tạo ra không với đúng một đối số âm (`-5 * 0` hoặc `1 / (-infinity)`) hoặc kết quả âm từ các tổ hợp trong các hàm toán học khác sẽ trả về `0⁻`.
  - `0⁻ + 0⁻` hoặc `0⁻ - 0` sẽ trả về `0⁻`.
    Tất cả các phép cộng hoặc trừ khác tạo ra không sẽ trả về `0⁺`.
  - Nhân hoặc chia `0⁻` với một số dương (bao gồm `0⁺`) sẽ trả về kết quả âm (hoặc `0⁻` hoặc `-infinity`), trong khi nhân hoặc chia `0⁻` với một số âm sẽ trả về kết quả dương.

Các ví dụ về cách áp dụng các quy tắc này được hiển thị trong phần [Infinity, NaN và chia cho không](#infinity_nan_and_division_by_zero).

> [!NOTE]
> Hiếm khi cần sử dụng `infinity` làm đối số trong `calc()`, nhưng nó có thể được dùng để tránh các "số ma thuật" được mã hóa cứng hoặc đảm bảo một giá trị nhất định luôn lớn hơn giá trị khác.
> Nó có thể hữu ích nếu bạn cần làm rõ rằng một thuộc tính có "giá trị lớn nhất có thể" cho kiểu dữ liệu đó.

### Cú pháp hình thức

{{CSSSyntax}}

## Mô tả

Các hằng số toán học chỉ có thể được sử dụng bên trong [các hàm toán học CSS](/vi/docs/Web/CSS/Reference/Values/Functions#math_functions) để tính toán. Các hằng số toán học không phải là từ khóa CSS, nhưng nếu chúng được sử dụng ngoài phép tính, chúng được xử lý như bất kỳ từ khóa nào khác.
Ví dụ:

- `animation-name: pi;` đề cập đến một animation có tên là "pi", không phải hằng số số `pi`.
- `line-height: e;` không hợp lệ, nhưng `line-height: calc(e);` hợp lệ.
- `rotate(1rad * pi);` sẽ không hoạt động vì {{CSSxRef("transform-function/rotate", "rotate()")}} không phải là hàm toán học. Sử dụng `rotate(calc(1rad * pi));`

Trong các hàm toán học, các giá trị `<calc-keyword>` được đánh giá như các giá trị {{CSSxRef("number")}}, do đó `e` và `pi` hoạt động như các hằng số số.

Cả `infinity` và `NaN` đều có phần khác biệt, chúng được coi là các hằng số số thoái hóa.
Trong khi về mặt kỹ thuật không phải là số, chúng hoạt động như các giá trị {{CSSxRef("number")}}, vì vậy để nhận được một {{CSSxRef("length")}} vô cực, ví dụ, cần một biểu thức như `calc(infinity * 1px)`.

Các giá trị `infinity` và `NaN` được bao gồm chủ yếu để làm cho việc tuần tự hóa đơn giản hơn và rõ ràng hơn, nhưng có thể được sử dụng để chỉ ra một "giá trị lớn nhất có thể", vì một giá trị vô cực được giới hạn trong phạm vi được phép.
Hiếm khi điều này hợp lý, nhưng khi sử dụng infinity nó đơn giản hơn nhiều so với việc đặt một con số khổng lồ trong stylesheet hoặc mã hóa cứng các số ma thuật.

Tất cả các hằng số đều không phân biệt chữ hoa chữ thường ngoại trừ `NaN`, làm cho `calc(Pi)`, `calc(E)` và `calc(InFiNiTy)` hợp lệ:

```plain example-good
e
-e
E
pi
-pi
Pi
infinity
-infinity
InFiNiTy
NaN
```

Các giá trị sau đây đều không hợp lệ:

```plain example-bad
nan
Nan
NAN
```

## Ví dụ

### Sử dụng e và pi trong `calc()`

Ví dụ sau đây cho thấy cách sử dụng `e` bên trong `calc()` để xoay một phần tử với góc tăng theo hàm mũ.
Hộp thứ hai cho thấy cách sử dụng `pi` bên trong hàm [`sin()`](/vi/docs/Web/CSS/Reference/Values/sin).

```css hidden
#wrapper {
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: start;
  width: 200px;
}
.container > div {
  width: 100px;
  height: 100px;
  margin: 10px;
}

span {
  font-family: monospace;
  font-size: 0.8em;
}

#e {
  background-color: blue;
}

#pi {
  background-color: blue;
}
```

```html
<div id="wrapper">
  <div class="container">
    <div id="e"></div>
    <input type="range" min="0" max="7" step="0.01" value="0" id="e-slider" />
    <label for="e-slider">e:</label>
    <span id="e-value"></span>
  </div>
  <div class="container">
    <div id="pi"></div>
    <input type="range" min="0" max="1" step="0.01" value="0" id="pi-slider" />
    <label for="pi-slider">pi:</label>
    <span id="pi-value"></span>
  </div>
</div>
```

```js
// sliders
const eInput = document.querySelector("#e-slider");
const piInput = document.querySelector("#pi-slider");
// spans for displaying values
const eValue = document.querySelector("#e-value");
const piValue = document.querySelector("#pi-value");

eInput.addEventListener("input", function () {
  e.style.transform = `rotate(calc(1deg * pow(${this.value}, e)))`;
  eValue.textContent = e.style.transform;
});

piInput.addEventListener("input", function () {
  pi.style.rotate = `calc(sin(${this.value} * pi) * 100deg)`;
  piValue.textContent = pi.style.rotate;
});
```

{{EmbedLiveSample('Using_e_and_pi_in_calc', 'auto', '200')}}

### Infinity, NaN, và chia cho không

Ví dụ sau đây cho thấy giá trị tính toán của thuộc tính `width` khi chia cho không, tiếp theo là cách tuần tự hóa với các hằng số `calc()` khác nhau trông như thế nào khi xem trong console:

```html
<div></div>
```

```css
div {
  height: 50px;
  background-color: red;
  width: calc(1px / 0);
}
```

```js
const div = document.querySelector("div");
console.log(div.offsetWidth); // 17895698 (infinity clamped to largest value for width)

function logSerializedWidth(value) {
  div.style.width = value;
  console.log(div.style.width);
}

logSerializedWidth("calc(1px / 0)"); // calc(infinity * 1px)
logSerializedWidth("calc(1px / -0)"); // calc(-infinity * 1px)

logSerializedWidth("calc(1px * -infinity * -infinity)"); // calc(infinity * 1px)
logSerializedWidth("calc(1px * -infinity * infinity)"); // calc(-infinity * 1px)

logSerializedWidth("calc(1px * (NaN + 1))"); // calc(NaN * 1px)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("&lt;calc-sum&gt;")}}
- {{CSSxRef("&lt;calc-product&gt;")}}
- {{CSSxRef("&lt;calc-value&gt;")}}
