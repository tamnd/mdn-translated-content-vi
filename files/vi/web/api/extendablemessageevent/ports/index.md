---
title: "ExtendableMessageEvent: ports property"
short-title: ports
slug: Web/API/ExtendableMessageEvent/ports
page-type: web-api-instance-property
browser-compat: api.ExtendableMessageEvent.ports
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`ports`** của giao diện {{domxref("ExtendableMessageEvent")}} trả về mảng chứa các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng của kênh thông báo liên kết (kênh mà thông báo được gửi qua).

## Giá trị

Một mảng các đối tượng {{domxref("MessagePort")}}.

## Ví dụ

Khi đoạn mã dưới đây được dùng trong service worker để phản hồi các thông báo push, đối tượng sự kiện của `onmessage` sẽ là `ExtendableMessageEvent`.

```js
let port;

self.addEventListener("push", (e) => {
  const obj = e.data.json();

  if (obj.action === "subscribe" || obj.action === "unsubscribe") {
    port.postMessage(obj);
  } else if (obj.action === "init" || obj.action === "chatMsg") {
    port.postMessage(obj);
  }
});

self.onmessage = (e) => {
  port = e.ports[0];
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Service workers basic code example](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Channel Messaging](/en-US/docs/Web/API/Channel_Messaging_API)
