---
title: Temporal.PlainDate.prototype.era
short-title: era
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/era
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.era
sidebar: jsref
---

Thuộc tính accessor **`era`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một chuỗi chữ thường dành riêng cho lịch đại diện cho kỷ nguyên của ngày này, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ, ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars). Đối với Gregorian, đó là `"ce"` hoặc `"bce"`.

## Giá trị

Tất cả [các lịch được chỉ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) có kỷ nguyên được định nghĩa đầy đủ theo spec.

- Các lịch sau có một kỷ nguyên duy nhất:
  - `buddhist`: `"be"`
  - `coptic`: `"am"`
  - `ethioaa`: `"aa"`
  - `hebrew`: `"am"`
  - `indian`: `"shaka"`
  - `persian`: `"ap"`
- Các lịch sau có hai kỷ nguyên. Một là _kỷ nguyên epoch_, trong đó `eraYear` bắt đầu từ 1 và bằng với {{jsxref("Temporal/PlainDate/year", "year")}}. Kỷ nguyên còn lại là kỷ nguyên nghịch đảo, trong đó `eraYear` cũng bắt đầu từ 1 và bằng `1 - year` (vì vậy `eraYear: 1` tương ứng với năm `0`, `eraYear: 2` với năm `-1`, v.v.):
  - `gregory`: kỷ nguyên epoch `"ce"`, kỷ nguyên nghịch đảo `"bce"`
  - `islamic-civil`, `islamic-tbla`, `islamic-umalqura`: kỷ nguyên epoch `"ah"`, kỷ nguyên nghịch đảo `"bh"`
  - `roc`: kỷ nguyên epoch `"roc"`, kỷ nguyên nghịch đảo `"broc"`
- Lịch `ethiopic` có kỷ nguyên `"am"` là kỷ nguyên epoch. Các năm trước `1` thuộc kỷ nguyên `"aa"`, có `eraYear` bằng `year - 5500` (vì vậy `eraYear: -1000` tương ứng với năm `-6500`, `eraYear: 1` tương ứng với năm `-5499`, đến `eraYear: 5500` là năm `0`).
- Lịch `japanese` thêm kỷ nguyên cho mỗi hoàng đế mới, vì vậy năm và kỷ nguyên đầu ra cho ngày trong tương lai có thể không khớp với năm và kỷ nguyên đầu vào khi mã của bạn chạy trên phiên bản engine trong tương lai, và chúng tôi sẽ không liệt kê chúng ở đây. Năm của mỗi kỷ nguyên bắt đầu từ 1. Đây cũng là lịch duy nhất được biết có kỷ nguyên bắt đầu vào giữa năm, nghĩa là cùng một `year` có thể tương ứng với các cặp `(era, eraYear)` khác nhau tùy thuộc vào tháng và ngày.

  > [!WARNING]
  > Tính đến tháng 10 năm 2025, trong lịch `japanese`, các ngày trước 1868-10-23 ISO (ngày bắt đầu năm 1 Minh Trị) không hoạt động như mong đợi trong các trình duyệt theo hai cách. Thứ nhất, [CLDR có ngày bắt đầu sai cho kỷ nguyên Minh Trị](https://unicode-org.atlassian.net/browse/CLDR-11375), khiến các triển khai lịch mở rộng kỷ nguyên Minh Trị xa hơn về quá khứ so với thực tế. Thứ hai, [Đề xuất kỷ nguyên và monthCode của Intl](https://tc39.es/proposal-intl-era-monthcode/) sắp tới chỉ định rằng các ngày trước 1873-01-01 ISO nên sử dụng kỷ nguyên Gregorian, nhưng các trình duyệt theo truyền thống đã sử dụng các xấp xỉ của các kỷ nguyên Nhật Bản trước đó. Lịch `japanese` được đưa vào sử dụng vào ngày 1 tháng 1 năm 6 Minh Trị / 1873-01-01 ISO, vì vậy những vấn đề này chỉ ảnh hưởng đến các ngày proleptic.

- Các [lịch được chỉ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) khác: `chinese`, `dangi`, `iso8601`, không sử dụng kỷ nguyên và trả về `undefined`.

Set accessor của `era` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} để tạo đối tượng `Temporal.PlainDate` mới với giá trị mong muốn. Khi thiết lập kỷ nguyên, các bí danh `"ad"` và `"bc"` cũng được chấp nhận cho kỷ nguyên `"ce"` và `"bce"` của lịch `gregory` hoặc `japanese`.

> [!NOTE]
> Chuỗi này không dành để hiển thị cho người dùng. Sử dụng {{jsxref("Temporal/PlainDate/toLocaleString", "toLocaleString()")}} với các tùy chọn thích hợp để lấy chuỗi được bản địa hóa.

## Ví dụ

### Sử dụng era

```js
const date = Temporal.PlainDate.from("2021-07-01"); // lịch ISO 8601
console.log(date.era); // undefined

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=gregory]");
console.log(date2.era); // ce

const date3 = Temporal.PlainDate.from("-002021-07-01[u-ca=gregory]");
console.log(date3.era); // bce

const date4 = Temporal.PlainDate.from("2021-07-01[u-ca=japanese]");
console.log(date4.era); // reiwa
```

### Thay đổi era

Bạn chỉ có thể đặt `era` cho các lịch hỗ trợ chúng. Ví dụ, lịch ISO 8601 không có kỷ nguyên. Lưu ý rằng bạn phải cung cấp `era` và `eraYear` cùng nhau.

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
- {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}
