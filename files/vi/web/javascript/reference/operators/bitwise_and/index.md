---
title: Bitwise AND (&)
slug: Web/JavaScript/Reference/Operators/Bitwise_AND
page-type: javascript-operator
browser-compat: javascript.operators.bitwise_and
sidebar: jssidebar
---

Toán tử **bitwise AND (`&`)** trả về một số hoặc BigInt có biểu diễn nhị phân có `1` ở mỗi vị trí bit mà cả hai bit tương ứng của hai toán hạng đều là `1`.

{{InteractiveExample("JavaScript Demo: Bitwise AND (&) operator", "shorter")}}

```js interactive-example
const a = 5; // 00000000000000000000000000000101
const b = 3; // 00000000000000000000000000000011

console.log(a & b); // 00000000000000000000000000000001
// Expected output: 1
```

## Cú pháp

```js-nolint
x & y
```

## Mô tả

Toán tử `&` được nạp chồng cho hai kiểu toán hạng: number và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Với number, toán tử trả về số nguyên 32-bit. Với BigInt, toán tử trả về BigInt. Đầu tiên, nó [ép kiểu cả hai toán hạng về giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện BigInt AND nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó chuyển đổi cả hai toán hạng về [số nguyên 32-bit](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#fixed-width_number_conversion) và thực hiện bitwise AND trên số. {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành number.

Toán tử hoạt động trên biểu diễn bit của các toán hạng theo dạng [bù hai (two's complement)](https://en.wikipedia.org/wiki/Two's_complement). Mỗi bit trong toán hạng thứ nhất được ghép với bit tương ứng trong toán hạng thứ hai: _bit đầu tiên_ với _bit đầu tiên_, _bit thứ hai_ với _bit thứ hai_, và cứ thế tiếp tục. Toán tử được áp dụng cho từng cặp bit, và kết quả được xây dựng theo từng bit.

Bảng chân lý của phép AND là:

| x   | y   | x AND y |
| --- | --- | ------- |
| 0   | 0   | 0       |
| 0   | 1   | 0       |
| 1   | 0   | 0       |
| 1   | 1   | 1       |

```plain
     9 (base 10) = 00000000000000000000000000001001 (base 2)
    14 (base 10) = 00000000000000000000000000001110 (base 2)
                   --------------------------------
14 & 9 (base 10) = 00000000000000000000000000001000 (base 2) = 8 (base 10)
```

Các số có nhiều hơn 32 bit sẽ bị loại bỏ các bit có trọng số cao nhất. Ví dụ, số nguyên sau có nhiều hơn 32 bit sẽ được chuyển đổi thành số nguyên 32-bit:

```plain
Before: 11100110111110100000000000000110000000000001
After:              10100000000000000110000000000001
```

> [!WARNING]
> Bạn có thể thấy người ta dùng `& -1` để cắt ngắn số thành số nguyên. Bitwise AND bất kỳ số `x` nào với `-1` trả về `x` được chuyển đổi thành số nguyên 32-bit, đồng thời loại bỏ các bit đầu cho các số ngoài khoảng -2147483648 đến 2147483647. Hãy dùng [`Math.trunc()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc#using_bitwise_no-ops_to_truncate_numbers) thay thế.

Với BigInt, không có cắt ngắn. Về mặt khái niệm, hiểu rằng các BigInt dương có vô số bit `0` đứng đầu, và các BigInt âm có vô số bit `1` đứng đầu.

## Ví dụ

### Sử dụng bitwise AND

```js
// 9  (00000000000000000000000000001001)
// 14 (00000000000000000000000000001110)

14 & 9;
// 8  (00000000000000000000000000001000)

14n & 9n; // 8n
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các toán tử bitwise trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#bitwise_operators)
- [Bitwise AND assignment (`&=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND_assignment)
