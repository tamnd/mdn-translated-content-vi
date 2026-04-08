---
title: Reflect.defineProperty()
short-title: defineProperty()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/defineProperty
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.defineProperty
sidebar: jsref
---

Phương thức tĩnh **`Reflect.defineProperty()`** giống như {{jsxref("Object.defineProperty()")}} nhưng trả về một {{jsxref("Boolean")}}.

{{InteractiveExample("JavaScript Demo: Reflect.defineProperty()")}}

```js interactive-example
const object = {};

if (Reflect.defineProperty(object, "foo", { value: 42 })) {
  console.log("foo created!");
  // Expected output: "foo created!"
} else {
  console.log("problem creating foo");
}

console.log(object.foo);
// Expected output: 42
```

## Cú pháp

```js-nolint
Reflect.defineProperty(target, propertyKey, attributes)
```

### Tham số

- `target`
  - : Đối tượng target trên đó định nghĩa thuộc tính.
- `propertyKey`
  - : Tên của thuộc tính cần được định nghĩa hoặc sửa đổi.
- `attributes`
  - : Các thuộc tính cho thuộc tính đang được định nghĩa hoặc sửa đổi.

### Giá trị trả về

Một boolean cho biết thuộc tính có được định nghĩa thành công hay không.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` hoặc `attributes` không phải là đối tượng.

## Mô tả

`Reflect.defineProperty()` cung cấp ngữ nghĩa phản chiếu của việc định nghĩa thuộc tính riêng trên một đối tượng. Ở mức độ rất thấp, việc định nghĩa thuộc tính trả về một boolean (như trường hợp của [proxy handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty)). {{jsxref("Object.defineProperty()")}} cung cấp ngữ nghĩa gần như giống nhau, nhưng nó ném ra {{jsxref("TypeError")}} nếu trạng thái là `false` (thao tác không thành công), trong khi `Reflect.defineProperty()` trả về trực tiếp trạng thái đó.

Nhiều thao tác tích hợp cũng định nghĩa thuộc tính riêng trên các đối tượng. Sự khác biệt quan trọng nhất giữa việc định nghĩa thuộc tính và [thiết lập](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/set) chúng là [các setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) không được gọi. Ví dụ, [các trường lớp](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) định nghĩa trực tiếp thuộc tính trên instance mà không gọi setter.

```js
class B extends class A {
  set a(v) {
    console.log("Setter called");
  }
} {
  a = 1; // Nothing logged
}
```

`Reflect.defineProperty()` gọi phương thức nội tại `[[DefineOwnProperty]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.defineProperty()

```js
const obj = {};
Reflect.defineProperty(obj, "x", { value: 7 }); // true
console.log(obj.x); // 7
```

### Kiểm tra xem việc định nghĩa thuộc tính có thành công không

Với {{jsxref("Object.defineProperty()")}}, trả về một đối tượng nếu thành công, hoặc ném ra {{jsxref("TypeError")}} nếu không, bạn sẽ dùng khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để bắt bất kỳ lỗi nào xảy ra trong khi định nghĩa thuộc tính.

Vì `Reflect.defineProperty()` trả về trạng thái thành công dạng Boolean, bạn chỉ cần dùng khối [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else) ở đây:

```js
if (Reflect.defineProperty(target, property, attributes)) {
  // success
} else {
  // failure
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.defineProperty` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- {{jsxref("Object.defineProperty()")}}
- [`handler.defineProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty)
