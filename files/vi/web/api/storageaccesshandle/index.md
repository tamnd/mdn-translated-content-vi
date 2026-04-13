---
title: StorageAccessHandle
slug: Web/API/StorageAccessHandle
page-type: web-api-interface
browser-compat: api.StorageAccessHandle
---

{{APIRef("Storage Access API")}}

Giao diện **`StorageAccessHandle`** đại diện cho quyền truy cập vào [trạng thái không phân vùng](/en-US/docs/Web/Privacy/Guides/State_Partitioning#state_partitioning) được cấp bởi một lệnh gọi đến {{domxref("Document.requestStorageAccess()")}}.

## Thuộc tính phiên bản

- {{domxref("StorageAccessHandle.sessionStorage")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("Storage")}} phiên không phân vùng nếu quyền truy cập được cấp.
- {{domxref("StorageAccessHandle.localStorage")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("Storage")}} cục bộ không phân vùng nếu quyền truy cập được cấp.
- {{domxref("StorageAccessHandle.indexedDB")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("IDBFactory")}} không phân vùng nếu quyền truy cập được cấp.
- {{domxref("StorageAccessHandle.locks")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("LockManager")}} không phân vùng nếu quyền truy cập được cấp.
- {{domxref("StorageAccessHandle.caches")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("CacheStorage")}} không phân vùng nếu quyền truy cập được cấp.

## Phương thức phiên bản

- {{domxref("StorageAccessHandle.getDirectory()")}}
  - : Trả về một {{jsxref("Promise")}} được thực hiện với một đối tượng {{domxref("FileSystemDirectoryHandle")}} không phân vùng nếu quyền truy cập được cấp, và bị từ chối trong trường hợp khác.
- {{domxref("StorageAccessHandle.estimate()")}}
  - : Trả về một {{jsxref("Promise")}} được thực hiện với một đối tượng {{domxref("StorageManager.estimate()", "StorageEstimate")}} không phân vùng nếu quyền truy cập được cấp, và bị từ chối trong trường hợp khác.
- {{domxref("StorageAccessHandle.createObjectURL()")}}
  - : Trả về một chuỗi đại diện cho URL blob bộ nhớ không phân vùng được tạo nếu quyền truy cập được cấp, và ném ngoại lệ trong trường hợp khác.
- {{domxref("StorageAccessHandle.revokeObjectURL()")}}
  - : Thu hồi URL blob bộ nhớ không phân vùng được truyền vào nếu quyền truy cập được cấp, và ném ngoại lệ trong trường hợp khác.
- {{domxref("StorageAccessHandle.BroadcastChannel()")}}
  - : Trả về {{domxref("BroadcastChannel")}} không phân vùng được tạo nếu quyền truy cập được cấp, và ném ngoại lệ trong trường hợp khác.
- {{domxref("StorageAccessHandle.SharedWorker()")}}
  - : Trả về {{domxref("SharedWorker")}} không phân vùng được tạo nếu quyền truy cập được cấp, và ném ngoại lệ trong trường hợp khác.

## Ví dụ

```js
document.requestStorageAccess({ localStorage: true }).then(
  (handle) => {
    console.log("localStorage access granted");
    handle.localStorage.setItem("foo", "bar");
  },
  () => {
    console.log("localStorage access denied");
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
