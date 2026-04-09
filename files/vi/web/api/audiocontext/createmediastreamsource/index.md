---
title: "AudioContext: phương thức createMediaStreamSource()"
short-title: createMediaStreamSource()
slug: Web/API/AudioContext/createMediaStreamSource
page-type: web-api-instance-method
browser-compat: api.AudioContext.createMediaStreamSource
---

{{ APIRef("Web Audio API") }}

Phương thức `createMediaStreamSource()` của giao diện {{ domxref("AudioContext") }} được dùng để tạo một đối tượng {{ domxref("MediaStreamAudioSourceNode") }} mới từ một media stream (ví dụ, từ một thể hiện {{ domxref("MediaDevices.getUserMedia") }}), âm thanh từ đó sau đó có thể được phát và xử lý.

Để biết thêm chi tiết về các media stream audio source node, hãy xem trang tham chiếu {{domxref("MediaStreamAudioSourceNode")}}.

## Syntax

```js-nolint
createMediaStreamSource(stream)
```

### Parameters

- `stream`
  - : Một {{domxref("MediaStream")}} đóng vai trò nguồn âm thanh để đưa vào đồ thị xử lý âm thanh cho việc sử dụng và thao tác.

### Return value

Một đối tượng {{domxref("MediaStreamAudioSourceNode")}} mới biểu diễn nút âm thanh có phương tiện được lấy từ media stream nguồn đã chỉ định.

## Examples

Trong ví dụ này, chúng ta lấy một media stream (âm thanh + video) từ {{domxref("navigator.getUserMedia")}}, đưa phương tiện vào một phần tử {{htmlelement("video")}} để phát rồi tắt tiếng âm thanh, nhưng đồng thời cũng đưa âm thanh vào một {{domxref("MediaStreamAudioSourceNode")}}.
Tiếp theo, chúng ta đưa nguồn âm thanh này vào một {{ domxref("BiquadFilterNode") }} low-pass (về cơ bản đóng vai trò như bộ tăng cường bass),
rồi đến {{domxref("AudioDestinationNode") }}.

Thanh trượt phạm vi bên dưới phần tử {{ htmlelement("video") }} điều khiển lượng gain áp dụng cho bộ lọc low-pass. Tăng giá trị thanh trượt sẽ làm âm thanh nghe nặng bass hơn.

> [!NOTE]
> Bạn có thể xem [ví dụ này chạy trực tiếp](https://mdn.github.io/webaudio-examples/stream-source-buffer/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/stream-source-buffer).

```js
const pre = document.querySelector("pre");
const video = document.querySelector("video");
const myScript = document.querySelector("script");
const range = document.querySelector("input");

// getUserMedia block - grab stream
// put it into a MediaStreamAudioSourceNode
// also output the visuals into a video element

if (navigator.mediaDevices) {
  console.log("getUserMedia supported.");
  navigator.mediaDevices
    .getUserMedia({ audio: true, video: true })
    .then((stream) => {
      video.srcObject = stream;
      video.onloadedmetadata = (e) => {
        video.play();
        video.muted = true;
      };

      // Create a MediaStreamAudioSourceNode
      // Feed the HTMLMediaElement into it
      const audioCtx = new AudioContext();
      const source = audioCtx.createMediaStreamSource(stream);

      // Create a biquad filter
      const biquadFilter = audioCtx.createBiquadFilter();
      biquadFilter.type = "lowshelf";
      biquadFilter.frequency.value = 1000;
      biquadFilter.gain.value = range.value;

      // connect the AudioBufferSourceNode to the gainNode
      // and the gainNode to the destination, so we can play the
      // music and adjust the volume using the mouse cursor
      source.connect(biquadFilter);
      biquadFilter.connect(audioCtx.destination);

      // Get new mouse pointer coordinates when mouse is moved
      // then set new gain value

      range.oninput = () => {
        biquadFilter.gain.value = range.value;
      };
    })
    .catch((err) => {
      console.log(`The following gUM error occurred: ${err}`);
    });
} else {
  console.log("getUserMedia not supported on your browser!");
}

// dump script to pre element

pre.textContent = myScript.textContent;
```

> [!NOTE]
> Do hệ quả của việc gọi `createMediaStreamSource()`, âm thanh từ media stream sẽ được định tuyến lại vào đồ thị xử lý của {{domxref("AudioContext")}}. Vì vậy, bạn vẫn có thể phát/tạm dừng luồng thông qua API của phần tử phương tiện và các nút điều khiển trình phát.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
