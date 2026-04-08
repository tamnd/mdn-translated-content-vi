---
title: Object.prototype.__defineSetter__()
short-title: __defineSetter__()
slug: Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.Object.defineSetter
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tính năng này đã bị loại bỏ và thay thế bằng cách định nghĩa [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) sử dụng [cú pháp khởi tạo đối tượng](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) hoặc API {{jsxref("Object.defineProperty()")}}. Hành vi của phương thức này chỉ được chỉ định nhằm đảm bảo tương thích web, và không bắt buộc phải được triển khai trên mọi nền tảng. Nó có thể không hoạt động ở mọi nơi.

Phương thức **`__defineSetter__()`** của các thực thể {{jsxref("Object")}} gắn một thuộc tính của đối tượng với một hàm sẽ được gọi khi có thao tác cố gắng gán giá trị cho thuộc tính đó.

## Cú pháp

```js-nolint
__defineSetter__(prop, func)
```

### Tham số

- `prop`
  - : Một chuỗi chứa tên của thuộc tính mà setter `func` được gắn vào.
- `func`
  - : Một hàm được gọi khi có thao tác cố gắng gán giá trị cho thuộc tính đã chỉ định. Hàm này nhận tham số sau:
    - `val`
      - : Giá trị được cố gắng gán cho `prop`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `func` không phải là một hàm.

## Mô tả

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả ngoại trừ [đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `__defineSetter__()`. Phương thức này cho phép định nghĩa một [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) trên một đối tượng đã tồn tại. Điều này tương đương với [`Object.defineProperty(obj, prop, { set: func, configurable: true, enumerable: true })`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty), nghĩa là thuộc tính có thể liệt kê được và có thể cấu hình được, và bất kỳ getter nào đã tồn tại, nếu có, sẽ được giữ nguyên.

`__defineSetter__()` được định nghĩa trong đặc tả là "normative optional", nghĩa là không có triển khai nào bắt buộc phải hỗ trợ nó. Tuy nhiên, tất cả các trình duyệt chính đều triển khai nó, và do việc sử dụng liên tục, nó khó có thể bị loại bỏ. Nếu một trình duyệt triển khai `__defineSetter__()`, nó cũng cần triển khai các phương thức [`__lookupGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__), [`__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__), và [`__defineGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__).

## Ví dụ

### Sử dụng \_\_defineSetter\_\_()

```js
const o = {};
o.__defineSetter__("value", function (val) {
  this.anotherValue = val;
});
o.value = 5;
console.log(o.value); // undefined
console.log(o.anotherValue); // 5
```

### Định nghĩa thuộc tính setter theo cách chuẩn

Bạn có thể sử dụng cú pháp `set` để định nghĩa setter khi đối tượng được khởi tạo lần đầu.

```js
const o = {
  set value(val) {
    this.anotherValue = val;
  },
};
o.value = 5;
console.log(o.value); // undefined
console.log(o.anotherValue); // 5
```

Bạn cũng có thể sử dụng {{jsxref("Object.defineProperty()")}} để định nghĩa setter trên một đối tượng sau khi nó đã được tạo. So với `__defineSetter__()`, phương thức này cho phép bạn kiểm soát khả năng liệt kê và khả năng cấu hình của setter, cũng như định nghĩa các thuộc tính [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol). Phương thức `Object.defineProperty()` cũng hoạt động với [đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects), vốn không kế thừa từ `Object.prototype` và do đó không có phương thức `__defineSetter__()`.

```js
const o = {};
Object.defineProperty(o, "value", {
  set(val) {
    this.anotherValue = val;
  },
  configurable: true,
  enumerable: true,
});
o.value = 5;
console.log(o.value); // undefined
console.log(o.anotherValue); // 5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Object.prototype.__defineSetter__` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [`Object.prototype.__defineGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__)
- {{jsxref("Functions/set", "set")}}
- {{jsxref("Object.defineProperty()")}}
- [`Object.prototype.__lookupGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__)
- [`Object.prototype.__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__)
- [Hướng dẫn JS: Định nghĩa Getter và Setter](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#defining_getters_and_setters)
- [Firefox bug 647423](https://bugzil.la/647423)
