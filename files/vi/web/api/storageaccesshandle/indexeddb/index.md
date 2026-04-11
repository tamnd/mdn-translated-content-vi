---
title: "StorageAccessHandle: thuộc tính indexedDB"
short-title: indexedDB
slug: Web/API/StorageAccessHandle/indexedDB
page-type: web-api-instance-property
browser-compat: api.StorageAccessHandle.indexedDB
---

{{APIRef("Storage Access API")}}

Thuộc tính **`indexedDB`** của giao diện {{domxref("StorageAccessHandle")}} trả về một đối tượng {{domxref("IDBFactory")}} không phân vùng nếu quyền truy cập được cấp, và ném ra `SecurityError` {{DOMxRef("DOMException")}} trong trường hợp khác.

## Giá trị

Một đối tượng {{domxref("IDBFactory")}}.

## Ví dụ

```js
document.requestStorageAccess({ indexedDB: true }).then(
  (handle) => {
    console.log("indexedDB access granted");
    await handle.indexedDB.deleteDatabase("foo");
  },
  () => {
    console.log("indexedDB access denied");
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
