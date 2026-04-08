---
title: Statements and declarations
slug: Web/JavaScript/Reference/Statements
page-type: landing-page
browser-compat: javascript.statements
sidebar: jssidebar
---

Các ứng dụng JavaScript bao gồm các câu lệnh với cú pháp phù hợp. Một câu lệnh duy nhất có thể trải dài nhiều dòng. Nhiều câu lệnh có thể xuất hiện trên một dòng nếu mỗi câu lệnh được phân tách bằng dấu chấm phẩy. Đây không phải là một từ khóa, mà là một nhóm các từ khóa.

## Câu lệnh và khai báo theo danh mục

Để xem danh sách theo thứ tự bảng chữ cái, hãy xem thanh bên bên trái.

### Luồng điều khiển

- {{jsxref("Statements/return", "return")}}
  - : Chỉ định giá trị được trả về bởi một hàm.
- {{jsxref("Statements/break", "break")}}
  - : Kết thúc vòng lặp hiện tại, câu lệnh switch, hoặc câu lệnh nhãn và chuyển quyền điều khiển chương trình đến câu lệnh theo sau câu lệnh đã kết thúc.
- {{jsxref("Statements/continue", "continue")}}
  - : Kết thúc việc thực thi các câu lệnh trong lần lặp hiện tại của vòng lặp hiện tại hoặc vòng lặp được đặt tên, và tiếp tục thực thi vòng lặp với lần lặp tiếp theo.
- {{jsxref("Statements/throw", "throw")}}
  - : Ném một ngoại lệ do người dùng định nghĩa.
- {{jsxref("Statements/if...else", "if...else")}}
  - : Thực thi một câu lệnh nếu một điều kiện được chỉ định là đúng. Nếu điều kiện sai, một câu lệnh khác có thể được thực thi.
- {{jsxref("Statements/switch", "switch")}}
  - : Đánh giá một biểu thức, so khớp giá trị của biểu thức với một mệnh đề case, và thực thi các câu lệnh liên kết với case đó.
- {{jsxref("Statements/try...catch", "try...catch")}}
  - : Đánh dấu một khối câu lệnh để thử, và chỉ định một phản hồi, nếu một ngoại lệ được ném ra.

### Khai báo biến

- {{jsxref("Statements/var", "var")}}
  - : Khai báo một biến, tùy chọn khởi tạo nó với một giá trị.
- {{jsxref("Statements/let", "let")}}
  - : Khai báo một biến cục bộ phạm vi block, tùy chọn khởi tạo nó với một giá trị.
- {{jsxref("Statements/const", "const")}}
  - : Khai báo một hằng số có tên chỉ đọc.
- {{jsxref("Statements/using", "using")}}
  - : Khai báo các biến cục bộ được _dispose đồng bộ_.
- {{jsxref("Statements/await_using", "await using")}}
  - : Khai báo các biến cục bộ được _dispose bất đồng bộ_.

### Hàm và lớp

- {{jsxref("Statements/function", "function")}}
  - : Khai báo một hàm với các tham số được chỉ định.
- {{jsxref("Statements/function*", "function*")}}
  - : Generator Function cho phép viết [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) dễ dàng hơn.
- {{jsxref("Statements/async_function", "async function")}}
  - : Khai báo một async function với các tham số được chỉ định.
- {{jsxref("Statements/async_function*", "async function*")}}
  - : Asynchronous Generator Function cho phép viết async [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) dễ dàng hơn.
- {{jsxref("Statements/class", "class")}}
  - : Khai báo một lớp.

### Vòng lặp

- {{jsxref("Statements/do...while", "do...while")}}
  - : Tạo một vòng lặp thực thi một câu lệnh được chỉ định cho đến khi điều kiện kiểm tra đánh giá thành false. Điều kiện được đánh giá sau khi thực thi câu lệnh, kết quả là câu lệnh được chỉ định thực thi ít nhất một lần.
- {{jsxref("Statements/for", "for")}}
  - : Tạo một vòng lặp bao gồm ba biểu thức tùy chọn, được bao bởi dấu ngoặc đơn và phân tách bằng dấu chấm phẩy, theo sau là một câu lệnh được thực thi trong vòng lặp.
- {{jsxref("Statements/for...in", "for...in")}}
  - : Lặp qua các thuộc tính có thể đếm được của một đối tượng, theo thứ tự tùy ý. Đối với mỗi thuộc tính riêng biệt, các câu lệnh có thể được thực thi.
- {{jsxref("Statements/for...of", "for...of")}}
  - : Lặp qua các đối tượng iterable (bao gồm {{jsxref("Array", "mảng", "", 1)}}, các đối tượng giống mảng, [iterator và generator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)), gọi một hook lặp tùy chỉnh với các câu lệnh để thực thi cho giá trị của mỗi thuộc tính riêng biệt.
- {{jsxref("Statements/for-await...of", "for await...of")}}
  - : Lặp qua các đối tượng async iterable, các đối tượng giống mảng, [iterator và generator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators), gọi một hook lặp tùy chỉnh với các câu lệnh để thực thi cho giá trị của mỗi thuộc tính riêng biệt.
- {{jsxref("Statements/while", "while")}}
  - : Tạo một vòng lặp thực thi một câu lệnh được chỉ định miễn là điều kiện kiểm tra đánh giá thành true. Điều kiện được đánh giá trước khi thực thi câu lệnh.

### Khác

- {{jsxref("Statements/Empty", "Empty", "", 1)}}
  - : Câu lệnh rỗng được dùng để không cung cấp câu lệnh nào, mặc dù cú pháp JavaScript có thể yêu cầu một câu lệnh.
- {{jsxref("Statements/block", "Block", "", 1)}}
  - : Câu lệnh block được dùng để nhóm không hoặc nhiều câu lệnh. Block được phân giới bởi một cặp dấu ngoặc nhọn.
- {{jsxref("Statements/Expression_statement", "Expression statement", "", 1)}}
  - : Câu lệnh biểu thức đánh giá một biểu thức và loại bỏ kết quả của nó. Nó cho phép biểu thức thực hiện các side effect, chẳng hạn như thực thi một hàm hoặc cập nhật một biến.
- {{jsxref("Statements/debugger", "debugger")}}
  - : Gọi bất kỳ chức năng gỡ lỗi nào hiện có. Nếu không có chức năng gỡ lỗi nào, câu lệnh này không có tác dụng.
- {{jsxref("Statements/export", "export")}}
  - : Được dùng để xuất các hàm để có thể nhập trong các module bên ngoài, và các script khác.
- {{jsxref("Statements/import", "import")}}
  - : Được dùng để nhập các hàm được xuất từ một module bên ngoài, một script khác.
- {{jsxref("Statements/label", "label", "", 1)}}
  - : Cung cấp cho một câu lệnh một định danh mà bạn có thể tham chiếu bằng cách sử dụng câu lệnh `break` hoặc `continue`.
- {{jsxref("Statements/with", "with")}} {{deprecated_inline}}
  - : Mở rộng chuỗi phạm vi cho một câu lệnh.

## Sự khác biệt giữa câu lệnh và khai báo

Trong phần này, chúng ta sẽ kết hợp hai loại cấu trúc: [_câu lệnh_](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#prod-Statement) và [_khai báo_](https://tc39.es/ecma262/multipage/ecmascript-language-statements-and-declarations.html#prod-Declaration). Chúng là hai tập hợp ngữ pháp rời rạc. Sau đây là các khai báo:

- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Statements/async_function", "async function")}}
- {{jsxref("Statements/async_function*", "async function*")}}
- {{jsxref("Statements/class", "class")}}
- {{jsxref("Statements/export", "export")}} (Lưu ý: nó chỉ có thể xuất hiện ở top-level của một [module](/en-US/docs/Web/JavaScript/Guide/Modules))
- {{jsxref("Statements/import", "import")}} (Lưu ý: nó chỉ có thể xuất hiện ở top-level của một [module](/en-US/docs/Web/JavaScript/Guide/Modules))

Tất cả mọi thứ khác trong [danh sách ở trên](#statements_and_declarations_by_category) là câu lệnh.

Các thuật ngữ "câu lệnh" và "khai báo" có ý nghĩa chính xác trong cú pháp hình thức của JavaScript ảnh hưởng đến nơi chúng có thể được đặt trong code. Ví dụ, trong hầu hết các cấu trúc luồng điều khiển, phần thân chỉ chấp nhận câu lệnh—chẳng hạn như hai nhánh của [`if...else`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else):

```js-nolint
if (condition)
  statement1;
else
  statement2;
```

Nếu bạn sử dụng khai báo thay vì câu lệnh, đó sẽ là {{jsxref("SyntaxError")}}. Ví dụ, một khai báo [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) không phải là câu lệnh, vì vậy bạn không thể sử dụng nó ở dạng trần làm phần thân của câu lệnh `if`.

```js-nolint example-bad
if (condition)
  let i = 0; // SyntaxError: Lexical declaration cannot appear in a single-statement context
```

Mặt khác, [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) là một câu lệnh, vì vậy bạn có thể sử dụng nó một mình làm phần thân `if`.

```js-nolint example-good
if (condition)
  var i = 0;
```

Bạn có thể coi khai báo là "{{Glossary("binding")}} định danh với giá trị", và câu lệnh là "thực hiện các hành động". Thực tế là `var` là câu lệnh thay vì khai báo là một trường hợp đặc biệt, vì nó không tuân theo các quy tắc phạm vi từ vựng thông thường và có thể tạo ra các side effect—ở dạng tạo ra các biến toàn cục, biến đổi các biến đã được định nghĩa bởi `var`, và định nghĩa các biến có thể nhìn thấy bên ngoài block của nó (vì các biến được định nghĩa bởi `var` không có phạm vi block).

Như một ví dụ khác, [nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) chỉ có thể được gắn vào câu lệnh.

```js-nolint example-bad
label: const a = 1; // SyntaxError: Lexical declaration cannot appear in a single-statement context
```

> [!NOTE]
> Có một ngữ pháp cũ cho phép [khai báo hàm có nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label#labeled_function_declarations), nhưng nó chỉ được chuẩn hóa để tương thích với thực tế của web.

Để khắc phục điều này, bạn có thể bọc khai báo trong dấu ngoặc nhọn—điều này làm cho nó trở thành một phần của [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block).

```js example-good
label: {
  const a = 1;
}

if (condition) {
  let i = 0;
}
```

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Biểu thức và toán tử](/en-US/docs/Web/JavaScript/Reference/Operators)
