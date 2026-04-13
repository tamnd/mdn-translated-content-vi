---
title: MediaSession
slug: Web/API/MediaSession
page-type: web-api-interface
browser-compat: api.MediaSession
---

{{APIRef("Media Session API")}}

Giao diện **`MediaSession`** của {{domxref("Media Session API", "", "", "nocode")}} cho phép một trang web cung cấp các hành vi tùy chỉnh cho các tương tác phát lại phương tiện tiêu chuẩn, đồng thời báo cáo siêu dữ liệu có thể được tác nhân người dùng gửi đến thiết bị hoặc hệ điều hành để hiển thị trong các thành phần giao diện người dùng tiêu chuẩn.

Ví dụ, điện thoại thông minh có thể có một bảng điều khiển tiêu chuẩn trên màn hình khóa để cung cấp các điều khiển phát lại phương tiện và hiển thị thông tin. Một trình duyệt trên thiết bị có thể sử dụng `MediaSession` để làm cho việc phát lại trong trình duyệt có thể điều khiển từ giao diện người dùng tiêu chuẩn/toàn cục đó.

## Thuộc tính phiên bản

- {{domxref("MediaSession.metadata", "metadata")}}
  - : Trả về một phiên bản của {{domxref("MediaMetadata")}}, chứa siêu dữ liệu phương tiện phong phú để hiển thị trong giao diện người dùng nền tảng.
- {{domxref("MediaSession.playbackState", "playbackState")}}
  - : Cho biết liệu phiên phương tiện hiện tại có đang phát hay không. Các giá trị hợp lệ là `none`, `paused` hoặc `playing`.

## Phương thức phiên bản

- {{domxref("MediaSession.setActionHandler", "setActionHandler()")}}
  - : Đặt trình xử lý hành động cho một hành động phiên phương tiện, chẳng hạn như phát hoặc tạm dừng.
- {{domxref("MediaSession.setCameraActive", "setCameraActive()")}}
  - : Thông báo cho tác nhân người dùng biết liệu camera của người dùng có đang được coi là đang hoạt động hay không.
- {{domxref("MediaSession.setMicrophoneActive", "setMicrophoneActive()")}}
  - : Thông báo cho tác nhân người dùng biết liệu microphone của người dùng có đang được coi là đang tắt tiếng hay không.
- {{domxref("MediaSession.setPositionState", "setPositionState()")}}
  - : Đặt vị trí phát lại hiện tại và tốc độ của phương tiện đang được trình bày.
- {{domxref("MediaSession.setScreenshareActive", "setScreenshareActive()")}} {{experimental_inline}}
  - : Thông báo cho tác nhân người dùng về trạng thái chụp màn hình mà trang mong muốn.

## Ví dụ

### Thiết lập trình xử lý hành động cho trình phát nhạc

Ví dụ sau tạo một phiên phương tiện mới và gán các trình xử lý hành động cho nó:

```js
if ("mediaSession" in navigator) {
  navigator.mediaSession.metadata = new MediaMetadata({
    title: "Unforgettable",
    artist: "Nat King Cole",
    album: "The Ultimate Collection (Remastered)",
    artwork: [
      {
        src: "https://dummyimage.com/96x96",
        sizes: "96x96",
        type: "image/png",
      },
      {
        src: "https://dummyimage.com/128x128",
        sizes: "128x128",
        type: "image/png",
      },
      {
        src: "https://dummyimage.com/192x192",
        sizes: "192x192",
        type: "image/png",
      },
      {
        src: "https://dummyimage.com/256x256",
        sizes: "256x256",
        type: "image/png",
      },
      {
        src: "https://dummyimage.com/384x384",
        sizes: "384x384",
        type: "image/png",
      },
      {
        src: "https://dummyimage.com/512x512",
        sizes: "512x512",
        type: "image/png",
      },
    ],
  });

  navigator.mediaSession.setActionHandler("play", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("pause", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("stop", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("seekbackward", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("seekforward", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("seekto", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("previoustrack", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("nexttrack", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("skipad", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("togglecamera", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("togglemicrophone", () => {
    /* Code excerpted. */
  });
  navigator.mediaSession.setActionHandler("hangup", () => {
    /* Code excerpted. */
  });
}
```

Ví dụ sau thiết lập hai hàm để phát và tạm dừng, sau đó sử dụng chúng làm callback với các trình xử lý hành động liên quan.

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

### Sử dụng trình xử lý hành động để điều khiển bài thuyết trình slide

Các trình xử lý hành động `"previousslide"` và `"nextslide"` có thể được sử dụng để xử lý việc chuyển tiến và lùi qua bài thuyết trình slide, ví dụ khi người dùng đặt bài thuyết trình vào cửa sổ {{domxref("Picture-in-Picture API", "Hình-trong-Hình", "", "nocode")}} và nhấn các điều khiển do trình duyệt cung cấp để điều hướng qua các slide.

```js
try {
  navigator.mediaSession.setActionHandler("previousslide", () => {
    log('> User clicked "Previous Slide" icon.');
    if (slideNumber > 1) slideNumber--;
    updateSlide();
  });
} catch (error) {
  log('Warning! The "previousslide" media session action is not supported.');
}

try {
  navigator.mediaSession.setActionHandler("nextslide", () => {
    log('> User clicked "Next Slide" icon.');
    slideNumber++;
    updateSlide();
  });
} catch (error) {
  log('Warning! The "nextslide" media session action is not supported.');
}
```

Xem [Presenting Slides / Media Session Sample](https://googlechrome.github.io/samples/media-session/slides.html) để có ví dụ hoạt động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
