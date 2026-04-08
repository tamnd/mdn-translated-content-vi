---
title: Promise.reject()
short-title: reject()
slug: Web/JavaScript/Reference/Global_Objects/Promise/reject
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.reject
sidebar: jsref
---

Phương thức tĩnh **`Promise.reject()`** trả về một đối tượng `Promise` bị từ chối với một lý do đã cho.

{{InteractiveExample("JavaScript Demo: Promise.reject()")}}

```js interactive-example
function resolved(result) {
  console.log("Resolved");
}

function rejected(result) {
  console.error(result);
}

Promise.reject(new Error("fail")).then(resolved, rejected);
// Expected output: Error: fail
```

## Cú pháp

```js-nolint
Promise.reject(reason)
```

### Tham số

- `reason`
  - : Lý do tại sao `Promise` này bị từ chối.

### Giá trị trả về

Một {{jsxref("Promise")}} bị từ chối với lý do đã cho.

## Mô tả

Hàm tĩnh `Promise.reject` trả về một `Promise` bị từ chối. Cho mục đích debug và bắt lỗi có chọn lọc, hữu ích khi làm cho `reason` là một `instanceof` {{jsxref("Error")}}.

`Promise.reject()` là generic và hỗ trợ phân lớp con, có nghĩa là nó có thể được gọi trên các lớp con của `Promise`, và kết quả sẽ là một promise của kiểu lớp con. Để làm như vậy, constructor của lớp con phải triển khai cùng chữ ký với constructor [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise) — chấp nhận một hàm `executor` duy nhất có thể được gọi với các callback `resolve` và `reject` như là tham số. `Promise.reject()` về cơ bản là viết tắt cho `new Promise((resolve, reject) => reject(reason))`.

Không giống như {{jsxref("Promise.resolve()")}}, `Promise.reject()` luôn bọc `reason` trong một đối tượng `Promise` mới, ngay cả khi `reason` đã là một `Promise`.

## Ví dụ

### Sử dụng phương thức tĩnh Promise.reject()

```js
Promise.reject(new Error("fail")).then(
  () => {
    // không được gọi
  },
  (error) => {
    console.error(error); // Stacktrace
  },
);
```

### Từ chối với một promise

Không giống như {{jsxref("Promise.resolve")}}, phương thức `Promise.reject` không tái sử dụng các thực thể `Promise` hiện có. Nó luôn trả về một thực thể `Promise` mới bọc `reason`.

```js
const p = Promise.resolve(1);
const rejected = Promise.reject(p);
console.log(rejected === p); // false
rejected.catch((v) => {
  console.log(v === p); // true
});
```

### Gọi reject() trên một constructor không phải Promise

`Promise.reject()` là một phương thức generic. Nó có thể được gọi trên bất kỳ constructor nào triển khai cùng chữ ký như constructor `Promise()`. Ví dụ, chúng ta có thể gọi nó trên một constructor truyền `console.log` như là `reject`:

```js
class NotPromise {
  constructor(executor) {
    // Các hàm "resolve" và "reject" không hoạt động giống như
    // promise gốc, nhưng Promise.reject() gọi chúng theo cùng cách.
    executor(
      (value) => console.log("Resolved", value),
      (reason) => console.log("Rejected", reason),
    );
  }
}

Promise.reject.call(NotPromise, "foo"); // Logs "Rejected foo"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
