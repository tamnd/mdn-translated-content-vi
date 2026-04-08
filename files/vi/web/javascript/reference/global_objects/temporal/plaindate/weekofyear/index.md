---
title: Temporal.PlainDate.prototype.weekOfYear
short-title: weekOfYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/weekOfYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.weekOfYear
sidebar: jsref
---

Thuộc tính accessor **`weekOfYear`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương đại diện cho chỉ số tuần theo cơ số 1 trong {{jsxref("Temporal/PlainDate/yearOfWeek", "yearOfWeek")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được định nghĩa rõ ràng. Tuần đầu tiên của năm là `1`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Lưu ý rằng đối với ISO 8601, một vài ngày đầu và cuối năm có thể được quy cho tuần cuối của năm trước hoặc tuần đầu của năm sau. Cụ thể, nếu một tuần vắt qua hai năm, thì nó thuộc về năm có đa số ngày hơn. Để lấy năm mà `weekOfYear` thuộc về, hãy sử dụng thuộc tính {{jsxref("Temporal/PlainDate/yearOfWeek", "yearOfWeek")}}, không phải thuộc tính {{jsxref("Temporal/PlainDate/year", "year")}}.

Set accessor của `weekOfYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.PlainDate` mới với giá trị `weekOfYear` mong muốn, hãy sử dụng phương thức {{jsxref("Temporal/PlainDate/add", "add()")}} hoặc {{jsxref("Temporal/PlainDate/subtract", "subtract()")}} với số `weeks` thích hợp.

## Ví dụ

### Sử dụng weekOfYear

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(date.weekOfYear); // 26

// Nếu 01-01 là Thứ Sáu/Thứ Bảy/Chủ Nhật, nó thuộc tuần cuối của năm trước
const date2 = Temporal.PlainDate.from("2021-01-01");
console.log(date2.dayOfWeek); // 5
console.log(date2.weekOfYear); // 53; năm 2020 có 53 tuần
console.log(date2.yearOfWeek); // 2020

// Ngược lại, nó thuộc tuần đầu tiên của năm
const date3 = Temporal.PlainDate.from("2020-01-01");
console.log(date3.dayOfWeek); // 3
console.log(date3.weekOfYear); // 1
console.log(date3.yearOfWeek); // 2020

// Tương tự, nếu 12-31 là Thứ Hai/Thứ Ba/Thứ Tư, nó thuộc tuần đầu tiên của năm sau
const date4 = Temporal.PlainDate.from("2019-12-31");
console.log(date4.dayOfWeek); // 2
console.log(date4.weekOfYear); // 1
console.log(date4.yearOfWeek); // 2020
```

### Thay đổi weekOfYear

`PlainDate` không hỗ trợ thay đổi `weekOfYear` trực tiếp. Để thay đổi tuần, bạn cần tính ra sự khác biệt về số tuần so với tuần mong muốn, rồi sử dụng `add` hoặc `subtract` để điều chỉnh ngày. Ví dụ, để chuyển sang tuần trước:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const previousWeek = date.subtract({ weeks: 1 });
console.log(previousWeek.toString()); // 2021-06-24
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/yearOfWeek", "Temporal.PlainDate.prototype.yearOfWeek")}}
- {{jsxref("Temporal/PlainDate/dayOfWeek", "Temporal.PlainDate.prototype.dayOfWeek")}}
- {{jsxref("Temporal/PlainDate/daysInWeek", "Temporal.PlainDate.prototype.daysInWeek")}}
- {{jsxref("Temporal/PlainDate/daysInYear", "Temporal.PlainDate.prototype.daysInYear")}}
