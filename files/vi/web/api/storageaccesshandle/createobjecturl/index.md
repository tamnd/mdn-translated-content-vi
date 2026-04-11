---
title: "StorageAccessHandle: phương thức createObjectURL()"
short-title: createObjectURL()
slug: Web/API/StorageAccessHandle/createObjectURL
page-type: web-api-instance-method
browser-compat: api.StorageAccessHandle.createObjectURL
---

{{APIRef("Storage Access API")}}

> [!NOTE]
> Xem {{domxref("URL.createObjectURL_static", "createObjectURL()")}} để hiểu cách sử dụng.

## Cú pháp

```js-nolint
createObjectURL(object)
```

### Tham số

- `object`
  - : Xem {{domxref("URL.createObjectURL_static", "createObjectURL()")}}.

### Giá trị trả về

Một chuỗi chứa URL đối tượng không phân vùng có thể được sử dụng để tham chiếu đến nội dung của `object` nguồn được chỉ định.

### Ngoại lệ

- `SecurityError` {{domxref("DomException")}}
  - : Được ném ra nếu quyền truy cập không được cấp.

Xem {{domxref("URL.createObjectURL_static", "createObjectURL()")}}

## Ví dụ

```js
document.requestStorageAccess({ createObjectURL: true }).then(
  (handle) => {
    console.log("createObjectURL access granted");
    handle.createObjectURL(new Blob(["foo"]));
  },
  () => {
    console.log("createObjectURL access denied");
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
