---
title: "MediaSession: phương thức setActionHandler()"
short-title: setActionHandler()
slug: Web/API/MediaSession/setActionHandler
page-type: web-api-instance-method
browser-compat: api.MediaSession.setActionHandler
---

{{APIRef("Media Session API")}}

Phương thức **`setActionHandler()`** của giao diện {{domxref("MediaSession")}} đặt trình xử lý cho một hành động phiên phương tiện. Các hành động này cho phép ứng dụng web nhận thông báo khi người dùng tương tác với các điều khiển phương tiện vật lý hoặc trên màn hình được tích hợp trong thiết bị, chẳng hạn như các nút phát, dừng hoặc tua.

## Cú pháp

```js-nolint
setActionHandler(type, callback)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại hành động cần lắng nghe. Sẽ là một trong các giá trị sau:
    - `hangup`
      - : Kết thúc cuộc gọi.
    - `nextslide`
      - : Chuyển sang slide tiếp theo khi trình bày bộ slide.
    - `nexttrack`
      - : Chuyển tiếp phát lại sang bài hát tiếp theo.
    - `pause`
      - : Tạm dừng phát lại phương tiện.
    - `play`
      - : Bắt đầu (hoặc tiếp tục) phát lại phương tiện.
    - `previousslide`
      - : Chuyển sang slide trước khi trình bày bộ slide.
    - `previoustrack`
      - : Quay lại bài hát trước.
    - `seekbackward`
      - : Tua lùi trong phương tiện từ vị trí hiện tại. Thuộc tính `seekOffset` được truyền cho callback chỉ định lượng thời gian cần tua lùi.
    - `seekforward`
      - : Tua tiến từ vị trí hiện tại trong phương tiện. Thuộc tính `seekOffset` được truyền cho callback chỉ định lượng thời gian cần tua tiến.
    - `seekto`
      - : Di chuyển vị trí phát lại đến thời gian được chỉ định trong phương tiện. Thời gian cần tua đến được chỉ định trong thuộc tính `seekTime` được truyền cho callback. Nếu bạn dự định thực hiện nhiều thao tác `seekto` liên tiếp nhanh, bạn cũng có thể chỉ định thuộc tính `fastSeek` được truyền cho callback với giá trị `true`. Điều này cho trình duyệt biết nó có thể thực hiện các bước để tối ưu hóa các thao tác lặp đi lặp lại.
    - `skipad`
      - : Bỏ qua quảng cáo hoặc thương mại đang phát. Hành động này có thể có hoặc không có sẵn, tùy thuộc vào nền tảng và {{Glossary("user agent")}}, hoặc có thể bị vô hiệu hóa do mức đăng ký hoặc hoàn cảnh khác.
    - `stop`
      - : Dừng phát lại hoàn toàn.
    - `togglecamera`
      - : Bật hoặc tắt camera đang hoạt động của người dùng.
    - `togglemicrophone`
      - : Tắt hoặc bật tiếng microphone của người dùng.
    - `togglescreenshare`
      - : Bật hoặc tắt màn hình chia sẻ đang hoạt động của người dùng.
- `callback`
  - : Hàm được gọi khi loại hành động được chỉ định được gọi. Callback không nên trả về giá trị. Callback nhận một đối tượng dictionary chứa các thuộc tính sau:
    - `action`
      - : Một chuỗi đại diện cho loại hành động. Thuộc tính này cho phép một callback duy nhất xử lý nhiều loại hành động.
    - `fastSeek` {{optional_inline}}
      - : Một hành động [`seekto`](#seekto) có thể tùy chọn bao gồm thuộc tính này, là giá trị Boolean cho biết có nên thực hiện tua "nhanh" hay không. Tua "nhanh" là việc tua được thực hiện trong một chuỗi nhanh, chẳng hạn như khi tua tiến nhanh hoặc tua ngược qua phương tiện. Thuộc tính này có thể được sử dụng để cho biết bạn nên sử dụng phương thức ngắn nhất có thể để tua phương tiện. `fastSeek` không được bao gồm trong hành động cuối cùng trong chuỗi tua.
    - `seekOffset` {{optional_inline}}
      - : Nếu `action` là [`seekforward`](#seekforward) hoặc [`seekbackward`](#seekbackward) và thuộc tính này có mặt, đây là giá trị dấu phẩy động chỉ ra số giây cần di chuyển vị trí phát tiến hoặc lùi. Nếu thuộc tính này không có mặt, các hành động đó nên chọn khoảng cách mặc định hợp lý để bỏ qua tiến hoặc lùi (chẳng hạn như 7 hoặc 10 giây).
    - `seekTime` {{optional_inline}}
      - : Nếu `action` là [`seekto`](#seekto), thuộc tính này phải có mặt và phải là giá trị dấu phẩy động cho biết thời gian tuyệt đối trong phương tiện để di chuyển vị trí phát lại, trong đó 0 cho biết đầu phương tiện. Thuộc tính này không có mặt cho các loại hành động khác.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Để xóa trình xử lý hành động đã được thiết lập trước đó, hãy gọi `setActionHandler()` một lần nữa, chỉ định `null` là `callback`.

Trình xử lý hành động nhận làm đầu vào một tham số duy nhất: một đối tượng cung cấp cả loại hành động (để cùng một hàm có thể xử lý nhiều loại hành động), cũng như dữ liệu cần thiết để thực hiện hành động.

## Ví dụ

### Thiết lập trình xử lý hành động cho trình phát nhạc

Ví dụ này tạo một phiên phương tiện mới và gán các trình xử lý hành động (không làm gì) cho nó.

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

Ví dụ này sử dụng các trình xử lý hành động phù hợp để cho phép tua theo cả hai hướng trong phương tiện đang phát.

```js
navigator.mediaSession.setActionHandler("seekbackward", (evt) => {
  // User clicked "Seek Backward" media notification icon.
  let skipTime = evt.seekOffset || 10; // Time to skip in seconds
  audio.currentTime = Math.max(audio.currentTime - skipTime, 0);
});

navigator.mediaSession.setActionHandler("seekforward", (evt) => {
  // User clicked "Seek Forward" media notification icon.
  let skipTime = evt.seekOffset || 10; // Time to skip in seconds
  audio.currentTime = Math.min(audio.currentTime + skipTime, audio.duration);
});
```

Để xóa trình xử lý hành động phương tiện, hãy gán nó về null.

```js
navigator.mediaSession.setActionHandler("nexttrack", null);
```

### Hỗ trợ nhiều hành động trong một hàm xử lý

Bạn cũng có thể, nếu muốn, sử dụng một hàm duy nhất để xử lý nhiều loại hành động, bằng cách kiểm tra giá trị của thuộc tính `action`:

```js
let skipTime = 7;

navigator.mediaSession.setActionHandler("seekforward", handleSeek);
navigator.mediaSession.setActionHandler("seekbackward", handleSeek);

function handleSeek(details) {
  switch (details.action) {
    case "seekforward":
      audio.currentTime = Math.min(
        audio.currentTime + skipTime,
        audio.duration,
      );
      break;
    case "seekbackward":
      audio.currentTime = Math.max(audio.currentTime - skipTime, 0);
      break;
  }
}
```

Ở đây, hàm `handleSeek()` xử lý cả hai hành động `seekbackward` và `seekforward`.

### Sử dụng trình xử lý hành động để điều khiển bài thuyết trình slide

Các trình xử lý hành động `"previousslide"` và `"nextslide"` có thể được sử dụng để xử lý việc chuyển tiến và lùi qua bài thuyết trình slide, ví dụ khi người dùng đặt bài thuyết trình vào cửa sổ {{domxref("Picture-in-Picture API", "Hình-trong-Hình", "", "nocode")}} và nhấn các điều khiển do trình duyệt cung cấp.

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
