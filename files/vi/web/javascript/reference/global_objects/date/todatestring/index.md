---
title: Date.prototype.toDateString()
short-title: toDateString()
slug: Web/JavaScript/Reference/Global_Objects/Date/toDateString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toDateString
sidebar: jsref
---

Phương thức **`toDateString()`** của các instance {{jsxref("Date")}} trả về một chuỗi đại diện cho phần ngày của ngày này được diễn giải theo múi giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.toDateString()")}}

```js interactive-example
const event = new Date(1993, 6, 28, 14, 39, 7);

console.log(event.toString());
// Expected output: "Wed Jul 28 1993 14:39:07 GMT+0200 (CEST)"
// Note: your timezone may vary

console.log(event.toDateString());
// Expected output: "Wed Jul 28 1993"
```

## Cú pháp

```js-nolint
toDateString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho phần ngày của ngày đã cho (xem mô tả để biết định dạng). Trả về `"Invalid Date"` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Các instance {{jsxref("Date")}} đề cập đến một thời điểm cụ thể. `toDateString()` diễn giải ngày theo múi giờ địa phương và định dạng phần _ngày_ bằng tiếng Anh. Nó luôn sử dụng định dạng sau, cách nhau bởi khoảng trắng:

1. Ba chữ cái đầu của tên ngày trong tuần
2. Ba chữ cái đầu của tên tháng
3. Ngày trong tháng gồm hai chữ số, được đệm bằng số không ở bên trái nếu cần thiết
4. Năm gồm ít nhất bốn chữ số, được đệm bằng số không ở bên trái nếu cần thiết. Có thể có dấu âm

Ví dụ: "Thu Jan 01 1970".

- Nếu bạn chỉ muốn lấy phần _thời gian_, hãy sử dụng {{jsxref("Date/toTimeString", "toTimeString()")}}.
- Nếu bạn muốn lấy cả ngày và thời gian, hãy sử dụng {{jsxref("Date/toString", "toString()")}}.
- Nếu bạn muốn ngày được diễn giải theo UTC thay vì múi giờ địa phương, hãy sử dụng {{jsxref("Date/toUTCString", "toUTCString()")}}.
- Nếu bạn muốn định dạng ngày theo định dạng thân thiện hơn với người dùng (ví dụ: bản địa hóa), hãy sử dụng {{jsxref("Date/toLocaleDateString", "toLocaleDateString()")}}.

## Ví dụ

### Sử dụng toDateString()

```js
const d = new Date(0);

console.log(d.toString()); // "Thu Jan 01 1970 00:00:00 GMT+0000 (Coordinated Universal Time)"
console.log(d.toDateString()); // "Thu Jan 01 1970"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.toLocaleDateString()")}}
- {{jsxref("Date.prototype.toTimeString()")}}
- {{jsxref("Date.prototype.toString()")}}
