---
title: Temporal.PlainMonthDay.prototype.toPlainDate()
short-title: toPlainDate()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/toPlainDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.toPlainDate
sidebar: jsref
---

Phương thức **`toPlainDate()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới đại diện cho tháng-ngày này và một năm được cung cấp trong cùng hệ thống lịch.

## Cú pháp

```js-nolint
toPlainDate(yearInfo)
```

### Tham số

- `yearInfo`
  - : Một đối tượng đại diện cho thành phần năm của `PlainDate` kết quả, chứa các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
    - `era` và `eraYear`
      - : Một chuỗi và một số nguyên tương ứng với các thuộc tính {{jsxref("Temporal/PlainDate/era", "era")}} và {{jsxref("Temporal/PlainDate/eraYear", "eraYear")}}. Chỉ được dùng nếu hệ thống lịch có kỷ nguyên. `era` và `eraYear` phải được cung cấp đồng thời. Nếu chúng không được cung cấp, thì `year` phải được cung cấp. Nếu tất cả `era`, `eraYear` và `year` đều được cung cấp, chúng phải nhất quán.
    - `year`
      - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/year", "year")}}.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới đại diện cho ngày được chỉ định bởi tháng-ngày này và năm trong `yearInfo`, được diễn giải trong hệ thống lịch của tháng-ngày này.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném nếu `yearInfo` không phải là đối tượng.

## Ví dụ

### Sử dụng toPlainDate()

```js
const md = Temporal.PlainMonthDay.from("07-01");
const date = md.toPlainDate({ year: 2021 });
console.log(date.toString()); // 2021-07-01

const md2 = Temporal.PlainMonthDay.from("2021-07-01[u-ca=japanese]");
const date2 = md2.toPlainDate({ era: "reiwa", eraYear: 1 });
console.log(date2.toString()); // 2019-07-01[u-ca=japanese]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/toPlainMonthDay", "Temporal.PlainDate.prototype.toPlainMonthDay()")}}
