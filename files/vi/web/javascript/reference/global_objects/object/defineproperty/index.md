---
title: Object.defineProperty()
short-title: defineProperty()
slug: Web/JavaScript/Reference/Global_Objects/Object/defineProperty
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.defineProperty
sidebar: jsref
---

Phương thức tĩnh **`Object.defineProperty()`** định nghĩa một thuộc tính mới trực tiếp trên một đối tượng, hoặc sửa đổi một thuộc tính hiện có trên một đối tượng, và trả về đối tượng đó.

{{InteractiveExample("JavaScript Demo: Object.defineProperty()")}}

```js interactive-example
const object = {};

Object.defineProperty(object, "foo", {
  value: 42,
  writable: false,
});

object.foo = 77;
// Throws an error in strict mode

console.log(object.foo);
// Expected output: 42
```

## Cú pháp

```js-nolint
Object.defineProperty(obj, prop, descriptor)
```

### Tham số

- `obj`
  - : Đối tượng mà thuộc tính sẽ được định nghĩa.
- `prop`
  - : Một chuỗi hoặc {{jsxref("Symbol")}} chỉ định khóa của thuộc tính cần được định nghĩa hoặc sửa đổi.
- `descriptor`
  - : Descriptor cho thuộc tính đang được định nghĩa hoặc sửa đổi.

### Giá trị trả về

Đối tượng đã được truyền vào hàm, với thuộc tính được chỉ định được thêm vào hoặc sửa đổi.

## Mô tả

`Object.defineProperty()` cho phép thêm hoặc sửa đổi thuộc tính trên một đối tượng một cách chính xác. Việc thêm thuộc tính thông thường qua [gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment) tạo ra các thuộc tính xuất hiện trong quá trình liệt kê thuộc tính ({{jsxref("Statements/for...in", "for...in")}}, {{jsxref("Object.keys()")}}, v.v.), có thể thay đổi giá trị và có thể bị {{jsxref("Operators/delete", "xóa", "", 1)}}. Phương thức này cho phép thay đổi các chi tiết bổ sung này so với giá trị mặc định. Theo mặc định, các thuộc tính được thêm bằng `Object.defineProperty()` không thể ghi, không thể đếm và không thể cấu hình. Ngoài ra, `Object.defineProperty()` sử dụng phương thức nội bộ [`[[DefineOwnProperty]]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty), thay vì [`[[Set]]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/set), vì vậy nó không gọi [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set), ngay cả khi thuộc tính đã tồn tại.

Property descriptor có trong các đối tượng có hai dạng chính: data descriptor và accessor descriptor. **Data descriptor** là thuộc tính có giá trị có thể ghi hoặc không. **Accessor descriptor** là thuộc tính được mô tả bởi một cặp hàm getter-setter. Một descriptor phải là một trong hai dạng; nó không thể là cả hai.

Cả data và accessor descriptor đều là các đối tượng. Chúng chia sẻ các khóa tùy chọn sau (lưu ý: các **giá trị mặc định** đề cập ở đây là trong trường hợp định nghĩa thuộc tính bằng `Object.defineProperty()`):

- `configurable`
  - : khi giá trị này được đặt thành `false`,
    - kiểu của property descriptor này không thể được thay đổi giữa data property và accessor property, và
    - thuộc tính có thể không bị xóa, và
    - các thuộc tính khác của descriptor không thể thay đổi (tuy nhiên, nếu đó là data descriptor với `writable: true`, `value` có thể thay đổi, và `writable` có thể thay đổi thành `false`).

    **Mặc định là `false`.**

- `enumerable`
  - : `true` khi và chỉ khi thuộc tính này xuất hiện trong quá trình liệt kê các thuộc tính trên đối tượng tương ứng. **Mặc định là `false`.**

**Data descriptor** cũng có các khóa tùy chọn sau:

- `value`
  - : Giá trị liên kết với thuộc tính. Có thể là bất kỳ giá trị JavaScript hợp lệ nào (số, đối tượng, hàm, v.v.). **Mặc định là {{jsxref("undefined")}}.**
- `writable`
  - : `true` nếu giá trị liên kết với thuộc tính có thể được thay đổi bằng [toán tử gán](/en-US/docs/Web/JavaScript/Reference/Operators#assignment_operators). **Mặc định là `false`.**

**Accessor descriptor** cũng có các khóa tùy chọn sau:

- `get`
  - : Một hàm đóng vai trò getter cho thuộc tính, hoặc {{jsxref("undefined")}} nếu không có getter. Khi thuộc tính được truy cập, hàm này được gọi không có đối số và với `this` được đặt thành đối tượng mà thuộc tính được truy cập qua (điều này có thể không phải là đối tượng mà thuộc tính được định nghĩa do kế thừa). Giá trị trả về sẽ được sử dụng làm giá trị của thuộc tính. **Mặc định là {{jsxref("undefined")}}.**
- `set`
  - : Một hàm đóng vai trò setter cho thuộc tính, hoặc {{jsxref("undefined")}} nếu không có setter. Khi thuộc tính được gán, hàm này được gọi với một đối số (giá trị đang được gán cho thuộc tính) và với `this` được đặt thành đối tượng mà thuộc tính được gán qua. **Mặc định là {{jsxref("undefined")}}.**

Nếu một descriptor không có bất kỳ khóa `value`, `writable`, `get` và `set` nào, nó được coi là data descriptor. Nếu một descriptor vừa là data descriptor (vì nó có `value` hoặc `writable`) vừa là accessor descriptor (vì nó có `get` hoặc `set`), một ngoại lệ sẽ được ném ra.

Các thuộc tính này không nhất thiết phải là thuộc tính riêng của descriptor. Các thuộc tính kế thừa cũng sẽ được xem xét. Để đảm bảo các giá trị mặc định này được giữ nguyên, bạn có thể đóng băng các đối tượng hiện có trong chuỗi prototype của đối tượng descriptor trước, chỉ định tất cả các tùy chọn một cách rõ ràng, hoặc tạo một [đối tượng `null`-prototype](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects).

```js
const obj = {};
// 1. Sử dụng null-prototype: không có thuộc tính kế thừa
const descriptor = Object.create(null);
descriptor.value = "static";

// không có khả năng đếm, không có khả năng cấu hình, không có khả năng ghi theo mặc định
Object.defineProperty(obj, "key", descriptor);

// 2. Rõ ràng bằng cách sử dụng một object literal dùng một lần với tất cả các thuộc tính
Object.defineProperty(obj, "key2", {
  enumerable: false,
  configurable: false,
  writable: false,
  value: "static",
});

// 3. Ngăn thêm hoặc xóa các thuộc tính prototype của đối tượng
// (value, get, set, enumerable, writable, configurable)
Object.freeze(Object.prototype);
```

Khi thuộc tính đã tồn tại, `Object.defineProperty()` cố gắng sửa đổi thuộc tính theo các giá trị trong descriptor và cấu hình hiện tại của thuộc tính.

Nếu descriptor cũ có thuộc tính `configurable` được đặt thành `false`, thuộc tính được gọi là _không có khả năng cấu hình_. Không thể thay đổi bất kỳ thuộc tính nào của accessor property không có khả năng cấu hình, và không thể chuyển đổi giữa các kiểu data và accessor property. Đối với data property với `writable: true`, có thể sửa đổi giá trị và thay đổi thuộc tính `writable` từ `true` thành `false`. Một {{jsxref("TypeError")}} được ném ra khi cố gắng thay đổi các thuộc tính property descriptor không có khả năng cấu hình (ngoại trừ `value` và `writable`, nếu được phép), ngoại trừ khi định nghĩa một giá trị giống giá trị ban đầu trên data property.

Khi thuộc tính hiện tại có khả năng cấu hình, việc định nghĩa một thuộc tính thành `undefined` sẽ xóa nó một cách hiệu quả. Ví dụ, nếu `o.k` là accessor property, `Object.defineProperty(o, "k", { set: undefined })` sẽ xóa setter, khiến `k` chỉ có getter và trở thành readonly. Nếu một thuộc tính không có trong descriptor mới, giá trị thuộc tính trong descriptor cũ được giữ nguyên (nó sẽ không bị định nghĩa lại ngầm thành `undefined`). Có thể chuyển đổi giữa data và accessor property bằng cách cung cấp một descriptor có "hương vị" khác. Ví dụ, nếu descriptor mới là data descriptor (với `value` hoặc `writable`), các thuộc tính `get` và `set` của descriptor ban đầu sẽ bị loại bỏ.

## Ví dụ

### Tạo một thuộc tính

Khi thuộc tính được chỉ định không tồn tại trong đối tượng, `Object.defineProperty()` tạo một thuộc tính mới như được mô tả. Các trường có thể bị bỏ qua trong descriptor và giá trị mặc định cho các trường đó được nhập vào.

```js
const o = {}; // Tạo một đối tượng mới

// Ví dụ về thuộc tính đối tượng được thêm
// với defineProperty với data property descriptor
Object.defineProperty(o, "a", {
  value: 37,
  writable: true,
  enumerable: true,
  configurable: true,
});
// Thuộc tính 'a' tồn tại trong đối tượng o và có giá trị là 37

// Ví dụ về thuộc tính đối tượng được thêm
// với defineProperty với accessor property descriptor
let bValue = 38;
Object.defineProperty(o, "b", {
  get() {
    return bValue;
  },
  set(newValue) {
    bValue = newValue;
  },
  enumerable: true,
  configurable: true,
});
o.b; // 38
// Thuộc tính 'b' tồn tại trong đối tượng o và có giá trị là 38
// Giá trị của o.b bây giờ luôn giống với bValue,
// trừ khi o.b được định nghĩa lại

// Bạn không thể kết hợp cả hai:
Object.defineProperty(o, "conflict", {
  value: 0x9f91102,
  get() {
    return 0xdeadbeef;
  },
});
// ném TypeError: value chỉ xuất hiện
// trong data descriptor,
// get chỉ xuất hiện trong accessor descriptor
```

### Sửa đổi một thuộc tính

Khi sửa đổi một thuộc tính hiện có, cấu hình thuộc tính hiện tại xác định xem toán tử có thành công, không làm gì, hay ném {{jsxref("TypeError")}}.

#### Thuộc tính writable

Khi thuộc tính `writable` là `false`, thuộc tính được gọi là "không thể ghi". Nó không thể được gán lại. Cố gắng ghi vào một thuộc tính không thể ghi sẽ không thay đổi nó và dẫn đến lỗi trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

```js
const o = {}; // Tạo một đối tượng mới

Object.defineProperty(o, "a", {
  value: 37,
  writable: false,
});

console.log(o.a); // 37
o.a = 25; // Không có lỗi được ném
// (sẽ ném trong strict mode,
// ngay cả khi giá trị là như nhau)
console.log(o.a); // 37; phép gán không hoạt động

// strict mode
(() => {
  "use strict";
  const o = {};
  Object.defineProperty(o, "b", {
    value: 2,
    writable: false,
  });
  o.b = 3; // ném TypeError: "b" is read-only
  return o.b; // trả về 2 không có dòng trên
})();
```

#### Thuộc tính enumerable

Thuộc tính `enumerable` xác định xem thuộc tính có được xem xét bởi {{jsxref("Object.assign()")}} hoặc toán tử [spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) hay không. Đối với các thuộc tính không phải {{jsxref("Symbol")}}, nó cũng xác định xem thuộc tính có xuất hiện trong vòng lặp {{jsxref("Statements/for...in", "for...in")}} và {{jsxref("Object.keys()")}} hay không. Để biết thêm thông tin, xem [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties).

```js
const o = {};
Object.defineProperty(o, "a", {
  value: 1,
  enumerable: true,
});
Object.defineProperty(o, "b", {
  value: 2,
  enumerable: false,
});
Object.defineProperty(o, "c", {
  value: 3,
}); // enumerable mặc định là false
o.d = 4; // enumerable mặc định là true khi tạo thuộc tính bằng cách đặt
Object.defineProperty(o, Symbol.for("e"), {
  value: 5,
  enumerable: true,
});
Object.defineProperty(o, Symbol.for("f"), {
  value: 6,
  enumerable: false,
});

for (const i in o) {
  console.log(i);
}
// In ra 'a' và 'd' (luôn theo thứ tự đó)

Object.keys(o); // ['a', 'd']

o.propertyIsEnumerable("a"); // true
o.propertyIsEnumerable("b"); // false
o.propertyIsEnumerable("c"); // false
o.propertyIsEnumerable("d"); // true
o.propertyIsEnumerable(Symbol.for("e")); // true
o.propertyIsEnumerable(Symbol.for("f")); // false

const p = { ...o };
p.a; // 1
p.b; // undefined
p.c; // undefined
p.d; // 4
p[Symbol.for("e")]; // 5
p[Symbol.for("f")]; // undefined
```

#### Thuộc tính configurable

Thuộc tính `configurable` kiểm soát xem thuộc tính có thể bị xóa khỏi đối tượng và liệu các thuộc tính của nó (khác ngoài `value` và `writable`) có thể thay đổi hay không.

Ví dụ này minh họa accessor property không có khả năng cấu hình.

```js
const o = {};
Object.defineProperty(o, "a", {
  get() {
    return 1;
  },
  configurable: false,
});

Object.defineProperty(o, "a", {
  configurable: true,
}); // ném TypeError
Object.defineProperty(o, "a", {
  enumerable: true,
}); // ném TypeError
Object.defineProperty(o, "a", {
  set() {},
}); // ném TypeError (set trước đó là undefined)
Object.defineProperty(o, "a", {
  get() {
    return 1;
  },
}); // ném TypeError
// (mặc dù get mới làm chính xác điều tương tự)
Object.defineProperty(o, "a", {
  value: 12,
}); // ném TypeError
// ('value' có thể thay đổi khi 'configurable' là false, nhưng chỉ khi thuộc tính là data property có thể ghi)

console.log(o.a); // 1
delete o.a; // Không có gì xảy ra; ném lỗi trong strict mode
console.log(o.a); // 1
```

Nếu thuộc tính `configurable` của `o.a` là `true`, không có lỗi nào được ném ra và thuộc tính sẽ bị xóa ở cuối.

Ví dụ này minh họa data property không có khả năng cấu hình nhưng có thể ghi. `value` của thuộc tính vẫn có thể thay đổi, và `writable` vẫn có thể chuyển đổi từ `true` sang `false`.

```js
const o = {};
Object.defineProperty(o, "b", {
  writable: true,
  configurable: false,
});
console.log(o.b); // undefined
Object.defineProperty(o, "b", {
  value: 1,
}); // Ngay cả khi configurable là false, vì đối tượng có thể ghi, chúng ta vẫn có thể thay thế giá trị
console.log(o.b); // 1
o.b = 2; // Chúng ta cũng có thể thay đổi giá trị bằng toán tử gán
console.log(o.b); // 2
// Chuyển đổi khả năng ghi của thuộc tính
Object.defineProperty(o, "b", {
  writable: false,
});
Object.defineProperty(o, "b", {
  value: 1,
}); // TypeError: vì thuộc tính không thể ghi cũng không có khả năng cấu hình, nó không thể được sửa đổi
// Tại thời điểm này, không có cách nào để sửa đổi thêm 'b'
// hoặc khôi phục khả năng ghi của nó
```

Ví dụ này minh họa data property có khả năng cấu hình nhưng không thể ghi. `value` của thuộc tính vẫn có thể được thay thế bằng `defineProperty` (nhưng không phải bằng toán tử gán), và `writable` có thể được chuyển đổi.

```js
const o = {};
Object.defineProperty(o, "b", {
  writable: false,
  configurable: true,
});
Object.defineProperty(o, "b", {
  value: 1,
}); // Chúng ta có thể thay thế giá trị bằng defineProperty
console.log(o.b); // 1
o.b = 2; // ném TypeError trong strict mode: không thể thay đổi giá trị của thuộc tính không thể ghi bằng gán
```

Ví dụ này minh họa data property không có khả năng cấu hình và không thể ghi. Không có cách nào để cập nhật bất kỳ thuộc tính nào của property, bao gồm cả `value` của nó.

```js
const o = {};
Object.defineProperty(o, "b", {
  writable: false,
  configurable: false,
});
Object.defineProperty(o, "b", {
  value: 1,
}); // TypeError: thuộc tính không thể được sửa đổi vì nó không thể ghi cũng không có khả năng cấu hình.
```

### Thêm thuộc tính và giá trị mặc định

Điều quan trọng là xem xét cách áp dụng các giá trị mặc định của các thuộc tính. Thường có sự khác biệt giữa việc sử dụng [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) để gán giá trị và sử dụng `Object.defineProperty()`, như trong ví dụ dưới đây.

```js
const o = {};

o.a = 1;
// tương đương với:
Object.defineProperty(o, "a", {
  value: 1,
  writable: true,
  configurable: true,
  enumerable: true,
});

// Mặt khác,
Object.defineProperty(o, "a", { value: 1 });
// tương đương với:
Object.defineProperty(o, "a", {
  value: 1,
  writable: false,
  configurable: false,
  enumerable: false,
});
```

### Setter và getter tùy chỉnh

Ví dụ dưới đây cho thấy cách triển khai đối tượng tự lưu trữ. Khi thuộc tính `temperature` được đặt, mảng `archive` nhận một mục nhật ký.

```js
function Archiver() {
  let temperature = null;
  const archive = [];

  Object.defineProperty(this, "temperature", {
    get() {
      console.log("get!");
      return temperature;
    },
    set(value) {
      temperature = value;
      archive.push({ val: temperature });
    },
  });

  this.getArchive = () => archive;
}

const arc = new Archiver();
arc.temperature; // 'get!'
arc.temperature = 11;
arc.temperature = 13;
arc.getArchive(); // [{ val: 11 }, { val: 13 }]
```

Trong ví dụ này, getter luôn trả về cùng một giá trị.

```js
const pattern = {
  get() {
    return "I always return this string, whatever you have assigned";
  },
  set() {
    this.myName = "this is my name string";
  },
};

function TestDefineSetAndGet() {
  Object.defineProperty(this, "myProperty", pattern);
}

const instance = new TestDefineSetAndGet();
instance.myProperty = "test";
console.log(instance.myProperty);
// I always return this string, whatever you have assigned

console.log(instance.myName); // this is my name string
```

### Kế thừa thuộc tính

Nếu một accessor property được kế thừa, các phương thức `get` và `set` của nó sẽ được gọi khi thuộc tính được truy cập và sửa đổi trên các đối tượng con cháu. Nếu các phương thức này sử dụng một biến để lưu giá trị, giá trị này sẽ được chia sẻ bởi tất cả các đối tượng.

```js
function MyClass() {}

let value;
Object.defineProperty(MyClass.prototype, "x", {
  get() {
    return value;
  },
  set(x) {
    value = x;
  },
});

const a = new MyClass();
const b = new MyClass();
a.x = 1;
console.log(b.x); // 1
```

Điều này có thể được sửa bằng cách lưu giá trị trong một thuộc tính khác. Trong các phương thức `get` và `set`, `this` trỏ đến đối tượng được sử dụng để truy cập hoặc sửa đổi thuộc tính.

```js
function MyClass() {}

Object.defineProperty(MyClass.prototype, "x", {
  get() {
    return this.storedX;
  },
  set(x) {
    this.storedX = x;
  },
});

const a = new MyClass();
const b = new MyClass();
a.x = 1;
console.log(b.x); // undefined
```

Không giống như accessor property, data property luôn được đặt trên chính đối tượng, không phải trên prototype. Tuy nhiên, nếu một data property không thể ghi được kế thừa, nó vẫn bị ngăn không cho sửa đổi trên đối tượng.

```js
function MyClass() {}

MyClass.prototype.x = 1;
Object.defineProperty(MyClass.prototype, "y", {
  writable: false,
  value: 1,
});

const a = new MyClass();
a.x = 2;
console.log(a.x); // 2
console.log(MyClass.prototype.x); // 1
a.y = 2; // Bị bỏ qua, ném lỗi trong strict mode
console.log(a.y); // 1
console.log(MyClass.prototype.y); // 1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
- {{jsxref("Object.defineProperties()")}}
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
- {{jsxref("Object.getOwnPropertyDescriptor()")}}
- {{jsxref("Functions/get", "get")}}
- {{jsxref("Functions/set", "set")}}
- {{jsxref("Object.create()")}}
- {{jsxref("Reflect.defineProperty()")}}
