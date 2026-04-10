---
title: Phát trực tuyến thích ứng DASH cho HTML video
slug: Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming
page-type: guide
---

{{DefaultAPISidebar("Media Source Extensions")}}

Dynamic Adaptive Streaming over HTTP (DASH) là một giao thức phát trực tuyến thích ứng. Điều này có nghĩa là nó cho phép luồng video chuyển đổi giữa các bit rate dựa trên hiệu suất mạng, để giữ cho video tiếp tục phát.

Trước tiên, bạn cần chuyển đổi video WebM của mình thành một manifest DASH với các tệp video đi kèm ở các bit rate khác nhau. Để bắt đầu, bạn chỉ cần chương trình FFmpeg từ [ffmpeg.org](https://www.ffmpeg.org/), với hỗ trợ libvpx và libvorbis cho video và âm thanh WebM, ít nhất phiên bản 2.5 (có lẽ; bài này đã được thử nghiệm với 3.2.5).

Đầu tiên, sử dụng tệp WebM hiện có để tạo một tệp âm thanh và nhiều tệp video. Trong ví dụ dưới đây, tệp **_in.video_** có thể là bất kỳ vùng chứa nào có ít nhất một luồng âm thanh và một luồng video có thể được giải mã bởi FFmpeg.

Tạo âm thanh bằng cách sử dụng:

```bash
ffmpeg -i in.video -vn -acodec libvorbis -ab 128k -dash 1 my_audio.webm
```

Tạo từng biến thể video.

```bash
ffmpeg -i in.video -c:v libvpx-vp9 -keyint_min 150 -g 150 -tile-columns 4 -frame-parallel 1 -f webm -dash 1 \
-an -vf scale=160:90 -b:v 250k -dash 1 video_160x90_250k.webm
```

```bash
ffmpeg -i in.video -c:v libvpx-vp9 -keyint_min 150 -g 150 -tile-columns 4 -frame-parallel 1  -f webm -dash 1 \
-an -vf scale=320:180 -b:v 500k -dash 1 video_320x180_500k.webm
```

```bash
ffmpeg -i in.video -c:v libvpx-vp9 -keyint_min 150 -g 150 -tile-columns 4 -frame-parallel 1  -f webm -dash 1 \
-an -vf scale=640:360 -b:v 750k -dash 1 video_640x360_750k.webm
```

```bash
ffmpeg -i in.video -c:v libvpx-vp9 -keyint_min 150 -g 150 -tile-columns 4 -frame-parallel 1  -f webm -dash 1 \
-an -vf scale=640:360 -b:v 1000k -dash 1 video_640x360_1000k.webm
```

```bash
ffmpeg -i in.video -c:v libvpx-vp9 -keyint_min 150 -g 150 -tile-columns 4 -frame-parallel 1  -f webm -dash 1 \
-an -vf scale=1280:720 -b:v 1500k -dash 1 video_1280x720_1500k.webm
```

Hoặc thực hiện tất cả trong một lệnh.

```bash
ffmpeg -i in.video -c:v libvpx-vp9 -keyint_min 150 \
-g 150 -tile-columns 4 -frame-parallel 1 -f webm -dash 1 \
-an -vf scale=160:90 -b:v 250k -dash 1 video_160x90_250k.webm \
-an -vf scale=320:180 -b:v 500k -dash 1 video_320x180_500k.webm \
-an -vf scale=640:360 -b:v 750k -dash 1 video_640x360_750k.webm \
-an -vf scale=640:360 -b:v 1000k -dash 1 video_640x360_1000k.webm \
-an -vf scale=1280:720 -b:v 1500k -dash 1 video_1280x720_1500k.webm
```

Sau đó, tạo tệp manifest.

```bash
ffmpeg \
  -f webm_dash_manifest -i video_160x90_250k.webm \
  -f webm_dash_manifest -i video_320x180_500k.webm \
  -f webm_dash_manifest -i video_640x360_750k.webm \
  -f webm_dash_manifest -i video_1280x720_1500k.webm \
  -f webm_dash_manifest -i my_audio.webm \
  -c copy \
  -map 0 -map 1 -map 2 -map 3 -map 4 \
  -f webm_dash_manifest \
  -adaptation_sets "id=0,streams=0,1,2,3 id=1,streams=4" \
  my_video_manifest.mpd
```

Các đối số `-map` tương ứng với các tệp đầu vào theo trình tự chúng được cung cấp; bạn nên có một đối số cho mỗi tệp. Đối số `-adaptation_sets` gán chúng thành các tập thích ứng; ví dụ: điều này tạo một tập (0) chứa các luồng 0, 1, 2 và 3 (các video), và một tập khác (1) chỉ chứa luồng 4, luồng âm thanh.

Đặt manifest và các tệp video liên quan lên máy chủ web hoặc CDN của bạn. DASH hoạt động qua HTTP, vì vậy miễn là máy chủ HTTP của bạn hỗ trợ các yêu cầu khoảng byte và được thiết lập để phục vụ các tệp `.mpd` với `Content-Type: application/dash+xml`, thì bạn đã sẵn sàng.

Sau đó, để kết nối chính xác tệp `.mpd` này với phần tử `<video>` của bạn, bạn cần một thư viện JavaScript như dash.js, vì không có trình duyệt nào có hỗ trợ native cho DASH. Đọc [dash.js quickstart](https://dashif.org/dash.js/pages/quickstart/) để biết cách thiết lập trang của bạn để sử dụng nó.

## Xem thêm

- [Thông số kỹ thuật WebM DASH tại The WebM Project](https://wiki.webmproject.org/adaptive-streaming/webm-dash-specification)
- [Diễn đàn công nghiệp DASH](https://dashif.org/)
- [Mô tả dự án WebM về cách tạo tệp DASH với FFMPEG](https://wiki.webmproject.org/adaptive-streaming/instructions-to-playback-adaptive-webm-using-dash)
