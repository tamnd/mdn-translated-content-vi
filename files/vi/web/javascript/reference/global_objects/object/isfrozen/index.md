---
title: Object.isFrozen()
short-title: isFrozen()
slug: Web/JavaScript/Reference/Global_Objects/Object/isFrozen
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.isFrozen
sidebar: jsref
---

Phương thức tĩnh **`Object.isFrozen()`** xác định xem một đối tượng có bị {{jsxref("Object/freeze", "đóng băng", "", 1)}} hay không.

{{InteractiveExample("JavaScript Demo: Object.isFrozen()")}}

```js interactive-example
const object = {
  foo: 42,
};

console.log(Object.isFrozen(object));
// Expected output: false

Object.freeze(object);

console.log(Object.isFrozen(object));
// Expected output: true
```

## Cú pháp

```js-nolint
Object.isFrozen(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần kiểm tra.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết đối tượng đã cho có bị đóng băng hay không.

## Mô tả

Một đối tượng bị đóng băng khi và chỉ khi nó không [có thể mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible), tất cả các thuộc tính của nó là không thể cấu hình, và tất cả data property của nó (tức là các thuộc tính không phải là accessor property với các thành phần getter hoặc setter) là không thể ghi.

## Ví dụ

### Sử dụng Object.isFrozen

```js
// Một đối tượng mới có thể mở rộng, vì vậy nó không bị đóng băng.
Object.isFrozen({}); // false

// Một đối tượng rỗng không thể mở rộng
// theo định nghĩa là đã bị đóng băng.
const vacuouslyFrozen = Object.preventExtensions({});
Object.isFrozen(vacuouslyFrozen); // true

// Một đối tượng mới có một thuộc tính cũng có thể mở rộng,
// do đó không bị đóng băng.
const oneProp = { p: 42 };
Object.isFrozen(oneProp); // false

// Ngăn mở rộng đối tượng vẫn không làm nó bị đóng băng,
// vì thuộc tính vẫn có thể cấu hình (và có thể ghi).
Object.preventExtensions(oneProp);
Object.isFrozen(oneProp); // false

// Xóa thuộc tính đó làm đối tượng bị đóng băng theo định nghĩa.
delete oneProp.p;
Object.isFrozen(oneProp); // true

// Một đối tượng không thể mở rộng với thuộc tính không thể ghi
// nhưng vẫn có thể cấu hình thì không bị đóng băng.
const nonWritable = { e: "plep" };
Object.preventExtensions(nonWritable);
Object.defineProperty(nonWritable, "e", {
  writable: false,
}); // làm không thể ghi
Object.isFrozen(nonWritable); // false

// Thay đổi thuộc tính đó thành không thể cấu hình
// làm đối tượng bị đóng băng.
Object.defineProperty(nonWritable, "e", {
  configurable: false,
}); // làm không thể cấu hình
Object.isFrozen(nonWritable); // true

// Một đối tượng không thể mở rộng với thuộc tính không thể cấu hình
// nhưng vẫn có thể ghi cũng không bị đóng băng.
const nonConfigurable = { release: "the kraken!" };
Object.preventExtensions(nonConfigurable);
Object.defineProperty(nonConfigurable, "release", {
  configurable: false,
});
Object.isFrozen(nonConfigurable); // false

// Thay đổi thuộc tính đó thành không thể ghi
// làm đối tượng bị đóng băng.
Object.defineProperty(nonConfigurable, "release", {
  writable: false,
});
Object.isFrozen(nonConfigurable); // true

// Một đối tượng không thể mở rộng với accessor property có thể cấu hình
// không bị đóng băng.
const accessor = {
  get food() {
    return "yum";
  },
};
Object.preventExtensions(accessor);
Object.isFrozen(accessor); // false

// Khi chúng ta làm thuộc tính đó không thể cấu hình, nó trở thành đóng băng.
Object.defineProperty(accessor, "food", {
  configurable: false,
});
Object.isFrozen(accessor); // true

// Nhưng cách dễ nhất để đóng băng đối tượng
// là nếu Object.freeze đã được gọi trên nó.
const frozen = { 1: 81 };
Object.isFrozen(frozen); // false
Object.freeze(frozen);
Object.isFrozen(frozen); // true

// Theo định nghĩa, đối tượng đóng băng là không thể mở rộng.
Object.isExtensible(frozen); // false

// Cũng theo định nghĩa, đối tượng đóng băng là sealed.
Object.isSealed(frozen); // true
```

### Đối số không phải đối tượng

Trong ES5, nếu đối số của phương thức này không phải là đối tượng (một giá trị nguyên thủy), nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, nó sẽ trả về `true` mà không có bất kỳ lỗi nào nếu đối số không phải đối tượng được truyền vào, vì các giá trị nguyên thủy theo định nghĩa là bất biến.

```js
Object.isFrozen(1);
// TypeError: 1 is not an object (ES5 code)

Object.isFrozen(1);
// true                          (ES2015 code)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.freeze()")}}
- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Object.seal()")}}
- {{jsxref("Object.isSealed()")}}
