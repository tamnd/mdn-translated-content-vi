---
title: "StorageAccessHandle: thuộc tính caches"
short-title: caches
slug: Web/API/StorageAccessHandle/caches
page-type: web-api-instance-property
browser-compat: api.StorageAccessHandle.caches
---

{{APIRef("Storage Access API")}}

Thuộc tính **`caches`** của giao diện {{domxref("StorageAccessHandle")}} trả về một đối tượng {{domxref("CacheStorage")}} không phân vùng nếu quyền truy cập được cấp, và ném ra `SecurityError` {{DOMxRef("DOMException")}} trong trường hợp khác.

## Giá trị

Một đối tượng {{domxref("CacheStorage")}}.

## Ví dụ

```js
document.requestStorageAccess({ caches: true }).then(
  (handle) => {
    console.log("caches access granted");
    const cache = await handle.caches.open("foo");
    await cache.add("/");
  },
  () => {
    console.log("caches access denied");
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
