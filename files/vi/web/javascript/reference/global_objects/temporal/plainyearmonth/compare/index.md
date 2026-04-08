---
title: Temporal.PlainYearMonth.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainYearMonth.compare()`** trả về một số (-1, 0 hoặc 1) cho biết year-month đầu tiên đến trước, bằng hoặc sau year-month thứ hai. Nó tương đương với việc so sánh các ngày ISO 8601 cơ bản của chúng. Hai year-month từ các lịch khác nhau có thể được coi là bằng nhau nếu chúng bắt đầu vào cùng một ngày ISO.

> [!NOTE]
> Các đối tượng `PlainYearMonth` theo dõi một ngày ISO tham chiếu, cũng được dùng trong quá trình so sánh. Ngày này được tự động đặt khi sử dụng phương thức {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}, nhưng có thể được đặt thủ công bằng constructor {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}}, khiến hai year-month tương đương bị coi là khác nhau nếu chúng có các ngày tham chiếu khác nhau. Vì lý do này, bạn nên tránh dùng constructor trực tiếp và ưu tiên phương thức `from()`.

## Cú pháp

```js-nolint
Temporal.PlainYearMonth.compare(yearMonth1, yearMonth2)
```

### Tham số

- `yearMonth1`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainYearMonth")}} đại diện cho year-month đầu tiên cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainYearMonth` bằng thuật toán tương tự như {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}.
- `yearMonth2`
  - : Year-month thứ hai cần so sánh, được chuyển đổi thành đối tượng `Temporal.PlainYearMonth` bằng thuật toán tương tự như `yearMonth1`.

### Giá trị trả về

Trả về `-1` nếu `yearMonth1` đến trước `yearMonth2`, `0` nếu chúng bằng nhau, và `1` nếu `yearMonth1` đến sau `yearMonth2`. Chúng được so sánh theo giá trị ngày cơ bản (thường là ngày đầu tiên của tháng), bỏ qua lịch của chúng.

## Ví dụ

### Sử dụng Temporal.PlainYearMonth.compare()

```js
const ym1 = Temporal.PlainYearMonth.from("2021-08");
const ym2 = Temporal.PlainYearMonth.from("2021-09");
console.log(Temporal.PlainYearMonth.compare(ym1, ym2)); // -1

const ym3 = Temporal.PlainYearMonth.from("2021-07");
console.log(Temporal.PlainYearMonth.compare(ym1, ym3)); // 1
```

### So sánh year-month trong các lịch khác nhau

```js
const ym1 = Temporal.PlainYearMonth.from({ year: 2021, month: 8 });
const ym2 = Temporal.PlainYearMonth.from({
  year: 2021,
  month: 8,
  calendar: "islamic-umalqura",
});
const ym3 = Temporal.PlainYearMonth.from({
  year: 2021,
  month: 8,
  calendar: "hebrew",
});
console.log(ym1.toString()); // "2021-08"
console.log(ym2.toString()); // "2582-12-17[u-ca=islamic-umalqura]"
console.log(ym3.toString()); // "-001739-04-06[u-ca=hebrew]"
console.log(Temporal.PlainYearMonth.compare(ym1, ym2)); // -1
console.log(Temporal.PlainYearMonth.compare(ym1, ym3)); // 1
```

### Sắp xếp một mảng year-month

Mục đích của hàm `compare()` này là hoạt động như một hàm so sánh để truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const months = [
  Temporal.PlainYearMonth.from({ year: 2021, month: 8 }),
  Temporal.PlainYearMonth.from({
    year: 2021,
    month: 8,
    calendar: "islamic-umalqura",
  }),
  Temporal.PlainYearMonth.from({ year: 2021, month: 8, calendar: "hebrew" }),
];

months.sort(Temporal.PlainYearMonth.compare);
console.log(months.map((d) => d.toString()));
// [ "-001739-04-06[u-ca=hebrew]", "2021-08", "2582-12-17[u-ca=islamic-umalqura]" ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/equals", "Temporal.PlainYearMonth.prototype.equals()")}}
