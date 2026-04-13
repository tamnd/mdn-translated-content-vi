---
title: "WindowClient: focus() method"
short-title: focus()
slug: Web/API/WindowClient/focus
page-type: web-api-instance-method
browser-compat: api.WindowClient.focus
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`focus()`** của giao diện {{domxref("WindowClient")}} đưa focus đầu vào của người dùng đến client hiện tại và trả về một {{jsxref("Promise")}} được giải quyết thành đối tượng {{domxref("WindowClient")}} hiện có.

## Cú pháp

```js-nolint
focus()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành {{domxref("WindowClient")}} hiện có.

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Promise bị từ chối với ngoại lệ này nếu không có cửa sổ nào trong nguồn gốc của ứng dụng có [transient activation](/en-US/docs/Web/Security/Defenses/User_activation).

## Yêu cầu bảo mật

- Ít nhất một cửa sổ trong nguồn gốc của ứng dụng phải có [transient activation](/en-US/docs/Web/Security/Defenses/User_activation).

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
          if (client.url === "/" && "focus" in client) return client.focus();
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
