---
title: "MessageEvent: thuộc tính source"
short-title: source
slug: Web/API/MessageEvent/source
page-type: web-api-instance-property
browser-compat: api.MessageEvent.source
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`source`** của giao diện {{domxref("MessageEvent")}} là một `MessageEventSource` (có thể là {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc đối tượng {{domxref("ServiceWorker")}}) đại diện cho người phát thông điệp.

## Giá trị

Một `MessageEventSource` (có thể là {{glossary("WindowProxy")}}, {{domxref("MessagePort")}}, hoặc đối tượng {{domxref("ServiceWorker")}}) đại diện cho người phát thông điệp.

## Ví dụ

```js
myWorker.onmessage = (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
  console.log(e.source);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
