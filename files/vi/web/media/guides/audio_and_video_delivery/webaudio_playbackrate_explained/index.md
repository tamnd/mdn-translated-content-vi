---
title: Giải thích playbackRate của Web audio
slug: Web/Media/Guides/Audio_and_video_delivery/WebAudio_playbackRate_explained
page-type: guide
sidebar: mediasidebar
---

Thuộc tính {{domxref("HTMLMediaElement.playbackRate", "playbackRate")}} của các phần tử {{ htmlelement("audio") }} và {{ htmlelement("video") }} cho phép chúng ta thay đổi tốc độ, hay tỉ lệ, mà một đoạn âm thanh hoặc video trên web đang phát. Bài viết này giải thích chi tiết `playbackRate`.

## Kiến thức cơ bản về playbackRate

Trước hết hãy xem một ví dụ ngắn về cách dùng `playbackRate`:

```js
const audio = document.createElement("audio");
audio.setAttribute("src", "audio-file.mp3");
audio.playbackRate = 0.5;
```

Ở đây chúng ta tạo một phần tử {{ htmlelement("audio") }}, và đặt `src` của nó thành một tệp do mình chọn. Tiếp theo chúng ta đặt `playbackRate` thành 0.5, biểu thị tốc độ bằng một nửa bình thường (tức `playbackRate` là một hệ số nhân áp dụng lên tốc độ gốc).

## Ví dụ hoàn chỉnh

Trước tiên hãy tạo một phần tử {{ htmlelement("video") }}, rồi thiết lập video và các điều khiển tốc độ phát trong HTML:

```html
<video id="myVideo" controls loop>
  <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
  <source src="/shared-assets/videos/flower.webm" type="video/webm" />
</video>

<form>
  <input id="pbr" type="range" value="1" min="0.5" max="4" step="0.1" />
  <p>Playback Rate <span id="currentPbr">1</span></p>
</form>
```

Một ít CSS cơ bản:

```css
form {
  font-family: monospace;
}

video {
  width: 500px;
  aspect-ratio: 16 / 9;
}
```

Và áp dụng một ít JavaScript:

```js
const v = document.getElementById("myVideo");
const p = document.getElementById("pbr");
const c = document.getElementById("currentPbr");

p.addEventListener("input", () => {
  c.textContent = p.value;
  v.playbackRate = p.value;
});
```

Cuối cùng, chúng ta lắng nghe sự kiện `input` được kích hoạt trên phần tử {{ htmlelement("input") }}, cho phép phản ứng khi bộ điều khiển tốc độ phát thay đổi.

{{EmbedLiveSample("a complete example", "", 400)}}

## defaultPlaybackRate và ratechange

Ngoài `playbackRate`, chúng ta còn có thuộc tính `defaultPlaybackRate`, cho phép đặt tốc độ phát mặc định: tốc độ mà media sẽ quay về; ví dụ khi chúng ta thay đổi nguồn video, hoặc (trong một số trình duyệt) khi một sự kiện `ended` được tạo ra.

Vì vậy `defaultPlaybackRate` cho phép đặt tốc độ phát _trước_ khi phát media, còn `playbackRate` cho phép thay đổi nó trong lúc media đang phát.

Cũng có một sự kiện gọi là `ratechange`, được kích hoạt mỗi khi `playbackRate` thay đổi.

### Ghi chú

- Hầu hết trình duyệt sẽ dừng phát âm thanh khi `playbackRate` nằm ngoài giới hạn từ 0.5 đến 4, đồng thời chỉ để video tiếp tục phát trong im lặng. Với đa số ứng dụng, nên giới hạn phạm vi từ 0.5 đến 4.
- Cao độ của bản âm thanh không thay đổi khi `playbackRate` bị thay đổi.
- Các giá trị âm, biểu thị media sẽ phát ngược, hiện chưa được đa số trình duyệt hỗ trợ.

## Xem thêm

- [Kiểm tra tốc độ phát của Hyperaudio](https://hyperaud.io/lab/pbr-test/)
- {{domxref("HTMLMediaElement")}}: giao diện định nghĩa thuộc tính {{domxref("HTMLMediaElement.playbackRate", "playbackRate")}}.
