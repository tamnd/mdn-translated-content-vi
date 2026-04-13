---
title: "EventSource: sự kiện error"
short-title: error
slug: Web/API/EventSource/error_event
page-type: web-api-event
browser-compat: api.EventSource.error_event
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Sự kiện **`error`** của API {{domxref("EventSource")}} được kích hoạt khi không thể mở kết nối với một nguồn sự kiện.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
const evtSource = new EventSource("sse.php");

// addEventListener version
evtSource.addEventListener("error", (e) => {
  console.log("An error occurred while attempting to connect.");
});

// onerror version
evtSource.onerror = (e) => {
  console.log("An error occurred while attempting to connect.");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
- [`open`](/en-US/docs/Web/API/EventSource/open_event)
- [`message`](/en-US/docs/Web/API/EventSource/message_event)
