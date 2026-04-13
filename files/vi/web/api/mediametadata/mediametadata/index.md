---
title: "MediaMetadata: hàm khởi tạo MediaMetadata()"
short-title: MediaMetadata()
slug: Web/API/MediaMetadata/MediaMetadata
page-type: web-api-constructor
browser-compat: api.MediaMetadata.MediaMetadata
---

{{APIRef("Media Session API")}}

Hàm khởi tạo **`MediaMetadata()`** tạo một đối tượng {{domxref("MediaMetadata")}} mới.

## Cú pháp

```js-nolint
new MediaMetadata()
new MediaMetadata(metadata)
```

### Tham số

- `metadata` {{optional_inline}}
  - : Các tham số siêu dữ liệu như sau:
    - `album` {{optional_inline}}
      - : Tên của album hoặc bộ sưu tập chứa phương tiện sẽ được phát. Mặc định thành chuỗi rỗng (`""`).
    - `artist` {{optional_inline}}
      - : Tên của nghệ sĩ, nhóm hoặc người tạo ra phương tiện sẽ được phát. Mặc định thành chuỗi rỗng (`""`).
    - `artwork` {{optional_inline}}
      - : Một {{jsxref("Array")}} các đối tượng đại diện cho các hình ảnh liên quan đến phương tiện đang phát, mặc định là một mảng rỗng. Cấu trúc đối tượng là:
        - `src`
          - : URL mà user agent tải dữ liệu hình ảnh từ đó.
        - `sizes` {{optional_inline}}
          - : Chỉ định tài nguyên ở nhiều kích thước để user agent không phải chia tỷ lệ một hình ảnh. Mặc định thành chuỗi rỗng (`""`).
        - `type` {{optional_inline}}
          - : Gợi ý {{Glossary("MIME type")}} cho user agent cho phép nó bỏ qua các hình ảnh có kiểu mà nó không hỗ trợ. Tuy nhiên, user agent vẫn có thể sử dụng MIME type sniffing sau khi tải hình ảnh để xác định loại của nó. Mặc định thành chuỗi rỗng (`""`).
    - `chapterInfo` {{optional_inline}}
      - : Một mảng các phiên bản đối tượng {{domxref("ChapterInformation")}} đại diện cho siêu dữ liệu thông tin chương liên quan đến phương tiện. Cấu trúc đối tượng là:
        - `artwork` {{optional_inline}}
          - : Một {{jsxref("Array")}} các đối tượng `artwork` (xem ở trên) đại diện cho các hình ảnh liên quan đến chương. Nếu bị bỏ qua, `artwork` mặc định thành một mảng rỗng.
        - `startTime` {{optional_inline}}
          - : Một số đại diện cho thời gian bắt đầu của chương tính bằng giây. Nếu bị bỏ qua, `startTime` mặc định thành `0`.
        - `title` {{optional_inline}}
          - : Một chuỗi đại diện cho tiêu đề của chương. Nếu bị bỏ qua, `title` mặc định thành chuỗi rỗng (`""`).
    - `title` {{optional_inline}}
      - : Tiêu đề của phương tiện sẽ được phát. Mặc định thành chuỗi rỗng (`""`).

## Ví dụ

Ví dụ sau tạo một đối tượng {{domxref("MediaMetadata")}} mới bằng định dạng siêu dữ liệu đúng.

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
