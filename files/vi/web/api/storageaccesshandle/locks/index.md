---
title: "StorageAccessHandle: thuộc tính locks"
short-title: locks
slug: Web/API/StorageAccessHandle/locks
page-type: web-api-instance-property
browser-compat: api.StorageAccessHandle.locks
---

{{APIRef("Storage Access API")}}

Thuộc tính **`locks`** của giao diện {{domxref("StorageAccessHandle")}} trả về một đối tượng {{domxref("LockManager")}} phiên không phân vùng nếu quyền truy cập được cấp, và ném ra `SecurityError` {{DOMxRef("DOMException")}} trong trường hợp khác.

## Giá trị

Một đối tượng {{domxref("LockManager")}}.

## Ví dụ

```js
document.requestStorageAccess({ locks: true }).then(
  (handle) => {
    console.log("locks access granted");
    handle.locks.request("foo", (lock) => "ok");
  },
  () => {
    console.log("locks access denied");
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
