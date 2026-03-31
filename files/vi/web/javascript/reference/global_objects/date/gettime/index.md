---
title: Date.prototype.getTime()
short-title: getTime()
slug: Web/JavaScript/Reference/Global_Objects/Date/getTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getTime
sidebar: jsref
---

Phương thức **`getTime()`** của các đối tượng {{jsxref("Date")}} trả về số mili giây của ngày này kể từ [epoch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), được định nghĩa là nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC.

{{InteractiveExample("JavaScript Demo: Date.prototype.getTime()", "shorter")}}

```js interactive-example
const moonLanding = new Date("July 20, 69 20:17:40 GMT+00:00");

// Milliseconds since Jan 1, 1970, 00:00:00.000 GMT
console.log(moonLanding.getTime());
// Expected output: -14182940000
```

## Cú pháp

```js-nolint
getTime()
```

### Tham số

Không có.

### Giá trị trả về

Một số đại diện cho [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), tính bằng mili giây, của ngày này. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Các đối tượng `Date` về cơ bản được biểu diễn bằng một [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), và phương thức này cho phép bạn truy xuất timestamp đó. Bạn có thể sử dụng phương thức này để giúp gán giá trị ngày và giờ cho một đối tượng {{jsxref("Date")}} khác. Phương thức này tương đương về mặt chức năng với phương thức {{jsxref("Date/valueof", "valueOf()")}}.

## Ví dụ

### Sử dụng getTime() để sao chép ngày

Xây dựng một đối tượng ngày với giá trị thời gian giống hệt.

```js
// Since month is zero based, birthday will be January 10, 1995
const birthday = new Date(1994, 12, 10);
const copy = new Date();
copy.setTime(birthday.getTime());
```

### Đo thời gian thực thi

Trừ hai lần gọi `getTime()` liên tiếp trên các đối tượng {{jsxref("Date")}} mới tạo sẽ cho khoảng thời gian giữa hai lần gọi đó. Điều này có thể được sử dụng để tính toán thời gian thực thi của một số thao tác. Xem thêm {{jsxref("Date.now()")}} để tránh khởi tạo các đối tượng {{jsxref("Date")}} không cần thiết.

```js
let end, start;

start = new Date();
for (let i = 0; i < 1000; i++) {
  Math.sqrt(i);
}
end = new Date();

console.log(`Operation took ${end.getTime() - start.getTime()} msec`);
```

> [!NOTE]
> Trong các trình duyệt hỗ trợ tính năng thời gian độ phân giải cao của {{domxref("Performance API", "", "", "nocode")}}, {{domxref("Performance.now()")}} có thể cung cấp các phép đo thời gian đã trôi qua đáng tin cậy và chính xác hơn so với {{jsxref("Date.now()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.setTime()")}}
- {{jsxref("Date.prototype.valueOf()")}}
- {{jsxref("Date.now()")}}
