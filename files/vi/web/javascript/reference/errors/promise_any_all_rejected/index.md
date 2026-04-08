---
title: "AggregateError: No Promise in Promise.any was resolved"
slug: Web/JavaScript/Reference/Errors/Promise_any_all_rejected
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "No Promise in Promise.any was resolved" xảy ra khi tất cả các promise được truyền vào {{jsxref("Promise.any()")}} đều bị từ chối. Đây là trường hợp sử dụng duy nhất có sẵn của {{jsxref("AggregateError")}}.

## Thông báo

```plain
AggregateError: All promises were rejected (V8-based)
AggregateError: No Promise in Promise.any was resolved (Firefox)
AggregateError (Safari)
```

## Loại lỗi

{{jsxref("AggregateError")}}

## Điều gì đã xảy ra?

`Promise.any()` chỉ từ chối khi tất cả các promise được truyền vào đều bị từ chối. Bạn nên truy cập {{jsxref("AggregateError/errors", "errors")}} để lấy mảng các lý do từ chối. Xem [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises#error_handling) để biết thêm thông tin về cách xử lý các promise bị từ chối bất đồng bộ. Lỗi này cũng được tạo ra khi `Promise.any()` nhận một iterable rỗng.

## Ví dụ

### Iterable rỗng

```js
Promise.any([]).catch((error) => {
  console.error(error); // AggregateError: No Promise in Promise.any was resolved
});
```

### Xử lý tất cả các từ chối

```js
const promises = [
  fetch("/data-location1"),
  fetch("/data-location1"),
  fetch("/data-location1"),
];

Promise.any(promises)
  .then((value) => console.log(value))
  .catch((error) => {
    // Không có fetch nào thành công
    for (const e of error.errors) {
      console.error(e);
    }
  });

// Sử dụng await
async function fetchFirstSuccessful() {
  try {
    const value = await Promise.any(promises);
    console.log(value);
  } catch (error) {
    for (const e of error.errors) {
      console.error(e);
    }
  }
}
```

## Xem thêm

- {{jsxref("AggregateError")}}
- {{jsxref("Promise.any()")}}
