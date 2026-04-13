---
title: "MessageEvent: thuộc tính ports"
short-title: ports
slug: Web/API/MessageEvent/ports
page-type: web-api-instance-property
browser-compat: api.MessageEvent.ports
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ports`** của giao diện {{domxref("MessageEvent")}} là một mảng các đối tượng {{domxref("MessagePort")}} chứa tất cả các đối tượng {{domxref("MessagePort")}} được gửi kèm với thông điệp, theo thứ tự.

## Giá trị

Một mảng các đối tượng {{domxref("MessagePort")}}.

## Ví dụ

```js
onconnect = (e) => {
  const port = e.ports[0];

  port.addEventListener("message", (e) => {
    const workerResult = `Result: ${e.data[0] * e.data[1]}`;
    port.postMessage(workerResult);
  });

  port.start(); // Required when using addEventListener. Otherwise called implicitly by onmessage setter.
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
