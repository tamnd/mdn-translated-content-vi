---
title: Temporal.PlainDate.prototype.dayOfWeek
short-title: dayOfWeek
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/dayOfWeek
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.dayOfWeek
sidebar: jsref
---

Thuộc tính accessor **`dayOfWeek`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương đại diện cho chỉ mục ngày trong tuần dựa trên 1 của ngày này. Các ngày trong tuần được đánh số tuần tự từ `1` đến {{jsxref("Temporal/PlainDate/daysInWeek", "daysInWeek")}}, với mỗi số ánh xạ tới tên của nó. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). 1 thường đại diện cho Thứ Hai trong lịch, ngay cả khi các locale sử dụng lịch có thể coi một ngày khác là ngày đầu tiên của tuần (xem {{jsxref("Intl/Locale/getWeekInfo", "Intl.Locale.prototype.getWeekInfo()")}}).

Tất cả các lịch thường được hỗ trợ đều sử dụng tuần 7 ngày, và bạn thường có thể mong đợi thuộc tính này trả về cùng giá trị cho cùng ngày trên các lịch khác nhau.

Set accessor của `dayOfWeek` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo đối tượng `Temporal.PlainDate` mới với giá trị `dayOfWeek` mong muốn, sử dụng phương thức {{jsxref("Temporal/PlainDate/add", "add()")}} hoặc {{jsxref("Temporal/PlainDate/subtract", "subtract()")}} với số `days` phù hợp.

## Ví dụ

### Sử dụng dayOfWeek

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(date.dayOfWeek); // 4; Thứ Năm

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=chinese]");
console.log(date2.dayOfWeek); // 4
```

### Thay đổi dayOfWeek

`PlainDate` không hỗ trợ thay đổi `dayOfWeek` trực tiếp. Để thay đổi ngày trong tuần, bạn cần tính toán sự khác biệt về số ngày so với ngày trong tuần mong muốn, sau đó sử dụng `add` hoặc `subtract` để điều chỉnh ngày tháng phù hợp. Ví dụ, để thay đổi sang Thứ Sáu của tuần này (dù trước hay sau):

```js
function getDayInSameWeek(date, destDayOfWeek) {
  return date.add({ days: destDayOfWeek - date.dayOfWeek });
}

console.log(
  getDayInSameWeek(Temporal.PlainDate.from("2021-07-01"), 5).toString(),
); // 2021-07-02
console.log(
  getDayInSameWeek(Temporal.PlainDate.from("2021-07-03"), 5).toString(),
); // 2021-07-02
```

Để thay đổi sang Thứ Sáu tiếp theo:

```js
function getNextDayInWeek(date, destDayOfWeek) {
  const distance = destDayOfWeek - date.dayOfWeek;
  return date.add({
    days: distance < 0 ? date.daysInWeek + distance : distance,
  });
}

console.log(
  getNextDayInWeek(Temporal.PlainDate.from("2021-07-01"), 5).toString(),
); // 2021-07-02
console.log(
  getNextDayInWeek(Temporal.PlainDate.from("2021-07-03"), 5).toString(),
); // 2021-07-09
```

Để thay đổi sang Thứ Sáu trước đó:

```js
function getPreviousDayInWeek(date, destDayOfWeek) {
  const distance = date.dayOfWeek - destDayOfWeek;
  return date.subtract({
    days: distance < 0 ? date.daysInWeek + distance : distance,
  });
}

console.log(
  getPreviousDayInWeek(Temporal.PlainDate.from("2021-07-01"), 5).toString(),
); // 2021-06-25
console.log(
  getPreviousDayInWeek(Temporal.PlainDate.from("2021-07-03"), 5).toString(),
); // 2021-07-02
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
- {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}
- {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}
- {{jsxref("Temporal/PlainDate/daysInWeek", "Temporal.PlainDate.prototype.daysInWeek")}}
- {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}
- {{jsxref("Temporal/PlainDate/yearOfWeek", "Temporal.PlainDate.prototype.yearOfWeek")}}
