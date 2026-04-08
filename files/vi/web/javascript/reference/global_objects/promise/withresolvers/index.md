---
title: Promise.withResolvers()
short-title: withResolvers()
slug: Web/JavaScript/Reference/Global_Objects/Promise/withResolvers
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.withResolvers
sidebar: jsref
---

Phương thức tĩnh **`Promise.withResolvers()`** trả về một đối tượng chứa một {{jsxref("Promise")}} mới và hai hàm để resolve hoặc reject nó, tương ứng với hai tham số được truyền cho executor của constructor {{jsxref("Promise/Promise", "Promise()")}}.

## Cú pháp

```js-nolint
Promise.withResolvers()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng thuần chứa các thuộc tính sau:

- `promise`
  - : Một đối tượng {{jsxref("Promise")}}.
- `resolve`
  - : Một hàm resolve promise. Về ngữ nghĩa, xem tài liệu tham khảo constructor {{jsxref("Promise/Promise", "Promise()")}}.
- `reject`
  - : Một hàm reject promise. Về ngữ nghĩa, xem tài liệu tham khảo constructor {{jsxref("Promise/Promise", "Promise()")}}.

## Mô tả

`Promise.withResolvers()` hoàn toàn tương đương với đoạn mã sau:

```js
let resolve, reject;
const promise = new Promise((res, rej) => {
  resolve = res;
  reject = rej;
});
```

Ngoại trừ nó ngắn gọn hơn và không yêu cầu sử dụng {{jsxref("Statements/let", "let")}}.

Điểm khác biệt chính khi sử dụng `Promise.withResolvers()` là các hàm resolve và reject giờ đây nằm trong cùng phạm vi với chính promise, thay vì chỉ được tạo và sử dụng một lần bên trong executor. Điều này có thể cho phép một số trường hợp sử dụng nâng cao hơn, chẳng hạn như khi tái sử dụng chúng cho các sự kiện lặp lại, đặc biệt là với streams và queues. Điều này cũng thường dẫn đến ít lồng nhau hơn so với việc bọc nhiều logic bên trong executor.

`Promise.withResolvers()` là generic và hỗ trợ phân lớp con, có nghĩa là nó có thể được gọi trên các lớp con của `Promise`, và kết quả sẽ chứa một promise của kiểu lớp con. Để làm vậy, constructor của lớp con phải triển khai cùng chữ ký với constructor [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise) — chấp nhận một hàm `executor` duy nhất có thể được gọi với các callback `resolve` và `reject` làm tham số.

## Ví dụ

### Chuyển đổi một stream thành async iterable

Trường hợp sử dụng của `Promise.withResolvers()` là khi bạn có một promise cần được resolve hoặc reject bởi một event listener không thể được bọc bên trong executor của promise. Ví dụ sau chuyển đổi một [readable stream](https://nodejs.org/api/stream.html#class-streamreadable) của Node.js thành một [async iterable](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*). Mỗi `promise` ở đây đại diện cho một batch dữ liệu có sẵn, và mỗi khi batch hiện tại được đọc, một promise mới được tạo cho batch tiếp theo. Lưu ý rằng các event listener chỉ được gắn một lần, nhưng thực tế gọi một phiên bản khác nhau của hàm `resolve` và `reject` mỗi lần.

```js
async function* readableToAsyncIterable(stream) {
  let { promise, resolve, reject } = Promise.withResolvers();
  stream.on("error", (error) => reject(error));
  stream.on("end", () => resolve());
  stream.on("readable", () => resolve());

  while (stream.readable) {
    await promise;
    let chunk;
    while ((chunk = stream.read())) {
      yield chunk;
    }
    ({ promise, resolve, reject } = Promise.withResolvers());
  }
}
```

### Gọi withResolvers() trên một constructor không phải Promise

`Promise.withResolvers()` là một phương thức generic. Nó có thể được gọi trên bất kỳ constructor nào triển khai cùng chữ ký như constructor `Promise()`. Ví dụ, chúng ta có thể gọi nó trên một constructor truyền `console.log` làm hàm `resolve` và `reject` cho `executor`:

```js
class NotPromise {
  constructor(executor) {
    // The "resolve" and "reject" functions behave nothing like the native
    // promise's, but Promise.withResolvers() just returns them, as is.
    executor(
      (value) => console.log("Resolved", value),
      (reason) => console.log("Rejected", reason),
    );
  }
}

const { promise, resolve, reject } = Promise.withResolvers.call(NotPromise);
resolve("hello");
// Logs: Resolved hello
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Promise.withResolvers` in `core-js`](https://github.com/zloirock/core-js#promisewithresolvers)
- [es-shims polyfill of `Promise.withResolvers`](https://www.npmjs.com/package/promise.withresolvers)
- [Using promises](/en-US/docs/Web/JavaScript/Guide/Using_promises) guide
- {{jsxref("Promise")}}
- [`Promise()` constructor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise)
