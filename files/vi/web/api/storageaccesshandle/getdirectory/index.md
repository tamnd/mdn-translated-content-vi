---
title: "StorageAccessHandle: phương thức getDirectory()"
short-title: getDirectory()
slug: Web/API/StorageAccessHandle/getDirectory
page-type: web-api-instance-method
browser-compat: api.StorageAccessHandle.getDirectory
---

{{APIRef("Storage Access API")}}

> [!NOTE]
> Xem {{domxref("StorageManager.getDirectory()")}} để hiểu cách sử dụng.

## Cú pháp

```js-nolint
getDirectory()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với một đối tượng {{domxref("FileSystemDirectoryHandle")}} không phân vùng.

### Ngoại lệ

- `SecurityError` {{domxref("DomException")}}
  - : Được ném ra nếu quyền truy cập không được cấp.

Xem {{domxref("StorageManager.getDirectory()")}}

## Ví dụ

```js
document.requestStorageAccess({ getDirectory: true }).then(
  (handle) => {
    console.log("getDirectory access granted");
    await handle.getDirectory();
  },
  () => {
    console.log("getDirectory access denied");
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
