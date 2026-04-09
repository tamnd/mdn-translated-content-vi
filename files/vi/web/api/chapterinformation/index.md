---
title: ChapterInformation
slug: Web/API/ChapterInformation
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ChapterInformation
---

{{APIRef("Media Session API")}}{{SeeCompatTable}}

Giao diện **`ChapterInformation`** của {{domxref("Media Session API", "", "", "nocode")}} biểu diễn siêu dữ liệu cho một chương riêng lẻ của một tài nguyên phương tiện (tức là một tệp video hoặc âm thanh).

Thông tin chương cho một tài nguyên phương tiện nhất định được thiết lập khi nó được tạo lần đầu, thông qua thuộc tính `chapterInfo` của đối tượng khởi tạo trong hàm dựng {{domxref("MediaMetadata.MediaMetadata", "MediaMetadata()")}}. Thuộc tính này nhận một mảng các đối tượng `ChapterInformation` làm giá trị.

Bạn có thể truy cập thông tin chương của một đối tượng {{domxref("MediaMetadata")}} hiện có thông qua thuộc tính {{domxref("MediaMetadata.chapterInfo", "chapterInfo")}} của nó. Thuộc tính này trả về một mảng các đối tượng `ChapterInformation`.

## Thuộc tính thực thể

- {{domxref("ChapterInformation.artwork")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một {{jsxref("Array")}} các đối tượng biểu diễn các hình ảnh liên kết với chương.
- {{domxref("ChapterInformation.startTime")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một số, tính bằng giây, biểu diễn thời điểm bắt đầu của chương.
- {{domxref("ChapterInformation.title")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một chuỗi biểu diễn tiêu đề của chương.

## Ví dụ

Đoạn mã mẫu bên dưới từ [Video / Media Session Sample](https://googlechrome.github.io/samples/media-session/video.html) cho thấy một cấu trúc điển hình của đối tượng `ChapterInformation`:

```js
const BASE_URL = "https://storage.googleapis.com/media-session/";

const metadata = {
  // …
  chapterInfo: [
    {
      title: "Chapter 1",
      startTime: 0,
      artwork: [
        {
          src: `${BASE_URL}sintel/chapter1-128.png`,
          sizes: "128x128",
          type: "image/png",
        },
        {
          src: `${BASE_URL}sintel/chapter1-512.png`,
          sizes: "512x512",
          type: "image/png",
        },
      ],
    },
    {
      title: "Chapter 2",
      startTime: 37,
      artwork: [
        {
          src: `${BASE_URL}sintel/chapter2-128.png`,
          sizes: "128x128",
          type: "image/png",
        },
        {
          src: `${BASE_URL}sintel/chapter2-512.png`,
          sizes: "512x512",
          type: "image/png",
        },
      ],
    },
  ],
};
```

Đoạn mã sau cho thấy cách sử dụng nó bên trong mã Media Session (thuộc tính đối tượng ở trên là một phần của đối tượng `playlist` được tham chiếu bên dưới):

```js
function updateMetadata() {
  const track = playlist[index];

  log(`Playing ${track.title} track...`);
  navigator.mediaSession.metadata = new MediaMetadata({
    title: track.title,
    artist: track.artist,
    artwork: track.artwork,
    chapterInfo: track.chapterInfo,
  });

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaMetadata")}}
