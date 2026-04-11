---
title: "HTMLMediaElement: thuộc tính remote"
short-title: remote
slug: Web/API/HTMLMediaElement/remote
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.remote
---

{{APIRef("Remote Playback API")}}

Thuộc tính chỉ đọc **`remote`** của giao diện {{domxref("HTMLMediaElement")}} trả về đối tượng {{domxref("RemotePlayback")}} được liên kết với thành phần media. Đối tượng `RemotePlayback` cho phép điều khiển các thiết bị từ xa đang phát phương tiện.

## Giá trị

Đối tượng {{domxref("RemotePlayback")}} được liên kết với phần tử media.

## Ví dụ

```js
const el = document.createElement("audio");
const remotePlayback = el.remote;

remotePlayback.watchAvailability((availability) => {
  // Do something when the availability changes
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
