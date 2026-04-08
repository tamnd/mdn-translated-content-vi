---
title: Temporal.Instant.prototype.epochNanoseconds
short-title: epochNanoseconds
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/epochNanoseconds
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Instant.epochNanoseconds
sidebar: jsref
---

Thuộc tính accessor **`epochNanoseconds`** của các thực thể {{jsxref("Temporal.Instant")}} trả về một {{jsxref("BigInt")}} biểu diễn số nano giây đã trôi qua kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) đến instant này.

Set accessor của `epochNanoseconds` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.Instant` mới với giá trị `epochNanoseconds` mới mong muốn, hãy sử dụng phương thức tĩnh {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}} thay thế.

Một instant chỉ có thể biểu diễn ±10<sup>8</sup> ngày (khoảng ±273.972,6 năm) quanh epoch, là ±8,64e21 nano giây. Cố gắng đặt `epochNanoseconds` vượt quá ranh giới này sẽ ném ra {{jsxref("RangeError")}}.

## Ví dụ

### Sử dụng epochNanoseconds

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.789Z");
console.log(instant.epochNanoseconds); // 1627821296789000000n

const instant2 = Temporal.Instant.from("1969-08-01T12:34:56.789Z");
console.log(instant2.epochNanoseconds); // -13173903211000000n
```

### Thay đổi epochNanoseconds

Đây là phương thức cho phép bạn di chuyển bất kỳ lượng thời gian nào:

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.789Z");
const instant1hourLater = instant.add({ hours: 1 });
console.log(instant1hourLater.epochNanoseconds); // 1627824896789000000n
```

Nếu bạn đã biết sự thay đổi theo nano giây, bạn cũng có thể trực tiếp xây dựng một đối tượng `Temporal.Instant` mới:

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.789Z");
const instant1hourLater = Temporal.Instant.fromEpochNanoseconds(
  instant.epochNanoseconds + 3600000000000n,
);
console.log(instant1hourLater.epochNanoseconds); // 1627824896789000000n
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/epochMilliseconds", "Temporal.Instant.prototype.epochMilliseconds")}}
- {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}}
