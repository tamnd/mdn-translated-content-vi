---
title: Temporal.ZonedDateTime.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} ném ra {{jsxref("TypeError")}}, ngăn các thực thể `Temporal.ZonedDateTime` bị [chuyển đổi ngầm sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép toán số học hoặc so sánh.

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
  - : Luôn được ném ra.

## Mô tả

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) và [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` không có, thì biểu thức như `yearMonth1 > yearMonth2` sẽ ngầm so sánh chúng dưới dạng chuỗi, điều này có thể tạo ra kết quả không mong đợi. Bằng cách ném `TypeError`, các thực thể `Temporal.ZonedDateTime` ngăn chặn các chuyển đổi ngầm như vậy. Bạn cần chuyển đổi chúng sang số rõ ràng bằng cách sử dụng {{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "Temporal.ZonedDateTime.prototype.epochNanoseconds")}}, hoặc sử dụng phương thức tĩnh {{jsxref("Temporal/ZonedDateTime/compare", "Temporal.ZonedDateTime.compare()")}} để so sánh chúng.

## Ví dụ

### Các phép toán số học và so sánh trên Temporal.ZonedDateTime

Tất cả các phép toán số học và so sánh trên các thực thể `Temporal.ZonedDateTime` nên sử dụng các phương thức chuyên dụng hoặc chuyển đổi chúng sang kiểu nguyên thủy rõ ràng.

```js
const zdt1 = Temporal.ZonedDateTime.from(
  "2022-01-01T00:00:00[America/New_York]",
);
const zdt2 = Temporal.ZonedDateTime.from(
  "2022-07-01T00:00:00[America/New_York]",
);
zdt1 > zdt2; // TypeError: can't convert ZonedDateTime to primitive type
Temporal.ZonedDateTime.compare(zdt1, zdt2); // -1

zdt2 - zdt1; // TypeError: can't convert ZonedDateTime to primitive type
zdt2.since(zdt1).toString(); // "PT4343H"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/toString", "Temporal.ZonedDateTime.prototype.toString()")}}
- {{jsxref("Temporal/ZonedDateTime/toJSON", "Temporal.ZonedDateTime.prototype.toJSON()")}}
- {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}}
