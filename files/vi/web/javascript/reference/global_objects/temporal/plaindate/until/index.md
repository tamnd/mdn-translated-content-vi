---
title: Temporal.PlainDate.prototype.until()
short-title: until()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/until
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.until
sidebar: jsref
---

Phương thức **`until()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ ngày này đến một ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}). Khoảng thời gian là dương nếu ngày kia ở sau ngày này, và âm nếu ở trước.

Phương thức này thực hiện `other - this`. Để thực hiện `this - other`, hãy dùng phương thức {{jsxref("Temporal/PlainDate/since", "since()")}}.

## Cú pháp

```js-nolint
until(other)
until(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.PlainDate")}} đại diện cho ngày để trừ ngày này từ đó. Nó được chuyển đổi thành đối tượng `Temporal.PlainDate` bằng cùng thuật toán như {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}. Phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Các tùy chọn giống như [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/since#options).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ ngày này _đến_ `other`. Khoảng thời gian là dương nếu `other` ở sau ngày này, và âm nếu ở trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng until()

```js
const launch = Temporal.PlainDate.from("2035-01-01");
const now = Temporal.Now.plainDateISO();
const duration = now.until(launch);
console.log(`It will be ${duration.toLocaleString("en-US")} until the launch`);
```

Xem thêm ví dụ tại [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/since).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/since", "Temporal.PlainDate.prototype.since()")}}
