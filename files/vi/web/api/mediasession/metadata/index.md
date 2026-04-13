---
title: "MediaSession: thuộc tính metadata"
short-title: metadata
slug: Web/API/MediaSession/metadata
page-type: web-api-instance-property
browser-compat: api.MediaSession.metadata
---

{{APIRef("Media Session API")}}

Thuộc tính **`metadata`** của giao diện {{domxref("MediaSession")}} chứa một đối tượng {{domxref("MediaMetadata")}} cung cấp thông tin mô tả về phương tiện đang phát hiện tại, hoặc `null` nếu siêu dữ liệu chưa được đặt. Siêu dữ liệu này được trình duyệt cung cấp cho thiết bị để hiển thị trong bất kỳ giao diện người dùng điều khiển phương tiện tiêu chuẩn nào mà thiết bị có thể cung cấp.

## Giá trị

Một phiên bản của {{domxref("MediaMetadata")}} chứa thông tin về phương tiện đang phát.

## Ví dụ

Ví dụ sau kiểm tra tính tương thích và tạo một phiên phương tiện mới với siêu dữ liệu liên quan:

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
