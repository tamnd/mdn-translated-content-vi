---
title: Bitwise NOT (~)
slug: Web/JavaScript/Reference/Operators/Bitwise_NOT
page-type: javascript-operator
browser-compat: javascript.operators.bitwise_not
sidebar: jssidebar
---

Toán tử **bitwise NOT (`~`)** trả về một số hoặc BigInt có biểu diễn nhị phân có `1` ở mỗi vị trí bit mà bit tương ứng của toán hạng là `0`, và `0` ở những vị trí còn lại.

{{InteractiveExample("JavaScript Demo: Bitwise NOT (~) operator")}}

```js interactive-example
const a = 5; // 00000000000000000000000000000101
const b = -3; // 11111111111111111111111111111101

console.log(~a); // 11111111111111111111111111111010
// Expected output: -6

console.log(~b); // 00000000000000000000000000000010
// Expected output: 2
```

## Cú pháp

```js-nolint
~x
```

## Mô tả

Toán tử `~` được nạp chồng cho hai kiểu toán hạng: number và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Với number, toán tử trả về số nguyên 32-bit. Với BigInt, toán tử trả về BigInt. Đầu tiên, nó [ép kiểu toán hạng về giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của nó. Nó thực hiện BigInt NOT nếu toán hạng trở thành BigInt; nếu không, nó chuyển đổi toán hạng về [số nguyên 32-bit](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#fixed-width_number_conversion) và thực hiện bitwise NOT trên số.

Toán tử hoạt động trên biểu diễn bit của toán hạng theo dạng [bù hai (two's complement)](https://en.wikipedia.org/wiki/Two's_complement). Toán tử được áp dụng cho từng bit, và kết quả được xây dựng theo từng bit.

Bảng chân lý của phép NOT là:

| x   | NOT x |
| --- | ----- |
| 0   | 1     |
| 1   | 0     |

```plain
 9 (base 10) = 00000000000000000000000000001001 (base 2)
               --------------------------------
~9 (base 10) = 11111111111111111111111111110110 (base 2) = -10 (base 10)
```

Bitwise NOT của bất kỳ số nguyên 32-bit `x` nào cho kết quả `-(x + 1)`. Ví dụ, `~-5` cho kết quả `4`.

Các số có nhiều hơn 32 bit sẽ bị loại bỏ các bit có trọng số cao nhất. Ví dụ, số nguyên sau có nhiều hơn 32 bit sẽ được chuyển đổi thành số nguyên 32-bit:

```plain
Before: 11100110111110100000000000000110000000000001
After:              10100000000000000110000000000001
```

> [!WARNING]
> Bạn có thể thấy người ta dùng `~~` để cắt ngắn số thành số nguyên. Bitwise NOT một số `x` hai lần trả về `x` được chuyển đổi thành số nguyên 32-bit, đồng thời loại bỏ các bit đầu cho các số ngoài khoảng -2147483648 đến 2147483647. Hãy dùng [`Math.trunc()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc#using_bitwise_no-ops_to_truncate_numbers) thay thế.

Với BigInt, không có cắt ngắn. Về mặt khái niệm, hiểu rằng các BigInt dương có vô số bit `0` đứng đầu, và các BigInt âm có vô số bit `1` đứng đầu.

## Ví dụ

### Sử dụng bitwise NOT

```js
~0; // -1
~-1; // 0
~1; // -2

~0n; // -1n
~4294967295n; // -4294967296n
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các toán tử bitwise trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bitwise_operators)
