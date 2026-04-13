---
title: "ServiceWorkerGlobalScope: sự kiện push"
short-title: push
slug: Web/API/ServiceWorkerGlobalScope/push_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.push_event
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`push`** được gửi đến phạm vi toàn cục của service worker (đại diện bởi giao diện {{domxref("ServiceWorkerGlobalScope")}}) khi service worker đã nhận được một thông báo đẩy.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("push", (event) => { })

onpush = (event) => { }
```

## Loại sự kiện

Một {{domxref("PushEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("PushEvent")}}

## Thuộc tính sự kiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("ExtendableEvent")}}. Các thuộc tính bổ sung:_

- {{domxref("PushEvent.data")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("PushMessageData")}} chứa dữ liệu được gửi đến {{domxref("PushSubscription")}}.

## Ví dụ

Ví dụ này thiết lập một trình xử lý cho các sự kiện `push` lấy dữ liệu {{Glossary("JSON")}}, phân tích cú pháp nó, và phân phối thông điệp để xử lý dựa trên thông tin contained trong thông điệp.

```js
self.addEventListener("push", (event) => {
  let message = event.data.json();

  switch (message.type) {
    case "init":
      doInit();
      break;
    case "shutdown":
      doShutdown();
      break;
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Push API](/en-US/docs/Web/API/Push_API)
- Sự kiện {{domxref("ServiceWorkerGlobalScope/pushsubscriptionchange_event", "pushsubscriptionchange")}}
