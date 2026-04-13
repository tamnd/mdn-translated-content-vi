---
title: "ExtendableMessageEvent: data property"
short-title: data
slug: Web/API/ExtendableMessageEvent/data
page-type: web-api-instance-property
browser-compat: api.ExtendableMessageEvent.data
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("ExtendableMessageEvent")}} trả về dữ liệu của sự kiện. Có thể là bất kỳ loại dữ liệu nào.

## Giá trị

Bất kỳ loại dữ liệu nào.

## Ví dụ

Khi đoạn mã dưới đây được dùng trong service worker để phản hồi các thông báo push bằng cách gửi dữ liệu nhận qua {{domxref("PushMessageData")}} đến ngữ cảnh chính qua [channel message](/en-US/docs/Web/API/Channel_Messaging_API), đối tượng sự kiện của `onmessage` sẽ là `ExtendableMessageEvent`.

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
  console.log(e.data);
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
