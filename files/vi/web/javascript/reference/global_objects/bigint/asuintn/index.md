---
title: BigInt.asUintN()
short-title: asUintN()
slug: Web/JavaScript/Reference/Global_Objects/BigInt/asUintN
page-type: javascript-static-method
browser-compat: javascript.builtins.BigInt.asUintN
sidebar: jsref
---

Phương thức tĩnh **`BigInt.asUintN()`** cắt ngắn giá trị `BigInt` xuống số bit ít quan trọng nhất đã cho và trả về giá trị đó như một số nguyên không dấu.

{{InteractiveExample("JavaScript Demo: BigInt.asUintN()", "taller")}}

```js interactive-example
const U64_CEIL = 2n ** 64n;

console.log(BigInt.asUintN(64, U64_CEIL - 1n));
// 18446744073709551615n (2n ** 64n - 1n, the maximum non-wrapping value)
console.log(BigInt.asUintN(64, U64_CEIL));
// 0n (wraps to zero)
console.log(BigInt.asUintN(64, U64_CEIL + 1n));
// 1n
console.log(BigInt.asUintN(64, U64_CEIL * 2n));
// 0n (wraps on multiples)
console.log(BigInt.asUintN(64, U64_CEIL * -42n));
// 0n (also wraps on negative multiples)
```

## Cú pháp

```js-nolint
BigInt.asUintN(bits, bigint)
```

### Tham số

- `bits`
  - : Số lượng bit có sẵn cho BigInt được trả về. Phải là số nguyên từ 0 đến 2<sup>53</sup> - 1, bao gồm cả hai đầu.
- `bigint`
  - : Giá trị BigInt cần cắt ngắn để vừa với số bit đã cung cấp.

### Giá trị trả về

Giá trị của `bigint` modulo `2 ** bits`, như một số nguyên không dấu.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `bits` là âm hoặc lớn hơn 2<sup>53</sup> - 1.

## Mô tả

Phương thức `BigInt.asUintN` cắt ngắn giá trị `BigInt` xuống số bit đã cho, và diễn giải kết quả như một số nguyên không dấu. Số nguyên không dấu không có bit dấu và luôn không âm. Ví dụ, đối với `BigInt.asUintN(4, 25n)`, giá trị `25n` được cắt ngắn thành `9n`:

```plain
25n = 00011001 (base 2)
         ^==== Use only the four remaining bits
===>      1001 (base 2) = 9n
```

> [!NOTE]
> Các giá trị `BigInt` luôn được mã hóa dưới dạng bù hai trong hệ nhị phân.

Không giống như các API ngôn ngữ tương tự như {{jsxref("Number.prototype.toExponential()")}}, `asUintN` là thuộc tính tĩnh của {{jsxref("BigInt")}}, vì vậy bạn luôn dùng nó như `BigInt.asUintN()`, thay vì là phương thức của giá trị BigInt. Hiển thị `asUintN()` như "hàm thư viện chuẩn" cho phép [tương tác với asm.js](https://github.com/tc39/proposal-bigint/blob/master/ADVANCED.md#dont-break-asmjs).

## Ví dụ

### Giữ trong phạm vi 64-bit

Phương thức `BigInt.asUintN()` có thể hữu ích để giữ trong phạm vi số học 64-bit.

```js
const max = 2n ** 64n - 1n;

BigInt.asUintN(64, max); // 18446744073709551615n

BigInt.asUintN(64, max + 1n); // 0n
// bằng không vì tràn: 64 bit thấp nhất đều là không
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("BigInt")}}
- {{jsxref("BigInt.asIntN()")}}
