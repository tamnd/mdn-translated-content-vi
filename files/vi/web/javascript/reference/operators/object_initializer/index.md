---
title: Object initializer
slug: Web/JavaScript/Reference/Operators/Object_initializer
page-type: javascript-language-feature
browser-compat: javascript.operators.object_initializer
sidebar: jssidebar
---

**Object initializer** (khởi tạo đối tượng) là danh sách các cặp tên thuộc tính và giá trị tương ứng của đối tượng, được phân tách bằng dấu phẩy và đặt trong cặp dấu ngoặc nhọn (`{}`), có thể có không hoặc nhiều cặp. Đối tượng cũng có thể được khởi tạo bằng [`Object.create()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create) hoặc [bằng cách gọi hàm constructor](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#using_a_constructor_function) với toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).

{{InteractiveExample("JavaScript Demo: Object initializer", "taller")}}

```js interactive-example
const object1 = { a: "foo", b: 42, c: {} };

console.log(object1.a);
// Expected output: "foo"

const a = "foo";
const b = 42;
const c = {};
const object2 = { a: a, b: b, c: c };

console.log(object2.b);
// Expected output: 42

const object3 = { a, b, c };

console.log(object3.a);
// Expected output: "foo"
```

## Cú pháp

```js-nolint
o = {
  a: "foo",
  b: 42,
  c: {},
  1: "number literal property",
  "foo:bar": "string literal property",

  shorthandProperty,

  method(parameters) {
    // …
  },

  get property() {},
  set property(value) {},

  [expression]: "computed property",

  __proto__: prototype,

  ...spreadProperty,
};
```

## Mô tả

Object initializer là một biểu thức mô tả việc khởi tạo một {{jsxref("Object")}}. Đối tượng bao gồm các _thuộc tính_ (properties), được dùng để mô tả đối tượng đó. Giá trị của thuộc tính đối tượng có thể chứa dữ liệu kiểu [nguyên thủy](/en-US/docs/Glossary/Primitive) hoặc các đối tượng khác.

### Cú pháp object literal so với JSON

Cú pháp object literal không giống với **J**ava**S**cript **O**bject **N**otation ([JSON](/en-US/docs/Glossary/JSON)). Mặc dù trông có vẻ tương tự, nhưng có những điểm khác biệt giữa chúng:

- JSON _chỉ_ cho phép định nghĩa thuộc tính theo cú pháp `"property": value`. Tên thuộc tính phải được đặt trong dấu nháy kép, và định nghĩa không thể là dạng rút gọn. Tên thuộc tính được tính toán (computed) cũng không được phép.
- Giá trị thuộc tính của đối tượng JSON chỉ có thể là chuỗi, số, `true`, `false`, `null`, mảng, hoặc một đối tượng JSON khác. Điều này có nghĩa là JSON không thể biểu diễn các phương thức hoặc các đối tượng không thuần túy như [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) hay [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp).
- Trong JSON, `"__proto__"` là một khóa thuộc tính bình thường. Trong object literal, nó [thiết lập prototype của đối tượng](#prototype_setter).

JSON là một _tập con nghiêm ngặt_ của cú pháp object literal, có nghĩa là mọi văn bản JSON hợp lệ đều có thể được phân tích cú pháp như một object literal và thường không gây ra lỗi cú pháp. Ngoại lệ duy nhất là cú pháp object literal cấm các khóa `__proto__` trùng lặp, điều này không áp dụng với [`JSON.parse()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse). Hàm này xử lý `__proto__` như một thuộc tính bình thường và lấy lần xuất hiện cuối cùng làm giá trị của thuộc tính. Trường hợp duy nhất mà giá trị đối tượng mà chúng biểu diễn (hay còn gọi là ngữ nghĩa) khác nhau là khi nguồn chứa khóa `__proto__` — đối với object literal, nó thiết lập prototype của đối tượng; còn đối với JSON, đó là thuộc tính bình thường.

```js
console.log(JSON.parse('{ "__proto__": 0, "__proto__": 1 }')); // {__proto__: 1}
console.log({ "__proto__": 0, "__proto__": 1 }); // SyntaxError: Duplicate __proto__ fields are not allowed in object literals

console.log(JSON.parse('{ "__proto__": {} }')); // { __proto__: {} }
console.log({ "__proto__": {} }); // {} (with {} as prototype)
```

## Ví dụ

### Tạo đối tượng

Một đối tượng rỗng không có thuộc tính có thể được tạo như sau:

```js
const object = {};
```

Tuy nhiên, ưu điểm của ký hiệu _literal_ hay _initializer_ là bạn có thể nhanh chóng tạo đối tượng với các thuộc tính bên trong cặp dấu ngoặc nhọn. Bạn ký hiệu một danh sách các cặp `key: value` được phân tách bằng dấu phẩy.

Đoạn code sau tạo một đối tượng với ba thuộc tính và các khóa là `"foo"`, `"age"` và `"baz"`. Giá trị của các khóa này lần lượt là chuỗi `"bar"`, số `42`, và một đối tượng khác.

```js
const object = {
  foo: "bar",
  age: 42,
  baz: { myProp: 12 },
};
```

### Truy cập thuộc tính

Khi đã tạo đối tượng, bạn có thể muốn đọc hoặc thay đổi chúng. Các thuộc tính đối tượng có thể được truy cập bằng ký hiệu dấu chấm hoặc ký hiệu ngoặc vuông. (Xem [property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) để biết thêm thông tin chi tiết.)

```js
object.foo; // "bar"
object["age"]; // 42
object.baz; // {myProp: 12}
object.baz.myProp; // 12
```

### Định nghĩa thuộc tính

Chúng ta đã biết cách ký hiệu thuộc tính bằng cú pháp initializer. Thông thường, có những biến trong code mà bạn muốn đưa vào một đối tượng. Bạn sẽ thấy code như thế này:

```js
const a = "foo";
const b = 42;
const c = {};

const o = {
  a: a,
  b: b,
  c: c,
};
```

Có một ký hiệu ngắn gọn hơn để đạt được điều tương tự:

```js
const a = "foo";
const b = 42;
const c = {};

// Shorthand property names
const o = { a, b, c };

// In other words,
console.log(o.a === { a }.a); // true
```

#### Tên thuộc tính trùng lặp

Khi sử dụng cùng tên cho các thuộc tính, thuộc tính thứ hai sẽ ghi đè thuộc tính đầu tiên.

```js
const a = { x: 1, x: 2 };
console.log(a); // {x: 2}
```

Sau ES2015, tên thuộc tính trùng lặp được cho phép ở mọi nơi, bao gồm cả [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#duplicate_property_names). Bạn cũng có thể có tên thuộc tính trùng lặp trong [classes](/en-US/docs/Web/JavaScript/Reference/Classes). Ngoại lệ duy nhất là [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements), phải là duy nhất trong thân class.

### Định nghĩa phương thức

Thuộc tính của một đối tượng cũng có thể tham chiếu đến một [hàm](/en-US/docs/Web/JavaScript/Reference/Functions) hoặc phương thức [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) hay [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set).

```js
const o = {
  property: function (parameters) {},
  get property() {
    return 1;
  },
  set property(value) {},
};
```

Có một ký hiệu rút gọn, để từ khóa `function` không còn cần thiết nữa.

```js
// Shorthand method names
const o = {
  property(parameters) {},
};
```

Cũng có một cách để định nghĩa ngắn gọn các phương thức generator.

```js
const o = {
  *generator() {
    // …
  },
};
```

Tương đương với ký hiệu kiểu ES5 này (nhưng lưu ý rằng ECMAScript 5 không có generator):

```js
const o = {
  generator: function* () {
    // …
  },
};
```

Để biết thêm thông tin và ví dụ về phương thức, hãy xem [method definitions](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions).

### Tên thuộc tính được tính toán

Cú pháp object initializer cũng hỗ trợ tên thuộc tính được tính toán (computed property names). Điều này cho phép bạn đặt một biểu thức trong cặp dấu ngoặc vuông `[]`, sẽ được tính toán và dùng làm tên thuộc tính. Điều này gợi nhớ đến ký hiệu ngoặc vuông của cú pháp [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors), mà bạn có thể đã dùng để đọc và thiết lập các thuộc tính.

Giờ bạn cũng có thể dùng cú pháp tương tự trong object literal:

```js
// Computed property names
let i = 0;
const a = {
  [`foo${++i}`]: i,
  [`foo${++i}`]: i,
  [`foo${++i}`]: i,
};

console.log(a.foo1); // 1
console.log(a.foo2); // 2
console.log(a.foo3); // 3

const items = ["A", "B", "C"];
const obj = {
  [items]: "Hello",
};
console.log(obj); // A,B,C: "Hello"
console.log(obj["A,B,C"]); // "Hello"

const param = "size";
const config = {
  [param]: 12,
  [`mobile${param.charAt(0).toUpperCase()}${param.slice(1)}`]: 4,
};

console.log(config); // {size: 12, mobileSize: 4}
```

### Thuộc tính spread

Object literal hỗ trợ [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax). Nó sao chép các thuộc tính enumerable riêng từ một đối tượng được cung cấp vào một đối tượng mới.

Sao chép nông (shallow clone, không bao gồm `prototype`) hoặc hợp nhất đối tượng giờ đây có thể thực hiện với cú pháp ngắn gọn hơn so với {{jsxref("Object.assign()")}}.

```js
const obj1 = { foo: "bar", x: 42 };
const obj2 = { foo: "baz", y: 13 };

const clonedObj = { ...obj1 };
// { foo: "bar", x: 42 }

const mergedObj = { ...obj1, ...obj2 };
// { foo: "baz", x: 42, y: 13 }
```

> [!WARNING]
> Lưu ý rằng {{jsxref("Object.assign()")}} kích hoạt [setters](/en-US/docs/Web/JavaScript/Reference/Functions/set), trong khi cú pháp spread thì không!

### Prototype setter

Một định nghĩa thuộc tính có dạng `__proto__: value` hoặc `"__proto__": value` không tạo ra thuộc tính có tên `__proto__`. Thay vào đó, nếu giá trị được cung cấp là một đối tượng hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), nó sẽ trỏ `[[Prototype]]` của đối tượng được tạo đến giá trị đó. (Nếu giá trị không phải là đối tượng hay `null`, đối tượng sẽ không bị thay đổi.)

Lưu ý rằng khóa `__proto__` là cú pháp được chuẩn hóa, trái ngược với các accessor [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto) không chuẩn và không hiệu quả. Nó thiết lập `[[Prototype]]` trong quá trình tạo đối tượng, tương tự như {{jsxref("Object.create")}} — thay vì thay đổi chuỗi prototype.

```js-nolint
const obj1 = {};
console.log(Object.getPrototypeOf(obj1) === Object.prototype); // true

const obj2 = { __proto__: null };
console.log(Object.getPrototypeOf(obj2)); // null

const protoObj = {};
const obj3 = { "__proto__": protoObj };
console.log(Object.getPrototypeOf(obj3) === protoObj); // true

const obj4 = { __proto__: "not an object or null" };
console.log(Object.getPrototypeOf(obj4) === Object.prototype); // true
console.log(Object.hasOwn(obj4, "__proto__")); // false
```

Chỉ được phép có một prototype setter trong một object literal. Nhiều prototype setter là lỗi cú pháp.

Các định nghĩa thuộc tính không sử dụng ký hiệu "dấu hai chấm" không phải là prototype setter. Chúng là các định nghĩa thuộc tính hoạt động giống hệt với các định nghĩa tương tự sử dụng bất kỳ tên nào khác.

```js
const __proto__ = "variable";

const obj1 = { __proto__ };
console.log(Object.getPrototypeOf(obj1) === Object.prototype); // true
console.log(Object.hasOwn(obj1, "__proto__")); // true
console.log(obj1.__proto__); // "variable"

const obj2 = { __proto__() { return "hello"; } };
console.log(obj2.__proto__()); // "hello"

const obj3 = { ["__proto__"]: 17 };
console.log(obj3.__proto__); // 17

// Mixing prototype setter with normal own properties with "__proto__" key
const obj4 = { ["__proto__"]: 17, __proto__: {} }; // {__proto__: 17} (with {} as prototype)
const obj5 = {
  ["__proto__"]: 17,
  __proto__: {},
  __proto__: null, // SyntaxError: Duplicate __proto__ fields are not allowed in object literals
};
const obj6 = {
  ["__proto__"]: 17,
  ["__proto__"]: "hello",
  __proto__: null,
}; // {__proto__: "hello"} (with null as prototype)
const obj7 =  {
  ["__proto__"]: 17,
  __proto__,
  __proto__: null,
}; // {__proto__: "variable"} (with null as prototype)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
- [`get`](/en-US/docs/Web/JavaScript/Reference/Functions/get)
- [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set)
- [Method definitions](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions)
- [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
