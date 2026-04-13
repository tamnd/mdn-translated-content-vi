---
title: Web Periodic Background Synchronization API
slug: Web/API/Web_Periodic_Background_Synchronization_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.PeriodicSyncManager
  - api.ServiceWorkerGlobalScope.periodicsync_event
spec-urls: https://wicg.github.io/periodic-background-sync/
---

{{DefaultAPISidebar("Periodic Background Sync")}}{{SecureContext_Header}}{{SeeCompatTable}}{{AvailableInWorkers}}

**Web Periodic Background Synchronization API** cung cấp cách đăng ký các tác vụ để chạy trong {{domxref("Service Worker API", "service worker", "", "nocode")}} ở các khoảng thời gian định kỳ khi có kết nối mạng. Các tác vụ này được gọi là periodic background sync requests.

## Khái niệm và cách sử dụng

Periodic Background Sync API cho phép ứng dụng web thông báo cho service worker của chúng để thực hiện bất kỳ cập nhật nào, theo khoảng thời gian định kỳ. Các trường hợp sử dụng có thể bao gồm fetch nội dung mới nhất khi thiết bị được kết nối Wi-Fi, hoặc cho phép cập nhật nền cho ứng dụng.

Khoảng thời gian tối thiểu được đặt khi API được gọi; tuy nhiên user agent cũng có thể tính đến các yếu tố khác ảnh hưởng đến khi service worker nhận sự kiện. Ví dụ, mức độ tương tác với trang web trước đây, hoặc kết nối với mạng đã biết.

Giao diện {{domxref('PeriodicSyncManager')}} có thể truy cập thông qua {{domxref('ServiceWorkerRegistration.periodicSync')}}. Một định danh tag duy nhất được đặt để 'đặt tên' cho sự kiện sync, sau đó có thể được lắng nghe trong script {{domxref('ServiceWorker')}}. Khi sự kiện được nhận, bạn có thể chạy bất kỳ chức năng nào có sẵn, như cập nhật cache hoặc fetch tài nguyên mới.

Vì API này dựa vào service workers, chức năng do API này cung cấp chỉ khả dụng trong ngữ cảnh bảo mật.

## Giao diện

- {{domxref("PeriodicSyncManager")}} {{Experimental_Inline}}
  - : Đăng ký các tác vụ để chạy trong service worker theo khoảng thời gian định kỳ với kết nối mạng.
- {{domxref("PeriodicSyncEvent")}} {{Experimental_Inline}}
  - : Đại diện cho sự kiện đồng bộ hóa, được gửi đến {{domxref("ServiceWorkerGlobalScope", "phạm vi toàn cục", "", "nocode")}} của {{domxref("Service Worker API", "ServiceWorker", "", "nocode")}}. Nó cung cấp cách chạy các tác vụ trong service worker với kết nối mạng.

### Mở rộng cho các giao diện khác

- {{domxref("ServiceWorkerRegistration.periodicSync")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tham chiếu đến giao diện {{domxref("PeriodicSyncManager")}} để đăng ký các tác vụ chạy ở các khoảng thời gian cụ thể.
- {{domxref("ServiceWorkerGlobalScope/periodicsync_event", "periodicsync")}} event {{Experimental_Inline}}
  - : Xảy ra theo khoảng thời gian định kỳ, được chỉ định khi đăng ký {{domxref("PeriodicSyncManager")}}.

## Ví dụ

### Yêu cầu Periodic Background Sync

Hàm bất đồng bộ sau đăng ký một periodic background sync ở khoảng thời gian tối thiểu một ngày từ ngữ cảnh duyệt web:

```js
async function registerPeriodicNewsCheck() {
  const registration = await navigator.serviceWorker.ready;
  try {
    await registration.periodicSync.register("get-latest-news", {
      minInterval: 24 * 60 * 60 * 1000,
    });
  } catch {
    console.log("Periodic Sync could not be registered!");
  }
}
```

### Xác minh Periodic Background Sync bằng tag

Code này kiểm tra xem tác vụ Periodic Background Sync với tag đã cho có được đăng ký hay không.

```js
navigator.serviceWorker.ready.then((registration) => {
  registration.periodicSync.getTags().then((tags) => {
    if (tags.includes("get-latest-news")) skipDownloadingLatestNewsOnPageLoad();
  });
});
```

### Xóa tác vụ Periodic Background Sync

Code sau xóa tác vụ Periodic Background Sync để dừng đồng bộ bài viết trong nền.

```js
navigator.serviceWorker.ready.then((registration) => {
  registration.periodicSync.unregister("get-latest-news");
});
```

### Lắng nghe Periodic Background Sync trong Service Worker

Ví dụ sau cho thấy cách phản hồi sự kiện periodic sync trong service worker.

```js
self.addEventListener("periodicsync", (event) => {
  if (event.tag === "get-latest-news") {
    event.waitUntil(fetchAndCacheLatestNews());
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [An article on using Periodic Background Sync](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
