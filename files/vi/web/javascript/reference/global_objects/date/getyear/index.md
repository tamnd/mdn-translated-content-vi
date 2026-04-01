---
title: Date.prototype.getYear()
short-title: getYear()
slug: Web/JavaScript/Reference/Global_Objects/Date/getYear
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.Date.getYear
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`getYear()`** của các instance {{jsxref("Date")}} trả về năm cho ngày này theo giờ địa phương. Vì `getYear()` không trả về năm đầy đủ ("vấn đề năm 2000"), nó đã bị deprecated và được thay thế bởi phương thức {{jsxref("Date/getFullYear", "getFullYear()")}}.

## Cú pháp

```js-nolint
getYear()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên biểu diễn năm cho ngày đã cho theo giờ địa phương, trừ đi 1900. Trả về `NaN` nếu ngày là [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

- Đối với các năm lớn hơn hoặc bằng 2000, giá trị là 100 hoặc lớn hơn. Ví dụ, nếu năm là 2026, `getYear()` trả về 126.
- Đối với các năm từ 1900 đến 1999 (bao gồm), giá trị trả về bởi `getYear()` là từ 0 đến 99. Ví dụ, nếu năm là 1976, `getYear()` trả về 76.
- Đối với các năm nhỏ hơn 1900, giá trị trả về bởi `getYear()` nhỏ hơn 0. Ví dụ, nếu năm là 1800, `getYear()` trả về -100.

Phương thức này về cơ bản trả về giá trị của {{jsxref("Date/getFullYear", "getFullYear()")}} trừ đi 1900. Bạn nên sử dụng `getFullYear()` thay thế, để năm được chỉ định đầy đủ.

## Ví dụ

### Các năm từ 1900 đến 1999

Câu lệnh thứ hai gán giá trị 95 cho biến `year`.

```js
const xmas = new Date("1995-12-25");
const year = xmas.getYear(); // returns 95
```

### Các năm trên 1999

Câu lệnh thứ hai gán giá trị 100 cho biến `year`.

```js
const xmas = new Date("2000-12-25");
const year = xmas.getYear(); // returns 100
```

### Các năm dưới 1900

Câu lệnh thứ hai gán giá trị -100 cho biến `year`.

```js
const xmas = new Date("1800-12-25");
const year = xmas.getYear(); // returns -100
```

### Thiết lập và lấy một năm từ 1900 đến 1999

Câu lệnh thứ ba gán giá trị 95 cho biến `year`, biểu diễn năm 1995.

```js
const xmas = new Date("2015-12-25");
xmas.setYear(95);
const year = xmas.getYear(); // returns 95
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Date.prototype.getYear` in `core-js`](https://github.com/zloirock/core-js#ecmascript-date)
- [es-shims polyfill of `Date.prototype.getYear`](https://www.npmjs.com/package/date.prototype.getyear)
- {{jsxref("Date.prototype.getFullYear()")}}
- {{jsxref("Date.prototype.getUTCFullYear()")}}
- {{jsxref("Date.prototype.setYear()")}}
