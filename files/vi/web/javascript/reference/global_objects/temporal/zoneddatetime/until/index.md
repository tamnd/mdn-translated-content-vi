---
title: Temporal.ZonedDateTime.prototype.until()
short-title: until()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/until
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.until
sidebar: jsref
---

Phương thức **`until()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu thị khoảng thời gian từ ngày-giờ này đến một ngày-giờ khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}). Khoảng thời gian là dương nếu ngày-giờ kia sau ngày-giờ này, và âm nếu trước.

Phương thức này thực hiện `other - this`. Để thực hiện `this - other`, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/since", "since()")}}.

## Cú pháp

```js-nolint
until(other)
until(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu thị ngày-giờ cần trừ từ ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.ZonedDateTime` bằng cùng thuật toán như {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}. Nó phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Các tùy chọn tương tự như [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/since#options).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới biểu thị khoảng thời gian từ ngày-giờ này _đến_ `other`. Khoảng thời gian là dương nếu `other` sau ngày-giờ này, và âm nếu trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.
    - `other` có múi giờ khác với `this`, và `largestUnit` là `"days"` hoặc lớn hơn.

## Ví dụ

### Sử dụng until()

```js
const flight = Temporal.ZonedDateTime.from(
  "2024-12-21T13:31:00-05:00[America/New_York]",
);
const now = Temporal.Now.zonedDateTimeISO("America/New_York").round("second");
if (Temporal.ZonedDateTime.compare(flight, now) < 0) {
  console.error(
    "The flight is already in the past. The result may not make sense.",
  );
}
const duration = now.until(flight, { largestUnit: "days" });
console.log(`The flight is in ${duration.toLocaleString("en-US")}`);
```

Để biết thêm ví dụ, xem [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/since).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/since", "Temporal.ZonedDateTime.prototype.since()")}}
