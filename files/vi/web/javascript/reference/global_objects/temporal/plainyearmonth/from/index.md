---
title: Temporal.PlainYearMonth.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainYearMonth.from()`** tạo một đối tượng `Temporal.PlainYearMonth` mới từ một đối tượng `Temporal.PlainYearMonth` khác, một đối tượng có thuộc tính year và month, hoặc một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.PlainYearMonth.from(info)
Temporal.PlainYearMonth.from(info, options)
```

### Tham số

- `info`
  - : Một trong các giá trị sau:
    - Một thực thể {{jsxref("Temporal.PlainYearMonth")}}, tạo ra một bản sao của thực thể.
    - Một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth#rfc_9557_format) chứa ngày và tùy chọn lịch. Nếu lịch không phải `iso8601`, cần có ngày.
    - Một đối tượng chứa các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
      - `calendar` {{optional_inline}}
        - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/PlainYearMonth/calendarId", "calendarId")}}. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`. Tất cả các thuộc tính khác được giải thích trong hệ thống lịch này (khác với constructor {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}}, giải thích các giá trị trong hệ thống lịch ISO).
      - `era` và `eraYear`
        - : Một chuỗi và một số nguyên tương ứng với các thuộc tính {{jsxref("Temporal/PlainYearMonth/era", "era")}} và {{jsxref("Temporal/PlainYearMonth/eraYear", "eraYear")}}. Chỉ được dùng nếu hệ thống lịch có kỷ nguyên. `era` và `eraYear` phải được cung cấp đồng thời. Nếu chúng không được cung cấp, thì `year` phải được cung cấp. Nếu tất cả `era`, `eraYear` và `year` đều được cung cấp, chúng phải nhất quán.
      - `month`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainYearMonth/month", "month")}}. Phải dương bất kể tùy chọn `overflow`.
      - `monthCode`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainYearMonth/monthCode", "monthCode")}}. Nếu không được cung cấp, thì `month` phải được cung cấp. Nếu cả `month` và `monthCode` đều được cung cấp, chúng phải nhất quán.
      - `year`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainYearMonth/year", "year")}}.

- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi (khi sử dụng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainYearMonth` mới, đại diện cho năm và tháng được chỉ định bởi `info` trong `calendar` được chỉ định.

Mỗi `PlainYearMonth` lưu trữ nội bộ một ngày ISO 8601 đầy đủ, có cùng year-month trong lịch đích như những gì được hiển thị. Ngày tham chiếu được hiển thị khi chuỗi hóa với {{jsxref("Temporal/PlainYearMonth/toString", "toString()")}}, xuất ra một ngày ISO. Ngày tham chiếu được chọn tùy ý nhưng nhất quán; nghĩa là, mỗi cặp `(year, month)` luôn ánh xạ đến cùng một ngày ISO tham chiếu. Nó không sử dụng ngày được cung cấp trong đầu vào. Thay vào đó, ngày tham chiếu luôn được chọn là ngày hợp lệ đầu tiên của tháng.

Việc chuẩn hóa ngày tham chiếu này đảm bảo rằng {{jsxref("Temporal/PlainYearMonth/equals", "equals()")}} có thể trực tiếp so sánh các ngày ISO cơ bản mà không cần tính toán thêm.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng hoặc chuỗi.
    - `options` không phải là đối tượng hoặc `undefined`.
    - Các thuộc tính được cung cấp không đủ để xác định rõ ràng một ngày. Bạn thường cần cung cấp `year` (hoặc `era` và `eraYear`) và `month` (hoặc `monthCode`).
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng một thành phần nhưng không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ: nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi và `options.overflow` được đặt là `"reject"`.
    - Thông tin không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, hoặc khoảng ±273.972,6 năm, từ Unix epoch.

## Ví dụ

### Tạo PlainYearMonth từ một đối tượng

```js
// Year + month code
const ym = Temporal.PlainYearMonth.from({ year: 2021, monthCode: "M05" });
console.log(ym.toString()); // 2021-05

// Year + month
const ym2 = Temporal.PlainYearMonth.from({ year: 2021, month: 7 });
console.log(ym2.toString()); // 2021-07

// Year + month in a different calendar
const ym3 = Temporal.PlainYearMonth.from({
  year: 5730,
  month: 6,
  calendar: "hebrew",
});
console.log(ym3.toString()); // 1970-02-07[u-ca=hebrew]

// Year + month code in a different calendar
const ym4 = Temporal.PlainYearMonth.from({
  year: 5730,
  monthCode: "M05L",
  calendar: "hebrew",
});
console.log(ym4.toString()); // 1970-02-07[u-ca=hebrew]
```

### Kiểm soát hành vi tràn

Theo mặc định, các giá trị ngoài phạm vi được kẹp vào phạm vi hợp lệ.

```js
const ym1 = Temporal.PlainYearMonth.from({ year: 2021, month: 13 });
console.log(ym1.toString()); // 2021-12

// 5732 is not a Hebrew leap year, so a different monthCode is chosen
const ym2 = Temporal.PlainYearMonth.from({
  year: 5732,
  monthCode: "M05L",
  calendar: "hebrew",
});
console.log(ym2.toLocaleString("en-US", { calendar: "hebrew" })); // Adar 5732
const underlyingDate = Temporal.PlainDate.from(ym2.toString());
console.log(underlyingDate.year, underlyingDate.monthCode); // 5732 M06
```

Bạn có thể thay đổi hành vi này để ném lỗi thay thế:

```js
Temporal.PlainYearMonth.from({ year: 2021, month: 13 }, { overflow: "reject" });
// RangeError: date value "month" not in 1..12: 13
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/PlainYearMonth", "Temporal.PlainYearMonth()")}}
- {{jsxref("Temporal/PlainYearMonth/with", "Temporal.PlainYearMonth.prototype.with()")}}
