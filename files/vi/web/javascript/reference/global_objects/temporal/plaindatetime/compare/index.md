---
title: Temporal.PlainDateTime.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainDateTime.compare()`** trả về một số (-1, 0, hoặc 1) cho biết ngày-giờ đầu tiên đến trước, giống với, hoặc đến sau ngày-giờ thứ hai. Tương đương với việc so sánh ngày trước, rồi so sánh thời gian nếu ngày giống nhau.

## Cú pháp

```js-nolint
Temporal.PlainDateTime.compare(dateTime1, dateTime2)
```

### Tham số

- `dateTime1`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainDateTime")}} đại diện cho ngày-giờ đầu tiên cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainDateTime` sử dụng cùng thuật toán như {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}.
- `dateTime2`
  - : Ngày-giờ thứ hai cần so sánh, được chuyển đổi thành đối tượng `Temporal.PlainDateTime` sử dụng cùng thuật toán như `dateTime1`.

### Giá trị trả về

Trả về `-1` nếu `dateTime1` đến trước `dateTime2`, `0` nếu chúng giống nhau, và `1` nếu `dateTime1` đến sau `dateTime2`. Chúng được so sánh bằng các giá trị ngày và thời gian cơ bản, bỏ qua lịch của chúng.

## Ví dụ

### Sử dụng Temporal.PlainDateTime.compare()

```js
const dt1 = Temporal.PlainDateTime.from("2021-08-01T01:00:00");
const dt2 = Temporal.PlainDateTime.from("2021-08-02T00:00:00");
console.log(Temporal.PlainDateTime.compare(dt1, dt2)); // -1

const dt3 = Temporal.PlainDateTime.from("2021-08-01T00:00:00");
console.log(Temporal.PlainDateTime.compare(dt1, dt3)); // 1
```

### So sánh ngày trong các lịch khác nhau

```js
const dt1 = Temporal.PlainDateTime.from({ year: 2021, month: 8, day: 1 });
const dt2 = Temporal.PlainDateTime.from({
  year: 2021,
  month: 8,
  day: 1,
  calendar: "islamic-umalqura",
});
const dt3 = Temporal.PlainDateTime.from({
  year: 2021,
  month: 8,
  day: 1,
  calendar: "hebrew",
});
console.log(dt1.toString()); // "2021-08-01T00:00:00"
console.log(dt2.toString()); // "2582-12-17T00:00:00[u-ca=islamic-umalqura]"
console.log(dt3.toString()); // "-001739-04-06T00:00:00[u-ca=hebrew]"
console.log(Temporal.PlainDateTime.compare(dt1, dt2)); // -1
console.log(Temporal.PlainDateTime.compare(dt1, dt3)); // 1
```

### Sắp xếp một mảng ngày-giờ

Mục đích của hàm `compare()` này là đóng vai trò là hàm so sánh để truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const dateTimes = [
  Temporal.PlainDateTime.from("2021-08-01"),
  Temporal.PlainDateTime.from("2021-08-02"),
  Temporal.PlainDateTime.from("2021-08-01T01:00:00"),
];

dateTimes.sort(Temporal.PlainDateTime.compare);
console.log(dateTimes.map((d) => d.toString()));
// [ "2021-08-01T00:00:00", "2021-08-01T01:00:00", "2021-08-02T00:00:00" ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/equals", "Temporal.PlainDateTime.prototype.equals()")}}
