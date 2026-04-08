---
title: Temporal.PlainDate.prototype.year
short-title: year
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/year
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.year
sidebar: jsref
---

Thuộc tính accessor **`year`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên đại diện cho số năm của ngày này tính từ đầu năm gốc (epoch year) của lịch cụ thể. Thuộc tính này có cùng chức năng với cặp {{jsxref("Temporal/PlainDate/era", "era")}}/{{jsxref("Temporal/PlainDate/eraYear", "eraYear")}} như một định danh duy nhất của một năm trong lịch. Thuộc tính này phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

## Giá trị

Thông thường năm 1 là năm đầu tiên của kỷ nguyên gần nhất hoặc năm ISO 8601 `0001`. Vì `year` là tương đối so với điểm bắt đầu của năm gốc, không phải ngày gốc, nếu gốc nằm ở giữa năm (chỉ biết xảy ra với lịch `japanese`), thì năm đó sẽ có cùng giá trị `year` trước và sau ngày bắt đầu kỷ nguyên (đối với lịch `japanese`, `year` giống với năm ISO 8601).

Tất cả [các lịch được chỉ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) đều có năm số học được định nghĩa đầy đủ bởi đặc tả.

- Các lịch sau có cùng năm gốc với ISO 8601: `chinese`, `dangi`, `gregory`, `japanese`, trong đó `year: 1` tương ứng với năm ISO `1`.
- Lịch `buddhist` sử dụng gốc Phật lịch vào năm 543 TCN, vì vậy `year: 1` tương ứng với năm ISO `-542`.
- Lịch `coptic` sử dụng gốc Coptic vào năm 284 CN, vì vậy `year: 1` tương ứng với năm ISO `284`.
- Lịch `ethioaa` sử dụng gốc Anno Mundi vào năm 5493 TCN, vì vậy `year: 1` tương ứng với năm ISO `-5492`.
- Lịch `ethiopic` sử dụng gốc Ethiopic vào năm 8 CN, vì vậy `year: 1` tương ứng với năm ISO `8`.
- Lịch `hebrew` sử dụng gốc Anno Mundi vào năm 3761 TCN, vì vậy `year: 1` tương ứng với năm ISO `-3760`.
- Lịch `indian` sử dụng gốc Śaka vào năm 79 CN, vì vậy `year: 1` tương ứng với năm ISO `79`.
- Các lịch sau sử dụng gốc Hijri vào năm 622 CN: `islamic-civil`, `islamic-tbla`, `islamic-umalqura`, `persian`, trong đó `year: 1` tương ứng với năm ISO `622`.
- Lịch `roc` sử dụng gốc Minguo vào năm 1912 CN, vì vậy `year: 1` tương ứng với năm ISO `1912`.

> [!NOTE]
> Đối với các lịch `chinese` và `dangi`, dữ liệu CLDR mặc định sử dụng gốc Hoàng Đế vào năm 2637 TCN, nhưng Temporal định nghĩa nó sử dụng gốc ISO 8601 để đơn giản hóa.

Set accessor của `year` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} để tạo một đối tượng `Temporal.PlainDate` mới với giá trị mới mong muốn.

## Ví dụ

### Sử dụng year

```js
const date = Temporal.PlainDate.from("2021-07-01"); // ISO 8601 calendar
console.log(date.year); // 2021

const date2 = Temporal.PlainDate.from("-002021-07-01");
console.log(date2.year); // -2021

const date3 = Temporal.PlainDate.from("2021-07-01[u-ca=japanese]");
console.log(date3.year); // 2021; although the Japanese calendar uses eras,
// there's no obvious "default era", so the year is the same as the ISO year

const date4 = Temporal.PlainDate.from("2021-07-01[u-ca=hebrew]");
console.log(date4.year); // 5781; the Hebrew calendar uses the Anno Mundi epoch, which starts in 3761 BC
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
- {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}
- {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}
- {{jsxref("Temporal/PlainDate/yearOfWeek", "Temporal.PlainDate.prototype.yearOfWeek")}}
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
- {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}
