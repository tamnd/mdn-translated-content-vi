---
title: MediaMetadata
slug: Web/API/MediaMetadata
page-type: web-api-interface
browser-compat: api.MediaMetadata
---

{{APIRef("Media Session API")}}

Giao diện **`MediaMetadata`** của {{domxref("Media Session API", "", "", "nocode")}} cho phép một trang web cung cấp siêu dữ liệu phương tiện phong phú để hiển thị trong giao diện người dùng của nền tảng.

## Hàm khởi tạo

- {{domxref("MediaMetadata.MediaMetadata", "MediaMetadata()")}}
  - : Tạo một đối tượng `MediaMetaData` mới.

## Thuộc tính phiên bản

- {{domxref("MediaMetadata.album")}}
  - : Trả về hoặc đặt tên của album hoặc bộ sưu tập chứa phương tiện sẽ được phát.
- {{domxref("MediaMetadata.artist")}}
  - : Trả về hoặc đặt tên của nghệ sĩ, nhóm, người tạo, v.v. của phương tiện sẽ được phát.
- {{domxref("MediaMetadata.artwork")}}
  - : Trả về hoặc đặt một mảng các hình ảnh liên quan đến phương tiện đang phát.
- {{domxref("MediaMetadata.chapterInfo")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một mảng siêu dữ liệu thông tin chương liên quan đến phương tiện đang phát, được đại diện bởi các phiên bản đối tượng {{domxref("ChapterInformation")}}.
- {{domxref("MediaMetadata.title")}}
  - : Trả về hoặc đặt tiêu đề của phương tiện sẽ được phát.

## Ví dụ

Ví dụ sau kiểm tra khả năng tương thích trình duyệt và đặt siêu dữ liệu hiện tại cho phiên phương tiện.

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
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
