---
title: "RangeError: repeat count must be less than infinity"
slug: Web/JavaScript/Reference/Errors/Resulting_string_too_large
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "repeat count must be less than infinity" xảy ra khi phương thức {{jsxref("String.prototype.repeat()")}} được sử dụng với đối số `count` là infinity.

## Thông báo

```plain
RangeError: Invalid string length (V8-based)
RangeError: Invalid count value: Infinity (V8-based)
RangeError: repeat count must be less than infinity and not overflow maximum string size (Firefox)
RangeError: Out of memory (Safari)
RangeError: String.prototype.repeat argument must be greater than or equal to 0 and not be Infinity (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Điều gì đã xảy ra?

Phương thức {{jsxref("String.prototype.repeat()")}} đã được sử dụng. Nó có tham số `count` cho biết số lần lặp lại chuỗi. Giá trị phải nằm trong khoảng từ 0 đến nhỏ hơn {{jsxref("Infinity")}} dương và không thể là số âm. Phạm vi các giá trị cho phép có thể được mô tả như sau: \[0, +∞).

Chuỗi kết quả cũng không thể lớn hơn kích thước chuỗi tối đa, có thể khác nhau tùy theo JavaScript engine. Trong Firefox (SpiderMonkey) kích thước chuỗi tối đa là 2<sup>30</sup> - 2 (\~2GiB).

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
"abc".repeat(Infinity); // RangeError
"a".repeat(2 ** 30); // RangeError
```

### Các trường hợp hợp lệ

```js example-good
"abc".repeat(0); // ''
"abc".repeat(1); // 'abc'
"abc".repeat(2); // 'abcabc'
"abc".repeat(3.5); // 'abcabcabc' (count sẽ được chuyển đổi thành số nguyên)
```

## Xem thêm

- {{jsxref("String.prototype.repeat()")}}
