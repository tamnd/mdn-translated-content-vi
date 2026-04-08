---
title: Temporal.ZonedDateTime.prototype.epochMilliseconds
short-title: epochMilliseconds
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/epochMilliseconds
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.epochMilliseconds
sidebar: jsref
---

Thuộc tính accessor **`epochMilliseconds`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên biểu thị số mili giây đã trôi qua kể từ Unix epoch (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) cho đến thời điểm này. Giá trị này tương đương với việc chia `epochNanoseconds` cho `1e6` và lấy phần nguyên.

Set accessor của `epochMilliseconds` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo đối tượng `Temporal.ZonedDateTime` mới với giá trị `epochMilliseconds` mong muốn, xem bên dưới.

## Ví dụ

### Sử dụng epochMilliseconds

```js
const zdt = Temporal.ZonedDateTime.from("2021-08-01T12:34:56.789Z[UTC]");
console.log(zdt.epochMilliseconds); // 1627821296789

const zdt2 = Temporal.ZonedDateTime.from("1969-08-01T12:34:56.789Z[UTC]");
console.log(zdt2.epochMilliseconds); // -13173903211
```

### Tạo đối tượng ZonedDateTime từ giá trị epochMilliseconds

Bạn có thể tạo đối tượng `Temporal.ZonedDateTime` từ giá trị `epochMilliseconds` bằng cách trước tiên xây dựng đối tượng `Temporal.Instant` bằng {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}}, sau đó chuyển đổi nó thành đối tượng `Temporal.ZonedDateTime` bằng {{jsxref("Temporal/Instant/toZonedDateTimeISO", "Temporal.Instant.prototype.toZonedDateTimeISO()")}}:

```js
const epochMilliseconds = 1627821296789;
const instant = Temporal.Instant.fromEpochMilliseconds(epochMilliseconds);
const zdt = instant.toZonedDateTimeISO("UTC");
console.log(zdt.toString()); // 2021-08-01T12:34:56.789+00:00[UTC]
```

Hoặc, sử dụng hàm tạo {{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "Temporal.ZonedDateTime()")}}, nhưng cần chuyển đổi mili giây thành nano giây trước:

```js
const epochMilliseconds = 1627821296789;
const epochNanoseconds = BigInt(epochMilliseconds) * 1_000_000n;
const zdt = new Temporal.ZonedDateTime(epochNanoseconds, "UTC");
console.log(zdt.toString()); // 2021-08-01T12:34:56.789+00:00[UTC]
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "Temporal.ZonedDateTime.prototype.epochNanoseconds")}}
