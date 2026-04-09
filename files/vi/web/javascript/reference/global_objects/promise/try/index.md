---
title: Promise.try()
short-title: try()
slug: Web/JavaScript/Reference/Global_Objects/Promise/try
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.try
sidebar: jsref
---

Phương thức tĩnh **`Promise.try()`** nhận một callback thuộc bất kỳ loại nào (trả về hoặc ném lỗi, đồng bộ hoặc bất đồng bộ) và bọc kết quả của nó trong một {{jsxref("Promise")}}.

## Cú pháp

```js-nolint
Promise.try(func)
Promise.try(func, arg1)
Promise.try(func, arg1, arg2)
Promise.try(func, arg1, arg2, /* …, */ argN)
```

### Tham số

- `func`
  - : Một hàm được gọi đồng bộ với các đối số được cung cấp (`arg1`, `arg2`, …, `argN`). Nó có thể làm bất cứ điều gì — trả về giá trị, ném lỗi, hoặc trả về một promise.
- `arg1`, `arg2`, …, `argN`
  - : Các đối số được truyền cho `func`.

### Giá trị trả về

Một {{jsxref("Promise")}} mà:

- Đã được fulfilled, nếu `func` trả về giá trị đồng bộ.
- Đã bị rejected, nếu `func` ném lỗi đồng bộ.
- Được fulfilled hoặc rejected bất đồng bộ, nếu `func` trả về một promise.

## Mô tả

Bạn có thể có một API nhận một callback. Callback đó có thể là đồng bộ hoặc bất đồng bộ. Bạn muốn xử lý mọi thứ thống nhất bằng cách bọc kết quả vào một promise. Cách đơn giản nhất có thể là {{jsxref("Promise/resolve", "Promise.resolve(func())")}}. Vấn đề là nếu `func()` ném lỗi đồng bộ, lỗi này sẽ không được bắt và chuyển thành một promise bị rejected.

Cách tiếp cận phổ biến (đưa kết quả của một lời gọi hàm vào một promise, dù fulfilled hay rejected) thường trông như thế này:

```js
new Promise((resolve) => resolve(func()));
```

Nhưng `Promise.try()` hữu ích hơn ở đây:

```js
Promise.try(func);
```

Đối với constructor `Promise()` tích hợp sẵn, các lỗi ném ra từ executor được tự động bắt và chuyển thành rejections, vì vậy hai cách tiếp cận này về cơ bản là tương đương, ngoại trừ `Promise.try()` ngắn gọn và dễ đọc hơn.

Lưu ý rằng `Promise.try()` _không_ tương đương với cách sau, dù rất giống nhau:

```js
Promise.resolve().then(func);
```

Sự khác biệt là callback được truyền cho {{jsxref("Promise/then", "then()")}} luôn được gọi bất đồng bộ, trong khi executor của constructor `Promise()` được gọi đồng bộ. `Promise.try` cũng gọi hàm đồng bộ và resolve promise ngay lập tức nếu có thể.

`Promise.try()`, kết hợp với {{jsxref("Promise/catch", "catch()")}} và {{jsxref("Promise/finally", "finally()")}}, có thể được dùng để xử lý cả lỗi đồng bộ và bất đồng bộ trong một chuỗi duy nhất, giúp việc xử lý lỗi promise trông gần giống như xử lý lỗi đồng bộ.

Giống như {{domxref("Window/setTimeout", "setTimeout()")}}, `Promise.try()` chấp nhận các đối số bổ sung được truyền cho callback. Điều này có nghĩa là thay vì làm thế này:

```js
Promise.try(() => func(arg1, arg2));
```

Bạn có thể làm thế này:

```js
Promise.try(func, arg1, arg2);
```

Cả hai đều tương đương, nhưng cách sau tránh tạo một closure thêm và hiệu quả hơn.

## Ví dụ

### Sử dụng Promise.try()

Ví dụ sau nhận một callback, "đưa" nó vào một promise, xử lý kết quả và thực hiện một số xử lý lỗi:

```js
function doSomething(action) {
  return Promise.try(action)
    .then((result) => console.log(result))
    .catch((error) => console.error(error))
    .finally(() => console.log("Done"));
}

doSomething(() => "Sync result");

doSomething(() => {
  throw new Error("Sync error");
});

doSomething(async () => "Async result");

doSomething(async () => {
  throw new Error("Async error");
});
```

Trong async/await, đoạn mã tương tự sẽ trông như thế này:

```js
async function doSomething(action) {
  try {
    const result = await action();
    console.log(result);
  } catch (error) {
    console.error(error);
  } finally {
    console.log("Done");
  }
}
```

### Gọi try() trên một constructor không phải Promise

`Promise.try()` là một phương thức generic. Nó có thể được gọi trên bất kỳ constructor nào triển khai cùng chữ ký như constructor `Promise()`.

Đoạn sau là một phỏng đoán sát hơn một chút về cách `Promise.try()` thực sự hoạt động (dù vẫn không nên dùng làm polyfill):

```js
Promise.try = function (func) {
  return new this((resolve, reject) => {
    try {
      resolve(func());
    } catch (error) {
      reject(error);
    }
  });
};
```

Do cách `Promise.try()` được triển khai (tức là sử dụng `try...catch`), chúng ta có thể gọi `Promise.try()` an toàn với `this` được đặt thành bất kỳ constructor tùy chỉnh nào, và nó sẽ không bao giờ ném lỗi đồng bộ.

```js
class NotPromise {
  constructor(executor) {
    // The "resolve" and "reject" functions behave nothing like the native
    // promise's, but Promise.try() just calls resolve
    executor(
      (value) => console.log("Resolved", value),
      (reason) => console.log("Rejected", reason),
    );
  }
}

const p = Promise.try.call(NotPromise, () => "hello");
// Logs: Resolved hello

const p2 = Promise.try.call(NotPromise, () => {
  throw new Error("oops");
});
// Logs: Rejected Error: oops
```

Không giống như `Promise()`, constructor `NotPromise()` này _không_ xử lý graceful các ngoại lệ khi chạy executor. Nhưng dù có `throw`, `Promise.try()` vẫn bắt ngoại lệ và truyền nó cho `reject()` để ghi ra.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Promise.try` in `core-js`](https://github.com/zloirock/core-js#promisetry)
- [es-shims polyfill of `Promise.try`](https://www.npmjs.com/package/promise.try)
- [Using promises](/en-US/docs/Web/JavaScript/Guide/Using_promises) guide
- {{jsxref("Promise")}}
- [`Promise()` constructor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise)
