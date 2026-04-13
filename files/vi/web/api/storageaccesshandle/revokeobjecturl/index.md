---
title: "StorageAccessHandle: phương thức revokeObjectURL()"
short-title: revokeObjectURL()
slug: Web/API/StorageAccessHandle/revokeObjectURL
page-type: web-api-instance-method
browser-compat: api.StorageAccessHandle.revokeObjectURL
---

{{APIRef("Storage Access API")}}

> [!NOTE]
> Xem {{domxref("URL.revokeObjectURL_static", "revokeObjectURL()")}} để hiểu cách sử dụng.

## Cú pháp

```js-nolint
revokeObjectURL(objectURL)
```

### Tham số

- `objectURL`
  - : Xem {{domxref("URL.revokeObjectURL_static", "revokeObjectURL()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DomException")}}
  - : Được ném ra nếu quyền truy cập không được cấp.

Xem {{domxref("URL.revokeObjectURL_static", "revokeObjectURL()")}}

## Ví dụ

```js
document.requestStorageAccess({ revokeObjectURL: true }).then(
  (handle) => {
    console.log("revokeObjectURL access granted");
    handle.revokeObjectURL(blob_url);
  },
  () => {
    console.log("revokeObjectURL access denied");
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
