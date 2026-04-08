---
title: Temporal.PlainTime.prototype.until()
short-title: until()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/until
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.until
sidebar: jsref
---

Phương thức **`until()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ thời điểm này đến một thời điểm khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}). Khoảng thời gian là dương nếu thời điểm kia đứng sau thời điểm này, và âm nếu đứng trước.

Phương thức này thực hiện phép tính `other - this`. Để thực hiện `this - other`, hãy dùng phương thức {{jsxref("Temporal/PlainTime/since", "since()")}}.

## Cú pháp

```js-nolint
until(other)
until(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainTime")}} đại diện cho thời điểm cần trừ thời điểm này. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}. Phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Các tùy chọn giống như [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/since#options).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ thời điểm này _cho đến_ `other`. Khoảng thời gian là dương nếu `other` đứng sau thời điểm này, và âm nếu đứng trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng until()

```js
const lunchTime = Temporal.PlainTime.from("12:30:00");
const now = Temporal.Now.plainTimeISO();
const duration = now.until(lunchTime);
console.log(`It will be ${duration.toLocaleString("en-US")} until lunch`);
// Ví dụ đầu ra: "It will be 3 hr, 42 min, 21 sec, 343 ms, 131 μs, 718 ns until lunch"
```

Để xem thêm ví dụ, hãy xem [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/since).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainTime/add", "Temporal.PlainTime.prototype.add()")}}
- {{jsxref("Temporal/PlainTime/subtract", "Temporal.PlainTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainTime/since", "Temporal.PlainTime.prototype.since()")}}
