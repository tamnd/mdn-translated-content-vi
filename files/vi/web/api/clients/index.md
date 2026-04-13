---
title: Clients
slug: Web/API/Clients
page-type: web-api-interface
browser-compat: api.Clients
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Giao diện `Clients` cung cấp quyền truy cập vào các đối tượng {{domxref("Client")}}. Hãy truy cập nó thông qua `{{domxref("ServiceWorkerGlobalScope", "self")}}.clients` bên trong một [service worker](/en-US/docs/Web/API/Service_Worker_API).

## Phương thức thực thể

- {{domxref("Clients.get()")}}
  - : Trả về một {{jsxref("Promise")}} cho một {{domxref("Client")}} khớp với {{domxref("Client.id", "id")}} đã cho.
- {{domxref("Clients.matchAll()")}}
  - : Trả về một {{jsxref("Promise")}} cho một mảng các đối tượng {{domxref("Client")}}. Đối số tùy chọn cho phép bạn kiểm soát loại client nào được trả về.
- {{domxref("Clients.openWindow()")}}
  - : Mở một cửa sổ trình duyệt mới cho URL đã cho và trả về một {{jsxref("Promise")}} cho {{domxref("WindowClient")}} mới.
- {{domxref("Clients.claim()")}}
  - : Cho phép một service worker đang hoạt động tự đặt mình làm {{domxref("ServiceWorkerContainer.controller", "controller")}} cho mọi client trong {{domxref("ServiceWorkerRegistration.scope", "scope")}} của nó.

## Ví dụ

Ví dụ sau hiển thị cách dùng một cửa sổ chat hiện có hoặc tạo cửa sổ mới khi người dùng nhấp vào thông báo.

```js
addEventListener("notificationclick", (event) => {
  event.waitUntil(
    (async () => {
      const allClients = await clients.matchAll({
        includeUncontrolled: true,
      });

      let chatClient;

      // Let's see if we already have a chat window open:
      for (const client of allClients) {
        const url = new URL(client.url);

        if (url.pathname === "/chat/") {
          // Excellent, let's use it!
          client.focus();
          chatClient = client;
          break;
        }
      }

      // If we didn't find an existing chat window,
      // open a new one:
      chatClient ??= await clients.openWindow("/chat/");

      // Message the client:
      chatClient.postMessage("New chat messages!");
    })(),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
