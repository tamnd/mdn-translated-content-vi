---
title: Temporal.PlainDate.prototype.since()
short-title: since()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/since
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.since
sidebar: jsref
---

Phương thức **`since()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ một ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}) đến ngày này. Khoảng thời gian là dương nếu ngày kia trước ngày này, và âm nếu sau.

Phương thức này thực hiện `this - other`. Để thực hiện `other - this`, sử dụng phương thức {{jsxref("Temporal/PlainDate/until", "until()")}}.

## Cú pháp

```js-nolint
since(other)
since(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.PlainDate")}} biểu diễn một ngày để trừ từ ngày này. Nó được chuyển đổi thành đối tượng `Temporal.PlainDate` bằng cùng thuật toán như {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}. Phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}, bao gồm `largestUnit`, `roundingIncrement`, `roundingMode`, và `smallestUnit`. `largestUnit` và `smallestUnit` chỉ chấp nhận các đơn vị: `"years"`, `"months"`, `"weeks"`, `"days"`, hoặc dạng số ít của chúng. Đối với `largestUnit`, giá trị mặc định `"auto"` có nghĩa là `"days"` hoặc `smallestUnit`, tùy cái nào lớn hơn. Đối với `smallestUnit`, giá trị mặc định là `"days"`. Ngày hiện tại được dùng làm tùy chọn `relativeTo`. Lưu ý rằng việc sử dụng [các đơn vị lớn hơn `"days"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) có thể làm cho khoảng thời gian không thể chuyển đổi sang các lịch hoặc ngày khác.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian _kể từ_ `other` đến ngày này. Khoảng thời gian là dương nếu `other` trước ngày này, và âm nếu sau.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng since()

```js
const date = Temporal.PlainDate.from("2022-12-25");
const now = Temporal.Now.plainDateISO();
const duration = now.since(date);
const formatter = new Intl.DurationFormat("en-US", { style: "long" });
console.log(`It's been ${formatter.format(duration)} since that Christmas...`);
// Đầu ra dự kiến: "It's been [number] days since that Christmas..."

const duration2 = now.since(date, { smallestUnit: "months" });
console.log(`It's been ${formatter.format(duration2)} since that Christmas...`);
// Đầu ra dự kiến: "It's been [number] months since that Christmas..."

const duration3 = now.since(date, {
  largestUnit: "years",
  smallestUnit: "months",
});
console.log(`It's been ${formatter.format(duration3)} since that Christmas...`);
// Đầu ra dự kiến: "It's been [number] years, [number] months since that Christmas..."
```

### Làm tròn kết quả

Theo mặc định phần thập phân của `smallestUnit` bị cắt bỏ. Bạn có thể làm tròn lên bằng các tùy chọn `roundingIncrement` và `roundingMode`.

```js
const date1 = Temporal.PlainDate.from("2022-01-01");
const date2 = Temporal.PlainDate.from("2022-01-28");
const duration = date2.since(date1, {
  smallestUnit: "days",
  roundingIncrement: 5,
  roundingMode: "ceil",
});
console.log(duration.toString()); // "P30D"
```

### So sánh các lịch khác nhau

Theo mặc định, hai ngày phải có cùng lịch. Điều này để tránh mơ hồ trong ý nghĩa của tháng và năm. Nếu bạn muốn so sánh ngày từ các lịch khác nhau, bạn có thể chuyển đổi chúng về cùng lịch trước.

```js
const date1 = Temporal.PlainDate.from("2022-01-01");
const date2 = Temporal.PlainDate.from("2022-01-28[u-ca=chinese]");
const duration = date2.withCalendar("iso8601").since(date1);
console.log(duration.toString()); // "P27D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/until", "Temporal.PlainDate.prototype.until()")}}
