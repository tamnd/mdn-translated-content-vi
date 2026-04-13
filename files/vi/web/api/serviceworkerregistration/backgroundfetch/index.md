---
title: "ServiceWorkerRegistration: thuộc tính backgroundFetch"
short-title: backgroundFetch
slug: Web/API/ServiceWorkerRegistration/backgroundFetch
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ServiceWorkerRegistration.backgroundFetch
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`backgroundFetch`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một tham chiếu đến đối tượng {{domxref("BackgroundFetchManager")}}, có thể được sử dụng để khởi tạo các hoạt động fetch nền.

## Giá trị

Một đối tượng {{domxref("BackgroundFetchManager")}}.

## Ví dụ

### Khởi tạo một background fetch

Mã sau truy cập thuộc tính `backgroundFetch` và sử dụng nó để khởi tạo một hoạt động fetch nền.

```js
// main.js
async function requestBackgroundFetch(movieData) {
  const swRegistration = await navigator.serviceWorker.ready;
  const fetchRegistration = await swRegistration.backgroundFetch.fetch(
    "download-movie",
    ["/my-movie-part-1.webm", "/my-movie-part-2.webm"],
    {
      icons: movieIcons,
      title: "Downloading my movie",
      downloadTotal: 60 * 1024 * 1024,
      label: "Downloading a show",
    },
  );
  // …
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
