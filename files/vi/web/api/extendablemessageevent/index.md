---
title: ExtendableMessageEvent
slug: Web/API/ExtendableMessageEvent
page-type: web-api-interface
browser-compat: api.ExtendableMessageEvent
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Giao diện **`ExtendableMessageEvent`** của [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) đại diện cho đối tượng sự kiện của sự kiện {{domxref("ServiceWorkerGlobalScope/message_event", "message")}} được kích hoạt trên một service worker (khi nhận được thông báo trên {{domxref("ServiceWorkerGlobalScope")}} từ ngữ cảnh khác), kéo dài vòng đời của các sự kiện đó.

Giao diện này kế thừa từ giao diện {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ExtendableMessageEvent.ExtendableMessageEvent","ExtendableMessageEvent()")}}
  - : Tạo một phiên bản đối tượng `ExtendableMessageEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("ExtendableEvent")}}_.

- {{domxref("ExtendableMessageEvent.data")}} {{ReadOnlyInline}}
  - : Trả về dữ liệu của sự kiện. Có thể là bất kỳ loại dữ liệu nào. Nếu được phân phối trong sự kiện `messageerror`, thuộc tính sẽ là `null`.
- {{domxref("ExtendableMessageEvent.origin")}} {{ReadOnlyInline}}
  - : Trả về nguồn gốc của {{domxref("Client")}} đã gửi thông báo.
- {{domxref("ExtendableMessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Trong [server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events), đại diện cho ID sự kiện cuối cùng của nguồn sự kiện.
- {{domxref("ExtendableMessageEvent.source")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến đối tượng {{domxref("Client")}} đã gửi thông báo.
- {{domxref("ExtendableMessageEvent.ports")}} {{ReadOnlyInline}}
  - : Trả về mảng chứa các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng của kênh thông báo liên kết.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("ExtendableEvent")}}_.

## Ví dụ

Trong ví dụ dưới đây, một trang lấy handle đến đối tượng {{domxref("ServiceWorker")}} qua {{domxref("ServiceWorkerRegistration.active")}}, rồi gọi hàm `postMessage()` của nó.

```js
// in the page being controlled
if (navigator.serviceWorker) {
  navigator.serviceWorker.register("service-worker.js");

  navigator.serviceWorker.addEventListener("message", (event) => {
    // event is a MessageEvent object
    console.log(`The service worker sent me a message: ${event.data}`);
  });

  navigator.serviceWorker.ready.then((registration) => {
    registration.active.postMessage("Hi service worker");
  });
}
```

Service worker có thể nhận thông báo bằng cách lắng nghe sự kiện `message`:

```js
// in the service worker
addEventListener("message", (event) => {
  // event is an ExtendableMessageEvent object
  console.log(`The client sent me a message: ${event.data}`);

  event.source.postMessage("Hi client");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Channel Messaging](/en-US/docs/Web/API/Channel_Messaging_API)
