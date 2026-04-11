---
title: "StorageAccessHandle: phương thức estimate()"
short-title: estimate()
slug: Web/API/StorageAccessHandle/estimate
page-type: web-api-instance-method
browser-compat: api.StorageAccessHandle.estimate
---

{{APIRef("Storage Access API")}}

> [!NOTE]
> Xem {{domxref("StorageManager.estimate()")}} để hiểu cách sử dụng.

## Cú pháp

```js-nolint
estimate()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với một đối tượng {{domxref("StorageManager.estimate()", "StorageEstimate")}} không phân vùng.

### Ngoại lệ

- `SecurityError` {{domxref("DomException")}}
  - : Được ném ra nếu quyền truy cập không được cấp.

Xem {{domxref("StorageManager.estimate()")}}

## Ví dụ

```js
document.requestStorageAccess({ estimate: true }).then(
  (handle) => {
    console.log("estimate access granted");
    await handle.estimate();
  },
  () => {
    console.log("estimate access denied");
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
