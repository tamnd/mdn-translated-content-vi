---
title: Hoisting
slug: Glossary/Hoisting
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hoisting** trong JavaScript đề cập đến quá trình mà theo đó trình thông dịch có vẻ như di chuyển phần _khai báo_ của hàm, biến, lớp hoặc lệnh import lên đầu {{glossary("scope")}} của chúng, trước khi code được thực thi.

_Hoisting_ không phải là thuật ngữ được định nghĩa chuẩn trong đặc tả ECMAScript. Đặc tả định nghĩa một nhóm khai báo là [_HoistableDeclaration_](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#prod-HoistableDeclaration), nhưng điều này chỉ bao gồm các khai báo [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function), [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*), [`async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) và [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*). Hoisting thường được coi là một tính năng của khai báo [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) cũng vậy, mặc dù theo cách khác. Theo nghĩa thông thường, bất kỳ hành vi nào sau đây có thể được coi là hoisting:

1. Có thể sử dụng giá trị của biến trong phạm vi của nó trước dòng khai báo nó. ("Hoisting giá trị")
2. Có thể tham chiếu đến một biến trong phạm vi của nó trước dòng khai báo nó mà không gây ra {{jsxref("ReferenceError")}}, nhưng giá trị luôn là [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined). ("Hoisting khai báo")
3. Khai báo biến gây ra thay đổi hành vi trong phạm vi của nó trước dòng khai báo.
4. Các tác dụng phụ của một khai báo được tạo ra trước khi đánh giá phần còn lại của code chứa nó.

Bốn khai báo hàm ở trên được hoisting với hành vi kiểu 1; khai báo `var` được hoisting với hành vi kiểu 2; khai báo [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) và [`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class) (còn được gọi chung là _khai báo từ vựng_) được hoisting với hành vi kiểu 3; khai báo [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) được hoisting với hành vi kiểu 1 và kiểu 4.

Một số người thích coi `let`, `const` và `class` là không hoisting, vì [temporal dead zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz) nghiêm cấm mọi việc sử dụng biến trước khai báo của nó. Sự bất đồng này là ổn, vì hoisting không phải là thuật ngữ được đồng thuận chung. Tuy nhiên, temporal dead zone có thể gây ra các thay đổi quan sát được khác trong phạm vi của nó, điều này gợi ý có một hình thức hoisting nào đó:

```js
const x = 1;
{
  console.log(x); // ReferenceError
  const x = 2;
}
```

Nếu khai báo `const x = 2` hoàn toàn không được hoisting (tức là nó chỉ có hiệu lực khi được thực thi), thì câu lệnh `console.log(x)` đáng lẽ phải đọc được giá trị `x` từ phạm vi trên. Tuy nhiên, vì khai báo `const` vẫn "làm nhiễm" toàn bộ phạm vi mà nó được định nghĩa, câu lệnh `console.log(x)` đọc `x` từ khai báo `const x = 2` — khai báo chưa được khởi tạo — và gây ra {{jsxref("ReferenceError")}}. Dù vậy, mô tả các khai báo từ vựng là không hoisting có thể hữu ích hơn về mặt thực dụng, vì hoisting của chúng không mang lại tính năng có ý nghĩa nào.

Lưu ý rằng phần sau đây không phải là một hình thức hoisting:

```js
{
  var x = 1;
}
console.log(x); // 1
```

Không có "truy cập trước khai báo" ở đây; đơn giản là vì khai báo `var` không có phạm vi khối.

Để biết thêm thông tin về hoisting, xem:

- Hoisting `var`/`let`/`const` — [Hướng dẫn về ngữ pháp và kiểu dữ liệu](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#variable_hoisting)
- Hoisting `function` — [Hướng dẫn về hàm](/en-US/docs/Web/JavaScript/Guide/Functions#function_hoisting)
- Hoisting `class` — [Hướng dẫn về lớp](/en-US/docs/Web/JavaScript/Guide/Using_classes#class_declaration_hoisting)
- Hoisting `import` — [Module JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules#import_declarations_are_hoisted)

## Xem thêm

- [Câu lệnh `var`](/en-US/docs/Web/JavaScript/Reference/Statements/var)
- [Câu lệnh `let`](/en-US/docs/Web/JavaScript/Reference/Statements/let)
- [Câu lệnh `const`](/en-US/docs/Web/JavaScript/Reference/Statements/const)
- [Câu lệnh `function`](/en-US/docs/Web/JavaScript/Reference/Statements/function)
- [Câu lệnh `class`](/en-US/docs/Web/JavaScript/Reference/Statements/class)
- [Câu lệnh `import`](/en-US/docs/Web/JavaScript/Reference/Statements/import)
