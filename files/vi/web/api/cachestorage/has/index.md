---
title: "CacheStorage: phương thức has()"
short-title: has()
slug: Web/API/CacheStorage/has
page-type: web-api-instance-method
browser-compat: api.CacheStorage.has
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`has()`** của giao diện {{domxref("CacheStorage")}}
trả về một {{jsxref("Promise")}} phân giải thành `true` nếu có
đối tượng {{domxref("Cache")}} khớp với `cacheName`.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

## Cú pháp

```js-nolint
has(cacheName)
```

### Tham số

- `cacheName`
  - : Một chuỗi biểu diễn tên của đối tượng {{domxref("Cache")}} mà bạn đang tìm trong {{domxref("CacheStorage")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `true` nếu bộ nhớ đệm tồn tại hoặc
`false` nếu không.

## Ví dụ

Ví dụ sau trước tiên kiểm tra xem có tồn tại bộ nhớ đệm tên 'v1' hay không. Nếu có, chúng ta thêm một
danh sách tài nguyên vào đó. Nếu không thì chúng ta chạy một hàm thiết lập bộ nhớ đệm nào đó.

```js
caches
  .has("v1")
  .then((hasCache) => {
    if (!hasCache) {
      someCacheSetupFunction();
    } else {
      caches.open("v1").then((cache) => cache.addAll(myAssets));
    }
  })
  .catch(() => {
    // Xử lý ngoại lệ tại đây.
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
