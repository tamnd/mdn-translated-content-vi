---
title: Promise.resolve()
short-title: resolve()
slug: Web/JavaScript/Reference/Global_Objects/Promise/resolve
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.resolve
sidebar: jsref
---

Phương thức tĩnh **`Promise.resolve()`** "giải quyết" một giá trị đã cho thành một {{jsxref("Promise")}}. Nếu giá trị là một promise, promise đó được trả về; nếu giá trị là một [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables), `Promise.resolve()` sẽ gọi phương thức `then()` với hai callback nó đã chuẩn bị; nếu không, promise được trả về sẽ được fulfilled với giá trị đó.

Hàm này làm phẳng các lớp lồng nhau của các đối tượng giống promise (ví dụ, một promise fulfilled với một promise fulfilled với thứ gì đó) thành một lớp duy nhất — một promise fulfilled với một giá trị không phải thenable.

{{InteractiveExample("JavaScript Demo: Promise.resolve()")}}

```js interactive-example
const promise1 = Promise.resolve(123);

promise1.then((value) => {
  console.log(value);
  // Expected output: 123
});
```

## Cú pháp

```js-nolint
Promise.resolve(value)
```

### Tham số

- `value`
  - : Đối số được resolve bởi `Promise` này. Cũng có thể là một `Promise` hoặc thenable để resolve.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolved với giá trị đã cho, hoặc promise được truyền vào như giá trị, nếu giá trị là một đối tượng promise. Một promise đã resolved có thể ở bất kỳ trạng thái nào — fulfilled, rejected, hoặc pending. Ví dụ, resolve một promise bị từ chối vẫn sẽ dẫn đến một promise bị từ chối.

## Mô tả

`Promise.resolve()` _resolve_ một promise, không giống như việc fulfill hoặc reject promise. Xem [mô tả về Promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#description) để biết định nghĩa của các thuật ngữ. Tóm lại, `Promise.resolve()` trả về một promise mà trạng thái cuối cùng phụ thuộc vào một promise khác, đối tượng thenable, hoặc giá trị khác.

> [!NOTE]
> Nếu việc đánh giá biểu thức `value` có thể ném ra lỗi đồng bộ, lỗi này sẽ không được bắt và bọc trong một promise bị từ chối bởi `Promise.resolve()`. Hãy xem xét sử dụng {{jsxref("Promise/try", "Promise.try(() => value)")}} trong trường hợp này.

`Promise.resolve()` là generic và hỗ trợ phân lớp con, có nghĩa là nó có thể được gọi trên các lớp con của `Promise`, và kết quả sẽ là một promise của kiểu lớp con. Để làm như vậy, constructor của lớp con phải triển khai cùng chữ ký với constructor [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise) — chấp nhận một hàm `executor` duy nhất có thể được gọi với các callback `resolve` và `reject` như là tham số.

`Promise.resolve()` xử lý đặc biệt các thực thể `Promise` gốc. Nếu `value` thuộc về `Promise` hoặc một lớp con, và `value.constructor === Promise`, thì `value` được `Promise.resolve()` trả về trực tiếp, mà không tạo ra một thực thể `Promise` mới. Ngược lại, `Promise.resolve()` về cơ bản là viết tắt cho `new Promise((resolve) => resolve(value))`.

Phần lớn logic resolve thực sự được triển khai bởi [hàm `resolve`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise#the_resolve_function) được truyền bởi constructor `Promise()`. Tóm tắt:

- Nếu một giá trị không phải [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) được truyền vào, promise được trả về đã được fulfilled với giá trị đó.
- Nếu một thenable được truyền vào, promise được trả về sẽ áp dụng trạng thái của thenable đó bằng cách gọi phương thức `then` và truyền một cặp hàm resolving như là đối số. (Nhưng vì các promise gốc đi qua trực tiếp `Promise.resolve()` mà không tạo ra một wrapper, phương thức `then` không được gọi trên các promise gốc.) Nếu hàm `resolve` nhận một đối tượng thenable khác, nó sẽ được resolve lại, sao cho giá trị fulfillment cuối cùng của promise sẽ không bao giờ là thenable.

## Ví dụ

### Sử dụng phương thức tĩnh Promise.resolve

```js
Promise.resolve("Success").then(
  (value) => {
    console.log(value); // "Success"
  },
  (reason) => {
    // không được gọi
  },
);
```

### Resolve một mảng

```js
const p = Promise.resolve([1, 2, 3]);
p.then((v) => {
  console.log(v[0]); // 1
});
```

### Resolve một Promise khác

`Promise.resolve()` tái sử dụng các thực thể `Promise` hiện có. Nếu nó đang resolve một promise gốc, nó trả về cùng thực thể promise mà không tạo ra một wrapper.

```js
const original = Promise.resolve(33);
const cast = Promise.resolve(original);
cast.then((value) => {
  console.log(`value: ${value}`);
});
console.log(`original === cast ? ${original === cast}`);

// Logs, theo thứ tự:
// original === cast ? true
// value: 33
```

Thứ tự đảo ngược của các log là do thực tế rằng các trình xử lý `then` được gọi bất đồng bộ. Xem tài liệu tham khảo {{jsxref("Promise/then", "then()")}} để biết thêm thông tin.

### Resolve thenable và ném Errors

```js
// Resolve một đối tượng thenable
const p1 = Promise.resolve({
  then(onFulfill, onReject) {
    onFulfill("fulfilled!");
  },
});
console.log(p1 instanceof Promise); // true, đối tượng được cast thành Promise

p1.then(
  (v) => {
    console.log(v); // "fulfilled!"
  },
  (e) => {
    // không được gọi
  },
);

// Thenable ném ra
// Promise bị từ chối
const p2 = Promise.resolve({
  then() {
    throw new TypeError("Throwing");
  },
});
p2.then(
  (v) => {
    // không được gọi
  },
  (e) => {
    console.error(e); // TypeError: Throwing
  },
);

// Thenable ném ra sau callback
// Promise được resolve
const p3 = Promise.resolve({
  then(onFulfilled) {
    onFulfilled("Resolving");
    throw new TypeError("Throwing");
  },
});
p3.then(
  (v) => {
    console.log(v); // "Resolving"
  },
  (e) => {
    // không được gọi
  },
);
```

Các thenable lồng nhau sẽ được "làm phẳng sâu" thành một promise duy nhất.

```js
const thenable = {
  then(onFulfilled, onRejected) {
    onFulfilled({
      // Thenable được fulfilled với một thenable khác
      then(onFulfilled, onRejected) {
        onFulfilled(42);
      },
    });
  },
};

Promise.resolve(thenable).then((v) => {
  console.log(v); // 42
});
```

> [!WARNING]
> Không gọi `Promise.resolve()` trên một thenable resolve với chính nó. Điều đó dẫn đến đệ quy vô hạn, vì nó cố gắng làm phẳng một promise lồng nhau vô hạn.

```js example-bad
const thenable = {
  then(onFulfilled, onRejected) {
    onFulfilled(thenable);
  },
};

Promise.resolve(thenable); // Sẽ dẫn đến đệ quy vô hạn.
```

### Gọi resolve() trên một constructor không phải Promise

`Promise.resolve()` là một phương thức generic. Nó có thể được gọi trên bất kỳ constructor nào triển khai cùng chữ ký như constructor `Promise()`. Ví dụ, chúng ta có thể gọi nó trên một constructor truyền `console.log` như là `resolve`:

```js
class NotPromise {
  constructor(executor) {
    // Các hàm "resolve" và "reject" không hoạt động giống như
    // promise gốc, nhưng Promise.resolve() gọi chúng theo cùng cách.
    executor(
      (value) => console.log("Resolved", value),
      (reason) => console.log("Rejected", reason),
    );
  }
}

Promise.resolve.call(NotPromise, "foo"); // Logs "Resolved foo"
```

Khả năng làm phẳng các thenable lồng nhau được triển khai bởi hàm `resolve` của constructor `Promise()`, vì vậy nếu bạn gọi nó trên một constructor khác, các thenable lồng nhau có thể không được làm phẳng, tùy thuộc vào cách constructor đó triển khai hàm `resolve` của nó.

```js
const thenable = {
  then(onFulfilled, onRejected) {
    onFulfilled({
      // Thenable được fulfilled với một thenable khác
      then(onFulfilled, onRejected) {
        onFulfilled(42);
      },
    });
  },
};

Promise.resolve.call(NotPromise, thenable); // Logs "Resolved { then: [Function: then] }"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
