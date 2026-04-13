---
title: "StorageAccessHandle: thuộc tính localStorage"
short-title: localStorage
slug: Web/API/StorageAccessHandle/localStorage
page-type: web-api-instance-property
browser-compat: api.StorageAccessHandle.localStorage
---

{{APIRef("Storage Access API")}}

Thuộc tính **`localStorage`** của giao diện {{domxref("StorageAccessHandle")}} trả về một đối tượng {{domxref("Storage")}} cục bộ không phân vùng nếu quyền truy cập được cấp, và ném ra `SecurityError` {{DOMxRef("DOMException")}} trong trường hợp khác.

## Giá trị

Một đối tượng {{domxref("Storage")}}.

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
