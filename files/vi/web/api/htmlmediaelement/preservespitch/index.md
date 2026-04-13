---
title: "HTMLMediaElement: thuộc tính preservesPitch"
short-title: preservesPitch
slug: Web/API/HTMLMediaElement/preservesPitch
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.preservesPitch
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.preservesPitch`** xác định xem trình duyệt có nên điều chỉnh cao độ của âm thanh để bù đắp cho những thay đổi về tốc độ phát lại được thực hiện bằng cách đặt {{domxref("HTMLMediaElement.playbackRate")}} hay không.

## Giá trị

Giá trị boolean mặc định là `true`.

## Ví dụ

### Đặt thuộc tính bảo tồnPitch

Trong ví dụ này, chúng ta có phần tử {{HTMLElement("audio")}}, bộ điều khiển phạm vi điều chỉnh tốc độ phát lại và hộp kiểm đặt `preservesPitch`.

Hãy thử phát âm thanh, sau đó điều chỉnh tốc độ phát lại, sau đó bật và tắt hộp kiểm.

```html
<audio
  controls
  src="https://mdn.github.io/webaudio-examples/audio-basics/outfoxing.mp3"></audio>

<div>
  <label for="rate">Adjust playback rate:</label>
  <input id="rate" type="range" min="0.25" max="3" step="0.05" value="1" />
</div>

<div>
  <label for="pitch">Preserve pitch:</label>
  <input type="checkbox" id="pitch" name="pitch" checked />
</div>
```

```css hidden
div {
  margin: 0.5rem 0;
}
```

```js
const audio = document.querySelector("audio");
document.getElementById("rate").addEventListener("change", (e) => {
  audio.playbackRate = e.target.value;
});
document.getElementById("pitch").addEventListener("change", (e) => {
  audio.preservesPitch = e.target.checked;
});
```

{{EmbedLiveSample("Setting the preservesPitch property")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement.playbackRate")}}
- [Web Audio playbackRate explained](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/WebAudio_playbackRate_explained)
