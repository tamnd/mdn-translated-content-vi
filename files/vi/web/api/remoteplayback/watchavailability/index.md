---
title: "RemotePlayback: watchAvailability() method"
short-title: watchAvailability()
slug: Web/API/RemotePlayback/watchAvailability
page-type: web-api-instance-method
browser-compat: api.RemotePlayback.watchAvailability
---

{{APIRef("Remote Playback API")}}

Phương thức **`watchAvailability()`** của giao diện {{domxref("RemotePlayback")}} theo dõi danh sách các thiết bị phát từ xa khả dụng và trả về một {{jsxref("Promise")}} được giải quyết với `callbackId` của một thiết bị phát từ xa.

## Cú pháp

```js-nolint
watchAvailability(RemotePlaybackAvailabilityCallback)
```

### Tham số

- `RemotePlaybackAvailabilityCallback(boolean)`
  - : Một callback cho phép trang lấy tính khả dụng của thiết bị phát từ xa cho phần tử phương tiện tương ứng. Nó được truyền một giá trị boolean, nếu là true, cho biết phát từ xa khả dụng.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một số nguyên. Đây là `callbackId` cho thiết bị phát từ xa được xác định.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("HTMLMediaElement.disableRemotePlayback","disableRemotePlayback")}} là `true` cho phần tử phương tiện.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu tác nhân người dùng không thể liên tục theo dõi danh sách các thiết bị phát từ xa khả dụng.

## Ví dụ

Trong ví dụ sau, sau khi kiểm tra rằng không có thiết bị nào đang kết nối, `watchAvailability()` được dùng để theo dõi các thiết bị từ xa trở nên khả dụng. [Xem ví dụ hoạt động](https://beaufortfrancois.github.io/sandbox/media/remote-playback.html) (Yêu cầu thiết bị được hỗ trợ và một thiết bị phát từ xa đã kết nối).

```js
if (video.remote.state === "disconnected") {
  video.remote.watchAvailability(handleAvailabilityChange).then((id) => {
    log(`> Started watching remote device availability: ${id}`);
    callbackId = id;
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
