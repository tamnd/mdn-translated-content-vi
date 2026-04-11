---
title: "StorageAccessHandle: phương thức SharedWorker()"
short-title: SharedWorker()
slug: Web/API/StorageAccessHandle/SharedWorker
page-type: web-api-instance-method
browser-compat: api.StorageAccessHandle.SharedWorker
---

{{APIRef("Storage Access API")}}

> [!NOTE]
> Xem {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}} để hiểu cách sử dụng.

## Cú pháp

```js-nolint
SharedWorker(url)
SharedWorker(url, name)
SharedWorker(url, options)
```

### Tham số

- `url`
  - : Xem {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}.
- `name` {{optional_inline}}
  - : Xem {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}.
- `options` {{optional_inline}}
  - : Xem {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}.

> [!NOTE]
> `options.sameSiteCookies` chỉ hỗ trợ giá trị "none", đây là giá trị mặc định.

### Giá trị trả về

Một đối tượng {{domxref("SharedWorker")}} không phân vùng.

### Ngoại lệ

- `SecurityError` {{domxref("DomException")}}
  - : Được ném ra nếu quyền truy cập không được cấp.

Xem {{domxref("SharedWorker.SharedWorker", "SharedWorker()")}}

## Ví dụ

```js
document.requestStorageAccess({ SharedWorker: true }).then(
  (handle) => {
    console.log("SharedWorker access granted");
    handle.SharedWorker(shared_worker_url);
  },
  () => {
    console.log("SharedWorker access denied");
  },
);
```

> [!NOTE]
> Xem [Using the Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using) để biết ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.requestStorageAccess()")}}
- [Using the Storage Access API](/en-US/docs/Web/API/Storage_Access_API/Using)
