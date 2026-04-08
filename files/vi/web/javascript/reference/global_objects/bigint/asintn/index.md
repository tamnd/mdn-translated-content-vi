---
title: BigInt.asIntN()
short-title: asIntN()
slug: Web/JavaScript/Reference/Global_Objects/BigInt/asIntN
page-type: javascript-static-method
browser-compat: javascript.builtins.BigInt.asIntN
sidebar: jsref
---

Phương thức tĩnh **`BigInt.asIntN()`** cắt ngắn giá trị `BigInt` xuống số bit ít quan trọng nhất đã cho và trả về giá trị đó như một số nguyên có dấu.

{{InteractiveExample("JavaScript Demo: BigInt.asIntN()")}}

```js interactive-example
const I64_CEIL = 2n ** 63n;

console.log(BigInt.asIntN(64, I64_CEIL - 1n));
// 9223372036854775807n (2n ** 64n - 1n, the maximum non-wrapping value)
console.log(BigInt.asIntN(64, I64_CEIL));
// -9223372036854775808n (wraps to min value)
console.log(BigInt.asIntN(64, I64_CEIL + 1n));
// -9223372036854775807n (min value + 1n)
console.log(BigInt.asIntN(64, I64_CEIL * 2n));
// 0n (wrapped around to zero)
console.log(BigInt.asIntN(64, -I64_CEIL * -42n));
// 0n (also wraps on negative multiples)
```

## Cú pháp

```js-nolint
BigInt.asIntN(bits, bigint)
```

### Tham số

- `bits`
  - : Số lượng bit có sẵn cho BigInt được trả về. Phải là số nguyên từ 0 đến 2<sup>53</sup> - 1, bao gồm cả hai đầu.
- `bigint`
  - : Giá trị BigInt cần cắt ngắn để vừa với số bit đã cung cấp.

### Giá trị trả về

Giá trị của `bigint` modulo `2 ** bits`, như một số nguyên có dấu.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `bits` là âm hoặc lớn hơn 2<sup>53</sup> - 1.

## Mô tả

Phương thức `BigInt.asIntN` cắt ngắn giá trị `BigInt` xuống số bit đã cho, và diễn giải kết quả như một số nguyên có dấu. Ví dụ, đối với `BigInt.asIntN(3, 25n)`, giá trị `25n` được cắt ngắn thành `1n`:

```plain
25n = 00011001 (base 2)
          ^=== Use only the three remaining bits
===>       001 (base 2) = 1n
```

Nếu bit đầu của số còn lại là `1`, kết quả là âm. Ví dụ, `BigInt.asIntN(4, 25n)` cho ra `-7n`, vì `1001` là mã hóa của `-7` trong biểu diễn bù hai:

```plain
25n = 00011001 (base 2)
         ^==== Use only the four remaining bits
===>      1001 (base 2) = -7n
```

> [!NOTE]
> Các giá trị `BigInt` luôn được mã hóa dưới dạng bù hai trong hệ nhị phân.

Không giống như các API ngôn ngữ tương tự như {{jsxref("Number.prototype.toExponential()")}}, `asIntN` là thuộc tính tĩnh của {{jsxref("BigInt")}}, vì vậy bạn luôn dùng nó như `BigInt.asIntN()`, thay vì là phương thức của giá trị BigInt. Hiển thị `asIntN()` như "hàm thư viện chuẩn" cho phép [tương tác với asm.js](https://github.com/tc39/proposal-bigint/blob/master/ADVANCED.md#dont-break-asmjs).

## Ví dụ

### Giữ trong phạm vi 64-bit

Phương thức `BigInt.asIntN()` có thể hữu ích để giữ trong phạm vi số học 64-bit.

```js
const max = 2n ** (64n - 1n) - 1n;

BigInt.asIntN(64, max); // 9223372036854775807n

BigInt.asIntN(64, max + 1n); // -9223372036854775808n
// âm vì bit thứ 64 của 2^63 là 1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("BigInt")}}
- {{jsxref("BigInt.asUintN()")}}
