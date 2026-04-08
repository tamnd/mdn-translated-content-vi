---
title: Temporal.Instant.prototype.until()
short-title: until()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/until
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.until
sidebar: jsref
---

Phương thức **`until()`** của các instance {{jsxref("Temporal.Instant")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ instant này đến một instant khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}). Khoảng thời gian là dương nếu instant kia đến sau instant này, và âm nếu trước.

Phương thức này thực hiện `other - this`. Để thực hiện `this - other`, sử dụng phương thức {{jsxref("Temporal/Instant/since", "since()")}}.

## Cú pháp

```js-nolint
until(other)
until(other, options)
```

### Tham số

- `other`
  - : Một chuỗi hoặc instance {{jsxref("Temporal.Instant")}} biểu diễn một instant để trừ instant này đi. Nó được chuyển đổi thành đối tượng `Temporal.Instant` bằng cùng thuật toán như {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}.
- `options` {{optional_inline}}
  - : Các tùy chọn giống như [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant/since#options).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ instant này _cho đến_ `other`. Khoảng thời gian là dương nếu `other` đến sau instant này, và âm nếu trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng until()

```js
const launch = Temporal.Instant.fromEpochMilliseconds(2051222400000);
const now = Temporal.Now.instant();
const duration = now.until(launch, { smallestUnit: "minutes" });
console.log(`It will be ${duration.toLocaleString("en-US")} until the launch`);
```

Xem thêm các ví dụ trong [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant/since).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Instant/add", "Temporal.Instant.prototype.add()")}}
- {{jsxref("Temporal/Instant/subtract", "Temporal.Instant.prototype.subtract()")}}
- {{jsxref("Temporal/Instant/since", "Temporal.Instant.prototype.since()")}}
