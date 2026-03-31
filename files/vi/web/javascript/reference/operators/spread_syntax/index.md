---
title: Spread syntax (...)
slug: Web/JavaScript/Reference/Operators/Spread_syntax
page-type: javascript-operator
browser-compat: javascript.operators.spread
sidebar: jssidebar
---

Cú pháp **spread (`...`)** cho phép một iterable, chẳng hạn như mảng hoặc chuỗi, được mở rộng ở những nơi mà không hoặc nhiều đối số (cho lời gọi hàm) hay phần tử (cho literal mảng) được mong đợi. Trong một literal object, cú pháp spread liệt kê các thuộc tính của một object và thêm các cặp key-value vào object đang được tạo.

Cú pháp spread trông giống hệt cú pháp rest. Theo một nghĩa nào đó, cú pháp spread là ngược lại của cú pháp rest. Cú pháp spread "mở rộng" một mảng thành các phần tử của nó, trong khi cú pháp rest thu thập nhiều phần tử và "cô đọng" chúng thành một phần tử duy nhất. Xem [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) và [rest property](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#rest_properties_and_rest_elements).

{{InteractiveExample("JavaScript Demo: Spread syntax (...)")}}

```js interactive-example
function sum(x, y, z) {
  return x + y + z;
}

const numbers = [1, 2, 3];

console.log(sum(...numbers));
// Expected output: 6

console.log(sum.apply(null, numbers));
// Expected output: 6
```

## Cú pháp

```js-nolint
myFunction(a, ...iterableObj, b)
[1, ...iterableObj, '4', 'five', 6]
{ ...obj, key: 'value' }
```

## Mô tả

Cú pháp spread có thể được dùng khi tất cả các phần tử từ một object hoặc mảng cần được đưa vào một mảng hoặc object mới, hoặc cần được áp dụng từng cái một trong danh sách đối số của lời gọi hàm. Có ba vị trí riêng biệt chấp nhận cú pháp spread:

- Danh sách đối số của [lời gọi hàm](#spread-trong-lời-gọi-hàm) (`myFunction(a, ...iterableObj, b)`)
- [Literal mảng](#spread-trong-literal-mảng) (`[1, ...iterableObj, '4', 'five', 6]`)
- [Literal object](#spread-trong-literal-object) (`{ ...obj, key: 'value' }`)

Mặc dù cú pháp trông giống nhau, chúng có ngữ nghĩa hơi khác nhau.

Chỉ các giá trị [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols), như {{jsxref("Array")}} và {{jsxref("String")}}, mới có thể được spread trong [literal mảng](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#array_literals) và danh sách đối số. Nhiều object không phải iterable, bao gồm tất cả các [plain object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) không có phương thức [`Symbol.iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator):

```js example-bad
const obj = { key1: "value1" };
const array = [...obj]; // TypeError: obj is not iterable
```

Mặt khác, spread trong [literal object](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) [liệt kê](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties#traversing_object_properties) các thuộc tính own của giá trị. Đối với mảng thông thường, tất cả các chỉ số đều là thuộc tính own có thể liệt kê, vì vậy mảng có thể được spread vào object.

```js
const array = [1, 2, 3];
const obj = { ...array }; // { 0: 1, 1: 2, 2: 3 }
```

Tất cả các [kiểu nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_values) đều có thể được spread trong object. Chỉ có chuỗi mới có các thuộc tính own có thể liệt kê, và spread bất kỳ thứ gì khác sẽ không tạo ra thuộc tính nào trên object mới.

```js
const obj = { ...true, ..."test", ...10 };
// { '0': 't', '1': 'e', '2': 's', '3': 't' }
```

Khi dùng cú pháp spread cho lời gọi hàm, hãy lưu ý khả năng vượt quá giới hạn độ dài đối số của JavaScript engine. Xem {{jsxref("Function.prototype.apply()")}} để biết thêm chi tiết.

## Ví dụ

### Spread trong lời gọi hàm

#### Thay thế apply()

Thông thường người ta dùng {{jsxref("Function.prototype.apply()")}} trong trường hợp muốn sử dụng các phần tử của mảng làm đối số cho một hàm.

```js
function myFunction(x, y, z) {}
const args = [0, 1, 2];
myFunction.apply(null, args);
```

Với cú pháp spread, đoạn code trên có thể được viết lại như:

```js
function myFunction(x, y, z) {}
const args = [0, 1, 2];
myFunction(...args);
```

Bất kỳ đối số nào trong danh sách đối số đều có thể dùng cú pháp spread, và cú pháp spread có thể được dùng nhiều lần.

```js
function myFunction(v, w, x, y, z) {}
const args = [0, 1];
myFunction(-1, ...args, 2, ...[3]);
```

#### Áp dụng cho toán tử new

Khi gọi constructor với {{jsxref("Operators/new", "new")}}, không thể **trực tiếp** dùng mảng và `apply()`, vì `apply()` _gọi_ hàm đích thay vì _khởi tạo_ nó, điều này có nghĩa là, trong số những thứ khác, [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) sẽ là `undefined`. Tuy nhiên, một mảng có thể dễ dàng được dùng với `new` nhờ cú pháp spread:

```js
const dateFields = [1970, 0, 1]; // 1 Jan 1970
const d = new Date(...dateFields);
```

### Spread trong literal mảng

#### Một cách viết literal mảng mạnh mẽ hơn

Nếu không có cú pháp spread, cú pháp literal mảng không còn đủ để tạo một mảng mới sử dụng một mảng hiện có như một phần của nó. Thay vào đó, phải dùng code mệnh lệnh (imperative) kết hợp các phương thức như {{jsxref("Array/push", "push()")}}, {{jsxref("Array/splice", "splice()")}}, {{jsxref("Array/concat", "concat()")}}, v.v. Với cú pháp spread, điều này trở nên ngắn gọn hơn nhiều:

```js
const parts = ["shoulders", "knees"];
const lyrics = ["head", ...parts, "and", "toes"];
//  ["head", "shoulders", "knees", "and", "toes"]
```

Giống như spread cho danh sách đối số, `...` có thể được dùng ở bất kỳ đâu trong literal mảng, và có thể được dùng nhiều hơn một lần.

#### Sao chép mảng

Bạn có thể dùng cú pháp spread để tạo một {{Glossary("shallow copy")}} của mảng. Mỗi phần tử mảng giữ nguyên định danh của nó mà không bị sao chép.

```js
const arr = [1, 2, 3];
const arr2 = [...arr]; // like arr.slice()

arr2.push(4);
// arr2 becomes [1, 2, 3, 4]
// arr remains unaffected
```

Cú pháp spread chỉ đi sâu một cấp khi sao chép mảng. Do đó, nó có thể không phù hợp để sao chép mảng đa chiều. Điều tương tự cũng đúng với {{jsxref("Object.assign()")}} — không có thao tác native nào trong JavaScript thực hiện deep clone. Phương thức Web API {{DOMxRef("Window.structuredClone", "structuredClone()")}} cho phép deep copy các giá trị của một số [loại được hỗ trợ](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm#supported_types). Xem [shallow copy](/en-US/docs/Glossary/Shallow_copy) để biết thêm chi tiết.

```js example-bad
const a = [[1], [2], [3]];
const b = [...a];

b.shift().shift();
// 1

// Oh no! Now array 'a' is affected as well:
console.log(a);
// [[], [2], [3]]
```

#### Cách nối mảng tốt hơn

{{jsxref("Array.prototype.concat()")}} thường được dùng để nối một mảng vào cuối một mảng hiện có. Không có cú pháp spread, điều này được thực hiện như sau:

```js
let arr1 = [0, 1, 2];
const arr2 = [3, 4, 5];

// Append all items from arr2 onto arr1
arr1 = arr1.concat(arr2);
```

Với cú pháp spread, điều này trở thành:

```js
let arr1 = [0, 1, 2];
const arr2 = [3, 4, 5];

arr1 = [...arr1, ...arr2];
// arr1 is now [0, 1, 2, 3, 4, 5]
```

{{jsxref("Array.prototype.unshift()")}} thường được dùng để chèn một mảng các giá trị vào đầu một mảng hiện có. Không có cú pháp spread, điều này được thực hiện như sau:

```js
const arr1 = [0, 1, 2];
const arr2 = [3, 4, 5];

//  Prepend all items from arr2 onto arr1
Array.prototype.unshift.apply(arr1, arr2);
console.log(arr1); // [3, 4, 5, 0, 1, 2]
```

Với cú pháp spread, điều này trở thành:

```js
let arr1 = [0, 1, 2];
const arr2 = [3, 4, 5];

arr1 = [...arr2, ...arr1];
console.log(arr1); // [3, 4, 5, 0, 1, 2]
```

> [!NOTE]
> Khác với `unshift()`, cách này tạo ra một `arr1` mới, thay vì sửa đổi mảng `arr1` gốc tại chỗ.

#### Thêm giá trị vào mảng một cách có điều kiện

Bạn có thể làm cho một phần tử xuất hiện hoặc vắng mặt trong một literal mảng, tùy thuộc vào một điều kiện, bằng cách dùng [toán tử điều kiện](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator).

```js
const isSummer = false;
const fruits = ["apple", "banana", ...(isSummer ? ["watermelon"] : [])];
// ['apple', 'banana']
```

Khi điều kiện là `false`, chúng ta spread một mảng rỗng, để không có gì được thêm vào mảng cuối cùng. Lưu ý rằng điều này khác với đoạn code sau:

```js
const fruits = ["apple", "banana", isSummer ? "watermelon" : undefined];
// ['apple', 'banana', undefined]
```

Trong trường hợp này, một phần tử `undefined` thừa được thêm vào khi `isSummer` là `false`, và phần tử này sẽ được các phương thức như {{jsxref("Array.prototype.map()")}} duyệt qua.

### Spread trong literal object

#### Sao chép và gộp object

Bạn có thể dùng cú pháp spread để gộp nhiều object thành một object mới.

```js
const obj1 = { foo: "bar", x: 42 };
const obj2 = { bar: "baz", y: 13 };

const mergedObj = { ...obj1, ...obj2 };
// { foo: "bar", x: 42, bar: "baz", y: 13 }
```

Một spread đơn tạo ra một shallow copy của object gốc (nhưng không bao gồm các thuộc tính non-enumerable và không sao chép prototype), tương tự như [sao chép mảng](#sao-chép-mảng).

```js
const clonedObj = { ...obj1 };
// { foo: "bar", x: 42 }
```

#### Ghi đè thuộc tính

Khi một object được spread vào object khác, hoặc khi nhiều object được spread vào một object, và các thuộc tính có tên giống nhau được gặp, thuộc tính nhận giá trị được gán cuối cùng trong khi vẫn giữ nguyên vị trí ban đầu.

```js
const obj1 = { foo: "bar", x: 42 };
const obj2 = { foo: "baz", y: 13 };

const mergedObj = { x: 41, ...obj1, ...obj2, y: 9 }; // { x: 42, foo: "baz", y: 9 }
```

#### Thêm thuộc tính vào object một cách có điều kiện

Bạn có thể làm cho một phần tử xuất hiện hoặc vắng mặt trong một literal object, tùy thuộc vào một điều kiện, bằng cách dùng [toán tử điều kiện](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator).

```js
const isSummer = false;
const fruits = {
  apple: 10,
  banana: 5,
  ...(isSummer ? { watermelon: 30 } : {}),
};
// { apple: 10, banana: 5 }
```

Trường hợp điều kiện là `false` là một object rỗng, để không có gì được spread vào object cuối cùng. Lưu ý rằng điều này khác với đoạn code sau:

```js
const fruits = {
  apple: 10,
  banana: 5,
  watermelon: isSummer ? 30 : undefined,
};
// { apple: 10, banana: 5, watermelon: undefined }
```

Trong trường hợp này, thuộc tính `watermelon` luôn luôn tồn tại và sẽ được các phương thức như {{jsxref("Object.keys()")}} duyệt qua.

Vì các kiểu nguyên thủy cũng có thể được spread vào object, và từ quan sát rằng tất cả các giá trị {{Glossary("falsy")}} không có thuộc tính own có thể liệt kê, bạn có thể đơn giản dùng toán tử [logical AND](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_AND):

```js
const isSummer = false;
const fruits = {
  apple: 10,
  banana: 5,
  ...(isSummer && { watermelon: 30 }),
};
```

Trong trường hợp này, nếu `isSummer` là bất kỳ giá trị falsy nào, sẽ không có thuộc tính nào được tạo trên object `fruits`.

#### So sánh với Object.assign()

Lưu ý rằng {{jsxref("Object.assign()")}} có thể được dùng để biến đổi một object, trong khi cú pháp spread thì không thể.

```js
const obj1 = { foo: "bar", x: 42 };
Object.assign(obj1, { x: 1337 });
console.log(obj1); // { foo: "bar", x: 1337 }
```

Ngoài ra, {{jsxref("Object.assign()")}} kích hoạt setter trên object đích, trong khi cú pháp spread thì không.

```js
const objectAssign = Object.assign(
  {
    set foo(val) {
      console.log(val);
    },
  },
  { foo: 1 },
);
// Logs "1"; objectAssign.foo is still the original setter

const spread = {
  set foo(val) {
    console.log(val);
  },
  ...{ foo: 1 },
};
// Nothing is logged; spread.foo is 1
```

Bạn không thể tái hiện một cách đơn giản hàm {{jsxref("Object.assign()")}} chỉ bằng một lần spread:

```js
const obj1 = { foo: "bar", x: 42 };
const obj2 = { foo: "baz", y: 13 };
const merge = (...objects) => ({ ...objects });

const mergedObj1 = merge(obj1, obj2);
// { 0: { foo: 'bar', x: 42 }, 1: { foo: 'baz', y: 13 } }

const mergedObj2 = merge({}, obj1, obj2);
// { 0: {}, 1: { foo: 'bar', x: 42 }, 2: { foo: 'baz', y: 13 } }
```

Trong ví dụ trên, cú pháp spread không hoạt động như người ta có thể mong đợi: nó spread một _mảng_ các đối số vào literal object, do rest parameter. Đây là một cách triển khai `merge` sử dụng cú pháp spread, có hành vi tương tự {{jsxref("Object.assign()")}}, ngoại trừ việc nó không kích hoạt setter, cũng không biến đổi bất kỳ object nào:

```js
const obj1 = { foo: "bar", x: 42 };
const obj2 = { foo: "baz", y: 13 };
const merge = (...objects) =>
  objects.reduce((acc, cur) => ({ ...acc, ...cur }));

const mergedObj = merge(obj1, obj2);
// { foo: 'baz', x: 42, y: 13 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)
- [Rest property](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#rest_properties_and_rest_elements)
- {{jsxref("Function.prototype.apply()")}}
