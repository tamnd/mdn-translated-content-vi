---
title: Temporal.PlainYearMonth.prototype.era
short-title: era
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/era
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainYearMonth.era
sidebar: jsref
---

Thuộc tính truy cập **`era`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một chuỗi viết thường đặc thù của lịch đại diện cho kỷ nguyên của year-month này, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ: ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong một lịch, giống như cách `year` làm. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `era` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Dùng phương thức {{jsxref("Temporal/PlainYearMonth/with", "with()")}} để tạo một đối tượng `Temporal.PlainYearMonth` mới với giá trị mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}.

## Ví dụ

### Sử dụng era

```js
const ym = Temporal.PlainYearMonth.from("2021-07"); // ISO 8601 calendar
console.log(ym.era); // undefined

const ym2 = Temporal.PlainYearMonth.from("2021-07-01[u-ca=gregory]");
console.log(ym2.era); // ce
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/with", "Temporal.PlainYearMonth.prototype.with()")}}
- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
- {{jsxref("Temporal/PlainYearMonth/year", "Temporal.PlainYearMonth.prototype.year")}}
- {{jsxref("Temporal/PlainYearMonth/eraYear", "Temporal.PlainYearMonth.prototype.eraYear")}}
- {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}
