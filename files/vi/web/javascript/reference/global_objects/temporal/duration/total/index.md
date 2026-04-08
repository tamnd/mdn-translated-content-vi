---
title: Temporal.Duration.prototype.total()
short-title: total()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/total
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.total
sidebar: jsref
---

Phương thức **`total()`** của các instance {{jsxref("Temporal.Duration")}} trả về một số biểu diễn tổng duration theo đơn vị đã cho.

## Cú pháp

```js-nolint
total(unit)
total(options)
```

### Tham số

- `unit`
  - : Một chuỗi biểu diễn tùy chọn [`unit`](#unit_2). Đây là cách gọi rút gọn, do đó `total(unit)` tương đương với `total({ unit })`, trong đó `unit` là một chuỗi.
- `options`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `relativeTo` {{optional_inline}}
      - : Một ngày (hoặc ngày giờ) có hoặc không có múi giờ cung cấp thông tin thời gian và lịch để giải quyết các [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (xem liên kết để biết cách diễn giải chung về tùy chọn này). Bắt buộc nếu `this` hoặc `other` là calendar duration, hoặc `unit` là đơn vị lịch.
    - `unit`
      - : Bất kỳ đơn vị thời gian nào: `"years"`, `"months"`, `"weeks"`, `"days"`, `"hours"`, `"minutes"`, `"seconds"`, `"milliseconds"`, `"microseconds"`, `"nanoseconds"`, hoặc dạng số ít của chúng.

### Giá trị trả về

Một số dấu phẩy động biểu diễn tổng duration theo đơn vị đã cho. Có thể không chính xác do giới hạn độ chính xác của dấu phẩy động.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `unit` không được cung cấp hoặc không phải là đơn vị hợp lệ.
    - `this` hoặc `other` là calendar duration, hoặc `unit` là đơn vị lịch, và `relativeTo` không được cung cấp.

## Mô tả

Nếu `relativeTo` được cung cấp, kết quả được tính bằng cách cộng duration vào điểm bắt đầu, tìm sự khác biệt giữa kết quả và điểm bắt đầu (tính bằng nanosecond), rồi chuyển đổi sự khác biệt sang đơn vị yêu cầu bằng cách chia cho số nanosecond phù hợp cho mỗi đơn vị. Cung cấp ngày giờ có múi giờ cũng cho phép tính đến giờ tiết kiệm ánh sáng và các thay đổi múi giờ khác; ngược lại, ngày 24 giờ được giả định.

Nếu `relativeTo` không được cung cấp, kết quả được tính bằng cách chuyển đổi duration sang nanosecond và chia cho số nanosecond phù hợp cho mỗi đơn vị.

## Ví dụ

### Sử dụng total()

```js
const d = Temporal.Duration.from({ hours: 1, minutes: 30 });

console.log(d.total("minutes")); // 90
console.log(d.total("hours")); // 1.5
```

### Tổng của calendar duration

```js
const d = Temporal.Duration.from({ months: 1 });

console.log(
  d.total({ unit: "days", relativeTo: Temporal.PlainDate.from("2021-01-01") }),
); // 31
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}
