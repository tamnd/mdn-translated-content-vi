---
title: "VideoEncoder: dequeue event"
short-title: dequeue
slug: Web/API/VideoEncoder/dequeue_event
page-type: web-api-event
browser-compat: api.VideoEncoder.dequeue_event
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`dequeue`** của giao diện {{domxref("VideoEncoder")}} kích hoạt để báo hiệu sự giảm xuống của {{domxref("VideoEncoder.encodeQueueSize")}}.

Điều này loại bỏ nhu cầu các nhà phát triển sử dụng vòng lặp {{domxref("Window.setTimeout", "setTimeout()")}} để xác định khi nào hàng đợi đã giảm xuống và nên đưa thêm công việc vào hàng đợi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("dequeue", (event) => { })

ondequeue = (event) => { }
```

## Ví dụ

```js
videoEncoder.addEventListener("dequeue", (event) => {
  // Queue up more encoding work
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
