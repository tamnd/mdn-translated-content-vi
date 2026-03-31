---
title: "SyntaxError: invalid BigInt syntax"
slug: Web/JavaScript/Reference/Errors/Invalid_BigInt_syntax
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid BigInt syntax" xảy ra khi một giá trị chuỗi đang được ép kiểu sang {{jsxref("BigInt")}} nhưng không thể được phân tích cú pháp thành số nguyên.

## Thông báo

```plain
SyntaxError: Cannot convert x to a BigInt (V8-based)
SyntaxError: invalid BigInt syntax (Firefox)
SyntaxError: Failed to parse String to BigInt (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}.

## Nguyên nhân?

Khi sử dụng hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) để chuyển đổi một chuỗi sang BigInt, chuỗi đó sẽ được phân tích cú pháp theo cách tương tự như mã nguồn, và giá trị kết quả phải là một số nguyên.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
const a = BigInt("1.5");
const b = BigInt("1n");
const c = BigInt.asIntN(4, "8n");
// SyntaxError: invalid BigInt syntax
```

### Trường hợp hợp lệ

```js example-good
const a = BigInt("1");
const b = BigInt("  1   ");
const c = BigInt.asIntN(4, "8");
```

## Xem thêm

- [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
