---
title: BigInt() constructor
short-title: BigInt()
slug: Web/JavaScript/Reference/Global_Objects/BigInt/BigInt
page-type: javascript-constructor
browser-compat: javascript.builtins.BigInt.BigInt
sidebar: jsref
---

Hàm **`BigInt()`** trả về các giá trị nguyên thủy kiểu BigInt.

## Cú pháp

```js-nolint
BigInt(value)
```

> [!NOTE]
> `BigInt()` chỉ có thể được gọi mà không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng khởi tạo nó với `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `value`
  - : Giá trị cần chuyển đổi thành BigInt. Nó có thể là chuỗi, số nguyên, boolean, hoặc BigInt khác.

### Giá trị trả về

Một giá trị {{jsxref("BigInt")}}. Các giá trị số phải là số nguyên và được chuyển đổi thành BigInt. Giá trị boolean `true` trở thành `1n`, và `false` trở thành `0n`. Chuỗi được phân tích như thể chúng là văn bản nguồn cho các ký tự nguyên, nghĩa là chúng có thể có khoảng trắng đầu và cuối và có thể được tiền tố bằng `0b`, `0o`, hoặc `0x`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu tham số là số không nguyên.
- {{jsxref("TypeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Tham số không thể chuyển đổi thành nguyên thủy.
    - Sau khi chuyển đổi thành nguyên thủy, kết quả là {{jsxref("undefined")}}, {{jsxref("Operators/null", "null")}}, {{jsxref("symbol")}}.
- {{jsxref("SyntaxError")}}
  - : Được ném nếu tham số là chuỗi không thể phân tích thành `BigInt`.

## Ví dụ

### Sử dụng BigInt() để chuyển đổi số thành BigInt

`BigInt()` là trường hợp duy nhất mà một số có thể được chuyển đổi thành BigInt mà không ném ngoại lệ, vì nó rất rõ ràng. Tuy nhiên, chỉ cho phép số nguyên.

```js
BigInt(123); // 123n
BigInt(123.3); // RangeError: The number 123.3 cannot be converted to a BigInt because it is not an integer
```

### Sử dụng giá trị chuỗi

```js
BigInt("123"); // 123n
BigInt("0b10101"); // 21n, là 10101 trong hệ nhị phân
BigInt("0o123"); // 83n, là 123 trong hệ bát phân
BigInt("0x123"); // 291n, là 123 trong hệ thập lục phân
BigInt("  123  "); // 123n, cho phép khoảng trắng đầu và cuối
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("BigInt")}}
