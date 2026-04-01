---
title: Promise() constructor
short-title: Promise()
slug: Web/JavaScript/Reference/Global_Objects/Promise/Promise
page-type: javascript-constructor
browser-compat: javascript.builtins.Promise.Promise
sidebar: jsref
---

Constructor **`Promise()`** tạo ra các đối tượng {{jsxref("Promise")}}. Nó chủ yếu được sử dụng để bọc các API dựa trên callback mà chưa hỗ trợ promise.

{{InteractiveExample("JavaScript Demo: Promise() constructor", "taller")}}

```js interactive-example
const promise1 = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("foo");
  }, 300);
});

promise1.then((value) => {
  console.log(value);
  // Expected output: "foo"
});

console.log(promise1);
// Expected output: [object Promise]
```

## Cú pháp

```js-nolint
new Promise(executor)
```

> [!NOTE]
> `Promise()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

- `executor`
  - : Một {{jsxref("function")}} được thực thi bởi constructor. Nó nhận hai hàm làm tham số: `resolveFunc` và `rejectFunc`. Bất kỳ lỗi nào được ném ra trong `executor` sẽ khiến promise bị từ chối, và giá trị trả về sẽ bị bỏ qua. Ngữ nghĩa của `executor` được mô tả chi tiết bên dưới.

### Giá trị trả về

Khi được gọi qua `new`, constructor `Promise` trả về một đối tượng promise. Đối tượng promise sẽ trở thành _resolved_ khi một trong hai hàm `resolveFunc` hoặc `rejectFunc` được gọi. Lưu ý rằng nếu bạn gọi `resolveFunc` và truyền một đối tượng promise khác làm đối số, promise ban đầu có thể được gọi là "resolved", nhưng vẫn chưa "settled". Xem [mô tả về Promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#description) để biết thêm giải thích.

## Mô tả

Theo truyền thống (trước promise), các tác vụ bất đồng bộ được thiết kế như callback.

```js
readFile("./data.txt", (error, result) => {
  // Callback này sẽ được gọi khi tác vụ hoàn thành, với
  // `error` hoặc `result` cuối cùng. Bất kỳ thao tác nào phụ thuộc vào
  // kết quả phải được định nghĩa trong callback này.
});
// Code ở đây được thực thi ngay lập tức sau khi yêu cầu `readFile`
// được kích hoạt. Nó không chờ callback được gọi, do đó
// làm cho `readFile` "bất đồng bộ".
```

Để tận dụng cải thiện khả năng đọc và các tính năng ngôn ngữ được cung cấp bởi promise, constructor `Promise()` cho phép chuyển đổi API dựa trên callback thành API dựa trên promise.

> [!NOTE]
> Nếu tác vụ của bạn đã dựa trên promise, bạn có thể không cần constructor `Promise()`.

`executor` là code tùy chỉnh liên kết kết quả trong một callback với một promise. Bạn, lập trình viên, viết `executor`. Chữ ký của nó dự kiến là:

```js
function executor(resolveFunc, rejectFunc) {
  // Thông thường, một số thao tác bất đồng bộ chấp nhận một callback,
  // như hàm `readFile` ở trên
}
```

`resolveFunc` và `rejectFunc` cũng là các hàm, và bạn có thể đặt cho chúng bất kỳ tên thực tế nào bạn muốn. Chữ ký của chúng đơn giản: chúng chấp nhận một tham số duy nhất của bất kỳ kiểu nào.

```js
resolveFunc(value); // gọi khi resolved
rejectFunc(reason); // gọi khi rejected
```

Tham số `value` được truyền vào `resolveFunc` có thể là một đối tượng promise khác, trong trường hợp đó, trạng thái của promise mới được xây dựng sẽ được "khóa vào" với promise được truyền (như là một phần của [resolution](#hàm_resolve) promise). `rejectFunc` có ngữ nghĩa gần với câu lệnh [`throw`](/en-US/docs/Web/JavaScript/Reference/Statements/throw), vì vậy `reason` thường là một thực thể [`Error`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error). Nếu `value` hoặc `reason` bị bỏ qua, promise sẽ được fulfilled/rejected với `undefined`.

Trạng thái hoàn thành của `executor` có hiệu lực hạn chế đối với trạng thái của promise:

- Giá trị trả về của `executor` bị bỏ qua. Các câu lệnh `return` trong `executor` chỉ ảnh hưởng đến luồng điều khiển và thay đổi việc một phần của hàm có được thực thi hay không, nhưng không có bất kỳ ảnh hưởng nào đến giá trị fulfillment của promise. Nếu `executor` thoát và không thể gọi `resolveFunc` hoặc `rejectFunc` trong tương lai (ví dụ không có tác vụ bất đồng bộ nào được lên lịch), thì promise vẫn đang chờ xử lý mãi mãi.
- Nếu một lỗi được ném ra trong `executor`, promise sẽ bị từ chối, trừ khi `resolveFunc` hoặc `rejectFunc` đã được gọi rồi.

> [!NOTE]
> Sự tồn tại của các promise đang chờ xử lý không ngăn chương trình thoát. Nếu vòng lặp sự kiện rỗng, chương trình thoát mặc dù có promise đang chờ xử lý (vì những điều đó nhất thiết là chờ đợi mãi mãi).

Đây là tóm tắt về luồng thông thường:

1. Tại thời điểm constructor tạo ra đối tượng `Promise` mới, nó cũng tạo ra một cặp hàm tương ứng cho `resolveFunc` và `rejectFunc`; chúng được "gắn kết" với đối tượng `Promise`.
2. `executor` thường bọc một số thao tác bất đồng bộ cung cấp API dựa trên callback. Callback (cái được truyền vào API dựa trên callback gốc) được định nghĩa trong code `executor`, vì vậy nó có quyền truy cập vào `resolveFunc` và `rejectFunc`.
3. `executor` được gọi đồng bộ (ngay khi `Promise` được xây dựng) với các hàm `resolveFunc` và `rejectFunc` làm đối số.
4. Code trong `executor` có cơ hội thực hiện một số thao tác. Việc hoàn thành cuối cùng của tác vụ bất đồng bộ được thông báo với thực thể promise thông qua tác dụng phụ do `resolveFunc` hoặc `rejectFunc` gây ra. Tác dụng phụ là đối tượng `Promise` trở thành "resolved".
   - Nếu `resolveFunc` được gọi trước, giá trị được truyền vào sẽ được [resolved](#hàm_resolve). Promise có thể vẫn đang chờ xử lý (trong trường hợp một [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) khác được truyền vào), trở thành fulfilled (trong hầu hết các trường hợp giá trị không phải thenable được truyền vào), hoặc trở thành rejected (trong trường hợp giá trị resolution không hợp lệ).
   - Nếu `rejectFunc` được gọi trước, promise ngay lập tức bị từ chối.
   - Một khi một trong các hàm resolving (`resolveFunc` hoặc `rejectFunc`) được gọi, promise vẫn resolved. Chỉ cuộc gọi đầu tiên đến `resolveFunc` hoặc `rejectFunc` ảnh hưởng đến trạng thái cuối cùng của promise, và các cuộc gọi tiếp theo đến một trong hai hàm không thể thay đổi giá trị fulfillment/lý do rejection cũng như không thể chuyển trạng thái cuối cùng của nó từ "fulfilled" sang "rejected" hay ngược lại.
   - Nếu `executor` thoát bằng cách ném ra một lỗi, thì promise bị từ chối. Tuy nhiên, lỗi bị bỏ qua nếu một trong các hàm resolving đã được gọi (vì vậy promise đã được resolved rồi).
   - Việc resolve promise không nhất thiết gây ra promise trở thành fulfilled hoặc rejected (tức là settled). Promise vẫn có thể đang chờ xử lý vì nó được resolved với một thenable khác, nhưng trạng thái cuối cùng của nó sẽ khớp với thenable đã được resolved.
5. Một khi promise ổn định, nó (bất đồng bộ) gọi bất kỳ trình xử lý tiếp theo nào được liên kết thông qua {{jsxref("Promise/then", "then()")}}, {{jsxref("Promise/catch", "catch()")}}, hoặc {{jsxref("Promise/finally", "finally()")}}. Giá trị fulfillment cuối cùng hoặc lý do rejection được truyền vào việc gọi các trình xử lý fulfillment và rejection như một tham số đầu vào (xem [Promise được kết nối chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#chained_promises)).

Ví dụ, API `readFile` dựa trên callback ở trên có thể được chuyển đổi thành API dựa trên promise.

```js
const readFilePromise = (path) =>
  new Promise((resolve, reject) => {
    readFile(path, (error, result) => {
      if (error) {
        reject(error);
      } else {
        resolve(result);
      }
    });
  });

readFilePromise("./data.txt")
  .then((result) => console.log(result))
  .catch((error) => console.error("Failed to read data"));
```

Các callback `resolve` và `reject` chỉ có sẵn trong phạm vi của hàm executor, có nghĩa là bạn không thể truy cập chúng sau khi promise được xây dựng. Nếu bạn muốn xây dựng promise trước khi quyết định cách giải quyết nó, bạn có thể sử dụng phương thức {{jsxref("Promise.withResolvers()")}} thay thế, phương thức này tiết lộ các hàm `resolve` và `reject`.

### Hàm resolve

Hàm `resolve` có các hành vi sau:

- Nếu nó được gọi với cùng giá trị là promise mới được tạo (promise mà nó "gắn kết với"), promise bị từ chối với {{jsxref("TypeError")}}.
- Nếu nó được gọi với giá trị không phải [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables) (một kiểu nguyên thủy, hoặc một đối tượng có thuộc tính `then` không thể gọi được, bao gồm khi thuộc tính không có mặt), promise ngay lập tức được fulfilled với giá trị đó.
- Nếu nó được gọi với giá trị thenable (bao gồm thực thể `Promise` khác), thì phương thức `then` của thenable được lưu và gọi trong tương lai (nó luôn được gọi bất đồng bộ). Phương thức `then` sẽ được gọi với hai callback, là hai hàm mới với các hành vi giống hệt như `resolveFunc` và `rejectFunc` được truyền vào hàm `executor`. Nếu gọi phương thức `then` ném ra lỗi, thì promise hiện tại bị từ chối với lỗi được ném ra.

Trong trường hợp cuối cùng, điều đó có nghĩa là code như:

```js
new Promise((resolve, reject) => {
  resolve(thenable);
});
```

Về cơ bản tương đương với:

```js
new Promise((resolve, reject) => {
  try {
    thenable.then(
      (value) => resolve(value),
      (reason) => reject(reason),
    );
  } catch (e) {
    reject(e);
  }
});
```

Ngoại trừ trong trường hợp `resolve(thenable)`:

1. `resolve` được gọi đồng bộ, vì vậy việc gọi `resolve` hoặc `reject` lại không có hiệu lực, ngay cả khi các trình xử lý được đính kèm thông qua `anotherPromise.then()` chưa được gọi.
2. Phương thức `then` được gọi bất đồng bộ, vì vậy promise sẽ không bao giờ được resolve ngay lập tức nếu một thenable được truyền vào.

Vì `resolve` được gọi lại với bất cứ thứ gì `thenable.then()` truyền vào nó như `value`, hàm resolver có thể làm phẳng các thenable lồng nhau, nơi một thenable gọi trình xử lý `onFulfilled` của nó với một thenable khác. Hiệu quả là trình xử lý fulfillment của một promise thực sự sẽ không bao giờ nhận được một thenable như giá trị fulfillment của nó.

## Ví dụ

### Chuyển đổi API dựa trên callback thành API dựa trên promise

Để cung cấp cho một hàm chức năng promise, hãy để nó trả về một promise bằng cách gọi các hàm `resolve` và `reject` vào đúng thời điểm.

```js
function myAsyncFunction(url) {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.onload = () => resolve(xhr.responseText);
    xhr.onerror = () => reject(xhr.statusText);
    xhr.send();
  });
}
```

### Hiệu ứng của việc gọi resolveFunc

Gọi `resolveFunc` khiến promise trở thành resolved, vì vậy việc gọi `resolveFunc` hoặc `rejectFunc` lại không có hiệu lực. Tuy nhiên, promise có thể ở bất kỳ trạng thái nào trong số: pending, fulfilled, hoặc rejected.

Promise `pendingResolved` này được resolved tại thời điểm nó được tạo, vì nó đã được "khóa vào" để khớp với trạng thái cuối cùng của promise bên trong, và việc gọi `resolveOuter` hoặc `rejectOuter` hoặc ném ra lỗi sau đó trong executor không ảnh hưởng đến trạng thái cuối cùng của nó. Tuy nhiên, promise bên trong vẫn đang chờ xử lý cho đến 100ms sau, vì vậy promise ngoài cũng đang chờ xử lý:

```js
const pendingResolved = new Promise((resolveOuter, rejectOuter) => {
  resolveOuter(
    new Promise((resolveInner) => {
      setTimeout(() => {
        resolveInner("inner");
      }, 100);
    }),
  );
});
```

Promise `fulfilledResolved` này trở thành fulfilled ngay khi nó được resolved, vì nó được resolved với một giá trị không phải thenable. Tuy nhiên, khi nó được tạo ra, nó chưa được resolved, vì cả `resolve` lẫn `reject` đều chưa được gọi. Một promise chưa được resolved nhất thiết phải đang chờ xử lý:

```js
const fulfilledResolved = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("outer");
  }, 100);
});
```

Gọi `rejectFunc` rõ ràng khiến promise bị từ chối. Tuy nhiên, cũng có hai cách để khiến promise ngay lập tức bị từ chối ngay cả khi callback `resolveFunc` được gọi.

```js
// 1. Resolve với chính promise đó
const rejectedResolved1 = new Promise((resolve) => {
  // Lưu ý: resolve phải được gọi bất đồng bộ,
  // để biến rejectedResolved1 được khởi tạo
  setTimeout(() => resolve(rejectedResolved1)); // TypeError: Chaining cycle detected for promise #<Promise>
});

// 2. Resolve với một đối tượng ném ra khi truy cập thuộc tính `then`
const rejectedResolved2 = new Promise((resolve) => {
  resolve({
    get then() {
      throw new Error("Can't get then property");
    },
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Promise` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- Hướng dẫn [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises)
- {{jsxref("Promise.withResolvers()")}}
