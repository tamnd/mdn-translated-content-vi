---
title: "RangeError: precision is out of range"
slug: Web/JavaScript/Reference/Errors/Precision_range
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "precision is out of range" xảy ra khi một số nằm ngoài phạm vi cho phép được truyền vào `toExponential`, `toFixed`, hoặc `toPrecision`.

## Thông báo

```plain
RangeError: toExponential() argument must be between 0 and 100 (V8-based & Safari)
RangeError: toFixed() digits argument must be between 0 and 100 (V8-based & Safari)
RangeError: toPrecision() argument must be between 1 and 100 (V8-based & Safari)
RangeError: precision -1 out of range (Firefox)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Điều gì đã xảy ra?

Đối số precision nằm ngoài phạm vi trong một trong các phương thức sau:

- {{jsxref("Number.prototype.toExponential()")}}, yêu cầu đối số nằm trong khoảng từ 0 đến 100, bao gồm cả hai đầu.
- {{jsxref("Number.prototype.toFixed()")}}, yêu cầu đối số nằm trong khoảng từ 0 đến 100, bao gồm cả hai đầu.
- {{jsxref("Number.prototype.toPrecision()")}}, yêu cầu đối số nằm trong khoảng từ 1 đến 100, bao gồm cả hai đầu.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
(77.1234).toExponential(-1); // RangeError
(77.1234).toExponential(101); // RangeError

(2.34).toFixed(-100); // RangeError
(2.34).toFixed(1001); // RangeError

(1234.5).toPrecision(-1); // RangeError
(1234.5).toPrecision(101); // RangeError
```

### Các trường hợp hợp lệ

```js example-good
(77.1234).toExponential(4); // 7.7123e+1
(77.1234).toExponential(2); // 7.71e+1

(2.34).toFixed(1); // 2.3
(2.35).toFixed(1); // 2.4 (lưu ý rằng giá trị được làm tròn lên trong trường hợp này)

(5.123456).toPrecision(5); // 5.1235
(5.123456).toPrecision(2); // 5.1
(5.123456).toPrecision(1); // 5
```

## Xem thêm

- {{jsxref("Number.prototype.toExponential()")}}
- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Number.prototype.toPrecision()")}}
