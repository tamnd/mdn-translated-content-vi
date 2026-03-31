---
title: Temporal.PlainDate.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainDate.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainDate.compare()`** trả về một số (-1, 0 hoặc 1) cho biết ngày đầu tiên đến trước, bằng hoặc sau ngày thứ hai. Tương đương với việc so sánh các trường năm, tháng và ngày của các ngày ISO 8601 bên dưới.

## Cú pháp

```js-nolint
Temporal.PlainDate.compare(date1, date2)
```

### Tham số

- `date1`
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.PlainDate")}} đại diện cho ngày đầu tiên cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainDate` bằng cùng thuật toán như {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}.
- `date2`
  - : Ngày thứ hai cần so sánh, được chuyển đổi thành đối tượng `Temporal.PlainDate` bằng cùng thuật toán như `date1`.

### Giá trị trả về

Trả về `-1` nếu `date1` đến trước `date2`, `0` nếu chúng bằng nhau, và `1` nếu `date1` đến sau `date2`. Chúng được so sánh theo giá trị ngày bên dưới, bỏ qua lịch của chúng.

## Ví dụ

### Sử dụng Temporal.PlainDate.compare()

```js
const date1 = Temporal.PlainDate.from("2021-08-01");
const date2 = Temporal.PlainDate.from("2021-08-02");
console.log(Temporal.PlainDate.compare(date1, date2)); // -1

const date3 = Temporal.PlainDate.from("2021-07-31");
console.log(Temporal.PlainDate.compare(date1, date3)); // 1
```

### So sánh ngày trong các lịch khác nhau

```js
const date1 = Temporal.PlainDate.from({ year: 2021, month: 8, day: 1 });
const date2 = Temporal.PlainDate.from({
  year: 2021,
  month: 8,
  day: 1,
  calendar: "islamic-umalqura",
});
const date3 = Temporal.PlainDate.from({
  year: 2021,
  month: 8,
  day: 1,
  calendar: "hebrew",
});
console.log(date1.toString()); // "2021-08-01"
console.log(date2.toString()); // "2582-12-17[u-ca=islamic-umalqura]"
console.log(date3.toString()); // "-001739-04-06[u-ca=hebrew]"
console.log(Temporal.PlainDate.compare(date1, date2)); // -1
console.log(Temporal.PlainDate.compare(date1, date3)); // 1
```

### Sắp xếp một mảng các ngày

Mục đích của hàm `compare()` này là hoạt động như một hàm so sánh để truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const dates = [
  Temporal.PlainDate.from({ year: 2021, month: 8, day: 1 }),
  Temporal.PlainDate.from({
    year: 2021,
    month: 8,
    day: 1,
    calendar: "islamic-umalqura",
  }),
  Temporal.PlainDate.from({ year: 2021, month: 8, day: 1, calendar: "hebrew" }),
];

dates.sort(Temporal.PlainDate.compare);
console.log(dates.map((d) => d.toString()));
// [ "-001739-04-06[u-ca=hebrew]", "2021-08-01", "2582-12-17[u-ca=islamic-umalqura]" ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/equals", "Temporal.PlainDate.prototype.equals()")}}
