---
title: "BroadcastChannel: sự kiện messageerror"
short-title: messageerror
slug: Web/API/BroadcastChannel/messageerror_event
page-type: web-api-event
browser-compat: api.BroadcastChannel.messageerror_event
---

{{APIRef("BroadCastChannel API")}}{{AvailableInWorkers}}

Sự kiện **`messageerror`** của giao diện {{domxref("BroadcastChannel")}} được kích hoạt khi một thông điệp không thể giải tuần tự đến trên kênh.

## Cú pháp

Dùng tên sự kiện này trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("messageerror", (event) => { })

onmessageerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, còn có các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MessageEvent.data", "data")}} {{ReadOnlyInline}}
  - : Dữ liệu được bộ phát thông điệp gửi đi.
- {{domxref("MessageEvent.origin", "origin")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn nguồn gốc của bộ phát thông điệp.
- {{domxref("MessageEvent.lastEventId", "lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn mã nhận dạng duy nhất của sự kiện.
- {{domxref("MessageEvent.source", "source")}} {{ReadOnlyInline}}
  - : Một _nguồn sự kiện thông điệp_, là một đối tượng {{glossary("WindowProxy")}}, {{domxref("MessagePort")}} hoặc {{domxref("ServiceWorker")}} biểu diễn bộ phát thông điệp.
- {{domxref("MessageEvent.ports", "ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} biểu diễn các cổng gắn với kênh mà thông điệp đang được gửi qua (khi phù hợp, ví dụ trong channel messaging hoặc khi gửi thông điệp tới shared worker).

## Ví dụ

### Lắng nghe sự kiện messageerror

Đoạn mã này dùng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để lắng nghe thông điệp và lỗi:

```js
const channel = new BroadcastChannel("example-channel");

channel.addEventListener("message", (event) => {
  received.textContent = event.data;
});

channel.addEventListener("messageerror", (event) => {
  console.error(event);
});
```

Đoạn mã sau có cùng chức năng nhưng dùng các thuộc tính xử lý sự kiện `onmessage` và `onmessageerror`:

```js
const channel = new BroadcastChannel("example-channel");

channel.onmessage = (event) => {
  received.textContent = event.data;
};

channel.onmessageerror = (event) => {
  console.log(event);
};
```

### Thử chia sẻ bộ nhớ

Một nguyên nhân phổ biến gây ra sự kiện `messageerror` là cố gắng gửi một đối tượng {{jsxref("SharedArrayBuffer")}}, hoặc một khung nhìn bộ đệm được hậu thuẫn bởi đối tượng đó, qua các [cụm agent](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing). Đoạn mã sau minh họa điều này.

Trang A chạy đoạn mã sau:

```js
const channel = new BroadcastChannel("hello");
channel.postMessage({ data: new SharedArrayBuffer(1024) });
```

Trang B chạy đoạn mã sau:

```js
const channel = new BroadcastChannel("hello");
channel.addEventListener("messageerror", (event) => {
  console.error("Message error");
});
```

Khi đó trang B sẽ nhận được một sự kiện `messageerror` khi cố gắng giải tuần tự thông điệp được gửi từ trang A.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện liên quan: {{domxref("BroadcastChannel/message_event", "message")}}.
