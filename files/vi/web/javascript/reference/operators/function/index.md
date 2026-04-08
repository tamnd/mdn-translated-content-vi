---
title: function expression
slug: Web/JavaScript/Reference/Operators/function
page-type: javascript-operator
browser-compat: javascript.operators.function
sidebar: jssidebar
---

Từ khóa **`function`** có thể được dùng để định nghĩa một hàm bên trong một biểu thức.

Bạn cũng có thể định nghĩa hàm bằng [khai báo `function`](/en-US/docs/Web/JavaScript/Reference/Statements/function) hoặc [cú pháp mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

{{InteractiveExample("JavaScript Demo: function expression", "shorter")}}

```js interactive-example
const getRectArea = function (width, height) {
  return width * height;
};

console.log(getRectArea(3, 4));
// Expected output: 12
```

## Cú pháp

```js-nolint
function (param0) {
  statements
}
function (param0, param1) {
  statements
}
function (param0, param1, /* …, */ paramN) {
  statements
}

function name(param0) {
  statements
}
function name(param0, param1) {
  statements
}
function name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng từ khóa `function` để tránh mơ hồ với [khai báo `function`](/en-US/docs/Web/JavaScript/Reference/Statements/function). Từ khóa `function` chỉ bắt đầu một biểu thức khi nó xuất hiện trong ngữ cảnh không thể chấp nhận câu lệnh.

### Tham số

- `name` {{optional_inline}}
  - : Tên hàm. Có thể bỏ qua, trong trường hợp đó hàm là _ẩn danh_ (anonymous). Tên chỉ là cục bộ cho thân hàm.
- `paramN` {{optional_inline}}
  - : Tên của tham số hình thức cho hàm. Để biết cú pháp của các tham số, hãy xem [tham chiếu Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo thành thân hàm.

## Mô tả

Một `function` expression rất giống và có cú pháp gần như giống hệt với [khai báo `function`](/en-US/docs/Web/JavaScript/Reference/Statements/function). Sự khác biệt chính giữa `function` expression và khai báo `function` là _tên hàm_, có thể bỏ qua trong `function` expression để tạo các hàm _ẩn danh_. Một `function` expression có thể được sử dụng như một [IIFE](/en-US/docs/Glossary/IIFE) (Immediately Invoked Function Expression) chạy ngay khi nó được định nghĩa. Hãy xem thêm chương về [functions](/en-US/docs/Web/JavaScript/Reference/Functions) để biết thêm thông tin.

### Hoisting của function expression

Function expression trong JavaScript không được hoisted, không giống như [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function#hoisting). Bạn không thể sử dụng function expression trước khi tạo chúng:

```js
console.log(notHoisted); // undefined
// Even though the variable name is hoisted,
// the definition isn't. so it's undefined.
notHoisted(); // TypeError: notHoisted is not a function

var notHoisted = function () {
  console.log("bar");
};
```

### Function expression có tên

Nếu bạn muốn tham chiếu đến hàm hiện tại trong thân hàm, bạn cần tạo một named function expression. Tên này sau đó chỉ là cục bộ cho thân hàm (phạm vi). Điều này tránh sử dụng thuộc tính {{jsxref("Functions/arguments/callee", "arguments.callee")}} không được khuyến nghị để gọi hàm đệ quy.

```js
const math = {
  factorial: function factorial(n) {
    console.log(n);
    if (n <= 1) {
      return 1;
    }
    return n * factorial(n - 1);
  },
};

math.factorial(3); // 3;2;1;
```

Nếu function expression được đặt tên, thuộc tính [`name`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/name) của hàm được đặt thành tên đó, thay vì tên ngầm định được suy ra từ cú pháp (như biến mà hàm được gán).

Không giống như khai báo, tên của function expression là chỉ đọc (read-only).

```js
"use strict";

function foo() {
  foo = 1;
}
foo();
console.log(foo); // 1
(function foo() {
  foo = 1; // TypeError: Assignment to constant variable.
})();
```

## Ví dụ

### Sử dụng function expression

Ví dụ sau định nghĩa một hàm không tên và gán nó cho `x`. Hàm trả về bình phương của đối số của nó:

```js
const x = function (y) {
  return y * y;
};
```

### Sử dụng hàm như callback

Thường dùng hơn là nó được sử dụng như một {{Glossary("Callback_function", "callback")}}:

```js
button.addEventListener("click", function (event) {
  console.log("button is clicked!");
});
```

### Sử dụng Immediately Invoked Function Expression (IIFE)

[IIFE](/en-US/docs/Glossary/IIFE) là một mẫu phổ biến được sử dụng để thực thi tùy ý nhiều câu lệnh trong phạm vi riêng của chúng (và có thể trả về giá trị), ở vị trí yêu cầu một biểu thức đơn. Nhiều trường hợp sử dụng truyền thống của IIFE đã lỗi thời bởi các tính năng cú pháp mới như [modules](/en-US/docs/Web/JavaScript/Guide/Modules) và [khai báo block-scoped](/en-US/docs/Web/JavaScript/Reference/Statements/let). Bản thân IIFE hiện nay thường được viết với [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions), nhưng ý tưởng vẫn như cũ. Nhìn chung, IIFE trông như thế này:

```js
// standard IIFE
(function () {
  // statements…
})();

// IIFE with arguments
(function (a, b) {
  console.log(a + b);
})(1, 2); // logs 3

// IIFE being used to initialize a variable
const value = (() => {
  const randomValue = Math.random();
  if (randomValue > 0.5) {
    return "heads";
  }
  return "tails";
})();
```

Ở đây, chúng ta giới thiệu một số trường hợp sử dụng kèm ví dụ.

### Tránh ô nhiễm namespace toàn cục trong code script

Phạm vi cấp trên cùng của tất cả các script được chia sẻ, có thể bao gồm nhiều hàm và biến toàn cục từ các file khác nhau, vì vậy để tránh xung đột tên, điều quan trọng là hạn chế số lượng tên được khai báo toàn cục (điều này được giảm thiểu đáng kể trong [modules](/en-US/docs/Web/JavaScript/Guide/Modules#other_differences_between_modules_and_classic_scripts), nhưng đôi khi việc giới hạn phạm vi của các biến tạm thời vẫn hữu ích, đặc biệt khi file rất dài). Nếu chúng ta có một số code khởi tạo mà chúng ta không cần dùng lại, chúng ta có thể sử dụng mẫu IIFE, tốt hơn việc sử dụng khai báo hàm hoặc function expression vì nó đảm bảo code chỉ được chạy tại đây và một lần.

```js
// top-level of a script (not a module)

var globalVariable = (() => {
  // some initialization code
  let firstVariable = something();
  let secondVariable = somethingElse();
  return firstVariable + secondVariable;
})();

// firstVariable and secondVariable cannot be accessed outside of the function body.
```

### Module pattern

Chúng ta cũng sẽ sử dụng IIFE để tạo các biến và phương thức private và public. Để sử dụng phức tạp hơn của module pattern và các ứng dụng khác của IIFE, bạn có thể xem cuốn sách Learning JavaScript Design Patterns của Addy Osmani.

```js
const makeWithdraw = (balance) =>
  ((copyBalance) => {
    let balance = copyBalance; // This variable is private
    const doBadThings = () => {
      console.log("I will do bad things with your money");
    };
    doBadThings();
    return {
      withdraw(amount) {
        if (balance >= amount) {
          balance -= amount;
          return balance;
        }
        return "Insufficient money";
      },
    };
  })(balance);

const firstAccount = makeWithdraw(100); // "I will do bad things with your money"
console.log(firstAccount.balance); // undefined
console.log(firstAccount.withdraw(20)); // 80
console.log(firstAccount.withdraw(30)); // 50
console.log(firstAccount.doBadThings); // undefined; this method is private
const secondAccount = makeWithdraw(20); // "I will do bad things with your money"
console.log(secondAccount.withdraw(30)); // "Insufficient money"
console.log(secondAccount.withdraw(20)); // 0
```

### Vòng lặp for với var trước ES6

Chúng ta có thể thấy cách sử dụng IIFE sau trong một số code cũ, trước khi giới thiệu các khai báo block-scoped `let` và `const`. Với câu lệnh `var`, chúng ta chỉ có phạm vi hàm và phạm vi toàn cục. Giả sử chúng ta muốn tạo 2 nút với văn bản Button 0 và Button 1 và khi click vào chúng, chúng ta muốn chúng hiển thị thông báo 0 và 1. Code sau không hoạt động:

```js
for (var i = 0; i < 2; i++) {
  const button = document.createElement("button");
  button.innerText = `Button ${i}`;
  button.onclick = function () {
    console.log(i);
  };
  document.body.appendChild(button);
}
console.log(i); // 2
```

Khi click, cả Button 0 và Button 1 đều hiển thị 2 vì `i` là toàn cục, với giá trị cuối cùng là 2. Để sửa vấn đề này trước ES6, chúng ta có thể sử dụng mẫu IIFE:

```js
for (var i = 0; i < 2; i++) {
  const button = document.createElement("button");
  button.innerText = `Button ${i}`;
  button.onclick = (function (copyOfI) {
    return function () {
      console.log(copyOfI);
    };
  })(i);
  document.body.appendChild(button);
}
console.log(i); // 2
```

Khi click, Button 0 và 1 hiển thị 0 và 1. Biến `i` được định nghĩa toàn cục. Sử dụng câu lệnh `let`, chúng ta có thể đơn giản làm:

```js
for (let i = 0; i < 2; i++) {
  const button = document.createElement("button");
  button.innerText = `Button ${i}`;
  button.onclick = function () {
    console.log(i);
  };
  document.body.appendChild(button);
}
console.log(i); // Uncaught ReferenceError: i is not defined.
```

Khi click, các nút này hiển thị 0 và 1.

### Câu lệnh kiểm soát luồng ở vị trí biểu thức

IIFE cho phép chúng ta sử dụng các cấu trúc ngôn ngữ như `switch` trong một biểu thức.

```js
someObject.property = (() => {
  switch (someVariable) {
    case 0:
      return "zero";
    case 1:
      return "one";
    default:
      return "unknown";
  }
})();
```

Cách tiếp cận này có thể đặc biệt hữu ích trong các tình huống bạn muốn tạo biến `const`, nhưng buộc phải sử dụng `let` hoặc `var` trong quá trình khởi tạo:

```js
let onlyAssignedOnce;
try {
  onlyAssignedOnce = someFunctionThatMightThrow();
} catch (e) {
  onlyAssignedOnce = null;
}
```

Sử dụng IIFE, chúng ta có thể tạo biến `const`:

```js
const onlyAssignedOnce = (() => {
  try {
    return someFunctionThatMightThrow();
  } catch (e) {
    return null;
  }
})();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Function")}}
- {{jsxref("Functions/Arrow_functions", "Arrow functions", "", 1)}}
