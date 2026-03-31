---
title: Temporal.PlainTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/PlainTime
page-type: javascript-constructor
browser-compat: javascript.builtins.Temporal.PlainTime.PlainTime
sidebar: jsref
---

Hàm khởi tạo **`Temporal.PlainTime()`** tạo các đối tượng {{jsxref("Temporal.PlainTime")}}.

Hàm khởi tạo này cho phép bạn tạo các thực thể bằng cách trực tiếp cung cấp dữ liệu cơ bản. Giống như tất cả các lớp `Temporal` khác, bạn thường nên xây dựng các đối tượng `Temporal.PlainTime` bằng phương thức tĩnh {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}, có thể xử lý nhiều loại đầu vào khác nhau.

## Cú pháp

```js-nolint
new Temporal.PlainTime()
new Temporal.PlainTime(hour)
new Temporal.PlainTime(hour, minute)
new Temporal.PlainTime(hour, minute, second)
new Temporal.PlainTime(hour, minute, second, millisecond)
new Temporal.PlainTime(hour, minute, second, millisecond, microsecond)
new Temporal.PlainTime(hour, minute, second, millisecond, microsecond, nanosecond)
```

> [!NOTE]
> `Temporal.PlainTime()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `hour` {{optional_inline}}
  - : Một số, được cắt thành số nguyên, đại diện cho thành phần giờ.
- `minute` {{optional_inline}}
  - : Một số, được cắt thành số nguyên, đại diện cho thành phần phút.
- `second` {{optional_inline}}
  - : Một số, được cắt thành số nguyên, đại diện cho thành phần giây.
- `millisecond` {{optional_inline}}
  - : Một số, được cắt thành số nguyên, đại diện cho thành phần mili-giây.
- `microsecond` {{optional_inline}}
  - : Một số, được cắt thành số nguyên, đại diện cho thành phần micro-giây.
- `nanosecond` {{optional_inline}}
  - : Một số, được cắt thành số nguyên, đại diện cho thành phần nano-giây.

### Giá trị trả về

Một đối tượng `Temporal.PlainTime` mới, đại diện cho thời gian được chỉ định bởi các tham số.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ thành phần nào không phải là số hữu hạn, hoặc chúng không đại diện cho một thời gian hợp lệ.

## Ví dụ

### Sử dụng Temporal.PlainTime()

```js
const time = new Temporal.PlainTime(12, 34, 56, 123, 456, 789);
console.log(time.toString()); // 12:34:56.123456789
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}
