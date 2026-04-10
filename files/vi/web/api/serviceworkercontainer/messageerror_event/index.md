---
title: "ServiceWorkerContainer: sự kiện messageerror"
short-title: messageerror
slug: Web/API/ServiceWorkerContainer/messageerror_event
page-type: web-api-event
browser-compat: api.ServiceWorkerContainer.messageerror_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện **`messageerror`** được gửi đến {{domxref("ServiceWorkerContainer")}} khi một thông báo đến được gửi đến worker được liên kết không thể được giải tuần tự hóa.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("messageerror", (event) => { })

onmessageerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi trình phát thông báo.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho nguồn gốc của trình phát thông báo.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho một ID duy nhất cho sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Một `MessageEventSource` (có thể là một đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc {{domxref("ServiceWorker")}}) đại diện cho trình phát thông báo.
- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng được liên kết với kênh mà thông báo đang được gửi qua (nếu phù hợp, ví dụ: trong channel messaging hoặc khi gửi thông báo đến một shared worker).

## Ví dụ

Trong ví dụ này, service worker lấy ID của client từ một sự kiện {{domxref("ServiceWorkerGlobalScope/fetch_event", "fetch")}} và sau đó gửi một thông báo bằng {{domxref("Client.postMessage")}}:

```js
// service-worker.js
async function messageClient(clientId) {
  const client = await self.clients.get(clientId);
  client.postMessage("Hi client!");
}

self.addEventListener("fetch", (event) => {
  messageClient(event.clientId);
  event.respondWith(() => {
    // …
  });
});
```

Service worker có thể lắng nghe lỗi giải tuần tự hóa thông báo bằng cách lắng nghe sự kiện `messageerror`:

```js
// main.js
navigator.serviceWorker.addEventListener("messageerror", (event) => {
  console.error("Receive message from service worker failed!");
});
```

Ngoài ra, tập lệnh có thể lắng nghe lỗi giải tuần tự hóa thông báo bằng cách sử dụng `onmessageerror`:

```js
// main.js
navigator.serviceWorker.onmessageerror = (event) => {
  console.error("Receive message from service worker failed!");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ServiceWorkerContainer/message_event", "message")}}
- {{domxref("Client.postMessage()")}}
- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
