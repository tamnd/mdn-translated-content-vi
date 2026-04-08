---
title: Iterators and generators
slug: Web/JavaScript/Guide/Iterators_and_generators
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Typed_arrays", "Web/JavaScript/Guide/Resource_management")}}

Iterator và Generator đưa khái niệm lặp (iteration) trực tiếp vào lõi ngôn ngữ và cung cấp cơ chế tùy chỉnh hành vi của vòng lặp {{jsxref("Statements/for...of", "for...of")}}.

Để biết thêm chi tiết, xem thêm:

- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Statements/for...of", "for...of")}}
- {{jsxref("Statements/function*", "function*")}} và {{jsxref("Generator")}}
- {{jsxref("Operators/yield", "yield")}} và {{jsxref("Operators/yield*", "yield*")}}

## Iterator

Trong JavaScript, một **iterator** là một object định nghĩa một chuỗi giá trị và có thể trả về một giá trị khi kết thúc chuỗi đó.

Cụ thể, một iterator là bất kỳ object nào triển khai [Iterator protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) bằng cách có phương thức `next()` trả về một object với hai thuộc tính:

- `value`
  - : Giá trị tiếp theo trong chuỗi lặp.
- `done`
  - : Giá trị này là `true` nếu giá trị cuối cùng trong chuỗi đã được tiêu thụ. Nếu `value` xuất hiện cùng với `done`, đó là giá trị trả về của iterator.

Sau khi được tạo, một iterator object có thể được lặp tường minh bằng cách gọi `next()` nhiều lần. Việc lặp qua một iterator được gọi là _tiêu thụ_ iterator, vì thông thường chỉ có thể thực hiện một lần. Sau khi một giá trị kết thúc đã được yield, các lần gọi `next()` tiếp theo nên tiếp tục trả về `{done: true}`.

Iterator phổ biến nhất trong JavaScript là Array iterator, trả về từng giá trị trong mảng liên quan theo thứ tự.

Mặc dù dễ hình dung rằng tất cả iterator đều có thể biểu diễn dưới dạng mảng, nhưng điều này không đúng. Mảng phải được phân bổ toàn bộ, nhưng iterator chỉ được tiêu thụ khi cần thiết. Vì vậy, iterator có thể biểu diễn các chuỗi có kích thước không giới hạn, chẳng hạn như dải số nguyên từ `0` đến {{jsxref("Infinity")}}.

Đây là ví dụ minh họa điều đó. Nó cho phép tạo một range iterator định nghĩa chuỗi số nguyên từ `start` (bao gồm) đến `end` (không bao gồm) cách nhau `step` đơn vị. Giá trị trả về cuối cùng là kích thước của chuỗi đã tạo, được theo dõi bởi biến `iterationCount`.

```js
function makeRangeIterator(start = 0, end = Infinity, step = 1) {
  let nextIndex = start;
  let iterationCount = 0;

  const rangeIterator = {
    next() {
      let result;
      if (nextIndex < end) {
        result = { value: nextIndex, done: false };
        nextIndex += step;
        iterationCount++;
        return result;
      }
      return { value: iterationCount, done: true };
    },
  };
  return rangeIterator;
}
```

Sử dụng iterator trông như sau:

```js
const iter = makeRangeIterator(1, 10, 2);

let result = iter.next();
while (!result.done) {
  console.log(result.value); // 1 3 5 7 9
  result = iter.next();
}

console.log("Iterated over sequence of size:", result.value); // [5 numbers returned, that took interval in between: 0 to 10]
```

> [!NOTE]
> Không thể phán đoán phản chiếu (reflectively) liệu một object cụ thể có phải là iterator hay không. Nếu bạn cần làm điều này, hãy sử dụng [Iterables](#iterables).

## Generator function

Trong khi các iterator tùy chỉnh là công cụ hữu ích, việc tạo ra chúng đòi hỏi lập trình cẩn thận do cần duy trì rõ ràng trạng thái nội tại. **Generator function** cung cấp một giải pháp thay thế mạnh mẽ: chúng cho phép bạn định nghĩa một thuật toán lặp bằng cách viết một hàm duy nhất có quá trình thực thi không liên tục. Generator function được viết bằng cú pháp {{jsxref("Statements/function*", "function*")}}.

Khi được gọi, generator function không thực thi code ngay lập tức. Thay vào đó, chúng trả về một loại iterator đặc biệt, gọi là **Generator**. Khi một giá trị được tiêu thụ bằng cách gọi phương thức `next` của generator, Generator function thực thi cho đến khi gặp từ khóa `yield`.

Hàm có thể được gọi bao nhiêu lần tùy ý và trả về một Generator mới mỗi lần. Mỗi Generator chỉ có thể được lặp một lần.

Bây giờ chúng ta có thể điều chỉnh ví dụ trên. Hành vi của code này giống hệt nhau, nhưng cách triển khai dễ viết và đọc hơn nhiều.

```js
function* makeRangeIterator(start = 0, end = Infinity, step = 1) {
  let iterationCount = 0;
  for (let i = start; i < end; i += step) {
    iterationCount++;
    yield i;
  }
  return iterationCount;
}
```

## Iterable

Một object là **iterable** nếu nó định nghĩa hành vi lặp của mình, chẳng hạn như các giá trị nào được lặp qua trong cấu trúc {{jsxref("Statements/for...of", "for...of")}}. Một số kiểu dữ liệu tích hợp sẵn như {{jsxref("Array")}} hoặc {{jsxref("Map")}}, có hành vi lặp mặc định, trong khi các kiểu khác (như {{jsxref("Object")}}) thì không.

Để **có thể lặp** (iterable), một object phải triển khai phương thức `[Symbol.iterator]()`. Điều này có nghĩa là object (hoặc một trong các object trong [prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của nó) phải có một thuộc tính với khóa {{jsxref("Symbol.iterator")}}.

Có thể lặp qua một iterable nhiều hơn một lần, hoặc chỉ một lần. Lập trình viên cần biết trường hợp nào áp dụng.

Các iterable chỉ có thể lặp một lần (như Generator) thường trả về `this` từ phương thức `[Symbol.iterator]()` của chúng, trong khi các iterable có thể lặp nhiều lần phải trả về một iterator mới trong mỗi lần gọi `[Symbol.iterator]()`.

```js
function* makeIterator() {
  yield 1;
  yield 2;
}

const iter = makeIterator();

for (const itItem of iter) {
  console.log(itItem);
}

console.log(iter[Symbol.iterator]() === iter); // true

// This example show us generator(iterator) is iterable object,
// which has the [Symbol.iterator]() method return the `iter` (itself),
// and consequently, the it object can iterate only _once_.

// If we change the [Symbol.iterator]() method of `iter` to a function/generator
// which returns a new iterator/generator object, `iter`
// can iterate many times

iter[Symbol.iterator] = function* () {
  yield 2;
  yield 1;
};
```

### Iterable do người dùng định nghĩa

Bạn có thể tạo iterable của riêng mình như sau:

```js
const myIterable = {
  *[Symbol.iterator]() {
    yield 1;
    yield 2;
    yield 3;
  },
};
```

Các iterable do người dùng định nghĩa có thể được sử dụng trong vòng lặp `for...of` hoặc cú pháp spread như thông thường.

```js
for (const value of myIterable) {
  console.log(value);
}
// 1
// 2
// 3

[...myIterable]; // [1, 2, 3]
```

### Iterable tích hợp sẵn

{{jsxref("String")}}, {{jsxref("Array")}}, {{jsxref("TypedArray")}}, {{jsxref("Map")}} và {{jsxref("Set")}} đều là các iterable tích hợp sẵn, vì các prototype object của chúng đều có phương thức {{jsxref("Symbol.iterator")}}.

### Các cú pháp kỳ vọng iterable

Một số câu lệnh và biểu thức kỳ vọng iterable. Ví dụ: vòng lặp {{jsxref("Statements/for...of", "for...of")}}, {{jsxref("Operators/Spread_syntax", "cú pháp spread", "", 1)}}, {{jsxref("Operators/yield*", "yield*")}}, và cú pháp {{jsxref("Operators/Destructuring", "destructuring", "", 1)}}.

```js
for (const value of ["a", "b", "c"]) {
  console.log(value);
}
// "a"
// "b"
// "c"

[..."abc"];
// ["a", "b", "c"]

function* gen() {
  yield* ["a", "b", "c"];
}

gen().next();
// { value: "a", done: false }

[a, b, c] = new Set(["a", "b", "c"]);
a;
// "a"
```

## Generator nâng cao

Generator tính toán các giá trị được `yield` _theo yêu cầu_, cho phép chúng biểu diễn hiệu quả các chuỗi tốn nhiều tài nguyên để tính toán (hoặc thậm chí chuỗi vô hạn, như đã minh họa ở trên).

Phương thức {{jsxref("Generator/next", "next()")}} cũng chấp nhận một giá trị, có thể được dùng để thay đổi trạng thái nội tại của generator. Giá trị được truyền vào `next()` sẽ được nhận bởi `yield`.

> [!NOTE]
> Giá trị được truyền vào lần gọi _đầu tiên_ của `next()` luôn bị bỏ qua.

Đây là fibonacci generator sử dụng `next(x)` để khởi động lại chuỗi:

```js
function* fibonacci() {
  let current = 0;
  let next = 1;
  while (true) {
    const reset = yield current;
    [current, next] = [next, next + current];
    if (reset) {
      current = 0;
      next = 1;
    }
  }
}

const sequence = fibonacci();
console.log(sequence.next().value); // 0
console.log(sequence.next().value); // 1
console.log(sequence.next().value); // 1
console.log(sequence.next().value); // 2
console.log(sequence.next().value); // 3
console.log(sequence.next().value); // 5
console.log(sequence.next().value); // 8
console.log(sequence.next(true).value); // 0
console.log(sequence.next().value); // 1
console.log(sequence.next().value); // 1
console.log(sequence.next().value); // 2
```

Bạn có thể buộc một generator ném ra một ngoại lệ bằng cách gọi phương thức {{jsxref("Generator/throw", "throw()")}} của nó và truyền giá trị ngoại lệ cần ném. Ngoại lệ này sẽ được ném từ ngữ cảnh bị tạm dừng hiện tại của generator, như thể `yield` đang bị tạm dừng là câu lệnh `throw value`.

Nếu ngoại lệ không được bắt bên trong generator, nó sẽ lan truyền qua lời gọi `throw()`, và các lần gọi `next()` tiếp theo sẽ khiến thuộc tính `done` là `true`.

Generator có phương thức {{jsxref("Generator/return", "return()")}} trả về giá trị đã cho và kết thúc generator đó.

{{PreviousNext("Web/JavaScript/Guide/Typed_arrays", "Web/JavaScript/Guide/Resource_management")}}
