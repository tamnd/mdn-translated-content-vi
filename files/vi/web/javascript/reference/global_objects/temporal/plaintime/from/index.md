---
title: Temporal.PlainTime.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainTime.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainTime.from()`** tạo một đối tượng `Temporal.PlainTime` mới từ một đối tượng `Temporal.PlainTime` khác, một đối tượng với các thuộc tính thời gian, hoặc một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.PlainTime.from(info)
Temporal.PlainTime.from(info, options)
```

### Tham số

- `info`
  - : Một trong những dạng sau:
    - Một thực thể {{jsxref("Temporal.PlainTime")}}, tạo ra một bản sao của thực thể.
    - Một thực thể {{jsxref("Temporal.PlainDateTime")}}, cung cấp thời gian theo cách tương tự như {{jsxref("Temporal/PlainDateTime/toPlainDate", "Temporal.PlainDateTime.prototype.toPlainTime()")}}.
    - Một thực thể {{jsxref("Temporal.ZonedDateTime")}}, cung cấp thời gian theo cách tương tự như {{jsxref("Temporal/ZonedDateTime/toPlainDate", "Temporal.ZonedDateTime.prototype.toPlainTime()")}}.
    - Một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime#rfc_9557_format) chứa thời gian.
    - Một đối tượng chứa ít nhất một trong các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
      - {{jsxref("Temporal/PlainTime/hour", "hour")}}
      - {{jsxref("Temporal/PlainTime/microsecond", "microsecond")}}
      - {{jsxref("Temporal/PlainTime/millisecond", "millisecond")}}
      - {{jsxref("Temporal/PlainTime/minute", "minute")}}
      - {{jsxref("Temporal/PlainTime/nanosecond", "nanosecond")}}
      - {{jsxref("Temporal/PlainTime/second", "second")}}

      Chúng được cắt thành số nguyên. Các giá trị ngoài phạm vi được xử lý bởi tùy chọn `overflow`.

- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần thời gian nằm ngoài phạm vi (khi sử dụng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần thời gian được kẹp vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần thời gian nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainTime` mới, đại diện cho thời gian được chỉ định bởi `info`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng với ít nhất một thuộc tính được nhận dạng hoặc là chuỗi.
    - `options` không phải là đối tượng hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu các thuộc tính số được cung cấp nằm ngoài phạm vi và `options.overflow` được đặt là `"reject"`.

## Ví dụ

### Tạo PlainTime từ một đối tượng

```js
const t1 = Temporal.PlainTime.from({ hour: 0 });
console.log(t1.toString()); // "00:00:00"

const t2 = Temporal.PlainTime.from({ hour: 12, minute: 34, second: 56 });
console.log(t2.toString()); // "12:34:56"

const t3 = Temporal.PlainTime.from({
  hour: 12,
  minute: 34,
  second: 56,
  millisecond: 123,
  microsecond: 456,
  nanosecond: 789,
});
console.log(t3.toString()); // "12:34:56.123456789"
```

### Kiểm soát hành vi overflow

Theo mặc định, các giá trị ngoài phạm vi được kẹp vào phạm vi hợp lệ:

```js
const t1 = Temporal.PlainTime.from({ hour: 25 });
console.log(t1.toString()); // "23:00:00"

const t2 = Temporal.PlainTime.from({ hour: 25, minute: 60 });
console.log(t2.toString()); // "23:59:00"
```

Bạn có thể thay đổi hành vi này để ném ra lỗi thay vì:

```js
Temporal.PlainTime.from({ hour: 25 }, { overflow: "reject" });
// RangeError: time value "hour" not in 0..23: 25
```

### Tạo PlainTime từ một chuỗi

```js
const t1 = Temporal.PlainTime.from("12:34:56.123456789");
console.log(t1.toLocaleString("en-US", { timeStyle: "full" }));
// 12:34:56 PM
```

### Tạo PlainTime từ một thực thể Temporal khác

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:00");
const t = Temporal.PlainTime.from(dt);
console.log(t.toString()); // "12:00:00"

const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T00:00+08:00[Asia/Shanghai]",
);
const t2 = Temporal.PlainTime.from(zdt);
console.log(t2.toString()); // "00:00:00"

const t3 = Temporal.PlainTime.from(t);
console.log(t3.toString()); // "12:00:00"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/PlainTime", "Temporal.PlainTime()")}}
- {{jsxref("Temporal/PlainTime/with", "Temporal.PlainTime.prototype.with()")}}
