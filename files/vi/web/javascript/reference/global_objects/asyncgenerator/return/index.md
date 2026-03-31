---
title: AsyncGenerator.prototype.return()
short-title: return()
slug: Web/JavaScript/Reference/Global_Objects/AsyncGenerator/return
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncGenerator.return
sidebar: jsref
---

Phương thức **`return()`** của các thực thể {{jsxref("AsyncGenerator")}} hoạt động như thể câu lệnh `return` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, điều này kết thúc generator và cho phép generator thực hiện các tác vụ dọn dẹp khi kết hợp với khối [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block).

## Cú pháp

```js-nolint
asyncGeneratorInstance.return()
asyncGeneratorInstance.return(value)
```

### Tham số

- `value` {{optional_inline}}
  - : Giá trị cần trả về.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một {{jsxref("Object")}} có hai thuộc tính:

- `done`
  - : Giá trị boolean:
    - `true` nếu luồng điều khiển của hàm generator đã đến cuối.
    - `false` nếu luồng điều khiển của hàm generator chưa đến cuối và có thể tạo thêm giá trị. Điều này chỉ có thể xảy ra nếu `return` được bắt bởi [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block) và có thêm biểu thức `yield` trong khối `finally`.
- `value`
  - : Giá trị được đưa ra làm đối số, hoặc, nếu biểu thức `yield` được bọc trong [`try...finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block), giá trị được yield/trả về từ khối `finally`.

## Mô tả

Phương thức `return()`, khi được gọi, có thể được coi như thể câu lệnh `return value;` được chèn vào thân generator tại vị trí bị tạm dừng hiện tại, trong đó `value` là giá trị được truyền cho phương thức `return()`. Do đó, trong luồng thông thường, gọi `return(value)` sẽ trả về `{ done: true, value: value }`. Tuy nhiên, nếu biểu thức `yield` được bọc trong khối `try...finally`, luồng điều khiển không thoát khỏi thân hàm mà tiến đến khối `finally` thay thế. Trong trường hợp này, giá trị trả về có thể khác và `done` thậm chí có thể là `false`, nếu có thêm biểu thức `yield` trong khối `finally`.

## Ví dụ

### Sử dụng return()

Ví dụ sau cho thấy một async generator và phương thức `return`.

```js
// Một tác vụ bất đồng bộ. Giả sử nó đang làm gì đó hữu ích hơn
// trong thực tế.
function delayedValue(time, value) {
  return new Promise((resolve, reject) => {
    setTimeout(() => resolve(value), time);
  });
}

async function* createAsyncGenerator() {
  yield delayedValue(500, 1);
  yield delayedValue(500, 2);
  yield delayedValue(500, 3);
}

const asyncGen = createAsyncGenerator();
asyncGen.next().then((res) => console.log(res)); // { value: 1, done: false }
asyncGen.return("foo").then((res) => console.log(res)); // { value: "foo", done: true }
asyncGen.next().then((res) => console.log(res)); // { value: undefined, done: true }
```

### Sử dụng return() sau khi generator hoàn thành

Nếu không có đối số `value` nào được truyền vào phương thức `return()`, promise sẽ được giải quyết như thể phương thức [next()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGenerator/next) đã được gọi. Trong ví dụ này, generator đã hoàn thành, vì vậy giá trị được trả về là `undefined`.

`return()` vẫn có thể được gọi sau khi generator ở trạng thái "completed", tuy nhiên generator sẽ ở lại trạng thái này.

```js
async function* createAsyncGenerator() {
  yield Promise.resolve(1);
  yield await Promise.resolve(2);
  yield 3;
}
const asyncGen = createAsyncGenerator();
asyncGen.next().then((res) => console.log(res)); // { value: 1, done: false }
asyncGen.next().then((res) => console.log(res)); // { value: 2, done: false }
asyncGen.next().then((res) => console.log(res)); // { value: 3, done: false }
// value là undefined vì không có value nào được truyền và generator đã 'done'
asyncGen.return().then((res) => console.log(res)); // { value: undefined, done: true }
// chúng ta vẫn có thể trả về một value sau khi generator hoàn thành
asyncGen.return(1).then((res) => console.log(res)); // { value: 1, done: true }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/async_function*", "async function*")}}
- Hướng dẫn [Iterators và generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
