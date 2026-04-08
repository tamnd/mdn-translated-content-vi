---
title: Object.assign()
short-title: assign()
slug: Web/JavaScript/Reference/Global_Objects/Object/assign
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.assign
sidebar: jsref
---

Phương thức tĩnh **`Object.assign()`** sao chép tất cả các thuộc tính {{jsxref("Object/propertyIsEnumerable", "có thể đếm được", "", 1)}} {{jsxref("Object/hasOwn", "của chính đối tượng", "", 1)}} từ một hoặc nhiều _đối tượng nguồn_ sang một _đối tượng đích_. Nó trả về đối tượng đích đã được sửa đổi.

{{InteractiveExample("JavaScript Demo: Object.assign()")}}

```js interactive-example
const target = { a: 1, b: 2 };
const source = { b: 4, c: 5 };

const returnedTarget = Object.assign(target, source);

console.log(target);
// Expected output: Object { a: 1, b: 4, c: 5 }

console.log(returnedTarget === target);
// Expected output: true
```

## Cú pháp

```js-nolint
Object.assign(target)
Object.assign(target, source1)
Object.assign(target, source1, source2)
Object.assign(target, source1, source2, /* …, */ sourceN)
```

### Tham số

- `target`
  - : Đối tượng đích — nơi áp dụng các thuộc tính từ nguồn, và cũng là giá trị được trả về sau khi được sửa đổi. Nếu một giá trị nguyên thủy được cung cấp làm đích, nó sẽ được chuyển đổi thành đối tượng.
- `source1`, …, `sourceN`
  - : Các đối tượng nguồn — các đối tượng chứa các thuộc tính bạn muốn áp dụng.

### Giá trị trả về

Đối tượng đích.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - Tham số `target` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}.
    - Việc gán một thuộc tính trên đối tượng đích thất bại; ví dụ, vì thuộc tính là không thể ghi trên đối tượng đích, hoặc vì setter của nó ném lỗi.

## Mô tả

Các thuộc tính trong đối tượng đích sẽ bị ghi đè bởi các thuộc tính trong nguồn nếu chúng có cùng {{jsxref("Object/keys", "khóa", "", 1)}}. Các thuộc tính từ nguồn sau sẽ ghi đè nguồn trước.

Phương thức `Object.assign()` chỉ sao chép các thuộc tính _có thể đếm_ và _của chính đối tượng_ từ đối tượng nguồn sang đối tượng đích. Nó sử dụng `[[Get]]` trên nguồn và `[[Set]]` trên đích, do đó nó sẽ gọi [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set). Do đó nó _gán_ thuộc tính, thay vì sao chép hoặc định nghĩa các thuộc tính mới. Điều này có thể làm cho nó không phù hợp để hợp nhất các thuộc tính mới vào prototype nếu các nguồn hợp nhất chứa getter.

Để sao chép các định nghĩa thuộc tính (bao gồm cả khả năng đếm của chúng) vào prototype, hãy sử dụng {{jsxref("Object.getOwnPropertyDescriptor()")}} và {{jsxref("Object.defineProperty()")}} thay thế.

Cả hai thuộc tính {{jsxref("String")}} và {{jsxref("Symbol")}} đều được sao chép.

Trong trường hợp có lỗi, ví dụ nếu một thuộc tính không thể ghi, một {{jsxref("TypeError")}} sẽ được ném ra, và đối tượng `target` sẽ bị thay đổi nếu có bất kỳ thuộc tính nào được thêm trước khi lỗi xảy ra.

> [!NOTE]
> `Object.assign()` không ném ra lỗi trên các nguồn là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}.

## Ví dụ

### Nhân bản một đối tượng

```js
const obj = { a: 1 };
const copy = Object.assign({}, obj);
console.log(copy); // { a: 1 }
```

### Cảnh báo về nhân bản sâu

Để [nhân bản sâu](/en-US/docs/Glossary/Deep_copy), chúng ta cần sử dụng các phương án thay thế như {{DOMxRef("Window.structuredClone", "structuredClone()")}}, vì `Object.assign()` chỉ sao chép giá trị của thuộc tính.

Nếu giá trị nguồn là một tham chiếu đến đối tượng, nó chỉ sao chép giá trị tham chiếu đó.

```js
const obj1 = { a: 0, b: { c: 0 } };
const obj2 = Object.assign({}, obj1);
console.log(obj2); // { a: 0, b: { c: 0 } }

obj1.a = 1;
console.log(obj1); // { a: 1, b: { c: 0 } }
console.log(obj2); // { a: 0, b: { c: 0 } }

obj2.a = 2;
console.log(obj1); // { a: 1, b: { c: 0 } }
console.log(obj2); // { a: 2, b: { c: 0 } }

obj2.b.c = 3;
console.log(obj1); // { a: 1, b: { c: 3 } }
console.log(obj2); // { a: 2, b: { c: 3 } }

// Deep Clone
const obj3 = { a: 0, b: { c: 0 } };
const obj4 = structuredClone(obj3);
obj3.a = 4;
obj3.b.c = 4;
console.log(obj4); // { a: 0, b: { c: 0 } }
```

### Hợp nhất các đối tượng

```js
const o1 = { a: 1 };
const o2 = { b: 2 };
const o3 = { c: 3 };

const obj = Object.assign(o1, o2, o3);
console.log(obj); // { a: 1, b: 2, c: 3 }
console.log(o1); // { a: 1, b: 2, c: 3 }, bản thân đối tượng đích bị thay đổi.
```

### Hợp nhất các đối tượng có cùng thuộc tính

```js
const o1 = { a: 1, b: 1, c: 1 };
const o2 = { b: 2, c: 2 };
const o3 = { c: 3 };

const obj = Object.assign({}, o1, o2, o3);
console.log(obj); // { a: 1, b: 2, c: 3 }
```

Các thuộc tính bị ghi đè bởi các đối tượng có cùng thuộc tính xuất hiện sau trong thứ tự tham số.

### Sao chép các thuộc tính kiểu symbol

```js
const o1 = { a: 1 };
const o2 = { [Symbol("foo")]: 2 };

const obj = Object.assign({}, o1, o2);
console.log(obj); // { a : 1, [Symbol("foo")]: 2 } (cf. bug 1207182 on Firefox)
Object.getOwnPropertySymbols(obj); // [Symbol(foo)]
```

### Thuộc tính trên chuỗi prototype và thuộc tính không đếm được không thể sao chép

```js
const obj = Object.create(
  // foo nằm trên chuỗi prototype của obj.
  { foo: 1 },
  {
    bar: {
      value: 2, // bar là thuộc tính không đếm được.
    },
    baz: {
      value: 3,
      enumerable: true, // baz là thuộc tính của chính đối tượng và có thể đếm được.
    },
  },
);

const copy = Object.assign({}, obj);
console.log(copy); // { baz: 3 }
```

### Các giá trị nguyên thủy sẽ được bọc thành đối tượng

```js
const v1 = "abc";
const v2 = true;
const v3 = 10;
const v4 = Symbol("foo");

const obj = Object.assign({}, v1, null, v2, undefined, v3, v4);
// Các giá trị nguyên thủy sẽ được bọc, null và undefined sẽ bị bỏ qua.
// Lưu ý, chỉ các bọc chuỗi mới có thể có thuộc tính của chính đối tượng có thể đếm được.
console.log(obj); // { "0": "a", "1": "b", "2": "c" }

// Các giá trị nguyên thủy làm đích cũng được bọc thành đối tượng
const number = Object.assign(3, { a: 1 });
console.log(number); // Number {3, a: 1}
console.log(typeof number); // object
console.log(number.a); // 1

// null và undefined làm đích ném TypeError
try {
  Object.assign(null, { a: 1 });
} catch (e) {
  console.log(e.message); // "Cannot convert undefined or null to object"
}
```

### Ngoại lệ sẽ làm gián đoạn tác vụ sao chép đang diễn ra

```js
const target = Object.defineProperty({}, "foo", {
  value: 1,
  writable: false,
}); // target.foo là thuộc tính chỉ đọc

Object.assign(target, { bar: 2 }, { foo2: 3, foo: 3, foo3: 3 }, { baz: 4 });
// TypeError: "foo" is read-only
// Ngoại lệ được ném khi gán target.foo

console.log(target.bar); // 2, nguồn đầu tiên được sao chép thành công.
console.log(target.foo2); // 3, thuộc tính đầu tiên của nguồn thứ hai được sao chép thành công.
console.log(target.foo); // 1, ngoại lệ được ném ở đây.
console.log(target.foo3); // undefined, phương thức assign đã kết thúc, foo3 sẽ không được sao chép.
console.log(target.baz); // undefined, nguồn thứ ba cũng sẽ không được sao chép.
```

### Sao chép accessor

```js
const obj = {
  foo: 1,
  get bar() {
    return 2;
  },
};

let copy = Object.assign({}, obj);
console.log(copy);
// { foo: 1, bar: 2 }
// Giá trị của copy.bar là giá trị trả về của getter của obj.bar.

// Đây là một hàm assign sao chép đầy đủ các descriptor
function completeAssign(target, ...sources) {
  sources.forEach((source) => {
    const descriptors = Object.keys(source).reduce((descriptors, key) => {
      descriptors[key] = Object.getOwnPropertyDescriptor(source, key);
      return descriptors;
    }, {});

    // Theo mặc định, Object.assign cũng sao chép các Symbol có thể đếm được
    Object.getOwnPropertySymbols(source).forEach((sym) => {
      const descriptor = Object.getOwnPropertyDescriptor(source, sym);
      if (descriptor.enumerable) {
        descriptors[sym] = descriptor;
      }
    });
    Object.defineProperties(target, descriptors);
  });
  return target;
}

copy = completeAssign({}, obj);
console.log(copy);
// { foo:1, get bar() { return 2 } }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.assign` in `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [es-shims polyfill of `Object.assign`](https://www.npmjs.com/package/object.assign)
- {{jsxref("Object.defineProperties()")}}
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- [Spread in object literals](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax#spread_in_object_literals)
