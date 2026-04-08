---
title: Object.preventExtensions()
short-title: preventExtensions()
slug: Web/JavaScript/Reference/Global_Objects/Object/preventExtensions
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.preventExtensions
sidebar: jsref
---

Phương thức tĩnh **`Object.preventExtensions()`** ngăn không cho thêm các thuộc tính mới vào một đối tượng (tức là ngăn các mở rộng trong tương lai cho đối tượng đó). Nó cũng ngăn prototype của đối tượng bị gán lại.

{{InteractiveExample("JavaScript Demo: Object.preventExtensions()")}}

```js interactive-example
const object = {};

Object.preventExtensions(object);

try {
  Object.defineProperty(object, "foo", {
    value: 42,
  });
} catch (e) {
  console.log(e);
  // Expected output: TypeError: Cannot define property foo, object is not extensible
}
```

## Cú pháp

```js-nolint
Object.preventExtensions(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần được làm không thể mở rộng.

### Giá trị trả về

Đối tượng đã được làm không thể mở rộng.

## Mô tả

Một đối tượng có thể mở rộng khi có thể thêm thuộc tính mới vào nó. `Object.preventExtensions()` đánh dấu một đối tượng là không còn có thể mở rộng, do đó nó sẽ không bao giờ có thêm thuộc tính nào ngoài những thuộc tính nó có tại thời điểm bị đánh dấu là không thể mở rộng. Lưu ý rằng các thuộc tính của đối tượng không thể mở rộng, về mặt chung, vẫn có thể bị _xóa_. Cố gắng thêm thuộc tính mới vào đối tượng không thể mở rộng sẽ thất bại, hoặc silently hoặc, trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), ném {{jsxref("TypeError")}}.

Không giống như [`Object.seal()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/seal) và [`Object.freeze()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze), `Object.preventExtensions()` gọi một hành vi JavaScript nội tại và không thể thay thế bằng tổ hợp của một vài phép toán khác. Nó cũng có đối tác `Reflect` (chỉ tồn tại cho các phép toán nội tại), [`Reflect.preventExtensions()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/preventExtensions).

`Object.preventExtensions()` chỉ ngăn việc thêm thuộc tính của chính đối tượng. Thuộc tính vẫn có thể được thêm vào prototype của đối tượng.

Phương thức này làm cho `[[Prototype]]` của đối tượng đích trở nên bất biến; bất kỳ việc gán lại `[[Prototype]]` nào đều sẽ ném `TypeError`. Hành vi này đặc trưng cho thuộc tính nội tại `[[Prototype]]`; các thuộc tính khác của đối tượng đích vẫn có thể thay đổi.

Không có cách nào để làm một đối tượng có thể mở rộng lại sau khi nó đã được làm không thể mở rộng.

## Ví dụ

### Sử dụng Object.preventExtensions

```js
// Object.preventExtensions trả về đối tượng
// đang được làm không thể mở rộng.
const obj = {};
const obj2 = Object.preventExtensions(obj);
obj === obj2; // true

// Đối tượng có thể mở rộng theo mặc định.
const empty = {};
Object.isExtensible(empty); // true

// Chúng có thể được làm không thể mở rộng
Object.preventExtensions(empty);
Object.isExtensible(empty); // false

// Object.defineProperty ném lỗi khi thêm
// thuộc tính mới vào đối tượng không thể mở rộng.
const nonExtensible = { removable: true };
Object.preventExtensions(nonExtensible);
Object.defineProperty(nonExtensible, "new", {
  value: 8675309,
}); // ném TypeError

// Trong strict mode, cố gắng thêm thuộc tính mới
// vào đối tượng không thể mở rộng sẽ ném TypeError.
function fail() {
  "use strict";
  // ném TypeError
  nonExtensible.newProperty = "FAIL";
}
fail();
```

Prototype của đối tượng không thể mở rộng là bất biến:

```js
const fixed = Object.preventExtensions({});
// ném 'TypeError'.
fixed.__proto__ = { oh: "hai" };
```

### Đối số không phải đối tượng

Trong ES5, nếu đối số của phương thức này không phải là đối tượng (một kiểu nguyên thủy), thì nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, đối số không phải đối tượng sẽ được trả về nguyên vẹn mà không có lỗi, vì các kiểu nguyên thủy đã là, theo định nghĩa, bất biến.

```js
Object.preventExtensions(1);
// TypeError: 1 is not an object (mã ES5)

Object.preventExtensions(1);
// 1                             (mã ES2015)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Object.seal()")}}
- {{jsxref("Object.isSealed()")}}
- {{jsxref("Object.freeze()")}}
- {{jsxref("Object.isFrozen()")}}
- {{jsxref("Reflect.preventExtensions()")}}
