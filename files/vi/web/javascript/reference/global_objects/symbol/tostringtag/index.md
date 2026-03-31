---
title: Symbol.toStringTag
short-title: toStringTag
slug: Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.toStringTag
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.toStringTag`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.toStringTag`. {{jsxref("Object.prototype.toString()")}} tra cứu symbol này trên giá trị `this` cho thuộc tính chứa chuỗi đại diện cho kiểu của đối tượng.

{{InteractiveExample("JavaScript Demo: Symbol.toStringTag")}}

```js interactive-example
class ValidatorClass {
  get [Symbol.toStringTag]() {
    return "Validator";
  }
}

console.log(Object.prototype.toString.call(new ValidatorClass()));
// Expected output: "[object Validator]"
```

## Giá trị

Well-known symbol `Symbol.toStringTag`.

{{js_property_attributes(0, 0, 0)}}

## Ví dụ

### Tag mặc định

Một số giá trị không có `Symbol.toStringTag`, nhưng có biểu diễn `toString()` đặc biệt. Để xem danh sách đầy đủ, hãy xem {{jsxref("Object.prototype.toString()")}}.

```js
Object.prototype.toString.call("foo"); // "[object String]"
Object.prototype.toString.call([1, 2]); // "[object Array]"
Object.prototype.toString.call(3); // "[object Number]"
Object.prototype.toString.call(true); // "[object Boolean]"
Object.prototype.toString.call(undefined); // "[object Undefined]"
Object.prototype.toString.call(null); // "[object Null]"
// … và nhiều hơn nữa
```

### Symbol toStringTag tích hợp sẵn

Hầu hết các đối tượng tích hợp sẵn đều cung cấp thuộc tính `[Symbol.toStringTag]` của riêng chúng. Hầu hết thuộc tính `[Symbol.toStringTag]` của các đối tượng tích hợp sẵn đều không thể ghi, không thể liệt kê và có thể cấu hình; ngoại lệ là {{jsxref("Iterator")}}, vốn có thể ghi vì lý do tương thích.

Đối với các đối tượng constructor như {{jsxref("Promise")}}, thuộc tính được cài đặt trên `Constructor.prototype`, để tất cả các instance của constructor kế thừa `[Symbol.toStringTag]` và có thể được chuyển thành chuỗi. Đối với các đối tượng không phải constructor như {{jsxref("Math")}} và {{jsxref("JSON")}}, thuộc tính được cài đặt như thuộc tính tĩnh, để bản thân đối tượng namespace có thể được chuyển thành chuỗi. Đôi khi, constructor cũng cung cấp phương thức `toString` riêng của nó (ví dụ: {{jsxref("Intl.Locale")}}), trong trường hợp đó thuộc tính `[Symbol.toStringTag]` chỉ được dùng khi bạn gọi rõ ràng `Object.prototype.toString` trên nó.

```js
Object.prototype.toString.call(new Map()); // "[object Map]"
Object.prototype.toString.call(function* () {}); // "[object GeneratorFunction]"
Object.prototype.toString.call(Promise.resolve()); // "[object Promise]"
// … và nhiều hơn nữa
```

### Tag tùy chỉnh với toStringTag

Khi tạo class của riêng bạn, JavaScript mặc định sử dụng tag "Object":

```js
class ValidatorClass {}

Object.prototype.toString.call(new ValidatorClass()); // "[object Object]"
```

Bây giờ, với sự trợ giúp của `toStringTag`, bạn có thể đặt tag tùy chỉnh của riêng mình:

```js
class ValidatorClass {
  get [Symbol.toStringTag]() {
    return "Validator";
  }
}

Object.prototype.toString.call(new ValidatorClass()); // "[object Validator]"
```

### toStringTag có sẵn trên tất cả các đối tượng prototype DOM

Do [thay đổi WebIDL spec](https://github.com/whatwg/webidl/pull/357) vào giữa năm 2020, các trình duyệt đang thêm thuộc tính `Symbol.toStringTag` vào tất cả các đối tượng prototype DOM. Ví dụ, để truy cập thuộc tính `Symbol.toStringTag` trên {{domxref("HTMLButtonElement")}}:

```js
const test = document.createElement("button");
test.toString(); // "[object HTMLButtonElement]"
test[Symbol.toStringTag]; // "HTMLButtonElement"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.toStringTag` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Object.prototype.toString()")}}
