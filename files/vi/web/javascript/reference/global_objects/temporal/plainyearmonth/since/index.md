---
title: Temporal.PlainYearMonth.prototype.since()
short-title: since()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/since
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.since
sidebar: jsref
---

Phương thức **`since()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ một year-month khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}) đến year-month này. Khoảng thời gian là dương nếu tháng kia trước tháng này, và âm nếu sau.

Phương thức này thực hiện `this - other`. Để thực hiện `other - this`, hãy dùng phương thức {{jsxref("Temporal/PlainYearMonth/until", "until()")}}.

## Cú pháp

```js-nolint
since(other)
since(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainYearMonth")}} đại diện cho một year-month cần trừ từ year-month này. Nó được chuyển đổi thành đối tượng `Temporal.PlainYearMonth` bằng thuật toán tương tự như {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}. Nó phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}, bao gồm `largestUnit`, `roundingIncrement`, `roundingMode` và `smallestUnit`. `largestUnit` và `smallestUnit` chỉ chấp nhận các đơn vị: `"years"`, `"months"`, hoặc dạng số ít của chúng. Đối với `largestUnit`, giá trị mặc định `"auto"` có nghĩa là `"years"`. Đối với `smallestUnit`, giá trị mặc định là `"months"`. Ngày hiện tại được dùng làm tùy chọn `relativeTo`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian _kể từ_ `other` đến year-month này. Khoảng thời gian là dương nếu `other` trước year-month này, và âm nếu sau.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng since()

```js
const lastUpdated = Temporal.PlainYearMonth.from("2022-01");
const now = Temporal.Now.plainDateISO().toPlainYearMonth();
const duration = now.since(lastUpdated);
console.log(`Last updated ${duration.toLocaleString("en-US")} ago`);
// Expected output: "Last updated [number] years, [number] months ago"

const duration2 = now.since(lastUpdated, { largestUnit: "months" });
console.log(`Last updated ${duration2.toLocaleString("en-US")} ago`);
// Expected output: "Last updated [number] months ago"

const duration3 = now.since(lastUpdated, { smallestUnit: "years" });
console.log(`Last updated ${duration3.toLocaleString("en-US")} ago`);
// Expected output: "Last updated [number] years ago"
```

### Làm tròn kết quả

Theo mặc định, phần thập phân của `smallestUnit` bị cắt bớt. Bạn có thể làm tròn lên bằng cách dùng các tùy chọn `roundingIncrement` và `roundingMode`.

```js
const ym1 = Temporal.PlainYearMonth.from("2022-01");
const ym2 = Temporal.PlainYearMonth.from("2022-11");
const duration = ym2.since(ym1, {
  smallestUnit: "years",
  roundingMode: "ceil",
});
console.log(duration.toString()); // "P1Y"
```

### Lấy kết quả theo ngày

Theo mặc định, kết quả khoảng thời gian không bao giờ chứa ngày, vì `PlainYearMonth` không cung cấp độ chính xác ở mức ngày. Bạn có thể lấy kết quả theo ngày bằng cách chuyển đổi sang {{jsxref("Temporal.PlainDate")}} trước với một ngày rõ ràng.

```js
const ym1 = Temporal.PlainYearMonth.from("2022-01");
const ym2 = Temporal.PlainYearMonth.from("2022-11");
const duration = ym2.toPlainDate({ day: 1 }).since(ym1.toPlainDate({ day: 1 }));
console.log(duration.toString()); // "P304D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
- {{jsxref("Temporal/PlainYearMonth/until", "Temporal.PlainYearMonth.prototype.until()")}}
