---
title: Temporal.Instant.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Temporal.Instant")}} ném ra {{jsxref("TypeError")}}, ngăn các instance `Temporal.Instant` bị [chuyển đổi ngầm định thành kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.

## Cú pháp

```js-nolint
valueOf()
```

### Tham số

Không có.

### Giá trị trả về

Không có.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luôn luôn được ném ra.

## Mô tả

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) và [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` vắng mặt, biểu thức như `instant1 > instant2` sẽ ngầm định so sánh chúng dưới dạng chuỗi, có thể cho kết quả không mong muốn. Bằng cách ném `TypeError`, các instance `Temporal.Instant` ngăn chặn các chuyển đổi ngầm định như vậy. Bạn cần chuyển đổi chúng tường minh thành số bằng {{jsxref("Temporal/Instant/epochNanoseconds", "Temporal.Instant.prototype.epochNanoseconds")}}, hoặc sử dụng phương thức tĩnh {{jsxref("Temporal/Instant/compare", "Temporal.Instant.compare()")}} để so sánh chúng.

## Ví dụ

### Các phép toán số học và so sánh trên Temporal.Instant

Tất cả các phép toán số học và so sánh trên các instance `Temporal.Instant` phải sử dụng các phương thức chuyên dụng hoặc chuyển đổi chúng thành kiểu nguyên thủy một cách tường minh.

```js
const instant1 = Temporal.Instant.fromEpochMilliseconds(0);
const instant2 = Temporal.Instant.fromEpochMilliseconds(1000);
instant1 > instant2; // TypeError: can't convert Instant to primitive type
instant1.epochNanoseconds > instant2.epochNanoseconds; // false
Temporal.Instant.compare(instant1, instant2); // -1

instant2 - instant1; // TypeError: can't convert Instant to primitive type
instant2.since(instant1).toString(); // "PT1S"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/toString", "Temporal.Instant.prototype.toString()")}}
- {{jsxref("Temporal/Instant/toJSON", "Temporal.Instant.prototype.toJSON()")}}
- {{jsxref("Temporal/Instant/toLocaleString", "Temporal.Instant.prototype.toLocaleString()")}}
