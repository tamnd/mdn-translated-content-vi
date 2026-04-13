---
title: "Worker: event error"
short-title: error
slug: Web/API/Worker/error_event
page-type: web-api-event
browser-compat: api.Worker.error_event
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("window_and_worker_except_service")}}

Event **`error`** của giao diện {{domxref("Worker")}} xảy ra khi có lỗi trong worker.

## Cú pháp

Sử dụng tên event trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính event handler.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại event

Một {{domxref("Event")}} chung.

## Ví dụ

Đoạn mã sau tạo một đối tượng {{domxref("Worker")}} bằng cách sử dụng hàm tạo {{domxref("Worker.Worker", "Worker()")}} và thiết lập một handler `onerror` trên đối tượng kết quả:

```js
const myWorker = new Worker("worker.js");

myWorker.onerror = (event) => {
  console.log("Có lỗi xảy ra với worker của bạn!");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt
