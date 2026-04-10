---
title: "MediaStream: phương thức getTracks()"
short-title: getTracks()
slug: Web/API/MediaStream/getTracks
page-type: web-api-instance-method
browser-compat: api.MediaStream.getTracks
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getTracks()`** của giao diện {{domxref("MediaStream")}} trả về một dãy đại diện cho tất cả các đối tượng {{domxref("MediaStreamTrack")}} trong [tập hợp track](https://w3c.github.io/mediacapture-main/#dfn-track-set) của luồng này, bất kể {{domxref("MediaStreamTrack.kind")}}.

## Cú pháp

```js-nolint
getTracks()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("MediaStreamTrack")}}.

## Ví dụ

```js
navigator.mediaDevices
  .getUserMedia({ audio: false, video: true })
  .then((mediaStream) => {
    document.querySelector("video").srcObject = mediaStream;
    // Dừng luồng sau 5 giây
    setTimeout(() => {
      const tracks = mediaStream.getTracks();
      tracks[0].stop();
    }, 5000);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
