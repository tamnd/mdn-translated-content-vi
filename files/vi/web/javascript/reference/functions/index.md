---
title: Functions
slug: Web/JavaScript/Reference/Functions
page-type: guide
browser-compat: javascript.functions
sidebar: jssidebar
---

Nhìn chung, hàm là một "chương trình con" có thể được _gọi_ bởi code bên ngoài (hoặc bên trong, trong trường hợp đệ quy) của hàm. Giống như bản thân chương trình, hàm được tạo thành từ một chuỗi câu lệnh gọi là _thân hàm_. Các giá trị có thể được _truyền_ cho hàm dưới dạng tham số, và hàm sẽ _trả về_ một giá trị.

Trong JavaScript, hàm là [đối tượng hạng nhất](/en-US/docs/Glossary/First-class_Function), vì chúng có thể được truyền cho các hàm khác, được trả về từ các hàm, và được gán cho các biến và thuộc tính. Chúng cũng có thể có thuộc tính và phương thức giống như bất kỳ đối tượng nào khác. Điều phân biệt chúng với các đối tượng khác là hàm có thể được gọi.

Để biết thêm ví dụ và giải thích, hãy xem [hướng dẫn JavaScript về hàm](/en-US/docs/Web/JavaScript/Guide/Functions).

## Mô tả

Giá trị hàm thường là các instance của [`Function`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function). Xem {{jsxref("Function")}} để biết thông tin về thuộc tính và phương thức của đối tượng `Function`. Các giá trị có thể gọi được khiến [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof) trả về `"function"` thay vì `"object"`.

> [!NOTE]
> Không phải tất cả giá trị có thể gọi đều là `instanceof Function`. Ví dụ, đối tượng `Function.prototype` có thể gọi nhưng không phải là instance của `Function`. Bạn cũng có thể thiết lập thủ công [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của hàm để nó không còn kế thừa từ `Function.prototype`. Tuy nhiên, những trường hợp như vậy rất hiếm.

### Giá trị trả về

Theo mặc định, nếu việc thực thi của hàm không kết thúc tại câu lệnh [`return`](/en-US/docs/Web/JavaScript/Reference/Statements/return), hoặc nếu từ khóa `return` không có biểu thức sau nó, thì giá trị trả về là {{jsxref("undefined")}}. Câu lệnh `return` cho phép bạn trả về giá trị tùy ý từ hàm. Một lần gọi hàm chỉ có thể trả về một giá trị, nhưng bạn có thể mô phỏng hiệu ứng trả về nhiều giá trị bằng cách trả về một đối tượng hoặc mảng và [destructure](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) kết quả.

> [!NOTE]
> Các constructor được gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) có một bộ logic khác để xác định giá trị trả về của chúng.

### Truyền đối số

[Tham số và đối số](<https://en.wikipedia.org/wiki/Parameter_(computer_programming)#Parameters_and_arguments>) có nghĩa hơi khác nhau, nhưng trong tài liệu MDN, chúng tôi thường dùng chúng thay thế nhau. Để tham khảo nhanh:

```js
function formatNumber(num) {
  return num.toFixed(2);
}

formatNumber(2);
```

Trong ví dụ này, biến `num` được gọi là _tham số_ của hàm: nó được khai báo trong danh sách được đặt trong ngoặc đơn của định nghĩa hàm. Hàm mong đợi tham số `num` là một số — mặc dù điều này không thể thực thi trong JavaScript mà không viết code xác thực runtime. Trong lời gọi `formatNumber(2)`, số `2` là _đối số_ của hàm: đó là giá trị thực sự được truyền cho hàm trong lời gọi hàm. Giá trị đối số có thể được truy cập bên trong thân hàm thông qua tên tham số tương ứng hoặc đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments).

Các đối số luôn được [_truyền theo giá trị_](https://en.wikipedia.org/wiki/Evaluation_strategy#Call_by_reference) và không bao giờ _truyền theo tham chiếu_. Điều này có nghĩa là nếu một hàm gán lại một tham số, giá trị sẽ không thay đổi bên ngoài hàm. Chính xác hơn, các đối số đối tượng được [_truyền theo chia sẻ_](https://en.wikipedia.org/wiki/Evaluation_strategy#Call_by_sharing), có nghĩa là nếu các thuộc tính của đối tượng bị thay đổi, thay đổi sẽ ảnh hưởng đến bên ngoài hàm. Ví dụ:

```js
function updateBrand(obj) {
  // Mutating the object is visible outside the function
  obj.brand = "Toyota";
  // Try to reassign the parameter, but this won't affect
  // the variable's value outside the function
  obj = null;
}

const car = {
  brand: "Honda",
  model: "Accord",
  year: 1998,
};

console.log(car.brand); // Honda

// Pass object reference to the function
updateBrand(car);

// updateBrand mutates car
console.log(car.brand); // Toyota
```

Từ khóa [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) đề cập đến đối tượng mà hàm được truy cập trên — nó không tham chiếu đến hàm đang thực thi, vì vậy bạn phải tham chiếu đến giá trị hàm theo tên, ngay cả trong thân hàm.

### Định nghĩa hàm

Nhìn chung, JavaScript có bốn loại hàm:

- Hàm thông thường (Regular function): có thể trả về bất cứ gì; luôn chạy đến hoàn thành sau khi được gọi
- Hàm generator: trả về một đối tượng [`Generator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator); có thể bị tạm dừng và tiếp tục với toán tử [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield)
- Hàm async: trả về một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise); có thể bị tạm dừng và tiếp tục với toán tử [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await)
- Hàm async generator: trả về một đối tượng [`AsyncGenerator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGenerator); cả hai toán tử `await` và `yield` đều có thể được sử dụng

Đối với mỗi loại hàm, có nhiều cách để định nghĩa nó:

- Khai báo
  - : [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function), [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*), [`async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function), [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*)
- Biểu thức
  - : [`function`](/en-US/docs/Web/JavaScript/Reference/Operators/function), [`function*`](/en-US/docs/Web/JavaScript/Reference/Operators/function*), [`async function`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function), [`async function*`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*)
- Constructor
  - : [`Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function), [`GeneratorFunction()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/GeneratorFunction/GeneratorFunction), [`AsyncFunction()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncFunction/AsyncFunction), [`AsyncGeneratorFunction()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGeneratorFunction/AsyncGeneratorFunction)

Ngoài ra, còn có các cú pháp đặc biệt để định nghĩa [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) và [phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions), cung cấp ngữ nghĩa chính xác hơn cho cách sử dụng của chúng. [Classes](/en-US/docs/Web/JavaScript/Reference/Classes) về mặt khái niệm không phải là hàm (vì chúng ném ra lỗi khi được gọi mà không có `new`), nhưng chúng cũng kế thừa từ `Function.prototype` và có `typeof MyClass === "function"`.

```js
// Constructor
const multiply = new Function("x", "y", "return x * y");

// Declaration
function multiply(x, y) {
  return x * y;
} // No need for semicolon here

// Expression; the function is anonymous but assigned to a variable
const multiply = function (x, y) {
  return x * y;
};
// Expression; the function has its own name
const multiply = function funcName(x, y) {
  return x * y;
};

// Arrow function
const multiply = (x, y) => x * y;

// Method
const obj = {
  multiply(x, y) {
    return x * y;
  },
};
```

Tất cả các cú pháp đều làm gần như cùng một điều, nhưng có một số sự khác biệt hành vi nhỏ.

- Cú pháp constructor `Function()`, `function` expression và khai báo `function` tạo ra các đối tượng hàm đầy đủ, có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Tuy nhiên, arrow function và phương thức không thể được khởi tạo. Các hàm async, hàm generator và hàm async generator không thể khởi tạo bất kể cú pháp.
- Khai báo `function` tạo ra các hàm được [_hoisted_](/en-US/docs/Web/JavaScript/Guide/Functions#function_hoisting). Các cú pháp khác không hoist hàm và giá trị hàm chỉ hiển thị sau định nghĩa.
- Arrow function và constructor `Function()` luôn tạo ra các hàm _ẩn danh_, có nghĩa là chúng không thể dễ dàng tự gọi đệ quy. Một cách để gọi đệ quy arrow function là gán nó cho một biến.
- Cú pháp arrow function không có quyền truy cập vào `arguments` hoặc `this`.
- Constructor `Function()` không thể truy cập bất kỳ biến cục bộ nào — nó chỉ có quyền truy cập vào phạm vi toàn cục.
- Constructor `Function()` gây ra biên dịch runtime và thường chậm hơn các cú pháp khác.

Đối với `function` expression, có sự phân biệt giữa tên hàm và biến mà hàm được gán. Tên hàm không thể thay đổi, trong khi biến mà hàm được gán có thể được gán lại. Tên hàm có thể khác với biến mà hàm được gán — chúng không có quan hệ với nhau. Tên hàm chỉ có thể được sử dụng trong thân hàm. Cố gắng sử dụng nó bên ngoài thân hàm dẫn đến lỗi (hoặc nhận một giá trị khác, nếu cùng tên được khai báo ở nơi khác). Ví dụ:

```js
const y = function x() {};
console.log(x); // ReferenceError: x is not defined
```

Mặt khác, biến mà hàm được gán chỉ bị giới hạn bởi phạm vi của nó, được đảm bảo bao gồm phạm vi mà hàm được khai báo.

Khai báo hàm cũng tạo một biến có cùng tên với tên hàm. Vì vậy, không giống như những hàm được định nghĩa bởi function expression, các hàm được định nghĩa bởi khai báo hàm có thể được truy cập theo tên của chúng trong phạm vi chúng được định nghĩa, cũng như trong chính thân chúng.

Một hàm được định nghĩa bởi `new Function` sẽ được lắp ráp source của nó một cách động, điều này có thể quan sát được khi bạn serialize nó. Ví dụ, `console.log(new Function().toString())` cho:

```js-nolint
function anonymous(
) {

}
```

Đây là source thực tế được dùng để biên dịch hàm. Tuy nhiên, mặc dù constructor `Function()` sẽ tạo hàm với tên `anonymous`, tên này không được thêm vào phạm vi của thân. Thân chỉ bao giờ có quyền truy cập vào các biến toàn cục. Ví dụ, đoạn sau sẽ dẫn đến lỗi:

```js
new Function("alert(anonymous);")();
```

Một hàm được định nghĩa bởi function expression hoặc khai báo hàm kế thừa phạm vi hiện tại. Tức là, hàm tạo thành một closure. Mặt khác, một hàm được định nghĩa bởi constructor `Function` không kế thừa bất kỳ phạm vi nào ngoài phạm vi toàn cục (mà tất cả các hàm kế thừa).

```js
// p is a global variable
globalThis.p = 5;
function myFunc() {
  // p is a local variable
  const p = 9;

  function decl() {
    console.log(p);
  }
  const expr = function () {
    console.log(p);
  };
  const cons = new Function("\tconsole.log(p);");

  decl();
  expr();
  cons();
}
myFunc();

// Logs:
// 9 (for 'decl' by function declaration (current scope))
// 9 (for 'expr' by function expression (current scope))
// 5 (for 'cons' by Function constructor (global scope))
```

Các hàm được định nghĩa bởi function expression và khai báo hàm chỉ được phân tích cú pháp một lần, trong khi hàm được định nghĩa bởi constructor `Function` phân tích cú pháp chuỗi được truyền cho nó mỗi khi constructor được gọi. Mặc dù function expression tạo ra một closure mỗi lần, thân hàm không được phân tích lại, vì vậy function expression vẫn nhanh hơn `new Function(...)`. Do đó, constructor `Function` thường nên tránh bất cứ khi nào có thể.

Một khai báo hàm có thể vô tình trở thành function expression khi nó xuất hiện trong ngữ cảnh biểu thức.

```js
// A function declaration
function foo() {
  console.log("FOO!");
}

doSomething(
  // A function expression passed as an argument
  function foo() {
    console.log("FOO!");
  },
);
```

Mặt khác, function expression cũng có thể trở thành khai báo hàm. Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng các từ khóa `function` hoặc `async function`, đây là một lỗi phổ biến khi triển khai [IIFE](/en-US/docs/Glossary/IIFE) (Immediately Invoked Function Expressions).

```js-nolint example-bad
function () { // SyntaxError: Function statements require a function name
  console.log("FOO!");
}();

function foo() {
  console.log("FOO!");
}(); // SyntaxError: Unexpected token ')'
```

Thay vào đó, hãy bắt đầu expression statement bằng thứ gì khác, để từ khóa `function` bắt đầu một function expression không mơ hồ. Các lựa chọn phổ biến bao gồm [grouping](/en-US/docs/Web/JavaScript/Reference/Operators/Grouping) và sử dụng [`void`](/en-US/docs/Web/JavaScript/Reference/Operators/void).

```js-nolint example-good
(function () {
  console.log("FOO!");
})();

void function () {
  console.log("FOO!");
}();
```

### Tham số hàm

Mỗi tham số hàm là một định danh đơn giản mà bạn có thể truy cập trong phạm vi cục bộ.

```js
function myFunc(a, b, c) {
  // You can access the values of a, b, and c here
}
```

Có ba cú pháp tham số đặc biệt:

- [_Default parameters_](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) cho phép các tham số hình thức được khởi tạo với giá trị mặc định nếu không có giá trị hoặc `undefined` được truyền.
- [_rest parameter_](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) cho phép biểu diễn số lượng đối số không xác định dưới dạng mảng.
- [_Destructuring_](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) cho phép giải nén các phần tử từ mảng, hoặc thuộc tính từ đối tượng, vào các biến riêng biệt.

```js
function myFunc({ a, b }, c = 1, ...rest) {
  // You can access the values of a, b, c, and rest here
}
```

Có một số hệ quả nếu một trong các cú pháp tham số không đơn giản ở trên được sử dụng:

- Bạn không thể áp dụng `"use strict"` vào thân hàm — điều này gây ra [lỗi cú pháp](/en-US/docs/Web/JavaScript/Reference/Errors/Strict_non_simple_params).
- Ngay cả khi hàm không ở [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), một số tính năng hàm strict mode vẫn áp dụng, bao gồm việc đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) dừng đồng bộ với các tham số được đặt tên, [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee) ném ra lỗi khi được truy cập, và tên tham số trùng lặp không được phép.

### Đối tượng arguments

Bạn có thể tham chiếu đến các đối số của hàm trong hàm bằng cách sử dụng đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments).

- [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments)
  - : Một đối tượng giống mảng chứa các đối số được truyền cho hàm đang thực thi hiện tại.
- [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee)
  - : Hàm đang thực thi hiện tại.
- [`arguments.length`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/length)
  - : Số lượng đối số được truyền cho hàm.

### Hàm getter và setter

Bạn có thể định nghĩa các accessor property trên bất kỳ đối tượng built-in tiêu chuẩn hoặc đối tượng người dùng định nghĩa nào hỗ trợ việc thêm thuộc tính mới. Trong [object literal](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) và [class](/en-US/docs/Web/JavaScript/Reference/Classes), bạn có thể sử dụng các cú pháp đặc biệt để định nghĩa getter và setter của một accessor property.

- [get](/en-US/docs/Web/JavaScript/Reference/Functions/get)
  - : Liên kết một thuộc tính đối tượng với một hàm sẽ được gọi khi thuộc tính đó được tra cứu.
- [set](/en-US/docs/Web/JavaScript/Reference/Functions/set)
  - : Liên kết một thuộc tính đối tượng với một hàm để được gọi khi có nỗ lực thiết lập thuộc tính đó.

Lưu ý rằng các cú pháp này tạo ra một _thuộc tính đối tượng_, không phải _phương thức_. Bản thân các hàm getter và setter chỉ có thể được truy cập bằng các API phản chiếu như {{jsxref("Object.getOwnPropertyDescriptor()")}}.

### Hàm block-level

Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), các hàm bên trong các khối được giới hạn trong khối đó. Trước ES2015, các hàm block-level bị cấm trong strict mode.

```js
"use strict";

function f() {
  return 1;
}

{
  function f() {
    return 2;
  }
}

f() === 1; // true

// f() === 2 in non-strict mode
```

### Hàm block-level trong code không nghiêm ngặt

Nói gọn: **Đừng dùng.**

Trong code không nghiêm ngặt, khai báo hàm bên trong các khối hoạt động kỳ lạ. Ví dụ:

```js
if (shouldDefineZero) {
  function zero() {
    // DANGER: compatibility risk
    console.log("This is zero.");
  }
}
```

Ngữ nghĩa của điều này trong strict mode được chỉ định rõ ràng — `zero` chỉ tồn tại trong phạm vi của khối `if`. Nếu `shouldDefineZero` là false, thì `zero` không nên được định nghĩa, vì khối không bao giờ thực thi. Tuy nhiên, về mặt lịch sử, điều này không được chỉ định, vì vậy các trình duyệt khác nhau đã triển khai nó khác nhau trong non-strict mode. Để biết thêm thông tin, hãy xem tham chiếu [khai báo `function`](/en-US/docs/Web/JavaScript/Reference/Statements/function#block-level_function_declaration).

Một cách an toàn hơn để định nghĩa hàm có điều kiện là gán function expression cho một biến:

```js
// Using a var makes it available as a global variable,
// with closer behavior to a top-level function declaration
var zero;
if (shouldDefineZero) {
  zero = function () {
    console.log("This is zero.");
  };
}
```

## Ví dụ

### Trả về số có định dạng

Hàm sau trả về một chuỗi chứa biểu diễn có định dạng của một số được đệm với các số 0 ở đầu.

```js
// This function returns a string padded with leading zeros
function padZeros(num, totalLen) {
  let numStr = num.toString(); // Initialize return value as string
  const numZeros = totalLen - numStr.length; // Calculate no. of zeros
  for (let i = 1; i <= numZeros; i++) {
    numStr = `0${numStr}`;
  }
  return numStr;
}
```

Các câu lệnh sau gọi hàm `padZeros`.

```js
let result;
result = padZeros(42, 4); // returns "0042"
result = padZeros(42, 2); // returns "42"
result = padZeros(5, 4); // returns "0005"
```

### Xác định xem hàm có tồn tại không

Bạn có thể xác định xem hàm có tồn tại hay không bằng cách sử dụng toán tử [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof). Trong ví dụ sau, một bài kiểm tra được thực hiện để xác định xem đối tượng `window` có thuộc tính gọi là `noFunc` là một hàm hay không. Nếu có, nó được sử dụng; ngược lại, một hành động khác được thực hiện.

```js
if (typeof window.noFunc === "function") {
  // use noFunc()
} else {
  // do something else
}
```

Lưu ý rằng trong bài kiểm tra `if`, một tham chiếu đến `noFunc` được sử dụng — không có dấu ngoặc đơn `()` sau tên hàm nên hàm thực tế không được gọi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Statements/function", "function")}}
- [`function` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- {{jsxref("Function")}}
