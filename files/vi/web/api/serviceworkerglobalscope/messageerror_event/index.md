---
title: "ServiceWorkerGlobalScope: sự kiện messageerror"
short-title: messageerror
slug: Web/API/ServiceWorkerGlobalScope/messageerror_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.messageerror_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`messageerror`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} xảy ra khi các thông điệp đến không thể được giải tuần tự hóa.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("messageerror", (event) => { })

onmessageerror = (event) => { }
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

Service worker có thể lắng nghe lỗi giải tuần tự hóa thông điệp bằng cách lắng nghe sự kiện `messageerror`:

```js
// service-worker.js
self.addEventListener("messageerror", (event) => {
  // event is an ExtendableMessageEvent object
  console.error("Message deserialization failed");
});
```

Hoặc, tập lệnh có thể lắng nghe lỗi giải tuần tự hóa thông điệp bằng cách sử dụng `onmessageerror`:

```js
// service-worker.js
self.onmessageerror = (event) => {
  // event is an ExtendableMessageEvent object
  console.error("Message deserialization failed");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ServiceWorkerGlobalScope/message_event", "message")}}
- {{domxref("ServiceWorker.postMessage()")}}
- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Mẫu mã service workers cơ bản](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
