---
title: Temporal.Instant.prototype.epochMilliseconds
short-title: epochMilliseconds
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/epochMilliseconds
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Instant.epochMilliseconds
sidebar: jsref
---

Thuộc tính accessor **`epochMilliseconds`** của các thực thể {{jsxref("Temporal.Instant")}} trả về một số nguyên biểu diễn số mili giây đã trôi qua kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC) đến instant này. Nó tương đương với việc chia `epochNanoseconds` cho `1e6` và làm tròn xuống kết quả.

Set accessor của `epochMilliseconds` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.Instant` mới với giá trị `epochMilliseconds` mới mong muốn, hãy sử dụng phương thức tĩnh {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}} thay thế.

## Ví dụ

### Sử dụng epochMilliseconds

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.789Z");
console.log(instant.epochMilliseconds); // 1627821296789

const instant2 = Temporal.Instant.from("1969-08-01T12:34:56.789Z");
console.log(instant2.epochMilliseconds); // -13173903211
```

### Thay đổi epochMilliseconds

Đây là phương thức cho phép bạn di chuyển bất kỳ lượng thời gian nào:

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.789Z");
const instant1hourLater = instant.add({ hours: 1 });
console.log(instant1hourLater.epochMilliseconds); // 1627824896789
```

Nếu bạn đã biết sự thay đổi theo mili giây, bạn cũng có thể trực tiếp xây dựng một đối tượng `Temporal.Instant` mới:

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.789Z");
const instant1hourLater = Temporal.Instant.fromEpochMilliseconds(
  instant.epochMilliseconds + 3600000,
);
console.log(instant1hourLater.epochMilliseconds); // 1627824896789
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/epochNanoseconds", "Temporal.Instant.prototype.epochNanoseconds")}}
- {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}}
