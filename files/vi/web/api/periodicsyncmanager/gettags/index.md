---
title: "PeriodicSyncManager: getTags() method"
short-title: getTags()
slug: Web/API/PeriodicSyncManager/getTags
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PeriodicSyncManager.getTags
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`getTags()`** của giao diện {{domxref("PeriodicSyncManager")}} trả về {{jsxref('Promise')}} phân giải với danh sách các đối tượng {{jsxref('String')}} đại diện cho các tag hiện đang được đăng ký để đồng bộ hóa định kỳ.

## Cú pháp

```js-nolint
getTags()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} phân giải với danh sách các đối tượng {{jsxref('String')}} đại diện cho các tag hiện đang được đăng ký để đồng bộ hóa định kỳ.

### Ngoại lệ

Không có.

## Ví dụ

Ví dụ sau sử dụng phương thức `getTags()` để kiểm tra xem tác vụ đồng bộ hóa định kỳ với một tag nhất định có được đăng ký không.

```js
navigator.serviceWorker.ready.then((registration) => {
  registration.periodicSync.getTags().then((tags) => {
    if (tags.includes("get-latest-news")) skipDownloadingLatestNewsOnPageLoad();
  });
});
```

`skipDownloadingLatestNewsOnPageLoad()` là một hàm do nhà phát triển định nghĩa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
