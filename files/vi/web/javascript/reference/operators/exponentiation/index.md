---
title: Exponentiation (**)
slug: Web/JavaScript/Reference/Operators/Exponentiation
page-type: javascript-operator
browser-compat: javascript.operators.exponentiation
sidebar: jssidebar
---

Operator **lũy thừa (`**`)\*\* trả về kết quả của việc nâng toán hạng đầu tiên lên lũy thừa của toán hạng thứ hai. Nó tương đương với {{jsxref("Math.pow()")}}, ngoại trừ việc nó cũng chấp nhận [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) làm toán hạng.

{{InteractiveExample("JavaScript Demo: Exponentiation (**) operator")}}

```js interactive-example
console.log(3 ** 4);
// Expected output: 81

console.log(10 ** -2);
// Expected output: 0.01

console.log(2 ** (3 ** 2));
// Expected output: 512

console.log((2 ** 3) ** 2);
// Expected output: 64
```

## Cú pháp

```js-nolint
x ** y
```

## Mô tả

Operator `**` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc cả hai toán hạng thành các giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện lũy thừa BigInt nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó thực hiện lũy thừa số. Một {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành số.

Đối với cả số và BigInt, `0` nâng lên lũy thừa dương trả về `0`, và `0` nâng lên lũy thừa `0` trả về `1`. Đối với số, `0` nâng lên số âm trả về `Infinity`, trong khi `-0` nâng lên số âm trả về `-Infinity`.

`NaN ** 0` (và tương đương `Math.pow(NaN, 0)`) là trường hợp duy nhất mà {{jsxref("NaN")}} không lan truyền qua các phép toán — nó trả về `1` mặc dù toán hạng là `NaN`. Ngoài ra, hành vi khi `base` là 1 và `exponent` là không hữu hạn (±Infinity hoặc `NaN`) khác với IEEE 754, trong đó kết quả phải là 1, trong khi JavaScript trả về `NaN` để duy trì khả năng tương thích ngược với hành vi ban đầu.

Đối với lũy thừa BigInt, một {{jsxref("RangeError")}} được ném ra nếu số mũ `y` là âm. Điều này là do bất kỳ số mũ âm nào có khả năng dẫn đến một giá trị giữa 0 và 1 (trừ khi cơ số là `1`, `-1`, hoặc `0`), được làm tròn về 0, và có thể là lỗi của lập trình viên.

Operator lũy thừa có [tính kết hợp phải](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence): `a ** b ** c` bằng `a ** (b ** c)`.

Trong hầu hết các ngôn ngữ, chẳng hạn như PHP, Python, và các ngôn ngữ khác có operator lũy thừa (`**`), operator lũy thừa được định nghĩa có độ ưu tiên cao hơn các unary operator, chẳng hạn như `+` một ngôi và `-` một ngôi, nhưng có một vài ngoại lệ. Ví dụ, trong Bash, operator `**` được định nghĩa có độ ưu tiên thấp hơn các unary operator.

Trong JavaScript, không thể viết một biểu thức lũy thừa không rõ ràng. Tức là, bạn không thể đặt một unary operator (với [độ ưu tiên 14](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence#table), bao gồm `+`/`-`/`~`/`!`/`++`/`--`/`delete`/`void`/`typeof`/`await`) ngay trước số cơ số; [làm như vậy sẽ gây ra SyntaxError](/en-US/docs/Web/JavaScript/Reference/Errors/Unparenthesized_unary_expr_lhs_exponentiation).

Ví dụ, `-2 ** 2` là 4 trong Bash, nhưng là -4 trong các ngôn ngữ khác (chẳng hạn Python). Điều này không hợp lệ trong JavaScript, vì phép toán này là không rõ ràng. Bạn phải đặt dấu ngoặc đơn ở một trong hai phía — ví dụ, `-(2 ** 2)` — để làm rõ ý định.

Lưu ý rằng một số ngôn ngữ lập trình sử dụng ký hiệu mũ `^` cho lũy thừa, nhưng JavaScript sử dụng ký hiệu đó cho [bitwise XOR operator](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_XOR).

## Ví dụ

### Lũy thừa dùng số

```js
2 ** 3; // 8
3 ** 2; // 9
3 ** 2.5; // 15.588457268119896
10 ** -1; // 0.1
2 ** 1024; // Infinity
NaN ** 2; // NaN
NaN ** 0; // 1
1 ** Infinity; // NaN
```

Các giá trị không phải BigInt khác được ép buộc thành số:

```js
2 ** "3"; // 8
2 ** "hello"; // NaN
```

### Lũy thừa dùng BigInt

```js
2n ** 3n; // 8n
2n ** 1024n; // A very large number, but not Infinity
```

Bạn không thể trộn lẫn các toán hạng BigInt và số trong lũy thừa.

```js example-bad
2n ** 2; // TypeError: Cannot mix BigInt and other types, use explicit conversions
2 ** 2n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

Để thực hiện lũy thừa với BigInt và một giá trị không phải BigInt, hãy chuyển đổi một trong hai toán hạng:

```js
2n ** BigInt(2); // 4n
Number(2n) ** 2; // 4
```

### Tính kết hợp

```js-nolint
2 ** 3 ** 2; // 512
2 ** (3 ** 2); // 512
(2 ** 3) ** 2; // 64
```

### Dùng với unary operator

Để đảo dấu kết quả của một biểu thức lũy thừa:

```js
-(2 ** 2); // -4
```

Để bắt buộc cơ số của một biểu thức lũy thừa là số âm:

```js
(-2) ** 2; // 4
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
- [Subtraction (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
- [Multiplication (`*`)](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
