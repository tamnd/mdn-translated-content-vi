---
title: Generator.prototype.return()
short-title: return()
slug: Web/JavaScript/Reference/Global_Objects/Generator/return
page-type: javascript-instance-method
browser-compat: javascript.builtins.Generator.return
sidebar: jsref
---

Phương thức **`return()`** của các thực thể {{jsxref("Generator")}} hoạt động như thể câu lệnh `return` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, điều này kết thúc generator và cho phép generator thực hiện các tác vụ dọn dẹp khi kết hợp với khối [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block).

## Cú pháp

<!-- Thông thường chúng ta không thêm chủ ngữ "generatorInstance" cho các phương thức. Tuy nhiên, ở đây là cần thiết vì "return" là từ khóa, vì vậy nếu không thì cú pháp không hợp lệ. -->

```js-nolint
generatorInstance.return()
generatorInstance.return(value)
```

### Tham số

- `value` {{optional_inline}}
  - : Giá trị cần trả về.

### Giá trị trả về

Một {{jsxref("Object")}} với hai thuộc tính:

- `done`
  - : Giá trị boolean:
    - `true` nếu luồng điều khiển của hàm generator đã đến cuối.
    - `false` nếu luồng điều khiển của hàm generator chưa đến cuối và có thể tạo thêm giá trị. Điều này chỉ có thể xảy ra nếu `return` được bắt bởi [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block) và có thêm biểu thức `yield` trong khối `finally`.
- `value`
  - : Giá trị được đưa ra làm đối số, hoặc, nếu biểu thức `yield` được bọc trong [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block), giá trị được yield/trả về từ khối `finally`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu generator đang chạy.

## Mô tả

Phương thức `return()`, khi được gọi, có thể được coi như thể câu lệnh `return value;` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, trong đó `value` là giá trị được truyền cho phương thức `return()`. Do đó, trong luồng thông thường, gọi `return(value)` sẽ trả về `{ done: true, value: value }`. Tuy nhiên, nếu biểu thức `yield` được bọc trong khối `try...finally`, luồng điều khiển không thoát khỏi thân hàm mà tiến đến khối `finally` thay thế. Trong trường hợp này, giá trị trả về có thể khác và `done` thậm chí có thể là `false`, nếu có thêm biểu thức `yield` trong khối `finally`.

## Ví dụ

### Sử dụng return()

Ví dụ sau cho thấy một generator và phương thức `return`.

```js
function* gen() {
  yield 1;
  yield 2;
  yield 3;
}

const g = gen();

g.next(); // { value: 1, done: false }
g.return("foo"); // { value: "foo", done: true }
g.next(); // { value: undefined, done: true }
```

Nếu `return(value)` được gọi trên một generator đã ở trạng thái "completed", generator sẽ vẫn ở trạng thái "completed".

Nếu không có đối số nào được cung cấp, thuộc tính `value` của đối tượng được trả về sẽ là `undefined`. Nếu một đối số được cung cấp, nó sẽ trở thành giá trị của thuộc tính `value` của đối tượng được trả về, trừ khi biểu thức `yield` được bọc trong `try...finally`.

```js
function* gen() {
  yield 1;
  yield 2;
  yield 3;
}

const g = gen();
g.next(); // { value: 1, done: false }
g.next(); // { value: 2, done: false }
g.next(); // { value: 3, done: false }
g.next(); // { value: undefined, done: true }
g.return(); // { value: undefined, done: true }
g.return(1); // { value: 1, done: true }
```

### Sử dụng return() với try...finally

Việc phương thức `return` đã được gọi chỉ có thể được biết đến với bản thân generator nếu biểu thức `yield` được bọc trong khối `try...finally`.

Khi phương thức `return` được gọi trên một generator đang bị tạm dừng trong khối `try`, thực thi trong generator tiến đến khối `finally` — vì khối `finally` của câu lệnh `try...finally` luôn thực thi.

```js
function* gen() {
  yield 1;
  try {
    yield 2;
    yield 3;
  } finally {
    yield "cleanup";
  }
}

const g1 = gen();
g1.next(); // { value: 1, done: false }

// Thực thi bị tạm dừng trước try...finally.
g1.return("early return"); // { value: 'early return', done: true }

const g2 = gen();
g2.next(); // { value: 1, done: false }
g2.next(); // { value: 2, done: false }

// Thực thi bị tạm dừng trong try...finally.
g2.return("early return"); // { value: 'cleanup', done: false }

// Giá trị hoàn thành được bảo tồn
g2.next(); // { value: 'early return', done: true }

// Generator ở trạng thái completed
g2.return("not so early return"); // { value: 'not so early return', done: true }
```

Giá trị trả về của khối finally cũng có thể trở thành `value` của kết quả được trả về từ lời gọi `return`.

```js
function* gen() {
  try {
    yield 1;
  } finally {
    return "cleanup";
  }
}

const generator = gen();
generator.next(); // { value: 1, done: false }
generator.return("early return"); // { value: 'cleanup', done: true }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/function*", "function*")}}
