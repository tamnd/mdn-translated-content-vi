---
title: "Client: thuộc tính url"
short-title: url
slug: Web/API/Client/url
page-type: web-api-instance-property
browser-compat: api.Client.url
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("Client")}} trả về URL của client service worker hiện tại.

## Giá trị

Một chuỗi.

## Ví dụ

```js
self.addEventListener("notificationclick", (event) => {
  console.log("On notification click: ", event.notification.tag);
  event.notification.close();

  // Kiểm tra xem cửa sổ hiện tại đã được mở hay chưa
  // và đưa nó vào tiêu điểm nếu có
  event.waitUntil(
    clients
      .matchAll({
        type: "window",
      })
      .then((clientList) => {
        for (const client of clientList) {
          if (client.url === "/" && "focus" in client) {
            return client.focus();
          }
        }
        if (clients.openWindow) {
          return clients.openWindow("/");
        }
      }),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
