---
title: PeriodicSyncManager
slug: Web/API/PeriodicSyncManager
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PeriodicSyncManager
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`PeriodicSyncManager`** của {{domxref('Web Periodic Background Synchronization API', '', '', 'nocode')}} cung cấp cách đăng ký các tác vụ để chạy trong service worker theo các khoảng thời gian định kỳ khi có kết nối mạng. Các tác vụ này được gọi là yêu cầu đồng bộ hóa nền định kỳ. Truy cập `PeriodicSyncManager` thông qua {{domxref('ServiceWorkerRegistration.periodicSync')}}.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref('PeriodicSyncManager.register()')}} {{Experimental_Inline}}
  - : Đăng ký yêu cầu đồng bộ hóa định kỳ với trình duyệt với tag và tùy chọn được chỉ định. Trả về {{jsxref('Promise')}} phân giải khi đăng ký hoàn tất.
- {{domxref('PeriodicSyncManager.getTags()')}} {{Experimental_Inline}}
  - : Trả về {{jsxref('Promise')}} phân giải với danh sách các đối tượng {{jsxref('String','chuỗi')}} đại diện cho các tag hiện đang được đăng ký để đồng bộ hóa định kỳ.
- {{domxref('PeriodicSyncManager.unregister()')}} {{Experimental_Inline}}
  - : Hủy đăng ký yêu cầu đồng bộ hóa định kỳ tương ứng với tag được chỉ định và trả về {{jsxref('Promise')}} phân giải khi hủy đăng ký hoàn tất.

## Ví dụ

Các ví dụ sau đây cho thấy cách sử dụng giao diện này.

### Yêu cầu Periodic Background Sync

Hàm bất đồng bộ sau đăng ký một periodic background sync với khoảng thời gian tối thiểu một ngày từ ngữ cảnh duyệt web:

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

### Xác minh Background Periodic Sync theo Tag

Code này kiểm tra xem tác vụ Periodic Background Sync với một tag nhất định có được đăng ký không.

```js
navigator.serviceWorker.ready.then((registration) => {
  registration.periodicSync.getTags().then((tags) => {
    if (tags.includes("get-latest-news")) skipDownloadingLatestNewsOnPageLoad();
  });
});
```

### Xóa tác vụ Periodic Background Sync

Code sau xóa tác vụ Periodic Background Sync để ngừng đồng bộ các bài viết trong nền.

```js
navigator.serviceWorker.ready.then((registration) => {
  registration.periodicSync.unregister("get-latest-news");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
