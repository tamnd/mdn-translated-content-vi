---
title: "MediaMetadata: thuộc tính artist"
short-title: artist
slug: Web/API/MediaMetadata/artist
page-type: web-api-instance-property
browser-compat: api.MediaMetadata.artist
---

{{APIRef("Media Session API")}}

Thuộc tính **`artist`** của giao diện {{domxref("MediaMetadata")}} trả về hoặc đặt tên của nghệ sĩ, nhóm, người tạo, v.v. của phương tiện sẽ được phát.

## Giá trị

Một {{jsxref("String")}} chứa tên của nghệ sĩ.

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
