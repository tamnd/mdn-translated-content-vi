---
title: "MediaStreamAudioSourceNode: hàm khởi tạo MediaStreamAudioSourceNode()"
short-title: MediaStreamAudioSourceNode()
slug: Web/API/MediaStreamAudioSourceNode/MediaStreamAudioSourceNode
page-type: web-api-constructor
browser-compat: api.MediaStreamAudioSourceNode.MediaStreamAudioSourceNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`MediaStreamAudioSourceNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo và trả về một đối tượng {{domxref("MediaStreamAudioSourceNode")}} mới, sử dụng track âm thanh đầu tiên của {{domxref("MediaStream")}} đã cho làm nguồn.

> [!NOTE]
> Một cách khác để tạo `MediaStreamAudioSourceNode` là gọi phương thức {{domxref("AudioContext.createMediaStreamSource()")}}, chỉ định luồng mà bạn muốn lấy âm thanh từ đó.

## Cú pháp

```js-nolint
new MediaStreamAudioSourceNode(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("AudioContext")}} đại diện cho ngữ cảnh âm thanh mà bạn muốn liên kết nút với đó.
- `options`
  - : Đối tượng định nghĩa các thuộc tính mà bạn muốn `MediaStreamAudioSourceNode` có:
    - `mediaStream`
      - : Thuộc tính bắt buộc xác định {{domxref("MediaStream")}} để lấy âm thanh cho nút.

### Giá trị trả về

Đối tượng {{domxref("MediaStreamAudioSourceNode")}} mới đại diện cho nút âm thanh có phương tiện lấy từ luồng nguồn được chỉ định.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("MediaStream")}} được chỉ định không chứa bất kỳ track âm thanh nào.

## Ví dụ

Ví dụ này sử dụng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} để lấy quyền truy cập vào camera người dùng, sau đó tạo {{domxref("MediaStreamAudioSourceNode")}} mới từ {{domxref("MediaStream")}} của nó.

```js
// define variables
const audioCtx = new AudioContext();

// getUserMedia block - grab stream
// put it into a MediaStreamAudioSourceNode
if (navigator.mediaDevices.getUserMedia) {
  navigator.mediaDevices
    .getUserMedia(
      // constraints: audio and video for this app
      {
        audio: true,
        video: false,
      },
    )
    .then((stream) => {
      const options = {
        mediaStream: stream,
      };

      const source = new MediaStreamAudioSourceNode(audioCtx, options);
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
