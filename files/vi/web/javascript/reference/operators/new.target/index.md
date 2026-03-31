---
title: new.target
slug: Web/JavaScript/Reference/Operators/new.target
page-type: javascript-language-feature
browser-compat: javascript.operators.new_target
sidebar: jssidebar
---

Meta-property **`new.target`** cho phép bạn phát hiện xem một hàm hoặc constructor có được gọi bằng toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay không. Trong các constructors và hàm được gọi bằng toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), `new.target` trả về tham chiếu đến constructor hoặc hàm mà `new` được gọi trên đó. Trong các lời gọi hàm thông thường, `new.target` là {{jsxref("undefined")}}.

{{InteractiveExample("JavaScript Demo: new.target")}}

```js interactive-example
function Foo() {
  if (!new.target) {
    throw new TypeError("calling Foo constructor without new is invalid");
  }
}

try {
  Foo();
} catch (e) {
  console.log(e);
  // Expected output: TypeError: calling Foo constructor without new is invalid
}
```

## Cú pháp

```js-nolint
new.target
```

### Giá trị

`new.target` được đảm bảo là giá trị hàm có thể construct hoặc `undefined`.

- Trong class constructors, nó tham chiếu đến class mà `new` được gọi trên đó, có thể là subclass của constructor hiện tại, vì các subclass gọi transitive constructor của superclass thông qua [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super).
- Trong các hàm thông thường, nếu hàm được tạo trực tiếp với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), `new.target` tham chiếu đến chính hàm đó. Nếu hàm được gọi không có `new`, `new.target` là {{jsxref("undefined")}}. Các hàm có thể được dùng như base class cho [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends), trong trường hợp đó `new.target` có thể tham chiếu đến subclass.
- Nếu constructor (class hoặc hàm) được gọi qua {{jsxref("Reflect.construct()")}}, thì `new.target` tham chiếu đến giá trị được truyền vào làm `newTarget` (mặc định là `target`).
- Trong [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), `new.target` được kế thừa từ phạm vi bao quanh. Nếu arrow function không được định nghĩa trong class hoặc hàm khác có {{Glossary("binding")}} `new.target`, thì syntax error sẽ bị ném ra.
- Trong [các khối khởi tạo static](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks), `new.target` là {{jsxref("undefined")}}.

## Mô tả

Cú pháp `new.target` bao gồm từ khóa `new`, một dấu chấm, và định danh `target`. Vì `new` là [reserved word](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words), không phải định danh, đây không phải là [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), mà là cú pháp biểu thức đặc biệt.

Meta-property `new.target` có sẵn trong tất cả các thân hàm/class; dùng `new.target` bên ngoài hàm hoặc class là syntax error.

## Ví dụ

### new\.target trong lời gọi hàm

Trong các lời gọi hàm thông thường (ngược với lời gọi constructor function), `new.target` là {{jsxref("undefined")}}. Điều này cho phép bạn phát hiện xem hàm có được gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) như constructor hay không.

```js
function Foo() {
  if (!new.target) {
    throw new Error("Foo() must be called with new");
  }
  console.log("Foo instantiated with new");
}

new Foo(); // Logs "Foo instantiated with new"
Foo(); // Throws "Foo() must be called with new"
```

### new\.target trong constructors

Trong class constructors, `new.target` tham chiếu đến constructor được gọi trực tiếp bởi `new`. Đây cũng là trường hợp nếu constructor ở trong parent class và được ủy quyền từ child constructor. `new.target` trỏ đến class mà `new` được gọi trên đó. Ví dụ, khi `b` được khởi tạo bằng `new B()`, tên của `B` được in; và tương tự, trong trường hợp `a`, tên của class `A` được in.

```js
class A {
  constructor() {
    console.log(new.target.name);
  }
}

class B extends A {
  constructor() {
    super();
  }
}

const a = new A(); // Logs "A"
const b = new B(); // Logs "B"
```

### new\.target sử dụng Reflect.construct()

Trước {{jsxref("Reflect.construct()")}} hoặc classes, cách phổ biến để thực hiện kế thừa là truyền giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), và để base constructor biến đổi nó.

```js example-bad
function Base() {
  this.name = "Base";
}

function Extended() {
  // Only way to make the Base() constructor work on the existing
  // `this` value instead of a new object that `new` creates.
  Base.call(this);
  this.otherProperty = "Extended";
}

Object.setPrototypeOf(Extended.prototype, Base.prototype);
Object.setPrototypeOf(Extended, Base);

console.log(new Extended()); // Extended { name: 'Base', otherProperty: 'Extended' }
```

Tuy nhiên, {{jsxref("Function/call", "call()")}} và {{jsxref("Function/apply", "apply()")}} thực sự _gọi_ hàm thay vì _tạo_ nó, vì vậy `new.target` có giá trị `undefined`. Điều này có nghĩa là nếu `Base()` kiểm tra xem nó có được tạo với `new` không, lỗi sẽ bị ném ra, hoặc nó có thể hoạt động theo những cách không mong muốn khác. Ví dụ, bạn không thể extend [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Map) theo cách này, vì constructor `Map()` không thể được gọi mà không có `new`.

Tất cả các built-in constructors trực tiếp tạo toàn bộ prototype chain của instance mới bằng cách đọc `new.target.prototype`. Vì vậy để đảm bảo rằng (1) `Base` được tạo với `new`, và (2) `new.target` trỏ đến subclass thay vì chính `Base`, chúng ta cần dùng {{jsxref("Reflect.construct()")}}.

```js
function BetterMap(entries) {
  // Call the base class constructor, but setting `new.target` to the subclass,
  // so that the instance created has the correct prototype chain.
  return Reflect.construct(Map, [entries], BetterMap);
}

BetterMap.prototype.upsert = function (key, actions) {
  if (this.has(key)) {
    this.set(key, actions.update(this.get(key)));
  } else {
    this.set(key, actions.insert());
  }
};

Object.setPrototypeOf(BetterMap.prototype, Map.prototype);
Object.setPrototypeOf(BetterMap, Map);

const map = new BetterMap([["a", 1]]);
map.upsert("a", {
  update: (value) => value + 1,
  insert: () => 1,
});
console.log(map.get("a")); // 2
```

> [!NOTE]
> Thực tế, do thiếu `Reflect.construct()`, không thể subclass đúng cách các built-ins (như [Error subclassing](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error#custom_error_types)) khi transpile sang code pre-ES6.

Tuy nhiên, nếu bạn viết code ES6, hãy ưu tiên dùng classes và `extends` thay thế, vì nó dễ đọc hơn và ít bị lỗi hơn.

```js
class BetterMap extends Map {
  // The constructor is omitted because it's just the default one

  upsert(key, actions) {
    if (this.has(key)) {
      this.set(key, actions.update(this.get(key)));
    } else {
      this.set(key, actions.insert());
    }
  }
}

const map = new BetterMap([["a", 1]]);
map.upsert("a", {
  update: (value) => value + 1,
  insert: () => 1,
});
console.log(map.get("a")); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new)
- [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this)
