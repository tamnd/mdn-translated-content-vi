---
title: Inheritance and the prototype chain
slug: Web/JavaScript/Guide/Inheritance_and_the_prototype_chain
page-type: guide
sidebar: jssidebar
---

Trong lập trình, _kế thừa_ (inheritance) đề cập đến việc truyền đặc điểm từ cha sang con để một đoạn code mới có thể tái sử dụng và xây dựng dựa trên các tính năng của code hiện có. JavaScript triển khai kế thừa bằng cách sử dụng [object](/en-US/docs/Web/JavaScript/Guide/Data_structures#objects). Mỗi object có một liên kết nội bộ đến một object khác gọi là _prototype_ của nó. Object prototype đó lại có prototype của chính nó, cứ tiếp tục như vậy cho đến khi đến một object có `null` là prototype. Theo định nghĩa, `null` không có prototype và đóng vai trò là liên kết cuối cùng trong **chuỗi prototype** này. Bạn có thể biến đổi bất kỳ thành phần nào của chuỗi prototype hoặc thậm chí hoán đổi prototype ở thời điểm chạy, vì vậy các khái niệm như [static dispatching](https://en.wikipedia.org/wiki/Static_dispatch) không tồn tại trong JavaScript.

JavaScript khá khó hiểu với các lập trình viên có kinh nghiệm với các ngôn ngữ dựa trên class (như Java hay C++), vì nó [động](/en-US/docs/Web/JavaScript/Guide/Data_structures#dynamic_and_weak_typing) và không có kiểu tĩnh. Mặc dù sự khó hiểu này thường được coi là một trong những điểm yếu của JavaScript, chính mô hình kế thừa prototype lại mạnh mẽ hơn mô hình cổ điển. Ví dụ, việc xây dựng mô hình cổ điển trên mô hình prototype khá đơn giản — đó chính là cách [class](/en-US/docs/Web/JavaScript/Reference/Classes) được triển khai.

Mặc dù class hiện đã được áp dụng rộng rãi và trở thành paradigm mới trong JavaScript, class không mang lại pattern kế thừa mới. Trong khi class trừu tượng hóa hầu hết cơ chế prototype, hiểu cách prototype hoạt động bên dưới vẫn rất hữu ích.

## Kế thừa với chuỗi prototype

### Kế thừa thuộc tính

JavaScript object là các "túi" thuộc tính động (được gọi là **own property**). JavaScript object có liên kết đến một object prototype. Khi cố gắng truy cập thuộc tính của một object, thuộc tính sẽ không chỉ được tìm trên object, mà còn trên prototype của object, prototype của prototype, và cứ tiếp tục như vậy, cho đến khi tìm thấy thuộc tính trùng tên hoặc đến cuối chuỗi prototype.

> [!NOTE]
> Theo tiêu chuẩn ECMAScript, ký hiệu `someObject.[[Prototype]]` được dùng để chỉ prototype của `someObject`. Slot nội bộ `[[Prototype]]` có thể được truy cập và sửa đổi bằng các hàm {{jsxref("Object.getPrototypeOf()")}} và {{jsxref("Object.setPrototypeOf()")}} tương ứng. Điều này tương đương với accessor JavaScript [`__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto) không chuẩn nhưng được nhiều engine JavaScript triển khai trên thực tế. Để tránh nhầm lẫn và giữ ngắn gọn, trong ký hiệu của chúng ta sẽ tránh dùng `obj.__proto__` mà dùng `obj.[[Prototype]]` thay thế. Điều này tương ứng với `Object.getPrototypeOf(obj)`.
>
> Không nên nhầm lẫn với thuộc tính `func.prototype` của hàm, thứ thay vào đó chỉ định `[[Prototype]]` sẽ được gán cho tất cả _instance_ của các object tạo bởi hàm đó khi được dùng như constructor. Chúng ta sẽ thảo luận về thuộc tính `prototype` của constructor function trong [phần sau](#constructors).

Có nhiều cách để chỉ định `[[Prototype]]` của một object, được liệt kê trong [phần sau](#different_ways_of_creating_and_mutating_prototype_chains). Hiện tại, chúng ta sẽ dùng [cú pháp `__proto__`](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#prototype_setter) để minh họa. Đáng chú ý là cú pháp `{ __proto__: ... }` khác với accessor `obj.__proto__`: cái trước là chuẩn và không bị deprecate.

Trong object literal như `{ a: 1, b: 2, __proto__: c }`, giá trị `c` (phải là `null` hoặc object khác) sẽ trở thành `[[Prototype]]` của object được đại diện bởi literal, trong khi các key khác như `a` và `b` sẽ trở thành _own property_ của object. Cú pháp này rất tự nhiên, vì `[[Prototype]]` chỉ là một "thuộc tính nội bộ" của object.

Đây là điều xảy ra khi cố gắng truy cập thuộc tính:

```js
const o = {
  a: 1,
  b: 2,
  // __proto__ sets the [[Prototype]]. It's specified here
  // as another object literal.
  __proto__: {
    b: 3,
    c: 4,
  },
};

// o.[[Prototype]] has properties b and c.
// o.[[Prototype]].[[Prototype]] is Object.prototype (we will explain
// what that means later).
// Finally, o.[[Prototype]].[[Prototype]].[[Prototype]] is null.
// This is the end of the prototype chain, as null,
// by definition, has no [[Prototype]].
// Thus, the full prototype chain looks like:
// { a: 1, b: 2 } ---> { b: 3, c: 4 } ---> Object.prototype ---> null

console.log(o.a); // 1
// Is there an 'a' own property on o? Yes, and its value is 1.

console.log(o.b); // 2
// Is there a 'b' own property on o? Yes, and its value is 2.
// The prototype also has a 'b' property, but it's not visited.
// This is called Property Shadowing

console.log(o.c); // 4
// Is there a 'c' own property on o? No, check its prototype.
// Is there a 'c' own property on o.[[Prototype]]? Yes, its value is 4.

console.log(o.d); // undefined
// Is there a 'd' own property on o? No, check its prototype.
// Is there a 'd' own property on o.[[Prototype]]? No, check its prototype.
// o.[[Prototype]].[[Prototype]] is Object.prototype and
// there is no 'd' property by default, check its prototype.
// o.[[Prototype]].[[Prototype]].[[Prototype]] is null, stop searching,
// no property found, return undefined.
```

Gán thuộc tính cho một object tạo ra own property. Ngoại lệ duy nhất cho quy tắc đọc và ghi này là khi bị chặn bởi [getter hoặc setter](/en-US/docs/Web/JavaScript/Guide/Working_with_objects#defining_getters_and_setters).

Tương tự, bạn có thể tạo chuỗi prototype dài hơn và thuộc tính sẽ được tìm trên tất cả.

```js
const o = {
  a: 1,
  b: 2,
  // __proto__ sets the [[Prototype]]. It's specified here
  // as another object literal.
  __proto__: {
    b: 3,
    c: 4,
    __proto__: {
      d: 5,
    },
  },
};

// { a: 1, b: 2 } ---> { b: 3, c: 4 } ---> { d: 5 } ---> Object.prototype ---> null

console.log(o.d); // 5
```

### Kế thừa "method"

JavaScript không có "[method](/en-US/docs/Glossary/Method)" theo dạng mà các ngôn ngữ dựa trên class định nghĩa. Trong JavaScript, bất kỳ hàm nào cũng có thể được thêm vào object dưới dạng thuộc tính. Hàm được kế thừa hoạt động giống như bất kỳ thuộc tính nào khác, bao gồm property shadowing như đã trình bày ở trên (trong trường hợp này là dạng _method overriding_).

Khi hàm được kế thừa được thực thi, giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) trỏ đến object đang kế thừa, không phải đến object prototype nơi hàm là own property.

```js
const parent = {
  value: 2,
  method() {
    return this.value + 1;
  },
};

console.log(parent.method()); // 3
// When calling parent.method in this case, 'this' refers to parent

// child is an object that inherits from parent
const child = {
  __proto__: parent,
};
console.log(child.method()); // 3
// When child.method is called, 'this' refers to child.
// So when child inherits the method of parent,
// The property 'value' is sought on child. However, since child
// doesn't have an own property called 'value', the property is
// found on the [[Prototype]], which is parent.value.

child.value = 4; // assign the value 4 to the property 'value' on child.
// This shadows the 'value' property on parent.
// The child object now looks like:
// { value: 4, __proto__: { value: 2, method: [Function] } }
console.log(child.method()); // 5
// Since child now has the 'value' property, 'this.value' means
// child.value instead
```

## Constructor

Sức mạnh của prototype là chúng ta có thể tái sử dụng một tập hợp thuộc tính nếu chúng cần có trên mỗi instance — đặc biệt là cho method. Giả sử chúng ta cần tạo một loạt hộp (box), mỗi hộp là object chứa giá trị có thể truy cập qua hàm `getValue`. Một triển khai đơn giản sẽ là:

```js-nolint
const boxes = [
  { value: 1, getValue() { return this.value; } },
  { value: 2, getValue() { return this.value; } },
  { value: 3, getValue() { return this.value; } },
];
```

Điều này không tốt, vì mỗi instance có thuộc tính hàm riêng của nó làm cùng một việc, điều này là dư thừa và không cần thiết. Thay vào đó, chúng ta có thể chuyển `getValue` vào `[[Prototype]]` của tất cả các hộp:

```js
const boxPrototype = {
  getValue() {
    return this.value;
  },
};

const boxes = [
  { value: 1, __proto__: boxPrototype },
  { value: 2, __proto__: boxPrototype },
  { value: 3, __proto__: boxPrototype },
];
```

Bằng cách này, method `getValue` của tất cả các hộp sẽ tham chiếu đến cùng một hàm, giảm sử dụng bộ nhớ. Tuy nhiên, việc bind thủ công `__proto__` cho mỗi lần tạo object vẫn rất bất tiện. Đây là lúc chúng ta dùng hàm _constructor_, tự động thiết lập `[[Prototype]]` cho mỗi object được tạo ra. Constructor là hàm được gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).

```js
// A constructor function
function Box(value) {
  this.value = value;
}

// Properties all boxes created from the Box() constructor
// will have
Box.prototype.getValue = function () {
  return this.value;
};

const boxes = [new Box(1), new Box(2), new Box(3)];
```

Chúng ta nói rằng `new Box(1)` là một _instance_ được tạo từ constructor function `Box`. `Box.prototype` không khác nhiều so với object `boxPrototype` chúng ta đã tạo trước đó — nó chỉ là một plain object. Mọi instance tạo từ constructor function sẽ tự động có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) của constructor làm `[[Prototype]]` — tức là `Object.getPrototypeOf(new Box()) === Box.prototype`. `Constructor.prototype` mặc định có một own property: [`constructor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor), tham chiếu lại chính constructor function — tức là `Box.prototype.constructor === Box`. Điều này cho phép truy cập constructor gốc từ bất kỳ instance nào.

> [!NOTE]
> Nếu một giá trị không phải primitive được trả về từ constructor function, giá trị đó sẽ trở thành kết quả của biểu thức `new`. Trong trường hợp này `[[Prototype]]` có thể không được bind đúng — nhưng điều này ít khi xảy ra trong thực tế.

Constructor function trên có thể được viết lại bằng [class](/en-US/docs/Web/JavaScript/Reference/Classes) như:

```js
class Box {
  constructor(value) {
    this.value = value;
  }

  // Methods are created on Box.prototype
  getValue() {
    return this.value;
  }
}
```

Class là cú pháp đường (syntax sugar) trên constructor function, nghĩa là bạn vẫn có thể thao tác `Box.prototype` để thay đổi hành vi của tất cả instance. Tuy nhiên, vì class được thiết kế là sự trừu tượng hóa trên cơ chế prototype cơ bản, chúng ta sẽ dùng cú pháp constructor function gọn hơn trong hướng dẫn này để minh họa đầy đủ cách prototype hoạt động.

Vì `Box.prototype` tham chiếu cùng object với `[[Prototype]]` của tất cả instance, chúng ta có thể thay đổi hành vi của tất cả instance bằng cách biến đổi `Box.prototype`.

```js
function Box(value) {
  this.value = value;
}
Box.prototype.getValue = function () {
  return this.value;
};
const box = new Box(1);

// Mutate Box.prototype after an instance has already been created
Box.prototype.getValue = function () {
  return this.value + 1;
};
box.getValue(); // 2
```

Một hệ quả là _gán lại_ `Constructor.prototype` (`Constructor.prototype = ...`) là ý tưởng tệ vì hai lý do:

- `[[Prototype]]` của các instance được tạo trước khi gán lại bây giờ tham chiếu đến object khác so với `[[Prototype]]` của các instance tạo sau — biến đổi `[[Prototype]]` của cái này không còn biến đổi cái kia nữa.
- Trừ khi bạn thiết lập lại thủ công thuộc tính `constructor`, constructor function không còn có thể được truy nguyên từ `instance.constructor`, điều này có thể làm phá vỡ kỳ vọng của người dùng. Một số thao tác có sẵn cũng đọc thuộc tính `constructor`, và nếu nó không được đặt, chúng có thể không hoạt động như mong đợi.

`Constructor.prototype` chỉ hữu ích khi khởi tạo instance. Nó không liên quan gì đến `Constructor.[[Prototype]]`, là prototype _riêng_ của constructor function, tức là `Function.prototype` — nghĩa là `Object.getPrototypeOf(Constructor) === Function.prototype`.

### Constructor ngầm định của literal

Một số cú pháp literal trong JavaScript tạo ra instance ngầm định thiết lập `[[Prototype]]`. Ví dụ:

```js
// Object literals (without the `__proto__` key) automatically
// have `Object.prototype` as their `[[Prototype]]`
const object = { a: 1 };
Object.getPrototypeOf(object) === Object.prototype; // true

// Array literals automatically have `Array.prototype` as their `[[Prototype]]`
const array = [1, 2, 3];
Object.getPrototypeOf(array) === Array.prototype; // true

// RegExp literals automatically have `RegExp.prototype` as their `[[Prototype]]`
const regexp = /abc/;
Object.getPrototypeOf(regexp) === RegExp.prototype; // true
```

Chúng ta có thể "bỏ đường" chúng về dạng constructor tương ứng.

```js
const array = new Array(1, 2, 3);
const regexp = new RegExp("abc");
```

Ví dụ, "array method" như [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) đơn giản chỉ là method được định nghĩa trên `Array.prototype`, đó là lý do chúng tự động có sẵn trên tất cả array instance.

> [!WARNING]
> Có một sai lầm phổ biến trước đây — mở rộng `Object.prototype` hoặc một trong các prototype có sẵn khác. Ví dụ về sai lầm này là định nghĩa `Array.prototype.myMethod = function () {...}` và sau đó dùng `myMethod` trên tất cả array instance.
>
> Sai lầm này được gọi là _monkey patching_. Làm monkey patching có nguy cơ tương thích về sau, vì nếu ngôn ngữ thêm method này trong tương lai nhưng với chữ ký khác, code của bạn sẽ bị lỗi. Nó đã dẫn đến các sự cố như [SmooshGate](https://developer.chrome.com/blog/smooshgate/), và có thể là trở ngại lớn cho việc phát triển ngôn ngữ vì JavaScript cố gắng "không làm hỏng web".
>
> Lý do **duy nhất** tốt để mở rộng prototype có sẵn là backport các tính năng của engine JavaScript mới hơn, như `Array.prototype.forEach`.

Điều thú vị là do lý do lịch sử, thuộc tính `prototype` của một số constructor có sẵn lại là các instance của chính chúng. Ví dụ, `Number.prototype` là số 0, `Array.prototype` là mảng rỗng, và `RegExp.prototype` là `/(?:)/`.

```js
Number.prototype + 1; // 1
Array.prototype.map((x) => x + 1); // []
String.prototype + "a"; // "a"
RegExp.prototype.source; // "(?:)"
Function.prototype(); // Function.prototype is a no-op function by itself
```

Tuy nhiên, điều này không đúng với các constructor do người dùng định nghĩa, cũng không đúng với các constructor hiện đại như `Map`.

```js
Map.prototype.get(1);
// Uncaught TypeError: get method called on incompatible Map.prototype
```

### Xây dựng chuỗi kế thừa dài hơn

Thuộc tính `Constructor.prototype` sẽ trở thành `[[Prototype]]` của các instance của constructor, nguyên trạng — bao gồm cả `[[Prototype]]` riêng của `Constructor.prototype`. Mặc định, `Constructor.prototype` là một _plain object_ — tức là `Object.getPrototypeOf(Constructor.prototype) === Object.prototype`. Ngoại lệ duy nhất là chính `Object.prototype`, có `[[Prototype]]` là `null` — tức là `Object.getPrototypeOf(Object.prototype) === null`. Do đó, một constructor điển hình sẽ xây dựng chuỗi prototype như sau:

```js
function Constructor() {}

const obj = new Constructor();
// obj ---> Constructor.prototype ---> Object.prototype ---> null
```

Để xây dựng chuỗi prototype dài hơn, chúng ta có thể thiết lập `[[Prototype]]` của `Constructor.prototype` thông qua hàm [`Object.setPrototypeOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf).

```js
function Base() {}
function Derived() {}
// Set the `[[Prototype]]` of `Derived.prototype`
// to `Base.prototype`
Object.setPrototypeOf(Derived.prototype, Base.prototype);

const obj = new Derived();
// obj ---> Derived.prototype ---> Base.prototype ---> Object.prototype ---> null
```

Theo thuật ngữ class, điều này tương đương với dùng cú pháp [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends).

```js
class Base {}
class Derived extends Base {}

const obj = new Derived();
// obj ---> Derived.prototype ---> Base.prototype ---> Object.prototype ---> null
```

Bạn cũng có thể thấy một số code legacy dùng {{jsxref("Object.create()")}} để xây dựng chuỗi kế thừa. Tuy nhiên, vì cách này gán lại thuộc tính `prototype` và xóa thuộc tính [`constructor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor), nó có thể dễ gây lỗi hơn, trong khi lợi ích hiệu suất có thể không rõ ràng nếu constructor chưa tạo ra bất kỳ instance nào.

```js example-bad
function Base() {}
function Derived() {}
// Re-assigns `Derived.prototype` to a new object
// with `Base.prototype` as its `[[Prototype]]`
// DON'T DO THIS — use Object.setPrototypeOf to mutate it instead
Derived.prototype = Object.create(Base.prototype);
```

## Kiểm tra prototype: đi sâu hơn

Hãy nhìn vào những gì xảy ra đằng sau màn hình một cách chi tiết hơn.

Trong JavaScript, như đã đề cập, hàm có thể có thuộc tính. Tất cả hàm đều có thuộc tính đặc biệt tên `prototype`. Lưu ý rằng code dưới đây là độc lập (giả sử không có JavaScript nào khác trên trang ngoài code dưới đây). Để học tốt nhất, bạn nên mở console, điều hướng đến tab "console", copy-paste đoạn code JavaScript dưới đây và chạy bằng phím Enter/Return. (Console được bao gồm trong Developer Tools của hầu hết trình duyệt web. Thông tin thêm có sẵn cho [Firefox Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/index.html), [Chrome DevTools](https://developer.chrome.com/docs/devtools/), và [Edge DevTools](https://learn.microsoft.com/en-us/archive/microsoft-edge/legacy/developer/).)

```js
function doSomething() {}
console.log(doSomething.prototype);
// It does not matter how you declare the function; a
// function in JavaScript will always have a default
// prototype property — with one exception: an arrow
// function doesn't have a default prototype property:
const doSomethingFromArrowFunction = () => {};
console.log(doSomethingFromArrowFunction.prototype);
```

Như thấy ở trên, `doSomething()` có thuộc tính `prototype` mặc định, được minh chứng qua console. Sau khi chạy code này, console sẽ hiển thị một object trông tương tự như sau.

```plain
{
  constructor: ƒ doSomething(),
  [[Prototype]]: {
    constructor: ƒ Object(),
    hasOwnProperty: ƒ hasOwnProperty(),
    isPrototypeOf: ƒ isPrototypeOf(),
    propertyIsEnumerable: ƒ propertyIsEnumerable(),
    toLocaleString: ƒ toLocaleString(),
    toString: ƒ toString(),
    valueOf: ƒ valueOf()
  }
}
```

> [!NOTE]
> Chrome console dùng `[[Prototype]]` để ký hiệu prototype của object, theo thuật ngữ của spec; Firefox dùng `<prototype>`. Để nhất quán chúng ta sẽ dùng `[[Prototype]]`.

Chúng ta có thể thêm thuộc tính vào prototype của `doSomething()`, như bên dưới.

```js
function doSomething() {}
doSomething.prototype.foo = "bar";
console.log(doSomething.prototype);
```

Kết quả là:

```plain
{
  foo: "bar",
  constructor: ƒ doSomething(),
  [[Prototype]]: {
    constructor: ƒ Object(),
    hasOwnProperty: ƒ hasOwnProperty(),
    isPrototypeOf: ƒ isPrototypeOf(),
    propertyIsEnumerable: ƒ propertyIsEnumerable(),
    toLocaleString: ƒ toLocaleString(),
    toString: ƒ toString(),
    valueOf: ƒ valueOf()
  }
}
```

Bây giờ chúng ta có thể dùng toán tử `new` để tạo instance của `doSomething()` dựa trên prototype này. Để dùng toán tử new, gọi hàm thông thường nhưng với tiền tố `new`. Gọi hàm với toán tử `new` trả về một object là instance của hàm. Sau đó có thể thêm thuộc tính vào object này.

Hãy thử đoạn code sau:

```js
function doSomething() {}
doSomething.prototype.foo = "bar"; // add a property onto the prototype
const doSomeInstancing = new doSomething();
doSomeInstancing.prop = "some value"; // add a property onto the object
console.log(doSomeInstancing);
```

Kết quả tương tự như sau:

```plain
{
  prop: "some value",
  [[Prototype]]: {
    foo: "bar",
    constructor: ƒ doSomething(),
    [[Prototype]]: {
      constructor: ƒ Object(),
      hasOwnProperty: ƒ hasOwnProperty(),
      isPrototypeOf: ƒ isPrototypeOf(),
      propertyIsEnumerable: ƒ propertyIsEnumerable(),
      toLocaleString: ƒ toLocaleString(),
      toString: ƒ toString(),
      valueOf: ƒ valueOf()
    }
  }
}
```

Như thấy ở trên, `[[Prototype]]` của `doSomeInstancing` là `doSomething.prototype`. Nhưng điều này có nghĩa gì? Khi bạn truy cập thuộc tính của `doSomeInstancing`, runtime trước tiên kiểm tra xem `doSomeInstancing` có thuộc tính đó không.

Nếu `doSomeInstancing` không có thuộc tính, runtime tìm thuộc tính trong `doSomeInstancing.[[Prototype]]` (tức là `doSomething.prototype`). Nếu `doSomeInstancing.[[Prototype]]` có thuộc tính đang tìm, thì thuộc tính trên `doSomeInstancing.[[Prototype]]` được dùng.

Nếu không, nếu `doSomeInstancing.[[Prototype]]` không có thuộc tính, thì `doSomeInstancing.[[Prototype]].[[Prototype]]` được kiểm tra. Mặc định, `[[Prototype]]` của thuộc tính `prototype` của bất kỳ hàm nào là `Object.prototype`. Vì vậy, `doSomeInstancing.[[Prototype]].[[Prototype]]` (tức là `doSomething.prototype.[[Prototype]]` (tức là `Object.prototype`)) sau đó được tìm kiếm thuộc tính.

Nếu không tìm thấy thuộc tính trong `doSomeInstancing.[[Prototype]].[[Prototype]]`, thì `doSomeInstancing.[[Prototype]].[[Prototype]].[[Prototype]]` được tìm kiếm. Tuy nhiên có vấn đề: `doSomeInstancing.[[Prototype]].[[Prototype]].[[Prototype]]` không tồn tại, vì `Object.prototype.[[Prototype]]` là `null`. Sau đó, và chỉ sau đó, sau khi toàn bộ chuỗi prototype `[[Prototype]]` được tìm kiếm, runtime xác định thuộc tính không tồn tại và kết luận giá trị tại thuộc tính là `undefined`.

Hãy thử nhập thêm code vào console:

```js
function doSomething() {}
doSomething.prototype.foo = "bar";
const doSomeInstancing = new doSomething();
doSomeInstancing.prop = "some value";
console.log("doSomeInstancing.prop:     ", doSomeInstancing.prop);
console.log("doSomeInstancing.foo:      ", doSomeInstancing.foo);
console.log("doSomething.prop:          ", doSomething.prop);
console.log("doSomething.foo:           ", doSomething.foo);
console.log("doSomething.prototype.prop:", doSomething.prototype.prop);
console.log("doSomething.prototype.foo: ", doSomething.prototype.foo);
```

Kết quả như sau:

```plain
doSomeInstancing.prop:      some value
doSomeInstancing.foo:       bar
doSomething.prop:           undefined
doSomething.foo:            undefined
doSomething.prototype.prop: undefined
doSomething.prototype.foo:  bar
```

## Các cách khác nhau để tạo và thay đổi chuỗi prototype

Chúng ta đã gặp nhiều cách để tạo object và thay đổi chuỗi prototype của chúng. Hãy tổng kết có hệ thống các cách khác nhau, so sánh ưu và nhược điểm của từng cách.

### Object được tạo bằng cú pháp

```js
const o = { a: 1 };
// The newly created object o has Object.prototype as its [[Prototype]]
// Object.prototype has null as its [[Prototype]].
// o ---> Object.prototype ---> null

const b = ["yo", "sup", "?"];
// Arrays inherit from Array.prototype
// (which has methods indexOf, forEach, etc.)
// The prototype chain looks like:
// b ---> Array.prototype ---> Object.prototype ---> null

function f() {
  return 2;
}
// Functions inherit from Function.prototype
// (which has methods call, bind, etc.)
// f ---> Function.prototype ---> Object.prototype ---> null

const p = { b: 2, __proto__: o };
// It is possible to point the newly created object's [[Prototype]] to
// another object via the __proto__ literal property. (Not to be confused
// with Object.prototype.__proto__ accessors)
// p ---> o ---> Object.prototype ---> null
```

Khi dùng key `__proto__` trong [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer), trỏ key `__proto__` đến thứ không phải object chỉ thất bại âm thầm mà không ném exception. Trái ngược với setter [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto), `__proto__` trong object literal initializer là chuẩn và được tối ưu hóa, thậm chí có thể hiệu quả hơn {{jsxref("Object.create")}}. Khai báo thêm own property trên object khi tạo thuận tiện hơn {{jsxref("Object.create")}}.

### Với constructor function

```js
function Graph() {
  this.vertices = [];
  this.edges = [];
}

Graph.prototype.addVertex = function (v) {
  this.vertices.push(v);
};

const g = new Graph();
// g is an object with own properties 'vertices' and 'edges'.
// g.[[Prototype]] is the value of Graph.prototype when new Graph() is executed.
```

Constructor function đã có sẵn từ rất sớm trong JavaScript. Do đó, nó rất nhanh, rất chuẩn và rất có thể tối ưu hóa JIT. Tuy nhiên, cũng khó để "làm đúng" vì các method được thêm theo cách này có thể liệt kê theo mặc định, không nhất quán với cú pháp class hay cách hoạt động của method có sẵn. Việc xây dựng chuỗi kế thừa dài hơn cũng dễ gây lỗi, như đã thấy trước đó.

### Với Object.create()

Gọi {{jsxref("Object.create()")}} tạo một object mới. `[[Prototype]]` của object này là tham số đầu tiên của hàm:

```js
const a = { a: 1 };
// a ---> Object.prototype ---> null

const b = Object.create(a);
// b ---> a ---> Object.prototype ---> null
console.log(b.a); // 1 (inherited)

const c = Object.create(b);
// c ---> b ---> a ---> Object.prototype ---> null

const d = Object.create(null);
// d ---> null (d is an object that has null directly as its prototype)
console.log(d.hasOwnProperty);
// undefined, because d doesn't inherit from Object.prototype
```

Tương tự như key `__proto__` trong object initializer, `Object.create()` cho phép đặt trực tiếp prototype của object khi tạo, cho phép runtime tối ưu hóa object hơn nữa. Nó cũng cho phép tạo object với prototype `null`, bằng `Object.create(null)`. Tham số thứ hai của `Object.create()` cho phép chỉ định chính xác thuộc tính của từng property trong object mới, điều này có thể là con dao hai lưỡi:

- Cho phép tạo non-enumerable property, v.v., trong khi tạo object, điều không thể với object literal.
- Dài dòng và dễ gây lỗi hơn object literal.
- Có thể chậm hơn object literal, đặc biệt khi tạo nhiều property.

### Với class

```js
class Rectangle {
  constructor(height, width) {
    this.name = "Rectangle";
    this.height = height;
    this.width = width;
  }
}

class FilledRectangle extends Rectangle {
  constructor(height, width, color) {
    super(height, width);
    this.name = "Filled rectangle";
    this.color = color;
  }
}

const filledRectangle = new FilledRectangle(5, 10, "blue");
// filledRectangle ---> FilledRectangle.prototype ---> Rectangle.prototype ---> Object.prototype ---> null
```

Class cung cấp khả năng đọc và bảo trì tốt nhất khi định nghĩa các cấu trúc kế thừa phức tạp. [Private element](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) là tính năng không có thay thế đơn giản trong kế thừa prototype. Tuy nhiên, class kém tối ưu hóa hơn constructor function truyền thống và không được hỗ trợ trong môi trường cũ.

### Với Object.setPrototypeOf()

Trong khi tất cả các phương pháp trên thiết lập chuỗi prototype lúc tạo object, [`Object.setPrototypeOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf) cho phép biến đổi thuộc tính nội bộ `[[Prototype]]` của object hiện có. Nó thậm chí có thể ép prototype trên object không có prototype được tạo bởi `Object.create(null)` hoặc xóa prototype của object bằng cách đặt thành `null`.

```js
const obj = { a: 1 };
const anotherObj = { b: 2 };
Object.setPrototypeOf(obj, anotherObj);
// obj ---> anotherObj ---> Object.prototype ---> null
```

Tuy nhiên, bạn nên đặt prototype trong khi tạo nếu có thể, vì việc đặt prototype động làm gián đoạn tất cả tối ưu hóa mà engine đã thực hiện cho chuỗi prototype. Nó có thể khiến một số engine biên dịch lại code để de-tối ưu hóa, làm cho nó hoạt động theo đúng spec.

### Với accessor \_\_proto\_\_

Tất cả object kế thừa setter [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto), có thể dùng để đặt `[[Prototype]]` của object hiện có (nếu key `__proto__` không bị ghi đè trên object).

> [!WARNING]
> Các accessor `Object.prototype.__proto__` là **không chuẩn** và bị deprecate. Bạn hầu như luôn nên dùng `Object.setPrototypeOf` thay thế.

```js
const obj = {};
// DON'T USE THIS: for example only.
obj.__proto__ = { barProp: "bar val" };
obj.__proto__.__proto__ = { fooProp: "foo val" };
console.log(obj.fooProp);
console.log(obj.barProp);
```

So với `Object.setPrototypeOf`, việc đặt `__proto__` thành thứ không phải object sẽ thất bại âm thầm mà không ném exception. Nó cũng có hỗ trợ trình duyệt tốt hơn đôi chút. Tuy nhiên, nó không chuẩn và bị deprecate. Bạn hầu như luôn nên dùng `Object.setPrototypeOf` thay thế.

## Hiệu suất

Thời gian tìm kiếm các thuộc tính cao trong chuỗi prototype có thể có tác động tiêu cực đến hiệu suất, và điều này có thể đáng kể trong code yêu cầu hiệu suất cao. Ngoài ra, việc cố gắng truy cập thuộc tính không tồn tại sẽ luôn duyệt qua toàn bộ chuỗi prototype.

Ngoài ra, khi lặp qua các thuộc tính của object, **mọi** thuộc tính có thể liệt kê trên chuỗi prototype sẽ được liệt kê. Để kiểm tra xem một object có thuộc tính được định nghĩa _trên chính nó_ mà không phải đâu đó trên chuỗi prototype, cần thiết phải dùng các method [`hasOwnProperty`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty) hoặc [`Object.hasOwn`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn). Tất cả object, ngoại trừ những object có `null` là `[[Prototype]]`, đều kế thừa [`hasOwnProperty`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty) từ `Object.prototype` — trừ khi nó đã bị ghi đè ở phía dưới chuỗi prototype. Để minh họa cụ thể, hãy dùng ví dụ đồ thị trên:

```js
function Graph() {
  this.vertices = [];
  this.edges = [];
}

Graph.prototype.addVertex = function (v) {
  this.vertices.push(v);
};

const g = new Graph();
// g ---> Graph.prototype ---> Object.prototype ---> null

g.hasOwnProperty("vertices"); // true
Object.hasOwn(g, "vertices"); // true

g.hasOwnProperty("nope"); // false
Object.hasOwn(g, "nope"); // false

g.hasOwnProperty("addVertex"); // false
Object.hasOwn(g, "addVertex"); // false

Object.getPrototypeOf(g).hasOwnProperty("addVertex"); // true
```

Lưu ý: **Không** đủ để kiểm tra xem thuộc tính có là [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) không. Thuộc tính có thể tồn tại, nhưng giá trị của nó vừa được đặt thành `undefined`.

## Kết luận

JavaScript có thể khá khó hiểu với các lập trình viên đến từ Java hay C++, vì tất cả đều động, tất cả ở thời điểm chạy, và không có kiểu tĩnh. Mọi thứ đều là object (instance) hoặc hàm (constructor), và ngay cả bản thân hàm cũng là instance của constructor `Function`. Ngay cả "class" như là cấu trúc cú pháp cũng chỉ là constructor function ở thời điểm chạy.

Tất cả constructor function trong JavaScript đều có thuộc tính đặc biệt gọi là `prototype`, hoạt động với toán tử `new`. Tham chiếu đến object prototype được sao chép vào thuộc tính nội bộ `[[Prototype]]` của instance mới. Ví dụ, khi bạn làm `const a1 = new A()`, JavaScript (sau khi tạo object trong bộ nhớ và trước khi chạy hàm `A()` với `this` được định nghĩa là nó) đặt `a1.[[Prototype]] = A.prototype`. Khi bạn sau đó truy cập thuộc tính của instance, JavaScript đầu tiên kiểm tra xem chúng có tồn tại trực tiếp trên object đó không, và nếu không, sẽ tìm trong `[[Prototype]]`. `[[Prototype]]` được tìm kiếm _đệ quy_, tức là `a1.doSomething`, `Object.getPrototypeOf(a1).doSomething`, `Object.getPrototypeOf(Object.getPrototypeOf(a1)).doSomething` v.v., cho đến khi tìm thấy hoặc `Object.getPrototypeOf` trả về `null`. Điều này có nghĩa là tất cả thuộc tính được định nghĩa trên `prototype` được chia sẻ hiệu quả bởi tất cả instance, và bạn thậm chí có thể thay đổi một phần `prototype` sau đó và các thay đổi sẽ xuất hiện trong tất cả instance hiện có.

Nếu, trong ví dụ trên, bạn làm `const a1 = new A(); const a2 = new A();`, thì `a1.doSomething` thực sự sẽ tham chiếu đến `Object.getPrototypeOf(a1).doSomething` — cái mà giống với `A.prototype.doSomething` bạn đã định nghĩa, tức là `Object.getPrototypeOf(a1).doSomething === Object.getPrototypeOf(a2).doSomething === A.prototype.doSomething`.

Điều cần thiết là hiểu mô hình kế thừa prototype trước khi viết code phức tạp sử dụng nó. Ngoài ra, hãy lưu ý độ dài của chuỗi prototype trong code và ngắt chúng nếu cần để tránh các vấn đề hiệu suất có thể xảy ra. Hơn nữa, các prototype gốc **không bao giờ** nên được mở rộng trừ khi vì mục đích tương thích với các tính năng JavaScript mới hơn.
