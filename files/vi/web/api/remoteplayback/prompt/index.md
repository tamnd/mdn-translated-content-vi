---
title: "RemotePlayback: prompt() method"
short-title: prompt()
slug: Web/API/RemotePlayback/prompt
page-type: web-api-instance-method
browser-compat: api.RemotePlayback.prompt
---

{{APIRef("Remote Playback API")}}

Phương thức **`prompt()`** của giao diện {{domxref("RemotePlayback")}} nhắc người dùng chọn một thiết bị phát từ xa khả dụng và cấp quyền cho nội dung phương tiện hiện tại được phát bằng thiết bị đó.

Nếu người dùng cấp quyền, {{domxref("RemotePlayback.state","state")}} sẽ được đặt thành `connecting` và tác nhân người dùng sẽ kết nối với thiết bị để bắt đầu phát.

Nếu người dùng chọn ngắt kết nối khỏi thiết bị, {{domxref("RemotePlayback.state","state")}} sẽ được đặt thành `disconnected` và tác nhân người dùng sẽ ngắt kết nối khỏi thiết bị này.

## Cú pháp

```js-nolint
prompt()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined` sau khi người dùng chấp nhận hoặc từ chối lời nhắc.

### Ngoại lệ

Promise sẽ bị từ chối với một trong các ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("HTMLMediaElement.disableRemotePlayback","disableRemotePlayback")}} là `true` cho phần tử phương tiện.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu đã có một promise chưa được giải quyết từ lần gọi `prompt()` trước đó cho phần tử phương tiện hoặc ngữ cảnh duyệt web này.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu người dùng chưa tương tác với thiết bị này gần đây.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu tác nhân người dùng biết rằng phát từ xa của phương tiện cụ thể này không khả thi.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu phát từ xa không khả dụng.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu người dùng từ chối quyền sử dụng thiết bị.

## Bảo mật

Cần có [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation). Người dùng phải tương tác với trang hoặc phần tử giao diện người dùng để tính năng này hoạt động.

## Ví dụ

Trong ví dụ sau, người dùng được nhắc chọn một thiết bị phát từ xa để phát video.

```js
devicesBtn.onclick = () => {
  // Request the user to select a remote playback device.
  videoElem.remote
    .prompt()
    // Update the UI and monitor the connected state.
    .then(updateRemotePlaybackState);
  // Otherwise, the user cancelled the selection UI or no screens were found.
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
