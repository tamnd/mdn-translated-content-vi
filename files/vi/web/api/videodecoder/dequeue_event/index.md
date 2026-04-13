---
title: "VideoDecoder: sự kiện dequeue"
short-title: dequeue
slug: Web/API/VideoDecoder/dequeue_event
page-type: web-api-event
browser-compat: api.VideoDecoder.dequeue_event
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`dequeue`** của giao diện {{domxref("VideoDecoder")}} kích hoạt để báo hiệu sự giảm xuống của {{domxref("VideoDecoder.decodeQueueSize")}}.

Điều này giúp các nhà phát triển không cần sử dụng vòng lặp {{domxref("Window.setTimeout", "setTimeout()")}} để xác định khi nào hàng đợi đã giảm và cần thêm công việc vào hàng đợi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("dequeue", (event) => { })

ondequeue = (event) => { }
```

## Ví dụ

```js
videoDecoder.addEventListener("dequeue", (event) => {
  // Queue up more encoding work
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
