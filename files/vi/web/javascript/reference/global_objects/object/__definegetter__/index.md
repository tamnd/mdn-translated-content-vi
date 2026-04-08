---
title: Object.prototype.__defineGetter__()
short-title: __defineGetter__()
slug: Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__
page-type: javascript-instance-method
status:
  - deprecated
browser-compat: javascript.builtins.Object.defineGetter
sidebar: jsref
---

{{Deprecated_Header}}

> [!NOTE]
> Tính năng này đã bị loại bỏ và thay thế bằng cách định nghĩa [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) sử dụng [cú pháp khởi tạo đối tượng](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) hoặc API {{jsxref("Object.defineProperty()")}}. Hành vi của phương thức này chỉ được chỉ định nhằm đảm bảo tương thích web, và không bắt buộc phải được triển khai trên mọi nền tảng. Nó có thể không hoạt động ở mọi nơi.

Phương thức **`__defineGetter__()`** của các thực thể {{jsxref("Object")}} gắn một thuộc tính của đối tượng với một hàm sẽ được gọi khi thuộc tính đó được tra cứu.

## Cú pháp

```js-nolint
__defineGetter__(prop, func)
```

### Tham số

- `prop`
  - : Một chuỗi chứa tên của thuộc tính mà getter `func` được gắn vào.
- `func`
  - : Một hàm được gắn vào thao tác tra cứu thuộc tính đã chỉ định.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `func` không phải là một hàm.

## Mô tả

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả ngoại trừ [đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `__defineGetter__()`. Phương thức này cho phép định nghĩa một [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) trên một đối tượng đã tồn tại. Điều này tương đương với [`Object.defineProperty(obj, prop, { get: func, configurable: true, enumerable: true })`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty), nghĩa là thuộc tính có thể liệt kê được và có thể cấu hình được, và bất kỳ setter nào đã tồn tại, nếu có, sẽ được giữ nguyên.

`__defineGetter__()` được định nghĩa trong đặc tả là "normative optional", nghĩa là không có triển khai nào bắt buộc phải hỗ trợ nó. Tuy nhiên, tất cả các trình duyệt chính đều triển khai nó, và do việc sử dụng liên tục, nó khó có thể bị loại bỏ. Nếu một trình duyệt triển khai `__defineGetter__()`, nó cũng cần triển khai các phương thức [`__lookupGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__), [`__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__), và [`__defineSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__).

## Ví dụ

### Sử dụng \_\_defineGetter\_\_()

```js
const o = {};
o.__defineGetter__("gimmeFive", function () {
  return 5;
});
console.log(o.gimmeFive); // 5
```

### Định nghĩa thuộc tính getter theo cách chuẩn

Bạn có thể sử dụng cú pháp `get` để định nghĩa getter khi đối tượng được khởi tạo lần đầu.

```js
const o = {
  get gimmeFive() {
    return 5;
  },
};
console.log(o.gimmeFive); // 5
```

Bạn cũng có thể sử dụng {{jsxref("Object.defineProperty()")}} để định nghĩa getter trên một đối tượng sau khi nó đã được tạo. So với `__defineGetter__()`, phương thức này cho phép bạn kiểm soát khả năng liệt kê và khả năng cấu hình của getter, cũng như định nghĩa các thuộc tính [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol). Phương thức `Object.defineProperty()` cũng hoạt động với [đối tượng có prototype là `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects), vốn không kế thừa từ `Object.prototype` và do đó không có phương thức `__defineGetter__()`.

```js
const o = {};
Object.defineProperty(o, "gimmeFive", {
  get() {
    return 5;
  },
  configurable: true,
  enumerable: true,
});
console.log(o.gimmeFive); // 5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Object.prototype.__defineGetter__` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- [`Object.prototype.__defineSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__)
- {{jsxref("Functions/get", "get")}}
- {{jsxref("Object.defineProperty()")}}
- [`Object.prototype.__lookupGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__)
- [`Object.prototype.__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__)
- [Hướng dẫn JS: Định nghĩa Getter và Setter](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#defining_getters_and_setters)
- [Firefox bug 647423](https://bugzil.la/647423)
