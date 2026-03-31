---
title: Temporal.PlainDate.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainDate.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainDate.from()`** tạo một đối tượng `Temporal.PlainDate` mới từ đối tượng `Temporal.PlainDate` khác, đối tượng có thuộc tính ngày, hoặc chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.PlainDate.from(info)
Temporal.PlainDate.from(info, options)
```

### Tham số

- `info`
  - : Một trong các trường hợp sau:
    - Một instance {{jsxref("Temporal.PlainDate")}}, tạo ra bản sao của instance đó.
    - Một instance {{jsxref("Temporal.PlainDateTime")}}, cung cấp ngày lịch theo cùng cách như {{jsxref("Temporal/PlainDateTime/toPlainDate", "Temporal.PlainDateTime.prototype.toPlainDate()")}}.
    - Một instance {{jsxref("Temporal.ZonedDateTime")}}, cung cấp ngày lịch theo cùng cách như {{jsxref("Temporal/ZonedDateTime/toPlainDate", "Temporal.ZonedDateTime.prototype.toPlainDate()")}}.
    - Một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#rfc_9557_format) chứa ngày và tùy chọn một lịch.
    - Một đối tượng chứa các thuộc tính sau (theo thứ tự chúng được lấy và xác nhận):
      - `calendar` {{optional_inline}}
        - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/calendarId", "calendarId")}}. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`. Tất cả các thuộc tính khác được diễn giải trong hệ thống lịch này (không giống như constructor {{jsxref("Temporal/PlainDate/PlainDate", "Temporal.PlainDate()")}}, diễn giải các giá trị trong hệ thống lịch ISO).
      - `day`
        - : Một số nguyên tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/day", "day")}}. Phải là dương bất kể tùy chọn `overflow`.
      - `era` và `eraYear`
        - : Một chuỗi và một số nguyên tương ứng với các thuộc tính {{jsxref("Temporal/PlainDate/era", "era")}} và {{jsxref("Temporal/PlainDate/eraYear", "eraYear")}}. Chỉ được sử dụng nếu hệ thống lịch có kỷ nguyên. `era` và `eraYear` phải được cung cấp đồng thời. Ít nhất một trong `eraYear` (cùng với `era`) hoặc `year` phải được cung cấp. Nếu tất cả `era`, `eraYear` và `year` đều được cung cấp, chúng phải nhất quán.
      - `month`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/month", "month")}}. Phải là dương bất kể tùy chọn `overflow`. Ít nhất một trong `month` hoặc `monthCode` phải được cung cấp. Nếu cả `month` và `monthCode` đều được cung cấp, chúng phải nhất quán.
      - `monthCode`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}}. Ít nhất một trong `month` hoặc `monthCode` phải được cung cấp. Nếu cả `month` và `monthCode` đều được cung cấp, chúng phải nhất quán.
      - `year`
        - : Tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/year", "year")}}. Ít nhất một trong `eraYear` (cùng với `era`) hoặc `year` phải được cung cấp. Nếu tất cả `era`, `eraYear` và `year` đều được cung cấp, chúng phải nhất quán.

      Thông tin phải chỉ định rõ ràng năm (dưới dạng `year` hoặc `era` và `eraYear`), tháng (dưới dạng `month` hoặc `monthCode`) và ngày.

- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi (khi sử dụng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới, đại diện cho ngày được xác định bởi `info` trong `calendar` được chỉ định.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng hoặc chuỗi.
    - `options` không phải là đối tượng hoặc `undefined`.
    - Các thuộc tính được cung cấp không đủ để xác định rõ ràng một ngày. Bạn thường cần cung cấp `year` (hoặc `era` và `eraYear`), `month` (hoặc `monthCode`) và `day`.
- {{jsxref("RangeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng thành phần không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.
    - Thông tin không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, tức khoảng ±273.972,6 năm, từ Unix epoch.

## Ví dụ

### Tạo PlainDate từ đối tượng

```js
// Năm, tháng và ngày
const d1 = Temporal.PlainDate.from({ year: 2021, month: 7, day: 1 });
console.log(d1.toString()); // "2021-07-01"

// Năm, mã tháng và ngày
const d2 = Temporal.PlainDate.from({ year: 2021, monthCode: "M07", day: 1 });
console.log(d2.toString()); // "2021-07-01"

// Năm, tháng, ngày trong lịch khác
const d3 = Temporal.PlainDate.from({
  year: 2021,
  month: 7,
  day: 1,
  calendar: "hebrew",
});
// Lưu ý: khi bạn xây dựng ngày với đối tượng, các thành phần ngày
// theo *lịch đó*, không phải lịch ISO. Tuy nhiên, toString() luôn
// xuất ngày theo lịch ISO. Ví dụ, năm "2021" trong
// lịch Hebrew thực tế là 1740 TCN theo lịch ISO.
console.log(d3.toString()); // "-001739-03-07[u-ca=hebrew]"

// Kỷ nguyên, năm kỷ nguyên, tháng và ngày
const d4 = Temporal.PlainDate.from({
  era: "meiji",
  eraYear: 4,
  month: 7,
  day: 1,
  calendar: "japanese",
});
console.log(d4.toString()); // "1871-07-01[u-ca=japanese]"
```

### Kiểm soát hành vi tràn số

Theo mặc định, các giá trị ngoài phạm vi được kẹp vào phạm vi hợp lệ:

```js
const d1 = Temporal.PlainDate.from({ year: 2021, month: 13, day: 1 });
console.log(d1.toString()); // "2021-12-01"

const d2 = Temporal.PlainDate.from({ year: 2021, month: 2, day: 29 });
console.log(d2.toString()); // "2021-02-28"

const d3 = Temporal.PlainDate.from("2021-02-29");
console.log(d3.toString()); // "2021-02-28"
```

Bạn có thể thay đổi hành vi này để ném lỗi thay thế:

```js
const d3 = Temporal.PlainDate.from(
  { year: 2021, month: 13, day: 1 },
  { overflow: "reject" },
);
// RangeError: date value "month" not in 1..12: 13
```

### Tạo PlainDate từ chuỗi

```js
const d = Temporal.PlainDate.from("2021-07-01");
console.log(d.toLocaleString("en-US", { dateStyle: "full" }));
// Thursday, July 1, 2021

// Cung cấp lịch
const d2 = Temporal.PlainDate.from("2021-07-01[u-ca=japanese]");
console.log(
  d2.toLocaleString("ja-JP", { calendar: "japanese", dateStyle: "full" }),
);
// 令和3年7月1日木曜日

// Cung cấp giờ và độ lệch (bị bỏ qua)
const d3 = Temporal.PlainDate.from("2021-07-01T00:00+08:00");
console.log(d3.toString()); // "2021-07-01"
```

### Tạo PlainDate từ instance Temporal khác

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:00");
const d = Temporal.PlainDate.from(dt);
console.log(d.toString()); // "2021-07-01"

const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T00:00+08:00[Asia/Shanghai]",
);
const d2 = Temporal.PlainDate.from(zdt);
console.log(d2.toString()); // "2021-07-01"

const d3 = Temporal.PlainDate.from(d);
console.log(d3.toString()); // "2021-07-01"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/PlainDate", "Temporal.PlainDate()")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
