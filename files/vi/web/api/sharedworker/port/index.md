---
title: "SharedWorker: thuộc tính port"
short-title: port
slug: Web/API/SharedWorker/port
page-type: web-api-instance-property
browser-compat: api.SharedWorker.port
---

{{APIRef("Web Workers API")}}

Thuộc tính **`port`** của giao diện {{domxref("SharedWorker")}}
trả về một đối tượng {{domxref("MessagePort")}} được sử dụng để giao tiếp và điều khiển
shared worker.

## Giá trị

Một đối tượng {{domxref("MessagePort")}}.

## Ví dụ

Đoạn mã sau đây cho thấy việc tạo một đối tượng `SharedWorker` bằng
constructor {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}. Nhiều
tập lệnh sau đó có thể truy cập worker thông qua một đối tượng {{domxref("MessagePort")}} được truy cập
bằng thuộc tính `SharedWorker.port` — cổng được khởi tạo bằng
phương thức `start()` của nó:

```js
const myWorker = new SharedWorker("worker.js");
myWorker.port.start();
```

Để biết ví dụ đầy đủ, hãy xem [ví dụ về shared worker cơ bản của chúng tôi](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) ([chạy shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/).)

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## Xem thêm

- {{domxref("SharedWorker")}}
