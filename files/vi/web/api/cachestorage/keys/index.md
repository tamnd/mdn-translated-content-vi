---
title: "CacheStorage: phương thức keys()"
short-title: keys()
slug: Web/API/CacheStorage/keys
page-type: web-api-instance-method
browser-compat: api.CacheStorage.keys
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`keys()`** của giao diện {{domxref("CacheStorage")}} trả về một {{jsxref("Promise")}} sẽ phân giải với một mảng chứa các chuỗi tương ứng với mọi đối tượng {{domxref("Cache")}} có tên mà đối tượng {{domxref("CacheStorage")}} đang theo dõi theo thứ tự chúng được tạo.
Dùng phương thức này để duyệt qua danh sách tất cả các đối tượng {{domxref("Cache")}}.

Bạn có thể truy cập `CacheStorage` thông qua thuộc tính {{domxref("Window.caches")}} trong cửa sổ hoặc thông qua thuộc tính {{domxref("WorkerGlobalScope.caches")}} trong worker.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với một mảng chứa các tên {{domxref("Cache")}} bên trong đối tượng {{domxref("CacheStorage")}}.

## Ví dụ

Trong đoạn mã này, chúng ta chờ sự kiện {{domxref("ServiceWorkerGlobalScope.activate_event", "activate")}}, sau đó chạy một khối {{domxref("ExtendableEvent.waitUntil","waitUntil()")}} để dọn sạch mọi bộ nhớ đệm cũ không còn dùng trước khi một service worker mới được kích hoạt.
Ở đây chúng ta có một danh sách cho phép chứa tên các bộ nhớ đệm muốn giữ lại (`cacheAllowlist`).
Chúng ta lấy các khóa của các bộ nhớ đệm trong đối tượng {{domxref("CacheStorage")}} bằng `keys()`, sau đó kiểm tra từng khóa xem có nằm trong danh sách cho phép hay không.
Nếu không, chúng ta xóa nó bằng {{domxref("CacheStorage.delete()")}}.

```js
this.addEventListener("activate", (event) => {
  const cacheAllowlist = ["v2"];

  event.waitUntil(
    caches.keys().then((keyList) =>
      Promise.all(
        keyList.map((key) => {
          if (!cacheAllowlist.includes(key)) {
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

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- {{domxref("Cache")}}
- {{domxref("Window.caches")}} và {{domxref("WorkerGlobalScope.caches")}}
