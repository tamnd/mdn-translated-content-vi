---
title: Remainder (%)
slug: Web/JavaScript/Reference/Operators/Remainder
page-type: javascript-operator
browser-compat: javascript.operators.remainder
sidebar: jssidebar
---

Operator **phần dư (`%`)** trả về phần dư còn lại khi một toán hạng được chia cho toán hạng thứ hai. Nó luôn mang dấu của số bị chia.

{{InteractiveExample("JavaScript Demo: Remainder (%) operator")}}

```js interactive-example
console.log(13 % 5);
// Expected output: 3

console.log(-13 % 5);
// Expected output: -3

console.log(4 % 2);
// Expected output: 0

console.log(-4 % 2);
// Expected output: -0
```

## Cú pháp

```js-nolint
x % y
```

## Mô tả

Operator `%` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc cả hai toán hạng thành các giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện phép lấy phần dư BigInt nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó thực hiện phép lấy phần dư số. Một {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành số.

Đối với phép toán `n % d`, `n` được gọi là số bị chia và `d` được gọi là số chia. Phép toán trả về `NaN` nếu một trong các toán hạng là `NaN`, `n` là ±Infinity, hoặc nếu `d` là ±0. Nếu không, nếu `d` là ±Infinity hoặc nếu `n` là ±0, số bị chia `n` được trả về.

Khi cả hai toán hạng đều khác 0 và hữu hạn, phần dư `r` được tính là `r := n - d * q` trong đó `q` là số nguyên sao cho `r` có cùng dấu với số bị chia `n` trong khi gần 0 nhất có thể.

Lưu ý rằng trong hầu hết các ngôn ngữ, '%' là operator phần dư, nhưng trong một số ngôn ngữ (ví dụ: [Python, Perl](https://en.wikipedia.org/wiki/Modulo_operation#In_programming_languages)) đây là operator modulo. Modulo được định nghĩa là `k := n - d * q` trong đó `q` là số nguyên sao cho `k` có cùng dấu với số chia `d` trong khi gần 0 nhất có thể. Đối với hai giá trị có cùng dấu, hai giá trị là tương đương, nhưng khi các toán hạng có dấu khác nhau, kết quả modulo luôn có cùng dấu với _số chia_, trong khi phần dư có cùng dấu với _số bị chia_, điều này có thể khiến chúng khác nhau một đơn vị `d`. Để thu được modulo trong JavaScript, thay vì `n % d`, hãy dùng `((n % d) + d) % d`. Trong JavaScript, phép toán modulo (không có operator chuyên dụng) được sử dụng để chuẩn hóa toán hạng thứ hai của các bitwise shift operator ([`<<`](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift), [`>>`](/en-US/docs/Web/JavaScript/Reference/Operators/Right_shift), v.v.), làm cho offset luôn là một giá trị dương.

Đối với phép chia BigInt, một {{jsxref("RangeError")}} được ném ra nếu số chia `y` là `0n`. Điều này là do phần dư số chia cho 0 trả về `NaN`, nhưng BigInt không có khái niệm về `NaN`.

## Ví dụ

### Phần dư với số bị chia dương

```js
13 % 5; // 3
1 % -2; // 1
1 % 2; // 1
2 % 3; // 2
5.5 % 2; // 1.5

3n % 2n; // 1n
```

### Phần dư với số bị chia âm

```js
-13 % 5; // -3
-1 % 2; // -1
-4 % 2; // -0

-3n % 2n; // -1n
```

### Phần dư với NaN

```js
NaN % 2; // NaN
```

### Phần dư với Infinity

```js
Infinity % 2; // NaN
Infinity % 0; // NaN
Infinity % Infinity; // NaN
2 % Infinity; // 2
0 % Infinity; // 0
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
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
- [Remainder operator vs. modulo operator](https://2ality.com/2019/08/remainder-vs-modulo.html) by Dr. Axel Rauschmayer (2019)
