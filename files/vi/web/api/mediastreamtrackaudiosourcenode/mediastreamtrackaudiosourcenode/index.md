---
title: "MediaStreamTrackAudioSourceNode: hàm khởi tạo MediaStreamTrackAudioSourceNode()"
short-title: MediaStreamTrackAudioSourceNode()
slug: Web/API/MediaStreamTrackAudioSourceNode/MediaStreamTrackAudioSourceNode
page-type: web-api-constructor
browser-compat: api.MediaStreamTrackAudioSourceNode.MediaStreamTrackAudioSourceNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`MediaStreamTrackAudioSourceNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo và trả về một đối tượng {{domxref("MediaStreamTrackAudioSourceNode")}} mới mà âm thanh của nó được lấy từ {{domxref("MediaStreamTrack")}} được chỉ định trong đối tượng tùy chọn đã cho.

Cách khác để tạo `MediaStreamTrackAudioSourceNode` là gọi phương thức {{domxref("AudioContext.createMediaStreamTrackSource()")}}, chỉ định {{domxref("MediaStreamTrack")}} mà bạn muốn lấy âm thanh.

## Cú pháp

```js-nolint
new MediaStreamTrackAudioSourceNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("AudioContext")}} đại diện cho ngữ cảnh âm thanh mà bạn muốn node liên kết với.
- `options`
  - : Một đối tượng định nghĩa các thuộc tính bạn muốn `MediaStreamTrackAudioSourceNode` có:
    - `mediaStreamTrack`
      - : {{domxref("MediaStreamTrack")}} từ đó lấy dữ liệu âm thanh cho đầu ra của node này.

### Giá trị trả về

Một đối tượng {{domxref("MediaStreamTrackAudioSourceNode")}} mới đại diện cho node âm thanh có media được lấy từ track media đã chỉ định.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu `context` được chỉ định không phải là {{domxref("AudioContext")}}.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("MediaStreamTrack")}} được chỉ định không phải là track âm thanh (tức là thuộc tính {{domxref("MediaStreamTrack.kind", "kind")}} của nó không phải là `audio`).

## Ví dụ

Ví dụ này sử dụng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} để truy cập camera của người dùng, sau đó tạo một {{domxref("MediaStreamAudioSourceNode")}} mới từ track âm thanh đầu tiên do thiết bị cung cấp.

```js
const audioCtx = new AudioContext();

if (navigator.mediaDevices.getUserMedia) {
  navigator.mediaDevices
    .getUserMedia({
      audio: true,
      video: false,
    })
    .then((stream) => {
      const options = {
        mediaStreamTrack: stream.getAudioTracks()[0],
      };

      const source = new MediaStreamTrackAudioSourceNode(audioCtx, options);
      source.connect(audioCtx.destination);
    })
    .catch((err) => {
      console.error(`The following gUM error occurred: ${err}`);
    });
} else {
  console.log("new getUserMedia not supported on your browser!");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
