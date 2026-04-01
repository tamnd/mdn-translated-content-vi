---
title: Object.isSealed()
short-title: isSealed()
slug: Web/JavaScript/Reference/Global_Objects/Object/isSealed
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.isSealed
sidebar: jsref
---

Phương thức tĩnh **`Object.isSealed()`** xác định xem một đối tượng có bị [sealed](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/seal) hay không.

{{InteractiveExample("JavaScript Demo: Object.isSealed()")}}

```js interactive-example
const object = {
  foo: 42,
};

console.log(Object.isSealed(object));
// Expected output: false

Object.seal(object);

console.log(Object.isSealed(object));
// Expected output: true
```

## Cú pháp

```js-nolint
Object.isSealed(obj)
```

### Tham số

- `obj`
  - : Đối tượng cần kiểm tra.

### Giá trị trả về

Một {{jsxref("Boolean")}} cho biết đối tượng đã cho có bị sealed hay không.

## Mô tả

Trả về `true` nếu đối tượng bị sealed, nếu không thì `false`. Một đối tượng bị sealed nếu nó không phải là {{jsxref("Object/isExtensible", "có thể mở rộng", "", 1)}} và nếu tất cả các thuộc tính của nó là không thể cấu hình và do đó không thể xóa (nhưng không nhất thiết là không thể ghi).

## Ví dụ

### Sử dụng Object.isSealed

```js
// Các đối tượng mặc định không bị sealed.
const empty = {};
Object.isSealed(empty); // false

// Nếu bạn làm một đối tượng rỗng không thể mở rộng,
// nó theo định nghĩa là đã bị sealed.
Object.preventExtensions(empty);
Object.isSealed(empty); // true

// Điều tương tự không đúng với đối tượng không rỗng,
// trừ khi tất cả các thuộc tính của nó là không thể cấu hình.
const hasProp = { fee: "fie foe fum" };
Object.preventExtensions(hasProp);
Object.isSealed(hasProp); // false

// Nhưng làm tất cả chúng không thể cấu hình
// thì đối tượng trở thành sealed.
Object.defineProperty(hasProp, "fee", {
  configurable: false,
});
Object.isSealed(hasProp); // true

// Cách dễ nhất để seal một đối tượng, tất nhiên,
// là Object.seal.
const sealed = {};
Object.seal(sealed);
Object.isSealed(sealed); // true

// Một đối tượng sealed, theo định nghĩa, là không thể mở rộng.
Object.isExtensible(sealed); // false

// Một đối tượng sealed có thể bị đóng băng,
// nhưng không nhất thiết phải vậy.
Object.isFrozen(sealed); // true
// (tất cả các thuộc tính cũng không thể ghi)

const s2 = Object.seal({ p: 3 });
Object.isFrozen(s2); // false
// ('p' vẫn có thể ghi)

const s3 = Object.seal({
  get p() {
    return 0;
  },
});
Object.isFrozen(s3); // true
// (chỉ khả năng cấu hình quan trọng với accessor property)
```

### Đối số không phải đối tượng

Trong ES5, nếu đối số của phương thức này không phải là đối tượng (một giá trị nguyên thủy), nó sẽ gây ra {{jsxref("TypeError")}}. Trong ES2015, nó sẽ trả về `true` mà không có bất kỳ lỗi nào nếu đối số không phải đối tượng được truyền vào, vì các giá trị nguyên thủy theo định nghĩa là bất biến.

```js
Object.isSealed(1);
// TypeError: 1 is not an object (ES5 code)

Object.isSealed(1);
// true                          (ES2015 code)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.seal()")}}
- {{jsxref("Object.preventExtensions()")}}
- {{jsxref("Object.isExtensible()")}}
- {{jsxref("Object.freeze()")}}
- {{jsxref("Object.isFrozen()")}}
