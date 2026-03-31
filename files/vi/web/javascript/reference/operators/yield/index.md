---
title: yield
slug: Web/JavaScript/Reference/Operators/yield
page-type: javascript-operator
browser-compat: javascript.operators.yield
sidebar: jssidebar
---

Toán tử **`yield`** được dùng để tạm dừng và tiếp tục một [generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*).

{{InteractiveExample("JavaScript Demo: yield operator", "taller")}}

```js interactive-example
function* foo(index) {
  while (index < 2) {
    yield index;
    index++;
  }
}

const iterator = foo(0);

console.log(iterator.next().value);
// Expected output: 0

console.log(iterator.next().value);
// Expected output: 1
```

## Cú pháp

```js-nolint
yield
yield expression
```

### Tham số

- `expression` {{optional_inline}}
  - : Giá trị để yield từ generator function thông qua [giao thức iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Nếu bị bỏ qua, `undefined` được yield.

### Giá trị trả về

Trả về giá trị tùy chọn được truyền vào phương thức `next()` của generator để tiếp tục thực thi.

> [!NOTE]
> Điều này có nghĩa là `next()` là bất đối xứng: nó luôn gửi một giá trị đến `yield` đang bị tạm dừng hiện tại, nhưng trả về toán hạng của `yield` tiếp theo. Đối số được truyền vào lần gọi `next()` đầu tiên không thể lấy được vì không có `yield` đang bị tạm dừng hiện tại.

## Mô tả

Từ khóa `yield` tạm dừng việc thực thi generator function và giá trị của biểu thức theo sau từ khóa `yield` được trả về cho hàm gọi generator. Nó có thể được coi là phiên bản dựa trên generator của từ khóa `return`.

`yield` chỉ có thể được dùng trực tiếp trong generator function chứa nó. Không thể dùng trong các hàm lồng nhau.

Gọi generator function sẽ tạo ra đối tượng {{jsxref("Generator")}}. Mỗi khi phương thức {{jsxref("Generator/next", "next()")}} của generator được gọi, generator tiếp tục thực thi, và chạy cho đến khi đạt đến một trong các điểm sau:

- Biểu thức `yield`. Trong trường hợp này, generator tạm dừng, và phương thức `next()` trả về đối tượng [iterator result](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) với hai thuộc tính: `value` và `done`. Thuộc tính `value` là giá trị của biểu thức sau toán tử `yield`, và `done` là `false`, chỉ ra rằng generator function chưa hoàn thành hoàn toàn.
- Cuối generator function. Trong trường hợp này, việc thực thi generator kết thúc, và phương thức `next()` trả về đối tượng iterator result trong đó `value` là {{jsxref("undefined")}} và `done` là `true`.
- Câu lệnh {{jsxref("Statements/return", "return")}}. Trong trường hợp này, việc thực thi generator kết thúc, và phương thức `next()` trả về đối tượng iterator result trong đó `value` là giá trị trả về được chỉ định và `done` là `true`.
- Câu lệnh {{jsxref("Statements/throw", "throw")}}. Trong trường hợp này, việc thực thi generator dừng hoàn toàn, và phương thức `next()` ném ra exception đã được chỉ định.

Sau khi bị tạm dừng tại biểu thức `yield`, việc thực thi code của generator vẫn bị tạm dừng cho đến khi phương thức `next()` của generator được gọi lại. Nếu một giá trị tùy chọn được truyền vào phương thức `next()` của generator, giá trị đó trở thành giá trị được trả về bởi thao tác `yield` hiện tại của generator. Lần gọi `next()` đầu tiên không có thao tác `yield` đang bị tạm dừng tương ứng, vì vậy không có cách nào lấy được đối số truyền vào lần gọi `next()` đầu tiên.

Nếu phương thức {{jsxref("Generator/return", "return()")}} hoặc {{jsxref("Generator/throw", "throw()")}} của generator được gọi, nó hoạt động như thể câu lệnh {{jsxref("Statements/return", "return")}} hoặc {{jsxref("Statements/throw", "throw")}} được thực thi tại biểu thức `yield` đang bị tạm dừng. Bạn có thể dùng {{jsxref("Statements/try...catch", "try...catch...finally")}} trong thân generator function để xử lý các lần hoàn thành sớm này. Nếu phương thức `return()` hoặc `throw()` được gọi nhưng không có biểu thức `yield` đang bị tạm dừng (vì `next()` chưa được gọi, hoặc vì generator đã hoàn thành), thì các lần hoàn thành sớm không thể được xử lý và luôn kết thúc generator.

## Ví dụ

### Sử dụng yield

Đoạn code sau là khai báo của một generator function ví dụ.

```js
function* countAppleSales() {
  const saleList = [3, 7, 5];
  for (const sale of saleList) {
    yield sale;
  }
}
```

Khi generator function được định nghĩa, nó có thể được dùng bằng cách tạo iterator như sau.

```js
const appleStore = countAppleSales(); // Generator { }
console.log(appleStore.next()); // { value: 3, done: false }
console.log(appleStore.next()); // { value: 7, done: false }
console.log(appleStore.next()); // { value: 5, done: false }
console.log(appleStore.next()); // { value: undefined, done: true }
```

Bạn cũng có thể gửi một giá trị với `next(value)` vào generator. `step` được đánh giá như giá trị trả về của biểu thức `yield` — mặc dù giá trị được truyền vào phương thức `next()` của generator lần đầu tiên `next()` được gọi sẽ bị bỏ qua.

```js
function* counter(value) {
  while (true) {
    const step = yield value++;

    if (step) {
      value += step;
    }
  }
}

const generatorFunc = counter(0);
console.log(generatorFunc.next().value); // 0
console.log(generatorFunc.next().value); // 1
console.log(generatorFunc.next().value); // 2
console.log(generatorFunc.next().value); // 3
console.log(generatorFunc.next(10).value); // 14
console.log(generatorFunc.next().value); // 15
console.log(generatorFunc.next(10).value); // 26
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Statements/function*", "function*")}}
- [Biểu thức `function*`](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("Operators/yield*", "yield*")}}
