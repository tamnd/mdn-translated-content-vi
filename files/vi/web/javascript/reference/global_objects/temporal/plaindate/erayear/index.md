---
title: Temporal.PlainDate.prototype.eraYear
short-title: eraYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/eraYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.eraYear
sidebar: jsref
---

Thuộc tính accessor **`eraYear`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên không âm đại diện cho năm của ngày này trong kỷ nguyên, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ, ISO 8601). Chỉ mục năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một kỷ nguyên có thể giảm theo thời gian (ví dụ, Gregorian BCE). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Không giống như `year`, `era` và `eraYear` có thể thay đổi vào giữa năm dương lịch. Ví dụ, Nhật Bản bắt đầu kỷ nguyên Reiwa vào ngày 1 tháng 5 năm 2019, vì vậy các ngày từ 2019-01-01 đến 2019-04-30 có `{ era: "heisei", eraYear: 31 }`, và các ngày từ 2019-05-01 trở đi có `{ era: "reiwa", eraYear: 1 }`, nhưng `year` luôn là 2019 (vì lịch Nhật Bản sử dụng năm ISO 8601 làm năm số học).

Để biết thêm thông tin về các giá trị của `era` và `eraYear` cho các lịch khác nhau, xem thuộc tính {{jsxref("Temporal/PlainDate/era", "era")}}.

Set accessor của `eraYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} để tạo đối tượng `Temporal.PlainDate` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng eraYear

```js
const date = Temporal.PlainDate.from("2021-07-01"); // lịch ISO 8601
console.log(date.eraYear); // undefined

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=gregory]");
console.log(date2.eraYear); // 2021

const date3 = Temporal.PlainDate.from("-002021-07-01[u-ca=gregory]");
console.log(date3.eraYear); // 2022; 0000 được dùng cho năm 1 TCN

const date4 = Temporal.PlainDate.from("2021-07-01[u-ca=japanese]");
console.log(date4.eraYear); // 3
```

### Thay đổi eraYear

Bạn chỉ có thể đặt `eraYear` cho các lịch hỗ trợ chúng. Ví dụ, lịch ISO 8601 không có kỷ nguyên. Lưu ý rằng bạn phải cung cấp `era` và `eraYear` cùng nhau.

```js
const date = Temporal.PlainDate.from("2021-07-01[u-ca=gregory]");
const newDate = date.with({ era: "bc", eraYear: 100 });
console.log(newDate.toString()); // -000099-07-01[u-ca=gregory]

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=japanese]");
const newDate2 = date2.with({ era: "meiji", eraYear: 1 });
console.log(newDate2.toString()); // 1868-07-01[u-ca=japanese]
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
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
- {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}
