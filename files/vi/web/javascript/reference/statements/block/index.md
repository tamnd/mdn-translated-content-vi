---
title: Block statement
slug: Web/JavaScript/Reference/Statements/block
page-type: javascript-statement
browser-compat: javascript.statements.block
sidebar: jssidebar
---

**Câu lệnh block** được sử dụng để nhóm không hoặc nhiều câu lệnh. Block được giới hạn bởi một cặp dấu ngoặc nhọn ("curly braces") và chứa danh sách không hoặc nhiều câu lệnh và khai báo.

{{InteractiveExample("JavaScript Demo: Block statement", "taller")}}

```js interactive-example
var x = 1;
let y = 1;

if (true) {
  var x = 2;
  let y = 2;
}

console.log(x);
// Expected output: 2

console.log(y);
// Expected output: 1
```

## Cú pháp

```js-nolint
{
  StatementList
}
```

- `StatementList`
  - : Các câu lệnh và khai báo được nhóm trong câu lệnh block.

## Mô tả

Câu lệnh block thường được gọi là _câu lệnh ghép_ trong các ngôn ngữ khác. Nó cho phép bạn sử dụng nhiều câu lệnh ở nơi JavaScript chỉ mong đợi một câu lệnh. Kết hợp các câu lệnh vào block là thực hành phổ biến trong JavaScript, đặc biệt khi dùng kết hợp với các câu lệnh kiểm soát luồng như {{jsxref("Statements/if...else", "if...else")}} và {{jsxref("Statements/for", "for")}}. Hành vi ngược lại có thể thực hiện bằng cách sử dụng [câu lệnh rỗng](/en-US/docs/Web/JavaScript/Reference/Statements/Empty), nơi bạn không cung cấp câu lệnh, mặc dù có một câu lệnh là bắt buộc.

Ngoài ra, kết hợp với các khai báo có phạm vi block như [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), và [`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class), các block có thể ngăn các biến tạm thời làm ô nhiễm không gian tên toàn cục, giống như cách [IIFE](/en-US/docs/Glossary/IIFE) làm.

### Quy tắc phạm vi block với var hoặc khai báo hàm trong chế độ không strict

Các biến được khai báo bằng `var` hoặc được tạo bởi [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function) trong chế độ không strict **không có** phạm vi block. Các biến được giới thiệu trong một block có phạm vi trong hàm hoặc script bao chứa, và hiệu ứng của việc đặt chúng tiếp tục vượt ra ngoài block đó. Ví dụ:

```js
var x = 1;
{
  var x = 2;
}
console.log(x); // 2
```

Kết quả này in ra 2 vì câu lệnh `var x` bên trong block ở cùng phạm vi với câu lệnh `var x` trước block.

Trong code không strict, khai báo hàm bên trong block hoạt động kỳ lạ. Không nên sử dụng chúng.

### Quy tắc phạm vi block với let, const, class, hoặc khai báo hàm trong chế độ strict

Ngược lại, các định danh được khai báo bằng [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), và [`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class) có phạm vi block:

```js
let x = 1;
{
  let x = 2;
}
console.log(x); // 1
```

`x = 2` bị giới hạn trong phạm vi của block mà nó được định nghĩa.

Tương tự với `const`:

```js
const c = 1;
{
  const c = 2;
}
console.log(c); // 1; does not throw SyntaxError
```

Lưu ý rằng `const c = 2` có phạm vi block _không_ ném ra `SyntaxError: Identifier 'c' has already been declared` vì nó có thể được khai báo duy nhất trong block.

Trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), khai báo hàm bên trong block có phạm vi trong block đó và được hoisted lên đầu block.

```js
"use strict";

{
  foo(); // Logs "foo"
  function foo() {
    console.log("foo");
  }
}

foo(); // ReferenceError: foo is not defined
```

## Ví dụ

### Sử dụng câu lệnh block làm thân vòng lặp for

Một vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for) chấp nhận một câu lệnh duy nhất làm thân của nó.

```js
for (let i = 0; i < 10; i++) console.log(i);
```

Nếu bạn muốn sử dụng nhiều hơn một câu lệnh trong thân vòng lặp, bạn có thể nhóm chúng thành một câu lệnh block:

```js
for (let i = 0; i < 10; i++) {
  console.log(i);
  console.log(i ** 2);
}
```

### Sử dụng câu lệnh block để đóng gói dữ liệu

Khai báo `let` và `const` có phạm vi trong block bao chứa. Điều này cho phép bạn ẩn dữ liệu khỏi phạm vi toàn cục mà không cần bọc nó trong hàm.

```js
let sector;
{
  // These variables are scoped to this block and are not
  // accessible after the block
  const angle = Math.PI / 3;
  const radius = 10;
  sector = {
    radius,
    angle,
    area: (angle / 2) * radius ** 2,
    perimeter: 2 * radius + angle * radius,
  };
}
console.log(sector);
// {
//   radius: 10,
//   angle: 1.0471975511965976,
//   area: 52.35987755982988,
//   perimeter: 30.471975511965976
// }
console.log(typeof radius); // "undefined"
```

### Khai báo `using` trong block

Bạn có thể khai báo các biến với {{jsxref("Statements/using", "using")}} hoặc {{jsxref("Statements/await_using", "await using")}} trong một block, điều này khiến đối tượng được lưu trong biến bị giải phóng khi luồng điều khiển thoát khỏi block. Để biết thêm thông tin, xem [quản lý tài nguyên](/en-US/docs/Web/JavaScript/Guide/Resource_management).

```js
{
  using reader1 = stream1.getReader();
  using reader2 = stream2.getReader();

  // do something with reader1 and reader2

  // Before we exit the block, reader1 and reader2 are automatically released
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/while", "while")}}
- {{jsxref("Statements/if...else", "if...else")}}
- {{jsxref("Statements/let", "let")}}
