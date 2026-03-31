---
title: Date.prototype.toTimeString()
short-title: toTimeString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toTimeString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toTimeString
sidebar: jsref
---

Phương thức **`toTimeString()`** của các instance {{jsxref("Date")}} trả về một chuỗi đại diện cho phần thời gian của ngày này được diễn giải theo múi giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.toTimeString()", "shorter")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");

console.log(event.toTimeString());
// Expected output: "23:15:30 GMT+0200 (CEST)"
// Note: your timezone may vary
```

## Cú pháp

```js-nolint
toTimeString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho phần thời gian của ngày đã cho (xem mô tả để biết định dạng). Trả về `"Invalid Date"` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Các instance {{jsxref("Date")}} đề cập đến một thời điểm cụ thể. `toTimeString()` diễn giải ngày theo múi giờ địa phương và định dạng phần _thời gian_ bằng tiếng Anh. Nó luôn sử dụng định dạng `HH:mm:ss GMT±xxxx (TZ)`, trong đó:

| Chuỗi định dạng | Mô tả                                                                                           |
| --------------- | ----------------------------------------------------------------------------------------------- |
| `HH`            | Giờ, gồm hai chữ số với số không đứng trước nếu cần                                             |
| `mm`            | Phút, gồm hai chữ số với số không đứng trước nếu cần                                            |
| `ss`            | Giây, gồm hai chữ số với số không đứng trước nếu cần                                            |
| `±xxxx`         | Offset múi giờ địa phương — hai chữ số cho giờ và hai chữ số cho phút (ví dụ: `-0500`, `+0800`) |
| `TZ`            | Tên múi giờ (ví dụ: `PDT`, `PST`)                                                               |

Ví dụ: "04:42:04 GMT+0000 (Coordinated Universal Time)".

- Nếu bạn chỉ muốn lấy phần _ngày_, hãy sử dụng {{jsxref("Date/toDateString", "toDateString()")}}.
- Nếu bạn muốn lấy cả ngày và thời gian, hãy sử dụng {{jsxref("Date/toString", "toString()")}}.
- Nếu bạn muốn ngày được diễn giải theo UTC thay vì múi giờ địa phương, hãy sử dụng {{jsxref("Date/toUTCString", "toUTCString()")}}.
- Nếu bạn muốn định dạng ngày theo định dạng thân thiện hơn với người dùng (ví dụ: bản địa hóa), hãy sử dụng {{jsxref("Date/toLocaleTimeString", "toLocaleTimeString()")}}.

## Ví dụ

### Sử dụng toTimeString()

```js
const d = new Date(0);

console.log(d.toString()); // "Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)"
console.log(d.toTimeString()); // "00:00:00 GMT+0000 (Coordinated Universal Time)"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.toLocaleTimeString()")}}
- {{jsxref("Date.prototype.toDateString()")}}
- {{jsxref("Date.prototype.toString()")}}
