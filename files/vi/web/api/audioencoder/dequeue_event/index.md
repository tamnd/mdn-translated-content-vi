---
title: "AudioEncoder: sự kiện dequeue"
short-title: dequeue
slug: Web/API/AudioEncoder/dequeue_event
page-type: web-api-event
browser-compat: api.AudioEncoder.dequeue_event
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`dequeue`** của giao diện {{domxref("AudioEncoder")}} phát ra để báo hiệu {{domxref("AudioEncoder.encodeQueueSize")}} đã giảm.

Điều này loại bỏ nhu cầu để nhà phát triển phải dùng thăm dò bằng {{domxref("Window.setTimeout", "setTimeout()")}} nhằm xác định khi nào hàng đợi đã giảm và nên đưa thêm công việc vào hàng đợi.

## Cú pháp

Hãy dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dequeue", (event) => { })

ondequeue = (event) => { }
```

## Ví dụ

```js
audioEncoder.addEventListener("dequeue", (event) => {
  // Đưa thêm công việc mã hóa vào hàng đợi
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
