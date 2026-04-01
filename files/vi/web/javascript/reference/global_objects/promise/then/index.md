---
title: Promise.prototype.then()
short-title: then()
slug: Web/JavaScript/Reference/Global_Objects/Promise/then
page-type: javascript-instance-method
browser-compat: javascript.builtins.Promise.then
sidebar: jsref
---

Phương thức **`then()`** của các thực thể {{jsxref("Promise")}} nhận tối đa hai đối số: các hàm callback cho các trường hợp fulfilled và rejected của `Promise`. Nó lưu trữ các callback trong promise được gọi trên đó và ngay lập tức trả về một đối tượng {{jsxref("Promise")}} khác, cho phép bạn [kết nối chuỗi](/en-US/docs/Web/JavaScript/Guide/Using_promises#chaining) các lời gọi đến các phương thức promise khác.

{{InteractiveExample("JavaScript Demo: Promise.prototype.then()")}}

```js interactive-example
const promise1 = new Promise((resolve, reject) => {
  resolve("Success!");
});

promise1.then((value) => {
  console.log(value);
  // Expected output: "Success!"
});
```

## Cú pháp

```js-nolint
then(onFulfilled)
then(onFulfilled, onRejected)
```

### Tham số

- `onFulfilled`
  - : Một hàm được thực thi bất đồng bộ khi promise này trở thành fulfilled. Giá trị trả về của nó trở thành giá trị fulfillment của promise được trả về bởi `then()`. Hàm được gọi với các đối số sau:
    - `value`
      - : Giá trị mà promise được fulfilled với.

    Nếu nó không phải là một hàm, nó được thay thế nội bộ bằng hàm _identity_ (`(x) => x`) đơn giản chỉ chuyển tiếp giá trị fulfillment.

- `onRejected` {{optional_inline}}
  - : Một hàm được thực thi bất đồng bộ khi promise này trở thành rejected. Giá trị trả về của nó trở thành giá trị fulfillment của promise được trả về bởi `then()`. Hàm được gọi với các đối số sau:
    - `reason`
      - : Giá trị mà promise bị từ chối với.

    Nếu nó không phải là một hàm, nó được thay thế nội bộ bằng hàm _thrower_ (`(x) => { throw x; }`) ném ra lý do từ chối mà nó nhận được.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} mới ngay lập tức. Promise được trả về này luôn đang chờ xử lý khi được trả về, bất kể trạng thái của promise hiện tại.

Một trong các trình xử lý `onFulfilled` và `onRejected` sẽ được thực thi để xử lý fulfillment hoặc rejection của promise hiện tại. Lời gọi luôn xảy ra bất đồng bộ, ngay cả khi promise hiện tại đã ổn định. Hành vi của promise được trả về bởi `then()` (được gọi là `p` trong danh sách sau) phụ thuộc vào kết quả thực thi của trình xử lý, theo một bộ quy tắc cụ thể. Nếu hàm trình xử lý:

- trả về một giá trị: `p` được fulfilled với giá trị được trả về như là giá trị của nó.
- không trả về bất cứ thứ gì: `p` được fulfilled với `undefined` như là giá trị của nó.
- ném ra một lỗi: `p` bị từ chối với lỗi được ném ra như là giá trị của nó.
- trả về một promise đã được fulfilled: `p` được fulfilled với giá trị của promise đó như là giá trị của nó.
- trả về một promise đã bị từ chối: `p` bị từ chối với giá trị của promise đó như là giá trị của nó.
- trả về một promise đang chờ xử lý khác: `p` đang chờ xử lý và trở thành fulfilled/rejected với giá trị của promise đó như là giá trị của nó ngay sau khi promise đó trở thành fulfilled/rejected.

## Mô tả

Phương thức `then()` lên lịch các hàm callback cho việc hoàn thành cuối cùng của một Promise — hoặc fulfillment hoặc rejection. Đây là phương thức nguyên thủy của các promise: giao thức [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) yêu cầu tất cả các đối tượng giống promise tiết lộ một phương thức `then()`, và các phương thức {{jsxref("Promise/catch", "catch()")}} và {{jsxref("Promise/finally", "finally()")}} đều hoạt động bằng cách gọi phương thức `then()` của đối tượng.

Để biết thêm thông tin về trình xử lý `onRejected`, xem tài liệu tham khảo {{jsxref("Promise/catch", "catch()")}}.

`then()` trả về một đối tượng promise mới nhưng thay đổi đối tượng promise mà nó được gọi trên đó, thêm các trình xử lý vào một danh sách nội bộ. Do đó trình xử lý được giữ lại bởi promise gốc và thời gian tồn tại của nó ít nhất dài bằng thời gian tồn tại của promise gốc. Ví dụ, ví dụ sau cuối cùng sẽ hết bộ nhớ ngay cả khi promise được trả về không được giữ lại:

```js
const pendingPromise = new Promise(() => {});
while (true) {
  pendingPromise.then(doSomething);
}
```

Nếu bạn gọi phương thức `then()` hai lần trên cùng một đối tượng promise (thay vì kết nối chuỗi), thì đối tượng promise này sẽ có hai cặp trình xử lý settlement. Tất cả các trình xử lý được đính kèm vào cùng đối tượng promise luôn được gọi theo thứ tự chúng được thêm vào. Hơn nữa, hai promise được trả về bởi mỗi lời gọi `then()` bắt đầu các chuỗi riêng biệt và không chờ settlement của nhau.

Các đối tượng [Thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) phát sinh dọc theo chuỗi `then()` luôn được [resolved](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise#the_resolve_function) — trình xử lý `onFulfilled` không bao giờ nhận được một đối tượng thenable, và bất kỳ thenable nào được trả về bởi một trong hai trình xử lý luôn được resolved trước khi được chuyển đến trình xử lý tiếp theo. Điều này là vì khi xây dựng promise mới, các hàm `resolve` và `reject` được truyền bởi `executor` được lưu, và khi promise hiện tại ổn định, hàm tương ứng sẽ được gọi với giá trị fulfillment hoặc lý do rejection. Logic resolving đến từ hàm `resolve` được truyền bởi constructor {{jsxref("Promise/Promise", "Promise()")}}.

`then()` hỗ trợ phân lớp con, có nghĩa là nó có thể được gọi trên các thực thể của lớp con của `Promise`, và kết quả sẽ là một promise của kiểu lớp con. Bạn có thể tùy chỉnh kiểu của giá trị trả về thông qua thuộc tính [`[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Symbol.species).

## Ví dụ

### Sử dụng phương thức then()

```js
const p1 = new Promise((resolve, reject) => {
  resolve("Success!");
  // hoặc
  // reject(new Error("Error!"));
});

p1.then(
  (value) => {
    console.log(value); // Success!
  },
  (reason) => {
    console.error(reason); // Error!
  },
);
```

### Có tham số không phải hàm

```js
Promise.resolve(1).then(2).then(console.log); // 1
Promise.reject(new Error("failed")).then(2, 2).then(console.log, console.log); // Error: failed
```

### Kết nối chuỗi

Phương thức `then` trả về một `Promise` mới, cho phép kết nối chuỗi phương thức.

Nếu hàm được truyền như trình xử lý vào `then` trả về một `Promise`, một `Promise` tương đương sẽ được tiếp xúc với `then` tiếp theo trong chuỗi phương thức. Đoạn mã dưới đây mô phỏng code bất đồng bộ với hàm `setTimeout`.

```js
Promise.resolve("foo")
  // 1. Nhận "foo", ghép nối "bar" vào nó, và resolve đến then tiếp theo
  .then(
    (string) =>
      new Promise((resolve, reject) => {
        setTimeout(() => {
          string += "bar";
          resolve(string);
        }, 1);
      }),
  )
  // 2. nhận "foobar", đăng ký một hàm callback để xử lý chuỗi đó
  // và in nó ra console, nhưng không trước khi trả về chuỗi chưa xử lý
  // đến then tiếp theo
  .then((string) => {
    setTimeout(() => {
      string += "baz";
      console.log(string); // foobarbaz
    }, 1);
    return string;
  })
  // 3. in các thông báo hữu ích về cách code trong phần này sẽ được chạy
  // trước khi chuỗi thực sự được xử lý bởi code bất đồng bộ giả lập trong
  // khối then trước đó.
  .then((string) => {
    console.log(
      "Last Then: oops... didn't bother to instantiate and return a promise in the prior then so the sequence may be a bit surprising",
    );

    // Lưu ý rằng `string` sẽ không có phần 'baz' tại thời điểm này. Điều này
    // là vì chúng ta đã giả lập điều đó xảy ra bất đồng bộ với hàm setTimeout
    console.log(string); // foobar
  });

// Logs, theo thứ tự:
// Last Then: oops... didn't bother to instantiate and return a promise in the prior then so the sequence may be a bit surprising
// foobar
// foobarbaz
```

Giá trị được trả về từ `then()` được resolved theo cùng cách như {{jsxref("Promise.resolve()")}}. Điều này có nghĩa là [các đối tượng thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) được hỗ trợ, và nếu giá trị trả về không phải là một promise, nó được bọc ngầm trong `Promise` và sau đó được resolved.

```js
const p2 = new Promise((resolve, reject) => {
  resolve(1);
});

p2.then((value) => {
  console.log(value); // 1
  return value + 1;
}).then((value) => {
  console.log(value, "- A synchronous value works"); // 2 - A synchronous value works
});

p2.then((value) => {
  console.log(value); // 1
});
```

Một lời gọi `then` trả về một promise cuối cùng bị từ chối nếu hàm ném ra một lỗi hoặc trả về một Promise bị từ chối.

```js
Promise.resolve()
  .then(() => {
    // Làm cho .then() trả về một promise bị từ chối
    throw new Error("Oh no!");
  })
  .then(
    () => {
      console.log("Not called.");
    },
    (error) => {
      console.error(`onRejected function called: ${error.message}`);
    },
  );
```

Trong thực tế, thường mong muốn [`catch()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch) các promise bị từ chối hơn là cú pháp hai trường hợp của `then()`, như được minh họa bên dưới.

```js
Promise.resolve()
  .then(() => {
    // Làm cho .then() trả về một promise bị từ chối
    throw new Error("Oh no!");
  })
  .catch((error) => {
    console.error(`onRejected function called: ${error.message}`);
  })
  .then(() => {
    console.log("I am always called even if the prior then's promise rejects");
  });
```

Trong tất cả các trường hợp khác, promise được trả về cuối cùng được fulfilled. Trong ví dụ sau, `then()` đầu tiên trả về `42` được bọc trong một Promise fulfilled, ngay cả khi Promise trước đó trong chuỗi bị từ chối.

```js
Promise.reject(new Error("Oh no!"))
  .then(
    () => 99,
    () => 42,
  ) // onRejected trả về 42 được bọc trong một Promise fulfilled
  .then((solution) => console.log(`Resolved with ${solution}`)); // Fulfilled với 42
```

Nếu `onFulfilled` trả về một promise, giá trị trả về của `then` sẽ được fulfilled/rejected dựa trên trạng thái cuối cùng của promise đó.

```js
function resolveLater(resolve, reject) {
  setTimeout(() => {
    resolve(10);
  }, 1000);
}
function rejectLater(resolve, reject) {
  setTimeout(() => {
    reject(new Error("Error"));
  }, 1000);
}

const p1 = Promise.resolve("foo");
// Trả về promise ở đây, sẽ được resolved thành 10 sau 1 giây
const p2 = p1.then(() => new Promise(resolveLater));
p2.then(
  (v) => {
    console.log("resolved", v); // "resolved", 10
  },
  (e) => {
    // không được gọi
    console.error("rejected", e);
  },
);

// Trả về promise ở đây, sẽ bị rejected với 'Error' sau 1 giây
const p3 = p1.then(() => new Promise(rejectLater));
p3.then(
  (v) => {
    // không được gọi
    console.log("resolved", v);
  },
  (e) => {
    console.error("rejected", e); // "rejected", 'Error'
  },
);
```

Bạn có thể sử dụng kết nối chuỗi để triển khai một hàm với API dựa trên Promise trên đầu của một hàm khác như vậy.

```js
function fetchCurrentData() {
  // API fetch() trả về một Promise. Hàm này
  // tiếp xúc một API tương tự, ngoại trừ giá trị fulfillment
  // của Promise của hàm này đã có thêm
  // công việc được thực hiện trên đó.
  return fetch("current-data.json").then((response) => {
    if (response.headers.get("content-type") !== "application/json") {
      throw new TypeError();
    }
    const j = response.json();
    // có thể làm gì đó với j

    // giá trị fulfillment được cung cấp cho người dùng của
    // fetchCurrentData().then()
    return j;
  });
}
```

### Tính bất đồng bộ của then()

Phần sau là một ví dụ để minh họa tính bất đồng bộ của phương thức `then`.

```js
// Sử dụng một promise đã resolved 'resolvedProm' ví dụ,
// lời gọi hàm 'resolvedProm.then(...)' trả về một promise mới ngay lập tức,
// nhưng trình xử lý của nó '(value) => {...}' sẽ được gọi bất đồng bộ như được minh họa bởi console.logs.
// promise mới được gán cho 'thenProm',
// và thenProm sẽ được resolved với giá trị được trả về bởi trình xử lý
const resolvedProm = Promise.resolve(33);
console.log(resolvedProm);

const thenProm = resolvedProm.then((value) => {
  console.log(
    `this gets called after the end of the main stack. the value received is: ${value}, the value returned is: ${
      value + 1
    }`,
  );
  return value + 1;
});
console.log(thenProm);

// Sử dụng setTimeout, chúng ta có thể trì hoãn việc thực thi một hàm đến khi stack rỗng
setTimeout(() => {
  console.log(thenProm);
});

// Logs, theo thứ tự:
// Promise {[[PromiseStatus]]: "resolved", [[PromiseResult]]: 33}
// Promise {[[PromiseStatus]]: "pending", [[PromiseResult]]: undefined}
// "this gets called after the end of the main stack. the value received is: 33, the value returned is: 34"
// Promise {[[PromiseStatus]]: "resolved", [[PromiseResult]]: 34}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- {{jsxref("Promise.prototype.catch()")}}
