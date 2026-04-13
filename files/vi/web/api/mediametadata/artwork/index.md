---
title: "MediaMetadata: thuộc tính artwork"
short-title: artwork
slug: Web/API/MediaMetadata/artwork
page-type: web-api-instance-property
browser-compat: api.MediaMetadata.artwork
---

{{APIRef("Media Session API")}}

Thuộc tính **`artwork`** của giao diện {{domxref("MediaMetadata")}} trả về hoặc đặt một mảng các đối tượng đại diện cho các hình ảnh liên quan đến phương tiện đang phát.

## Giá trị

Một {{jsxref("Array")}} các đối tượng, mỗi đối tượng chứa các trường sau:

- `src`
  - : URL mà user agent tải dữ liệu hình ảnh từ đó.
- `sizes` {{optional_inline}}
  - : Chỉ định tài nguyên ở nhiều kích thước để user agent không phải chia tỷ lệ một hình ảnh. Mặc định thành chuỗi rỗng (`""`).
- `type` {{optional_inline}}
  - : Gợi ý {{Glossary("MIME type")}} cho user agent cho phép nó bỏ qua các hình ảnh có kiểu mà nó không hỗ trợ. Tuy nhiên, user agent vẫn có thể sử dụng MIME type sniffing sau khi tải hình ảnh để xác định loại của nó. Mặc định thành chuỗi rỗng (`""`).

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
