---
title: "SharedWorkerGlobalScope: connect event"
short-title: connect
slug: Web/API/SharedWorkerGlobalScope/connect_event
page-type: web-api-event
browser-compat: api.SharedWorkerGlobalScope.connect_event
---

{{APIRef("Web Workers API")}}

Sự kiện **`connect`** được kích hoạt trong shared worker tại {{domxref("SharedWorkerGlobalScope")}} của chúng khi một client mới kết nối.

Sự kiện này không thể hủy và không bubble.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("connect", (event) => { })

onconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi thực thể phát ra thông điệp.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho origin của thực thể phát ra thông điệp.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho mã định danh duy nhất của sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc {{domxref("ServiceWorker")}}) đại diện cho thực thể phát ra thông điệp.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng liên kết với kênh đang dùng để gửi thông điệp qua đó (khi phù hợp, ví dụ trong channel messaging hoặc khi gửi thông điệp tới shared worker).

## Ví dụ

Ví dụ này cho thấy một tệp shared worker - khi có kết nối tới worker từ luồng chính thông qua {{domxref("MessagePort")}}, bộ xử lý sự kiện `onconnect` sẽ chạy. Đối tượng sự kiện là một {{domxref("MessageEvent")}}.

Cổng kết nối có thể được tham chiếu thông qua tham số `ports` của đối tượng sự kiện; tham chiếu này có thể gắn một bộ xử lý `onmessage` để xử lý các thông điệp đi vào qua cổng, và phương thức `postMessage()` của nó có thể được dùng để gửi thông điệp ngược lại luồng chính bằng worker.

```js
self.onconnect = (e) => {
  const port = e.ports[0];

  port.onmessage = (e) => {
    const workerResult = `Result: ${e.data[0] * e.data[1]}`;
    port.postMessage(workerResult);
  };

  port.start();
};
```

Để có ví dụ chạy hoàn chỉnh, xem [Basic shared worker example](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) ([run shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/)).

### Tương đương addEventListener

Bạn cũng có thể thiết lập một bộ xử lý sự kiện bằng phương thức {{domxref("EventTarget/addEventListener", "addEventListener()")}}:

```js
self.addEventListener("connect", (e) => {
  const port = e.ports[0];

  port.onmessage = (e) => {
    const workerResult = `Result: ${e.data[0] * e.data[1]}`;
    port.postMessage(workerResult);
  };
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- {{domxref("SharedWorkerGlobalScope")}}
