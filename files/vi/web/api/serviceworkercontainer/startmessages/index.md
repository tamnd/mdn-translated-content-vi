---
title: "ServiceWorkerContainer: phương thức startMessages()"
short-title: startMessages()
slug: Web/API/ServiceWorkerContainer/startMessages
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerContainer.startMessages
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`startMessages()`** của
giao diện {{domxref("ServiceWorkerContainer")}} khởi động rõ ràng luồng thông điệp
được gửi từ service worker đến các trang nằm trong phạm vi kiểm soát của nó (ví dụ: được gửi
qua {{domxref("Client.postMessage()")}}). Điều này có thể được sử dụng để phản hồi các thông điệp đã gửi
sớm hơn, ngay cả trước khi nội dung của trang đó tải xong.

## Giải thích

Theo mặc định, tất cả thông điệp được gửi từ service worker điều khiển của trang đến trang
(sử dụng {{domxref("Client.postMessage()")}}) được xếp hàng chờ trong khi trang đang tải, và
được gửi đi sau khi tài liệu HTML của trang đã được tải và phân tích cú pháp (tức là, sau khi
sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} được kích hoạt). Có thể bắt đầu gửi các
thông điệp này sớm hơn bằng cách gọi `ServiceWorkerContainer.startMessages()`, ví
dụ nếu bạn đã gọi một trình xử lý thông điệp bằng
{{domxref("EventTarget.addEventListener()")}} trước khi trang tải xong, nhưng
muốn bắt đầu xử lý các thông điệp ngay lập tức.

> [!NOTE]
> Các thông điệp bắt đầu được gửi tự động khi thiết lập
> trình xử lý trực tiếp bằng {{domxref("ServiceWorkerContainer.message_event", "onmessage")}}. Trong trường hợp này bạn
> không cần `startMessages()`.

## Cú pháp

```js-nolint
startMessages()
```

### Tham số

Không có.

### Giá trị trả về

`undefined`.

## Ví dụ

```js
if ("serviceWorker" in navigator) {
  navigator.serviceWorker.register("/sw.js").then(() => {
    console.log("Service Worker Registered");
  });
}

// …

navigator.serviceWorker.addEventListener("message", (e) => {
  // …
});

navigator.serviceWorker.startMessages();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
