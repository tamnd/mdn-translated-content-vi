---
title: WindowClient
slug: Web/API/WindowClient
page-type: web-api-interface
browser-compat: api.WindowClient
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Giao diện `WindowClient` của [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API) đại diện cho phạm vi của một service worker client là tài liệu trong ngữ cảnh duyệt web, được kiểm soát bởi một worker đang hoạt động. Service worker client độc lập chọn và sử dụng một service worker cho việc tải và tài nguyên phụ của chính nó.

{{InheritanceDiagram}}

## Phương thức phiên bản

_`WindowClient` kế thừa các phương thức từ giao diện cha, {{domxref("Client")}}._

- {{domxref("WindowClient.focus()")}}
  - : Đưa focus đầu vào của người dùng đến client hiện tại.
- {{domxref("WindowClient.navigate()")}}
  - : Tải một URL được chỉ định vào trang client được kiểm soát.

## Thuộc tính phiên bản

_`WindowClient` kế thừa các thuộc tính từ giao diện cha, {{domxref("Client")}}._

- {{domxref("WindowClient.ancestorOrigins")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một mảng các chuỗi cho biết nguồn gốc tổ tiên của ngữ cảnh duyệt web được đại diện bởi `WindowClient` này theo thứ tự ngược.
- {{domxref("WindowClient.focused")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết liệu client hiện tại có focus hay không.
- {{domxref("WindowClient.visibilityState")}} {{ReadOnlyInline}}
  - : Cho biết khả năng hiển thị của client hiện tại. Giá trị này có thể là một trong `"hidden"` hoặc `"visible"`.

## Ví dụ

```js
self.addEventListener("notificationclick", (event) => {
  console.log("On notification click: ", event.notification.tag);
  event.notification.close();

  // This looks to see if the current is already open and
  // focuses if it is
  event.waitUntil(
    clients
      .matchAll({
        type: "window",
      })
      .then((clientList) => {
        for (const client of clientList) {
          if (client.url === "/" && "focus" in client) {
            client.focus();
            break;
          }
        }
        if (clients.openWindow) return clients.openWindow("/");
      }),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Using web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
- [Channel Messaging API](/en-US/docs/Web/API/Channel_Messaging_API)
