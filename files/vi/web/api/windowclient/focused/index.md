---
title: "WindowClient: focused property"
short-title: focused
slug: Web/API/WindowClient/focused
page-type: web-api-instance-property
browser-compat: api.WindowClient.focused
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`focused`** của giao diện {{domxref("WindowClient")}} là một giá trị boolean cho biết liệu client hiện tại có focus hay không.

## Giá trị

Một giá trị boolean.

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
            if (!client.focused) return client.focus();
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
