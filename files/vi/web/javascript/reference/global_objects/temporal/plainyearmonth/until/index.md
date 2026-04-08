---
title: Temporal.PlainYearMonth.prototype.until()
short-title: until()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/until
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.until
sidebar: jsref
---

Phương thức **`until()`** của các instance {{jsxref("Temporal.PlainYearMonth")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ năm-tháng này đến một năm-tháng khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}). Khoảng thời gian là dương nếu tháng kia đến sau tháng này, và âm nếu đến trước.

Phương thức này thực hiện `other - this`. Để thực hiện `this - other`, hãy dùng phương thức {{jsxref("Temporal/PlainYearMonth/since", "since()")}}.

## Cú pháp

```js-nolint
until(other)
until(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainYearMonth")}} biểu diễn năm-tháng cần lấy năm-tháng này trừ đi. Nó được chuyển đổi thành đối tượng `Temporal.PlainYearMonth` bằng cùng thuật toán như {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}. Nó phải có cùng calendar với `this`.
- `options` {{optional_inline}}
  - : Các tùy chọn giống như [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/since#options).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ năm-tháng này _cho đến_ `other`. Khoảng thời gian là dương nếu `other` đến sau năm-tháng này, và âm nếu đến trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có calendar khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng until()

```js
const launch = Temporal.PlainYearMonth.from("2035-01");
const now = Temporal.Now.plainDateISO().toPlainYearMonth();
const duration = now.until(launch);
console.log(`It will be ${duration.toLocaleString("en-US")} until the launch`);
```

Để xem thêm ví dụ, hãy xem [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/since).

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
- {{jsxref("Temporal/PlainYearMonth/since", "Temporal.PlainYearMonth.prototype.since()")}}
