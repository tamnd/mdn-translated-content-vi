---
title: Temporal.PlainDateTime.prototype.era
short-title: era
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/era
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.era
sidebar: jsref
---

Thuộc tính accessor **`era`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một chuỗi chữ thường đặc trưng theo lịch đại diện cho thời đại của ngày này, hoặc `undefined` nếu lịch không sử dụng thời đại (ví dụ: ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `era` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}.

## Ví dụ

### Sử dụng era

```js
const dt = Temporal.PlainDateTime.from("2021-07-01"); // ISO 8601 calendar
console.log(dt.era); // undefined

const dt2 = Temporal.PlainDateTime.from("2021-07-01[u-ca=gregory]");
console.log(dt2.era); // ce
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDateTime/year", "Temporal.PlainDateTime.prototype.year")}}
- {{jsxref("Temporal/PlainDateTime/eraYear", "Temporal.PlainDateTime.prototype.eraYear")}}
- {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}
