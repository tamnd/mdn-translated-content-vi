---
title: Date.prototype.getUTCMilliseconds()
short-title: getUTCMilliseconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCMilliseconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCMilliseconds
sidebar: jsref
---

Phương thức **`getUTCMilliseconds()`** của các đối tượng {{jsxref("Date")}} trả về số mili giây của ngày này theo giờ quốc tế (UTC).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCMilliseconds()", "shorter")}}

```js interactive-example
const exampleDate = new Date("2018-01-02T03:04:05.678Z"); // 2 January 2018, 03:04:05.678 (UTC)

console.log(exampleDate.getUTCMilliseconds());
// Expected output: 678
```

## Cú pháp

```js-nolint
getUTCMilliseconds()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 999, đại diện cho số mili giây của ngày đã cho theo giờ quốc tế (UTC). Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

Không nên nhầm lẫn với timestamp. Để lấy tổng số mili giây kể từ epoch, hãy sử dụng phương thức [`getTime()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getTime).

## Ví dụ

### Sử dụng getUTCMilliseconds()

Ví dụ sau đây gán phần mili giây của thời gian hiện tại cho biến `milliseconds`.

```js
const today = new Date();
const milliseconds = today.getUTCMilliseconds();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getMilliseconds()")}}
- {{jsxref("Date.prototype.setUTCMilliseconds()")}}
