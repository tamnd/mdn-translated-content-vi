---
title: Thao tác audio và video
slug: Web/Media/Guides/Audio_and_video_manipulation
page-type: guide
sidebar: mediasidebar
---

Điểm đẹp của web là bạn có thể kết hợp các công nghệ để tạo ra những hình thức mới. Việc có audio và video nguyên bản trong trình duyệt nghĩa là chúng ta có thể dùng các luồng dữ liệu này với những công nghệ như {{htmlelement("canvas")}}, [WebGL](/en-US/docs/Web/API/WebGL_API) hoặc [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) để chỉnh sửa trực tiếp audio và video, ví dụ như thêm hiệu ứng vang/nén cho audio hoặc bộ lọc grayscale/sepia cho video. Bài viết này cung cấp tài liệu tham khảo để giải thích bạn cần làm gì.

## Thao tác video

Khả năng đọc giá trị pixel từ từng frame của video có thể rất hữu ích.

### Video và canvas

Phần tử {{htmlelement("canvas")}} cung cấp một bề mặt để vẽ đồ họa lên các trang web; nó rất mạnh mẽ và có thể kết hợp chặt chẽ với video.

Kỹ thuật chung là:

1. Ghi một frame từ phần tử {{htmlelement("video")}} lên phần tử {{htmlelement("canvas")}}.
2. Đọc dữ liệu từ phần tử `<canvas>` và chỉnh sửa nó.
3. Ghi dữ liệu đã chỉnh sửa lên `<canvas>` "hiển thị" của bạn (thực tế có thể chính là cùng một phần tử).
4. Tạm dừng và lặp lại.

Ví dụ, hãy xử lý một video để hiển thị ở dạng xám. Trong trường hợp này, chúng ta sẽ hiển thị cả video nguồn và các frame đầu ra ở dạng xám. Thông thường, nếu bạn đang triển khai tính năng "phát video ở dạng xám", có lẽ bạn sẽ thêm `display: none` vào style của phần tử `<video>` để ngăn video nguồn được vẽ lên màn hình trong khi chỉ hiển thị canvas với các frame đã bị thay đổi.

#### HTML

Chúng ta có thể thiết lập trình phát video và phần tử `<canvas>` như sau:

```html
<video id="my-video" controls width="480" height="270" crossorigin="anonymous">
  <source
    src="https://jplayer.org/video/webm/Big_Buck_Bunny_Trailer.webm"
    type="video/webm" />
  <source
    src="https://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"
    type="video/mp4" />
</video>

<canvas id="my-canvas" width="480" height="270"></canvas>
```

#### JavaScript

Đoạn mã này xử lý việc thay đổi các frame.

```js
const processor = {
  timerCallback() {
    if (this.video.paused || this.video.ended) {
      return;
    }
    this.computeFrame();
    setTimeout(() => {
      this.timerCallback();
    }, 16); // xấp xỉ 60 khung hình mỗi giây
  },

  doLoad() {
    this.video = document.getElementById("my-video");
    this.c1 = document.getElementById("my-canvas");
    this.ctx1 = this.c1.getContext("2d");

    this.video.addEventListener("play", () => {
      this.width = this.video.width;
      this.height = this.video.height;
      this.timerCallback();
    });
  },

  computeFrame() {
    this.ctx1.drawImage(this.video, 0, 0, this.width, this.height);
    const frame = this.ctx1.getImageData(0, 0, this.width, this.height);
    const l = frame.data.length / 4;

    for (let i = 0; i < l; i++) {
      const grey =
        (frame.data[i * 4 + 0] +
          frame.data[i * 4 + 1] +
          frame.data[i * 4 + 2]) /
        3;

      frame.data[i * 4 + 0] = grey;
      frame.data[i * 4 + 1] = grey;
      frame.data[i * 4 + 2] = grey;
    }
    this.ctx1.putImageData(frame, 0, 0);
  },
};
```

Sau khi trang đã tải xong, bạn có thể gọi

```js
processor.doLoad();
```

#### Kết quả

{{EmbedLiveSample("Video_and_canvas", '100%', 580)}}

Đây là một ví dụ cho thấy cách thao tác các frame video bằng canvas. Để hiệu quả hơn, bạn nên cân nhắc dùng {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} thay vì `setTimeout()` khi chạy trên các trình duyệt hỗ trợ nó.

Bạn có thể đạt được kết quả tương tự bằng cách áp dụng hàm CSS {{cssxref("filter-function/grayscale", "grayscale()")}} trực tiếp lên phần tử `<video>` nguồn.

> [!NOTE]
> Do các vấn đề bảo mật tiềm tàng nếu video của bạn nằm trên miền khác với mã của bạn, bạn sẽ cần bật [CORS (Cross Origin Resource Sharing)](/en-US/docs/Web/HTTP/Guides/CORS) trên máy chủ video.

### Video và WebGL

[WebGL](/en-US/docs/Web/API/WebGL_API) là một API mạnh mẽ dùng canvas để vẽ các cảnh 2D hoặc 3D được tăng tốc phần cứng. Bạn có thể kết hợp WebGL và phần tử {{htmlelement("video")}} để tạo các video texture, nghĩa là bạn có thể đưa video vào trong các cảnh 3D.

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample8/index.html', 670, 510) }}

> [!NOTE]
> Bạn có thể tìm [mã nguồn của bản demo này trên GitHub](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample8) (cũng [xem trực tiếp tại đây](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample8/)).

### Tốc độ phát

Chúng ta cũng có thể điều chỉnh tốc độ phát audio và video bằng một thuộc tính của phần tử {{htmlelement("audio")}} và {{htmlelement("video")}} gọi là {{domxref("HTMLMediaElement.playbackRate", "playbackRate")}}. `playbackRate` là một số biểu diễn bội số được áp dụng cho tốc độ phát, ví dụ 0,5 là tốc độ bằng một nửa còn 2 là gấp đôi.

Lưu ý rằng thuộc tính `playbackRate` hoạt động với cả `<audio>` và `<video>`, nhưng trong cả hai trường hợp, nó chỉ thay đổi tốc độ phát chứ _không_ đổi cao độ. Để chỉnh cao độ của audio, bạn cần dùng Web Audio API. Xem thuộc tính {{domxref("AudioBufferSourceNode.playbackRate")}}.

```html live-sample___playback-rate
<video id="my-video" controls loop>
  <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
  <source src="/shared-assets/videos/flower.webm" type="video/webm" />
</video>
<label for="rate">Tốc độ phát <span id="rate-value">1.0</span></label>
<input type="range" id="rate" name="rate" min="0" max="4" value="1" step=".2" />
```

```js live-sample___playback-rate
const rateSlider = document.getElementById("rate");
const rateValue = document.getElementById("rate-value");
const myVideo = document.getElementById("my-video");

rateSlider.addEventListener("input", () => {
  myVideo.playbackRate = rateSlider.value;
  rateValue.textContent = parseFloat(rateSlider.value);
});
```

```css hidden live-sample___playback-rate live-sample___audio-filter
body {
  font-family: sans-serif;
}
video,
label,
input {
  display: block;
  padding: 0.5em;
  width: 80%;
  margin: auto;
}
```

Bắt đầu phát video, sau đó điều chỉnh thanh trượt để thay đổi tốc độ phát của media:

{{EmbedLiveSample('playback-rate', , 450)}}

## Thao tác audio

Ngoài `playbackRate`, để thao tác audio bạn thường sẽ dùng [Web Audio API](/en-US/docs/Web/API/Web_Audio_API).

### Chọn nguồn audio

Web Audio API có thể nhận audio từ nhiều nguồn khác nhau, sau đó xử lý và phát lại ra {{domxref("AudioDestinationNode")}} đại diện cho thiết bị đầu ra mà âm thanh sẽ được gửi tới sau khi xử lý.

| Nếu nguồn audio là…                                                                                                                                               | Hãy dùng kiểu node Web Audio này           |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| Một track audio từ phần tử HTML {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}                                                                            | {{domxref("MediaElementAudioSourceNode")}} |
| Một buffer dữ liệu audio thô trong bộ nhớ                                                                                                                         | {{domxref("AudioBufferSourceNode")}}       |
| Một bộ dao động tạo ra sóng sin hoặc dạng sóng tính toán khác                                                                                                     | {{domxref("OscillatorNode")}}              |
| Một track audio từ [WebRTC](/en-US/docs/Web/API/WebRTC_API) (chẳng hạn đầu vào micro có thể lấy bằng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}). | {{domxref("MediaStreamAudioSourceNode")}}  |

### Bộ lọc audio

Web Audio API có rất nhiều bộ lọc/hiệu ứng khác nhau có thể áp dụng cho audio bằng {{domxref("BiquadFilterNode")}}, chẳng hạn.

```html live-sample___audio-filter
<video id="my-video" controls loop>
  <source src="/shared-assets/videos/friday.mp4" type="video/mp4" />
</video>
<label for="freq">Tần số bộ lọc <span id="freq-value">1.0</span>hz</label>
<input type="range" id="freq" name="freq" max="20000" value="1000" step="100" />
```

```js live-sample___audio-filter
const freqSlider = document.getElementById("freq");
const freqValue = document.getElementById("freq-value");

const context = new AudioContext();
const audioSource = context.createMediaElementSource(
  document.getElementById("my-video"),
);
const filter = context.createBiquadFilter();
audioSource.connect(filter);
filter.connect(context.destination);

// Cấu hình bộ lọc
filter.type = "lowshelf";
filter.frequency.value = 1000;
filter.gain.value = 20;

freqSlider.addEventListener("input", () => {
  filter.frequency.value = freqSlider.value;
  freqValue.textContent = parseFloat(freqSlider.value);
});
```

{{EmbedLiveSample('audio-filter', , 550)}}

> [!NOTE]
> Trừ khi bạn đã bật [CORS](/en-US/docs/Web/HTTP/Guides/CORS), để tránh vấn đề bảo mật video của bạn nên nằm cùng miền với mã của bạn.

#### Các bộ lọc audio phổ biến

Đây là một số loại bộ lọc audio phổ biến bạn có thể áp dụng:

- Low Pass: Cho phép các tần số thấp hơn tần số cắt đi qua và làm suy giảm các tần số cao hơn tần số cắt.
- High Pass: Cho phép các tần số cao hơn tần số cắt đi qua và làm suy giảm các tần số thấp hơn tần số cắt.
- Band Pass: Cho phép một dải tần số đi qua và làm suy giảm các tần số nằm dưới và trên dải này.
- Low Shelf: Cho phép mọi tần số đi qua, nhưng tăng cường (hoặc làm suy giảm) các tần số thấp hơn.
- High Shelf: Cho phép mọi tần số đi qua, nhưng tăng cường (hoặc làm suy giảm) các tần số cao hơn.
- Peaking: Cho phép mọi tần số đi qua, nhưng tăng cường (hoặc làm suy giảm) một dải tần số.
- Notch: Cho phép mọi tần số đi qua, trừ một số tần số nhất định.
- All Pass: Cho phép mọi tần số đi qua, nhưng thay đổi quan hệ pha giữa các tần số khác nhau.

> [!NOTE]
> Xem {{domxref("BiquadFilterNode")}} để biết thêm thông tin.

### Convolution và impulse

Cũng có thể áp dụng đáp ứng xung cho audio bằng {{domxref("ConvolverNode")}}. **Đáp ứng xung** là âm thanh được tạo ra sau một xung âm thanh ngắn (như tiếng vỗ tay). Đáp ứng xung sẽ biểu thị môi trường nơi xung đó được tạo ra (ví dụ, tiếng vọng tạo ra khi vỗ tay trong đường hầm).

#### Ví dụ

```js
const convolver = context.createConvolver();
convolver.buffer = this.impulseResponseBuffer;
// Kết nối đồ thị.
source.connect(convolver);
convolver.connect(context.destination);
```

Xem ví dụ [HolySpaceCow](https://mdn.github.io/webaudio-examples/holy-space-cow/) của chúng tôi để thấy một ví dụ ứng dụng (nhưng rất, rất ngớ ngẩn).

### Âm thanh không gian

Chúng ta cũng có thể định vị audio bằng một **panner node**. Panner node - {{domxref("PannerNode")}} - cho phép chúng ta xác định một source cone cũng như các yếu tố vị trí và hướng, tất cả trong không gian 3D được xác định bằng tọa độ Descartes 3D.

#### Ví dụ

```js
const panner = context.createPanner();
panner.coneOuterGain = 0.2;
panner.coneOuterAngle = 120;
panner.coneInnerAngle = 0;

panner.connect(context.destination);
source.connect(panner);
source.start(0);

// Đặt listener tại gốc tọa độ.
context.listener.setPosition(0, 0, 0);
```

> [!NOTE]
> Bạn có thể tìm một [ví dụ trong kho GitHub của chúng tôi](https://github.com/mdn/webaudio-examples/tree/main/panner-node) (cũng có thể [xem trực tiếp](https://mdn.github.io/webaudio-examples/panner-node/)).

## Ví dụ

- [Nhiều ví dụ về Web Audio API (và các ví dụ khác)](https://github.com/mdn/webaudio-examples)
- [Ví dụ THREE.js Video Cube](https://github.com/chrisdavidmills/threejs-video-cube)
- [Convolution Effects in Real-Time](https://github.com/cwilso/web-audio-samples/blob/master/samples/audio/convolution-effects.html)

## Xem thêm

### Hướng dẫn

- [Thao tác video bằng Canvas](/en-US/docs/Web/API/Canvas_API/Manipulating_video_using_canvas)
- [Giải thích về HTML playbackRate](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/WebAudio_playbackRate_explained)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Cơ bản về không gian âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
- [Dùng khung hình video làm texture WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL#using_the_video_frames_as_a_texture) (Bạn cũng có thể dùng thư viện WebGL [THREE.js](https://threejs.org/) (và các thư viện khác) để [đạt được hiệu ứng này](https://stemkoski.github.io/Three.js/Video.html))
- [Animating Textures in WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL)
- [Phát triển âm thanh game với Web Audio API (Room effects và filters) (2012)](https://web.dev/articles/webaudio-games#room_effects_and_filters)

### Tham khảo

- Các phần tử {{htmlelement("audio")}} và {{htmlelement("video")}}
- API {{domxref("HTMLMediaElement")}}
- Phần tử {{htmlelement("canvas")}}
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [AudioContext](/en-US/docs/Web/API/AudioContext)
- Thông tin thêm về [Spatial Audio](/en-US/docs/Web/API/BaseAudioContext/createPanner)
- [Công nghệ web media](/en-US/docs/Web/Media)
