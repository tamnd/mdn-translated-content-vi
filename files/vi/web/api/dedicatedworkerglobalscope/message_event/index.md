---
title: "DedicatedWorkerGlobalScope: message event"
short-title: message
slug: Web/API/DedicatedWorkerGlobalScope/message_event
page-type: web-api-event
browser-compat: api.DedicatedWorkerGlobalScope.message_event
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Sự kiện `message` được kích hoạt trên một đối tượng {{domxref('DedicatedWorkerGlobalScope')}} khi worker nhận được một thông điệp từ cha của nó (tức là khi phía cha gửi thông điệp bằng [`Worker.postMessage()`](/en-US/docs/Web/API/Worker/postMessage)).

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi bên phát thông điệp.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho origin của bên phát thông điệp.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho ID duy nhất của sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là đối tượng {{domxref("Window")}}, {{domxref("MessagePort")}} hoặc {{domxref("ServiceWorker")}}) đại diện cho bên phát thông điệp.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng gắn với kênh mà thông điệp đang được gửi qua (khi phù hợp, ví dụ trong channel messaging hoặc khi gửi thông điệp tới shared worker).

## Ví dụ

Đoạn mã sau cho thấy việc tạo một đối tượng {{domxref("Worker")}} bằng hàm tạo {{domxref("Worker.Worker", "Worker()")}}. Thông điệp được gửi tới worker khi giá trị bên trong ô nhập liệu `first` thay đổi. Một bộ xử lý {{domxref("Worker.message_event", "onmessage")}} cũng có mặt để xử lý các thông điệp được gửi ngược lại từ worker.

```js
// main.js

const myWorker = new Worker("worker.js");

first.onchange = () => {
  myWorker.postMessage([first.value, second.value]);
  console.log("Message posted to worker");
};

// worker.js

self.onmessage = (e) => {
  console.log("Message received from main script");
  const workerResult = `Result: ${e.data[0] * e.data[1]}`;
  console.log("Posting message back to main script");
  postMessage(workerResult);
};
```

Trong script `main.js`, một bộ xử lý `onmessage` được dùng để xử lý các thông điệp từ worker script:

```js
// main.js

myWorker.onmessage = (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
};
```

Hoặc, script có thể lắng nghe thông điệp bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
// worker.js

self.addEventListener("message", (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
});
```

Lưu ý rằng trong script chính, `onmessage` phải được gọi trên `myWorker`, trong khi bên trong worker script bạn chỉ cần `onmessage` vì worker về bản chất chính là phạm vi global ({{domxref("DedicatedWorkerGlobalScope")}}).

Để xem ví dụ đầy đủ, hãy xem [Ví dụ worker dedicated cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-web-worker) ([chạy worker dedicated](https://mdn.github.io/dom-examples/web-workers/simple-web-worker/)).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DedicatedWorkerGlobalScope")}}
- {{domxref("WorkerGlobalScope")}}
- Các sự kiện liên quan: [`messageerror`](/en-US/docs/Web/API/DedicatedWorkerGlobalScope/messageerror_event)
- [`Worker.postMessage()`](/en-US/docs/Web/API/Worker/postMessage)
- [Using channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
