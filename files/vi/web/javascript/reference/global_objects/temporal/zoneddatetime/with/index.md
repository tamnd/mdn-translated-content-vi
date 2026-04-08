---
title: Temporal.ZonedDateTime.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.with
sidebar: jsref
---

Phương thức **`with()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho các trường của ngày-giờ.

Để thay thế thuộc tính {{jsxref("Temporal/ZonedDateTime/calendarId", "calendarId")}}, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/withCalendar", "withCalendar()")}}. Để thay thế thuộc tính {{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}}, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/withTimeZone", "withTimeZone()")}}.

## Cú pháp

```js-nolint
with(info)
with(info, options)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận dạng bởi {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}} (ngoại trừ `calendar` và `timeZone`): `day`, `era` và `eraYear`, `hour`, `microsecond`, `millisecond`, `minute`, `month`, `monthCode`, `nanosecond`, `offset`, `second`, `year`. Các thuộc tính không được chỉ định sẽ sử dụng các giá trị từ ngày-giờ ban đầu. Bạn chỉ cần cung cấp một trong `month` hoặc `monthCode`, và một trong `era` và `eraYear` hoặc `year`, và giá trị còn lại sẽ được cập nhật tương ứng.
- `options` {{optional_inline}}
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
    - `disambiguation` {{optional_inline}}
      - : Hành động khi ngày-giờ địa phương không rõ ràng trong múi giờ đã cho (có nhiều hơn một thời điểm với giờ địa phương như vậy, hoặc giờ địa phương không tồn tại). Các giá trị có thể là `"compatible"`, `"earlier"`, `"later"` và `"reject"`. Mặc định là `"compatible"`. Để biết thêm thông tin về các giá trị này, hãy xem [sự mơ hồ và khoảng trống từ giờ địa phương đến UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time).
    - `offset` {{optional_inline}}
      - : Hành động khi offset được cung cấp rõ ràng trong `info` nhưng offset không hợp lệ cho múi giờ đã cho tại giờ địa phương đã cho. Các giá trị có thể là `"use"`, `"ignore"`, `"reject"` và `"prefer"`. Mặc định là `"prefer"`. Để biết thêm thông tin về các giá trị này, hãy xem [sự mơ hồ của offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#offset_ambiguity).
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi (khi sử dụng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày bị [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại của các trường được sao chép từ ngày-giờ ban đầu.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là một đối tượng.
    - `options` không phải là một đối tượng hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp mà chỉ định cùng một thành phần không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.
    - Giờ đồng hồ được biểu thị bởi các thuộc tính được cung cấp không rõ ràng trong múi giờ, và `options.disambiguation` được đặt thành `"reject"`.
    - Kết quả không nằm trong [phạm vi có thể biểu thị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273,972.6 năm, từ Unix epoch.

## Ví dụ

### Sử dụng with()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56[America/New_York]",
);
const newZDT = zdt.with({ hour: 13 });
console.log(newZDT.toString()); // "2021-07-01T13:34:56-04:00[America/New_York]"
```

Để biết thêm ví dụ, hãy xem tài liệu về từng thuộc tính riêng lẻ có thể được đặt bằng `with()`.

### Offset trong quá trình thay đổi ngày

Theo mặc định, tùy chọn `offset` được đặt thành `"prefer"`, nghĩa là chúng ta sử dụng offset ban đầu (hoặc offset được cung cấp trong `info`) nếu hợp lệ, và tính toán lại nếu không. Điều này có nghĩa là nếu bạn chuyển sang ngày khác có offset khác do chuyển đổi DST, offset sẽ được tính toán lại:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-04:00[America/New_York]",
);
const newZDT = zdt.with({ month: 12 });
// The offset is recalculated to -05:00
console.log(newZDT.toString()); // "2021-12-01T12:00:00-05:00[America/New_York]"
```

Và nếu bạn đặt thời gian vào trong quá trình chuyển đổi DST, offset được sử dụng để giải quyết sự mơ hồ:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2024-11-02T01:05:00-04:00[America/New_York]",
);
const newZDT = zdt.with({ day: 3 });
console.log(newZDT.toString()); // "2024-11-03T01:05:00-04:00[America/New_York]"

const zdt2 = Temporal.ZonedDateTime.from(
  "2024-11-04T01:05:00-05:00[America/New_York]",
);
const newZDT2 = zdt2.with({ day: 3 });
console.log(newZDT2.toString()); // "2024-11-03T01:05:00-05:00[America/New_York]"
```

Nếu bạn sử dụng `offset: "use"`, thì offset sẽ được sử dụng nguyên trạng để lấy thời gian chính xác trước, và _sau đó_ tính toán lại offset:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-04:00[America/New_York]",
);
const newZDT = zdt.with({ month: 12 }, { offset: "use" });
// The offset is recalculated to -05:00, but the wall-clock time changes
console.log(newZDT.toString()); // "2021-12-01T11:00:00-05:00[America/New_York]"
```

Bạn cũng có thể đặt `offset: "reject"` để ném lỗi nếu offset ban đầu không hợp lệ, buộc phải chỉ định rõ ràng offset mới:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-04:00[America/New_York]",
);
zdt.with({ month: 12 }, { offset: "reject" });
// RangeError: date-time can't be represented in the given time zone
zdt.with({ month: 12, offset: "-05:00" }, { offset: "reject" }).toString();
// "2021-12-01T12:00:00-05:00[America/New_York]"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/withCalendar", "Temporal.ZonedDateTime.prototype.withCalendar()")}}
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
- {{jsxref("Temporal/ZonedDateTime/withPlainTime", "Temporal.ZonedDateTime.prototype.withPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
