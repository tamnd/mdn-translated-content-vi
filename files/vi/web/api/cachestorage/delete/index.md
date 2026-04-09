---
title: "CacheStorage: phương thức delete()"
short-title: delete()
slug: Web/API/CacheStorage/delete
page-type: web-api-instance-method
browser-compat: api.CacheStorage.delete
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("CacheStorage")}} tìm đối tượng {{domxref("Cache")}} khớp với `cacheName`, và nếu tìm thấy thì xóa đối tượng {{domxref("Cache")}} đó rồi trả về một {{jsxref("Promise")}} phân giải thành `true`.
Nếu không tìm thấy đối tượng {{domxref("Cache")}} nào, promise sẽ phân giải thành `false`.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

## Cú pháp

```js-nolint
delete(cacheName)
```

### Tham số

- `cacheName`
  - : Tên của bộ nhớ đệm mà bạn muốn xóa.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `true` nếu đối tượng {{domxref("Cache")}} được tìm thấy và xóa thành công, ngược lại là `false`.

## Ví dụ

Trong đoạn mã này, chúng ta chờ một sự kiện kích hoạt rồi chạy khối {{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để dọn dẹp mọi bộ nhớ đệm cũ, không còn dùng đến trước khi service worker mới được kích hoạt. Ở đây chúng ta có một mảng tên bộ nhớ đệm muốn giữ lại (`cachesToKeep`). Chúng ta trả về các khóa của bộ nhớ đệm trong đối tượng {{domxref("CacheStorage")}} bằng {{domxref("CacheStorage.keys")}}, sau đó kiểm tra từng khóa xem nó có nằm trong mảng hay không. Nếu không, chúng ta xóa nó bằng `delete()`.

```js
this.addEventListener("activate", (event) => {
  const cachesToKeep = ["v2"];

  event.waitUntil(
    caches.keys().then((keyList) =>
      Promise.all(
        keyList.map((key) => {
          if (!cachesToKeep.includes(key)) {
            return caches.delete(key);
          }
          return undefined;
        }),
      ),
    ),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Worker](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
