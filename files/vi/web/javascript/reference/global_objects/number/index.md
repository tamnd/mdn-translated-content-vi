---
title: Number
slug: Web/JavaScript/Reference/Global_Objects/Number
page-type: javascript-class
browser-compat: javascript.builtins.Number
sidebar: jsref
---

Giá trị **`Number`** biểu diễn số dấu phẩy động như `37` hoặc `-9.25`.

Constructor `Number` chứa các hằng số và phương thức để làm việc với số. Giá trị của các kiểu khác có thể được chuyển đổi sang number bằng hàm `Number()`.

## Mô tả

Số thường được biểu diễn dưới dạng literal như `255` hoặc `3.14159`. [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_literals) chứa tài liệu tham khảo chi tiết hơn.

```js
255; // two-hundred and fifty-five
255.0; // same number
255 === 255.0; // true
255 === 0xff; // true (hexadecimal notation)
255 === 0b11111111; // true (binary notation)
255 === 0.255e3; // true (decimal exponential notation)
```

Một number literal như `37` trong code JavaScript là giá trị dấu phẩy động, không phải số nguyên. Không có kiểu số nguyên riêng biệt nào trong sử dụng hàng ngày thông thường. (JavaScript cũng có kiểu {{jsxref("BigInt")}}, nhưng nó không được thiết kế để thay thế Number trong sử dụng hàng ngày. `37` vẫn là một number, không phải BigInt.)

Khi được dùng như một hàm, `Number(value)` chuyển đổi một string hoặc giá trị khác sang kiểu Number. Nếu giá trị không thể chuyển đổi được, nó trả về {{jsxref("NaN")}}.

```js
Number("123"); // returns the number 123
Number("123") === 123; // true

Number("unicorn"); // NaN
Number(undefined); // NaN
```

### Mã hóa Number

Kiểu `Number` của JavaScript là giá trị [IEEE 754 double-precision 64-bit binary format](https://en.wikipedia.org/wiki/Double_precision_floating-point_format), như `double` trong Java hoặc C#. Điều này có nghĩa là nó có thể biểu diễn các giá trị phân số, nhưng có một số giới hạn về độ lớn và độ chính xác của số được lưu trữ. Tóm lại, một số IEEE 754 double-precision sử dụng 64 bit để biểu diễn 3 phần:

- 1 bit cho _dấu_ (dương hoặc âm)
- 11 bit cho _số mũ_ (từ -1022 đến 1023)
- 52 bit cho _mantissa_ (biểu diễn một số từ 0 đến 1)

Mantissa (còn gọi là _significand_) là phần của số đại diện cho giá trị thực tế (các chữ số có nghĩa). Số mũ là lũy thừa của 2 mà mantissa nên được nhân với. Có thể hình dung theo ký hiệu khoa học:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mtext>Number</mtext><mo>=</mo><mo stretchy="false">(</mo><mrow><mo>−</mo><mn>1</mn></mrow><msup><mo stretchy="false">)</mo><mtext>sign</mtext></msup><mo>⋅</mo><mo stretchy="false">(</mo><mn>1</mn><mo>+</mo><mtext>mantissa</mtext><mo stretchy="false">)</mo><mo>⋅</mo><msup><mn>2</mn><mtext>exponent</mtext></msup></mrow><annotation encoding="TeX">\text{Number} = ({-1})^{\text{sign}} \cdot (1 + \text{mantissa}) \cdot 2^{\text{exponent}}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Mantissa được lưu với 52 bit, được hiểu là các chữ số sau `1.…` trong một số nhị phân phân số. Do đó, độ chính xác của mantissa là 2<sup>-52</sup> (có thể lấy qua {{jsxref("Number.EPSILON")}}), hay khoảng 15 đến 17 chữ số thập phân; phép tính số học vượt quá mức độ chính xác đó sẽ bị [làm tròn](https://en.wikipedia.org/wiki/Floating-point_arithmetic#Representable_numbers,_conversion_and_rounding).

Giá trị lớn nhất mà một number có thể chứa là 2<sup>1023</sup> × (2 - 2<sup>-52</sup>) (với số mũ là 1023 và mantissa là 0.1111… trong hệ nhị phân), có thể lấy qua {{jsxref("Number.MAX_VALUE")}}. Các giá trị lớn hơn được thay thế bằng hằng số số đặc biệt {{jsxref("Infinity")}}.

Số nguyên chỉ có thể được biểu diễn mà không mất độ chính xác trong khoảng từ -2<sup>53</sup> + 1 đến 2<sup>53</sup> - 1 bao gồm (có thể lấy qua {{jsxref("Number.MIN_SAFE_INTEGER")}} và {{jsxref("Number.MAX_SAFE_INTEGER")}}), vì mantissa chỉ có thể chứa 53 bit (bao gồm cả bit 1 dẫn đầu).

Thông tin chi tiết hơn được mô tả trong [ECMAScript standard](https://tc39.es/ecma262/multipage/ecmascript-data-types-and-values.html#sec-ecmascript-language-types-number-type).

### Number coercion

Nhiều thao tác tích hợp sẵn mong đợi number trước tiên sẽ ép kiểu đối số của chúng sang number (đây là lý do tại sao các `Number` object hoạt động tương tự như number primitive). [Thao tác](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-tonumber) có thể được tóm tắt như sau:

- Number được trả về nguyên vẹn.
- [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) chuyển thành [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN).
- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) chuyển thành `0`.
- `true` chuyển thành `1`; `false` chuyển thành `0`.
- String được chuyển đổi bằng cách phân tích chúng như thể chúng chứa một [number literal](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_literals). Phân tích thất bại dẫn đến `NaN`. Có một số khác biệt nhỏ so với number literal thực tế:
  - Khoảng trắng/ký tự xuống dòng ở đầu và cuối bị bỏ qua.
  - Chữ số `0` dẫn đầu không khiến số trở thành octal literal (hoặc bị từ chối trong strict mode).
  - `+` và `-` được phép ở đầu string để chỉ định dấu của nó. (Trong code thực tế, chúng "trông như" là một phần của literal, nhưng thực ra là các toán tử unary riêng biệt.) Tuy nhiên, dấu chỉ có thể xuất hiện một lần, và không được theo sau bởi khoảng trắng.
  - `Infinity` và `-Infinity` được nhận dạng như literal. Trong code thực tế, chúng là các biến toàn cục.
  - Các string rỗng hoặc chỉ có khoảng trắng được chuyển thành `0`.
  - [Dấu phân cách số](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_separators) không được phép.
- [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) ném ra {{jsxref("TypeError")}} để ngăn chặn việc ép kiểu ngầm định không mong muốn gây mất độ chính xác.
- [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) ném ra {{jsxref("TypeError")}}.
- Object trước tiên được [chuyển đổi sang primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) bằng cách gọi các phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive) (với gợi ý `"number"`), `valueOf()`, và `toString()` theo thứ tự đó. Primitive kết quả sau đó được chuyển đổi sang number.

Có hai cách để đạt được hiệu ứng gần như tương tự trong JavaScript.

- [Unary plus](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus): `+x` thực hiện chính xác các bước number coercion được giải thích ở trên để chuyển đổi `x`.
- Hàm [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number): `Number(x)` sử dụng cùng thuật toán để chuyển đổi `x`, ngoại trừ [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) không ném ra {{jsxref("TypeError")}}, mà trả về giá trị number của chúng, với khả năng mất độ chính xác.

{{jsxref("Number.parseFloat()")}} và {{jsxref("Number.parseInt()")}} tương tự như `Number()` nhưng chỉ chuyển đổi string, và có các quy tắc phân tích hơi khác nhau. Ví dụ, `parseInt()` không nhận ra dấu thập phân, và `parseFloat()` không nhận ra tiền tố `0x`.

#### Chuyển đổi sang số nguyên

Một số thao tác mong đợi số nguyên, đáng chú ý nhất là những thao tác làm việc với chỉ số mảng/string, thành phần ngày/giờ, và số radix. Sau khi thực hiện các bước number coercion ở trên, kết quả được [cắt bớt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc) thành số nguyên (bằng cách loại bỏ phần phân số). Nếu số là ±Infinity, nó được trả về nguyên vẹn. Nếu số là `NaN` hoặc `-0`, nó được trả về là `0`. Kết quả do đó luôn là số nguyên (không phải `-0`) hoặc ±Infinity.

Đáng chú ý, khi chuyển đổi sang số nguyên, cả `undefined` và `null` đều trở thành `0`, vì `undefined` được chuyển thành `NaN`, cũng trở thành `0`.

#### Chuyển đổi số có độ rộng cố định

JavaScript có một số hàm cấp thấp hơn xử lý mã hóa nhị phân của số nguyên, đáng chú ý nhất là [toán tử bitwise](/en-US/docs/Web/JavaScript/Reference/Operators#bitwise_shift_operators) và các object {{jsxref("TypedArray")}}. Toán tử bitwise luôn chuyển đổi toán hạng sang số nguyên 32-bit. Trong các trường hợp này, sau khi chuyển đổi giá trị sang number, number được chuẩn hóa về độ rộng đã cho bằng cách trước tiên [cắt bớt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc) phần phân số rồi lấy các bit thấp nhất trong mã hóa bù hai của số nguyên.

```js
new Int32Array([1.1, 1.9, -1.1, -1.9]); // Int32Array(4) [ 1, 1, -1, -1 ]

new Int8Array([257, -257]); // Int8Array(2) [ 1, -1 ]
// 257 = 0001 0000 0001
//     =      0000 0001 (mod 2^8)
//     = 1
// -257 = 1110 1111 1111
//      =      1111 1111 (mod 2^8)
//      = -1 (as signed integer)

new Uint8Array([257, -257]); // Uint8Array(2) [ 1, 255 ]
// -257 = 1110 1111 1111
//      =      1111 1111 (mod 2^8)
//      = 255 (as unsigned integer)
```

## Constructor

- {{jsxref("Number/Number", "Number()")}}
  - : Tạo các `Number` object. Khi được gọi như một hàm, nó trả về giá trị primitive kiểu Number.

## Thuộc tính tĩnh

- {{jsxref("Number.EPSILON")}}
  - : Khoảng cách nhỏ nhất giữa hai số có thể biểu diễn.
- {{jsxref("Number.MAX_SAFE_INTEGER")}}
  - : Số nguyên an toàn tối đa trong JavaScript (2<sup>53</sup> - 1).
- {{jsxref("Number.MAX_VALUE")}}
  - : Số dương lớn nhất có thể biểu diễn.
- {{jsxref("Number.MIN_SAFE_INTEGER")}}
  - : Số nguyên an toàn nhỏ nhất trong JavaScript (-(2<sup>53</sup> - 1)).
- {{jsxref("Number.MIN_VALUE")}}
  - : Số dương nhỏ nhất có thể biểu diễn—tức là số dương gần nhất với không (mà không thực sự là không).
- {{jsxref("Number.NaN")}}
  - : Giá trị đặc biệt "**N**ot **a** **N**umber" (không phải số).
- {{jsxref("Number.NEGATIVE_INFINITY")}}
  - : Giá trị đặc biệt biểu diễn âm vô cực. Được trả về khi tràn số.
- {{jsxref("Number.POSITIVE_INFINITY")}}
  - : Giá trị đặc biệt biểu diễn vô cực. Được trả về khi tràn số.

## Phương thức tĩnh

- {{jsxref("Number.isFinite()")}}
  - : Xác định xem giá trị được truyền vào có phải là số hữu hạn không.
- {{jsxref("Number.isInteger()")}}
  - : Xác định xem giá trị được truyền vào có phải là số nguyên không.
- {{jsxref("Number.isNaN()")}}
  - : Xác định xem giá trị được truyền vào có phải là `NaN` không.
- {{jsxref("Number.isSafeInteger()")}}
  - : Xác định xem giá trị được truyền vào có phải là số nguyên an toàn (số nằm trong khoảng -(2<sup>53</sup> - 1) đến 2<sup>53</sup> - 1) không.
- {{jsxref("Number.parseFloat()")}}
  - : Giống với hàm toàn cục {{jsxref("parseFloat()")}}.
- {{jsxref("Number.parseInt()")}}
  - : Giống với hàm toàn cục {{jsxref("parseInt()")}}.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Number.prototype` và được chia sẻ bởi tất cả các instance của `Number`.

- {{jsxref("Object/constructor", "Number.prototype.constructor")}}
  - : Hàm constructor đã tạo ra instance object. Đối với các instance `Number`, giá trị ban đầu là constructor {{jsxref("Number/Number", "Number")}}.

## Phương thức instance

- {{jsxref("Number.prototype.toExponential()")}}
  - : Trả về một string biểu diễn số theo ký hiệu số mũ.
- {{jsxref("Number.prototype.toFixed()")}}
  - : Trả về một string biểu diễn số theo ký hiệu dấu phẩy cố định.
- {{jsxref("Number.prototype.toLocaleString()")}}
  - : Trả về một string với biểu diễn nhạy cảm với ngôn ngữ của số này. Ghi đè phương thức {{jsxref("Object.prototype.toLocaleString()")}}.
- {{jsxref("Number.prototype.toPrecision()")}}
  - : Trả về một string biểu diễn số theo độ chính xác được chỉ định theo ký hiệu dấu phẩy cố định hoặc số mũ.
- {{jsxref("Number.prototype.toString()")}}
  - : Trả về một string biểu diễn object được chỉ định theo _radix_ ("cơ số") được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("Number.prototype.valueOf()")}}
  - : Trả về giá trị primitive của object được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.valueOf()")}}.

## Ví dụ

### Sử dụng object Number để gán giá trị cho các biến số

Ví dụ sau sử dụng các thuộc tính của object `Number` để gán giá trị cho một số biến số:

```js
const biggestNum = Number.MAX_VALUE;
const smallestNum = Number.MIN_VALUE;
const infiniteNum = Number.POSITIVE_INFINITY;
const negInfiniteNum = Number.NEGATIVE_INFINITY;
const notANum = Number.NaN;
```

### Phạm vi số nguyên cho Number

Ví dụ sau cho thấy giá trị số nguyên tối thiểu và tối đa có thể biểu diễn dưới dạng object `Number`.

```js
const biggestInt = Number.MAX_SAFE_INTEGER; // (2**53 - 1) => 9007199254740991
const smallestInt = Number.MIN_SAFE_INTEGER; // -(2**53 - 1) => -9007199254740991
```

Khi phân tích dữ liệu đã được tuần tự hóa sang JSON, các giá trị số nguyên nằm ngoài phạm vi này có thể bị hỏng khi JSON parser ép kiểu chúng sang kiểu `Number`.

Một cách giải quyết khả dĩ là sử dụng {{jsxref("String")}} thay thế.

Các số lớn hơn có thể được biểu diễn bằng kiểu {{jsxref("BigInt")}}.

### Sử dụng Number() để chuyển đổi đối tượng Date

Ví dụ sau chuyển đổi object {{jsxref("Date")}} sang giá trị số bằng cách dùng `Number` như một hàm:

```js
const d = new Date("1995-12-17T03:24:00");
console.log(Number(d));
```

Kết quả in ra `819199440000`.

### Chuyển đổi chuỗi số và null sang number

```js
Number("123"); // 123
Number("123") === 123; // true
Number("12.3"); // 12.3
Number("12.00"); // 12
Number("123e-1"); // 12.3
Number(""); // 0
Number(null); // 0
Number("0x11"); // 17
Number("0b11"); // 3
Number("0o11"); // 9
Number("foo"); // NaN
Number("100a"); // NaN
Number("-Infinity"); // -Infinity
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của hành vi `Number` hiện đại (có hỗ trợ binary và octal literal) trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- {{jsxref("NaN")}}
- [Toán tử số học](/en-US/docs/Web/JavaScript/Reference/Operators#arithmetic_operators)
- {{jsxref("Math")}}
- {{jsxref("BigInt")}}
