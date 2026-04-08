---
title: "RangeError: invalid date"
slug: Web/JavaScript/Reference/Errors/Invalid_date
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid date" xảy ra khi một ngày không hợp lệ được cố gắng chuyển đổi thành chuỗi ngày ISO.

## Thông báo

```plain
RangeError: Invalid time value (V8-based)
RangeError: invalid date (Firefox)
RangeError: Invalid Date (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Điều gì đã xảy ra?

Bạn đang chuyển đổi một giá trị [ngày không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) thành chuỗi ngày ISO. Điều này thường xảy ra theo một trong ba cách:

- Gọi phương thức {{jsxref("Date/toISOString", "toISOString()")}}
- Gọi phương thức {{jsxref("Date/toJSON", "toJSON()")}}, ngầm gọi `toISOString`
- Sử dụng {{jsxref("JSON.stringify()")}} để chuyển đổi ngày thành chuỗi, ngầm gọi `toJSON`

_Ngày không hợp lệ_ được tạo ra khi bạn cố gắng phân tích một chuỗi ngày không hợp lệ, hoặc đặt dấu thời gian thành giá trị ngoài phạm vi. Các ngày không hợp lệ thường khiến tất cả các phương thức ngày trả về {{jsxref("NaN")}} hoặc các giá trị đặc biệt khác. Tuy nhiên, các ngày như vậy không có biểu diễn chuỗi ISO hợp lệ, vì vậy lỗi được ném khi bạn cố gắng thực hiện điều đó.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
const invalid = new Date("nothing");
invalid.toISOString(); // RangeError: invalid date
invalid.toJSON(); // RangeError: invalid date
JSON.stringify({ date: invalid }); // RangeError: invalid date
```

Tuy nhiên, hầu hết các phương thức khác trả về các giá trị đặc biệt:

```js example-bad
invalid.toString(); // "Invalid Date"
invalid.getDate(); // NaN
```

Để biết thêm chi tiết, xem tài liệu {{jsxref("Date.parse()")}}.

### Trường hợp hợp lệ

```js example-good
new Date("05 October 2011 14:48 UTC").toISOString(); // "2011-10-05T14:48:00.000Z"
new Date(1317826080).toISOString(); // "2011-10-05T14:48:00.000Z"
```

## Xem thêm

- {{jsxref("Date")}}
- {{jsxref("Date.prototype.parse()")}}
- {{jsxref("Date.prototype.toISOString()")}}
