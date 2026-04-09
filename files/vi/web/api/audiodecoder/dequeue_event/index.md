---
title: "AudioDecoder: sự kiện dequeue"
short-title: dequeue
slug: Web/API/AudioDecoder/dequeue_event
page-type: web-api-event
browser-compat: api.AudioDecoder.dequeue_event
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`dequeue`** của giao diện {{domxref("AudioDecoder")}} kích hoạt để báo hiệu {{domxref("AudioDecoder.decodeQueueSize")}} đã giảm.

Điều này loại bỏ nhu cầu để nhà phát triển dùng thăm dò bằng {{domxref("Window.setTimeout", "setTimeout()")}} nhằm xác định khi nào hàng đợi đã giảm và nên đưa thêm công việc vào hàng đợi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dequeue", (event) => { })

ondequeue = (event) => { }
```

## Ví dụ

```js
audioDecoder.addEventListener("dequeue", (event) => {
  // Đưa thêm công việc giải mã vào hàng đợi
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
