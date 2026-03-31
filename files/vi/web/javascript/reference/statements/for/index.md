---
title: for
slug: Web/JavaScript/Reference/Statements/for
page-type: javascript-statement
browser-compat: javascript.statements.for
sidebar: jssidebar
---

Câu lệnh **`for`** tạo ra một vòng lặp bao gồm ba biểu thức tùy chọn, được đặt trong ngoặc đơn và phân cách bởi dấu chấm phẩy, theo sau là một câu lệnh (thường là [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block)) được thực thi trong vòng lặp.

{{InteractiveExample("JavaScript Demo: for statement")}}

```js interactive-example
let str = "";

for (let i = 0; i < 9; i++) {
  str += i;
}

console.log(str);
// Expected output: "012345678"
```

## Cú pháp

```js-nolint
for (initialization; condition; afterthought)
  statement
```

- `initialization` {{optional_inline}}
  - : Một biểu thức (bao gồm [biểu thức gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment)) hoặc khai báo biến được đánh giá một lần trước khi vòng lặp bắt đầu. Thường được dùng để khởi tạo biến đếm. Biểu thức này có thể tùy chọn khai báo các biến mới với từ khóa `var` hoặc `let`. Các biến được khai báo bằng `var` không cục bộ với vòng lặp, tức là chúng nằm trong cùng phạm vi với vòng lặp `for`. Các biến được khai báo bằng `let` là cục bộ với câu lệnh.

    Kết quả của biểu thức này bị loại bỏ.

- `condition` {{optional_inline}}
  - : Một biểu thức được đánh giá trước mỗi lần lặp. Nếu biểu thức này [cho kết quả là true](/en-US/docs/Glossary/Truthy), `statement` được thực thi. Nếu biểu thức [cho kết quả là false](/en-US/docs/Glossary/Falsy), quá trình thực thi thoát khỏi vòng lặp và đến câu lệnh đầu tiên sau cấu trúc `for`.

    Kiểm tra điều kiện này là tùy chọn. Nếu bị bỏ qua, điều kiện luôn được đánh giá là true.

- `afterthought` {{optional_inline}}
  - : Một biểu thức được đánh giá ở cuối mỗi lần lặp. Điều này xảy ra trước lần đánh giá tiếp theo của `condition`. Thường được dùng để cập nhật hoặc tăng biến đếm.
- `statement`
  - : Một câu lệnh được thực thi miễn là điều kiện cho kết quả là true. Bạn có thể sử dụng [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block) để thực thi nhiều câu lệnh. Để không thực thi câu lệnh nào trong vòng lặp, sử dụng [câu lệnh rỗng](/en-US/docs/Web/JavaScript/Reference/Statements/Empty) (`;`).

## Mô tả

Giống như các câu lệnh vòng lặp khác, bạn có thể sử dụng [câu lệnh điều khiển luồng](/en-US/docs/Web/JavaScript/Reference/Statements#control_flow) trong `statement`:

- {{jsxref("Statements/break", "break")}} dừng thực thi `statement` và đến câu lệnh đầu tiên sau vòng lặp.
- {{jsxref("Statements/continue", "continue")}} dừng thực thi `statement` và đánh giá lại `afterthought` rồi đến `condition`.

## Ví dụ

### Sử dụng for

Câu lệnh `for` sau bắt đầu bằng việc khai báo biến `i` và khởi tạo nó bằng `0`. Nó kiểm tra rằng `i` nhỏ hơn chín, thực thi hai câu lệnh tiếp theo, và tăng `i` lên 1 sau mỗi lần lặp qua vòng lặp.

```js
for (let i = 0; i < 9; i++) {
  console.log(i);
  // more statements
}
```

### Cú pháp của block khởi tạo

Block khởi tạo chấp nhận cả biểu thức và khai báo biến. Tuy nhiên, biểu thức không thể sử dụng toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) không có ngoặc đơn, vì điều đó gây mơ hồ với vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in).

```js-nolint example-bad
for (let i = "start" in window ? window.start : 0; i < 9; i++) {
  console.log(i);
}
// SyntaxError: 'for-in' loop variable declaration may not have an initializer.
```

```js-nolint example-good
// Parenthesize the whole initializer
for (let i = ("start" in window ? window.start : 0); i < 9; i++) {
  console.log(i);
}

// Parenthesize the `in` expression
for (let i = ("start" in window) ? window.start : 0; i < 9; i++) {
  console.log(i);
}
```

### Các biểu thức for tùy chọn

Cả ba biểu thức trong phần đầu của vòng lặp `for` đều là tùy chọn. Ví dụ, không bắt buộc phải sử dụng block `initialization` để khởi tạo biến:

```js
let i = 0;
for (; i < 9; i++) {
  console.log(i);
  // more statements
}
```

Giống như block `initialization`, phần `condition` cũng là tùy chọn. Nếu bạn bỏ qua biểu thức này, bạn phải đảm bảo thoát khỏi vòng lặp trong thân để không tạo ra vòng lặp vô hạn.

```js
for (let i = 0; ; i++) {
  console.log(i);
  if (i > 3) break;
  // more statements
}
```

Bạn cũng có thể bỏ qua cả ba biểu thức. Một lần nữa, hãy đảm bảo sử dụng câu lệnh {{jsxref("Statements/break", "break")}} để kết thúc vòng lặp và cũng sửa đổi (tăng) một biến, để điều kiện cho câu lệnh break là true tại một thời điểm nào đó.

```js
let i = 0;

for (;;) {
  if (i > 3) break;
  console.log(i);
  i++;
}
```

Tuy nhiên, trong trường hợp bạn không sử dụng đầy đủ cả ba vị trí biểu thức — đặc biệt là nếu bạn không khai báo biến với biểu thức đầu tiên mà đang thay đổi thứ gì đó trong phạm vi cha — hãy xem xét sử dụng vòng lặp [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while) thay thế, vì nó làm rõ ý định hơn.

```js
let i = 0;

while (i <= 3) {
  console.log(i);
  i++;
}
```

### Khai báo từ vựng trong block khởi tạo

Khai báo một biến trong block khởi tạo có những điểm khác biệt quan trọng so với khai báo trong [phạm vi](/en-US/docs/Glossary/Scope) cha, đặc biệt là khi tạo [closure](/en-US/docs/Web/JavaScript/Guide/Closures) trong thân vòng lặp. Ví dụ, với code sau:

```js
for (let i = 0; i < 3; i++) {
  setTimeout(() => {
    console.log(i);
  }, 1000);
}
```

Nó in ra `0`, `1`, và `2`, như mong đợi. Tuy nhiên, nếu biến được định nghĩa trong phạm vi cha:

```js
let i = 0;
for (; i < 3; i++) {
  setTimeout(() => {
    console.log(i);
  }, 1000);
}
```

Nó in ra `3`, `3`, và `3`. Lý do là mỗi `setTimeout` tạo ra một closure mới đóng gói biến `i`, nhưng nếu `i` không được giới hạn trong thân vòng lặp, tất cả các closure sẽ tham chiếu đến cùng một biến khi chúng cuối cùng được gọi — và do tính bất đồng bộ của {{domxref("Window.setTimeout", "setTimeout()")}}, điều này sẽ xảy ra sau khi vòng lặp đã kết thúc, khiến giá trị của `i` trong thân của tất cả các callback đã xếp hàng có giá trị là `3`.

Điều này cũng xảy ra nếu bạn sử dụng câu lệnh `var` làm phần khởi tạo, vì các biến được khai báo bằng `var` chỉ có phạm vi hàm, không có phạm vi từ vựng (tức là chúng không thể được giới hạn trong thân vòng lặp).

```js
for (var i = 0; i < 3; i++) {
  setTimeout(() => {
    console.log(i);
  }, 1000);
}
// Logs 3, 3, 3
```

Hiệu ứng phạm vi của block khởi tạo có thể được hiểu như thể khai báo xảy ra trong thân vòng lặp, nhưng chỉ tình cờ có thể truy cập trong các phần `condition` và `afterthought`. Cụ thể hơn, các khai báo `let` được `for` xử lý đặc biệt — nếu `initialization` là khai báo `let`, thì mỗi lần, sau khi thân vòng lặp được đánh giá, điều sau đây xảy ra:

1. Một phạm vi từ vựng mới được tạo ra với các biến mới được khai báo bằng `let`.
2. Các giá trị binding từ lần lặp trước được dùng để khởi tạo lại các biến mới.
3. `afterthought` được đánh giá trong phạm vi mới.

Vì vậy, việc tái gán các biến mới trong `afterthought` không ảnh hưởng đến các binding từ lần lặp trước.

Một phạm vi từ vựng mới cũng được tạo sau `initialization`, ngay trước khi `condition` được đánh giá lần đầu tiên. Những chi tiết này có thể được quan sát bằng cách tạo các closure, cho phép nắm giữ một binding tại bất kỳ thời điểm cụ thể nào. Ví dụ, trong code này, một closure được tạo trong phần `initialization` không bị cập nhật bởi các tái gán của `i` trong `afterthought`:

```js
for (let i = 0, getI = () => i; i < 3; i++) {
  console.log(getI());
}
// Logs 0, 0, 0
```

Cái này không in ra "0, 1, 2", như điều sẽ xảy ra nếu `getI` được khai báo trong thân vòng lặp. Điều này là vì `getI` không được đánh giá lại mỗi lần lặp — mà hàm được tạo ra một lần và đóng gói biến `i`, tham chiếu đến biến được khai báo khi vòng lặp được khởi tạo lần đầu. Các cập nhật tiếp theo cho giá trị của `i` thực sự tạo ra các biến mới tên là `i`, mà `getI` không thấy. Một cách để khắc phục điều này là tính toán lại `getI` mỗi khi `i` được cập nhật:

```js
for (let i = 0, getI = () => i; i < 3; i++, getI = () => i) {
  console.log(getI());
}
// Logs 0, 1, 2
```

Biến `i` bên trong `initialization` khác với biến `i` bên trong mỗi lần lặp, kể cả lần đầu tiên. Vì vậy, trong ví dụ này, `getI` trả về 0, mặc dù giá trị của `i` bên trong lần lặp đã được tăng trước:

```js
for (let i = 0, getI = () => i; i < 3; ) {
  i++;
  console.log(getI());
}
// Logs 0, 0, 0
```

Trên thực tế, bạn có thể nắm giữ binding ban đầu của biến `i` và tái gán nó sau này, và giá trị được cập nhật này sẽ không thấy được trong thân vòng lặp, vốn thấy binding mới tiếp theo của `i`.

```js
for (
  let i = 0, getI = () => i, incrementI = () => i++;
  getI() < 3;
  incrementI()
) {
  console.log(i);
}
// Logs 0, 0, 0
```

Cái này in ra "0, 0, 0", vì biến `i` trong mỗi lần đánh giá vòng lặp thực sự là một biến riêng biệt, nhưng `getI` và `incrementI` đều đọc và ghi binding _ban đầu_ của `i`, không phải những gì được khai báo tiếp theo.

### Sử dụng for không có thân

Vòng lặp `for` sau tính toán vị trí offset của một node trong phần `afterthought`, và do đó không cần sử dụng phần `statement`, thay vào đó dùng dấu chấm phẩy.

```js
function showOffsetPos(id) {
  let left = 0;
  let top = 0;
  for (
    let itNode = document.getElementById(id); // initialization
    itNode; // condition
    left += itNode.offsetLeft,
      top += itNode.offsetTop,
      itNode = itNode.offsetParent // afterthought
  ); // semicolon

  console.log(
    `Offset position of "${id}" element:
left: ${left}px;
top: ${top}px;`,
  );
}

showOffsetPos("content");

// Logs:
// Offset position of "content" element:
// left: 0px;
// top: 153px;
```

Lưu ý rằng dấu chấm phẩy sau câu lệnh `for` là bắt buộc, vì nó đóng vai trò là [câu lệnh rỗng](/en-US/docs/Web/JavaScript/Reference/Statements/Empty). Nếu không, câu lệnh `for` sẽ lấy dòng `console.log` tiếp theo làm phần `statement` của nó, điều này khiến `log` thực thi nhiều lần.

### Sử dụng for với hai biến lặp

Bạn có thể tạo hai bộ đếm được cập nhật đồng thời trong vòng lặp for bằng cách sử dụng [toán tử dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator). Nhiều khai báo `let` và `var` cũng có thể được kết hợp với dấu phẩy.

```js
const arr = [1, 2, 3, 4, 5, 6];
for (let l = 0, r = arr.length - 1; l < r; l++, r--) {
  console.log(arr[l], arr[r]);
}
// 1 6
// 2 5
// 3 4
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Câu lệnh rỗng](/en-US/docs/Web/JavaScript/Reference/Statements/Empty)
- {{jsxref("Statements/break", "break")}}
- {{jsxref("Statements/continue", "continue")}}
- {{jsxref("Statements/while", "while")}}
- {{jsxref("Statements/do...while", "do...while")}}
- {{jsxref("Statements/for...in", "for...in")}}
- {{jsxref("Statements/for...of", "for...of")}}
