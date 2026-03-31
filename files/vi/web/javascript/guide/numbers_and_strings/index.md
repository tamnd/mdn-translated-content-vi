---
title: Numbers and strings
slug: Web/JavaScript/Guide/Numbers_and_strings
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Expressions_and_operators", "Web/JavaScript/Guide/Representing_dates_times")}}

Chương này giới thiệu hai kiểu dữ liệu cơ bản nhất trong JavaScript: số và chuỗi. Chúng ta sẽ giới thiệu các biểu diễn nền tảng của chúng, và các hàm được sử dụng để làm việc và thực hiện các phép tính trên chúng.

## Số

Trong JavaScript, các số được triển khai theo [định dạng nhị phân 64-bit độ chính xác kép IEEE 754](https://en.wikipedia.org/wiki/Double-precision_floating-point_format) (tức là một số trong khoảng ±2^−1022 đến ±2^+1023, hay khoảng ±10^−308 đến ±10^+308, với độ chính xác số là 53 bit). Các giá trị số nguyên lên đến ±2^53 − 1 có thể được biểu diễn chính xác.

Ngoài khả năng biểu diễn các số dấu phảy động, kiểu số có ba giá trị ký hiệu: {{jsxref("Infinity")}}, `-Infinity`, và {{jsxref("NaN")}} (not-a-number - không phải số).

Xem thêm [các kiểu dữ liệu và cấu trúc JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures) để có ngữ cảnh với các kiểu nguyên thủy khác trong JavaScript.

Bạn có thể sử dụng bốn loại số literal: thập phân, nhị phân, bát phân, và thập lục phân.

### Số thập phân

```js-nolint
1234567890
42
```

Các literal thập phân có thể bắt đầu bằng số không (`0`) theo sau là chữ số thập phân khác, nhưng nếu tất cả các chữ số sau `0` đứng đầu đều nhỏ hơn 8, số sẽ được diễn giải là số bát phân. Đây được coi là cú pháp kế thừa, và các số literal có tiền tố `0`, dù được diễn giải là bát phân hay thập phân, sẽ gây ra lỗi cú pháp trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#legacy_octal_literals) — vì vậy hãy sử dụng tiền tố `0o` thay thế.

```js-nolint example-bad
0888 // 888 parsed as decimal
0777 // parsed as octal, 511 in decimal
```

### Số nhị phân

Cú pháp số nhị phân sử dụng số không đứng đầu theo sau là chữ cái Latin chữ thường hoặc chữ hoa "B" (`0b` hoặc `0B`). Nếu các chữ số sau `0b` không phải là 0 hoặc 1, lỗi {{jsxref("SyntaxError")}} sau sẽ được ném ra: "Missing binary digits after 0b".

```js-nolint
0b10000000000000000000000000000000 // 2147483648
0b01111111100000000000000000000000 // 2139095040
0B00000000011111111111111111111111 // 8388607
```

### Số bát phân

Cú pháp chuẩn cho số bát phân là thêm tiền tố `0o` cho chúng. Ví dụ:

```js-nolint
0O755 // 493
0o644 // 420
```

Ngoài ra còn có cú pháp kế thừa cho số bát phân — bằng cách thêm tiền tố số không vào số bát phân: `0644 === 420` và `"\045" === "%"`. Nếu các chữ số sau `0` nằm ngoài phạm vi 0 đến 7, số sẽ được diễn giải là số thập phân.

```js
const n = 0755; // 493
const m = 0644; // 420
```

[Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) cấm cú pháp bát phân này.

### Số thập lục phân

Cú pháp số thập lục phân sử dụng số không đứng đầu theo sau là chữ cái Latin chữ thường hoặc chữ hoa "X" (`0x` hoặc `0X`). Nếu các chữ số sau 0x nằm ngoài phạm vi (0123456789ABCDEF), lỗi {{jsxref("SyntaxError")}} sau sẽ được ném ra: "Identifier starts immediately after numeric literal".

```js-nolint
0xFFFFFFFFFFFFF // 4503599627370495
0xabcdef123456  // 188900967593046
0XA             // 10
```

### Lũy thừa

```js-nolint
0e-5   // 0
0e+5   // 0
5e1    // 50
175e-2 // 1.75
1e3    // 1000
1e-3   // 0.001
1E3    // 1000
```

### Dấu phân cách số

Đối với tất cả các cú pháp literal được hiển thị ở trên, dấu gạch dưới (`_`) có thể được chèn vào giữa các chữ số để cải thiện khả năng đọc.

```js-nolint
1_000_000_000_000
1_050.95
0b1010_0001_1000_0101
0o2_2_5_6
0xA0_B0_C0
1_000_000_000_000_000_000_000n
```

Xem tài liệu tham khảo [lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#numeric_literals) để biết thêm chi tiết về số literal.

## Object Number

Object {{jsxref("Number")}} được tích hợp sẵn có các thuộc tính cho các hằng số số, chẳng hạn như giá trị tối đa, not-a-number, và vô cực. Bạn không thể thay đổi giá trị của các thuộc tính này và bạn sử dụng chúng như sau:

```js
const biggestNum = Number.MAX_VALUE;
const smallestNum = Number.MIN_VALUE;
const infiniteNum = Number.POSITIVE_INFINITY;
const negInfiniteNum = Number.NEGATIVE_INFINITY;
const notANum = Number.NaN;
```

Bạn luôn tham chiếu đến thuộc tính của object `Number` được xây dựng sẵn như được hiển thị ở trên, và không phải là thuộc tính của object `Number` mà bạn tự tạo.

Bảng sau tóm tắt các thuộc tính của object `Number`.

| Thuộc tính                             | Mô tả                                                                                                                                |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| {{jsxref("Number.MAX_VALUE")}}         | Số dương lớn nhất có thể biểu diễn (`1.7976931348623157e+308`)                                                                       |
| {{jsxref("Number.MIN_VALUE")}}         | Số dương nhỏ nhất có thể biểu diễn (`5e-324`)                                                                                        |
| {{jsxref("Number.NaN")}}               | Giá trị "not a number" đặc biệt                                                                                                      |
| {{jsxref("Number.NEGATIVE_INFINITY")}} | Giá trị âm vô cực đặc biệt; được trả về khi tràn số                                                                                  |
| {{jsxref("Number.POSITIVE_INFINITY")}} | Giá trị dương vô cực đặc biệt; được trả về khi tràn số                                                                               |
| {{jsxref("Number.EPSILON")}}           | Sự khác biệt giữa `1` và giá trị nhỏ nhất lớn hơn `1` có thể được biểu diễn dưới dạng {{jsxref("Number")}} (`2.220446049250313e-16`) |
| {{jsxref("Number.MIN_SAFE_INTEGER")}}  | Số nguyên an toàn tối thiểu trong JavaScript (−2^53 + 1, hay `−9007199254740991`)                                                    |
| {{jsxref("Number.MAX_SAFE_INTEGER")}}  | Số nguyên an toàn tối đa trong JavaScript (+2^53 − 1, hay `+9007199254740991`)                                                       |

| Phương thức                          | Mô tả                                                                                                                                      |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| {{jsxref("Number.parseFloat()")}}    | Phân tích đối số chuỗi và trả về số dấu phảy động. Giống như hàm toàn cục {{jsxref("parseFloat()")}}.                                      |
| {{jsxref("Number.parseInt()")}}      | Phân tích đối số chuỗi và trả về số nguyên của cơ số hoặc hệ cơ được chỉ định. Giống như hàm toàn cục {{jsxref("parseInt()")}}.            |
| {{jsxref("Number.isFinite()")}}      | Xác định xem giá trị được truyền vào có phải là số hữu hạn hay không.                                                                      |
| {{jsxref("Number.isInteger()")}}     | Xác định xem giá trị được truyền vào có phải là số nguyên hay không.                                                                       |
| {{jsxref("Number.isNaN()")}}         | Xác định xem giá trị được truyền vào có phải là {{jsxref("NaN")}} hay không. Phiên bản mạnh mẽ hơn của hàm toàn cục {{jsxref("isNaN()")}}. |
| {{jsxref("Number.isSafeInteger()")}} | Xác định xem giá trị được cung cấp có phải là số là _số nguyên an toàn_ hay không.                                                         |

Prototype `Number` cung cấp các phương thức để truy xuất thông tin từ các object `Number` ở nhiều định dạng khác nhau. Bảng sau tóm tắt các phương thức của `Number.prototype`.

| Phương thức                                           | Mô tả                                                                                       |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| {{jsxref("Number/toExponential", "toExponential()")}} | Trả về chuỗi biểu diễn số theo ký hiệu số mũ.                                               |
| {{jsxref("Number/toFixed", "toFixed()")}}             | Trả về chuỗi biểu diễn số theo ký hiệu số thập phân cố định.                                |
| {{jsxref("Number/toPrecision", "toPrecision()")}}     | Trả về chuỗi biểu diễn số với độ chính xác được chỉ định theo ký hiệu số thập phân cố định. |

## Object Math

Object {{jsxref("Math")}} được tích hợp sẵn có các thuộc tính và phương thức cho các hằng số và hàm toán học. Ví dụ, thuộc tính `PI` của object `Math` có giá trị pi (3,141…), mà bạn sẽ sử dụng trong ứng dụng như

```js
Math.PI;
```

Tương tự, các hàm toán học chuẩn là các phương thức của `Math`. Chúng bao gồm các hàm lượng giác, logarithm, hàm mũ, và các hàm khác. Ví dụ, nếu bạn muốn sử dụng hàm lượng giác sin, bạn sẽ viết

```js
Math.sin(1.56);
```

Lưu ý rằng tất cả các phương thức lượng giác của `Math` nhận đối số theo radian.

Bảng sau tóm tắt các phương thức của object `Math`.

<table class="standard-table">
  <caption>
    Methods of
    <code>Math</code>
  </caption>
  <thead>
    <tr>
      <th scope="col">Method</th>
      <th scope="col">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{jsxref("Math.abs", "abs()")}}</td>
      <td>Absolute value</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.sin", "sin()")}},
        {{jsxref("Math.cos", "cos()")}},
        {{jsxref("Math.tan", "tan()")}}
      </td>
      <td>Standard trigonometric functions; with the argument in radians.</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.asin", "asin()")}},
        {{jsxref("Math.acos", "acos()")}},
        {{jsxref("Math.atan", "atan()")}},
        {{jsxref("Math.atan2", "atan2()")}}
      </td>
      <td>Inverse trigonometric functions; return values in radians.</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.sinh", "sinh()")}},
        {{jsxref("Math.cosh", "cosh()")}},
        {{jsxref("Math.tanh", "tanh()")}}
      </td>
      <td>Hyperbolic functions; argument in hyperbolic angle.</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.asinh", "asinh()")}},
        {{jsxref("Math.acosh", "acosh()")}},
        {{jsxref("Math.atanh", "atanh()")}}
      </td>
      <td>Inverse hyperbolic functions; return values in hyperbolic angle.</td>
    </tr>
    <tr>
      <td>
        <p>
          {{jsxref("Math.pow", "pow()")}},
          {{jsxref("Math.exp", "exp()")}},
          {{jsxref("Math.expm1", "expm1()")}},
          {{jsxref("Math.log", "log()")}},
          {{jsxref("Math.log10", "log10()")}},
          {{jsxref("Math.log1p", "log1p()")}},
          {{jsxref("Math.log2", "log2()")}}
        </p>
      </td>
      <td>Exponential and logarithmic functions.</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.floor", "floor()")}},
        {{jsxref("Math.ceil", "ceil()")}}
      </td>
      <td>
        Returns the largest/smallest integer less/greater than or equal to an
        argument.
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.min", "min()")}},
        {{jsxref("Math.max", "max()")}}
      </td>
      <td>
        Returns the minimum or maximum (respectively) value of a comma separated
        list of numbers as arguments.
      </td>
    </tr>
    <tr>
      <td>{{jsxref("Math.random", "random()")}}</td>
      <td>Returns a random number between 0 and 1.</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.round", "round()")}},
        {{jsxref("Math.fround", "fround()")}},
        {{jsxref("Math.trunc", "trunc()")}},
      </td>
      <td>Rounding and truncation functions.</td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.sqrt", "sqrt()")}},
        {{jsxref("Math.cbrt", "cbrt()")}},
        {{jsxref("Math.hypot", "hypot()")}}
      </td>
      <td>
        Square root, cube root, Square root of the sum of square arguments.
      </td>
    </tr>
    <tr>
      <td>{{jsxref("Math.sign", "sign()")}}</td>
      <td>
        The sign of a number, indicating whether the number is positive,
        negative or zero.
      </td>
    </tr>
    <tr>
      <td>
        {{jsxref("Math.clz32", "clz32()")}},<br />{{jsxref("Math.imul", "imul()")}}
      </td>
      <td>
        Number of leading zero bits in the 32-bit binary representation.<br />The
        result of the C-like 32-bit multiplication of the two arguments.
      </td>
    </tr>
  </tbody>
</table>

Không giống như nhiều object khác, bạn không bao giờ tạo object `Math` của riêng mình. Bạn luôn sử dụng object `Math` được tích hợp sẵn.

## BigInt

Một hạn chế của giá trị số là chúng chỉ có 64 bit. Trên thực tế, do sử dụng mã hóa IEEE 754, chúng không thể biểu diễn bất kỳ số nguyên nào lớn hơn [`Number.MAX_SAFE_INTEGER`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER) (là 2<sup>53</sup> - 1) một cách chính xác. Để giải quyết nhu cầu mã hóa dữ liệu nhị phân và để tương tác với các ngôn ngữ khác cung cấp số nguyên rộng như `i64` (số nguyên 64 bit) và `i128` (số nguyên 128 bit), JavaScript cũng cung cấp một kiểu dữ liệu khác để biểu diễn _số nguyên tùy ý lớn_: [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt).

Một BigInt có thể được định nghĩa như một số nguyên literal được thêm hậu tố `n`:

```js
const b1 = 123n;
// Can be arbitrarily large.
const b2 = -1234567890987654321n;
```

BigInt cũng có thể được tạo từ giá trị số hoặc giá trị chuỗi bằng cách sử dụng constructor [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt).

```js
const b1 = BigInt(123);
// Using a string prevents loss of precision, since long number
// literals don't represent what they seem like.
const b2 = BigInt("-1234567890987654321");
```

Về mặt khái niệm, BigInt chỉ là một chuỗi bit tùy ý dài mã hóa một số nguyên. Bạn có thể thực hiện an toàn bất kỳ phép toán nào mà không mất độ chính xác hoặc tràn/thiếu số.

```js
const integer = 12 ** 34; // 4.9222352429520264e+36; only has limited precision
const bigint = 12n ** 34n; // 4922235242952026704037113243122008064n
```

So với số, giá trị BigInt mang lại độ chính xác cao hơn khi biểu diễn các _số nguyên_ lớn; tuy nhiên, chúng không thể biểu diễn _số dấu phảy động_. Ví dụ, phép chia sẽ làm tròn về không:

```js
const bigintDiv = 5n / 2n; // 2n, because there's no 2.5 in BigInt
```

Các hàm `Math` không thể được sử dụng trên giá trị BigInt; chúng chỉ hoạt động với số.

Việc chọn giữa BigInt và số phụ thuộc vào trường hợp sử dụng và phạm vi đầu vào của bạn. Độ chính xác của số thường đủ để phục vụ hầu hết các tác vụ hàng ngày, và BigInt phù hợp nhất để xử lý dữ liệu nhị phân.

Đọc thêm về những gì bạn có thể làm với giá trị BigInt trong phần [Biểu thức và Toán tử](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bigint_operators), hoặc [tài liệu tham khảo BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt).

## Chuỗi

Kiểu [String](/en-US/docs/Glossary/String) của JavaScript được sử dụng để biểu diễn dữ liệu văn bản. Đây là một tập hợp các "phần tử" của các giá trị số nguyên không dấu 16 bit (đơn vị mã UTF-16). Mỗi phần tử trong Chuỗi chiếm một vị trí trong Chuỗi. Phần tử đầu tiên ở chỉ mục 0, phần tử tiếp theo ở chỉ mục 1, v.v. Độ dài của Chuỗi là số phần tử trong đó. Bạn có thể tạo chuỗi bằng cách sử dụng chuỗi literal hoặc object chuỗi.

### Chuỗi literal

Bạn có thể khai báo chuỗi trong code nguồn bằng cách sử dụng dấu nháy đơn hoặc dấu nháy kép:

```js-nolint
'foo'
"bar"
```

Trong một chuỗi literal, hầu hết các ký tự có thể được nhập trực tiếp. Các ngoại lệ duy nhất là dấu gạch chéo ngược (`\`, bắt đầu một chuỗi thoát), ký tự dấu nháy được sử dụng để bao quanh chuỗi, kết thúc chuỗi, và ký tự dòng mới, là lỗi cú pháp nếu không có dấu gạch chéo ngược trước đó.

Có thể tạo các chuỗi nâng cao hơn bằng cách sử dụng chuỗi thoát:

#### Chuỗi thoát thập lục phân

Số sau \x được diễn giải như một số [thập lục phân](https://en.wikipedia.org/wiki/Hexadecimal).

```js-nolint
"\xA9" // "©"
```

#### Chuỗi thoát Unicode

Các chuỗi thoát Unicode yêu cầu ít nhất bốn chữ số thập lục phân theo sau `\u`.

```js-nolint
"\u00A9" // "©"
```

#### Chuỗi thoát điểm mã Unicode

Với các chuỗi thoát điểm mã Unicode, bất kỳ ký tự nào đều có thể được thoát bằng số thập lục phân để có thể sử dụng các điểm mã Unicode lên đến `0x10FFFF`. Với các chuỗi thoát Unicode bốn chữ số, thường cần phải viết các nửa thay thế riêng biệt để đạt được kết quả tương tự.

Xem thêm {{jsxref("String.fromCodePoint()")}} hoặc {{jsxref("String.prototype.codePointAt()")}}.

```js-nolint
"\u{2F804}"

// the same with simple Unicode escapes
"\uD87E\uDC04"
```

## Object String

Bạn có thể gọi các phương thức trực tiếp trên một giá trị chuỗi:

```js
console.log("hello".toUpperCase()); // HELLO
```

Các phương thức sau có sẵn trên các giá trị {{jsxref("String")}}:

- Query (truy vấn): lấy ký tự hoặc mã ký tự tại một chỉ mục chuỗi cụ thể. Các phương thức bao gồm {{jsxref("String/at", "at()")}}, {{jsxref("String/charAt", "charAt()")}}, {{jsxref("String/charCodeAt", "charCodeAt()")}}, và {{jsxref("String/codePointAt", "codePointAt()")}}.
- Search (tìm kiếm): lấy thông tin về chuỗi con phù hợp với một mẫu, hoặc kiểm tra xem một chuỗi con cụ thể có tồn tại hay không. Các phương thức bao gồm {{jsxref("String/indexOf", "indexOf()")}}, {{jsxref("String/lastIndexOf", "lastIndexOf()")}}, {{jsxref("String/startsWith", "startsWith()")}}, {{jsxref("String/endsWith", "endsWith()")}}, {{jsxref("String/includes", "includes()")}}, {{jsxref("String/match", "match()")}}, {{jsxref("String/matchAll", "matchAll()")}}, và {{jsxref("String/search", "search()")}}
- Composition (ghép nối): kết hợp các chuỗi thành chuỗi dài hơn. Các phương thức bao gồm {{jsxref("String/padStart", "padStart()")}}, {{jsxref("String/padEnd", "padEnd()")}}, {{jsxref("String/concat", "concat()")}}, và {{jsxref("String/repeat", "repeat()")}}.
- Decomposition (phân tách): chia chuỗi thành các chuỗi nhỏ hơn. Các phương thức bao gồm {{jsxref("String/split", "split()")}}, {{jsxref("String/slice", "slice()")}}, {{jsxref("String/substring", "substring()")}}, {{jsxref("String/substr", "substr()")}}, {{jsxref("String/trim", "trim()")}}, {{jsxref("String/trimStart", "trimStart()")}}, và {{jsxref("String/trimEnd", "trimEnd()")}}.
- Transformation (biến đổi): trả về một chuỗi mới dựa trên nội dung của chuỗi hiện tại. Các phương thức bao gồm {{jsxref("String/toLowerCase", "toLowerCase()")}}, {{jsxref("String/toUpperCase", "toUpperCase()")}}, {{jsxref("String/toLocaleLowerCase", "toLocaleLowerCase()")}}, {{jsxref("String/toLocaleUpperCase", "toLocaleUpperCase()")}}, {{jsxref("String/normalize", "normalize()")}}, và {{jsxref("String/toWellFormed", "toWellFormed()")}}.

Khi làm việc với chuỗi, có hai object khác cung cấp chức năng quan trọng để thao tác chuỗi: {{jsxref("RegExp")}} và {{jsxref("Intl")}}. Chúng được giới thiệu trong [biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) và [quốc tế hóa](/en-US/docs/Web/JavaScript/Guide/Internationalization) tương ứng.

## Template literal

[Template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals) là các chuỗi literal cho phép các biểu thức nhúng. Bạn có thể sử dụng các chuỗi nhiều dòng và các tính năng nội suy chuỗi với chúng.

Template literal được bao quanh bởi các ký tự backtick ([dấu accent grave](https://en.wikipedia.org/wiki/Grave_accent)) (`` ` ``) thay vì dấu nháy kép hoặc đơn. Template literal có thể chứa các placeholder. Chúng được chỉ định bởi ký hiệu đô la và dấu ngoặc nhọn (`${expression}`).

### Nhiều dòng

Bất kỳ ký tự dòng mới nào được chèn vào trong code nguồn đều là một phần của template literal. Sử dụng chuỗi thông thường, bạn phải sử dụng cú pháp sau để có được các chuỗi nhiều dòng:

```js
console.log(
  "string text line 1\n\
string text line 2",
);
// "string text line 1
// string text line 2"
```

Để có được hiệu ứng tương tự với chuỗi nhiều dòng, bây giờ bạn có thể viết:

```js
console.log(`string text line 1
string text line 2`);
// "string text line 1
// string text line 2"
```

### Biểu thức nhúng

Để nhúng các biểu thức trong các chuỗi thông thường, bạn sẽ sử dụng cú pháp sau:

```js
const five = 5;
const ten = 10;
console.log(
  "Fifteen is " + (five + ten) + " and not " + (2 * five + ten) + ".",
);
// "Fifteen is 15 and not 20."
```

Bây giờ, với template literal, bạn có thể tận dụng cú pháp đường ngọt giúp các phép thay thế như thế này dễ đọc hơn:

```js
const five = 5;
const ten = 10;
console.log(`Fifteen is ${five + ten} and not ${2 * five + ten}.`);
// "Fifteen is 15 and not 20."
```

Để biết thêm thông tin, hãy đọc về [Template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals) trong [tài liệu tham khảo JavaScript](/en-US/docs/Web/JavaScript/Reference).

{{PreviousNext("Web/JavaScript/Guide/Expressions_and_operators", "Web/JavaScript/Guide/Representing_dates_times")}}
