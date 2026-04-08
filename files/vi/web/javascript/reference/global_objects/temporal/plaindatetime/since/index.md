---
title: Temporal.PlainDateTime.prototype.since()
short-title: since()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/since
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.since
sidebar: jsref
---

Phương thức **`since()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một ngày-giờ khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}) đến ngày-giờ này. Khoảng thời gian là dương nếu ngày-giờ kia đứng trước ngày-giờ này, và âm nếu đứng sau.

Phương thức này thực hiện `this - other`. Để thực hiện `other - this`, hãy sử dụng phương thức {{jsxref("Temporal/PlainDateTime/until", "until()")}}.

## Cú pháp

```js-nolint
since(other)
since(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainDateTime")}} đại diện cho một ngày-giờ cần trừ khỏi ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.PlainDateTime` bằng thuật toán tương tự như {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}. Phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}, bao gồm `largestUnit`, `roundingIncrement`, `roundingMode`, và `smallestUnit`. `largestUnit` và `smallestUnit` chấp nhận tất cả các đơn vị có thể. Đối với `largestUnit`, giá trị mặc định `"auto"` có nghĩa là `"days"` hoặc `smallestUnit`, tùy giá trị nào lớn hơn. Đối với `smallestUnit`, giá trị mặc định là `"nanoseconds"`. Ngày hiện tại được sử dụng làm tùy chọn `relativeTo`. Lưu ý rằng việc sử dụng [các đơn vị lớn hơn `"days"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) có thể khiến khoảng thời gian không thể chuyển đổi được sang các lịch hoặc ngày khác.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian _kể từ_ `other` đến ngày-giờ này. Khoảng thời gian là dương nếu `other` đứng trước ngày-giờ này, và âm nếu đứng sau.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng since()

```js
let lastBilling = Temporal.PlainDateTime.from({
  year: Temporal.Now.plainDateISO().year,
  month: 4,
  day: 1,
});
const now = Temporal.Now.plainDateTimeISO().round("second");
if (Temporal.PlainDateTime.compare(lastBilling, now) > 0) {
  lastBilling = lastBilling.subtract({ years: 1 });
}
const duration = now.since(lastBilling);
console.log(`${duration.toLocaleString("en-US")} since last billing`);
// Expected output: "[number] days, [number] hr, [number] min, [number] sec since last billing"

const duration2 = now.since(lastBilling, { smallestUnit: "days" });
console.log(`${duration2.toLocaleString("en-US")} since last billing`);
// Expected output: "[number] days since last billing"

const duration3 = now.since(lastBilling, {
  largestUnit: "years",
  smallestUnit: "days",
});
console.log(`${duration3.toLocaleString("en-US")} since last billing`);
// Expected output: "[number] months, [number] days since last billing"
```

### Làm tròn kết quả

Theo mặc định, phần thập phân của `smallestUnit` bị cắt bỏ. Bạn có thể làm tròn lên bằng cách sử dụng các tùy chọn `roundingIncrement` và `roundingMode`.

```js
const dt1 = Temporal.PlainDateTime.from("2022-01-01T00:00:00");
const dt2 = Temporal.PlainDateTime.from("2022-01-28T12:34:56");
const duration = dt2.since(dt1, {
  smallestUnit: "days",
  roundingIncrement: 5,
  roundingMode: "ceil",
});
console.log(duration.toString()); // "P30D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDateTime/until", "Temporal.PlainDateTime.prototype.until()")}}
