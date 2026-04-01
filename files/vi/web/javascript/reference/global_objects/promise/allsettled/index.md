---
title: Promise.allSettled()
short-title: allSettled()
slug: Web/JavaScript/Reference/Global_Objects/Promise/allSettled
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.allSettled
sidebar: jsref
---

Phương thức tĩnh **`Promise.allSettled()`** nhận một iterable của các promise làm đầu vào và trả về một {{jsxref("Promise")}} duy nhất. Promise được trả về này thực hiện khi tất cả các promise trong đầu vào đã ổn định (kể cả khi một iterable rỗng được truyền vào), với một mảng các đối tượng mô tả kết quả của từng promise.

{{InteractiveExample("JavaScript Demo: Promise.allSettled()", "taller")}}

```js interactive-example
const promise1 = Promise.resolve(3);
const promise2 = new Promise((resolve, reject) =>
  setTimeout(reject, 100, "foo"),
);
const promises = [promise1, promise2];

Promise.allSettled(promises).then((results) =>
  results.forEach((result) => console.log(result.status)),
);

// Expected output:
// "fulfilled"
// "rejected"
```

## Cú pháp

```js-nolint
Promise.allSettled(iterable)
```

### Tham số

- `iterable`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) của các promise.

### Giá trị trả về

Một {{jsxref("Promise")}} là:

- **Đã fulfilled ngay lập tức**, nếu `iterable` được truyền vào là rỗng.
- **Được fulfilled bất đồng bộ**, khi tất cả các promise trong `iterable` đã cho đã ổn định (hoặc fulfilled hoặc rejected). Giá trị fulfillment là một mảng các đối tượng, mỗi đối tượng mô tả kết quả của một promise trong `iterable`, theo thứ tự của các promise được truyền vào, bất kể thứ tự hoàn thành. Mỗi đối tượng kết quả có các thuộc tính sau:
  - `status`
    - : Một chuỗi, có thể là `"fulfilled"` hoặc `"rejected"`, cho biết trạng thái cuối cùng của promise.
  - `value`
    - : Chỉ có mặt nếu `status` là `"fulfilled"`. Giá trị mà promise được fulfilled với.
  - `reason`
    - : Chỉ có mặt nếu `status` là `"rejected"`. Lý do mà promise bị từ chối với.

  Nếu `iterable` được truyền vào không rỗng nhưng không chứa promise đang chờ xử lý, promise được trả về vẫn được fulfilled bất đồng bộ (thay vì đồng bộ).

## Mô tả

Phương thức `Promise.allSettled()` là một trong các phương thức [đồng thời promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#promise_concurrency). `Promise.allSettled()` thường được sử dụng khi bạn có nhiều tác vụ bất đồng bộ không phụ thuộc vào nhau để hoàn thành thành công, hoặc bạn luôn muốn biết kết quả của từng promise.

Ngược lại, Promise được trả về bởi {{jsxref("Promise.all()")}} có thể phù hợp hơn nếu các tác vụ phụ thuộc vào nhau, hoặc nếu bạn muốn từ chối ngay lập tức khi bất kỳ tác vụ nào bị từ chối.

## Ví dụ

### Sử dụng Promise.allSettled()

```js
Promise.allSettled([
  Promise.resolve(33),
  new Promise((resolve) => setTimeout(() => resolve(66), 0)),
  99,
  Promise.reject(new Error("an error")),
]).then((values) => console.log(values));

// [
//   { status: 'fulfilled', value: 33 },
//   { status: 'fulfilled', value: 66 },
//   { status: 'fulfilled', value: 99 },
//   { status: 'rejected', reason: Error: an error }
// ]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Promise.allSettled` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- [es-shims polyfill của `Promise.allSettled`](https://www.npmjs.com/package/promise.allsettled)
- Hướng dẫn [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- [Lập trình bất đồng bộ nhẹ nhàng với promise](/en-US/docs/Learn_web_development/Extensions/Async_JS/Promises)
- {{jsxref("Promise")}}
- {{jsxref("Promise.all()")}}
- {{jsxref("Promise.any()")}}
- {{jsxref("Promise.race()")}}
