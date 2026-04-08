---
title: Temporal.Duration.prototype.valueOf()
short-title: valueOf()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/valueOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.valueOf
sidebar: jsref
---

Phương thức **`valueOf()`** của các instance {{jsxref("Temporal.Duration")}} ném ra {{jsxref("TypeError")}}, ngăn các instance `Temporal.Duration` bị [chuyển đổi ngầm định sang kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) khi được sử dụng trong các phép tính số học hoặc so sánh.

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

Vì cả [chuyển đổi nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) lẫn [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) đều gọi `valueOf()` trước `toString()`, nếu `valueOf()` vắng mặt, thì một biểu thức như `duration1 > duration2` sẽ ngầm định so sánh chúng dưới dạng chuỗi, điều này có thể có các kết quả không mong đợi như `"PT3S" > "PT1M"`. Bằng cách ném `TypeError`, các instance `Temporal.Duration` ngăn chặn các chuyển đổi ngầm định như vậy. Bạn cần chuyển đổi chúng sang số một cách tường minh bằng {{jsxref("Temporal/Duration/total", "Temporal.Duration.prototype.total()")}}, hoặc sử dụng phương thức tĩnh {{jsxref("Temporal/Duration/compare", "Temporal.Duration.compare()")}} để so sánh chúng.

## Ví dụ

### Các phép tính số học và so sánh trên Temporal.Duration

Tất cả các phép tính số học và so sánh trên các instance `Temporal.Duration` nên sử dụng các phương thức chuyên dụng hoặc chuyển đổi chúng sang kiểu nguyên thủy một cách tường minh.

```js
const duration1 = Temporal.Duration.from({ seconds: 3 });
const duration2 = Temporal.Duration.from({ minutes: 1 });
duration1 > duration2; // TypeError: can't convert Duration to primitive type
duration1.total("seconds") > duration2.total("seconds"); // false
Temporal.Duration.compare(duration1, duration2); // -1

duration1 + duration2; // TypeError: can't convert Duration to primitive type
duration1.total("seconds") + duration2.total("seconds"); // 63
duration1.add(duration2).toString(); // "PT1M3S"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/toString", "Temporal.Duration.prototype.toString()")}}
- {{jsxref("Temporal/Duration/toJSON", "Temporal.Duration.prototype.toJSON()")}}
- {{jsxref("Temporal/Duration/toLocaleString", "Temporal.Duration.prototype.toLocaleString()")}}
