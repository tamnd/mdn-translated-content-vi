---
title: "SyncManager: register() method"
short-title: register()
slug: Web/API/SyncManager/register
page-type: web-api-instance-method
browser-compat: api.SyncManager.register
---

{{APIRef("Background Sync")}}{{AvailableInWorkers}}

Phương thức **`register()`** của giao diện {{domxref("SyncManager")}} đăng ký một sự kiện đồng bộ, kích hoạt sự kiện {{domxref("ServiceWorkerGlobalScope.sync_event", "sync")}} bên trong service worker liên quan ngay khi có kết nối mạng.

## Cú pháp

```js-nolint
register(tag)
```

### Tham số

- `tag`
  - : Định danh cho sự kiện đồng bộ này. Đây sẽ là giá trị của thuộc tính `tag` của {{domxref("SyncEvent")}} được truyền vào trình xử lý sự kiện {{domxref("ServiceWorkerGlobalScope.sync_event", "sync")}} của service worker.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{jsxref("undefined")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu service worker hiện tại chưa hoạt động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu đồng bộ nền đã bị người dùng tắt.

## Ví dụ

Hàm bất đồng bộ sau đăng ký đồng bộ nền từ một ngữ cảnh duyệt web:

```js
async function syncMessagesLater() {
  const registration = await navigator.serviceWorker.ready;
  try {
    await registration.sync.register("sync-messages");
  } catch {
    console.log("Background Sync could not be registered!");
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
