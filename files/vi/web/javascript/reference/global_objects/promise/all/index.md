---
title: Promise.all()
short-title: all()
slug: Web/JavaScript/Reference/Global_Objects/Promise/all
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.all
sidebar: jsref
---

Phương thức tĩnh **`Promise.all()`** nhận một iterable của các promise làm đầu vào và trả về một {{jsxref("Promise")}} duy nhất. Promise được trả về này thực hiện khi tất cả các promise trong đầu vào được thực hiện (kể cả khi một iterable rỗng được truyền vào), với một mảng các giá trị fulfillment. Nó bị từ chối khi bất kỳ promise nào trong đầu vào bị từ chối, với lý do từ chối đầu tiên này.

{{InteractiveExample("JavaScript Demo: Promise.all()")}}

```js interactive-example
const promise1 = Promise.resolve(3);
const promise2 = 42;
const promise3 = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, "foo");
});

Promise.all([promise1, promise2, promise3]).then((values) => {
  console.log(values);
});
// Expected output: Array [3, 42, "foo"]
```

## Cú pháp

```js-nolint
Promise.all(iterable)
```

### Tham số

- `iterable`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) của các promise.

### Giá trị trả về

Một {{jsxref("Promise")}} là:

- **Đã fulfilled ngay lập tức**, nếu `iterable` được truyền vào là rỗng.
- **Được fulfilled bất đồng bộ**, khi tất cả các promise trong `iterable` đã cho được thực hiện. Giá trị fulfillment là một mảng các giá trị fulfillment, theo thứ tự của các promise được truyền vào, bất kể thứ tự hoàn thành. Nếu `iterable` được truyền vào không rỗng nhưng không chứa promise đang chờ xử lý, promise được trả về vẫn được fulfilled bất đồng bộ (thay vì đồng bộ).
- **Bị từ chối bất đồng bộ**, khi bất kỳ promise nào trong `iterable` đã cho bị từ chối. Lý do từ chối là lý do từ chối của promise đầu tiên bị từ chối.

## Mô tả

Phương thức `Promise.all()` là một trong các phương thức [đồng thời promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#promise_concurrency). Nó hữu ích để tổng hợp kết quả của nhiều promise. Nó thường được sử dụng khi có nhiều tác vụ bất đồng bộ liên quan mà code tổng thể dựa vào để hoạt động thành công — tất cả đều chúng ta muốn được thực hiện trước khi thực thi code tiếp tục.

`Promise.all()` sẽ từ chối ngay lập tức khi **bất kỳ** promise đầu vào nào bị từ chối. Ngược lại, promise được trả về bởi {{jsxref("Promise.allSettled()")}} sẽ chờ tất cả các promise đầu vào hoàn thành, bất kể một promise có bị từ chối hay không. Sử dụng `allSettled()` nếu bạn cần kết quả cuối cùng của mỗi promise trong iterable đầu vào.

## Ví dụ

### Sử dụng Promise.all()

`Promise.all` chờ tất cả các fulfillment (hoặc rejection đầu tiên).

```js
const p1 = Promise.resolve(3);
const p2 = 1337;
const p3 = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("foo");
  }, 100);
});

Promise.all([p1, p2, p3]).then((values) => {
  console.log(values); // [3, 1337, "foo"]
});
```

Nếu `iterable` chứa các giá trị không phải promise, chúng sẽ bị bỏ qua, nhưng vẫn được tính trong mảng giá trị promise được trả về (nếu promise được fulfilled):

```js
// Tất cả các giá trị đều không phải promise, vì vậy promise được trả về được fulfilled
const p = Promise.all([1, 2, 3]);
// Promise đầu vào duy nhất đã được fulfilled,
// vì vậy promise được trả về được fulfilled
const p2 = Promise.all([1, 2, 3, Promise.resolve(444)]);
// Một (và duy nhất) promise đầu vào bị từ chối,
// vì vậy promise được trả về bị từ chối
const p3 = Promise.all([1, 2, 3, Promise.reject(new Error("bad"))]);

// Sử dụng setTimeout, chúng ta có thể thực thi code sau khi hàng đợi rỗng
setTimeout(() => {
  console.log(p);
  console.log(p2);
  console.log(p3);
});

// Logs:
// Promise { <state>: "fulfilled", <value>: Array[3] }
// Promise { <state>: "fulfilled", <value>: Array[4] }
// Promise { <state>: "rejected", <reason>: Error: bad }
```

### Destructuring kết quả

Bạn sẽ thấy [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) rất hữu ích nếu bạn đang nhóm một số lượng tác vụ đã biết cùng nhau.

```js
// Với then()
Promise.all([p1, p2, p3]).then(([a, b, c]) => {
  console.log(a, b, c); // 3 1337 "foo"
});

// Với await
const [a, b, c] = await Promise.all([p1, p2, p3]);
```

Hãy cẩn thận: nếu thứ tự của các promise gốc và các biến kết quả không khớp, bạn có thể gặp phải các lỗi tinh vi.

### Tính bất đồng bộ hoặc đồng bộ của Promise.all

Ví dụ sau minh họa tính bất đồng bộ của `Promise.all` khi một `iterable` không rỗng được truyền vào:

```js
// Truyền một mảng các promise đã được resolved,
// để kích hoạt Promise.all sớm nhất có thể
const resolvedPromisesArray = [Promise.resolve(33), Promise.resolve(44)];

const p = Promise.all(resolvedPromisesArray);
// Ghi lại giá trị của p ngay lập tức
console.log(p);

// Sử dụng setTimeout, chúng ta có thể thực thi code sau khi hàng đợi rỗng
setTimeout(() => {
  console.log("the queue is now empty");
  console.log(p);
});

// Logs, theo thứ tự:
// Promise { <state>: "pending" }
// the queue is now empty
// Promise { <state>: "fulfilled", <value>: Array[2] }
```

Điều tương tự xảy ra nếu `Promise.all` bị từ chối:

```js
const mixedPromisesArray = [
  Promise.resolve(33),
  Promise.reject(new Error("bad")),
];
const p = Promise.all(mixedPromisesArray);
console.log(p);
setTimeout(() => {
  console.log("the queue is now empty");
  console.log(p);
});

// Logs:
// Promise { <state>: "pending" }
// the queue is now empty
// Promise { <state>: "rejected", <reason>: Error: bad }
```

`Promise.all` resolves đồng bộ nếu và chỉ nếu `iterable` được truyền vào là rỗng:

```js
const p = Promise.all([]); // Sẽ được resolved ngay lập tức
const p2 = Promise.all([1337, "hi"]); // Các giá trị không phải promise bị bỏ qua, nhưng việc đánh giá được thực hiện bất đồng bộ
console.log(p);
console.log(p2);
setTimeout(() => {
  console.log("the queue is now empty");
  console.log(p2);
});

// Logs:
// Promise { <state>: "fulfilled", <value>: Array[0] }
// Promise { <state>: "pending" }
// the queue is now empty
// Promise { <state>: "fulfilled", <value>: Array[2] }
```

### Sử dụng Promise.all() với async functions

Trong [async functions](/en-US/docs/Web/JavaScript/Reference/Statements/async_function), rất phổ biến khi "over-await" code của bạn. Ví dụ, cho các hàm sau:

```js
function promptForDishChoice() {
  return new Promise((resolve, reject) => {
    const dialog = document.createElement("dialog");
    dialog.innerHTML = `
<form method="dialog">
  <p>What would you like to eat?</p>
  <select>
    <option value="pizza">Pizza</option>
    <option value="pasta">Pasta</option>
    <option value="salad">Salad</option>
  </select>
  <menu>
    <li><button value="cancel">Cancel</button></li>
    <li><button type="submit" value="ok">OK</button></li>
  </menu>
</form>
    `;
    dialog.addEventListener("close", () => {
      if (dialog.returnValue === "ok") {
        resolve(dialog.querySelector("select").value);
      } else {
        reject(new Error("User cancelled dialog"));
      }
    });
    document.body.appendChild(dialog);
    dialog.showModal();
  });
}

async function fetchPrices() {
  const response = await fetch("/prices");
  return await response.json();
}
```

Bạn có thể viết một hàm như thế này:

```js example-bad
async function getPrice() {
  const choice = await promptForDishChoice();
  const prices = await fetchPrices();
  return prices[choice];
}
```

Tuy nhiên, lưu ý rằng việc thực thi `promptForDishChoice` và `fetchPrices` không phụ thuộc vào kết quả của nhau. Trong khi người dùng đang chọn món ăn, việc tải giá có thể được thực hiện ở nền, nhưng trong code trên, toán tử [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) khiến async function tạm dừng cho đến khi lựa chọn được thực hiện, rồi lại cho đến khi giá được tải. Chúng ta có thể sử dụng `Promise.all` để chạy chúng đồng thời, sao cho người dùng không phải chờ giá được tải trước khi kết quả được đưa ra:

```js example-good
async function getPrice() {
  const [choice, prices] = await Promise.all([
    promptForDishChoice(),
    fetchPrices(),
  ]);
  return prices[choice];
}
```

`Promise.all` là lựa chọn tốt nhất của [phương thức đồng thời](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#promise_concurrency) ở đây, vì xử lý lỗi rất trực quan — nếu bất kỳ promise nào bị từ chối, kết quả không còn khả dụng nữa, vì vậy toàn bộ biểu thức `await` sẽ ném ra.

`Promise.all` chấp nhận một iterable của các promise, vì vậy nếu bạn đang sử dụng nó để chạy một vài async functions đồng thời, bạn cần gọi các async function và sử dụng các promise được trả về. Việc trực tiếp truyền các hàm vào `Promise.all` không hoạt động, vì chúng không phải là promise.

```js example-bad
async function getPrice() {
  const [choice, prices] = await Promise.all([
    promptForDishChoice,
    fetchPrices,
  ]);
  // `choice` và `prices` vẫn là các async function gốc;
  // Promise.all() không làm gì với các giá trị không phải promise
}
```

### Hành vi fail-fast của Promise.all

`Promise.all` bị từ chối nếu bất kỳ phần tử nào bị từ chối. Ví dụ, nếu bạn truyền vào bốn promise resolve sau một khoảng thời gian chờ và một promise bị từ chối ngay lập tức, thì `Promise.all` sẽ bị từ chối ngay lập tức.

```js
const p1 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("one"), 1000);
});
const p2 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("two"), 2000);
});
const p3 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("three"), 3000);
});
const p4 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("four"), 4000);
});
const p5 = new Promise((resolve, reject) => {
  reject(new Error("reject"));
});

// Sử dụng .catch:
Promise.all([p1, p2, p3, p4, p5])
  .then((values) => {
    console.log(values);
  })
  .catch((error) => {
    console.error(error.message);
  });

// Logs:
// "reject"
```

Có thể thay đổi hành vi này bằng cách xử lý các rejection có thể xảy ra:

```js
const p1 = new Promise((resolve, reject) => {
  setTimeout(() => resolve("p1_delayed_resolution"), 1000);
});

const p2 = new Promise((resolve, reject) => {
  reject(new Error("p2_immediate_rejection"));
});

Promise.all([p1.catch((error) => error), p2.catch((error) => error)]).then(
  (values) => {
    console.log(values[0]); // "p1_delayed_resolution"
    console.error(values[1]); // "Error: p2_immediate_rejection"
  },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- {{jsxref("Promise.allSettled()")}}
- {{jsxref("Promise.any()")}}
- {{jsxref("Promise.race()")}}
