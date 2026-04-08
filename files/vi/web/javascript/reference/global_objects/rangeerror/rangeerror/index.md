---
title: RangeError() constructor
short-title: RangeError()
slug: Web/JavaScript/Reference/Global_Objects/RangeError/RangeError
page-type: javascript-constructor
browser-compat: javascript.builtins.RangeError.RangeError
sidebar: jsref
---

Constructor **`RangeError()`** tạo ra các đối tượng {{jsxref("RangeError")}}.

## Cú pháp

```js-nolint
new RangeError()
new RangeError(message)
new RangeError(message, options)
new RangeError(message, fileName)
new RangeError(message, fileName, lineNumber)

RangeError()
RangeError(message)
RangeError(message, options)
RangeError(message, fileName)
RangeError(message, fileName, lineNumber)
```

> [!NOTE]
> `RangeError()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `RangeError` mới.

### Tham số

- `message` {{optional_inline}}
  - : Mô tả lỗi dưới dạng con người có thể đọc được.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `cause` {{optional_inline}}
      - : Thuộc tính chỉ ra nguyên nhân cụ thể của lỗi.
        Khi bắt và ném lại một lỗi với thông báo lỗi cụ thể hơn hoặc hữu ích hơn, thuộc tính này có thể được dùng để truyền lỗi gốc.
- `fileName` {{optional_inline}} {{non-standard_inline}}
  - : Tên tệp chứa mã gây ra ngoại lệ
- `lineNumber` {{optional_inline}} {{non-standard_inline}}
  - : Số dòng của mã gây ra ngoại lệ

## Ví dụ

### Sử dụng RangeError (với giá trị số)

```js
function check(n) {
  if (!(n >= -500 && n <= 500)) {
    throw new RangeError("The argument must be between -500 and 500.");
  }
}

try {
  check(2000);
} catch (error) {
  if (error instanceof RangeError) {
    // Handle the error
  }
}
```

### Sử dụng RangeError (với giá trị không phải số)

```js
function check(value) {
  if (!["apple", "banana", "carrot"].includes(value)) {
    throw new RangeError(
      'The argument must be an "apple", "banana", or "carrot".',
    );
  }
}

try {
  check("cabbage");
} catch (error) {
  if (error instanceof RangeError) {
    // Handle the error
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- {{jsxref("Array")}}
- {{jsxref("Number.prototype.toExponential()")}}
- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Number.prototype.toPrecision()")}}
- {{jsxref("String.prototype.normalize()")}}
