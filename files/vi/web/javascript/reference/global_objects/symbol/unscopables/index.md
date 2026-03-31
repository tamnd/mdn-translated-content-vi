---
title: Symbol.unscopables
short-title: unscopables
slug: Web/JavaScript/Reference/Global_Objects/Symbol/unscopables
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.unscopables
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.unscopables`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.unscopables`. Câu lệnh {{jsxref("Statements/with", "with")}} tra cứu symbol này trên đối tượng phạm vi để tìm thuộc tính chứa tập hợp các thuộc tính không nên trở thành các ràng buộc trong môi trường `with`.

{{InteractiveExample("JavaScript Demo: Symbol.unscopables")}}

```js interactive-example
const object = {
  foo: 42,
};

object[Symbol.unscopables] = {
  foo: true,
};

with (object) {
  console.log(foo);
  // Expected output: Error: foo is not defined
}
```

## Giá trị

Well-known symbol `Symbol.unscopables`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Symbol `[Symbol.unscopables]` (truy cập thông qua `Symbol.unscopables`) có thể được định nghĩa trên bất kỳ đối tượng nào để loại trừ tên thuộc tính khỏi việc được hiển thị như biến từ vựng trong các ràng buộc môi trường [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with). Lưu ý rằng khi dùng [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), các câu lệnh `with` không khả dụng, và symbol này có thể không cần thiết.

Đặt thuộc tính của đối tượng `[Symbol.unscopables]` thành `true` (hoặc bất kỳ giá trị [truthy](/en-US/docs/Glossary/Truthy) nào) sẽ làm cho thuộc tính tương ứng của đối tượng phạm vi `with` trở nên _unscopable_ và do đó sẽ không được giới thiệu vào phạm vi thân `with`. Đặt thuộc tính thành `false` (hoặc bất kỳ giá trị [falsy](/en-US/docs/Glossary/Falsy) nào) sẽ làm cho nó _scopable_ và do đó xuất hiện như biến phạm vi từ vựng.

Khi quyết định xem `x` có phải là unscopable không, toàn bộ chuỗi prototype của thuộc tính `[Symbol.unscopables]` được tra cứu để tìm thuộc tính có tên `x`. Điều này có nghĩa là nếu bạn khai báo `[Symbol.unscopables]` là một đối tượng thông thường, các thuộc tính `Object.prototype` như [`toString`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) cũng sẽ trở nên unscopable, điều này có thể gây ra sự không tương thích ngược đối với mã cũ giả định rằng các thuộc tính đó thường được scoped (xem [ví dụ bên dưới](#avoid_using_a_non-null-prototype_object_as_symbol.unscopables)). Bạn nên đặt thuộc tính `[Symbol.unscopables]` tùy chỉnh của mình có `null` làm prototype, như [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables) làm.

Giao thức này cũng được DOM API sử dụng, chẳng hạn như [`Element.prototype.append()`](/en-US/docs/Web/API/Element/append).

## Ví dụ

### Scoping trong câu lệnh with

Đoạn mã sau hoạt động tốt trong ES5 và trước đó. Tuy nhiên, trong ECMAScript 2015, phương thức {{jsxref("Array.prototype.values()")}} được giới thiệu. Điều đó có nghĩa là bên trong môi trường `with`, "values" bây giờ sẽ là phương thức `Array.prototype.values()` chứ không phải biến bên ngoài câu lệnh `with`.

```js
var values = [];

with (values) {
  // Nếu [Symbol.unscopables] không tồn tại, values sẽ trở thành
  // Array.prototype.values bắt đầu từ ECMAScript 2015.
  // Và một lỗi sẽ xảy ra.
  values.push("something");
}
```

Mã chứa `with (values)` gây ra một số trang web bị lỗi trong Firefox khi `Array.prototype.values()` được thêm vào ([Firefox Bug 883914](https://bugzil.la/883914)). Hơn nữa, điều này ngụ ý rằng bất kỳ bổ sung phương thức mảng trong tương lai nào cũng có thể gây lỗi nếu nó thay đổi phạm vi `with` một cách ngầm định. Do đó, symbol `[Symbol.unscopables]` được giới thiệu và triển khai trên `Array` như [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables) để ngăn một số phương thức Array bị scoped vào câu lệnh `with`.

### Unscopables trong đối tượng

Bạn cũng có thể đặt `[Symbol.unscopables]` cho các đối tượng của riêng mình.

```js
const obj = {
  foo: 1,
  bar: 2,
  baz: 3,
};

obj[Symbol.unscopables] = {
  // Làm đối tượng có prototype `null` để ngăn
  // các phương thức `Object.prototype` trở nên unscopable
  __proto__: null,
  // `foo` sẽ là scopable
  foo: false,
  // `bar` sẽ là unscopable
  bar: true,
  // `baz` bị bỏ qua; vì `undefined` là falsy, nó cũng là scopable (mặc định)
};

with (obj) {
  console.log(foo); // 1
  console.log(bar); // ReferenceError: bar is not defined
  console.log(baz); // 3
}
```

### Tránh dùng đối tượng có prototype không phải null như `[Symbol.unscopables]`

Khai báo `[Symbol.unscopables]` là một đối tượng thông thường mà không loại bỏ prototype của nó có thể gây ra các lỗi tinh tế. Hãy xem xét đoạn mã sau hoạt động trước `[Symbol.unscopables]`:

```js
const character = {
  name: "Yoda",
  toString: function () {
    return "Use with statements, you must not";
  },
};

with (character) {
  console.log(name + ' says: "' + toString() + '"'); // Yoda says: "Use with statements, you must not"
}
```

Để bảo tồn khả năng tương thích ngược, bạn quyết định thêm thuộc tính `[Symbol.unscopables]` khi thêm nhiều thuộc tính hơn vào `character`. Bạn có thể làm điều đó một cách ngây thơ như:

```js example-bad
const character = {
  name: "Yoda",
  toString: function () {
    return "Use with statements, you must not";
  },
  student: "Luke",
  [Symbol.unscopables]: {
    // Làm `student` unscopable
    student: true,
  },
};
```

Tuy nhiên, đoạn mã trên bây giờ bị lỗi:

```js
with (character) {
  console.log(name + ' says: "' + toString() + '"'); // Yoda says: "[object Undefined]"
}
```

Điều này là do khi tra cứu `character[Symbol.unscopables].toString`, nó trả về [`Object.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString), là giá trị truthy, do đó làm cho lời gọi `toString()` trong câu lệnh `with()` tham chiếu đến `globalThis.toString()` thay thế — và vì nó được gọi mà không có [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), `this` là `undefined`, khiến nó trả về `[object Undefined]`.

Ngay cả khi phương thức không bị ghi đè bởi `character`, làm nó unscopable sẽ thay đổi giá trị của `this`.

```js
const proto = {};
const obj = { __proto__: proto };

with (proto) {
  console.log(isPrototypeOf(obj)); // true; `isPrototypeOf` là scoped và `this` là `proto`
}

proto[Symbol.unscopables] = {};

with (proto) {
  console.log(isPrototypeOf(obj)); // TypeError: Cannot convert undefined or null to object
  // `isPrototypeOf` là unscoped và `this` là undefined
}
```

Để khắc phục điều này, hãy luôn đảm bảo `[Symbol.unscopables]` chỉ chứa các thuộc tính bạn muốn unscopable, mà không có các thuộc tính `Object.prototype`.

```js example-good
const character = {
  name: "Yoda",
  toString: function () {
    return "Use with statements, you must not";
  },
  student: "Luke",
  [Symbol.unscopables]: {
    // Làm đối tượng có prototype `null` để ngăn
    // các phương thức `Object.prototype` trở nên unscopable
    __proto__: null,
    // Làm `student` unscopable
    student: true,
  },
};
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables)
- [`with`](/en-US/docs/Web/JavaScript/Reference/Statements/with)
- [`Element.prototype.append()`](/en-US/docs/Web/API/Element/append)
