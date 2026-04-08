---
title: Temporal.PlainMonthDay.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainMonthDay.from()`** tạo một đối tượng `Temporal.PlainMonthDay` mới từ một đối tượng `Temporal.PlainMonthDay` khác, một đối tượng có thuộc tính tháng và ngày, hoặc một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.PlainMonthDay.from(info)
Temporal.PlainMonthDay.from(info, options)
```

### Tham số

- `info`
  - : Một trong những điều sau:
    - Một instance {{jsxref("Temporal.PlainMonthDay")}}, tạo ra một bản sao của instance.
    - Một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay#rfc_9557_format) chứa một ngày và tùy chọn một lịch. Nếu lịch không phải `iso8601`, thì năm là bắt buộc.
    - Một đối tượng chứa các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
      - `calendar` {{optional_inline}}
        - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/PlainMonthDay/calendarId", "calendarId")}}. Mặc định là `"iso8601"`. Tất cả các thuộc tính khác được diễn giải trong hệ thống lịch này (không giống như constructor {{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "Temporal.PlainMonthDay()")}}, vốn diễn giải các giá trị trong hệ thống lịch ISO). Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.
      - `day`
        - : Một số nguyên tương ứng với thuộc tính {{jsxref("Temporal/PlainMonthDay/day", "day")}}. Phải dương bất kể tùy chọn `overflow`.
      - `era` và `eraYear`
        - : Một chuỗi và một số nguyên có thể được dùng thay cho `year`. Xem {{jsxref("Temporal/PlainDate/era", "era")}} và {{jsxref("Temporal/PlainDate/eraYear", "eraYear")}} của `PlainDate`. Chỉ được dùng nếu hệ thống lịch có kỷ nguyên. `era` và `eraYear` phải được cung cấp đồng thời. Nếu `month` được chỉ định, ít nhất một trong số `eraYear` (cùng với `era`) hoặc `year` phải được cung cấp. Nếu tất cả `era`, `eraYear` và `year` đều được cung cấp, chúng phải nhất quán.
      - `month`
        - : Một số nguyên dương có thể được dùng thay cho `monthCode`. Xem {{jsxref("Temporal/PlainDate/month", "month")}} của `PlainDate`. Phải dương bất kể tùy chọn `overflow`. Nếu `month` được cung cấp, và lịch không phải `iso8601`, thì `year` (hoặc `eraYear` cùng với `era` như một sự thay thế) phải được cung cấp, vì cùng `month` có thể ánh xạ tới nhiều giá trị `monthCode` có thể có trong các năm khác nhau. Ít nhất một trong số `month` hoặc `monthCode` phải được cung cấp. Nếu cả `month` và `monthCode` đều được cung cấp, chúng phải nhất quán.
      - `monthCode`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainMonthDay/monthCode", "monthCode")}}. Ít nhất một trong số `month` hoặc `monthCode` phải được cung cấp. Nếu cả `month` và `monthCode` đều được cung cấp, chúng phải nhất quán.
      - `year`
        - : Một số nguyên dùng để phân biệt `month` nếu được cung cấp, vì đối với một số lịch, cùng `month` có thể có nghĩa là `monthCode` khác nhau trong các năm khác nhau. Xem {{jsxref("Temporal/PlainDate/year", "year")}} của `PlainDate`. Nếu một năm được cung cấp, thì tùy chọn `overflow` xác thực tháng-ngày trong năm đã cho, không phải chỉ trong bất kỳ năm nào. Nếu `month` được chỉ định, ít nhất một trong số `eraYear` (cùng với `era`) hoặc `year` phải được cung cấp. Nếu tất cả `era`, `eraYear` và `year` đều được cung cấp, chúng phải nhất quán.

- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi (khi sử dụng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainMonthDay` mới, đại diện cho tháng và ngày được chỉ định bởi `info` trong `calendar` được chỉ định.

Mỗi `PlainMonthDay` lưu trữ nội bộ một ngày ISO 8601 đầy đủ, có cùng tháng-ngày trong lịch đích như những gì được hiển thị. Năm tham chiếu hiển thị khi chuyển sang chuỗi bằng {{jsxref("Temporal/PlainMonthDay/toString", "toString()")}}, vốn xuất ra một ngày ISO. Năm tham chiếu được chọn tùy ý nhưng nhất quán (nghĩa là, mỗi cặp `(monthCode, day)` luôn ánh xạ tới cùng một năm tham chiếu ISO). Nó không sử dụng năm được cung cấp trong đầu vào. Thay vào đó, năm tham chiếu được chọn bằng cách tìm ngày mới nhất trước ngày 31 tháng 12 năm 1972 có cùng tháng-ngày trong lịch đích, hoặc ngày sớm nhất sau ngày 31 tháng 12 năm 1972 nếu không có ngày nào như vậy.

Ví dụ, đối với các lịch dẫn xuất từ Gregorian, năm tham chiếu là 1972. Đối với lịch Hebrew, năm tham chiếu là 1972 trong lịch Gregorian, nhưng nếu tháng là Adar I (`M05L`), là một tháng nhuận, năm tham chiếu là 1970 (5730 trong lịch Hebrew), vì năm nhuận tiếp theo là 1973 (5733 trong lịch Hebrew), sau năm 1972.

Việc chuẩn hóa năm tham chiếu này đảm bảo rằng {{jsxref("Temporal/PlainMonthDay/equals", "equals()")}} có thể so sánh trực tiếp các ngày ISO bên dưới mà không cần tính toán thêm.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - `info` không phải là đối tượng hay chuỗi.
    - `options` không phải là đối tượng hay `undefined`.
    - Các thuộc tính được cung cấp không đủ để xác định rõ ràng một ngày. Thông thường bạn cần cung cấp `year` (hoặc `era` và `eraYear`), `month` và `day`, hoặc `monthCode` và `day`.
- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng một thành phần nhưng không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.
    - Thông tin không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, hay khoảng ±273.972,6 năm, từ Unix epoch.

## Ví dụ

### Tạo PlainMonthDay từ đối tượng

```js
// Month code + day
const md = Temporal.PlainMonthDay.from({ monthCode: "M05", day: 2 });
console.log(md.toString()); // 05-02

// Month + day (only for ISO calendar)
const md2 = Temporal.PlainMonthDay.from({ month: 7, day: 1 });
console.log(md2.toString()); // 07-01

// Year + month + day
const md3 = Temporal.PlainMonthDay.from({ year: 2021, month: 7, day: 1 });
console.log(md3.toString()); // 07-01

// Year + month + day in a different calendar (where year is required)
const md4 = Temporal.PlainMonthDay.from({
  year: 2021,
  month: 7,
  day: 1,
  calendar: "hebrew",
});
console.log(md4.toString()); // 1972-03-16[u-ca=hebrew]

// Month code + day in a different calendar
const md5 = Temporal.PlainMonthDay.from({
  monthCode: "M05L",
  day: 1,
  calendar: "hebrew",
});
console.log(md5.toString()); // 1970-02-07[u-ca=hebrew]
```

### Kiểm soát hành vi overflow

Theo mặc định, các giá trị ngoài phạm vi được kẹp vào phạm vi hợp lệ. Một tháng-ngày không có năm tham chiếu rõ ràng là hợp lệ miễn là tồn tại một năm mà nó hợp lệ, ngay cả khi nó không xuất hiện mỗi năm. Nếu tất cả năm, tháng và ngày đều được cung cấp, thì các quy tắc ánh xạ tới tháng-ngày hợp lệ có thể phức tạp và đặc thù cho mỗi lịch, nhưng đây là hành vi thông thường:

- Nếu tổ hợp `year`/`month` không hợp lệ, `month` được kẹp để có được một `monthCode` hợp lệ trong năm đó.
- Nếu tổ hợp `year`/`monthCode` không hợp lệ, một năm khác được chọn để giữ nguyên `monthCode`.
- `day` được kẹp trong năm-tháng đã cho để có được một tháng-ngày hợp lệ.

Điều này hơi khác so với [kẹp ngày](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) thông thường, vốn ưu tiên năm hơn mã tháng.

```js
// Month always out of range
const md1 = Temporal.PlainMonthDay.from({ month: 13, day: 1 });
console.log(md1.toString()); // 12-01

// Month out of range for the specific year: 5732 is not a Hebrew leap year,
// so month is clamped to 12 to resolve to a valid monthCode
const md2 = Temporal.PlainMonthDay.from({
  year: 5732,
  month: 13,
  day: 1,
  calendar: "hebrew",
});
console.log(md2.toLocaleString("en-US", { calendar: "hebrew" })); // 1 Elul
const underlyingDate = Temporal.PlainDate.from(md2.toString());
console.log(underlyingDate.year, underlyingDate.month); // 5732 12

// Month code exists but not for the specific year: 5731 is not a Hebrew leap year,
// so a different year is chosen to keep the monthCode as M05L
const md3 = Temporal.PlainMonthDay.from({
  year: 5731,
  monthCode: "M05L",
  day: 1,
  calendar: "hebrew",
});
console.log(md3.toLocaleString("en-US", { calendar: "hebrew" })); // 1 Adar I
const underlyingDate2 = Temporal.PlainDate.from(md3.toString());
console.log(underlyingDate2.year, underlyingDate2.monthCode); // 5730 M05L

// Day always out of range
const md4 = Temporal.PlainMonthDay.from({ month: 2, day: 30 });
console.log(md4.toString()); // 02-29

// Day out of range for the specific year-month
const md5 = Temporal.PlainMonthDay.from({ year: 2021, month: 2, day: 29 });
console.log(md5.toString()); // 02-28
```

Bạn có thể thay đổi hành vi này để ném lỗi thay thế:

```js
Temporal.PlainMonthDay.from(
  { year: 2021, month: 13, day: 1 },
  { overflow: "reject" },
);
// RangeError: date value "month" not in 1..12: 13
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "Temporal.PlainMonthDay()")}}
- {{jsxref("Temporal/PlainMonthDay/with", "Temporal.PlainMonthDay.prototype.with()")}}
