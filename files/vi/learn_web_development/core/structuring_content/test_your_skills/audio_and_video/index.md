---
title: "Kiểm tra kỹ năng: Âm thanh và video"
short-title: "Kiểm tra: Âm thanh và video"
slug: Learn_web_development/Core/Structuring_content/Test_your_skills/Audio_and_video
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_video_and_audio", "Learn_web_development/Core/Structuring_content/Splash_page", "Learn_web_development/Core/Structuring_content")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách [nhúng nội dung video và âm thanh vào HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) hay không.

> [!NOTE]
> Để được trợ giúp, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Âm thanh và video 1

Trong bài tập này, chúng tôi muốn bạn nhúng một tệp âm thanh vào trang.

Để hoàn thành bài tập này:

1. Thêm đường dẫn đến tệp âm thanh vào thuộc tính phù hợp để nhúng nó vào trang. Âm thanh có tên `audio.mp3`, và có sẵn tại đường dẫn `https://github.com/mdn/learning-area/raw/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/audio.mp3`.
2. Thêm thuộc tính để trình duyệt hiển thị một số điều khiển mặc định.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('audio-1', "100%", 150) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___audio-1
<h1>Basic audio embed</h1>

<audio></audio>
```

<!-- Shared styles -->

```css hidden live-sample___video-1 live-sample___audio-1 live-sample___video-1-finished live-sample___audio-1-finished
body {
  background-color: white;
  color: #333333;
  font:
    1em / 1.4 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0;
}

* {
  box-sizing: border-box;
}

audio,
video {
  border: 1px solid black;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('audio-1-finished', "100%", 180) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___audio-1-finished
<h1>Basic audio embed</h1>

<audio
  controls
  src="https://github.com/mdn/learning-area/raw/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/audio.mp3"></audio>
```

</details>

## Âm thanh và video 2

Trong bài tập này, chúng tôi muốn bạn đánh dấu một trình phát video phức tạp hơn một chút, với nhiều nguồn, phụ đề và các tính năng khác.

Để hoàn thành bài tập này:

1. Thêm thuộc tính để trình duyệt hiển thị một số điều khiển mặc định.
2. Thêm nhiều nguồn, chứa đường dẫn đến các tệp video. Các tệp có tên `video.mp4` và `video.webm`, và có sẵn tại các đường dẫn sau:
   1. `https://github.com/mdn/learning-area/raw/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/video.mp4`
   2. `https://github.com/mdn/learning-area/raw/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/video.webm`
3. Cho trình duyệt biết trước các định dạng video mà các nguồn trỏ đến, để nó có thể đưa ra lựa chọn thông minh về tệp nào cần tải xuống trước.
4. Cung cấp cho `<video>` chiều rộng và chiều cao bằng với kích thước nội tại của nó (320 x 240 pixel).
5. Đặt video ở chế độ tắt tiếng theo mặc định.
6. Hiển thị các rãnh văn bản có trong thư mục `media`, trong tệp có tên `https://raw.githubusercontent.com/mdn/learning-area/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/subtitles_en.vtt`, khi video đang phát. Bạn phải đặt rõ ràng loại là phụ đề (subtitles), và ngôn ngữ phụ đề là tiếng Anh.
7. Đảm bảo người đọc có thể nhận biết ngôn ngữ phụ đề khi họ sử dụng các điều khiển mặc định.

Điểm xuất phát của bài tập trông như thế này:

{{EmbedLiveSample('video-1', "100%", 300)}}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___video-1
<h1>Video embed</h1>

<video></video>
```

Nội dung được cập nhật sẽ trông như thế này:

{{EmbedLiveSample('video-1-finished', "100%", 380)}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___video-1-finished
<h1>Video embed</h1>

<video controls width="320" height="240" muted>
  <source
    src="https://github.com/mdn/learning-area/raw/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/video.mp4"
    type="video/mp4" />
  <source
    src="https://github.com/mdn/learning-area/raw/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/video.webm"
    type="video/webm" />
  <track
    kind="subtitles"
    src="https://raw.githubusercontent.com/mdn/learning-area/refs/heads/main/html/multimedia-and-embedding/tasks/media-embed/media/subtitles_en.vtt"
    srclang="en"
    label="English" />
</video>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/HTML_video_and_audio", "Learn_web_development/Core/Structuring_content/Splash_page", "Learn_web_development/Core/Structuring_content")}}
