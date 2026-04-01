---
title: Promise.race()
short-title: race()
slug: Web/JavaScript/Reference/Global_Objects/Promise/race
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.race
sidebar: jsref
---

Phương thức tĩnh **`Promise.race()`** nhận một iterable của các promise làm đầu vào và trả về một {{jsxref("Promise")}} duy nhất. Promise được trả về này ổn định với trạng thái cuối cùng của promise đầu tiên ổn định.

{{InteractiveExample("JavaScript Demo: Promise.race()", "taller")}}

```js interactive-example
const promise1 = new Promise((resolve, reject) => {
  setTimeout(resolve, 500, "one");
});

const promise2 = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, "two");
});

Promise.race([promise1, promise2]).then((value) => {
  console.log(value);
  // Both resolve, but promise2 is faster
});
// Expected output: "two"
```

## Cú pháp

```js-nolint
Promise.race(iterable)
```

### Tham số

- `iterable`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) của các promise.

### Giá trị trả về

Một {{jsxref("Promise")}} **ổn định bất đồng bộ** với trạng thái cuối cùng của promise đầu tiên trong `iterable` ổn định. Nói cách khác, nó được fulfilled nếu promise đầu tiên ổn định được fulfilled, và bị từ chối nếu promise đầu tiên ổn định bị từ chối. Promise được trả về sẽ vẫn đang chờ xử lý mãi mãi nếu `iterable` được truyền vào là rỗng. Nếu `iterable` được truyền vào không rỗng nhưng không chứa promise đang chờ xử lý, promise được trả về vẫn ổn định bất đồng bộ (thay vì đồng bộ).

## Mô tả

Phương thức `Promise.race()` là một trong các phương thức [đồng thời promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#promise_concurrency). Nó hữu ích khi bạn muốn tác vụ bất đồng bộ đầu tiên hoàn thành, nhưng không quan tâm đến trạng thái cuối cùng của nó (tức là nó có thể thành công hoặc thất bại).

Nếu iterable chứa một hoặc nhiều giá trị không phải promise và/hoặc một promise đã ổn định, thì `Promise.race()` sẽ ổn định với giá trị đầu tiên trong số này được tìm thấy trong iterable.

## Ví dụ

### Sử dụng Promise.race()

Ví dụ này cho thấy cách `Promise.race()` có thể được sử dụng để đua một vài timer được triển khai với {{domxref("Window.setTimeout", "setTimeout()")}}. Timer có thời gian ngắn nhất luôn thắng cuộc đua và trở thành trạng thái của promise kết quả.

```js
function sleep(time, value, state) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (state === "fulfill") {
        resolve(value);
      } else {
        reject(new Error(value));
      }
    }, time);
  });
}

const p1 = sleep(500, "one", "fulfill");
const p2 = sleep(100, "two", "fulfill");

Promise.race([p1, p2]).then((value) => {
  console.log(value); // "two"
  // Cả hai đều fulfill, nhưng p2 nhanh hơn
});

const p3 = sleep(100, "three", "fulfill");
const p4 = sleep(500, "four", "reject");

Promise.race([p3, p4]).then(
  (value) => {
    console.log(value); // "three"
    // p3 nhanh hơn, vì vậy nó fulfill
  },
  (error) => {
    // Không được gọi
  },
);

const p5 = sleep(500, "five", "fulfill");
const p6 = sleep(100, "six", "reject");

Promise.race([p5, p6]).then(
  (value) => {
    // Không được gọi
  },
  (error) => {
    console.error(error.message); // "six"
    // p6 nhanh hơn, vì vậy nó reject
  },
);
```

### Tính bất đồng bộ của Promise.race

Ví dụ sau minh họa tính bất đồng bộ của `Promise.race`. Không giống như các phương thức đồng thời promise khác, `Promise.race` luôn bất đồng bộ: nó không bao giờ ổn định đồng bộ, ngay cả khi `iterable` là rỗng.

```js
// Truyền một mảng các promise đã được resolved,
// để kích hoạt Promise.race sớm nhất có thể
const resolvedPromisesArray = [Promise.resolve(33), Promise.resolve(44)];

const p = Promise.race(resolvedPromisesArray);
// Ghi lại giá trị của p ngay lập tức
console.log(p);

// Sử dụng setTimeout, chúng ta có thể thực thi code sau khi stack rỗng
setTimeout(() => {
  console.log("the stack is now empty");
  console.log(p);
});

// Logs, theo thứ tự:
// Promise { <state>: "pending" }
// the stack is now empty
// Promise { <state>: "fulfilled", <value>: 33 }
```

Một iterable rỗng khiến promise được trả về vẫn đang chờ xử lý mãi mãi:

```js
const foreverPendingPromise = Promise.race([]);
console.log(foreverPendingPromise);
setTimeout(() => {
  console.log("the stack is now empty");
  console.log(foreverPendingPromise);
});

// Logs, theo thứ tự:
// Promise { <state>: "pending" }
// the stack is now empty
// Promise { <state>: "pending" }
```

Nếu iterable chứa một hoặc nhiều giá trị không phải promise và/hoặc một promise đã ổn định, thì `Promise.race` sẽ ổn định với giá trị đầu tiên trong số này được tìm thấy trong mảng:

```js
const foreverPendingPromise = Promise.race([]);
const alreadyFulfilledProm = Promise.resolve(100);

const arr = [foreverPendingPromise, alreadyFulfilledProm, "non-Promise value"];
const arr2 = [foreverPendingPromise, "non-Promise value", Promise.resolve(100)];
const p = Promise.race(arr);
const p2 = Promise.race(arr2);

console.log(p);
console.log(p2);
setTimeout(() => {
  console.log("the stack is now empty");
  console.log(p);
  console.log(p2);
});

// Logs, theo thứ tự:
// Promise { <state>: "pending" }
// Promise { <state>: "pending" }
// the stack is now empty
// Promise { <state>: "fulfilled", <value>: 100 }
// Promise { <state>: "fulfilled", <value>: "non-Promise value" }
```

### Sử dụng Promise.race() để triển khai timeout yêu cầu

Bạn có thể đua một yêu cầu có thể mất nhiều thời gian với một timer từ chối, sao cho khi giới hạn thời gian đã trôi qua, promise kết quả tự động bị từ chối.

```js
const data = Promise.race([
  fetch("/api"),
  new Promise((resolve, reject) => {
    // Từ chối sau 5 giây
    setTimeout(() => reject(new Error("Request timed out")), 5000);
  }),
])
  .then((res) => res.json())
  .catch((err) => displayError(err));
```

Nếu promise `data` được fulfilled, nó sẽ chứa dữ liệu được tải từ `/api`; nếu không, nó sẽ bị từ chối nếu `fetch` vẫn đang chờ xử lý trong 5 giây và thua cuộc đua với timer `setTimeout`.

### Sử dụng Promise.race() để phát hiện trạng thái của một promise

Vì `Promise.race()` resolve tới promise không đang chờ xử lý đầu tiên trong iterable, chúng ta có thể kiểm tra trạng thái của một promise, bao gồm nếu nó đang chờ xử lý. Ví dụ này được chuyển thể từ [`promise-status-async`](https://github.com/kudla/promise-status-async/blob/master/lib/promiseState.js).

```js
function promiseState(promise) {
  const pendingState = { status: "pending" };

  return Promise.race([promise, pendingState]).then(
    (value) =>
      value === pendingState ? value : { status: "fulfilled", value },
    (reason) => ({ status: "rejected", reason }),
  );
}
```

Trong hàm này, nếu `promise` đang chờ xử lý, giá trị thứ hai, `pendingState`, là một giá trị không phải promise, sẽ trở thành kết quả của cuộc đua; nếu không, nếu `promise` đã ổn định, chúng ta có thể biết trạng thái của nó thông qua các trình xử lý `onFulfilled` và `onRejected`. Ví dụ:

```js
const p1 = new Promise((res) => setTimeout(() => res(100), 100));
const p2 = new Promise((res) => setTimeout(() => res(200), 200));
const p3 = new Promise((res, rej) =>
  setTimeout(() => rej(new Error("failed")), 100),
);

async function getStates() {
  console.log(await promiseState(p1));
  console.log(await promiseState(p2));
  console.log(await promiseState(p3));
}

console.log("Immediately after initiation:");
getStates();
setTimeout(() => {
  console.log("After waiting for 100ms:");
  getStates();
}, 100);

// Logs:
// Immediately after initiation:
// { status: 'pending' }
// { status: 'pending' }
// { status: 'pending' }
// After waiting for 100ms:
// { status: 'fulfilled', value: 100 }
// { status: 'pending' }
// { status: 'rejected', reason: Error: failed }
```

> [!NOTE]
> Hàm `promiseState` vẫn chạy bất đồng bộ, vì không có cách nào để đồng bộ lấy giá trị của một promise (tức là không có `then()` hoặc `await`), ngay cả khi nó đã ổn định. Tuy nhiên, `promiseState()` luôn được fulfilled trong một tick và không bao giờ thực sự chờ việc ổn định của bất kỳ promise nào.

### So sánh với Promise.any()

`Promise.race` lấy {{jsxref("Promise")}} đã ổn định đầu tiên.

```js
const promise1 = new Promise((resolve, reject) => {
  setTimeout(resolve, 500, "one");
});

const promise2 = new Promise((resolve, reject) => {
  setTimeout(reject, 100, "two");
});

Promise.race([promise1, promise2])
  .then((value) => {
    console.log("succeeded with value:", value);
  })
  .catch((reason) => {
    // Chỉ promise1 được fulfilled, nhưng promise2 nhanh hơn
    console.error("failed with reason:", reason);
  });
// failed with reason: two
```

{{jsxref("Promise.any")}} lấy {{jsxref("Promise")}} được fulfilled đầu tiên.

```js
const promise1 = new Promise((resolve, reject) => {
  setTimeout(resolve, 500, "one");
});

const promise2 = new Promise((resolve, reject) => {
  setTimeout(reject, 100, "two");
});

Promise.any([promise1, promise2])
  .then((value) => {
    // Chỉ promise1 được fulfilled, mặc dù promise2 ổn định sớm hơn
    console.log("succeeded with value:", value);
  })
  .catch((reason) => {
    console.error("failed with reason:", reason);
  });
// succeeded with value: one
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- {{jsxref("Promise.all()")}}
- {{jsxref("Promise.allSettled()")}}
- {{jsxref("Promise.any()")}}
