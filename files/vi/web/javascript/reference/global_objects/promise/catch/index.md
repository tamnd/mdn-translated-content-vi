---
title: Promise.prototype.catch()
short-title: catch()
slug: Web/JavaScript/Reference/Global_Objects/Promise/catch
page-type: javascript-instance-method
browser-compat: javascript.builtins.Promise.catch
sidebar: jsref
---

Phương thức **`catch()`** của các thực thể {{jsxref("Promise")}} lên lịch một hàm được gọi khi promise bị từ chối. Nó ngay lập tức trả về một đối tượng {{jsxref("Promise")}} khác, cho phép bạn [kết nối chuỗi](/en-US/docs/Web/JavaScript/Guide/Using_promises#chaining) các lời gọi đến các phương thức promise khác. Đây là shortcut cho {{jsxref("Promise/then", "then(undefined, onRejected)")}}.

{{InteractiveExample("JavaScript Demo: Promise.prototype.catch()")}}

```js interactive-example
const promise = new Promise((resolve, reject) => {
  throw new Error("Uh-oh!");
});

promise.catch((error) => {
  console.error(error);
});
// Expected output: Error: Uh-oh!
```

## Cú pháp

```js-nolint
promiseInstance.catch(onRejected)
```

### Tham số

- `onRejected`
  - : Một hàm được thực thi bất đồng bộ khi promise này bị từ chối. Giá trị trả về của nó trở thành giá trị fulfillment của promise được trả về bởi `catch()`. Hàm được gọi với các đối số sau:
    - `reason`
      - : Giá trị mà promise bị từ chối với.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} mới. Promise mới này luôn đang chờ xử lý khi được trả về, bất kể trạng thái của promise hiện tại. Nếu `onRejected` được gọi, promise được trả về sẽ resolve dựa trên giá trị trả về của lời gọi này, hoặc bị từ chối với lỗi được ném ra từ lời gọi này. Nếu promise hiện tại được thực hiện, `onRejected` không được gọi và promise được trả về thực hiện với cùng giá trị.

## Mô tả

Phương thức `catch` được sử dụng để xử lý lỗi trong thành phần promise. Vì nó trả về một {{jsxref("Promise")}}, nó [có thể được kết nối chuỗi](/en-US/docs/Web/JavaScript/Guide/Using_promises#chaining_after_a_catch) theo cùng cách như phương thức anh em của nó, {{jsxref("Promise/then", "then()")}}.

Nếu một promise bị từ chối, và không có rejection handler nào được gọi (một trình xử lý có thể được đính kèm thông qua bất kỳ {{jsxref("Promise/then", "then()")}}, `catch()`, hoặc {{jsxref("Promise/finally", "finally()")}}), thì sự kiện rejection sẽ được hiển thị bởi host. Trong trình duyệt, điều này dẫn đến một sự kiện [`unhandledrejection`](/en-US/docs/Web/API/Window/unhandledrejection_event). Nếu một trình xử lý được đính kèm vào một promise bị từ chối mà rejection của nó đã gây ra một sự kiện unhandled rejection, thì một sự kiện [`rejectionhandled`](/en-US/docs/Web/API/Window/rejectionhandled_event) khác được kích hoạt.

`catch()` nội bộ gọi `then()` trên đối tượng mà nó được gọi, truyền `undefined` và `onRejected` làm đối số. Giá trị của lời gọi đó được trả về trực tiếp. Điều này có thể quan sát được nếu bạn bọc các phương thức.

```js
// ghi đè Promise.prototype.then/catch gốc để thêm một số log
((Promise) => {
  const originalThen = Promise.prototype.then;
  const originalCatch = Promise.prototype.catch;

  Promise.prototype.then = function (...args) {
    console.log("Called .then on %o with arguments: %o", this, args);
    return originalThen.apply(this, args);
  };
  Promise.prototype.catch = function (...args) {
    console.error("Called .catch on %o with arguments: %o", this, args);
    return originalCatch.apply(this, args);
  };
})(Promise);

// gọi catch trên một promise đã được resolved
Promise.resolve().catch(function XXX() {});

// Logs:
// Called .catch on Promise{} with arguments: Arguments{1} [0: function XXX()]
// Called .then on Promise{} with arguments: Arguments{2} [0: undefined, 1: function XXX()]
```

Điều này có nghĩa là truyền `undefined` vẫn khiến promise được trả về bị từ chối, và bạn phải truyền một hàm để ngăn promise cuối cùng bị từ chối.

Vì `catch()` chỉ gọi `then()`, nó hỗ trợ phân lớp con.

> [!NOTE]
> Các ví dụ dưới đây đang ném các thực thể của [`Error`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error). Cũng như với các câu lệnh [`throw`](/en-US/docs/Web/JavaScript/Reference/Statements/throw) đồng bộ, đây được coi là thực hành tốt; nếu không, phần thực hiện bắt lỗi sẽ phải thực hiện kiểm tra để xem đối số có phải là chuỗi hay lỗi không, và bạn có thể mất thông tin có giá trị như stack trace.

## Ví dụ

### Sử dụng và kết nối chuỗi phương thức catch()

```js
const p1 = new Promise((resolve, reject) => {
  resolve("Success");
});

p1.then((value) => {
  console.log(value); // "Success!"
  throw new Error("oh, no!");
})
  .catch((e) => {
    console.error(e.message); // "oh, no!"
  })
  .then(
    () => console.log("after a catch the chain is restored"), // "after a catch the chain is restored"
    () => console.log("Not fired due to the catch"),
  );

// Phần sau đây hoạt động giống như trên
p1.then((value) => {
  console.log(value); // "Success!"
  return Promise.reject(new Error("oh, no!"));
})
  .catch((e) => {
    console.error(e); // Error: oh, no!
  })
  .then(
    () => console.log("after a catch the chain is restored"), // "after a catch the chain is restored"
    () => console.log("Not fired due to the catch"),
  );
```

### Những điều cần lưu ý khi ném lỗi

Ném lỗi sẽ gọi phương thức `catch()` trong hầu hết các trường hợp:

```js
const p1 = new Promise((resolve, reject) => {
  throw new Error("Uh-oh!");
});

p1.catch((e) => {
  console.error(e); // "Uh-oh!"
});
```

Các lỗi được ném bên trong các hàm bất đồng bộ sẽ hoạt động như các lỗi không được bắt:

```js
const p2 = new Promise((resolve, reject) => {
  setTimeout(() => {
    throw new Error("Uncaught Exception!");
  }, 1000);
});

p2.catch((e) => {
  console.error(e); // Điều này không bao giờ được gọi
});
```

Các lỗi được ném sau khi `resolve` được gọi sẽ bị im lặng:

```js
const p3 = new Promise((resolve, reject) => {
  resolve();
  throw new Error("Silenced Exception!");
});

p3.catch((e) => {
  console.error(e); // Điều này không bao giờ được gọi
});
```

### catch() không được gọi nếu promise được thực hiện

```js
// Tạo một promise sẽ không gọi onReject
const p1 = Promise.resolve("calling next");

const p2 = p1.catch((reason) => {
  // Điều này không bao giờ được gọi
  console.error("catch p1!");
  console.error(reason);
});

p2.then(
  (value) => {
    console.log("next promise's onFulfilled");
    console.log(value); // calling next
  },
  (reason) => {
    console.log("next promise's onRejected");
    console.log(reason);
  },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- {{jsxref("Promise.prototype.then()")}}
- {{jsxref("Promise.prototype.finally()")}}
