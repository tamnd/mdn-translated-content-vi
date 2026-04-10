---
title: Chuyển mã tài sản cho Media Source Extensions
slug: Web/API/Media_Source_Extensions_API/Transcoding_assets_for_MSE
page-type: guide
---

{{DefaultAPISidebar("Media Source Extensions")}}

Khi làm việc với Media Source Extensions, có thể bạn cần xử lý các tài sản của mình trước khi có thể phát trực tuyến chúng. Bài viết này sẽ hướng dẫn bạn các yêu cầu và giới thiệu một bộ công cụ bạn có thể sử dụng để mã hóa các tài sản của mình cho phù hợp.

## Bắt đầu

1. Bước đầu tiên và quan trọng nhất là đảm bảo rằng các tệp của bạn bao gồm vùng chứa và codec mà trình duyệt của người dùng hỗ trợ.
2. Tùy thuộc vào codec, bạn có thể cần phân mảnh tệp để tuân thủ [thông số kỹ thuật ISO BMFF](https://w3c.github.io/mse-byte-stream-format-isobmff/).
3. (Tùy chọn) Nếu bạn quyết định sử dụng Dynamic Adaptive Streaming over HTTP (DASH) để phát trực tuyến bit rate thích ứng, bạn cần chuyển mã tài sản của mình thành nhiều độ phân giải. Hầu hết các ứng dụng khách DASH đều mong đợi một tệp manifest Media Presentation Description (MPD) tương ứng, thường được tạo ra trong khi tạo các tệp tài sản đa độ phân giải.

Dưới đây chúng ta sẽ đề cập đến tất cả các bước này, nhưng trước tiên hãy xem qua bộ công cụ chúng ta có thể sử dụng để thực hiện điều này khá dễ dàng.

### Phương tiện mẫu

Nếu bạn muốn làm theo các bước được liệt kê ở đây nhưng không có phương tiện nào để thử nghiệm, bạn có thể tải [đoạn giới thiệu của Big Buck Bunny](https://web.archive.org/web/20161102172252id_/http://video.blendertestbuilds.de/download.php?file=download.blender.org/peach/trailer_1080p.mov). Big Buck Bunny thuộc bản quyền của Blender Foundation và được cấp phép theo giấy phép [Creative Commons Attribution 3.0](https://creativecommons.org/licenses/by/3.0/). Trong suốt hướng dẫn này, bạn sẽ thấy tên tệp trailer_1080p.mov, chính là tệp tải xuống.

### Các công cụ cần thiết

Khi làm việc với MSE, các công cụ sau đây là bắt buộc:

1. [ffmpeg](https://ffmpeg.org/) — Một tiện ích dòng lệnh để chuyển mã phương tiện của bạn sang các định dạng cần thiết. Bạn có thể tải phiên bản cho hệ thống của mình tại trang [Download FFmpeg](https://ffmpeg.org/download.html). Giải nén tệp thực thi từ tệp lưu trữ và thêm vị trí của nó vào câu lệnh PATH. Người dùng macOS cũng có thể sử dụng [homebrew](https://brew.sh/) để cài đặt ffmpeg.
2. [Bento4](https://github.com/axiomatic-systems/Bento4) — Một bộ các tiện ích dòng lệnh để lấy siêu dữ liệu tài sản và tạo nội dung cho DASH. Để cài đặt, bạn cần tự xây dựng/biên dịch ứng dụng từ các tệp dự án/tệp nguồn được cung cấp, tùy thuộc vào hệ điều hành và sở thích của bạn. Xem [hướng dẫn Building](https://github.com/axiomatic-systems/Bento4#building) để biết thêm chi tiết, hoặc tải [tệp dựng sẵn](https://www.bento4.com/downloads/). Đặt nội dung của thư mục `bin` vào cùng nơi với ffmpeg.
3. python2 — Bento4 sử dụng nó.

Hãy cài đặt thành công các công cụ này trước khi chuyển sang bước tiếp theo.

Phương tiện mẫu nên được đặt trong thư mục `utils` của Bento4 và làm việc tại đây.

> [!NOTE]
> ffmpeg dựng sẵn không bao gồm libfdk_aac vì lý do cấp phép. Bento4 sử dụng cái này theo mặc định, vì vậy bạn cần biên dịch ffmpeg nếu cần. Nếu bạn không cần nó, hãy thêm `--audio-codec=aac` vào dòng lệnh `mp4-dash-encode.py`.

### Hỗ trợ vùng chứa và codec

Như được chỉ định trong [phần 1.1 của đặc tả MSE: Goals](https://w3c.github.io/media-source/#goals), MSE được thiết kế để không yêu cầu hỗ trợ cho bất kỳ định dạng phương tiện hoặc codec cụ thể nào. Mặc dù điều này đúng trên lý thuyết, hỗ trợ trình duyệt khác nhau đối với các tổ hợp vùng chứa/codec cụ thể.

Để kiểm tra xem trình duyệt có hỗ trợ một vùng chứa cụ thể hay không, bạn có thể truyền một chuỗi kiểu MIME vào phương thức {{domxref("MediaSource.isTypeSupported_static", "MediaSource.isTypeSupported()")}}:

```js
MediaSource.isTypeSupported("audio/mp3"); // false
MediaSource.isTypeSupported("video/mp4"); // true
MediaSource.isTypeSupported('video/mp4; codecs="avc1.4D4028, mp4a.40.2"'); // true
```

Chuỗi là kiểu MIME của vùng chứa, tùy chọn theo sau là danh sách các codec. Mặc dù kiểu MIME khá dễ để tìm ra, chúng ta có thể lấy chuỗi codec bằng tiện ích [mp4info](https://nickdesaulniers.github.io/mp4info/).

Hiện tại, vùng chứa MP4 với codec video H.264 và âm thanh AAC có hỗ trợ trên tất cả các trình duyệt hiện đại, trong khi các codec khác thì không.

Để chuyển phương tiện mẫu của chúng ta từ vùng chứa QuickTime MOV sang vùng chứa MP4, chúng ta có thể sử dụng ffmpeg. Vì codec âm thanh trong vùng chứa MOV đã là AAC và codec video là h.264, chúng ta có thể hướng dẫn ffmpeg không thực hiện chuyển mã. Thay vào đó, nó sẽ chỉ sao chép các track âm thanh và video mà không cần chuyển mã, nhanh hơn tương đối so với việc phải chuyển mã.

```bash
ffmpeg -i trailer_1080p.mov -c:v copy -c:a copy bunny.mp4
```

### Kiểm tra phân mảnh

Để phát trực tuyến MP4 đúng cách, chúng ta cần tài sản là định dạng MP4 [ISO BMF](https://w3c.github.io/mse-byte-stream-format-isobmff/). Nếu không có phân mảnh đúng cách, bất kỳ tệp MP4 nào cũng không đảm bảo hoạt động với MSE. Điều này có nghĩa là siêu dữ liệu trong vùng chứa được phân tán và không được nhóm lại với nhau.

Để kiểm tra xem tệp MP4 có phải là luồng MP4 đúng cách hay không, bạn có thể sử dụng tiện ích [mp4info](https://nickdesaulniers.github.io/mp4info/) để liệt kê các atom của MP4.

> [!NOTE]
> Phiên bản phân mảnh lớn hơn một chút so với bản gốc, do siêu dữ liệu bổ sung được phân tán trong toàn bộ tệp. Đây thường là mức tăng kích thước tệp 1% hoặc ít hơn.

### Phân mảnh

Nếu bạn có một tài sản chưa phải là MP4, ffmpeg có thể xử lý việc xuất MP4 phân mảnh đúng cách trong quá trình chuyển mã, với cờ dòng lệnh `-movflags frag_keyframe+empty_moov`:

```bash
ffmpeg -i trailer_1080p.mov -c:v copy -c:a copy -movflags frag_keyframe+empty_moov bunny_fragmented.mp4
```

Nếu bạn đã có MP4 nhưng nó chưa được phân mảnh đúng cách, bạn có thể sử dụng lại ffmpeg:

```bash
ffmpeg -i non_fragmented.mp4 -movflags frag_keyframe+empty_moov fragmented.mp4
```

Trong cả hai trường hợp, Chrome có thể yêu cầu đặt thêm một cờ movie:

```bash
-movflags frag_keyframe+empty_moov+default_base_moof
```

Có một tệp MP4 được phân mảnh đúng cách là tất cả những gì bạn cần để bắt đầu. Nếu bạn muốn sử dụng phát trực tuyến bit rate thích ứng, bạn sẽ phải tạo các mã hóa ở nhiều độ phân giải. Mặc dù MSE đủ linh hoạt để cho phép bạn tạo triển khai của riêng mình, nhưng bạn nên sử dụng ứng dụng khách DASH hiện có vì DASH là giao thức ứng dụng được chỉ định rõ ràng.

### Tạo nội dung cho DASH

Với điều kiện bạn đã truy cập được ffmpeg và các tiện ích của Bento4 qua $PATH, bạn có thể chạy script Python `mp4-dash-encode.py` của Bento4 để tạo nhiều mã hóa nội dung của mình ở các độ phân giải khác nhau. Script Python `mp4-dash.py` của Bento4 sau đó có thể được sử dụng để tạo tệp MPD tương ứng mà ứng dụng khách cần.

Chạy các lệnh sau:

```bash
python mp4-dash-encode.py -b 5 -v bunny_fragmented.mp4
python mp4-dash.py video_0*
```

Điều này sẽ xuất ra các tệp sau:

```plain
output
├── audio
│   └── und
├── stream.mpd
└── video
    ├── 1
    ├── 2
    ├── 3
    ├── 4
    └── 5
```

> [!NOTE]
> `mp4-dash-encode.py` không hiển thị thông báo lỗi ffmpeg. Bạn có thể xem bằng cách chỉ định tùy chọn `-d`.

> [!NOTE]
> Nếu `"Invalid duration specification for force_key_frames: 'expr:eq(mod(n"` được hiển thị là thông báo lỗi, hãy sửa đổi `mp4-dash-encode.py` và xóa hai `"'"` khỏi `"-force_key_frames 'expr:eq(mod(n,%d),0)'"`.

## Tóm tắt

Với video được mã hóa đúng cách và phương tiện bit rate thích ứng được tạo, bạn đã sẵn sàng để bắt đầu phát trực tuyến bit rate thích ứng trên web bằng DASH và MSE.
