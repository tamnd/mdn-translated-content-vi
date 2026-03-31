---
title: Math
slug: Web/JavaScript/Reference/Global_Objects/Math
page-type: javascript-namespace
browser-compat: javascript.builtins.Math
sidebar: jsref
---

Đối tượng namespace **`Math`** chứa các thuộc tính và phương thức tĩnh dành cho các hằng số và hàm toán học.

`Math` hoạt động với kiểu {{jsxref("Number")}}. Nó không hoạt động với {{jsxref("BigInt")}}.

## Mô tả

Khác với hầu hết các đối tượng toàn cục, `Math` không phải là một constructor. Bạn không thể sử dụng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hoặc gọi đối tượng `Math` như một hàm. Tất cả các thuộc tính và phương thức của `Math` đều là tĩnh.

> [!NOTE]
> Nhiều hàm `Math` có độ chính xác _phụ thuộc vào triển khai_.
>
> Điều này có nghĩa là các trình duyệt khác nhau có thể cho kết quả khác nhau. Thậm chí cùng một JavaScript engine trên hệ điều hành hoặc kiến trúc khác nhau cũng có thể cho kết quả khác nhau!

## Thuộc tính tĩnh

- {{jsxref("Math.E")}}
  - : Số Euler và cơ số của logarithm tự nhiên; xấp xỉ `2.718`.
- {{jsxref("Math.LN10")}}
  - : Logarithm tự nhiên của `10`; xấp xỉ `2.303`.
- {{jsxref("Math.LN2")}}
  - : Logarithm tự nhiên của `2`; xấp xỉ `0.693`.
- {{jsxref("Math.LOG10E")}}
  - : Logarithm cơ số 10 của `E`; xấp xỉ `0.434`.
- {{jsxref("Math.LOG2E")}}
  - : Logarithm cơ số 2 của `E`; xấp xỉ `1.443`.
- {{jsxref("Math.PI")}}
  - : Tỉ số chu vi của một đường tròn so với đường kính của nó; xấp xỉ `3.14159`.
- {{jsxref("Math.SQRT1_2")}}
  - : Căn bậc hai của ½; xấp xỉ `0.707`.
- {{jsxref("Math.SQRT2")}}
  - : Căn bậc hai của `2`; xấp xỉ `1.414`.
- `Math[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Math"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức tĩnh

- {{jsxref("Math.abs()")}}
  - : Trả về giá trị tuyệt đối của đầu vào.
- {{jsxref("Math.acos()")}}
  - : Trả về arccosine của đầu vào.
- {{jsxref("Math.acosh()")}}
  - : Trả về arccosine hyperbolic của đầu vào.
- {{jsxref("Math.asin()")}}
  - : Trả về arcsine của đầu vào.
- {{jsxref("Math.asinh()")}}
  - : Trả về arcsine hyperbolic của một số.
- {{jsxref("Math.atan()")}}
  - : Trả về arctangent của đầu vào.
- {{jsxref("Math.atan2()")}}
  - : Trả về arctangent của thương của các đối số.
- {{jsxref("Math.atanh()")}}
  - : Trả về arctangent hyperbolic của đầu vào.
- {{jsxref("Math.cbrt()")}}
  - : Trả về căn bậc ba của đầu vào.
- {{jsxref("Math.ceil()")}}
  - : Trả về số nguyên nhỏ nhất lớn hơn hoặc bằng đầu vào.
- {{jsxref("Math.clz32()")}}
  - : Trả về số bit zero đứng đầu của đầu vào số nguyên 32-bit.
- {{jsxref("Math.cos()")}}
  - : Trả về cosine của đầu vào.
- {{jsxref("Math.cosh()")}}
  - : Trả về cosine hyperbolic của đầu vào.
- {{jsxref("Math.exp()")}}
  - : Trả về e<sup>x</sup>, trong đó x là đối số, và e là số Euler (`2.718`…, cơ số của logarithm tự nhiên).
- {{jsxref("Math.expm1()")}}
  - : Trả về kết quả của `exp(x)` trừ đi `1`.
- {{jsxref("Math.floor()")}}
  - : Trả về số nguyên lớn nhất nhỏ hơn hoặc bằng đầu vào.
- {{jsxref("Math.f16round()")}}
  - : Trả về biểu diễn số thực [độ chính xác một nửa (half precision)](https://en.wikipedia.org/wiki/Half-precision_floating-point_format) gần nhất của đầu vào.
- {{jsxref("Math.fround()")}}
  - : Trả về biểu diễn số thực [độ chính xác đơn (single precision)](https://en.wikipedia.org/wiki/Single-precision_floating-point_format) gần nhất của đầu vào.
- {{jsxref("Math.hypot()")}}
  - : Trả về căn bậc hai của tổng bình phương các đối số.
- {{jsxref("Math.imul()")}}
  - : Trả về kết quả của phép nhân số nguyên 32-bit của các đầu vào.
- {{jsxref("Math.log()")}}
  - : Trả về logarithm tự nhiên (㏒<sub>e</sub>; hay còn gọi là ㏑) của đầu vào.
- {{jsxref("Math.log10()")}}
  - : Trả về logarithm cơ số 10 của đầu vào.
- {{jsxref("Math.log1p()")}}
  - : Trả về logarithm tự nhiên (㏒<sub>e</sub>; hay còn gọi là ㏑) của `1 + x` với số `x`.
- {{jsxref("Math.log2()")}}
  - : Trả về logarithm cơ số 2 của đầu vào.
- {{jsxref("Math.max()")}}
  - : Trả về số lớn nhất trong số không hoặc nhiều số.
- {{jsxref("Math.min()")}}
  - : Trả về số nhỏ nhất trong số không hoặc nhiều số.
- {{jsxref("Math.pow()")}}
  - : Trả về cơ số `x` lũy thừa `y` (tức là `x`<sup><code>y</code></sup>).
- {{jsxref("Math.random()")}}
  - : Trả về một số giả ngẫu nhiên trong khoảng từ `0` đến `1`.
- {{jsxref("Math.round()")}}
  - : Trả về giá trị của đầu vào được làm tròn đến số nguyên gần nhất.
- {{jsxref("Math.sign()")}}
  - : Trả về dấu của đầu vào, cho biết nó là dương, âm hay bằng không.
- {{jsxref("Math.sin()")}}
  - : Trả về sine của đầu vào.
- {{jsxref("Math.sinh()")}}
  - : Trả về sine hyperbolic của đầu vào.
- {{jsxref("Math.sqrt()")}}
  - : Trả về căn bậc hai dương của đầu vào.
- {{jsxref("Math.sumPrecise()")}}
  - : Trả về tổng của một iterable các số được truyền vào, tránh mất độ chính xác dấu phẩy động trong các kết quả trung gian.
- {{jsxref("Math.tan()")}}
  - : Trả về tangent của đầu vào.
- {{jsxref("Math.tanh()")}}
  - : Trả về tangent hyperbolic của đầu vào.
- {{jsxref("Math.trunc()")}}
  - : Trả về phần nguyên của đầu vào, loại bỏ bất kỳ chữ số thập phân nào.

## Ví dụ

### Chuyển đổi giữa độ và radian

Các hàm lượng giác `sin()`, `cos()`, `tan()`, `asin()`, `acos()`, `atan()`, và `atan2()` nhận (và trả về) các góc tính bằng _radian_.

Vì con người thường nghĩ theo độ, và một số hàm (chẳng hạn như CSS transforms) có thể chấp nhận độ, nên việc có sẵn các hàm chuyển đổi giữa hai đơn vị là một ý hay:

```js
function degToRad(degrees) {
  return degrees * (Math.PI / 180);
}

function radToDeg(rad) {
  return rad / (Math.PI / 180);
}
```

### Tính chiều cao của một tam giác đều

Nếu chúng ta muốn tính chiều cao của một tam giác đều và biết độ dài cạnh của nó là 100, chúng ta có thể sử dụng công thức _độ dài cạnh kề nhân với tang của góc bằng cạnh đối diện_.

![Một tam giác đều trong đó đường vuông góc từ một đỉnh xuống cạnh đối diện tạo thành một tam giác vuông với ba cạnh được đánh dấu là "adjacent" (cạnh kề), "opposite" (cạnh đối) và "hypotenuse" (cạnh huyền). Góc giữa cạnh "adjacent" và "hypotenuse" là 60 độ.](trigonometry.png)

Trong JavaScript, chúng ta có thể làm điều này như sau:

```js
50 * Math.tan(degToRad(60));
```

Chúng ta sử dụng hàm `degToRad()` để chuyển đổi 60 độ thành radian, vì {{jsxref("Math.tan()")}} nhận giá trị đầu vào tính bằng radian.

### Trả về một số nguyên ngẫu nhiên trong khoảng hai giới hạn

Điều này có thể được thực hiện bằng cách kết hợp {{jsxref("Math.random()")}} và {{jsxref("Math.floor()")}}:

```js
function random(min, max) {
  const num = Math.floor(Math.random() * (max - min + 1)) + min;
  return num;
}

random(1, 10);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number")}}
