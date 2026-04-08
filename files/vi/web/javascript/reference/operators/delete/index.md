---
title: delete
slug: Web/JavaScript/Reference/Operators/delete
page-type: javascript-operator
browser-compat: javascript.operators.delete
sidebar: jssidebar
---

Toán tử **`delete`** xóa một thuộc tính khỏi một object. Nếu giá trị của thuộc tính là một object và không còn tham chiếu nào khác đến object đó, object được giữ bởi thuộc tính đó cuối cùng sẽ được giải phóng tự động.

{{InteractiveExample("JavaScript Demo: delete operator")}}

```js interactive-example
const employee = {
  firstName: "Maria",
  lastName: "Sanchez",
};

console.log(employee.firstName);
// Expected output: "Maria"

delete employee.firstName;

console.log(employee.firstName);
// Expected output: undefined
```

## Cú pháp

```js-nolint
delete object.property
delete object[property]
```

> [!NOTE]
> Cú pháp cho phép một phạm vi rộng hơn các biểu thức theo sau toán tử `delete`, nhưng chỉ các dạng trên dẫn đến các hành vi có ý nghĩa.

### Tham số

- `object`
  - : Tên của một object, hoặc một biểu thức được đánh giá thành một object.
- `property`
  - : Thuộc tính cần xóa.

### Giá trị trả về

`true` cho tất cả các trường hợp ngoại trừ khi thuộc tính là thuộc tính [own](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwn) [non-configurable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#configurable_attribute), trong trường hợp đó `false` được trả về trong chế độ không nghiêm ngặt.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode) nếu thuộc tính là thuộc tính own non-configurable.
- {{jsxref("ReferenceError")}}
  - : Được ném ra nếu `object` là [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super).

## Mô tả

Toán tử `delete` có cùng [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) với các toán tử unary khác như [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof). Do đó, nó chấp nhận bất kỳ biểu thức nào được hình thành bởi các toán tử có độ ưu tiên cao hơn. Tuy nhiên, các dạng sau dẫn đến lỗi cú pháp sớm trong [chế độ nghiêm ngặt](/en-US/docs/Web/JavaScript/Reference/Strict_mode):

```js-nolint example-bad
delete identifier;
delete object.#privateProperty;
```

Vì [classes](/en-US/docs/Web/JavaScript/Reference/Classes) tự động ở chế độ nghiêm ngặt, và [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) chỉ có thể được tham chiếu hợp lệ trong thân class, điều này có nghĩa là private elements không bao giờ có thể bị xóa. Trong khi `delete identifier` [có thể hoạt động](#deleting_global_properties) nếu `identifier` đề cập đến một thuộc tính có thể cấu hình của object global, bạn nên tránh dạng này và thêm tiền tố bằng [`globalThis`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/globalThis) thay thế.

Trong khi các biểu thức khác được chấp nhận, chúng không dẫn đến các hành vi có ý nghĩa:

```js example-bad
delete console.log(1);
// Logs 1, returns true, but nothing deleted
```

Toán tử `delete` xóa một thuộc tính đã cho khỏi một object. Khi xóa thành công, nó sẽ trả về `true`, nếu không thì `false` sẽ được trả về. Không giống như những gì niềm tin phổ biến gợi ý (có thể do các ngôn ngữ lập trình khác như [delete trong C++](https://learn.microsoft.com/en-us/cpp/cpp/delete-operator-cpp?view=msvc-170)), toán tử `delete` **không** liên quan đến việc giải phóng bộ nhớ trực tiếp. Quản lý bộ nhớ được thực hiện gián tiếp thông qua việc phá vỡ các tham chiếu. Xem trang [quản lý bộ nhớ](/en-US/docs/Web/JavaScript/Guide/Memory_management) để biết thêm chi tiết.

Điều quan trọng là cần xem xét các kịch bản sau:

- Nếu thuộc tính bạn đang cố gắng xóa không tồn tại, `delete` sẽ không có bất kỳ hiệu lực nào và sẽ trả về `true`.
- `delete` chỉ có hiệu lực trên các thuộc tính own. Nếu một thuộc tính có cùng tên tồn tại trên chuỗi prototype của object, thì sau khi xóa, object sẽ sử dụng thuộc tính từ chuỗi prototype.
- Các thuộc tính non-configurable không thể bị xóa. Điều này bao gồm các thuộc tính của các object tích hợp như {{jsxref("Math")}}, {{jsxref("Array")}}, {{jsxref("Object")}} và các thuộc tính được tạo như non-configurable bằng các phương thức như {{jsxref("Object.defineProperty()")}}.
- Việc xóa các biến, bao gồm các tham số hàm, không bao giờ hoạt động. `delete variable` sẽ ném ra {{jsxref("SyntaxError")}} trong chế độ nghiêm ngặt, và sẽ không có hiệu lực trong chế độ không nghiêm ngặt.
  - Bất kỳ biến nào được khai báo với {{jsxref("Statements/var", "var")}} không thể bị xóa khỏi phạm vi global hoặc phạm vi hàm, bởi vì mặc dù chúng có thể được gắn vào [object global](/en-US/docs/Glossary/Global_object), chúng không có thể cấu hình.
  - Bất kỳ biến nào được khai báo với {{jsxref("Statements/let", "let")}} hoặc {{jsxref("Statements/const", "const")}} không thể bị xóa khỏi phạm vi mà chúng được định nghĩa, vì chúng không được gắn vào một object.

## Ví dụ

### Sử dụng delete

> [!NOTE]
> Ví dụ sau đây sử dụng các tính năng chỉ dành cho chế độ không nghiêm ngặt, như tạo biến global ngầm và xóa các identifier, bị cấm trong chế độ nghiêm ngặt.

```js
// Creates the property empCount on the global scope.
// Since we are using var, this is marked as non-configurable.
var empCount = 43;

// Creates the property EmployeeDetails on the global scope.
// Since it was defined without "var", it is marked configurable.
EmployeeDetails = {
  name: "xyz",
  age: 5,
  designation: "Developer",
};

// delete can be used to remove properties from objects.
delete EmployeeDetails.name; // returns true

// Even when the property does not exist, delete returns "true".
delete EmployeeDetails.salary; // returns true

// EmployeeDetails is a property of the global scope.
delete EmployeeDetails; // returns true

// On the contrary, empCount is not configurable
// since var was used.
delete empCount; // returns false

// delete also does not affect built-in static properties
// that are non-configurable.
delete Math.PI; // returns false

function f() {
  var z = 44;

  // delete doesn't affect local variable names
  delete z; // returns false
}
```

### delete và chuỗi prototype

Trong ví dụ sau, chúng ta xóa một thuộc tính own của một object trong khi một thuộc tính có cùng tên có sẵn trên chuỗi prototype:

```js
function Foo() {
  this.bar = 10;
}

Foo.prototype.bar = 42;

const foo = new Foo();

// foo.bar is associated with the
// own property.
console.log(foo.bar); // 10

// Delete the own property within the
// foo object.
delete foo.bar; // returns true

// foo.bar is still available in the
// prototype chain.
console.log(foo.bar); // 42

// Delete the property on the prototype.
delete Foo.prototype.bar; // returns true

// The "bar" property can no longer be
// inherited from Foo since it has been
// deleted.
console.log(foo.bar); // undefined
```

### Xóa các phần tử mảng

Khi bạn xóa một phần tử mảng, `length` của mảng không bị ảnh hưởng. Điều này đúng ngay cả khi bạn xóa phần tử cuối cùng của mảng.

Khi toán tử `delete` xóa một phần tử mảng, phần tử đó không còn trong mảng nữa. Trong ví dụ sau, `trees[3]` bị xóa bằng `delete`.

```js
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
delete trees[3];
console.log(3 in trees); // false
```

Điều này tạo ra một [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) với một vị trí rỗng. Nếu bạn muốn một phần tử mảng tồn tại nhưng có giá trị undefined, hãy sử dụng giá trị `undefined` thay vì toán tử `delete`. Trong ví dụ sau, `trees[3]` được gán giá trị `undefined`, nhưng phần tử mảng vẫn tồn tại:

```js
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
trees[3] = undefined;
console.log(3 in trees); // true
```

Nếu thay vào đó bạn muốn xóa một phần tử mảng bằng cách thay đổi nội dung của mảng, hãy sử dụng phương thức {{jsxref("Array/splice", "splice()")}}. Trong ví dụ sau, `trees[3]` được xóa hoàn toàn khỏi mảng bằng {{jsxref("Array/splice", "splice()")}}:

```js
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
trees.splice(3, 1);
console.log(trees); // ["redwood", "bay", "cedar", "maple"]
```

### Xóa các thuộc tính non-configurable

Khi một thuộc tính được đánh dấu là non-configurable, `delete` sẽ không có bất kỳ hiệu lực nào, và sẽ trả về `false`. Trong chế độ nghiêm ngặt, điều này sẽ gây ra `TypeError`.

```js
const Employee = {};
Object.defineProperty(Employee, "name", { configurable: false });

console.log(delete Employee.name); // returns false
```

{{jsxref("Statements/var", "var")}} tạo các thuộc tính non-configurable không thể bị xóa bằng toán tử `delete`:

```js
// Since "nameOther" is added using with the
// var keyword, it is marked as non-configurable
var nameOther = "XYZ";

// We can access this global property using:
Object.getOwnPropertyDescriptor(globalThis, "nameOther");
// {
//   value: "XYZ",
//   writable: true,
//   enumerable: true,
//   configurable: false
// }

delete globalThis.nameOther; // return false
```

Trong chế độ nghiêm ngặt, điều này sẽ gây ra ngoại lệ.

### Xóa thuộc tính global

Nếu một thuộc tính global có thể cấu hình (ví dụ: thông qua phép gán thuộc tính trực tiếp), nó có thể bị xóa, và các tham chiếu tiếp theo đến chúng như biến global sẽ tạo ra {{jsxref("ReferenceError")}}.

```js
globalThis.globalVar = 1;
console.log(globalVar); // 1
// In non-strict mode, you can use `delete globalVar` as well
delete globalThis.globalVar;
console.log(globalVar); // ReferenceError: globalVar is not defined
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Reflect.deleteProperty()")}}
- {{jsxref("Map.prototype.delete()")}}
