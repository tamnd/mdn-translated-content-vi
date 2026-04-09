---
title: "Client: thuộc tính type"
short-title: type
slug: Web/API/Client/type
page-type: web-api-instance-property
browser-compat: api.Client.type
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("Client")}} cho biết loại client mà service worker đang điều khiển.

## Giá trị

Một chuỗi biểu diễn loại client. Giá trị có thể là một trong các chuỗi sau:

- `"window"`
- `"worker"`
- `"sharedworker"`

## Ví dụ

```js
// client của service worker (ví dụ: một tài liệu)
function sendMessage(message) {
  return new Promise((resolve, reject) => {
    // lưu ý đây là phiên bản ServiceWorker.postMessage
    navigator.serviceWorker.controller.postMessage(message);
    window.serviceWorker.onMessage = (e) => {
      resolve(e.data);
    };
  });
}

// service worker điều khiển
self.addEventListener("message", (e) => {
  // e.source là một đối tượng client
  e.source.postMessage(`Hello! Your message was: ${e.data}`);
  // Đồng thời gửi giá trị type trở lại client
  e.source.postMessage(e.source.type);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
