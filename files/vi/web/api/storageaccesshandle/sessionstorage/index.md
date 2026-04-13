---
title: "StorageAccessHandle: thuộc tính sessionStorage"
short-title: sessionStorage
slug: Web/API/StorageAccessHandle/sessionStorage
page-type: web-api-instance-property
browser-compat: api.StorageAccessHandle.sessionStorage
---

{{APIRef("Storage Access API")}}

Thuộc tính **`sessionStorage`** của giao diện {{domxref("StorageAccessHandle")}} trả về một đối tượng {{domxref("Storage")}} phiên không phân vùng nếu quyền truy cập được cấp, và ném ra `SecurityError` {{DOMxRef("DOMException")}} trong trường hợp khác.

## Giá trị

Một đối tượng {{domxref("Storage")}}.

## Ví dụ

```js
document.requestStorageAccess({ sessionStorage: true }).then(
  (handle) => {
    console.log("sessionStorage access granted");
    handle.sessionStorage.setItem("foo", "bar");
  },
  () => {
    console.log("sessionStorage access denied");
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
