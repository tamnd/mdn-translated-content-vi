---
title: "PeriodicSyncManager: unregister() method"
short-title: unregister()
slug: Web/API/PeriodicSyncManager/unregister
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PeriodicSyncManager.unregister
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`unregister()`** của giao diện {{domxref("PeriodicSyncManager")}} hủy đăng ký yêu cầu đồng bộ hóa định kỳ tương ứng với tag được chỉ định và trả về {{jsxref('Promise')}} phân giải khi hủy đăng ký hoàn tất.

## Cú pháp

```js-nolint
unregister(tag)
```

### Tham số

- tag
  - : Định danh {{jsxref('String')}} duy nhất mô tả đồng bộ hóa nền cụ thể.

### Giá trị trả về

Trả về {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.

### Ngoại lệ

Không có.

## Ví dụ

Ví dụ sau xóa một đồng bộ hóa định kỳ để ngừng đồng bộ các bài viết trong nền.

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
