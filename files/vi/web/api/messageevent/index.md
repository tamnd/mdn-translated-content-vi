---
title: MessageEvent
slug: Web/API/MessageEvent
page-type: web-api-interface
browser-compat: api.MessageEvent
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Giao diện **`MessageEvent`** đại diện cho một thông điệp được nhận bởi một đối tượng mục tiêu.

Nó được sử dụng để đại diện cho các thông điệp trong:

- [Server-sent events](/en-US/docs/Web/API/Server-sent_events) (xem sự kiện {{domxref("EventSource.message_event", "message")}} của {{domxref("EventSource")}}).
- [Web sockets](/en-US/docs/Web/API/WebSockets_API) (xem sự kiện {{domxref("WebSocket.message_event", "message")}} của {{domxref("WebSocket")}}).
- Nhắn tin tài liệu chéo (xem {{domxref("Window.postMessage()")}} và sự kiện {{domxref("Window.message_event", "message")}} của {{domxref("Window")}}).
- [Channel messaging](/en-US/docs/Web/API/Channel_Messaging_API) (xem {{domxref("MessagePort.postMessage()")}} và sự kiện {{domxref("MessagePort.message_event", "message")}} của {{domxref("MessagePort")}}).
- Nhắn tin worker/tài liệu chéo (xem hai mục trên, nhưng cũng xem {{domxref("Worker.postMessage()")}}, sự kiện {{domxref("Worker.message_event", "message")}} của {{domxref("Worker")}}, sự kiện {{domxref("ServiceWorkerGlobalScope.message_event", "message")}} của {{domxref("ServiceWorkerGlobalScope")}}, v.v.)
- [Broadcast channels](/en-US/docs/Web/API/Broadcast_Channel_API) (xem {{domxref("BroadcastChannel.postMessage()")}} và sự kiện {{domxref("BroadcastChannel.message_event", "message")}} của {{domxref("BroadcastChannel")}}).
- Các kênh dữ liệu WebRTC (xem sự kiện {{domxref("RTCDataChannel.message_event", "message")}} của {{domxref("RTCDataChannel")}}).

Hành động được kích hoạt bởi sự kiện này được định nghĩa trong một hàm được đặt làm trình xử lý sự kiện cho sự kiện `message` liên quan.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MessageEvent.MessageEvent", "MessageEvent()")}}
  - : Tạo một `MessageEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha của nó, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi người phát thông điệp.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho nguồn gốc của người phát thông điệp.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho ID duy nhất cho sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc đối tượng {{domxref("ServiceWorker")}}) đại diện cho người phát thông điệp.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} chứa tất cả các đối tượng {{domxref("MessagePort")}} được gửi kèm với thông điệp, theo thứ tự.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ lớp cha của nó, {{domxref("Event")}}._

- {{domxref("MessageEvent.initMessageEvent","initMessageEvent()")}} {{deprecated_inline}}
  - : Khởi tạo một message event. **Đừng sử dụng điều này nữa** — **hãy sử dụng hàm khởi tạo {{domxref("MessageEvent.MessageEvent", "MessageEvent()")}} thay thế.**

## Ví dụ

Trong [ví dụ về shared worker cơ bản](https://github.com/mdn/dom-examples/tree/main/web-workers/simple-shared-worker) của chúng tôi ([chạy shared worker](https://mdn.github.io/dom-examples/web-workers/simple-shared-worker/)), chúng tôi có hai trang HTML, mỗi trang sử dụng một số JavaScript để thực hiện tính toán. Các script khác nhau đang sử dụng cùng một file worker để thực hiện tính toán — cả hai đều có thể truy cập nó, ngay cả khi các trang của chúng đang chạy bên trong các cửa sổ khác nhau.

Đoạn mã sau cho thấy cách tạo một đối tượng {{domxref("SharedWorker")}} bằng hàm khởi tạo {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}. Cả hai script đều chứa điều này:

```js
const myWorker = new SharedWorker("worker.js");
```

Cả hai script sau đó truy cập worker thông qua một đối tượng {{domxref("MessagePort")}} được tạo bằng thuộc tính {{domxref("SharedWorker.port")}}. Nếu sự kiện onmessage được gắn bằng addEventListener, port được khởi động thủ công bằng phương thức `start()` của nó:

```js
myWorker.port.start();
```

Khi port được khởi động, cả hai script đều đăng thông điệp lên worker và xử lý các thông điệp được gửi từ nó bằng `port.postMessage()` và `port.onmessage`, tương ứng:

```js
[first, second].forEach((input) => {
  input.onchange = () => {
    myWorker.port.postMessage([first.value, second.value]);
    console.log("Message posted to worker");
  };
});

myWorker.port.onmessage = (e) => {
  result1.textContent = e.data;
  console.log("Message received from worker");
};
```

Bên trong worker, chúng ta sử dụng trình xử lý {{domxref("SharedWorkerGlobalScope.connect_event", "onconnect")}} để kết nối với cùng một port được thảo luận ở trên. Các port liên kết với worker đó có thể truy cập trong thuộc tính `ports` của sự kiện {{domxref("SharedWorkerGlobalScope/connect_event", "connect")}} — sau đó chúng ta sử dụng phương thức `start()` của {{domxref("MessagePort")}} để khởi động port, và trình xử lý `onmessage` để xử lý các thông điệp được gửi từ các luồng chính.

```js
onconnect = (e) => {
  const port = e.ports[0];

  port.addEventListener("message", (e) => {
    const workerResult = `Result: ${e.data[0] * e.data[1]}`;
    port.postMessage(workerResult);
  });

  port.start(); // Required when using addEventListener. Otherwise called implicitly by onmessage setter.
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
