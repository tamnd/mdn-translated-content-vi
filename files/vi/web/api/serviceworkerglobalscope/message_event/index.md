---
title: "ServiceWorkerGlobalScope: sự kiện message"
short-title: message
slug: Web/API/ServiceWorkerGlobalScope/message_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.message_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`message`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} xảy ra khi các thông điệp đến được nhận. Các trang được điều khiển có thể sử dụng phương thức {{domxref("ServiceWorker.postMessage()")}} để gửi thông điệp đến service workers.
Service worker có thể tùy chọn gửi phản hồi trở lại thông qua {{domxref("Client.postMessage()")}}, tương ứng với trang được điều khiển.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Loại sự kiện

Một {{domxref("ExtendableMessageEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram("ExtendableMessageEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("ExtendableEvent")}}_.

- {{domxref("ExtendableMessageEvent.data")}} {{ReadOnlyInline}}
  - : Trả về dữ liệu của sự kiện. Nó có thể là bất kỳ kiểu dữ liệu nào. Nếu được gửi trong sự kiện `messageerror`, thuộc tính sẽ là `null`.
- {{domxref("ExtendableMessageEvent.origin")}} {{ReadOnlyInline}}
  - : Trả về nguồn gốc của {{domxref("Client")}} đã gửi thông điệp.
- {{domxref("ExtendableMessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Đại diện, trong [server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events), cho ID sự kiện cuối cùng của nguồn sự kiện.
- {{domxref("ExtendableMessageEvent.source")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("Client")}} đã gửi thông điệp.
- {{domxref("ExtendableMessageEvent.ports")}} {{ReadOnlyInline}}
  - : Trả về mảng chứa các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng của kênh thông điệp được liên kết.

## Ví dụ

Trong ví dụ dưới đây, một trang lấy tham chiếu đến đối tượng {{domxref("ServiceWorker")}} thông qua {{domxref("ServiceWorkerRegistration.active")}}, và sau đó gọi hàm `postMessage()` của nó.

```js
// main.js
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

Service worker có thể nhận thông điệp bằng cách lắng nghe sự kiện `message`:

```js
// service-worker.js
addEventListener("message", (event) => {
  // event is an ExtendableMessageEvent object
  console.log(`The client sent me a message: ${event.data}`);

  event.source.postMessage("Hi client");
});
```

Hoặc, tập lệnh có thể lắng nghe thông điệp bằng cách sử dụng `onmessage`:

```js
// service-worker.js
self.onmessage = (event) => {
  // event is an ExtendableMessageEvent object
  console.log(`The client sent me a message: ${event.data}`);

  event.source.postMessage("Hi client");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Mẫu mã service workers cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
