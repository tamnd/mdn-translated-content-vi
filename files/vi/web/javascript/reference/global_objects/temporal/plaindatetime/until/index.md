---
title: Temporal.PlainDateTime.prototype.until()
short-title: until()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/until
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.until
sidebar: jsref
---

Phương thức **`until()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ ngày-giờ này đến một ngày-giờ khác (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}). Khoảng thời gian là dương nếu ngày-giờ kia ở sau ngày-giờ này, và âm nếu ở trước.

Phương thức này thực hiện `other - this`. Để thực hiện `this - other`, hãy dùng phương thức {{jsxref("Temporal/PlainDateTime/since", "since()")}}.

## Cú pháp

```js-nolint
until(other)
until(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainDateTime")}} đại diện cho ngày-giờ cần trừ từ ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.PlainDateTime` sử dụng cùng thuật toán như {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}. Nó phải có cùng lịch như `this`.
- `options` {{optional_inline}}
  - : Các tùy chọn giống như [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/since#options).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới đại diện cho khoảng thời gian từ ngày-giờ này _đến_ `other`. Khoảng thời gian là dương nếu `other` ở sau ngày-giờ này, và âm nếu ở trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng until()

```js
let nextBilling = Temporal.PlainDateTime.from({
  year: Temporal.Now.plainDateISO().year,
  month: 4,
  day: 1,
});
const now = Temporal.Now.plainDateTimeISO().round("second");
if (Temporal.PlainDateTime.compare(nextBilling, now) < 0) {
  nextBilling = nextBilling.add({ years: 1 });
}
const duration = now.until(nextBilling);
console.log(`${duration.toLocaleString("en-US")} until next billing`);
```

Để xem thêm ví dụ, xem [`since()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/since).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDateTime/since", "Temporal.PlainDateTime.prototype.since()")}}
