---
title: Date.prototype.setYear()
short-title: setYear()
slug: Web/JavaScript/Reference/Global_Objects/Date/setYear
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.Date.setYear
sidebar: jsref
---

{{Deprecated_Header}}

Phương thức **`setYear()`** của các instance {{jsxref("Date")}} đặt năm cho một ngày cụ thể theo giờ địa phương.

Tuy nhiên, cách phương thức `setYear()` cũ đặt giá trị năm khác với cách phương thức được ưu tiên {{jsxref("Date/setFullYear", "setFullYear()")}} đặt giá trị năm — và trong một số trường hợp, cũng khác với cách `new Date()` và {{jsxref("Date.parse()")}} đặt giá trị năm. Cụ thể, với các số có hai chữ số, chẳng hạn như `22` và `61`:

- `setYear()` diễn giải bất kỳ số có hai chữ số nào là một giá trị offset so với `1900`; vì vậy `date.setYear(22)` dẫn đến giá trị năm được đặt là `1922`, và `date.setYear(61)` dẫn đến giá trị năm được đặt là `1961`. (Ngược lại, trong khi `new Date(61, 1)` cũng dẫn đến giá trị năm được đặt là `1961`, `new Date("2/1/22")` dẫn đến giá trị năm được đặt là `2022`; và tương tự đối với {{jsxref("Date.parse()")}}).

- {{jsxref("Date/setFullYear", "setFullYear()")}} không thực hiện diễn giải đặc biệt mà thay vào đó sử dụng giá trị hai chữ số theo nghĩa đen để đặt năm; vì vậy `date.setFullYear(61)` dẫn đến giá trị năm được đặt là `0061`, và `date.setFullYear(22)` dẫn đến giá trị năm được đặt là `0022`.

Do những khác biệt trong hành vi đó, bạn không nên sử dụng phương thức `setYear()` cũ nữa, mà thay vào đó nên sử dụng phương thức được ưu tiên {{jsxref("Date/setFullYear", "setFullYear()")}}.

## Cú pháp

```js-nolint
setYear(yearValue)
```

### Tham số

- `yearValue`
  - : Một số nguyên.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu `yearValue` là `NaN` (hoặc các giá trị khác được [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu `yearValue` là một số từ 0 đến 99 (bao gồm cả hai đầu), thì năm của `dateObj` được đặt thành `1900 + yearValue`. Nếu không, năm của `dateObj` được đặt thành `yearValue`.

## Ví dụ

### Sử dụng setYear()

Hai dòng đầu đặt năm là 1996. Dòng thứ ba đặt năm là 2000.

```js
const theBigDay = new Date();

theBigDay.setYear(96);
theBigDay.setYear(1996);
theBigDay.setYear(2000);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Date.prototype.setYear` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-date)
- {{jsxref("Date.prototype.getFullYear()")}}
- {{jsxref("Date.prototype.getUTCFullYear()")}}
- {{jsxref("Date.prototype.setFullYear()")}}
- {{jsxref("Date.prototype.setUTCFullYear()")}}
