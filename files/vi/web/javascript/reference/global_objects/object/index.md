---
title: Object
slug: Web/JavaScript/Reference/Global_Objects/Object
page-type: javascript-class
browser-compat: javascript.builtins.Object
sidebar: jsref
---

Kiểu **`Object`** đại diện cho một trong [các kiểu dữ liệu của JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures). Nó được dùng để lưu trữ các tập hợp dữ liệu theo khóa và các thực thể phức tạp hơn. Object có thể được tạo bằng constructor {{jsxref("Object/Object", "Object()")}} hoặc [cú pháp object initializer / literal](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer).

## Description

Hầu hết tất cả [object](/en-US/docs/Web/JavaScript/Guide/Data_structures#objects) trong JavaScript đều là instance của `Object`; một object thông thường kế thừa các thuộc tính (bao gồm cả phương thức) từ `Object.prototype`, mặc dù các thuộc tính này có thể bị che khuất (hay còn gọi là ghi đè). Các object duy nhất không kế thừa từ `Object.prototype` là những object có [prototype `null`](#null-prototype_objects), hoặc được kế thừa từ các object có prototype `null` khác.

Các thay đổi đối với đối tượng `Object.prototype` sẽ được **tất cả** các object nhìn thấy thông qua chuỗi prototype, trừ khi các thuộc tính và phương thức chịu ảnh hưởng bởi những thay đổi đó bị ghi đè ở phần sau của chuỗi prototype. Điều này tạo ra một cơ chế rất mạnh mẽ, dù [có thể gây nguy hiểm](/en-US/docs/Web/Security/Attacks/Prototype_pollution), để ghi đè hoặc mở rộng hành vi của object. Để an toàn hơn, `Object.prototype` là đối tượng duy nhất trong ngôn ngữ JavaScript cốt lõi có [prototype bất biến (immutable prototype)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf#description) — prototype của `Object.prototype` luôn là `null` và không thể thay đổi.

### Các thuộc tính prototype của Object

Bạn nên tránh gọi trực tiếp bất kỳ phương thức `Object.prototype` nào từ instance, đặc biệt là những phương thức không có tính đa hình (tức là chỉ có hành vi ban đầu có ý nghĩa và không có đối tượng kế thừa nào có thể ghi đè theo cách có ý nghĩa). Tất cả các object kế thừa từ `Object.prototype` đều có thể định nghĩa một thuộc tính riêng cùng tên, nhưng với ngữ nghĩa hoàn toàn khác với những gì bạn mong đợi. Hơn nữa, các thuộc tính này không được kế thừa bởi các [object có prototype `null`](#null-prototype_objects). Tất cả các tiện ích JavaScript hiện đại để làm việc với object đều là [static](#static_methods). Cụ thể hơn:

- [`valueOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/valueOf), [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) và [`toLocaleString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toLocaleString) tồn tại để có tính đa hình và bạn nên mong đợi object định nghĩa lại chúng với hành vi hợp lý, vì vậy bạn có thể gọi chúng như phương thức instance. Tuy nhiên, `valueOf()` và `toString()` thường được gọi ngầm thông qua [chuyển đổi kiểu (type conversion)](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion) và bạn không cần tự gọi chúng trong code.
- [`__defineGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__), [`__defineSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__), [`__lookupGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__) và [`__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__) đã bị deprecated và không nên dùng. Hãy dùng các phương thức static thay thế là {{jsxref("Object.defineProperty()")}} và {{jsxref("Object.getOwnPropertyDescriptor()")}}.
- Thuộc tính [`__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto) đã bị deprecated và không nên dùng. Các phương thức thay thế {{jsxref("Object.getPrototypeOf()")}} và {{jsxref("Object.setPrototypeOf()")}} là các static method.
- Các phương thức [`propertyIsEnumerable()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/propertyIsEnumerable) và [`hasOwnProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty) có thể được thay thế lần lượt bằng các static method {{jsxref("Object.getOwnPropertyDescriptor()")}} và {{jsxref("Object.hasOwn()")}}.
- Phương thức [`isPrototypeOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isPrototypeOf) thường có thể được thay thế bằng [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof), nếu bạn đang kiểm tra thuộc tính `prototype` của một constructor.

Trong trường hợp không tồn tại static method tương đương về ngữ nghĩa, hoặc nếu bạn thực sự muốn dùng phương thức `Object.prototype`, bạn nên trực tiếp [`call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) phương thức `Object.prototype` đó trên đối tượng đích, để tránh trường hợp object có thuộc tính ghi đè gây ra kết quả không mong đợi.

```js
const obj = {
  foo: 1,
  // You should not define such a method on your own object,
  // but you may not be able to prevent it from happening if
  // you are receiving the object from external input
  propertyIsEnumerable() {
    return false;
  },
};

obj.propertyIsEnumerable("foo"); // false; unexpected result
Object.prototype.propertyIsEnumerable.call(obj, "foo"); // true; expected result
```

### Xóa thuộc tính khỏi object

Không có phương thức nào trong `Object` để xóa thuộc tính của chính nó (như {{jsxref("Map.prototype.delete()")}}). Muốn làm vậy, phải dùng toán tử {{jsxref("Operators/delete", "delete")}}.

### Object có prototype null

Hầu hết tất cả object trong JavaScript cuối cùng đều kế thừa từ `Object.prototype` (xem [kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)). Tuy nhiên, bạn có thể tạo object có prototype `null` bằng cách dùng [`Object.create(null)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create) hoặc [cú pháp object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) với `__proto__: null` (lưu ý: khóa `__proto__` trong object literal khác với thuộc tính [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto) đã bị deprecated). Bạn cũng có thể thay đổi prototype của object hiện có thành `null` bằng cách gọi [`Object.setPrototypeOf(obj, null)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf).

```js
const obj = Object.create(null);
const obj2 = { __proto__: null };
```

Một object có prototype `null` có thể hoạt động theo những cách không mong đợi, vì nó không kế thừa bất kỳ phương thức object nào từ `Object.prototype`. Điều này đặc biệt đúng khi debug, vì các hàm tiện ích chuyển đổi/phát hiện thuộc tính phổ biến có thể gây lỗi, hoặc mất thông tin (đặc biệt khi dùng các bẫy lỗi im lặng mà bỏ qua lỗi).

Ví dụ, việc thiếu [`Object.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString) thường làm cho việc debug trở nên khó khăn:

```js
const normalObj = {}; // create a normal object
const nullProtoObj = Object.create(null); // create an object with "null" prototype

console.log(`normalObj is: ${normalObj}`); // shows "normalObj is: [object Object]"
console.log(`nullProtoObj is: ${nullProtoObj}`); // throws error: Cannot convert object to primitive value

alert(normalObj); // shows [object Object]
alert(nullProtoObj); // throws error: Cannot convert object to primitive value
```

Các phương thức khác cũng sẽ thất bại.

```js
normalObj.valueOf(); // shows {}
nullProtoObj.valueOf(); // throws error: nullProtoObj.valueOf is not a function

normalObj.hasOwnProperty("p"); // shows "true"
nullProtoObj.hasOwnProperty("p"); // throws error: nullProtoObj.hasOwnProperty is not a function

normalObj.constructor; // shows "Object() { [native code] }"
nullProtoObj.constructor; // shows "undefined"
```

Chúng ta có thể thêm lại phương thức `toString` cho object có prototype null bằng cách gán:

```js
nullProtoObj.toString = Object.prototype.toString; // since new object lacks toString, add the original generic one back

console.log(nullProtoObj.toString()); // shows "[object Object]"
console.log(`nullProtoObj is: ${nullProtoObj}`); // shows "nullProtoObj is: [object Object]"
```

Khác với các object thông thường, nơi `toString()` nằm trên prototype của object, phương thức `toString()` ở đây là thuộc tính riêng của `nullProtoObj`. Đó là vì `nullProtoObj` không có prototype (`null`).

Bạn cũng có thể khôi phục object có prototype null trở lại thành object thông thường bằng cách dùng [`Object.setPrototypeOf(nullProtoObj, Object.prototype)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf).

Trong thực tế, object có prototype `null` thường được dùng như một thay thế rẻ tiền cho [map](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map). Sự hiện diện của các thuộc tính `Object.prototype` sẽ gây ra một số lỗi:

```js
const ages = { alice: 18, bob: 27 };

function hasPerson(name) {
  return name in ages;
}

function getAge(name) {
  return ages[name];
}

hasPerson("hasOwnProperty"); // true
getAge("toString"); // [Function: toString]
```

Dùng object có prototype null loại bỏ nguy cơ này mà không làm phức tạp thêm các hàm `hasPerson` và `getAge`:

```js
const ages = Object.create(null, {
  alice: { value: 18, enumerable: true },
  bob: { value: 27, enumerable: true },
});

hasPerson("hasOwnProperty"); // false
getAge("toString"); // undefined
```

Trong trường hợp như vậy, việc thêm bất kỳ phương thức nào cũng cần được thực hiện thận trọng, vì chúng có thể bị nhầm lẫn với các cặp khóa-giá trị được lưu trữ dưới dạng dữ liệu.

Việc object của bạn không kế thừa từ `Object.prototype` cũng ngăn chặn [tấn công prototype pollution](/en-US/docs/Web/Security/Attacks/Prototype_pollution). Nếu một đoạn script độc hại thêm thuộc tính vào `Object.prototype`, nó sẽ có thể truy cập được trên mọi object trong chương trình của bạn, ngoại trừ các object có prototype null.

```js
const user = {};

// A malicious script:
Object.prototype.authenticated = true;

// Unexpectedly allowing unauthenticated user to pass through
if (user.authenticated) {
  // access confidential data
}
```

JavaScript cũng có các API tích hợp tạo ra các object có prototype `null`, đặc biệt là những API dùng object như các tập hợp khóa-giá trị tùy ý. Ví dụ:

- Giá trị trả về của {{jsxref("Object.groupBy()")}}
- Các thuộc tính `groups` và `indices.groups` trong kết quả của {{jsxref("RegExp.prototype.exec()")}}
- [`Array.prototype[Symbol.unscopables]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.unscopables) (tất cả đối tượng `[Symbol.unscopables]` đều nên có prototype `null`)
- [`import.meta`](/en-US/docs/Web/JavaScript/Reference/Operators/import.meta)
- Đối tượng module namespace, thu được thông qua [`import * as ns from "module";`](/en-US/docs/Web/JavaScript/Reference/Statements/import#namespace_import) hoặc [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)

Thuật ngữ "object có prototype `null`" thường cũng bao gồm bất kỳ object nào không có `Object.prototype` trong chuỗi prototype của nó. Các object như vậy có thể được tạo bằng [`extends null`](/en-US/docs/Web/JavaScript/Reference/Classes/extends#extending_null) khi dùng class.

### Ép buộc sang Object (Object coercion)

Nhiều thao tác tích hợp sẵn mong đợi object sẽ ép buộc đối số của chúng thành object trước. [Thao tác này](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-toobject) có thể được tóm tắt như sau:

- Object được trả về nguyên vẹn.
- [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) và [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) ném {{jsxref("TypeError")}}.
- Các primitive {{jsxref("Number")}}, {{jsxref("String")}}, {{jsxref("Boolean")}}, {{jsxref("Symbol")}}, {{jsxref("BigInt")}} được bọc vào các object wrapper tương ứng.

Có hai cách để đạt được hiệu quả gần như tương tự trong JavaScript.

- {{jsxref("Object.prototype.valueOf()")}}: `Object.prototype.valueOf.call(x)` thực hiện chính xác các bước ép buộc object đã giải thích ở trên để chuyển đổi `x`.
- Hàm {{jsxref("Object/Object", "Object()")}}: `Object(x)` dùng cùng thuật toán để chuyển đổi `x`, ngoại trừ `undefined` và `null` không ném {{jsxref("TypeError")}}, mà trả về một object thuần.

Các nơi sử dụng object coercion bao gồm:

- Tham số `object` của vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in).
- Giá trị `this` của các phương thức {{jsxref("Array")}}.
- Các tham số của phương thức `Object` như {{jsxref("Object.keys()")}}.
- Auto-boxing khi một thuộc tính được truy cập trên một giá trị primitive, vì primitive không có thuộc tính.
- Giá trị [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) khi gọi một hàm non-strict. Primitive được boxing còn `null` và `undefined` được thay thế bằng [global object](/en-US/docs/Glossary/Global_object).

Khác với [chuyển đổi sang primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion), bản thân quá trình object coercion không thể quan sát được theo bất kỳ cách nào, vì nó không gọi code tùy chỉnh như các phương thức `toString` hay `valueOf`.

## Constructor

- {{jsxref("Object/Object", "Object()")}}
  - : Chuyển đổi đầu vào thành một object.

## Static methods

- {{jsxref("Object.assign()")}}
  - : Sao chép các giá trị của tất cả thuộc tính riêng có thể liệt kê từ một hoặc nhiều object nguồn sang một object đích.
- {{jsxref("Object.create()")}}
  - : Tạo một object mới với đối tượng prototype và thuộc tính đã chỉ định.
- {{jsxref("Object.defineProperties()")}}
  - : Thêm các thuộc tính được đặt tên được mô tả bởi các descriptor cho trước vào một object.
- {{jsxref("Object.defineProperty()")}}
  - : Thêm thuộc tính được đặt tên được mô tả bởi một descriptor cho trước vào một object.
- {{jsxref("Object.entries()")}}
  - : Trả về một mảng chứa tất cả các cặp `[key, value]` của các thuộc tính string **riêng** có thể liệt kê của một object.
- {{jsxref("Object.freeze()")}}
  - : Đóng băng một object. Code khác không thể xóa hoặc thay đổi thuộc tính của nó.
- {{jsxref("Object.fromEntries()")}}
  - : Trả về một object mới từ một iterable gồm các cặp `[key, value]`. (Đây là phép đảo của {{jsxref("Object.entries")}}).
- {{jsxref("Object.getOwnPropertyDescriptor()")}}
  - : Trả về một property descriptor cho thuộc tính được đặt tên trên một object.
- {{jsxref("Object.getOwnPropertyDescriptors()")}}
  - : Trả về một object chứa tất cả property descriptor riêng của một object.
- {{jsxref("Object.getOwnPropertyNames()")}}
  - : Trả về một mảng chứa tên của tất cả thuộc tính **riêng** có thể liệt kê và không thể liệt kê của object đã cho.
- {{jsxref("Object.getOwnPropertySymbols()")}}
  - : Trả về một mảng gồm tất cả thuộc tính symbol được tìm thấy trực tiếp trên object đã cho.
- {{jsxref("Object.getPrototypeOf()")}}
  - : Trả về prototype (thuộc tính `[[Prototype]]` nội bộ) của object đã chỉ định.
- {{jsxref("Object.groupBy()")}}
  - : Nhóm các phần tử của một iterable theo các giá trị chuỗi được trả về bởi một callback function cho trước. Object trả về có các thuộc tính riêng biệt cho mỗi nhóm, chứa các mảng với các phần tử trong nhóm đó.
- {{jsxref("Object.hasOwn()")}}
  - : Trả về `true` nếu object đã chỉ định có thuộc tính đã cho là thuộc tính _riêng_ của nó, hoặc `false` nếu thuộc tính được kế thừa hoặc không tồn tại.
- {{jsxref("Object.is()")}}
  - : So sánh xem hai giá trị có giống nhau không. Coi tất cả giá trị `NaN` là bằng nhau (khác với `IsLooselyEqual` dùng bởi [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) và `IsStrictlyEqual` dùng bởi [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality)).
- {{jsxref("Object.isExtensible()")}}
  - : Xác định xem object có được phép mở rộng hay không.
- {{jsxref("Object.isFrozen()")}}
  - : Xác định xem object có bị đóng băng hay không.
- {{jsxref("Object.isSealed()")}}
  - : Xác định xem object có bị niêm phong hay không.
- {{jsxref("Object.keys()")}}
  - : Trả về một mảng chứa tên của tất cả thuộc tính string **riêng** có thể liệt kê của object đã cho.
- {{jsxref("Object.preventExtensions()")}}
  - : Ngăn chặn mọi việc mở rộng đối với một object.
- {{jsxref("Object.seal()")}}
  - : Ngăn code khác xóa các thuộc tính của một object.
- {{jsxref("Object.setPrototypeOf()")}}
  - : Đặt prototype của object (thuộc tính `[[Prototype]]` nội bộ của nó).
- {{jsxref("Object.values()")}}
  - : Trả về một mảng chứa các giá trị tương ứng với tất cả thuộc tính string **riêng** có thể liệt kê của object đã cho.

## Instance properties

Các thuộc tính này được định nghĩa trên `Object.prototype` và chia sẻ cho tất cả các instance của `Object`.

- [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto) {{deprecated_inline}}
  - : Trỏ đến object được dùng làm prototype khi object được khởi tạo.
- {{jsxref("Object.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Với các instance `Object` thuần, giá trị ban đầu là constructor {{jsxref("Object/Object", "Object")}}. Các instance của constructor khác đều kế thừa thuộc tính `constructor` từ đối tượng `Constructor.prototype` tương ứng của chúng.

## Instance methods

- [`Object.prototype.__defineGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineGetter__) {{deprecated_inline}}
  - : Liên kết một hàm với một thuộc tính, khi được truy cập, hàm đó sẽ được thực thi và trả về giá trị của nó.
- [`Object.prototype.__defineSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__defineSetter__) {{deprecated_inline}}
  - : Liên kết một hàm với một thuộc tính, khi được gán, hàm đó sẽ được thực thi để thay đổi thuộc tính.
- [`Object.prototype.__lookupGetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupGetter__) {{deprecated_inline}}
  - : Trả về hàm được liên kết dưới dạng getter với thuộc tính đã chỉ định.
- [`Object.prototype.__lookupSetter__()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/__lookupSetter__) {{deprecated_inline}}
  - : Trả về hàm được liên kết dưới dạng setter với thuộc tính đã chỉ định.
- {{jsxref("Object.prototype.hasOwnProperty()")}}
  - : Trả về giá trị boolean cho biết object có chứa thuộc tính đã chỉ định như một thuộc tính trực tiếp của object đó và không được kế thừa qua chuỗi prototype hay không.
- {{jsxref("Object.prototype.isPrototypeOf()")}}
  - : Trả về giá trị boolean cho biết object mà phương thức này được gọi có nằm trong chuỗi prototype của object đã chỉ định hay không.
- {{jsxref("Object.prototype.propertyIsEnumerable()")}}
  - : Trả về giá trị boolean cho biết thuộc tính đã chỉ định có phải là thuộc tính [riêng có thể liệt kê](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) của object hay không.
- {{jsxref("Object.prototype.toLocaleString()")}}
  - : Gọi {{jsxref("Object/toString", "toString()")}}.
- {{jsxref("Object.prototype.toString()")}}
  - : Trả về biểu diễn chuỗi của object.
- {{jsxref("Object.prototype.valueOf()")}}
  - : Trả về giá trị primitive của object đã chỉ định.

## Examples

### Tạo object rỗng

Ví dụ sau tạo các object rỗng bằng từ khóa `new` với các đối số khác nhau:

```js
const o1 = new Object();
const o2 = new Object(undefined);
const o3 = new Object(null);
```

### Dùng constructor Object() để chuyển đổi primitive thành Object

Bạn có thể dùng constructor {{jsxref("Object/Object", "Object()")}} để tạo một object bọc (wrapper) cho một giá trị primitive.

Ví dụ sau tạo các biến `o1` và `o2` là các object lưu trữ giá trị {{jsxref("Boolean")}} và {{jsxref("BigInt")}}:

```js
// Equivalent to const o1 = new Boolean(true)
const o1 = new Object(true);

// No equivalent because BigInt() can't be called as a constructor,
// and calling it as a regular function won't create an object
const o2 = new Object(1n);
```

### Prototype của Object

Khi thay đổi hành vi của các phương thức `Object.prototype` hiện có, hãy cân nhắc chèn code bằng cách bọc phần mở rộng của bạn trước hoặc sau logic hiện có. Ví dụ, code (chưa kiểm tra) này sẽ thực thi logic tùy chỉnh theo điều kiện trước khi logic tích hợp hoặc mở rộng của người khác được thực thi.

Khi sửa đổi prototype bằng hook, hãy truyền `this` và các đối số (trạng thái gọi) cho hành vi hiện tại bằng cách gọi `apply()` trên hàm. Pattern này có thể dùng cho bất kỳ prototype nào, chẳng hạn như `Node.prototype`, `Function.prototype`, v.v.

```js
const current = Object.prototype.valueOf;

// Since my property "-prop-value" is cross-cutting and isn't always
// on the same prototype chain, I want to modify Object.prototype:
Object.prototype.valueOf = function (...args) {
  if (Object.hasOwn(this, "-prop-value")) {
    return this["-prop-value"];
  }
  // It doesn't look like one of my objects, so let's fall back on
  // the default behavior by reproducing the current behavior as best we can.
  // The apply behaves like "super" in some other languages.
  // Even though valueOf() doesn't take arguments, some other hook may.
  return current.apply(this, args);
};
```

> [!WARNING]
> Việc sửa đổi thuộc tính `prototype` của bất kỳ constructor tích hợp nào được coi là thực hành xấu và gây rủi ro về tính tương thích trong tương lai.

Bạn có thể đọc thêm về prototype trong [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
- [Prototype pollution attack](/en-US/docs/Web/Security/Attacks/Prototype_pollution)
