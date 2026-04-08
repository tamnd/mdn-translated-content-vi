---
title: Property accessors
slug: Web/JavaScript/Reference/Operators/Property_accessors
page-type: javascript-operator
browser-compat: javascript.operators.property_accessors
sidebar: jssidebar
---

**Property accessors** (bộ truy cập thuộc tính) cung cấp quyền truy cập vào các thuộc tính của đối tượng bằng ký hiệu dấu chấm hoặc ký hiệu ngoặc vuông.

{{InteractiveExample("JavaScript Demo: Property accessors", "taller")}}

```js interactive-example
const person1 = {};
person1["firstName"] = "Mario";
person1["lastName"] = "Rossi";

console.log(person1.firstName);
// Expected output: "Mario"

const person2 = {
  firstName: "John",
  lastName: "Doe",
};

console.log(person2["lastName"]);
// Expected output: "Doe"
```

## Cú pháp

```js-nolint
object.propertyName
object[expression]
object.#privateProperty
```

## Mô tả

Có thể nghĩ về một đối tượng như một _mảng kết hợp_ (còn gọi là _map_, _dictionary_, _hash_, _lookup table_). Các _khóa_ trong mảng này là tên của các [thuộc tính](/en-US/docs/Glossary/Property/JavaScript) của đối tượng.

Có hai cách để truy cập thuộc tính: _ký hiệu dấu chấm_ và _ký hiệu ngoặc vuông_.

### Ký hiệu dấu chấm

Trong cú pháp `object.propertyName`, `propertyName` phải là một [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) JavaScript hợp lệ, có thể là một [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords). Ví dụ, `object.$1` là hợp lệ, trong khi `object.1` thì không.

```js
const variable = object.propertyName;
object.propertyName = value;
```

```js
const object = {};
object.$1 = "foo";
console.log(object.$1); // 'foo'
```

```js-nolint example-bad
const object = {};
object.1 = "bar"; // SyntaxError
console.log(object.1); // SyntaxError
```

Ở đây, phương thức có tên `createElement` được lấy từ `document` và được gọi.

```js
document.createElement("pre");
```

Nếu bạn sử dụng phương thức với một số nguyên literal, và số literal đó không có số mũ và không có dấu thập phân, bạn nên để [khoảng trắng](/en-US/docs/Glossary/Whitespace) trước dấu chấm trước lệnh gọi phương thức, để dấu chấm không bị hiểu là dấu thập phân.

```js-nolint
77 .toExponential();
// or
77
.toExponential();
// or
(77).toExponential();
// or
77..toExponential();
// or
77.0.toExponential();
// because 77. === 77.0, no ambiguity
```

Ngoài ra, [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) chỉ có thể được truy cập bằng ký hiệu dấu chấm bên trong class định nghĩa chúng.

### Ký hiệu ngoặc vuông

Trong cú pháp `object[expression]`, `expression` cần trả về một chuỗi hoặc [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) đại diện cho tên thuộc tính. Vì vậy, nó có thể là bất kỳ chuỗi literal nào, ví dụ bao gồm `'1foo'`, `'!bar!'`, hoặc thậm chí `' '` (một dấu cách).

```js
const variable = object[propertyName];
object[propertyName] = value;
```

Đoạn này thực hiện chính xác điều tương tự như ví dụ trước.

```js
document["createElement"]("pre");
```

Khoảng trắng trước ký hiệu ngoặc vuông được phép.

```js-nolint
document ["createElement"]("pre");
```

Truyền các biểu thức trả về tên thuộc tính sẽ cho kết quả tương tự như truyền trực tiếp tên thuộc tính.

```js
const key = "name";
const getKey = () => "name";
const Obj = { name: "Michel" };

Obj["name"]; // returns "Michel"
Obj[key]; // evaluates to Obj["name"], and returns "Michel"
Obj[getKey()]; // evaluates to Obj["name"], and returns "Michel"
```

Tuy nhiên, hãy cẩn thận khi sử dụng ngoặc vuông để truy cập các thuộc tính mà tên của chúng được cung cấp từ đầu vào bên ngoài. Điều này có thể khiến code của bạn dễ bị [tấn công object injection](https://github.com/eslint-community/eslint-plugin-security/blob/main/docs/the-dangers-of-square-bracket-notation.md).

### Tên thuộc tính

Mỗi tên thuộc tính là một chuỗi hoặc một [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol). Bất kỳ giá trị nào khác, bao gồm cả số, sẽ bị ép kiểu thành chuỗi. Đoạn này in ra `'value'`, vì `1` bị ép kiểu thành `'1'`.

```js
const object = {};
object["1"] = "value";
console.log(object[1]);
```

Đoạn này cũng in ra `'value'`, vì cả `foo` và `bar` đều được chuyển đổi thành cùng một chuỗi (`"[object Object]"`).

```js
const foo = { uniqueProp: 1 };
const bar = { uniqueProp: 2 };
const object = {};
object[foo] = "value";
console.log(object[bar]);
```

### Ràng buộc phương thức

Thông thường khi nói về thuộc tính của đối tượng, người ta phân biệt giữa thuộc tính và phương thức. Tuy nhiên, sự phân biệt thuộc tính/phương thức chỉ là một quy ước. Phương thức là một thuộc tính có thể được gọi (ví dụ, nếu nó có tham chiếu đến một instance {{jsxref("Function")}} làm giá trị).

Một phương thức không bị ràng buộc với đối tượng mà nó là thuộc tính của. Cụ thể, `this` không cố định trong một phương thức và không nhất thiết phải tham chiếu đến đối tượng chứa phương thức. Thay vào đó, `this` được "truyền" bởi lời gọi hàm. Xem [tham chiếu cho `this`](/en-US/docs/Web/JavaScript/Reference/Operators/this).

## Ví dụ

### Ký hiệu ngoặc vuông so với eval()

Người mới học JavaScript thường mắc lỗi sử dụng {{jsxref("Global_Objects/eval", "eval()")}} khi ký hiệu ngoặc vuông có thể được dùng thay thế.

Ví dụ, cú pháp sau thường được thấy trong nhiều script.

```js
const x = eval(`document.forms.form_name.elements.${strFormControl}.value`);
```

`eval()` chậm và nên tránh dùng bất cứ khi nào có thể. Ngoài ra, `strFormControl` phải giữ một định danh, điều này không bắt buộc đối với tên và `id` của form control. Tốt hơn là nên dùng ký hiệu ngoặc vuông:

```js
const x = document.forms.form_name.elements[strFormControl].value;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object")}}
- {{jsxref("Object.defineProperty()")}}
- [Optional chaining (`?.`)](/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)
