---
title: parseInt()
slug: Web/JavaScript/Reference/Global_Objects/parseInt
page-type: javascript-function
browser-compat: javascript.builtins.parseInt
sidebar: jssidebar
---

Hàm **`parseInt()`** phân tích cú pháp đối số chuỗi và trả về một số nguyên theo [cơ số](https://en.wikipedia.org/wiki/Radix) được chỉ định (cơ sở trong các hệ thống số học toán học).

{{InteractiveExample("JavaScript Demo: parseInt()")}}

```js interactive-example
console.log(parseInt("123"));
// 123 (default base-10)
console.log(parseInt("123", 10));
// 123 (explicitly specify base-10)
console.log(parseInt("   123 "));
// 123 (whitespace is ignored)
console.log(parseInt("077"));
// 77 (leading zeros are ignored)
console.log(parseInt("1.9"));
// 1 (decimal part is truncated)
console.log(parseInt("ff", 16));
// 255 (lower-case hexadecimal)
console.log(parseInt("0xFF", 16));
// 255 (upper-case hexadecimal with "0x" prefix)
console.log(parseInt("xyz"));
// NaN (input can't be converted to an integer)
```

## Cú pháp

```js-nolint
parseInt(string)
parseInt(string, radix)
```

### Tham số

- `string`
  - : Chuỗi bắt đầu bằng một số nguyên. Khoảng trắng đầu {{Glossary("whitespace")}} trong đối số này bị bỏ qua.
- `radix` {{optional_inline}}
  - : Số nguyên từ `2` đến `36` đại diện cho _cơ số_ (cơ sở trong hệ thống số học toán học) của `string`. Nó được chuyển đổi thành [số nguyên 32-bit](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#fixed-width_number_conversion); nếu nó khác không và nằm ngoài phạm vi \[2, 36] sau khi chuyển đổi, hàm sẽ luôn trả về `NaN`. Nếu là `0` hoặc không được cung cấp, cơ số sẽ được suy ra dựa trên giá trị của `string`. Hãy cẩn thận — điều này _không_ luôn mặc định là `10`! [Mô tả bên dưới](#mô_tả) giải thích chi tiết hơn những gì xảy ra khi `radix` không được cung cấp.

### Giá trị trả về

Số nguyên được phân tích từ `string` đã cho, hoặc {{jsxref("NaN")}} khi

- `radix` như số nguyên 32-bit nhỏ hơn `2` hoặc lớn hơn `36`, hoặc
- ký tự đầu tiên không phải khoảng trắng không thể chuyển đổi thành số.

> [!NOTE]
> JavaScript không có sự phân biệt giữa "số dấu phẩy động" và "số nguyên" ở cấp độ ngôn ngữ. `parseInt()` và [`parseFloat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseFloat) chỉ khác nhau ở hành vi phân tích cú pháp, không nhất thiết ở giá trị trả về. Ví dụ, `parseInt("42")` và `parseFloat("42")` sẽ trả về cùng giá trị: {{jsxref("Number")}} 42.

## Mô tả

Hàm `parseInt` [chuyển đổi đối số đầu tiên của nó thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), phân tích cú pháp chuỗi đó, sau đó trả về số nguyên hoặc `NaN`.

Nếu không phải `NaN`, giá trị trả về sẽ là số nguyên là đối số đầu tiên được lấy như một số trong `radix` được chỉ định. (Ví dụ, `radix` là `10` chuyển đổi từ số thập phân, `8` chuyển đổi từ bát phân, `16` từ thập lục phân, v.v.)

Đối số `radix` được [chuyển đổi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Nếu không được cung cấp, hoặc nếu giá trị trở thành 0, `NaN` hoặc `Infinity` (`undefined` bị ép kiểu thành `NaN`), JavaScript giả định như sau:

1. Nếu `string` đầu vào, sau khi loại bỏ khoảng trắng đầu và các dấu `+`/`-` có thể có, bắt đầu bằng `0x` hoặc `0X` (một số không, theo sau là chữ X thường hoặc hoa), `radix` được giả định là `16` và phần còn lại của chuỗi được phân tích cú pháp như số thập lục phân.
2. Nếu `string` đầu vào bắt đầu bằng bất kỳ giá trị nào khác, cơ số là `10` (thập phân).

> [!NOTE]
> Các tiền tố khác như `0b`, hợp lệ trong [literal số](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#binary), được `parseInt()` xử lý như các chữ số thông thường. `parseInt()` cũng _không_ coi các chuỗi bắt đầu bằng ký tự `0` là giá trị bát phân. Tiền tố duy nhất mà `parseInt()` nhận ra là `0x` hoặc `0X` cho các giá trị thập lục phân — tất cả các thứ khác được phân tích cú pháp như giá trị thập phân nếu `radix` không có. [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number) hoặc [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) có thể được dùng thay thế để phân tích các tiền tố này.

Nếu cơ số là `16`, `parseInt()` cho phép chuỗi được tùy chọn tiền tố bởi `0x` hoặc `0X` sau ký tự dấu tùy chọn (`+`/`-`).

Nếu giá trị cơ số (được ép kiểu nếu cần) không nằm trong phạm vi \[2, 36] (bao gồm), `parseInt` trả về `NaN`.

Đối với cơ số trên `10`, các chữ cái trong bảng chữ cái tiếng Anh chỉ thị các chữ số lớn hơn `9`. Ví dụ, đối với số thập lục phân (cơ số `16`), `A` đến `F` được dùng. Các chữ cái không phân biệt chữ hoa chữ thường.

`parseInt` nhận biết chính xác hai dấu: `+` cho dương, và `-` cho âm. Điều này được thực hiện như bước đầu tiên trong quá trình phân tích sau khi khoảng trắng được loại bỏ. Nếu không tìm thấy dấu nào, thuật toán chuyển sang bước tiếp theo; nếu không, nó loại bỏ dấu và chạy việc phân tích số trên phần còn lại của chuỗi.

Nếu `parseInt` gặp ký tự trong chuỗi đầu vào không phải là chữ số hợp lệ trong `radix` được chỉ định, nó bỏ qua ký tự đó và tất cả các ký tự tiếp theo và trả về giá trị số nguyên được phân tích đến điểm đó. Ví dụ, `parseInt("2", 2)` trả về `NaN` vì `2` không phải là chữ số hợp lệ trong hệ nhị phân. Tương tự, mặc dù `1e3` về mặt kỹ thuật mã hóa một số nguyên (và sẽ được phân tích cú pháp chính xác thành số nguyên `1000` bởi [`parseFloat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseFloat)), `parseInt("1e3", 10)` trả về `1`, vì `e` không phải là chữ số hợp lệ trong cơ số 10. Vì `.` cũng không phải là chữ số, giá trị trả về sẽ luôn là số nguyên.

Nếu ký tự đầu tiên không thể chuyển đổi thành số với cơ số đang dùng, `parseInt` trả về `NaN`. Khoảng trắng đầu được phép.

Với mục đích số học, giá trị `NaN` không phải là số trong bất kỳ cơ số nào. Bạn có thể gọi hàm [`Number.isNaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isNaN) để xác định xem kết quả của `parseInt` có phải `NaN` không. Nếu `NaN` được truyền vào các phép toán số học, kết quả phép toán cũng sẽ là `NaN`.

Vì các số lớn dùng ký tự `e` trong biểu diễn chuỗi của chúng (ví dụ: `6.022e23` cho 6,022 × 10<sup>23</sup>), việc dùng `parseInt` để cắt ngắn số sẽ tạo ra kết quả không mong muốn khi dùng với các số rất lớn hoặc rất nhỏ. `parseInt` không nên được dùng như thay thế cho {{jsxref("Math.trunc()")}}.

Để chuyển đổi số thành literal chuỗi của nó theo cơ số cụ thể, hãy dùng [`thatNumber.toString(radix)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString).

Vì `parseInt()` trả về một số, nó có thể bị mất độ chính xác nếu số nguyên được biểu diễn bởi chuỗi [nằm ngoài phạm vi an toàn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isSafeInteger). Hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) hỗ trợ phân tích cú pháp chính xác các số nguyên có độ dài tùy ý, bằng cách trả về {{jsxref("BigInt")}}.

## Ví dụ

### Dùng parseInt()

Tất cả các ví dụ sau đều trả về `15`:

```js
parseInt("0xF", 16);
parseInt("F", 16);
parseInt("17", 8);
parseInt("015", 10);
parseInt("15,123", 10);
parseInt("FXX123", 16);
parseInt("1111", 2);
parseInt("15 * 3", 10);
parseInt("15e2", 10);
parseInt("15px", 10);
parseInt("12", 13);
```

Tất cả các ví dụ sau đều trả về `NaN`:

```js
parseInt("Hello", 8); // Not a number at all
parseInt("546", 2); // Digits other than 0 or 1 are invalid for binary radix
```

Tất cả các ví dụ sau đều trả về `-15`:

```js
parseInt("-F", 16);
parseInt("-0F", 16);
parseInt("-0XF", 16);
parseInt("-17", 8);
parseInt("-15", 10);
parseInt("-1111", 2);
parseInt("-15e1", 10);
parseInt("-12", 13);
```

Ví dụ sau trả về `224`:

```js
parseInt("0e0", 16);
```

`parseInt()` không xử lý các giá trị {{jsxref("BigInt")}}. Nó dừng lại ở ký tự `n`, và coi chuỗi đứng trước là số nguyên bình thường, có thể mất độ chính xác.

```js example-bad
parseInt("900719925474099267n");
// 900719925474099300
```

Bạn nên truyền chuỗi vào hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) thay thế, không có ký tự `n` ở cuối.

```js example-good
BigInt("900719925474099267");
// 900719925474099267n
```

`parseInt` không hoạt động với [dấu phân cách số](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_separators):

```js example-bad
parseInt("123_456"); // 123
```

### Dùng parseInt() trên chuỗi không phải chuỗi

`parseInt()` có thể cho kết quả thú vị khi làm việc với các giá trị không phải chuỗi kết hợp với cơ số cao; ví dụ, `36` (khiến tất cả các ký tự chữ-số trở thành chữ số hợp lệ).

```js
parseInt(null, 36); // 1112745: The string "null" is 1112745 in base 36
parseInt(undefined, 36); // 86464843759093: The string "undefined" is 86464843759093 in base 36
```

Nói chung, không nên dùng `parseInt()` trên các giá trị không phải chuỗi, đặc biệt không dùng nó như thay thế cho {{jsxref("Math.trunc()")}}. Nó có thể hoạt động với các số nhỏ:

```js
parseInt(15.99, 10); // 15
parseInt(-15.1, 10); // -15
```

Tuy nhiên, điều đó chỉ xảy ra vì biểu diễn chuỗi của các số này dùng ký pháp phân số cơ bản (`"15.99"`, `"-15.1"`), nơi `parseInt()` dừng lại ở dấu chấm thập phân. Các số lớn hơn hoặc bằng 1e+21 hoặc nhỏ hơn hoặc bằng 1e-7 dùng ký pháp số mũ (`"1.5e+22"`, `"1.51e-8"`) trong biểu diễn chuỗi, và `parseInt()` sẽ dừng lại ở ký tự `e` hoặc dấu chấm thập phân, luôn đứng sau chữ số đầu tiên. Điều này có nghĩa với các số lớn và nhỏ, `parseInt()` sẽ trả về số nguyên một chữ số:

```js example-bad
parseInt(4.7 * 1e22, 10); // Very large number becomes 4
parseInt(0.00000000000434, 10); // Very small number becomes 4

parseInt(0.0000001, 10); // 1
parseInt(0.000000123, 10); // 1
parseInt(1e-7, 10); // 1
parseInt(1000000000000000000000, 10); // 1
parseInt(123000000000000000000000, 10); // 1
parseInt(1e21, 10); // 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("parseFloat()")}}
- [Constructor `Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number)
- {{jsxref("Number.parseFloat()")}}
- {{jsxref("Number.parseInt()")}}
- {{jsxref("isNaN()")}}
- {{jsxref("Number.prototype.toString()")}}
- {{jsxref("Object.prototype.valueOf()")}}
- [Constructor `BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt)
