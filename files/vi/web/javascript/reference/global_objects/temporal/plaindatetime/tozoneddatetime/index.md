---
title: Temporal.PlainDateTime.prototype.toZonedDateTime()
short-title: toZonedDateTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/toZonedDateTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.toZonedDateTime
sidebar: jsref
---

Phương thức **`toZonedDateTime()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một instance {{jsxref("Temporal.ZonedDateTime")}} mới đại diện cho cùng ngày-giờ như đối tượng ngày-giờ thuần túy này, nhưng trong múi giờ được chỉ định.

## Cú pháp

```js-nolint
toZonedDateTime(timeZone)
toZonedDateTime(timeZone, options)
```

### Tham số

- `timeZone`
  - : Một chuỗi hoặc một instance {{jsxref("Temporal.ZonedDateTime")}} đại diện cho múi giờ cần sử dụng. Nếu là instance `Temporal.ZonedDateTime`, múi giờ của nó sẽ được dùng. Nếu là chuỗi, có thể là tên định danh múi giờ, định danh múi giờ theo offset, hoặc một chuỗi ngày-giờ có chứa định danh múi giờ hay offset (xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `disambiguation` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi giờ địa phương này tương ứng với không hoặc nhiều hơn một thời điểm trong múi giờ, thường do thay đổi giờ mùa hè (daylight saving time). Các giá trị có thể là `"compatible"`, `"earlier"`, `"later"`, và `"reject"`. Mặc định là `"compatible"`. Để biết thêm thông tin về các giá trị này, xem [sự mập mờ và khoảng trống từ giờ địa phương sang UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time).

### Giá trị trả về

Một instance {{jsxref("Temporal.ZonedDateTime")}} mới đại diện cho cùng ngày-giờ như đối tượng ngày-giờ thuần túy này, nhưng trong múi giờ được chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Bất kỳ tùy chọn nào không hợp lệ.
    - `timeZone` không phải là định danh múi giờ hợp lệ.
    - Giờ địa phương không rõ ràng trong múi giờ và `options.disambiguation` được đặt thành `"reject"`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu bất kỳ đối số nào không đúng kiểu dự kiến.

## Ví dụ

### Sử dụng toZonedDateTime()

```js
const dt = Temporal.PlainDateTime.from("2021-08-01T12:34:56");
const zdt = dt.toZonedDateTime("America/New_York");
console.log(zdt.toString()); // '2021-08-01T12:34:56-04:00[America/New_York]'

const dt2 = Temporal.PlainDateTime.from("2021-01-01T12:34:56");
const zdt2 = dt2.toZonedDateTime("America/New_York");
console.log(zdt2.toString()); // '2021-01-01T12:34:56-05:00[America/New_York]'
```

### Xử lý giờ mập mờ

Dưới đây, chúng ta có hai giờ địa phương mà chúng ta muốn diễn giải trong múi giờ `America/New_York`. Giờ đầu tiên, `dtNotExist`, không bao giờ tồn tại do thay đổi giờ mùa hè về phía trước, vì vậy chúng ta cần chọn giữa `01:05:00-05:00` hoặc `03:05:00-04:00`. Giờ thứ hai, `dtAmbiguous`, xuất hiện hai lần do thay đổi giờ mùa hè về phía sau, vì vậy chúng ta cần chọn giữa `01:05:00-04:00` hoặc `01:05:00-05:00`. Để giải thích chi tiết hơn về tình huống này, xem [sự mập mờ và khoảng trống từ giờ địa phương sang UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time).

```js
const dtNotExist = Temporal.PlainDateTime.from("2024-03-10T02:05:00");
const dtAmbiguous = Temporal.PlainDateTime.from("2024-11-03T01:05:00");

// Default: compatible
console.log(dtNotExist.toZonedDateTime("America/New_York").toString());
// '2024-03-10T03:05:00-04:00[America/New_York]'
console.log(dtAmbiguous.toZonedDateTime("America/New_York").toString());
// '2024-11-03T01:05:00-04:00[America/New_York]'

// Use the earlier time for ambiguous times
console.log(
  dtNotExist
    .toZonedDateTime("America/New_York", { disambiguation: "earlier" })
    .toString(),
);
// '2024-03-10T01:05:00-05:00[America/New_York]'
console.log(
  dtAmbiguous
    .toZonedDateTime("America/New_York", { disambiguation: "earlier" })
    .toString(),
);
// '2024-11-03T01:05:00-04:00[America/New_York]'

// Use the later time for ambiguous times
console.log(
  dtNotExist
    .toZonedDateTime("America/New_York", { disambiguation: "later" })
    .toString(),
);
// '2024-03-10T03:05:00-04:00[America/New_York]'
console.log(
  dtAmbiguous
    .toZonedDateTime("America/New_York", { disambiguation: "later" })
    .toString(),
);
// '2024-11-03T01:05:00-05:00[America/New_York]'

// Throw an error for ambiguous times
dtNotExist.toZonedDateTime("America/New_York", { disambiguation: "reject" });
// RangeError: instant is ambiguous
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/PlainDateTime/toPlainDate", "Temporal.PlainDateTime.prototype.toPlainDate()")}}
- {{jsxref("Temporal/PlainDateTime/toPlainTime", "Temporal.PlainDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainDateTime", "Temporal.ZonedDateTime.prototype.toPlainDateTime()")}}
