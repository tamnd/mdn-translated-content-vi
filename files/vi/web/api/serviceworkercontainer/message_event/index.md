---
title: "ServiceWorkerContainer: sự kiện message"
short-title: message
slug: Web/API/ServiceWorkerContainer/message_event
page-type: web-api-event
browser-compat: api.ServiceWorkerContainer.message_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện **`message`** được sử dụng trong một trang được kiểm soát bởi một service worker để nhận thông báo từ service worker.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
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

Trong ví dụ này, service worker lấy ID của client từ một sự kiện [`fetch`](/en-US/docs/Web/API/ServiceWorkerGlobalScope/fetch_event) và sau đó gửi một thông báo bằng [`Client.postMessage`](/en-US/docs/Web/API/Client/postMessage):

```js
// service-worker.js
async function messageClient(clientId) {
  const client = await clients.get(clientId);
  client.postMessage("Hi client!");
}

addEventListener("fetch", (event) => {
  messageClient(event.clientId);
  event.respondWith(() => {
    // …
  });
});
```

Client có thể nhận thông báo bằng cách lắng nghe sự kiện `message`:

```js
// main.js
navigator.serviceWorker.addEventListener("message", (message) => {
  console.log(message);
});
```

Ngoài ra, client có thể nhận thông báo với trình xử lý sự kiện `onmessage`:

```js
// main.js
navigator.serviceWorker.onmessage = (message) => {
  console.log(message);
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
