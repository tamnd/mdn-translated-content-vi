---
title: Temporal.PlainDate.prototype.day
short-title: day
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/day
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.day
sidebar: jsref
---

Thuộc tính accessor **`day`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương đại diện cho chỉ mục ngày dựa trên 1 trong tháng của ngày này, là cùng số ngày bạn sẽ thấy trên lịch. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Thường bắt đầu từ 1 và liên tục, nhưng không phải lúc nào cũng vậy. Nếu bạn muốn lặp qua tất cả các ngày trong tháng, trước tiên hãy sử dụng {{jsxref("Temporal/PlainDate/with", "with()")}} với `{ day: 1 }` (đặt về đầu tháng, ngay cả khi số thực tế không phải là `1`), sau đó liên tục sử dụng {{jsxref("Temporal/PlainDate/add", "add()")}} với `{ days: 1 }`, cho đến khi tháng thay đổi.

> [!NOTE]
> Thông thường, chỉ mục ngày chỉ thay đổi khi chuyển đổi từ hệ thống lịch này sang hệ thống lịch khác, chẳng hạn như [từ lịch Julian sang Gregorian](https://en.wikipedia.org/wiki/Adoption_of_the_Gregorian_calendar). Trong thực tế, tất cả các lịch được tích hợp sẵn hiện tại đều là [proleptic](https://en.wikipedia.org/wiki/Proleptic_Gregorian_calendar), nghĩa là hệ thống lịch được mở rộng vô thời hạn vào quá khứ và tương lai. Giả định `day` không liên tục để bảo vệ chống lại việc giới thiệu các lịch không proleptic trong tương lai.

Set accessor của `day` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} để tạo đối tượng `Temporal.PlainDate` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng day

```js
const date = Temporal.PlainDate.from("2021-07-01"); // lịch ISO 8601
console.log(date.day); // 1

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=chinese]");
console.log(date2.day); // 22; đây là ngày 22 tháng 5 trong lịch Trung Quốc
```

### Lặp qua tất cả các ngày trong tháng

```js
const month = Temporal.PlainDate.from("2021-07-14"); // Một ngày bất kỳ trong tháng
for (
  let day = month.with({ day: 1 });
  day.month === month.month;
  day = day.add({ days: 1 })
) {
  console.log(day.day);
}
```

### Thay đổi day

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.with({ day: 15 });
console.log(newDate.toString()); // 2021-07-15
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainDate/add", "add()")}} hoặc {{jsxref("Temporal/PlainDate/subtract", "subtract()")}} để di chuyển một số ngày nhất định từ ngày hiện tại.

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.add({ days: 14 });
console.log(newDate.toString()); // 2021-07-15
```

Theo mặc định, `with()` kẹp ngày vào phạm vi các giá trị hợp lệ. Vì vậy bạn có thể sử dụng `{ day: 1 }` để đặt ngày về ngày đầu tiên của tháng, ngay cả khi ngày đầu tiên không có số `1`. Tương tự, sau đây sẽ đặt ngày về ngày cuối cùng của tháng:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const lastDay = date.with({ day: Number.MAX_VALUE }); // 2021-07-31
```

> [!NOTE]
> Tránh sử dụng {{jsxref("Temporal/PlainDate/daysInMonth", "daysInMonth")}} để đặt ngày về ngày cuối cùng của tháng. Ngày cuối cùng của tháng không phải lúc nào cũng bằng số ngày trong tháng, trong trường hợp hiếm gặp khi một tháng có thể bỏ qua một vài ngày.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
- {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainDate/dayOfWeek", "Temporal.PlainDate.prototype.dayOfWeek")}}
- {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}
