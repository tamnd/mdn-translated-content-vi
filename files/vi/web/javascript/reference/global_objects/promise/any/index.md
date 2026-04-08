---
title: Promise.any()
short-title: any()
slug: Web/JavaScript/Reference/Global_Objects/Promise/any
page-type: javascript-static-method
browser-compat: javascript.builtins.Promise.any
sidebar: jsref
---

Phương thức tĩnh **`Promise.any()`** nhận một iterable của các promise làm đầu vào và trả về một {{jsxref("Promise")}} duy nhất. Promise được trả về này thực hiện khi bất kỳ promise nào trong đầu vào được thực hiện, với giá trị fulfillment đầu tiên này. Nó bị từ chối khi tất cả các promise trong đầu vào bị từ chối (kể cả khi một iterable rỗng được truyền vào), với một {{jsxref("AggregateError")}} chứa một mảng các lý do từ chối.

{{InteractiveExample("JavaScript Demo: Promise.any()")}}

```js interactive-example
const promise1 = Promise.reject(new Error("error"));
const promise2 = new Promise((resolve) => setTimeout(resolve, 100, "quick"));
const promise3 = new Promise((resolve) => setTimeout(resolve, 500, "slow"));

const promises = [promise1, promise2, promise3];

Promise.any(promises).then((value) => console.log(value));

// Expected output: "quick"
```

## Cú pháp

```js-nolint
Promise.any(iterable)
```

### Tham số

- `iterable`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) của các promise.

### Giá trị trả về

Một {{jsxref("Promise")}} là:

- **Đã bị từ chối ngay lập tức**, nếu `iterable` được truyền vào là rỗng.
- **Được fulfilled bất đồng bộ**, khi bất kỳ promise nào trong `iterable` đã cho được thực hiện. Giá trị fulfillment là giá trị fulfillment của promise đầu tiên được thực hiện.
- **Bị từ chối bất đồng bộ**, khi tất cả các promise trong `iterable` đã cho bị từ chối. Lý do từ chối là một {{jsxref("AggregateError")}} chứa một mảng các lý do từ chối trong thuộc tính `errors` của nó. Các lỗi theo thứ tự của các promise được truyền vào, bất kể thứ tự hoàn thành. Nếu `iterable` được truyền vào không rỗng nhưng không chứa promise đang chờ xử lý, promise được trả về vẫn bị từ chối bất đồng bộ (thay vì đồng bộ).

## Mô tả

Phương thức `Promise.any()` là một trong các phương thức [đồng thời promise](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#promise_concurrency). Phương thức này hữu ích để trả về promise đầu tiên được thực hiện. Nó short-circuits sau khi một promise được thực hiện, vì vậy nó không chờ các promise khác hoàn thành một khi nó đã tìm thấy một promise được thực hiện.

Không giống như {{jsxref("Promise.all()")}}, trả về một _mảng_ các giá trị fulfillment, chúng ta chỉ nhận được một giá trị fulfillment (giả sử ít nhất một promise được thực hiện). Điều này có thể có lợi nếu chúng ta chỉ cần một promise được thực hiện nhưng không quan tâm promise nào. Lưu ý sự khác biệt khác: phương thức này từ chối khi nhận được một _iterable rỗng_, vì thực ra iterable không chứa mục nào được thực hiện. Bạn có thể so sánh `Promise.any()` và `Promise.all()` với {{jsxref("Array.prototype.some()")}} và {{jsxref("Array.prototype.every()")}}.

Ngoài ra, không giống như {{jsxref("Promise.race()")}}, trả về giá trị _settled_ đầu tiên (fulfilled hoặc rejection), phương thức này trả về giá trị _fulfilled_ đầu tiên. Phương thức này bỏ qua tất cả các promise bị từ chối cho đến khi tìm thấy promise đầu tiên được thực hiện.

## Ví dụ

### Sử dụng Promise.any()

`Promise.any()` được fulfilled với promise đầu tiên được thực hiện, ngay cả khi một promise bị từ chối trước. Điều này trái ngược với {{jsxref("Promise.race()")}}, fulfilled hoặc rejected với promise đầu tiên ổn định.

```js
const pErr = new Promise((resolve, reject) => {
  reject(new Error("Always fails"));
});

const pSlow = new Promise((resolve, reject) => {
  setTimeout(resolve, 500, "Done eventually");
});

const pFast = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, "Done quick");
});

Promise.any([pErr, pSlow, pFast]).then((value) => {
  console.log(value);
  // pFast được thực hiện trước
});
// Logs:
// Done quick
```

### Từ chối với AggregateError

`Promise.any()` từ chối với một {{jsxref("AggregateError")}} nếu không có promise nào được thực hiện.

```js
const failure = new Promise((resolve, reject) => {
  reject(new Error("Always fails"));
});

Promise.any([failure]).catch((err) => {
  console.log(err);
});
// AggregateError: No Promise in Promise.any was resolved
```

### Hiển thị hình ảnh đầu tiên được tải

Trong ví dụ này, chúng ta có một hàm tải một hình ảnh và trả về một blob. Chúng ta sử dụng `Promise.any()` để tải một vài hình ảnh và hiển thị hình ảnh đầu tiên có sẵn (tức là hình ảnh mà promise của nó đã được resolved).

```js
async function fetchAndDecode(url, description) {
  const res = await fetch(url);
  if (!res.ok) {
    throw new Error(`HTTP error! status: ${res.status}`);
  }
  const data = await res.blob();
  return [data, description];
}

const coffee = fetchAndDecode("coffee.jpg", "Coffee");
const tea = fetchAndDecode("tea.jpg", "Tea");

Promise.any([coffee, tea])
  .then(([blob, description]) => {
    const objectURL = URL.createObjectURL(blob);
    const image = document.createElement("img");
    image.src = objectURL;
    image.alt = description;
    document.body.appendChild(image);
  })
  .catch((e) => {
    console.error(e);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Promise.any` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-promise)
- [es-shims polyfill của `Promise.any`](https://www.npmjs.com/package/promise.any)
- {{jsxref("Promise")}}
- {{jsxref("Promise.all()")}}
- {{jsxref("Promise.allSettled()")}}
- {{jsxref("Promise.race()")}}
