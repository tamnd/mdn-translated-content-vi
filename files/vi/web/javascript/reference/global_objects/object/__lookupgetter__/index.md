---
title: Object.prototype.__lookupGetter__()
short-title: __lookupGetter__()
slug: Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.Object.lookupGetter
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tính năng này đã bị loại bỏ và thay thế bằng API {{jsxref("Object.getOwnPropertyDescriptor()")}}. Hành vi của phương thức này chỉ được chỉ định nhằm đảm bảo tương thích web, và không bắt buộc phải được triển khai trên mọi nền tảng. Nó có thể không hoạt động ở mọi nơi.

Phương thức **`__lookupGetter__()`** của các thực thể {{jsxref("Object")}} trả về hàm được gắn làm getter cho thuộc tính được chỉ định.

## Cú pháp

```js-nolint
__lookupGetter__(prop)
```

### Tham số

- `prop`
  - : Một chuỗi chứa tên của thuộc tính mà getter của nó cần được trả về.

### Giá trị trả về

Hàm được gắn làm getter cho thuộc tính được chỉ định. Trả về `undefined` nếu không tìm thấy thuộc tính như vậy, hoặc thuộc tính là một [data property](/en-US/docs/Web/JavaScript/Guide/Data_structures#data_property).

## Mô tả

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả ngoại trừ [đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `__lookupGetter__()`. Nếu một [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) đã được định nghĩa cho thuộc tính của một đối tượng, thì không thể tham chiếu đến hàm getter thông qua thuộc tính đó, vì thuộc tính đó đề cập đến giá trị trả về của hàm đó. `__lookupGetter__()` có thể được sử dụng để lấy tham chiếu đến hàm getter.

`__lookupGetter__()` duyệt ngược lên [prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) để tìm thuộc tính được chỉ định. Nếu bất kỳ đối tượng nào trong prototype chain có [thuộc tính riêng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn) được chỉ định, thuộc tính `get` của [property descriptor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor) cho thuộc tính đó sẽ được trả về. Nếu thuộc tính đó là data property, `undefined` được trả về. Nếu thuộc tính không được tìm thấy trong toàn bộ prototype chain, `undefined` cũng được trả về.

`__lookupGetter__()` được định nghĩa trong đặc tả là "normative optional", nghĩa là không có triển khai nào bắt buộc phải hỗ trợ nó. Tuy nhiên, tất cả các trình duyệt chính đều triển khai nó, và do việc sử dụng liên tục, nó khó có thể bị loại bỏ. Nếu một trình duyệt triển khai `__lookupGetter__()`, nó cũng cần triển khai các phương thức [`__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__), [`__defineGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__), và [`__defineSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__).

## Ví dụ

### Sử dụng \_\_lookupGetter\_\_()

```js
const obj = {
  get foo() {
    return Math.random() > 0.5 ? "foo" : "bar";
  },
};

obj.__lookupGetter__("foo");
// [Function: get foo]
```

### Tra cứu getter của thuộc tính theo cách chuẩn

Bạn nên sử dụng API {{jsxref("Object.getOwnPropertyDescriptor()")}} để tra cứu getter của thuộc tính. So với `__lookupGetter__()`, phương thức này cho phép tra cứu các thuộc tính [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol). Phương thức `Object.getOwnPropertyDescriptor()` cũng hoạt động với [đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects), vốn không kế thừa từ `Object.prototype` và do đó không có phương thức `__lookupGetter__()`. Nếu hành vi duyệt lên prototype chain của `__lookupGetter__()` là quan trọng, bạn có thể tự triển khai nó với {{jsxref("Object.getPrototypeOf()")}}.

```js
const obj = {
  get foo() {
    return Math.random() > 0.5 ? "foo" : "bar";
  },
};

Object.getOwnPropertyDescriptor(obj, "foo").get;
// [Function: get foo]
```

```js
const obj2 = {
  __proto__: {
    get foo() {
      return Math.random() > 0.5 ? "foo" : "bar";
    },
  },
};

function findGetter(obj, prop) {
  while (obj) {
    const desc = Object.getOwnPropertyDescriptor(obj, prop);
    if (desc) {
      return desc.get;
    }
    obj = Object.getPrototypeOf(obj);
  }
}

console.log(findGetter(obj2, "foo")); // [Function: get foo]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Object.prototype.__lookupGetter__` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [`Object.prototype.__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__)
- {{jsxref("Functions/get", "get")}}
- {{jsxref("Object.getOwnPropertyDescriptor()")}}
- [`Object.prototype.__defineGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__)
- [`Object.prototype.__defineSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__)
- [Hướng dẫn JS: Định nghĩa Getter và Setter](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#defining_getters_and_setters)
