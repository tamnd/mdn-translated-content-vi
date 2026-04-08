---
title: Temporal.PlainYearMonth.prototype.toPlainDate()
short-title: toPlainDate()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/toPlainDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.toPlainDate
sidebar: jsref
---

Phương thức **`toPlainDate()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới đại diện cho năm-tháng này và một ngày được cung cấp trong cùng hệ thống lịch.

## Cú pháp

```js-nolint
toPlainDate(dayInfo)
```

### Tham số

- `dayInfo` {{optional_inline}}
  - : Một đối tượng đại diện cho thành phần ngày của `PlainDate` kết quả, chứa thuộc tính sau:
    - `day`
      - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/day", "day")}}.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới đại diện cho ngày được chỉ định bởi năm-tháng này và ngày trong `dayInfo`, được diễn giải trong hệ thống lịch của năm-tháng này.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu `dayInfo` không phải là đối tượng.

## Ví dụ

### Sử dụng toPlainDate()

```js
const ym = Temporal.PlainYearMonth.from("2021-07");
const date = ym.toPlainDate({ day: 1 });
console.log(date.toString()); // 2021-07-01

const ym2 = Temporal.PlainYearMonth.from("2021-07-01[u-ca=chinese]");
const date2 = ym2.toPlainDate({ day: 15 });
console.log(date2.toString()); // 2021-06-24[u-ca=chinese]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/toPlainYearMonth", "Temporal.PlainDate.prototype.toPlainYearMonth()")}}
