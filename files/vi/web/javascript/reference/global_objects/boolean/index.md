---
title: Boolean
slug: Web/JavaScript/Reference/Global_Objects/Boolean
page-type: javascript-class
browser-compat: javascript.builtins.Boolean
sidebar: jsref
---

Giá trị **`Boolean`** có thể là một trong hai giá trị: `true` hoặc `false`, biểu diễn giá trị chân lý của một mệnh đề logic.

## Mô tả

Giá trị Boolean thường được tạo ra bởi [toán tử quan hệ](/en-US/docs/Web/JavaScript/Reference/Operators#relational_operators), [toán tử bằng nhau](/en-US/docs/Web/JavaScript/Reference/Operators#equality_operators), và [logical NOT (`!`)](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_NOT). Chúng cũng có thể được tạo ra bởi các hàm biểu diễn điều kiện, chẳng hạn như {{jsxref("Array.isArray()")}}. Lưu ý rằng [toán tử logic nhị phân](/en-US/docs/Web/JavaScript/Reference/Operators#binary_logical_operators) như `&&` và `||` trả về giá trị của các toán hạng, có thể là hoặc không là giá trị boolean.

Giá trị Boolean thường được sử dụng trong kiểm tra điều kiện, chẳng hạn như điều kiện cho câu lệnh {{jsxref("Statements/if...else", "if...else")}} và {{jsxref("Statements/while", "while")}}, [toán tử điều kiện](/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator) (`? :`), hoặc giá trị trả về predicate của {{jsxref("Array.prototype.filter()")}}.

Bạn hiếm khi cần chuyển đổi rõ ràng một thứ gì đó sang giá trị boolean, vì JavaScript tự động thực hiện điều này trong ngữ cảnh boolean, vì vậy bạn có thể sử dụng bất kỳ giá trị nào như thể nó là boolean, dựa trên [tính truthy](#boolean_coercion) của nó. Bạn cũng được khuyến khích sử dụng `if (condition)` và `if (!condition)` thay vì `if (condition === true)` hoặc `if (condition === false)` trong code của mình để tận dụng quy ước này. Tuy nhiên, đảm bảo rằng các giá trị biểu diễn điều kiện luôn là boolean có thể giúp làm rõ ý định của code.

```js
// Do this:
// This always returns a boolean value
const isObject = (obj) => !!obj && typeof obj === "object";

// Or this:
const isObject = (obj) => Boolean(obj) && typeof obj === "object";

// Or this:
const isObject = (obj) => obj !== null && typeof obj === "object";

// Instead of this:
// This may return falsy values that are not equal to false
const isObject = (obj) => obj && typeof obj === "object";
```

### Boolean primitive và Boolean object

Để chuyển đổi giá trị không phải boolean sang boolean, hãy dùng `Boolean` như một hàm hoặc dùng toán tử [double NOT](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_NOT#double_not_!!). Không sử dụng constructor `Boolean()` với `new`.

```js example-good
const good = Boolean(expression);
const good2 = !!expression;
```

```js example-bad
const bad = new Boolean(expression); // don't use this!
```

Lý do là vì _tất cả_ các object, bao gồm cả `Boolean` object có giá trị bọc là `false`, đều là {{glossary("truthy")}} và được đánh giá là `true` trong các vị trí như câu lệnh điều kiện. (Xem thêm phần [boolean coercion](#boolean_coercion) bên dưới.)

```js
if (new Boolean(true)) {
  console.log("This log is printed.");
}

if (new Boolean(false)) {
  console.log("This log is ALSO printed.");
}

const myFalse = new Boolean(false); // myFalse is a Boolean object (not the primitive value false)
const g = Boolean(myFalse); // g is true
const myString = new String("Hello"); // myString is a String object
const s = Boolean(myString); // s is true
```

> [!WARNING]
> Bạn hiếm khi cần sử dụng `Boolean` như một constructor.

### Boolean coercion

Nhiều thao tác tích hợp sẵn mong đợi boolean trước tiên sẽ ép kiểu đối số của chúng sang boolean. [Thao tác](https://tc39.es/ecma262/multipage/abstract-operations.html#sec-toboolean) có thể được tóm tắt như sau:

- Boolean được trả về nguyên vẹn.
- [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) chuyển thành `false`.
- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) chuyển thành `false`.
- `0`, `-0`, và `NaN` chuyển thành `false`; các số khác chuyển thành `true`.
- `0n` chuyển thành `false`; các [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) khác chuyển thành `true`.
- String rỗng `""` chuyển thành `false`; các string khác chuyển thành `true`.
- [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) chuyển thành `true`.
- Tất cả các object đều trở thành `true`.

> [!NOTE]
> Một hành vi kế thừa khiến [`document.all`](/en-US/docs/Web/API/Document/all) trả về `false` khi được sử dụng như boolean, mặc dù nó là một object. Thuộc tính này là kế thừa và không chuẩn và không nên được sử dụng.

> [!NOTE]
> Không giống như các chuyển đổi kiểu khác như [string coercion](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) hoặc [number coercion](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), boolean coercion không cố gắng [chuyển đổi object sang primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) bằng cách gọi các phương thức người dùng.

Nói cách khác, chỉ có một số ít giá trị được ép kiểu thành `false` — chúng được gọi là các giá trị [falsy](/en-US/docs/Glossary/Falsy). Tất cả các giá trị khác được gọi là các giá trị [truthy](/en-US/docs/Glossary/Truthy). Tính truthy của một giá trị quan trọng khi được sử dụng với toán tử logic, câu lệnh điều kiện, hoặc bất kỳ ngữ cảnh boolean nào.

Có hai cách để đạt được hiệu ứng tương tự trong JavaScript.

- [Double NOT](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_NOT#double_not_!!): `!!x` phủ định `x` hai lần, chuyển đổi `x` sang boolean bằng cùng thuật toán như trên.
- Hàm [`Boolean()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean/Boolean): `Boolean(x)` sử dụng cùng thuật toán như trên để chuyển đổi `x`.

Lưu ý rằng tính truthy không giống với việc [bằng nhau theo nghĩa lỏng lẻo](/en-US/docs/Web/JavaScript/Reference/Operators/Equality) với `true` hoặc `false`.

```js
if ([]) {
  console.log("[] is truthy");
}
if ([] == false) {
  console.log("[] == false");
}
// [] is truthy
// [] == false
```

`[]` là truthy, nhưng nó cũng bằng lỏng lẻo với `false`. Nó là truthy vì tất cả các object đều truthy. Tuy nhiên, khi so sánh với `false`, vốn là một primitive, `[]` cũng được chuyển đổi sang primitive, là `""` thông qua {{jsxref("Array.prototype.toString()")}}. Việc so sánh string và boolean dẫn đến cả hai đều được [chuyển đổi sang number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), và chúng đều trở thành `0`, do đó `[] == false` là `true`. Nhìn chung, tính falsy và `== false` khác nhau trong các trường hợp sau:

- `NaN`, `undefined`, và `null` là falsy nhưng không bằng lỏng lẻo với `false`.
- `"0"` (và các string literal khác không phải `""` nhưng [được ép kiểu về 0](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion)) là truthy nhưng bằng lỏng lẻo với `false`.
- Các object luôn truthy, nhưng biểu diễn primitive của chúng có thể bằng lỏng lẻo với `false`.

Các giá trị truthy thậm chí ít có khả năng bằng lỏng lẻo với `true` hơn. Tất cả các giá trị đều là truthy hoặc falsy, nhưng hầu hết các giá trị không bằng lỏng lẻo với `true` hay `false`.

## Constructor

- {{jsxref("Boolean/Boolean", "Boolean()")}}
  - : Tạo các `Boolean` object. Khi được gọi như một hàm, nó trả về giá trị primitive kiểu Boolean.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Boolean.prototype` và được chia sẻ bởi tất cả các instance của `Boolean`.

- {{jsxref("Object/constructor", "Boolean.prototype.constructor")}}
  - : Hàm constructor đã tạo ra instance object. Đối với các instance `Boolean`, giá trị ban đầu là constructor {{jsxref("Boolean/Boolean", "Boolean")}}.

## Phương thức instance

- {{jsxref("Boolean.prototype.toString()")}}
  - : Trả về string `true` hoặc `false` tùy thuộc vào giá trị của object. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.
- {{jsxref("Boolean.prototype.valueOf()")}}
  - : Trả về giá trị primitive của object `Boolean`. Ghi đè phương thức {{jsxref("Object.prototype.valueOf()")}}.

## Ví dụ

### Tạo các giá trị false

```js
const bNoParam = Boolean();
const bZero = Boolean(0);
const bNull = Boolean(null);
const bEmptyString = Boolean("");
const bfalse = Boolean(false);
```

### Tạo các giá trị true

```js
const btrue = Boolean(true);
const btrueString = Boolean("true");
const bfalseString = Boolean("false");
const bSuLin = Boolean("Su Lin");
const bArrayProto = Boolean([]);
const bObjProto = Boolean({});
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Boolean](/en-US/docs/Glossary/Boolean)
- [Boolean primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type)
- [Kiểu dữ liệu Boolean](https://en.wikipedia.org/wiki/Boolean_data_type) trên Wikipedia
