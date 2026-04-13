---
title: "ServiceWorkerRegistration: thuộc tính index"
short-title: index
slug: Web/API/ServiceWorkerRegistration/index
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ServiceWorkerRegistration.index
---

{{APIRef("Service Workers API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`index`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một tham chiếu đến giao diện {{domxref('ContentIndex')}}, cho phép lập chỉ mục nội dung ngoại tuyến.

## Giá trị

Một đối tượng {{domxref('ContentIndex')}}.

## Ví dụ

Bạn có thể truy cập thuộc tính từ tập lệnh chính hoặc service worker đã đăng ký.

Đây là một ví dụ từ tập lệnh chính:

```js
// reference registration
const registration = await navigator.serviceWorker.ready;

// feature detection
if ("index" in registration) {
  // Content Index API functionality
  const contentIndex = registration.index;
}
```

Từ [service worker](/en-US/docs/Web/API/ServiceWorker):

```js
// service worker script

const contentIndex = self.registration.index;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Content Index API](/en-US/docs/Web/API/Content_Index_API)
- [Bài viết giới thiệu về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
