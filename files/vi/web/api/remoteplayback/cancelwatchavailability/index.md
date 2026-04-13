---
title: "RemotePlayback: cancelWatchAvailability() method"
short-title: cancelWatchAvailability()
slug: Web/API/RemotePlayback/cancelWatchAvailability
page-type: web-api-instance-method
browser-compat: api.RemotePlayback.cancelWatchAvailability
---

{{APIRef("Remote Playback API")}}

Phương thức **`cancelWatchAvailability()`** của giao diện {{domxref("RemotePlayback")}} hủy yêu cầu theo dõi một hoặc tất cả các thiết bị khả dụng.

## Cú pháp

```js-nolint
cancelWatchAvailability()
cancelWatchAvailability(id)
```

### Tham số

- `id` {{optional_inline}}
  - : `callbackId` của một thiết bị phát từ xa cụ thể.

    Nếu `callbackId` của một thiết bị cụ thể được truyền vào, thiết bị đó sẽ bị xóa khỏi danh sách các thiết bị đang được theo dõi. Ngược lại, toàn bộ danh sách sẽ bị xóa.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("HTMLMediaElement.disableRemotePlayback","disableRemotePlayback")}} là `true` cho phần tử phương tiện.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu `id` được truyền vào nhưng không khớp với bất kỳ `callbackId` khả dụng nào.

## Ví dụ

Sau khi một thiết bị phát từ xa đã được xác định và kết nối, việc theo dõi các thiết bị khả dụng có thể được dừng bằng cách dùng `cancelWatchAvailability()`.

```js
function switchToRemoteUI() {
  // Indicate that the state is 'connecting' or 'connected' to the user.
  // For example, hide the video element as only controls are needed.
  videoElem.style.display = "none";

  // Stop monitoring the availability of remote playback devices.
  videoElem.remote.cancelWatchAvailability();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
