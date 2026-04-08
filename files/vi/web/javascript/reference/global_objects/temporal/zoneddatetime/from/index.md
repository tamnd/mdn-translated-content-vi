---
title: Temporal.ZonedDateTime.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.ZonedDateTime.from()`** tạo đối tượng `Temporal.ZonedDateTime` mới từ một đối tượng `Temporal.ZonedDateTime` khác, một đối tượng có các thuộc tính ngày, giờ và múi giờ, hoặc một chuỗi theo định dạng [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.ZonedDateTime.from(info)
Temporal.ZonedDateTime.from(info, options)
```

### Tham số

- `info`
  - : Một trong những dạng sau:
    - Một thực thể {{jsxref("Temporal.ZonedDateTime")}}, tạo bản sao của thực thể đó.
    - Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format) chứa ngày, tùy chọn có giờ, tùy chọn có offset, chú thích múi giờ, và tùy chọn có lịch.
    - Một đối tượng chứa các thuộc tính được chấp nhận bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}} (`calendar`, `era`, `eraYear`, `year`, `month`, `monthCode`, `day`) hoặc {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}} (`hour`, `minute`, `second`, `millisecond`, `microsecond`, `nanosecond`). Thông tin cần chỉ định rõ năm (dưới dạng `year` hoặc `era` và `eraYear`), tháng (dưới dạng `month` hoặc `monthCode`), và ngày; các trường còn lại là tùy chọn và sẽ được đặt về giá trị mặc định. Cần cung cấp thêm các thuộc tính sau:
      - `timeZone`
        - : Một chuỗi hoặc thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu thị múi giờ cần sử dụng. Nếu là thực thể `Temporal.ZonedDateTime`, múi giờ của nó sẽ được dùng. Nếu là chuỗi, có thể là định danh múi giờ có tên, định danh múi giờ theo offset, hoặc chuỗi ngày-giờ chứa định danh múi giờ hoặc offset (xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm). Các thuộc tính giờ được diễn giải trong múi giờ này.
      - `offset` {{optional_inline}}
        - : Một chuỗi offset, cùng định dạng với offset trong [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format) nhưng có các thành phần giây và phân giây tùy chọn (`±HH:mm:ss.sssssssss`), biểu thị offset so với UTC. Nếu bỏ qua, sẽ được tính toán từ múi giờ và ngày-giờ. `"Z"` không được phép.
- `options` {{optional_inline}}
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
    - `disambiguation` {{optional_inline}}
      - : Cách xử lý khi ngày-giờ địa phương không rõ ràng trong múi giờ đã cho (có nhiều hơn một thời điểm với giờ địa phương đó, hoặc giờ địa phương không tồn tại). Các giá trị có thể là `"compatible"`, `"earlier"`, `"later"`, và `"reject"`. Mặc định là `"compatible"`. Để biết thêm về các giá trị này, xem [tính mơ hồ và khoảng trống từ giờ địa phương đến UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time).
    - `offset` {{optional_inline}}
      - : Cách xử lý khi offset được cung cấp rõ ràng trong `info` nhưng offset không hợp lệ cho múi giờ đã cho tại giờ địa phương đó. Các giá trị có thể là `"use"`, `"ignore"`, `"reject"`, và `"prefer"`. Mặc định là `"reject"`. Để biết thêm về các giá trị này, xem [tính mơ hồ về offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#offset_ambiguity).
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi (khi dùng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Ném {{jsxref("RangeError")}} nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới, biểu thị ngày và giờ được chỉ định bởi `info` trong `calendar` và `timeZone` đã cho.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - `info` không phải là đối tượng hay chuỗi.
    - `options` không phải là đối tượng hay `undefined`.
    - Các thuộc tính được cung cấp không đủ để xác định rõ ràng một ngày. Thường cần cung cấp `year` (hoặc `era` và `eraYear`), `month` (hoặc `monthCode`), và `day`.
- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng một thành phần nhưng không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt là `"reject"`.
    - Giờ đồng hồ tường không rõ ràng trong múi giờ, và `options.disambiguation` được đặt là `"reject"`.
    - Thông tin không nằm trong [phạm vi có thể biểu thị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, tính từ Unix epoch.

## Ví dụ

### Tạo ZonedDateTime từ đối tượng

```js
// Năm + tháng + ngày + giờ + phút + giây
const zdt = Temporal.ZonedDateTime.from({
  timeZone: "America/New_York",
  year: 2021,
  month: 7,
  day: 1,
  hour: 12,
  minute: 34,
  second: 56,
});
console.log(zdt.toString()); // "2021-07-01T12:34:56-04:00[America/New_York]"
```

### Tạo ZonedDateTime từ chuỗi

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56-04:00[America/New_York]",
);
console.log(zdt.toLocaleString()); // "7/1/2021, 12:34:56 PM EDT" (giả sử locale en-US)

// Giờ được đưa ra theo UTC, và chuyển đổi sang giờ địa phương
const zdt2 = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56Z[America/New_York]",
);
console.log(zdt2.toString()); // "2021-07-01T08:34:56-04:00[America/New_York]"
```

### Tạo ZonedDateTime từ chuỗi ISO 8601 / RFC 3339

Lưu ý rằng `Temporal.ZonedDateTime.from()` từ chối các chuỗi ISO 8601 không bao gồm định danh múi giờ. Điều này nhằm đảm bảo múi giờ luôn được biết và có thể dùng để suy ra các offset khác nhau khi giờ địa phương thay đổi.

Nếu muốn phân tích chuỗi ISO 8601, trước tiên hãy xây dựng đối tượng {{jsxref("Temporal.Instant")}} và sau đó chuyển đổi nó thành đối tượng `Temporal.ZonedDateTime`. Bạn có thể cung cấp bất kỳ múi giờ nào, ngay cả khi nó không khớp với offset được đưa ra ban đầu trong chuỗi, và giờ địa phương sẽ được điều chỉnh tương ứng.

```js
const isoString = "2021-07-01T12:34:56+02:00";
const instant = Temporal.Instant.from(isoString);
const zdt = instant.toZonedDateTimeISO("America/New_York");
console.log(zdt.toString()); // "2021-07-01T06:34:56-04:00[America/New_York]"
```

### Xử lý tính mơ hồ về giờ địa phương

Xem [tính mơ hồ và khoảng trống từ giờ địa phương đến UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) để có phần giới thiệu về tình huống này.

```js
const localTimeNotExist = "2024-03-10T02:05:00[America/New_York]";
// Với các giờ không tồn tại, "compatible" tương đương với "later"
const zdt = Temporal.ZonedDateTime.from(localTimeNotExist);
console.log(zdt.toString()); // "2024-03-10T03:05:00-04:00[America/New_York]"

const zdt2 = Temporal.ZonedDateTime.from(localTimeNotExist, {
  disambiguation: "earlier",
});
console.log(zdt2.toString()); // "2024-03-10T01:05:00-05:00[America/New_York]"

const localTimeAmbiguous = "2024-11-03T01:05:00[America/New_York]";
// Với các giờ mơ hồ, "compatible" tương đương với "earlier"
const zdt3 = Temporal.ZonedDateTime.from(localTimeAmbiguous);
console.log(zdt3.toString()); // "2024-11-03T01:05:00-04:00[America/New_York]"

const zdt4 = Temporal.ZonedDateTime.from(localTimeAmbiguous, {
  disambiguation: "later",
});
console.log(zdt4.toString()); // "2024-11-03T01:05:00-05:00[America/New_York]"
```

### Giải quyết tính mơ hồ về offset

Xem [tính mơ hồ về offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#offset_ambiguity) để có phần giới thiệu về tình huống này.

```js
const offsetAmbiguous = "2019-12-23T12:00:00-02:00[America/Sao_Paulo]";

Temporal.ZonedDateTime.from(offsetAmbiguous);
// RangeError: date-time can't be represented in the given time zone
Temporal.ZonedDateTime.from(offsetAmbiguous, { offset: "use" }).toString();
// "2019-12-23T11:00:00-03:00[America/Sao_Paulo]"
Temporal.ZonedDateTime.from(offsetAmbiguous, { offset: "ignore" }).toString();
// "2019-12-23T12:00:00-03:00[America/Sao_Paulo]"
```

Để xem thêm ví dụ, đặc biệt liên quan đến các lịch khác nhau và cài đặt overflow, xem {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}} và {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "Temporal.ZonedDateTime()")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
