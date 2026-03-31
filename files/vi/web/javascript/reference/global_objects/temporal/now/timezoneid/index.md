---
title: Temporal.Now.timeZoneId()
short-title: timeZoneId()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Now/timeZoneId
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Now.timeZoneId
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Now.timeZoneId()`** trả về một [định danh múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) đại diện cho múi giờ hiện tại của hệ thống. Hầu hết các hệ thống sẽ trả về định danh múi giờ chính như `"America/New_York"`, mặc dù định danh múi giờ theo độ lệch như `"-04:00"` cũng có thể xảy ra. Định danh múi giờ được trả về là múi giờ mặc định được sử dụng bởi các phương thức `Temporal.Now` khác.

## Cú pháp

```js-nolint
Temporal.Now.timeZoneId()
```

### Tham số

Không có.

### Giá trị trả về

Một [định danh múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) hợp lệ đại diện cho múi giờ hiện tại của hệ thống. Định danh múi giờ được trả về không bao giờ là định danh múi giờ không phải chính (bí danh). Ví dụ, nó sẽ luôn trả về `"Asia/Kolkata"` (tên mới) thay vì `"Asia/Calcutta"` (tên cũ). Để biết thêm thông tin, xem [múi giờ và độ lệch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets).

Nếu triển khai không hỗ trợ múi giờ, phương thức luôn trả về `"UTC"`.

## Ví dụ

### Lấy múi giờ hiện tại của hệ thống

```js
console.log(Temporal.Now.timeZoneId()); // e.g.: "America/New_York"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Now")}}
