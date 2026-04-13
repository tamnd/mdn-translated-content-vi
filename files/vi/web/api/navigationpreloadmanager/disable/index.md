---
title: "NavigationPreloadManager: phương thức disable()"
short-title: disable()
slug: Web/API/NavigationPreloadManager/disable
page-type: web-api-instance-method
browser-compat: api.NavigationPreloadManager.disable
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`disable()`** của giao diện {{domxref("NavigationPreloadManager")}} dừng việc tải trước tự động các tài nguyên do service worker quản lý, mà trước đó đã được bắt đầu bằng {{domxref("NavigationPreloadManager.enable()","enable()")}}. Phương thức trả về một promise phân giải với `undefined`.

Phương thức có thể được gọi trong trình xử lý sự kiện `activate` của service worker (trước khi trình xử lý sự kiện `fetch` có thể được gọi).

## Cú pháp

```js-nolint
disable()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Không có worker hoạt động nào liên kết với registration mà {{domxref("NavigationPreloadManager")}} này thuộc về.

## Ví dụ

Đoạn code dưới đây cho thấy cách tắt tải trước, sau khi sử dụng {{domxref("ServiceWorkerRegistration.navigationPreload")}} để kiểm tra xem nó có được hỗ trợ không.

```js
addEventListener("activate", (event) => {
  event.waitUntil(
    (async () => {
      if (self.registration.navigationPreload) {
        // Disable navigation preloads!
        await self.registration.navigationPreload.disable();
      }
    })(),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

{{domxref("NavigationPreloadManager.enable()")}}
