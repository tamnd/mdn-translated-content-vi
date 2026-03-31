---
title: Left shift (<<)
slug: Web/JavaScript/Reference/Operators/Left_shift
page-type: javascript-operator
browser-compat: javascript.operators.left_shift
sidebar: jssidebar
---

Toán tử **left shift (`<<`)** trả về một số hoặc BigInt có biểu diễn nhị phân là toán hạng đầu tiên được dịch chuyển sang trái theo số bit đã chỉ định. Các bit thừa bị dịch ra khỏi bên trái sẽ bị loại bỏ, và các bit zero được đưa vào từ bên phải.

{{InteractiveExample("JavaScript Demo: Left shift (<<) operator", "shorter")}}

```js interactive-example
const a = 5; // 00000000000000000000000000000101
const b = 2; // 00000000000000000000000000000010

console.log(a << b); // 00000000000000000000000000010100
// Expected output: 20
```

## Cú pháp

```js-nolint
x << y
```

## Mô tả

Toán tử `<<` được nạp chồng cho hai kiểu toán hạng: number và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Với number, toán tử trả về số nguyên 32-bit. Với BigInt, toán tử trả về BigInt. Đầu tiên, nó [ép kiểu cả hai toán hạng về giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện BigInt left shift nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó chuyển đổi cả hai toán hạng về [số nguyên 32-bit](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#fixed-width_number_conversion) và thực hiện left shift trên số. {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành number.

Toán tử hoạt động trên biểu diễn bit của toán hạng bên trái theo dạng [bù hai (two's complement)](https://en.wikipedia.org/wiki/Two's_complement). Ví dụ, `9 << 2` cho kết quả 36:

```plain
     9 (base 10): 00000000000000000000000000001001 (base 2)
                  --------------------------------
9 << 2 (base 10): 00000000000000000000000000100100 (base 2) = 36 (base 10)
```

Dịch chuyển trái một số nguyên 32-bit `x` sang trái `y` bit cho kết quả `x * 2 ** y`. Vì vậy, ví dụ, `9 << 3` tương đương với `9 * (2 ** 3) = 9 * (8) = 72`.

Nếu toán hạng bên trái là một số có nhiều hơn 32 bit, các bit có trọng số cao nhất sẽ bị loại bỏ. Ví dụ, số nguyên sau có nhiều hơn 32 bit sẽ được chuyển đổi thành số nguyên 32-bit:

```plain
Before: 11100110111110100000000000000110000000000001
After:              10100000000000000110000000000001
```

Toán hạng bên phải sẽ được chuyển đổi thành số nguyên 32-bit không dấu và sau đó lấy modulo 32, vì vậy độ lệch dịch chuyển thực tế luôn là một số nguyên dương từ 0 đến 31, bao gồm cả hai đầu. Ví dụ, `100 << 32` giống như `100 << 0` (và tạo ra `100`) vì 32 modulo 32 là 0.

> [!WARNING]
> Bạn có thể thấy người ta dùng `<< 0` để cắt ngắn số thành số nguyên. Left shift bất kỳ số `x` nào sang trái `0` bit trả về `x` được chuyển đổi thành số nguyên 32-bit, đồng thời loại bỏ các bit đầu cho các số ngoài khoảng -2147483648 đến 2147483647. Hãy dùng [`Math.trunc()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc#using_bitwise_no-ops_to_truncate_numbers) thay thế.

Với BigInt, không có cắt ngắn. Về mặt khái niệm, hiểu rằng các BigInt dương có vô số bit `0` đứng đầu, và các BigInt âm có vô số bit `1` đứng đầu.

## Ví dụ

### Sử dụng left shift

```js
9 << 3; // 72

// 9 * (2 ** 3) = 9 * (8) = 72

9n << 3n; // 72n
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các toán tử bitwise trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bitwise_operators)
- [Left shift assignment (`<<=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift_assignment)
