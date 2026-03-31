---
title: The arguments object
slug: Web/JavaScript/Reference/Functions/arguments
page-type: javascript-language-feature
browser-compat: javascript.functions.arguments
sidebar: jssidebar
---

**`arguments`** là một đối tượng giống mảng có thể truy cập bên trong [hàm](/en-US/docs/Web/JavaScript/Guide/Functions), chứa các giá trị của các đối số được truyền cho hàm đó.

{{InteractiveExample("JavaScript Demo: The arguments object")}}

```js interactive-example
function func1(a, b, c) {
  console.log(arguments[0]);
  // Expected output: 1

  console.log(arguments[1]);
  // Expected output: 2

  console.log(arguments[2]);
  // Expected output: 3
}

func1(1, 2, 3);
```

## Mô tả

> [!NOTE]
> Trong code hiện đại, [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) nên được ưu tiên sử dụng.

Đối tượng `arguments` là một biến cục bộ có sẵn trong tất cả các hàm không phải [arrow](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions). Bạn có thể tham chiếu đến các đối số của hàm bên trong hàm đó bằng cách sử dụng đối tượng `arguments`. Nó có các mục cho mỗi đối số mà hàm được gọi với, với chỉ số của mục đầu tiên tại `0`.

Ví dụ, nếu một hàm được truyền 3 đối số, bạn có thể truy cập chúng như sau:

```js
arguments[0]; // first argument
arguments[1]; // second argument
arguments[2]; // third argument
```

Đối tượng `arguments` hữu ích cho các hàm được gọi với nhiều đối số hơn số lượng được khai báo chính thức để chấp nhận, được gọi là [_hàm variadic_](https://en.wikipedia.org/wiki/Variadic_function), như {{jsxref("Math.min()")}}. Hàm ví dụ này chấp nhận bất kỳ số lượng đối số chuỗi nào và trả về chuỗi dài nhất:

```js
function longestString() {
  let longest = "";
  if (arguments.length === 0) {
    throw new TypeError("At least one string is required");
  }
  for (const arg of arguments) {
    if (arg.length > longest.length) {
      longest = arg;
    }
  }
  return longest;
}
```

Bạn có thể sử dụng {{jsxref("Functions/arguments/length", "arguments.length")}} để đếm số lượng đối số mà hàm được gọi với. Nếu thay vào đó bạn muốn đếm số lượng tham số mà hàm được khai báo để chấp nhận, hãy kiểm tra thuộc tính {{jsxref("Function/length", "length")}} của hàm đó.

### Gán vào chỉ số

Mỗi chỉ số đối số cũng có thể được đặt hoặc gán lại:

```js
arguments[1] = "new value";
```

Các hàm không nghiêm ngặt chỉ có các tham số đơn giản (tức là không có rest, mặc định hoặc destructured parameter) sẽ đồng bộ giá trị mới của tham số với đối tượng `arguments`, và ngược lại:

```js
function func(a) {
  arguments[0] = 99; // updating arguments[0] also updates a
  console.log(a);
}
func(10); // 99

function func2(a) {
  a = 99; // updating a also updates arguments[0]
  console.log(arguments[0]);
}
func2(10); // 99
```

Các hàm không nghiêm ngặt _được_ truyền tham số [rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), [mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), hoặc [destructured](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) sẽ không đồng bộ các giá trị mới được gán cho tham số trong thân hàm với đối tượng `arguments`. Thay vào đó, đối tượng `arguments` trong các hàm không nghiêm ngặt với tham số phức tạp sẽ luôn phản ánh các giá trị được truyền cho hàm khi hàm được gọi.

```js
function funcWithDefault(a = 55) {
  arguments[0] = 99; // updating arguments[0] does not also update a
  console.log(a);
}
funcWithDefault(10); // 10

function funcWithDefault2(a = 55) {
  a = 99; // updating a does not also update arguments[0]
  console.log(arguments[0]);
}
funcWithDefault2(10); // 10

// An untracked default parameter
function funcWithDefault3(a = 55) {
  console.log(arguments[0]);
  console.log(arguments.length);
}
funcWithDefault3(); // undefined; 0
```

Đây là hành vi tương tự được thể hiện bởi tất cả [hàm strict-mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#making_eval_and_arguments_simpler), bất kể loại tham số nào được truyền. Tức là, việc gán giá trị mới cho tham số trong thân hàm không bao giờ ảnh hưởng đến đối tượng `arguments`, cũng như việc gán giá trị mới cho các chỉ số `arguments` sẽ không ảnh hưởng đến giá trị của tham số, ngay cả khi hàm chỉ có tham số đơn giản.

> [!NOTE]
> Bạn không thể viết chỉ thị `"use strict";` trong thân định nghĩa hàm chấp nhận tham số rest, mặc định hoặc destructured. Làm vậy sẽ ném ra [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Strict_non_simple_params).

### arguments là đối tượng giống mảng

`arguments` là một đối tượng giống mảng, có nghĩa là `arguments` có thuộc tính {{jsxref("Functions/arguments/length", "length")}} và các thuộc tính được lập chỉ số từ 0, nhưng không có các phương thức built-in của {{jsxref("Array")}} như {{jsxref("Array/forEach", "forEach()")}} hay {{jsxref("Array/map", "map()")}}. Tuy nhiên, nó có thể được chuyển đổi thành `Array` thực sự, sử dụng một trong [`slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice), {{jsxref("Array.from()")}}, hoặc [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).

```js
const args = Array.prototype.slice.call(arguments);
// or
const args = Array.from(arguments);
// or
const args = [...arguments];
```

Đối với các trường hợp sử dụng phổ biến, sử dụng nó như một đối tượng giống mảng là đủ, vì nó vừa [có thể duyệt qua](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/Symbol.iterator) vừa có `length` và chỉ số số. Ví dụ, [`Function.prototype.apply()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) chấp nhận các đối tượng giống mảng.

```js
function midpoint() {
  return (
    (Math.min.apply(null, arguments) + Math.max.apply(null, arguments)) / 2
  );
}

console.log(midpoint(3, 1, 4, 1, 5)); // 3
```

## Thuộc tính

- {{jsxref("Functions/arguments/callee", "arguments.callee")}} {{deprecated_inline}}
  - : Tham chiếu đến hàm đang thực thi hiện tại mà các đối số thuộc về. Bị cấm trong strict mode.
- {{jsxref("Functions/arguments/length", "arguments.length")}}
  - : Số lượng đối số được truyền cho hàm.
- [`arguments[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/Symbol.iterator)
  - : Trả về một đối tượng [array iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator) mới chứa các giá trị cho mỗi chỉ số trong `arguments`.

## Ví dụ

### Định nghĩa hàm nối nhiều chuỗi

Ví dụ này định nghĩa một hàm nối nhiều chuỗi. Đối số hình thức duy nhất của hàm là một chuỗi chứa các ký tự phân tách các mục cần nối.

```js
function myConcat(separator) {
  const args = Array.prototype.slice.call(arguments, 1);
  return args.join(separator);
}
```

Bạn có thể truyền nhiều đối số tùy ý cho hàm này. Nó trả về một danh sách chuỗi sử dụng mỗi đối số trong danh sách:

```js
myConcat(", ", "red", "orange", "blue");
// "red, orange, blue"

myConcat("; ", "elephant", "giraffe", "lion", "cheetah");
// "elephant; giraffe; lion; cheetah"

myConcat(". ", "sage", "basil", "oregano", "pepper", "parsley");
// "sage. basil. oregano. pepper. parsley"
```

### Định nghĩa hàm tạo danh sách HTML

Ví dụ này định nghĩa một hàm tạo một chuỗi chứa HTML cho một danh sách. Đối số hình thức duy nhất cho hàm là một chuỗi là `"u"` nếu danh sách là [không có thứ tự (bullet)](/en-US/docs/Web/HTML/Reference/Elements/ul), hoặc `"o"` nếu danh sách là [có thứ tự (đánh số)](/en-US/docs/Web/HTML/Reference/Elements/ol). Hàm được định nghĩa như sau:

```js
function list(type) {
  let html = `<${type}l><li>`;
  const args = Array.prototype.slice.call(arguments, 1);
  html += args.join("</li><li>");
  html += `</li></${type}l>`; // end list
  return html;
}
```

Bạn có thể truyền bất kỳ số lượng đối số nào cho hàm này, và nó thêm mỗi đối số như một mục danh sách vào danh sách của loại được chỉ định. Ví dụ:

```js
list("u", "One", "Two", "Three");
// "<ul><li>One</li><li>Two</li><li>Three</li></ul>"
```

### Sử dụng typeof với arguments

Toán tử {{jsxref("Operators/typeof", "typeof")}} trả về `'object'` khi được sử dụng với `arguments`

```js
console.log(typeof arguments); // 'object'
```

Kiểu của từng đối số có thể được xác định bằng cách lập chỉ số `arguments`:

```js
console.log(typeof arguments[0]); // returns the type of the first argument
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)
