---
title: for await...of
slug: Web/JavaScript/Reference/Statements/for-await...of
page-type: javascript-statement
browser-compat: javascript.statements.for_await_of
sidebar: jssidebar
---

Câu lệnh **`for await...of`** tạo ra một vòng lặp lặp qua các [đối tượng async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) cũng như [sync iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol). Câu lệnh này chỉ có thể được dùng trong các ngữ cảnh mà [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) có thể được dùng, bao gồm bên trong thân [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) và trong một [module](/en-US/docs/Web/JavaScript/Guide/Modules).

{{InteractiveExample("JavaScript Demo: for await...of statement", "taller")}}

```js interactive-example
async function* foo() {
  yield 1;
  yield 2;
}

(async () => {
  for await (const num of foo()) {
    console.log(num);
    // Expected output: 1

    break; // Closes iterator, triggers return
  }
})();
```

## Cú pháp

```js-nolint
for await (variable of iterable)
  statement
```

- `variable`
  - : Nhận một giá trị từ chuỗi trong mỗi lần lặp. Có thể là khai báo với [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var), hoặc đích [gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment) (ví dụ: biến đã khai báo trước đó, thuộc tính đối tượng, hoặc [mẫu destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)). Các biến được khai báo bằng `var` không cục bộ với vòng lặp, tức là chúng nằm trong cùng phạm vi với vòng lặp `for await...of`.
- `iterable`
  - : Một async iterable hoặc sync iterable. Nguồn của chuỗi giá trị mà vòng lặp hoạt động trên.
- `statement`
  - : Câu lệnh được thực thi trong mỗi lần lặp. Có thể tham chiếu đến `variable`. Bạn có thể sử dụng [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block) để thực thi nhiều câu lệnh.

## Mô tả

Khi vòng lặp `for await...of` lặp qua một iterable, trước tiên nó lấy phương thức [`[Symbol.asyncIterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/asyncIterator) của iterable và gọi nó, trả về một [async iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols). Nếu phương thức `@asyncIterator` không tồn tại, nó sẽ tìm kiếm phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator), trả về một [sync iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Sync iterator được trả về sau đó được bọc thành một async iterator bằng cách bọc mọi đối tượng được trả về từ các phương thức `next()`, `return()` và `throw()` thành một promise đã giải quyết hoặc bị từ chối, với thuộc tính `value` được giải quyết nếu nó cũng là một promise. Vòng lặp sau đó liên tục gọi phương thức [`next()`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) của async iterator cuối cùng và [await](/en-US/docs/Web/JavaScript/Reference/Operators/await) promise được trả về, tạo ra chuỗi giá trị được gán cho `variable`.

Vòng lặp `for await...of` kết thúc khi iterator đã hoàn thành (kết quả `next()` được await là đối tượng với `done: true`). Giống như các câu lệnh vòng lặp khác, bạn có thể dùng [câu lệnh điều khiển luồng](/en-US/docs/Web/JavaScript/Reference/Statements#control_flow) trong `statement`:

- {{jsxref("Statements/break", "break")}} dừng thực thi `statement` và đến câu lệnh đầu tiên sau vòng lặp.
- {{jsxref("Statements/continue", "continue")}} dừng thực thi `statement` và đến lần lặp tiếp theo của vòng lặp.

Nếu vòng lặp `for await...of` kết thúc sớm (ví dụ: gặp câu lệnh `break` hoặc xảy ra lỗi), phương thức [`return()`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) của iterator được gọi để thực hiện bất kỳ thao tác dọn dẹp nào. Promise được trả về sẽ được await trước khi vòng lặp kết thúc.

`for await...of` thường hoạt động giống như vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) và chia sẻ nhiều cú pháp và ngữ nghĩa tương tự. Có một vài điểm khác biệt:

- `for await...of` hoạt động trên cả sync và async iterable, trong khi `for...of` chỉ hoạt động trên sync iterable.
- `for await...of` chỉ có thể được dùng trong các ngữ cảnh mà [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) có thể được dùng, bao gồm bên trong thân [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) và trong một [module](/en-US/docs/Web/JavaScript/Guide/Modules). Ngay cả khi iterable là sync, vòng lặp vẫn await giá trị trả về cho mỗi lần lặp, dẫn đến thực thi chậm hơn do phải unwrap promise nhiều lần.
- Nếu `iterable` là một sync iterable yield ra các promise, `for await...of` sẽ tạo ra một chuỗi các giá trị đã được giải quyết, trong khi `for...of` sẽ tạo ra một chuỗi các promise. (Tuy nhiên, hãy chú ý đến việc xử lý lỗi và dọn dẹp — xem [Lặp qua sync iterable và generator](#iterating_over_sync_iterables_and_generators))
- Đối với `for await...of`, `variable` có thể là identifier `async` (ví dụ: `for await (async of foo)`); `for...of` cấm trường hợp này.

Giống như `for...of`, nếu bạn dùng khai báo `using`, biến không được đặt tên là `of`:

```js-nolint example-bad
for await (using of of []); // SyntaxError
```

Điều này để tránh sự mơ hồ về cú pháp với code hợp lệ `for await (using of [])`, trước khi `using` được giới thiệu.

## Ví dụ

### Lặp qua async iterable

Bạn cũng có thể lặp qua một đối tượng triển khai rõ ràng giao thức async iterable:

```js
const LIMIT = 3;

const asyncIterable = {
  [Symbol.asyncIterator]() {
    let i = 0;
    return {
      next() {
        const done = i === LIMIT;
        const value = done ? undefined : i++;
        return Promise.resolve({ value, done });
      },
      return() {
        // This will be reached if the consumer called 'break' or 'return' early in the loop.
        return { done: true };
      },
    };
  },
};

(async () => {
  for await (const num of asyncIterable) {
    console.log(num);
  }
})();
// 0
// 1
// 2
```

### Lặp qua async generator

Vì các giá trị trả về của các async generator function tuân theo giao thức async iterable, chúng có thể được lặp bằng `for await...of`.

```js
async function* asyncGenerator() {
  let i = 0;
  while (i < 3) {
    yield i++;
  }
}

(async () => {
  for await (const num of asyncGenerator()) {
    console.log(num);
  }
})();
// 0
// 1
// 2
```

Để có ví dụ cụ thể hơn về việc lặp qua một async generator bằng `for await...of`, hãy xem xét việc lặp qua dữ liệu từ một API.

Ví dụ này trước tiên tạo một async iterable cho một luồng dữ liệu, sau đó sử dụng nó để tìm kích thước của phản hồi từ API.

```js
async function* streamAsyncIterable(stream) {
  const reader = stream.getReader();
  try {
    while (true) {
      const { done, value } = await reader.read();
      if (done) return;
      yield value;
    }
  } finally {
    reader.releaseLock();
  }
}

// Fetches data from URL and calculates response size using the async generator.
async function getResponseSize(url) {
  const response = await fetch(url);
  // Will hold the size of the response, in bytes.
  let responseSize = 0;
  // The for-await-of loop. Async iterates over each portion of the response.
  for await (const chunk of streamAsyncIterable(response.body)) {
    // Incrementing the total response length.
    responseSize += chunk.length;
  }

  console.log(`Response Size: ${responseSize} bytes`); // "Response Size: 1071472"
  return responseSize;
}
getResponseSize("https://jsonplaceholder.typicode.com/photos");
```

### Lặp qua sync iterable và generator

Vòng lặp `for await...of` cũng tiêu thụ sync iterable và generator. Trong trường hợp đó, nó nội bộ await các giá trị được phát ra trước khi gán chúng cho biến điều khiển vòng lặp.

```js
function* generator() {
  yield 0;
  yield 1;
  yield Promise.resolve(2);
  yield Promise.resolve(3);
  yield 4;
}

(async () => {
  for await (const num of generator()) {
    console.log(num);
  }
})();
// 0
// 1
// 2
// 3
// 4

// compare with for-of loop:

for (const numOrPromise of generator()) {
  console.log(numOrPromise);
}
// 0
// 1
// Promise { 2 }
// Promise { 3 }
// 4
```

> [!NOTE]
> Hãy chú ý khi yield ra các promise bị từ chối từ một sync generator. Trong trường hợp như vậy, `for await...of` sẽ ném ra lỗi khi tiêu thụ promise bị từ chối và KHÔNG GỌI các block `finally` trong generator đó. Điều này có thể không mong muốn nếu bạn cần giải phóng một số tài nguyên đã được cấp phát bằng `try/finally`.

```js
function* generatorWithRejectedPromises() {
  try {
    yield 0;
    yield 1;
    yield Promise.resolve(2);
    yield Promise.reject(new Error("failed"));
    yield 4;
    throw new Error("throws");
  } finally {
    console.log("called finally");
  }
}

(async () => {
  try {
    for await (const num of generatorWithRejectedPromises()) {
      console.log(num);
    }
  } catch (e) {
    console.log("caught", e);
  }
})();
// 0
// 1
// 2
// caught Error: failed

// compare with for-of loop:

try {
  for (const numOrPromise of generatorWithRejectedPromises()) {
    console.log(numOrPromise);
  }
} catch (e) {
  console.log("caught", e);
}
// 0
// 1
// Promise { 2 }
// Promise { <rejected> Error: failed }
// 4
// caught Error: throws
// called finally
```

Để đảm bảo các block `finally` của một sync generator luôn được gọi, hãy dùng dạng vòng lặp phù hợp — `for await...of` cho async generator và `for...of` cho sync generator — và await các promise được yield một cách rõ ràng bên trong vòng lặp.

```js
(async () => {
  try {
    for (const numOrPromise of generatorWithRejectedPromises()) {
      console.log(await numOrPromise);
    }
  } catch (e) {
    console.log("caught", e);
  }
})();
// 0
// 1
// 2
// caught Error: failed
// called finally
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Symbol.asyncIterator")}}
- {{jsxref("Statements/for...of", "for...of")}}
