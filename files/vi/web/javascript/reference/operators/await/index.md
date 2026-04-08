---
title: await
slug: Web/JavaScript/Reference/Operators/await
page-type: javascript-operator
browser-compat: javascript.operators.await
sidebar: jssidebar
---

Toán tử **`await`** được dùng để chờ đợi một {{jsxref("Promise")}} và lấy giá trị fulfillment của nó. Chỉ có thể dùng trong [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc ở cấp độ cao nhất của [module](/en-US/docs/Web/JavaScript/Guide/Modules).

## Cú pháp

```js-nolint
await expression
```

### Tham số

- `expression`
  - : Một {{jsxref("Promise")}}, một [thenable object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables), hoặc bất kỳ giá trị nào cần chờ.

### Giá trị trả về

Giá trị fulfillment của promise hoặc thenable object, hoặc, nếu biểu thức không phải thenable, chính giá trị của biểu thức đó.

### Ngoại lệ

Ném ra lý do rejection nếu promise hoặc thenable object bị rejected.

## Mô tả

`await` thường được dùng để giải nén promise bằng cách truyền một {{jsxref("Promise")}} vào làm `expression`. Dùng `await` tạm dừng việc thực thi hàm `async` xung quanh nó cho đến khi promise được settled (tức là fulfilled hoặc rejected). Khi việc thực thi tiếp tục, giá trị của biểu thức `await` trở thành giá trị của promise đã fulfilled.

Nếu promise bị rejected, biểu thức `await` ném ra giá trị bị rejected. Hàm chứa biểu thức `await` sẽ [xuất hiện trong stack trace](#improving_stack_trace) của lỗi. Nếu không, nếu promise bị rejected không được await hoặc được trả về ngay lập tức, hàm gọi sẽ không xuất hiện trong stack trace.

`expression` được giải quyết theo cách giống như {{jsxref("Promise.resolve()")}}: nó luôn được chuyển đổi thành `Promise` gốc rồi được await. Nếu `expression` là:

- `Promise` gốc (nghĩa là `expression` thuộc về `Promise` hoặc một subclass, và `expression.constructor === Promise`): Promise được dùng trực tiếp và được await nguyên bản, không cần gọi `then()`.
- [Thenable object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) (bao gồm non-native promise, polyfill, proxy, child class, v.v.): Một promise mới được tạo với constructor [`Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise) gốc bằng cách gọi phương thức `then()` của đối tượng và truyền vào một handler gọi callback `resolve`.
- Giá trị không phải thenable: Một `Promise` đã fulfilled được tạo và dùng.

Ngay cả khi promise được dùng đã fulfilled rồi, việc thực thi hàm async vẫn tạm dừng cho đến tick tiếp theo. Trong thời gian đó, hàm gọi của hàm async tiếp tục thực thi. [Xem ví dụ bên dưới.](#control_flow_effects_of_await)

Vì `await` chỉ hợp lệ trong async functions và modules, chính chúng là bất đồng bộ và trả về promise, biểu thức `await` không bao giờ chặn luồng chính và chỉ trì hoãn việc thực thi code thực sự phụ thuộc vào kết quả, tức là mọi thứ sau biểu thức `await`.

## Ví dụ

### Chờ đợi một promise được fulfilled

Nếu một `Promise` được truyền vào biểu thức `await`, nó chờ `Promise` được fulfilled và trả về giá trị fulfilled.

```js
function resolveAfter2Seconds(x) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(x);
    }, 2000);
  });
}

async function f1() {
  const x = await resolveAfter2Seconds(10);
  console.log(x); // 10
}

f1();
```

### Thenable objects

[Thenable objects](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) được giải quyết giống như các đối tượng `Promise` thực sự.

```js
async function f2() {
  const thenable = {
    then(resolve) {
      resolve("resolved!");
    },
  };
  console.log(await thenable); // "resolved!"
}

f2();
```

Chúng cũng có thể bị rejected:

```js
async function f2() {
  const thenable = {
    then(_, reject) {
      reject(new Error("rejected!"));
    },
  };
  await thenable; // Throws Error: rejected!
}

f2();
```

### Chuyển đổi thành promise

Nếu giá trị không phải `Promise`, `await` chuyển đổi giá trị thành `Promise` đã resolved, và chờ nó. Danh tính của giá trị được await không thay đổi miễn là nó không có thuộc tính `then` có thể gọi được.

```js
async function f3() {
  const y = await 20;
  console.log(y); // 20

  const obj = {};
  console.log((await obj) === obj); // true
}

f3();
```

### Xử lý promise bị rejected

Nếu `Promise` bị rejected, giá trị bị rejected sẽ được ném ra.

```js
async function f4() {
  try {
    const z = await Promise.reject(new Error("rejected!"));
  } catch (e) {
    console.error(e); // Error: rejected!
  }
}

f4();
```

Bạn có thể xử lý promise bị rejected mà không cần khối `try` bằng cách nối một handler [`catch()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch) trước khi await promise.

```js
const response = await promisedFunction().catch((err) => {
  console.error(err);
  return "default response";
});
// response will be "default response" if the promise is rejected
```

Điều này dựa trên giả định rằng `promisedFunction()` không bao giờ ném lỗi đồng bộ, mà luôn trả về một promise bị rejected. Đây là trường hợp với hầu hết các hàm dựa trên promise được thiết kế đúng, thường trông như:

```js
function promisedFunction() {
  // Immediately return a promise to minimize chance of an error being thrown
  return new Promise((resolve, reject) => {
    // do something async
  });
}
```

Tuy nhiên, nếu `promisedFunction()` ném lỗi đồng bộ, lỗi sẽ không bị bắt bởi handler `catch()`. Trong trường hợp này, câu lệnh `try...catch` là cần thiết.

### Top level await

Bạn có thể dùng từ khóa `await` một mình (bên ngoài hàm async) ở cấp độ cao nhất của [module](/en-US/docs/Web/JavaScript/Guide/Modules). Điều này có nghĩa là các module có child modules dùng `await` sẽ chờ child modules thực thi trước khi chính chúng chạy, trong khi không chặn các child modules khác tải.

Đây là ví dụ về module dùng [Fetch API](/en-US/docs/Web/API/Fetch_API) và chỉ định await trong câu lệnh [`export`](/en-US/docs/Web/JavaScript/Reference/Statements/export). Bất kỳ module nào bao gồm module này sẽ chờ fetch resolve trước khi chạy bất kỳ code nào.

```js
// fetch request
const colors = fetch("../data/colors.json").then((response) => response.json());

export default await colors;
```

### Tác động của await lên luồng điều khiển

Khi gặp `await` trong code (trong hàm async hoặc trong module), biểu thức được await sẽ được thực thi, trong khi toàn bộ code phụ thuộc vào giá trị của biểu thức sẽ bị tạm dừng. Quyền kiểm soát thoát khỏi hàm và trả về cho hàm gọi. Khi giá trị của biểu thức được await được giải quyết, một [microtask](/en-US/docs/Web/JavaScript/Reference/Execution_model) khác tiếp tục code đã tạm dừng được lên lịch. Điều này xảy ra ngay cả khi giá trị được await đã là promise đã resolved hoặc không phải promise: việc thực thi không trả về hàm hiện tại cho đến khi tất cả các microtask đã được lên lịch khác được xử lý. Ví dụ, xét đoạn code sau:

```js
async function foo(name) {
  console.log(name, "start");
  console.log(name, "middle");
  console.log(name, "end");
}

foo("First");
foo("Second");

// First start
// First middle
// First end
// Second start
// Second middle
// Second end
```

Trong trường hợp này, hàm `foo` có hiệu lực đồng bộ, vì nó không chứa biểu thức `await` nào. Ba câu lệnh xảy ra trong cùng một tick. Do đó, hai lần gọi hàm thực thi tất cả các câu lệnh theo thứ tự. Về mặt promise, hàm tương ứng với:

```js
function foo(name) {
  return new Promise((resolve) => {
    console.log(name, "start");
    console.log(name, "middle");
    console.log(name, "end");
    resolve();
  });
}
```

Tuy nhiên, ngay khi có một `await`, hàm trở nên bất đồng bộ, và việc thực thi các câu lệnh tiếp theo bị trì hoãn đến tick tiếp theo.

```js
async function foo(name) {
  console.log(name, "start");
  await console.log(name, "middle");
  console.log(name, "end");
}

foo("First");
foo("Second");

// First start
// First middle
// Second start
// Second middle
// First end
// Second end
```

Điều này tương ứng với:

```js
function foo(name) {
  return new Promise((resolve) => {
    console.log(name, "start");
    resolve(console.log(name, "middle"));
  }).then(() => {
    console.log(name, "end");
  });
}
```

Handler `then()` bổ sung có thể được hợp nhất với executor được truyền vào constructor vì nó không chờ bất kỳ thao tác bất đồng bộ nào. Tuy nhiên, sự tồn tại của nó chia code thành một microtask bổ sung cho mỗi lần gọi `foo`. Các microtask này được lên lịch và thực thi theo cách xen kẽ nhau, điều này có thể làm code chậm hơn và gây ra các race condition không cần thiết. Do đó, hãy chắc chắn chỉ dùng `await` khi cần thiết (để giải nén promise thành giá trị của chúng).

Microtasks không chỉ được lên lịch bởi việc giải quyết promise mà còn bởi các web API khác, và chúng thực thi với cùng mức độ ưu tiên. Ví dụ này sử dụng {{domxref("Window.queueMicrotask()", "queueMicrotask()")}} để minh họa cách hàng đợi microtask được xử lý khi mỗi biểu thức `await` được gặp.

```js
let i = 0;

queueMicrotask(function test() {
  i++;
  console.log("microtask", i);
  if (i < 3) {
    queueMicrotask(test);
  }
});

(async () => {
  console.log("async function start");
  for (let i = 1; i < 3; i++) {
    await null;
    console.log("async function resume", i);
  }
  await null;
  console.log("async function end");
})();

queueMicrotask(() => {
  console.log("queueMicrotask() after calling async function");
});

console.log("script sync part end");

// Logs:
// async function start
// script sync part end
// microtask 1
// async function resume 1
// queueMicrotask() after calling async function
// microtask 2
// async function resume 2
// microtask 3
// async function end
```

Trong ví dụ này, hàm `test()` luôn được gọi trước khi hàm async tiếp tục, vì vậy các microtask chúng lên lịch luôn được thực thi theo cách xen kẽ. Mặt khác, vì cả `await` và `queueMicrotask()` đều lên lịch microtask, thứ tự thực thi luôn dựa trên thứ tự lên lịch. Đó là lý do tại sao log "queueMicrotask() after calling async function" xuất hiện sau khi hàm async tiếp tục lần đầu tiên.

### Cải thiện stack trace

Đôi khi, `await` bị bỏ qua khi một promise được trả về trực tiếp từ hàm async.

```js
async function noAwait() {
  // Some actions...

  return /* await */ lastAsyncTask();
}
```

Tuy nhiên, hãy xét trường hợp `lastAsyncTask` ném lỗi bất đồng bộ.

```js
async function lastAsyncTask() {
  await null;
  throw new Error("failed");
}

async function noAwait() {
  return lastAsyncTask();
}

noAwait();

// Error: failed
//    at lastAsyncTask
```

Chỉ `lastAsyncTask` xuất hiện trong stack trace, vì promise bị rejected sau khi đã được trả về từ `noAwait` — theo một nghĩa nào đó, promise không liên quan đến `noAwait`. Để cải thiện stack trace, bạn có thể dùng `await` để giải nén promise, để exception được ném vào hàm hiện tại. Exception sau đó sẽ được bọc ngay vào một promise rejected mới, nhưng trong quá trình tạo lỗi, hàm gọi sẽ xuất hiện trong stack trace.

```js
async function lastAsyncTask() {
  await null;
  throw new Error("failed");
}

async function withAwait() {
  return await lastAsyncTask();
}

withAwait();

// Error: failed
//    at lastAsyncTask
//    at async withAwait
```

Trái với một số quan niệm phổ biến, `return await promise` ít nhất nhanh như `return promise`, do cách spec và engines tối ưu hóa việc giải quyết promise gốc. Có một đề xuất để [làm `return promise` nhanh hơn](https://github.com/tc39/proposal-faster-promise-adoption) và bạn cũng có thể đọc về [tối ưu hóa V8 trên async functions](https://v8.dev/blog/fast-async). Do đó, ngoại trừ lý do phong cách, `return await` hầu như luôn được ưu tiên hơn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/async_function", "async function")}}
- [Biểu thức `async function`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function)
- {{jsxref("AsyncFunction")}}
- [Top-level await](https://v8.dev/features/top-level-await) trên v8.dev (2019)
- [typescript-eslint rule: `return-await`](https://typescript-eslint.io/rules/return-await/)
