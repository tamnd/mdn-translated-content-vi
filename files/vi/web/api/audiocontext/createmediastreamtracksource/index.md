---
title: "AudioContext: phương thức createMediaStreamTrackSource()"
short-title: createMediaStreamTrackSource()
slug: Web/API/AudioContext/createMediaStreamTrackSource
page-type: web-api-instance-method
browser-compat: api.AudioContext.createMediaStreamTrackSource
---

{{ APIRef("Web Audio API") }}

Phương thức **`createMediaStreamTrackSource()`** của giao diện {{domxref("AudioContext")}} tạo và trả về một {{domxref("MediaStreamTrackAudioSourceNode")}}, đại diện cho một nguồn âm thanh mà dữ liệu của nó đến từ {{domxref("MediaStreamTrack")}} được chỉ định.

Điều này khác với {{domxref("AudioContext.createMediaStreamSource", "createMediaStreamSource()")}}, vốn tạo một {{domxref("MediaStreamAudioSourceNode")}} có âm thanh đến từ audio track trong một {{domxref("MediaStream")}} được chỉ định mà {{domxref("MediaStreamTrack.id", "id")}} của nó đứng đầu theo thứ tự từ điển.

## Cú pháp

```js-nolint
createMediaStreamTrackSource(track)
```

### Tham số

- `track`
  - : {{domxref("MediaStreamTrack")}} sẽ được dùng làm nguồn cho toàn bộ dữ liệu âm thanh của nút mới.

### Giá trị trả về

Một đối tượng {{domxref("MediaStreamTrackAudioSourceNode")}} đóng vai trò nguồn cho dữ liệu âm thanh có trong audio track được chỉ định.

## Ví dụ

Trong ví dụ này, {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} được dùng để yêu cầu quyền truy cập micro của người dùng. Khi quyền truy cập đó đã có, một audio context được thiết lập và một {{domxref("MediaStreamTrackAudioSourceNode")}} được tạo bằng `createMediaStreamTrackSource()`, lấy âm thanh từ audio track đầu tiên trong luồng được `getUserMedia()` trả về.

Sau đó, một {{domxref("BiquadFilterNode")}} được tạo bằng {{domxref("BaseAudioContext/createBiquadFilter", "createBiquadFilter()")}}, rồi được cấu hình theo ý muốn để thực hiện bộ lọc lowshelf trên âm thanh đi từ nguồn vào. Đầu ra từ micro sau đó được định tuyến vào bộ lọc biquad mới, và đầu ra của bộ lọc lại được định tuyến tới {{domxref("BaseAudioContext/destination", "destination")}} của audio context.

```js
navigator.mediaDevices
  .getUserMedia({ audio: true, video: false })
  .then((stream) => {
    audio.srcObject = stream;
    audio.onloadedmetadata = (e) => {
      audio.play();
      audio.muted = true;
    };

    const audioCtx = new AudioContext();
    const audioTracks = stream.getAudioTracks();
    const source = audioCtx.createMediaStreamTrackSource(audioTracks[0]);

    const biquadFilter = audioCtx.createBiquadFilter();
    biquadFilter.type = "lowshelf";
    biquadFilter.frequency.value = 3000;
    biquadFilter.gain.value = 20;

    source.connect(biquadFilter);
    biquadFilter.connect(audioCtx.destination);
  })
  .catch((err) => {
    // Handle getUserMedia() error
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Web Audio API
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("MediaStreamTrackAudioSourceNode")}}
