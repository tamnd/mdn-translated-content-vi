---
title: "EventSource: sự kiện open"
short-title: open
slug: Web/API/EventSource/open_event
page-type: web-api-event
browser-compat: api.EventSource.open_event
---

{{APIRef("Server Sent Events")}}{{AvailableInWorkers}}

Sự kiện **`open`** của giao diện {{domxref("EventSource")}} được kích hoạt khi kết nối với một nguồn sự kiện đã được mở.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("open", (event) => { })

onopen = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
const evtSource = new EventSource("sse.php");

// addEventListener version
evtSource.addEventListener("open", (e) => {
  console.log("The connection has been established.");
});

// onopen version
evtSource.onopen = (e) => {
  console.log("The connection has been established.");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using server-sent events](/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
- {{domxref("EventSource/error_event", "error")}}
- {{domxref("EventSource/message_event", "message")}}
