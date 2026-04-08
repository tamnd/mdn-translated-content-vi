---
title: Temporal.ZonedDateTime.prototype.epochNanoseconds
short-title: epochNanoseconds
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/epochNanoseconds
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.epochNanoseconds
sidebar: jsref
---

Thuộc tính accessor **`epochNanoseconds`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một {{jsxref("BigInt")}} biểu thị số nano giây đã trôi qua kể từ Unix epoch (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) cho đến thời điểm này.

Set accessor của `epochNanoseconds` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo đối tượng `Temporal.ZonedDateTime` mới với giá trị `epochNanoseconds` mong muốn, hãy sử dụng hàm tạo {{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "new Temporal.ZonedDateTime()")}} thay thế.

Một thời điểm chỉ có thể biểu thị ±10<sup>8</sup> ngày (khoảng ±273.972,6 năm) quanh epoch, tức là ±8,64e21 nano giây. Việc đặt `epochNanoseconds` vượt quá giới hạn này sẽ ném ra {{jsxref("RangeError")}}.

## Ví dụ

### Sử dụng epochNanoseconds

```js
const zdt = Temporal.ZonedDateTime.from("2021-08-01T12:34:56.789Z[UTC]");
console.log(zdt.epochNanoseconds); // 1627821296789000000n

const zdt2 = Temporal.ZonedDateTime.from("1969-08-01T12:34:56.789Z[UTC]");
console.log(zdt2.epochNanoseconds); // -13173903211000000n
```

### Tạo đối tượng ZonedDateTime từ giá trị epochNanoseconds

Bạn có thể tạo đối tượng `Temporal.ZonedDateTime` từ giá trị `epochNanoseconds` bằng hàm tạo {{jsxref("Temporal/ZonedDateTime/ZonedDateTime", "Temporal.ZonedDateTime()")}}.

```js
const epochNanoseconds = 1627821296789000000n;
const zdt = new Temporal.ZonedDateTime(epochNanoseconds, "UTC");
console.log(zdt.toString()); // 2021-08-01T12:34:56.789+00:00[UTC]
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/epochMilliseconds", "Temporal.ZonedDateTime.prototype.epochMilliseconds")}}
