---
title: "WindowClient: visibilityState property"
short-title: visibilityState
slug: Web/API/WindowClient/visibilityState
page-type: web-api-instance-property
browser-compat: api.WindowClient.visibilityState
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`visibilityState`** của giao diện {{domxref("WindowClient")}} cho biết khả năng hiển thị của client hiện tại. Giá trị này có thể là một trong `"hidden"`, `"visible"`, hoặc `"prerender"`.

## Giá trị

Một chuỗi (xem {{domxref("Document.visibilityState")}} để biết các giá trị).

## Ví dụ

```js
event.waitUntil(
  clients
    .matchAll({
      type: "window",
    })
    .then((clientList) => {
      for (const client of clientList) {
        if (client.url === "/" && "focus" in client) {
          if (client.visibilityState === "hidden") return client.focus();
        }
      }
      if (clients.openWindow) {
        return clients.openWindow("/");
      }
    }),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
