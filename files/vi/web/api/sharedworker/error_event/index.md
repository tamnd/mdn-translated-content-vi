---
title: "SharedWorker: sự kiện error"
short-title: error
slug: Web/API/SharedWorker/error_event
page-type: web-api-event
browser-compat: api.SharedWorker.error_event
---

{{APIRef("Web Workers API")}}

Sự kiện **`error`** của giao diện {{domxref("SharedWorker")}} xảy ra khi có lỗi trong worker.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Đoạn mã sau đây tạo một đối tượng {{domxref("SharedWorker")}} bằng constructor {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}} và thiết lập trình xử lý `onerror` trên đối tượng kết quả:

```js
const mySharedWorker = new SharedWorker("shared-worker.js");

mySharedWorker.onerror = (event) => {
  console.error("There is an error with your worker!");
};
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
