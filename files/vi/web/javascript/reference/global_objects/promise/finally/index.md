---
title: Promise.prototype.finally()
short-title: finally()
slug: Web/JavaScript/Reference/Global_Objects/Promise/finally
page-type: javascript-instance-method
browser-compat: javascript.builtins.Promise.finally
sidebar: jsref
---

Phương thức **`finally()`** của các thực thể {{jsxref("Promise")}} lên lịch một hàm được gọi khi promise ổn định (hoặc fulfilled hoặc rejected). Nó ngay lập tức trả về một đối tượng {{jsxref("Promise")}} khác, cho phép bạn [kết nối chuỗi](/en-US/docs/Web/JavaScript/Guide/Using_promises#chaining) các lời gọi đến các phương thức promise khác.

Giống như khối [`finally`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#the_finally_block), phương thức này thường được dùng cho các hành động dọn dẹp, bất kể kết quả của promise là gì. Nó cho phép bạn tránh lặp code trong cả hai trình xử lý {{jsxref("Promise/then", "then()")}} và {{jsxref("Promise/catch", "catch()")}} của promise.

{{InteractiveExample("JavaScript Demo: Promise.prototype.finally()", "taller")}}

```js interactive-example
function checkMail() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.5) {
      resolve("Mail has arrived");
    } else {
      reject(new Error("Failed to arrive"));
    }
  });
}

checkMail()
  .then((mail) => {
    console.log(mail);
  })
  .catch((err) => {
    console.error(err);
  })
  .finally(() => {
    console.log("Experiment completed");
  });
```

## Cú pháp

```js-nolint
promiseInstance.finally(onFinally)
```

### Tham số

- `onFinally`
  - : Một hàm được thực thi bất đồng bộ khi promise này ổn định. Nếu hàm trả về một promise, promise kết quả sẽ chờ promise đó ổn định trước khi tiếp tục. Nếu promise được trả về bị từ chối, promise kết quả sẽ bị từ chối với cùng lý do. Bất kỳ giá trị trả về nào khác, hoặc giá trị fulfilled của promise được trả về, sẽ bị bỏ qua.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} mới ngay lập tức. Promise mới này luôn đang chờ xử lý khi được trả về, bất kể trạng thái của promise hiện tại. Nếu `onFinally` ném ra một lỗi hoặc trả về một promise bị từ chối, promise mới sẽ bị từ chối với giá trị đó. Nếu không, promise mới sẽ ổn định với cùng trạng thái như promise hiện tại.

## Mô tả

Phương thức `finally()` có thể hữu ích nếu bạn muốn thực hiện một số xử lý hoặc dọn dẹp một khi promise đã ổn định, bất kể kết quả của nó là gì.

Phương thức `finally()` rất giống với việc gọi {{jsxref("Promise/then", "then(onFinally, onFinally)")}}. Tuy nhiên, có một vài sự khác biệt:

- Khi tạo một hàm inline, bạn có thể truyền nó một lần, thay vì bị buộc phải khai báo hai lần, hoặc tạo một biến cho nó.
- Callback `onFinally` không nhận bất kỳ đối số nào. Use case này dành cho khi bạn _không quan tâm_ đến lý do từ chối hoặc giá trị fulfillment, vì vậy không cần cung cấp nó.
- Một lời gọi `finally()` thường minh bạch và phản ánh trạng thái cuối cùng của promise gốc. Ví dụ:
  - Không giống như `Promise.resolve(2).then(() => 77, () => 77)`, trả về một promise cuối cùng được fulfilled với giá trị `77`, `Promise.resolve(2).finally(() => 77)` trả về một promise cuối cùng được fulfilled với giá trị `2`.
  - Tương tự, không giống như `Promise.reject(3).then(() => 88, () => 88)`, trả về một promise cuối cùng được fulfilled với giá trị `88`, `Promise.reject(3).finally(() => 88)` trả về một promise cuối cùng bị từ chối với lý do `3`.

> [!NOTE]
> Một `throw` (hoặc trả về một promise bị từ chối) trong callback `finally` vẫn từ chối promise được trả về. Ví dụ, cả `Promise.reject(3).finally(() => { throw 99; })` và `Promise.reject(3).finally(() => Promise.reject(99))` đều từ chối promise được trả về với lý do `99`.

Giống như {{jsxref("Promise/catch", "catch()")}}, `finally()` nội bộ gọi phương thức `then` trên đối tượng mà nó được gọi. Nếu `onFinally` không phải là một hàm, `then()` được gọi với `onFinally` như là cả hai đối số — điều này, đối với {{jsxref("Promise.prototype.then()")}}, có nghĩa là không có trình xử lý hữu ích nào được đính kèm. Nếu không, `then()` được gọi với hai hàm được tạo nội bộ, hoạt động như sau:

> [!WARNING]
> Đây chỉ nhằm mục đích minh họa và không phải là polyfill.

```js
promise.then(
  (value) => Promise.resolve(onFinally()).then(() => value),
  (reason) =>
    Promise.resolve(onFinally()).then(() => {
      throw reason;
    }),
);
```

Vì `finally()` gọi `then()`, nó hỗ trợ phân lớp con. Hơn nữa, lưu ý lời gọi {{jsxref("Promise.resolve()")}} ở trên — trong thực tế, giá trị trả về của `onFinally()` được resolved bằng cùng thuật toán như `Promise.resolve()`, nhưng constructor thực tế được sử dụng để xây dựng promise đã resolved sẽ là lớp con. `finally()` lấy constructor này thông qua [`promise.constructor[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Symbol.species).

## Ví dụ

### Sử dụng finally()

```js
let isLoading = true;

fetch(myRequest)
  .then((response) => {
    const contentType = response.headers.get("content-type");
    if (contentType && contentType.includes("application/json")) {
      return response.json();
    }
    throw new TypeError("Oops, we haven't got JSON!");
  })
  .then((json) => {
    /* xử lý JSON của bạn thêm */
  })
  .catch((error) => {
    console.error(error); // dòng này cũng có thể ném ra, ví dụ khi console = {}
  })
  .finally(() => {
    isLoading = false;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Promise.prototype.finally` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- [es-shims polyfill của `Promise.prototype.finally`](https://www.npmjs.com/package/promise.prototype.finally)
- {{jsxref("Promise")}}
- {{jsxref("Promise.prototype.then()")}}
- {{jsxref("Promise.prototype.catch()")}}
