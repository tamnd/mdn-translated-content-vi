---
title: Background Synchronization API
slug: Web/API/Background_Synchronization_API
page-type: web-api-overview
browser-compat:
  - api.SyncManager
  - api.ServiceWorkerGlobalScope.sync_event
spec-urls: https://wicg.github.io/background-sync/spec/
---

{{DefaultAPISidebar("Background Sync")}}{{Securecontext_Header}}{{AvailableInWorkers}}

**Background Synchronization API** cho phép một ứng dụng web trì hoãn các tác vụ để chúng có thể được chạy trong [service worker](/en-US/docs/Web/API/Service_Worker_API) khi người dùng có kết nối mạng ổn định.

## Khái niệm và cách dùng

Background Synchronization API cho phép ứng dụng web trì hoãn công việc đồng bộ hóa với máy chủ sang service worker để xử lý vào thời điểm sau, nếu thiết bị đang ngoại tuyến. Một trường hợp sử dụng là gửi yêu cầu trong nền nếu không thể gửi chúng trong lúc ứng dụng đang được dùng.

Ví dụ, một ứng dụng thư điện tử có thể cho phép người dùng soạn và gửi thư bất cứ lúc nào, kể cả khi thiết bị không có kết nối mạng. Phần giao diện của ứng dụng chỉ cần đăng ký một yêu cầu đồng bộ, và service worker sẽ được thông báo khi mạng khả dụng trở lại để xử lý việc đồng bộ.

Giao diện {{domxref('SyncManager')}} có sẵn thông qua {{domxref('ServiceWorkerRegistration.sync')}}. Một mã định danh thẻ duy nhất được đặt để "đặt tên" cho sự kiện đồng bộ, sau đó có thể được lắng nghe trong script {{domxref('ServiceWorker')}}. Khi nhận được sự kiện, bạn có thể chạy bất kỳ chức năng nào khả dụng, chẳng hạn như gửi yêu cầu đến máy chủ.

Vì API này dựa trên service worker, chức năng do API này cung cấp chỉ khả dụng trong secure context.

## Giao diện

- {{domxref('SyncManager')}} {{Experimental_Inline}}
  - : Đăng ký các tác vụ sẽ được chạy trong service worker vào thời điểm sau khi có kết nối mạng. Các tác vụ này được gọi là _yêu cầu đồng bộ nền_.
- {{domxref('SyncEvent')}} {{Experimental_Inline}}
  - : Biểu diễn một sự kiện đồng bộ hóa được gửi tới [global scope](/en-US/docs/Web/API/ServiceWorkerGlobalScope) của {{domxref('ServiceWorker')}}. Nó cung cấp một cách để chạy các tác vụ trong service worker khi thiết bị có kết nối mạng.

### Phần mở rộng cho các giao diện khác

Những phần bổ sung sau cho [Service Worker API](/en-US/docs/Web/API/Service_Worker_API) cung cấp điểm bắt đầu để thiết lập đồng bộ nền.

- {{domxref("ServiceWorkerRegistration.sync")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến giao diện {{domxref("SyncManager")}} để đăng ký các tác vụ chạy khi thiết bị có kết nối mạng.
- {{domxref("ServiceWorkerGlobalScope/sync_event", "sync")}} event
  - : Trình xử lý sự kiện được kích hoạt bất cứ khi nào xảy ra sự kiện {{domxref("ServiceWorkerGlobalScope/sync_event", "sync")}}. Điều này diễn ra ngay khi mạng trở nên khả dụng.

## Ví dụ

Các ví dụ sau cho thấy cách sử dụng giao diện này.

### Yêu cầu một lần đồng bộ nền

Hàm bất đồng bộ sau đăng ký một lần đồng bộ nền từ một ngữ cảnh duyệt:

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

### Xác minh một lần đồng bộ nền theo thẻ

Đoạn mã này kiểm tra xem một tác vụ đồng bộ nền với một thẻ nhất định đã được đăng ký hay chưa.

```js
navigator.serviceWorker.ready.then((registration) => {
  registration.sync.getTags().then((tags) => {
    if (tags.includes("sync-messages")) {
      console.log("Messages sync already requested");
    }
  });
});
```

### Lắng nghe đồng bộ nền trong một Service Worker

Ví dụ sau cho thấy cách phản hồi một sự kiện đồng bộ nền trong service worker.

```js
self.addEventListener("sync", (event) => {
  if (event.tag === "sync-messages") {
    event.waitUntil(sendOutboxMessages());
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introducing Background Sync](https://developer.chrome.com/blog/background-sync/)
