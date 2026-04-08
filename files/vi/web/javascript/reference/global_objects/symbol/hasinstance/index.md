---
title: Symbol.hasInstance
short-title: hasInstance
slug: Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.hasInstance
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.hasInstance`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.hasInstance`. Toán tử {{jsxref("Operators/instanceof", "instanceof")}} tra cứu symbol này trên toán hạng bên phải của nó cho phương thức dùng để xác định xem đối tượng constructor có nhận dạng một đối tượng là instance của nó không.

{{InteractiveExample("JavaScript Demo: Symbol.hasInstance")}}

```js interactive-example
class Array1 {
  static [Symbol.hasInstance](instance) {
    return Array.isArray(instance);
  }
}

console.log([] instanceof Array1);
// Expected output: true
```

## Giá trị

Well-known symbol `Symbol.hasInstance`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Toán tử `instanceof` sử dụng thuật toán sau để tính toán giá trị trả về của `object instanceof constructor`:

1. Nếu `constructor` có phương thức `[Symbol.hasInstance]()`, thì gọi nó với `object` là đối số đầu tiên và trả về kết quả, [ép kiểu thành boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#boolean_coercion). Ném {{jsxref("TypeError")}} nếu `constructor` không phải là đối tượng, hoặc nếu `constructor[Symbol.hasInstance]` không phải là một trong số `null`, `undefined`, hoặc một hàm.
2. Nếu không, nếu `constructor` không có phương thức `[Symbol.hasInstance]()` (`constructor[Symbol.hasInstance]` là `null` hoặc `undefined`), thì xác định kết quả bằng cùng thuật toán như [`Function.prototype[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Symbol.hasInstance). Ném {{jsxref("TypeError")}} nếu `constructor` không phải là hàm.

Vì tất cả các hàm kế thừa từ `Function.prototype` theo mặc định, hầu hết thời gian, phương thức [`Function.prototype[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Symbol.hasInstance) chỉ định hành vi của `instanceof` khi vế phải là một hàm.

## Ví dụ

### Hành vi instanceof tùy chỉnh

Bạn có thể triển khai hành vi `instanceof` tùy chỉnh của mình như sau:

```js
class MyArray {
  static [Symbol.hasInstance](instance) {
    return Array.isArray(instance);
  }
}
console.log([] instanceof MyArray); // true
```

```js
function MyArray() {}
Object.defineProperty(MyArray, Symbol.hasInstance, {
  value(instance) {
    return Array.isArray(instance);
  },
});
console.log([] instanceof MyArray); // true
```

### Kiểm tra instance của một đối tượng

Cũng giống như cách bạn kiểm tra xem một đối tượng có phải là instance của một class bằng từ khóa `instanceof`, bạn cũng có thể dùng `Symbol.hasInstance` cho các kiểm tra như vậy.

```js
class Animal {
  constructor() {}
}

const cat = new Animal();

console.log(Animal[Symbol.hasInstance](cat)); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Operators/instanceof", "instanceof")}}
- [`Function.prototype[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Symbol.hasInstance)
