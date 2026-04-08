---
title: "RangeError: repeat count must be non-negative"
slug: Web/JavaScript/Reference/Errors/Negative_repetition_count
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "repeat count must be non-negative" xảy ra khi phương thức {{jsxref("String.prototype.repeat()")}} được sử dụng với đối số `count` là một số âm.

## Thông báo

```plain
RangeError: Invalid count value: -1 (V8-based)
RangeError: repeat count must be non-negative (Firefox)
RangeError: String.prototype.repeat argument must be greater than or equal to 0 and not be Infinity (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Nguyên nhân?

Phương thức {{jsxref("String.prototype.repeat()")}} đã được sử dụng. Nó có tham số `count` cho biết số lần lặp lại chuỗi. Giá trị phải nằm trong khoảng từ 0 đến nhỏ hơn {{jsxref("Infinity")}} dương và không thể là số âm. Phạm vi các giá trị được phép có thể mô tả như sau: \[0, +∞).

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
"abc".repeat(-1); // RangeError
```

### Trường hợp hợp lệ

```js example-good
"abc".repeat(0); // ''
"abc".repeat(1); // 'abc'
"abc".repeat(2); // 'abcabc'
"abc".repeat(3.5); // 'abcabcabc' (count sẽ được chuyển đổi thành số nguyên)
```

## Xem thêm

- {{jsxref("String.prototype.repeat()")}}
