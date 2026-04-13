---
title: "MessagePort: sự kiện messageerror"
short-title: messageerror
slug: Web/API/MessagePort/messageerror_event
page-type: web-api-event
browser-compat: api.MessagePort.messageerror_event
---

{{APIRef("Channel Messaging API")}} {{AvailableInWorkers}}

Sự kiện **`messageerror`** được kích hoạt trên đối tượng {{domxref('MessagePort')}} khi nó nhận được tin nhắn không thể deserialize.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("messageerror", (event) => { })

onmessageerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ đối tượng cha, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi nguồn phát tin nhắn.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho nguồn gốc của nguồn phát tin nhắn.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho ID duy nhất của sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc {{domxref("ServiceWorker")}}) đại diện cho nguồn phát tin nhắn.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng chứa tất cả các đối tượng {{domxref("MessagePort")}} được gửi cùng tin nhắn, theo thứ tự.

## Ví dụ

### Cố gắng chia sẻ bộ nhớ

Một nguyên nhân phổ biến của sự kiện `messageerror` là cố gắng gửi đối tượng {{jsxref("SharedArrayBuffer")}}, hoặc buffer view dựa trên một đối tượng như vậy, qua các [agent cluster](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing). Ví dụ, một window không cùng agent cluster với shared worker mà nó tạo ra, vì vậy giả sử trang chạy đoạn mã sau:

```js
const worker = new SharedWorker("worker.js");
worker.port.start();
worker.port.addEventListener("message", (event) => {
  worker.port.postMessage(new SharedArrayBuffer(1024));
});
```

Và `worker.js` chứa đoạn mã sau:

```js
self.addEventListener("connect", (event) => {
  console.log("Hello");
  const port = event.ports[0];
  port.start();
  port.postMessage("Port connected");
  port.addEventListener("messageerror", (event) => {
    console.log("Message error");
  });
});
```

Thì shared worker sẽ nhận được sự kiện `messageerror` khi cố gắng deserialize tin nhắn được gửi từ window.

> [!NOTE]
> Bạn có thể dùng devtools của trình duyệt để debug SharedWorker bằng cách nhập URL vào thanh địa chỉ trình duyệt để truy cập trình kiểm tra workers của devtools; ví dụ, trong Chrome là URL `chrome://inspect/#workers`, và trong Firefox là URL `about:debugging#workers`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện liên quan: [`message`](/en-US/docs/Web/API/MessagePort/message_event).
- [Sử dụng channel messaging](/en-US/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
