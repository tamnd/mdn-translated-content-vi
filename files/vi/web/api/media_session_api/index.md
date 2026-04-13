---
title: Media Session API
slug: Web/API/Media_Session_API
page-type: web-api-overview
browser-compat: api.MediaSession
---

{{DefaultAPISidebar("Media Session API")}}

**Media Session API** cung cấp một cách để tùy chỉnh thông báo media. Nó thực hiện điều này bằng cách cung cấp metadata để hiển thị bởi user agent cho media mà ứng dụng web của bạn đang phát.

API này cũng cung cấp các trình xử lý hành động mà trình duyệt có thể sử dụng để truy cập các phím media của nền tảng như phím cứng trên bàn phím, tai nghe, điều khiển từ xa và phím mềm trong khu vực thông báo và màn hình khóa của thiết bị di động. Nhờ đó bạn có thể kiểm soát media được cung cấp bởi web một cách liền mạch thông qua thiết bị của mình, ngay cả khi không nhìn vào trang web.

Mục tiêu là cho phép người dùng biết nội dung đang phát và kiểm soát nó mà không cần mở trang cụ thể đã phát. Để có thể hỗ trợ Media Session API, trình duyệt trước tiên cần một cơ chế để truy cập và được kiểm soát bởi các điều khiển media cấp OS.

## Khái niệm và cách dùng Media Session

Giao diện {{domxref("MediaMetadata")}} cho phép website cung cấp metadata phong phú đến giao diện người dùng của nền tảng cho media đang phát. Metadata này bao gồm tiêu đề, tên nghệ sĩ (người tạo), album (bộ sưu tập), artwork và thông tin chương. Nền tảng có thể hiển thị metadata này trong các trung tâm media, thông báo, màn hình khóa thiết bị và các nơi khác.

Giao diện {{domxref("MediaSession")}} cho phép người dùng kiểm soát việc phát media thông qua các phần tử giao diện do user-agent xác định. Tương tác với các phần tử này kích hoạt các trình xử lý hành động trên trang web đang phát media. Vì nhiều trang có thể đồng thời sử dụng API này, user agent chịu trách nhiệm gọi đúng trình xử lý hành động của trang đúng. User agent cung cấp các hành vi mặc định khi không có hành vi nào được xác định bởi trang.

## Truy cập Media Session API

Giao diện chính cho Media Session API là giao diện {{domxref("MediaSession")}}. Thay vì tạo instance `MediaSession` của riêng bạn, bạn truy cập API bằng thuộc tính {{domxref("navigator.mediaSession")}}. Ví dụ, để đặt trạng thái hiện tại của phiên media thành `playing`:

```js
navigator.mediaSession.playbackState = "playing";
```

## Giao diện

- {{domxref("ChapterInformation")}}
  - : Đại diện cho metadata của một chương riêng lẻ của tài nguyên media (ví dụ: tệp video hoặc audio).
- {{domxref("MediaMetadata")}}
  - : Cho phép trang web cung cấp metadata media phong phú để hiển thị trong giao diện người dùng của nền tảng.
- {{domxref("MediaSession")}}
  - : Cho phép trang web cung cấp các hành vi tùy chỉnh cho các tương tác phát media tiêu chuẩn.

## Ví dụ

### Thiết lập trình xử lý hành động cho trình phát nhạc

Ví dụ sau đây cho thấy cách phát hiện tính năng của Media Session API. Sau đó nó khởi tạo đối tượng metadata cho phiên và thêm các trình xử lý hành động cho các hành động điều khiển người dùng:

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

Một số user agent vô hiệu hóa tự động phát cho các phần tử media trên thiết bị di động và yêu cầu cử chỉ của người dùng để bắt đầu media. Ví dụ sau thêm sự kiện `pointerup` vào nút phát trên trang, sau đó được dùng để khởi động mã phiên media:

```js
playButton.addEventListener("pointerup", (event) => {
  const audio = document.querySelector("audio");

  // User interacted with the page. Let's play audio!
  audio
    .play()
    .then(() => {
      /* Set up media session controls, as shown above. */
    })
    .catch((error) => {
      console.error(error);
    });
});
```

### Dùng trình xử lý hành động để điều khiển bản trình chiếu

Các trình xử lý hành động `"previousslide"` và `"nextslide"` có thể được dùng để xử lý việc di chuyển về phía trước và phía sau trong bản trình chiếu, ví dụ khi người dùng đặt bản trình chiếu của họ vào cửa sổ {{domxref("Picture-in-Picture API", "Picture-in-Picture", "", "nocode")}} và nhấn các điều khiển do trình duyệt cung cấp để điều hướng qua các slide.

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

Xem [Presenting Slides / Media Session Sample](https://googlechrome.github.io/samples/media-session/slides.html) để biết ví dụ hoạt động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Customize media notifications and playback controls with the Media Session API](https://web.dev/articles/media-session) trên web.dev (2024)
