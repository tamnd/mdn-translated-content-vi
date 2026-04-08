---
title: Control flow and error handling
slug: Web/JavaScript/Guide/Control_flow_and_error_handling
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Grammar_and_types", "Web/JavaScript/Guide/Loops_and_iteration")}}

JavaScript hỗ trợ một tập hợp nhỏ gọn các câu lệnh, đặc biệt là các câu lệnh luồng điều khiển, mà bạn có thể sử dụng để tạo ra nhiều tính tương tác trong ứng dụng. Chương này cung cấp tổng quan về các câu lệnh đó.

[Tài liệu tham khảo JavaScript](/en-US/docs/Web/JavaScript/Reference/Statements) chứa thông tin chi tiết đầy đủ về các câu lệnh trong chương này. Ký tự dấu chấm phẩy (`;`) được dùng để phân tách các câu lệnh trong code JavaScript.

Bất kỳ biểu thức JavaScript nào cũng là một câu lệnh. Xem [Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators) để biết thông tin đầy đủ về các biểu thức.

## Câu lệnh block

Câu lệnh cơ bản nhất là _câu lệnh block_, được dùng để nhóm các câu lệnh lại. Block được giới hạn bởi một cặp dấu ngoặc nhọn:

```js
{
  statement1;
  statement2;
  // …
  statementN;
}
```

### Ví dụ

Câu lệnh block thường được dùng với các câu lệnh luồng điều khiển (`if`, `for`, `while`).

```js
while (x < 10) {
  x++;
}
```

Ở đây, `{ x++; }` là câu lệnh block.

> [!NOTE]
> Các biến được khai báo bằng [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) không có phạm vi block, mà thuộc phạm vi của hàm hoặc script chứa nó, và các hiệu ứng của việc thiết lập chúng tồn tại ngoài block đó. Ví dụ:
>
> ```js
> var x = 1;
> {
>   var x = 2;
> }
> console.log(x); // 2
> ```
>
> Điều này in ra `2` vì câu lệnh `var x` trong block có cùng phạm vi với câu lệnh `var x` trước block. (Trong C hoặc Java, code tương đương sẽ in ra `1`.)
>
> Hiệu ứng phạm vi này có thể được giảm thiểu bằng cách sử dụng {{jsxref("Statements/let", "let")}} hoặc {{jsxref("Statements/const", "const")}}.

## Câu lệnh điều kiện

Câu lệnh điều kiện là một tập hợp các lệnh thực thi nếu một điều kiện được chỉ định là đúng. JavaScript hỗ trợ hai câu lệnh điều kiện: `if...else` và `switch`.

### Câu lệnh if...else

Sử dụng câu lệnh `if` để thực thi một câu lệnh nếu điều kiện logic là `true`. Sử dụng mệnh đề `else` tùy chọn để thực thi một câu lệnh nếu điều kiện là `false`.

Một câu lệnh `if` trông như sau:

```js
if (condition) {
  statement1;
} else {
  statement2;
}
```

Ở đây, `condition` có thể là bất kỳ biểu thức nào đánh giá thành `true` hoặc `false`. (Xem [Boolean](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean#description) để giải thích những gì đánh giá thành `true` và `false`.)

Nếu `condition` đánh giá thành `true`, `statement1` được thực thi. Ngược lại, `statement2` được thực thi. `statement1` và `statement2` có thể là bất kỳ câu lệnh nào, bao gồm các câu lệnh `if` lồng nhau.

Bạn cũng có thể kết hợp các câu lệnh bằng `else if` để có nhiều điều kiện được kiểm tra tuần tự, như sau:

```js
if (condition1) {
  statement1;
} else if (condition2) {
  statement2;
} else if (conditionN) {
  statementN;
} else {
  statementLast;
}
```

Trong trường hợp có nhiều điều kiện, chỉ điều kiện logic đầu tiên đánh giá thành `true` mới được thực thi. Để thực thi nhiều câu lệnh, hãy nhóm chúng trong một câu lệnh block (`{ /* … */ }`).

#### Thực hành tốt nhất

Nói chung, thực hành tốt là luôn sử dụng câu lệnh block — _đặc biệt_ khi lồng các câu lệnh `if`:

```js
if (condition) {
  // Statements for when condition is true
  // …
} else {
  // Statements for when condition is false
  // …
}
```

Nói chung, thực hành tốt là không có `if...else` với một phép gán như `x = y` làm điều kiện:

```js-nolint example-bad
if (x = y) {
  // statements here
}
```

Tuy nhiên, trong trường hợp hiếm khi bạn muốn làm điều đó, tài liệu [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while) có một phần [Using an assignment as a condition](/en-US/docs/Web/JavaScript/Reference/Statements/while#using_an_assignment_as_a_condition) với hướng dẫn về cú pháp thực hành tốt nhất mà bạn nên biết và tuân theo.

#### Các giá trị Falsy

Các giá trị sau đánh giá thành `false` (còn được gọi là các giá trị [Falsy](/en-US/docs/Glossary/Falsy)):

- `false`
- `undefined`
- `null`
- `0`
- `NaN`
- chuỗi rỗng (`""`)

Tất cả các giá trị khác — bao gồm tất cả đối tượng — đánh giá thành `true` khi được truyền vào câu lệnh điều kiện.

> [!NOTE]
> Đừng nhầm lẫn các giá trị boolean primitive `true` và `false` với các giá trị true và false của đối tượng {{jsxref("Boolean")}}!
>
> Ví dụ:
>
> ```js
> const b = new Boolean(false);
> if (b) {
>   // this condition evaluates to true
> }
> if (b == true) {
>   // this condition evaluates to false
> }
> ```

#### Ví dụ

Trong ví dụ sau, hàm `checkData` trả về `true` nếu số ký tự trong đối tượng `Text` là ba. Ngược lại, nó hiển thị cảnh báo và trả về `false`.

```js
function checkData() {
  if (document.form1.threeChar.value.length === 3) {
    return true;
  }
  alert(
    `Enter exactly three characters. ${document.form1.threeChar.value} is not valid.`,
  );
  return false;
}
```

### Câu lệnh switch

Câu lệnh `switch` cho phép chương trình đánh giá một biểu thức và cố gắng khớp giá trị của biểu thức với nhãn `case`. Nếu tìm thấy khớp, chương trình thực thi câu lệnh liên quan.

Một câu lệnh `switch` trông như sau:

```js
switch (expression) {
  case label1:
    statements1;
    break;
  case label2:
    statements2;
    break;
  // …
  default:
    statementsDefault;
}
```

JavaScript đánh giá câu lệnh switch trên như sau:

- Chương trình đầu tiên tìm mệnh đề `case` có nhãn khớp với giá trị của biểu thức và sau đó chuyển quyền điều khiển đến mệnh đề đó, thực thi các câu lệnh liên quan.
- Nếu không tìm thấy nhãn khớp, chương trình tìm mệnh đề `default` tùy chọn:
  - Nếu tìm thấy mệnh đề `default`, chương trình chuyển quyền điều khiển đến mệnh đề đó, thực thi các câu lệnh liên quan.
  - Nếu không tìm thấy mệnh đề `default`, chương trình tiếp tục thực thi ở câu lệnh theo sau câu lệnh `switch`.
  - (Theo quy ước, mệnh đề `default` được viết là mệnh đề cuối cùng, nhưng không nhất thiết phải như vậy.)

#### Câu lệnh break

Câu lệnh `break` tùy chọn đi kèm với mỗi mệnh đề `case` đảm bảo rằng chương trình thoát khỏi `switch` sau khi câu lệnh khớp được thực thi, sau đó tiếp tục thực thi ở câu lệnh theo sau `switch`. Nếu bỏ `break`, chương trình tiếp tục thực thi bên trong câu lệnh `switch` (và sẽ thực thi các câu lệnh trong `case` tiếp theo, v.v.).

##### Ví dụ

Trong ví dụ sau, nếu `fruitType` đánh giá thành `"Bananas"`, chương trình khớp giá trị với `case "Bananas"` và thực thi câu lệnh liên quan. Khi gặp `break`, chương trình thoát khỏi `switch` và tiếp tục thực thi từ câu lệnh theo sau `switch`. Nếu `break` bị bỏ qua, câu lệnh cho `case "Cherries"` cũng sẽ được thực thi.

```js
switch (fruitType) {
  case "Oranges":
    console.log("Oranges are $0.59 a pound.");
    break;
  case "Apples":
    console.log("Apples are $0.32 a pound.");
    break;
  case "Bananas":
    console.log("Bananas are $0.48 a pound.");
    break;
  case "Cherries":
    console.log("Cherries are $3.00 a pound.");
    break;
  case "Mangoes":
    console.log("Mangoes are $0.56 a pound.");
    break;
  case "Papayas":
    console.log("Papayas are $2.79 a pound.");
    break;
  default:
    console.log(`Sorry, we are out of ${fruitType}.`);
}
console.log("Is there anything else you'd like?");
```

## Câu lệnh xử lý ngoại lệ

Bạn có thể ném ngoại lệ bằng câu lệnh `throw` và xử lý chúng bằng các câu lệnh `try...catch`.

- [Câu lệnh `throw`](#throw_statement)
- [Câu lệnh `try...catch`](#try...catch_statement)

### Các loại ngoại lệ

Hầu như bất kỳ đối tượng nào cũng có thể được ném ra trong JavaScript. Tuy nhiên, không phải tất cả các đối tượng được ném ra đều bình đẳng. Mặc dù việc ném số hoặc chuỗi là lỗi khá phổ biến, nhưng thường hiệu quả hơn khi sử dụng một trong các loại ngoại lệ được tạo ra đặc biệt cho mục đích này:

- [Ngoại lệ ECMAScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error#error_types)
- [`DOMException`](/en-US/docs/Web/API/DOMException)

### Câu lệnh throw

Sử dụng câu lệnh `throw` để ném một ngoại lệ. Câu lệnh `throw` chỉ định giá trị cần ném:

```js
throw expression;
```

Bạn có thể ném bất kỳ biểu thức nào, không chỉ các biểu thức của một kiểu cụ thể. Code sau ném nhiều ngoại lệ với các kiểu khác nhau:

```js
throw "Error2"; // String type
throw 42; // Number type
throw true; // Boolean type
throw {
  toString() {
    return "I'm an object!";
  },
};
```

### Câu lệnh try...catch

Câu lệnh `try...catch` đánh dấu một block câu lệnh để thử và chỉ định một hoặc nhiều phản hồi nếu một ngoại lệ được ném ra. Nếu một ngoại lệ được ném ra, câu lệnh `try...catch` sẽ bắt nó.

Câu lệnh `try...catch` bao gồm một block `try`, chứa một hoặc nhiều câu lệnh, và một block `catch`, chứa các câu lệnh chỉ định phải làm gì nếu ngoại lệ được ném ra trong block `try`.

Nói cách khác, bạn muốn block `try` thành công — nhưng nếu không, bạn muốn quyền điều khiển được chuyển sang block `catch`. Nếu bất kỳ câu lệnh nào trong block `try` (hoặc trong một hàm được gọi từ bên trong block `try`) ném ra một ngoại lệ, quyền điều khiển _ngay lập tức_ chuyển sang block `catch`. Nếu không có ngoại lệ nào được ném ra trong block `try`, block `catch` bị bỏ qua. Block `finally` thực thi sau khi các block `try` và `catch` thực thi nhưng trước các câu lệnh theo sau câu lệnh `try...catch`.

Ví dụ sau sử dụng câu lệnh `try...catch`. Ví dụ này gọi một hàm lấy tên tháng từ một mảng dựa trên giá trị được truyền vào hàm. Nếu giá trị không tương ứng với số tháng (`1` – `12`), một ngoại lệ được ném ra với giá trị `'Invalid month code'` và các câu lệnh trong block `catch` đặt biến `monthName` thành `'unknown'`.

```js
function getMonthName(mo) {
  mo--; // Adjust month number for array index (so that 0 = Jan, 11 = Dec)
  // prettier-ignore
  const months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
  ];
  if (!months[mo]) {
    throw new Error("Invalid month code"); // throw keyword is used here
  }
  return months[mo];
}

try {
  // statements to try
  monthName = getMonthName(myMonth); // function could throw exception
} catch (e) {
  monthName = "unknown";
  logMyErrors(e); // pass exception object to error handler (i.e. your own function)
}
```

#### Block catch

Bạn có thể sử dụng block `catch` để xử lý tất cả các ngoại lệ có thể được tạo ra trong block `try`.

```js-nolint
catch (exception) {
  statements
}
```

Block `catch` chỉ định một identifier (`exception` trong cú pháp trên) giữ giá trị được chỉ định bởi câu lệnh `throw`. Bạn có thể sử dụng identifier này để lấy thông tin về ngoại lệ được ném ra.

JavaScript tạo identifier này khi block `catch` được vào. Identifier chỉ tồn tại trong suốt thời gian của block `catch`. Sau khi block `catch` hoàn thành việc thực thi, identifier không còn tồn tại nữa.

Ví dụ, code sau ném ra một ngoại lệ. Khi ngoại lệ xảy ra, quyền điều khiển chuyển sang block `catch`.

```js
try {
  throw "myException"; // generates an exception
} catch (err) {
  // statements to handle any exceptions
  logMyErrors(err); // pass exception object to error handler
}
```

> [!NOTE]
> Khi ghi lỗi vào console bên trong block `catch`, nên sử dụng `console.error()` thay vì `console.log()` để debug. Nó định dạng thông báo như một lỗi và thêm nó vào danh sách các thông báo lỗi được tạo ra bởi trang.

#### Block finally

Block `finally` chứa các câu lệnh được thực thi _sau_ khi các block `try` và `catch` thực thi. Ngoài ra, block `finally` thực thi _trước_ code theo sau câu lệnh `try...catch...finally`.

Điều quan trọng cần lưu ý là block `finally` sẽ thực thi _dù có hay không_ có ngoại lệ được ném ra. Nếu có ngoại lệ được ném ra, tuy nhiên, các câu lệnh trong block `finally` thực thi ngay cả khi không có block `catch` nào xử lý ngoại lệ đó.

Bạn có thể sử dụng block `finally` để làm cho script của bạn thất bại nhẹ nhàng khi có ngoại lệ xảy ra. Ví dụ, bạn có thể cần giải phóng một tài nguyên mà script của bạn đã chiếm.

Ví dụ sau mở một tệp và sau đó thực thi các câu lệnh sử dụng tệp đó. (JavaScript phía máy chủ cho phép bạn truy cập tệp.) Nếu có ngoại lệ được ném ra trong khi tệp đang mở, block `finally` đóng tệp trước khi script thất bại. Sử dụng `finally` ở đây _đảm bảo_ rằng tệp không bao giờ bị bỏ mở, ngay cả khi có lỗi xảy ra.

```js
openMyFile();
try {
  writeMyFile(theData); // This may throw an error
} catch (e) {
  handleError(e); // If an error occurred, handle it
} finally {
  closeMyFile(); // Always close the resource
}
```

Nếu block `finally` trả về một giá trị, giá trị này trở thành giá trị trả về của toàn bộ câu lệnh `try...catch...finally`, bất kể các câu lệnh `return` trong các block `try` và `catch`:

```js
function f() {
  try {
    console.log(0);
    throw "bogus";
  } catch (e) {
    console.log(1);
    // This return statement is suspended
    // until finally block has completed
    return true;
    console.log(2); // not reachable
  } finally {
    console.log(3);
    return false; // overwrites the previous "return"
    // `f` exits here
    console.log(4); // not reachable
  }
  console.log(5); // not reachable
}
console.log(f()); // 0, 1, 3, false
```

Việc ghi đè giá trị trả về bởi block `finally` cũng áp dụng cho các ngoại lệ được ném hoặc ném lại bên trong block `catch`:

```js
function f() {
  try {
    throw "bogus";
  } catch (e) {
    console.log('caught inner "bogus"');
    // This throw statement is suspended until
    // finally block has completed
    throw e;
  } finally {
    return false; // overwrites the previous "throw"
    // `f` exits here
  }
}

try {
  console.log(f());
} catch (e) {
  // this is never reached!
  // while f() executes, the `finally` block returns false,
  // which overwrites the `throw` inside the above `catch`
  console.log('caught outer "bogus"');
}

// Logs:
// caught inner "bogus"
// false
```

#### Lồng các câu lệnh try...catch

Bạn có thể lồng một hoặc nhiều câu lệnh `try...catch`.

Nếu một block `try` bên trong _không_ có block `catch` tương ứng:

1. nó _phải_ chứa một block `finally`, và
2. block `catch` của câu lệnh `try...catch` bao ngoài được kiểm tra để tìm khớp.

Để biết thêm thông tin, hãy xem [nested try-blocks](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#nested_try_blocks) trên trang tài liệu tham khảo [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch).

### Sử dụng đối tượng Error

Tùy thuộc vào loại lỗi, bạn có thể sử dụng các thuộc tính `name` và `message` để nhận thông báo chi tiết hơn.

Thuộc tính `name` cung cấp lớp chung của `Error` (chẳng hạn như `DOMException` hoặc `Error`), trong khi `message` thường cung cấp thông báo ngắn gọn hơn so với việc chuyển đổi đối tượng lỗi thành chuỗi.

Nếu bạn đang ném các ngoại lệ của riêng mình, để tận dụng các thuộc tính này (chẳng hạn nếu block `catch` của bạn không phân biệt giữa các ngoại lệ của bạn và các ngoại lệ hệ thống), bạn có thể sử dụng constructor `Error`.

Ví dụ:

```js
function doSomethingErrorProne() {
  if (ourCodeMakesAMistake()) {
    throw new Error("The message");
  }
  doSomethingToGetAJavaScriptError();
}

try {
  doSomethingErrorProne();
} catch (e) {
  // Now, we actually use `console.error()`
  console.error(e.name); // 'Error'
  console.error(e.message); // 'The message', or a JavaScript error message
}
```

{{PreviousNext("Web/JavaScript/Guide/Grammar_and_types", "Web/JavaScript/Guide/Loops_and_iteration")}}
