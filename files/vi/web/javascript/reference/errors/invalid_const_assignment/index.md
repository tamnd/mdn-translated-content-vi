---
title: 'TypeError: invalid assignment to const "x"'
slug: Web/JavaScript/Reference/Errors/Invalid_const_assignment
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid assignment to const" xảy ra khi có cố gắng thay đổi giá trị hằng số. Khai báo [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const) trong JavaScript không thể được gán lại hoặc khai báo lại.

## Thông báo

```plain
TypeError: Assignment to constant variable. (V8-based)
TypeError: invalid assignment to const 'x' (Firefox)
TypeError: Attempted to assign to readonly property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Hằng số là giá trị không thể bị thay đổi bởi chương trình trong quá trình thực thi bình thường. Nó không thể thay đổi thông qua gán lại, và không thể khai báo lại. Trong JavaScript, hằng số được khai báo bằng từ khóa [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const).

## Ví dụ

### Khai báo lại không hợp lệ

Gán giá trị cho cùng tên hằng trong cùng phạm vi khối sẽ ném lỗi.

```js example-bad
const COLUMNS = 80;

// …

COLUMNS = 120; // TypeError: invalid assignment to const `COLUMNS'
```

### Sửa lỗi

Có nhiều cách để sửa lỗi này. Hãy kiểm tra mục đích ban đầu của hằng số đang xét.

#### Đổi tên

Nếu bạn muốn khai báo một hằng số khác, hãy chọn một tên khác và đổi tên. Tên hằng số này đã được sử dụng trong phạm vi này.

```js example-good
const COLUMNS = 80;
const WIDE_COLUMNS = 120;
```

#### const, let hay var?

Đừng sử dụng const nếu bạn không có ý định khai báo hằng số. Có thể bạn muốn khai báo một biến phạm vi khối với [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc biến toàn cục với [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var).

```js example-good
let columns = 80;

// …

columns = 120;
```

#### Phạm vi

Kiểm tra xem bạn có đang ở đúng phạm vi không. Hằng số này có nên xuất hiện trong phạm vi này không hay nó được dự định xuất hiện trong một hàm, ví dụ?

```js example-good
const COLUMNS = 80;

function setupBigScreenEnvironment() {
  const COLUMNS = 120;
}
```

### const và tính bất biến

Khai báo `const` tạo ra một tham chiếu chỉ đọc đến một giá trị. Điều đó **không** có nghĩa là giá trị nó giữ là bất biến, chỉ là định danh biến không thể được gán lại. Ví dụ, trong trường hợp nội dung là một đối tượng, điều này có nghĩa là bản thân đối tượng vẫn có thể được thay đổi. Điều này có nghĩa là bạn không thể thay đổi giá trị được lưu trong biến:

```js example-bad
const obj = { foo: "bar" };
obj = { foo: "baz" }; // TypeError: invalid assignment to const `obj'
```

Nhưng bạn có thể thay đổi các thuộc tính trong biến:

```js example-good
obj.foo = "baz";
obj; // { foo: "baz" }
```

## Xem thêm

- [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const)
- [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let)
- [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var)
