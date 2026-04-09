---
title: "AudioContext: phương thức createMediaElementSource()"
short-title: createMediaElementSource()
slug: Web/API/AudioContext/createMediaElementSource
page-type: web-api-instance-method
browser-compat: api.AudioContext.createMediaElementSource
---

{{ APIRef("Web Audio API") }}

Phương thức `createMediaElementSource()` của giao diện {{ domxref("AudioContext") }} được dùng để tạo một đối tượng {{ domxref("MediaElementAudioSourceNode") }} mới từ một phần tử HTML {{htmlelement("audio")}} hoặc {{htmlelement("video")}} hiện có; âm thanh từ phần tử đó sau đó có thể được phát và xử lý.

Để biết thêm chi tiết về các media element audio source node, hãy xem trang tham chiếu {{ domxref("MediaElementAudioSourceNode") }}.

## Syntax

```js-nolint
createMediaElementSource(myMediaElement)
```

### Parameters

- `myMediaElement`
  - : Một đối tượng {{domxref("HTMLMediaElement")}} mà bạn muốn đưa vào đồ thị xử lý âm thanh để thao tác.

### Return value

Một {{domxref("MediaElementAudioSourceNode")}}.

## Examples

Ví dụ đơn giản này tạo một nguồn từ phần tử {{htmlelement("audio") }} bằng `createMediaElementSource()`, sau đó đưa âm thanh qua một {{ domxref("GainNode") }} trước khi chuyển tới {{ domxref("AudioDestinationNode") }} để phát. Khi con trỏ chuột di chuyển, hàm `updatePage()` được gọi và tính gain hiện tại theo tỉ lệ giữa vị trí Y của chuột và chiều cao tổng thể của cửa sổ. Vì vậy, bạn có thể tăng hoặc giảm âm lượng nhạc đang phát bằng cách di chuyển con trỏ chuột lên xuống.

> [!NOTE]
> Bạn cũng có thể [xem ví dụ này chạy trực tiếp](https://mdn.github.io/webaudio-examples/media-source-buffer/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/media-source-buffer).

```js
const audioCtx = new AudioContext();
const myAudio = document.querySelector("audio");

// Create a MediaElementAudioSourceNode
// Feed the HTMLMediaElement into it
const source = audioCtx.createMediaElementSource(myAudio);

// Create a gain node
const gainNode = audioCtx.createGain();

// Create variables to store mouse pointer Y coordinate
// and HEIGHT of screen
let curY;
const HEIGHT = window.innerHeight;

// Get new mouse pointer coordinates when mouse is moved
// then set new gain value
document.onmousemove = updatePage;

function updatePage(e) {
  curY = e.pageY;
  gainNode.gain.value = curY / HEIGHT;
}

// Connect the AudioBufferSourceNode to the gainNode
// and the gainNode to the destination, so we can play the
// music and adjust the volume using the mouse cursor
source.connect(gainNode);
gainNode.connect(audioCtx.destination);
```

> [!NOTE]
> Do hệ quả của việc gọi `createMediaElementSource()`, việc phát âm thanh từ {{domxref("HTMLMediaElement")}} sẽ được định tuyến lại vào đồ thị xử lý của AudioContext. Vì vậy, bạn vẫn có thể phát/tạm dừng phương tiện thông qua API của phần tử phương tiện và các nút điều khiển trình phát.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
