---
title: Object.prototype.isPrototypeOf()
short-title: isPrototypeOf()
slug: Web/JavaScript/Reference/Global_Objects/Object/isPrototypeOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.Object.isPrototypeOf
sidebar: jsref
---

Phương thức **`isPrototypeOf()`** của các instance {{jsxref("Object")}} kiểm tra xem đối tượng này có tồn tại trong chuỗi prototype của một đối tượng khác hay không.

> [!NOTE]
> `isPrototypeOf()` khác với toán tử [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof). Trong biểu thức `object instanceof AFunction`, chuỗi prototype của `object` được kiểm tra so với `AFunction.prototype`, không phải so với chính `AFunction`.

{{InteractiveExample("JavaScript Demo: Object.prototype.isPrototypeOf()")}}

```js interactive-example
function Foo() {}
function Bar() {}

Bar.prototype = Object.create(Foo.prototype);

const bar = new Bar();

console.log(Foo.prototype.isPrototypeOf(bar));
// Expected output: true
console.log(Bar.prototype.isPrototypeOf(bar));
// Expected output: true
```

## Cú pháp

```js-nolint
isPrototypeOf(object)
```

### Tham số

- `object`
  - : Đối tượng cần tìm kiếm trong chuỗi prototype của nó.

### Giá trị trả về

Một boolean cho biết đối tượng gọi (`this`) có nằm trong chuỗi prototype của `object` hay không. Trả về trực tiếp `false` khi `object` không phải đối tượng (tức là một primitive).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `this` là `null` hoặc `undefined` (vì nó không thể được [chuyển đổi thành đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion)).

## Mô tả

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả trừ [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `isPrototypeOf()`. Phương thức này cho phép bạn kiểm tra xem đối tượng có tồn tại trong chuỗi prototype của đối tượng khác hay không. Nếu `object` được truyền làm tham số không phải đối tượng (tức là một primitive), phương thức trả về trực tiếp `false`. Ngược lại, giá trị `this` được [chuyển đổi thành đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#object_coercion), và chuỗi prototype của `object` được tìm kiếm giá trị `this`, cho đến khi đạt đến cuối chuỗi hoặc tìm thấy giá trị `this`.

## Ví dụ

### Sử dụng isPrototypeOf()

Ví dụ này chứng minh rằng `Baz.prototype`, `Bar.prototype`, `Foo.prototype` và `Object.prototype` tồn tại trong chuỗi prototype của đối tượng `baz`:

```js
class Foo {}
class Bar extends Foo {}
class Baz extends Bar {}

const foo = new Foo();
const bar = new Bar();
const baz = new Baz();

// prototype chains:
// foo: Foo --> Object
// bar: Bar --> Foo --> Object
// baz: Baz --> Bar --> Foo --> Object
console.log(Baz.prototype.isPrototypeOf(baz)); // true
console.log(Baz.prototype.isPrototypeOf(bar)); // false
console.log(Baz.prototype.isPrototypeOf(foo)); // false
console.log(Bar.prototype.isPrototypeOf(baz)); // true
console.log(Bar.prototype.isPrototypeOf(foo)); // false
console.log(Foo.prototype.isPrototypeOf(baz)); // true
console.log(Foo.prototype.isPrototypeOf(bar)); // true
console.log(Object.prototype.isPrototypeOf(baz)); // true
```

Phương thức `isPrototypeOf()` — cùng với toán tử {{jsxref("Operators/instanceof", "instanceof")}} — đặc biệt hữu ích khi bạn có mã chỉ có thể hoạt động khi làm việc với các đối tượng kế thừa từ một chuỗi prototype cụ thể; ví dụ, để đảm bảo rằng các phương thức hoặc thuộc tính nhất định sẽ có mặt trên đối tượng đó.

Ví dụ, để thực thi một số mã chỉ an toàn khi đối tượng `baz` có `Foo.prototype` trong chuỗi prototype của nó, bạn có thể làm như sau:

```js
if (Foo.prototype.isPrototypeOf(baz)) {
  // do something safe
}
```

Tuy nhiên, `Foo.prototype` tồn tại trong chuỗi prototype của `baz` không có nghĩa là `baz` được tạo bằng `Foo` làm constructor. Ví dụ, `baz` có thể được gán trực tiếp với `Foo.prototype` làm prototype. Trong trường hợp này, nếu mã của bạn đọc [private field](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) của `Foo` từ `baz`, nó vẫn sẽ thất bại:

```js
class Foo {
  #value = "foo";
  static getValue(x) {
    return x.#value;
  }
}

const baz = { __proto__: Foo.prototype };

if (Foo.prototype.isPrototypeOf(baz)) {
  console.log(Foo.getValue(baz)); // TypeError: Cannot read private member #value from an object whose class did not declare it
}
```

Điều tương tự cũng áp dụng cho [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof). Nếu bạn cần đọc các private field một cách an toàn, hãy cung cấp một phương thức kiểm tra branded dùng [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) thay thế.

```js
class Foo {
  #value = "foo";
  static getValue(x) {
    return x.#value;
  }
  static isFoo(x) {
    return #value in x;
  }
}

const baz = { __proto__: Foo.prototype };

if (Foo.isFoo(baz)) {
  // Doesn't run, because baz is not a Foo
  console.log(Foo.getValue(baz));
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Operators/instanceof", "instanceof")}}
- {{jsxref("Object.getPrototypeOf()")}}
- {{jsxref("Object.setPrototypeOf()")}}
- [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
