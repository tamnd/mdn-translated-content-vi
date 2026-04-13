---
title: "MediaSession: thuộc tính playbackState"
short-title: playbackState
slug: Web/API/MediaSession/playbackState
page-type: web-api-instance-property
browser-compat: api.MediaSession.playbackState
---

{{APIRef("Media Session API")}}

Thuộc tính **`playbackState`** của giao diện {{domxref("MediaSession")}} cho biết liệu phiên phương tiện hiện tại có đang phát hay tạm dừng.

## Giá trị

Một chuỗi cho biết trạng thái phát lại hiện tại của phiên phương tiện. Giá trị có thể là một trong các giá trị sau:

- `none`
  - : Bối cảnh duyệt web hiện không biết trạng thái phát lại hiện tại, hoặc trạng thái phát lại không có sẵn vào lúc này.
- `paused`
  - : Phiên phương tiện của trình duyệt hiện đang tạm dừng. Có thể tiếp tục phát lại.
- `playing`
  - : Phiên phương tiện của trình duyệt hiện đang phát phương tiện, có thể tạm dừng.

## Ví dụ

Ví dụ sau thiết lập hai hàm để phát và tạm dừng, sau đó sử dụng chúng làm callback với các trình xử lý hành động liên quan. Mỗi hàm sử dụng thuộc tính `playbackState` để cho biết liệu âm thanh có đang phát hay tạm dừng.

```js
const actionHandlers = [
  // play
  [
    "play",
    async () => {
      // play our audio
      await audioEl.play();
      // set playback state
      navigator.mediaSession.playbackState = "playing";
      // update our status element
      updateStatus(allMeta[index], "Action: play  |  Track is playing…");
    },
  ],
  [
    "pause",
    () => {
      // pause out audio
      audioEl.pause();
      // set playback state
      navigator.mediaSession.playbackState = "paused";
      // update our status element
      updateStatus(allMeta[index], "Action: pause  |  Track has been paused…");
    },
  ],
];

for (const [action, handler] of actionHandlers) {
  try {
    navigator.mediaSession.setActionHandler(action, handler);
  } catch (error) {
    console.log(`The media session action "${action}" is not supported yet.`);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
