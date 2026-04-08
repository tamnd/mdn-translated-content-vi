---
title: Temporal.PlainMonthDay.prototype.day
short-title: day
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/day
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainMonthDay.day
sidebar: jsref
---

Thuộc tính accessor **`day`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một số nguyên dương đại diện cho chỉ số ngày dựa trên 1 trong tháng của ngày này, là cùng số ngày bạn thấy trên lịch. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `day` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainMonthDay/with", "with()")}} để tạo một đối tượng `Temporal.PlainMonthDay` mới với giá trị mong muốn.

Để biết thêm thông tin chung và ví dụ, xem {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}.

## Ví dụ

### Sử dụng day

```js
const md = Temporal.PlainMonthDay.from("07-01"); // ISO 8601 calendar
console.log(md.day); // 1

const md2 = Temporal.PlainMonthDay.from("2021-07-01[u-ca=chinese]");
console.log(md2.day); // 22; it is May 22 in the Chinese calendar
```

### Thay đổi day

```js
const md = Temporal.PlainMonthDay.from("07-01");
const newMD = md.with({ day: 15 });
console.log(newMD.toString()); // 07-15
```

Theo mặc định, `with()` ràng buộc ngày trong phạm vi các giá trị hợp lệ. Vì vậy, bạn có thể dùng `{ day: 1 }` để đặt ngày về ngày đầu tiên của tháng, ngay cả khi ngày đầu tiên không có số `1`. Tương tự, lệnh sau sẽ đặt ngày về ngày cuối cùng của tháng:

```js
const md = Temporal.PlainMonthDay.from("07-01");
const lastMD = md.with({ day: Number.MAX_VALUE }); // 07-31
```

Với mục đích của `PlainMonthDay`, tháng Hai luôn được coi là có 29 ngày.

```js
const md = Temporal.PlainMonthDay.from("02-01");
const lastMD = md.with({ day: Number.MAX_VALUE }); // 02-29
console.log(lastMD.day); // 29
```

Đối với các lịch khác, miễn là tồn tại một năm mà tháng-ngày đó hợp lệ, thì tháng-ngày đó được coi là hợp lệ, và năm tham chiếu bên dưới có thể thay đổi tương ứng. Ví dụ:

```js
const md = Temporal.PlainMonthDay.from({
  monthCode: "M02",
  day: 29,
  calendar: "hebrew",
});
console.log(md.toString()); // 1972-11-06[u-ca=hebrew]
console.log(md.toLocaleString("en-US", { calendar: "hebrew" })); // 29 Heshvan
const lastMD = md.with({ day: Number.MAX_VALUE });
// 30 Heshvan does not exist in 1972, so the reference year changes to 1971
console.log(lastMD.toString()); // 1971-11-18[u-ca=hebrew]
console.log(lastMD.toLocaleString("en-US", { calendar: "hebrew" })); // 30 Heshvan
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/with", "Temporal.PlainMonthDay.prototype.with()")}}
- {{jsxref("Temporal/PlainMonthDay/monthCode", "Temporal.PlainMonthDay.prototype.monthCode")}}
