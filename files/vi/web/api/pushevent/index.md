---
title: PushEvent
slug: Web/API/PushEvent
page-type: web-api-interface
browser-compat: api.PushEvent
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Giao diện **`PushEvent`** của [Push API](/en-US/docs/Web/API/Push_API) đại diện cho một thông báo push đã được nhận. Sự kiện này được gửi đến [phạm vi toàn cục](/en-US/docs/Web/API/ServiceWorkerGlobalScope) của một {{domxref("ServiceWorker")}}. Nó chứa thông tin được gửi từ máy chủ ứng dụng đến một {{domxref("PushSubscription")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PushEvent.PushEvent", "PushEvent()")}}
  - : Tạo một đối tượng `PushEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("ExtendableEvent")}}. Các thuộc tính bổ sung:_

- {{domxref("PushEvent.data")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến một đối tượng {{domxref("PushMessageData")}} chứa dữ liệu được gửi đến {{domxref("PushSubscription")}}.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("ExtendableEvent")}}_.

## Ví dụ

Ví dụ sau lấy dữ liệu từ một `PushEvent` và hiển thị nó trên tất cả các client của service worker.

```js
self.addEventListener("push", (event) => {
  if (!(self.Notification && self.Notification.permission === "granted")) {
    return;
  }

  const data = event.data?.json() ?? {};
  const title = data.title || "Something Has Happened";
  const message =
    data.message || "Here's something you might want to check out.";
  const icon = "images/new-notification.png";

  const notification = new self.Notification(title, {
    body: message,
    tag: "simple-push-demo-notification",
    icon,
  });

  notification.addEventListener("click", () => {
    clients.openWindow(
      "https://example.blog.com/2015/03/04/something-new.html",
    );
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Push API](/en-US/docs/Web/API/Push_API)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
