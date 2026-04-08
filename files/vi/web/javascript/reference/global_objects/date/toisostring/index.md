---
title: Date.prototype.toISOString()
short-title: toISOString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toISOString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toISOString
sidebar: jsref
---

Phương thức **`toISOString()`** của các instance {{jsxref("Date")}} trả về một chuỗi đại diện cho ngày này theo [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format), một định dạng _đơn giản hóa_ dựa trên [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601), luôn có độ dài 24 hoặc 27 ký tự (`YYYY-MM-DDTHH:mm:ss.sssZ` hoặc `±YYYYYY-MM-DDTHH:mm:ss.sssZ`, tương ứng). Múi giờ luôn là UTC, được biểu thị bằng hậu tố `Z`.

{{InteractiveExample("JavaScript Demo: Date.prototype.toISOString()")}}

```js interactive-example
const event = new Date("05 October 2011 14:48 UTC");
console.log(event.toString());
// Expected output: "Wed Oct 05 2011 16:48:00 GMT+0200 (CEST)"
// Note: your timezone may vary

console.log(event.toISOString());
// Expected output: "2011-10-05T14:48:00.000Z"
```

## Cú pháp

```js-nolint
toISOString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho ngày đã cho theo [định dạng chuỗi ngày giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#date_time_string_format) theo giờ quốc tế. Đây là cùng định dạng mà {{jsxref("Date.parse()")}} được yêu cầu phải nhận dạng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) hoặc nếu nó tương ứng với một năm không thể biểu diễn trong định dạng chuỗi ngày.

## Ví dụ

### Sử dụng toISOString()

```js
const d = new Date(0);

console.log(d.toISOString()); // "1970-01-01T00:00:00.000Z"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.toLocaleDateString()")}}
- {{jsxref("Date.prototype.toString()")}}
- {{jsxref("Date.prototype.toUTCString()")}}
