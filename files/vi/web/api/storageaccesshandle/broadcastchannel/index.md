---
title: "StorageAccessHandle: phương thức BroadcastChannel()"
short-title: BroadcastChannel()
slug: Web/API/StorageAccessHandle/BroadcastChannel
page-type: web-api-instance-method
browser-compat: api.StorageAccessHandle.BroadcastChannel
---

{{APIRef("Storage Access API")}}

> [!NOTE]
> Xem {{domxref("BroadcastChannel.BroadcastChannel", "BroadcastChannel()")}} để hiểu cách sử dụng.

## Cú pháp

```js-nolint
BroadcastChannel(channelName)
```

### Tham số

- `channelName`
  - : Xem {{domxref("BroadcastChannel.BroadcastChannel", "BroadcastChannel()")}}.

### Giá trị trả về

Một đối tượng {{domxref("BroadcastChannel")}} không phân vùng.

### Ngoại lệ

- `SecurityError` {{domxref("DomException")}}
  - : Được ném ra nếu quyền truy cập không được cấp.

Xem {{domxref("BroadcastChannel.BroadcastChannel", "BroadcastChannel()")}}

## Ví dụ

```js
document.requestStorageAccess({ BroadcastChannel: true }).then(
  (handle) => {
    console.log("BroadcastChannel access granted");
    handle.BroadcastChannel(channel_name);
  },
  () => {
    console.log("BroadcastChannel access denied");
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
