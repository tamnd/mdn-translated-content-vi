---
title: "BackgroundFetchManager: phương thức get()"
short-title: get()
slug: Web/API/BackgroundFetchManager/get
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchManager.get
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`get()`** của giao diện {{domxref("BackgroundFetchManager")}} trả về một {{jsxref("Promise")}} được giải quyết bằng {{domxref("BackgroundFetchRegistration")}} gắn với `id` được cung cấp, hoặc {{jsxref("undefined")}} nếu không tìm thấy `id`.

## Cú pháp

```js-nolint
get(id)
```

### Tham số

- `id`
  - : Mã nhận dạng của một {{domxref("BackgroundFetchRegistration")}} được định nghĩa bằng cách gọi {{domxref("BackgroundFetchManager.fetch","fetch()")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết bằng một {{domxref("BackgroundFetchRegistration")}} hoặc {{jsxref("undefined")}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng `get()` để truy xuất một {{domxref("BackgroundFetchRegistration")}}. Khi có một [service worker](/en-US/docs/Web/API/ServiceWorker) đang hoạt động, hãy dùng {{domxref('ServiceWorkerRegistration.backgroundFetch')}} để truy cập đối tượng `BackgroundFetchManager` và gọi phương thức `get()` của nó.

```js
navigator.serviceWorker.ready.then(async (swReg) => {
  const bgFetch = await swReg.backgroundFetch.get("my-fetch");
});
// khối mã của tôi
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
