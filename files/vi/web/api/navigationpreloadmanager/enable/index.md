---
title: "NavigationPreloadManager: phương thức enable()"
short-title: enable()
slug: Web/API/NavigationPreloadManager/enable
page-type: web-api-instance-method
browser-compat: api.NavigationPreloadManager.enable
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`enable()`** của giao diện {{domxref("NavigationPreloadManager")}} được sử dụng để bật tải trước các tài nguyên do service worker quản lý. Phương thức trả về một promise phân giải với `undefined`.

Phương thức nên được gọi trong trình xử lý sự kiện `activate` của service worker, đảm bảo nó được gọi trước khi bất kỳ trình xử lý sự kiện `fetch` nào có thể kích hoạt.

## Cú pháp

```js-nolint
enable()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Không có worker hoạt động nào liên kết với registration mà {{domxref("NavigationPreloadManager")}} này thuộc về.

## Ví dụ

Đoạn code dưới đây cho thấy cách bật tải trước, sau khi sử dụng {{domxref("ServiceWorkerRegistration.navigationPreload")}} để kiểm tra xem nó có được hỗ trợ không.

```js
addEventListener("activate", (event) => {
  event.waitUntil(
    (async () => {
      if (self.registration.navigationPreload) {
        // Enable navigation preloads!
        await self.registration.navigationPreload.enable();
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

{{domxref("NavigationPreloadManager.disable()")}}
