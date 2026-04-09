---
title: Cấu hình máy chủ cho media Ogg
slug: Web/Media/Guides/Formats/Configuring_servers_for_Ogg_media
page-type: guide
sidebar: mediasidebar
---

Phần tử HTML {{HTMLElement("audio")}} và {{HTMLElement("video")}} cho phép trình bày media mà không cần người dùng cài đặt tiện ích mở rộng hoặc phần mềm khác.
Hướng dẫn này trình bày cấu hình máy chủ có thể cần thiết để phục vụ đúng các tệp media Ogg.
Thông tin này cũng có thể hữu ích nếu bạn gặp các kiểu media khác mà máy chủ của bạn chưa được cấu hình để nhận diện.

## Phục vụ media với MIME type đúng

Nếu bạn không biết tệp Ogg chứa âm thanh hay video, bạn có thể phục vụ nó với MIME type `application/ogg`, và trình duyệt sẽ xử lý nó như một tệp video.

- `*.ogg` và `*.ogv` chứa video (có thể kèm theo track âm thanh) nên được phục vụ với MIME type `video/ogg`.
- `*.oga` và `*.ogg` chỉ chứa âm thanh nên được phục vụ với MIME type `audio/ogg`.

Phần lớn máy chủ không tự động phục vụ media Ogg với MIME type đúng theo mặc định, vì vậy rất có thể bạn sẽ cần thêm cấu hình phù hợp.

Với Apache, bạn có thể thêm đoạn sau vào cấu hình:

```apacheconf
AddType audio/ogg .oga
AddType video/ogg .ogv
AddType application/ogg .ogg
```

Bài viết về [định dạng container media](/en-US/docs/Web/Media/Guides/Formats/Containers) đặc biệt hữu ích khi cấu hình máy chủ để lưu trữ media đúng cách.

## Xử lý đúng các yêu cầu phạm vi

Để hỗ trợ tua và phát các vùng media chưa được tải xuống, bạn có thể dùng [yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) để lấy media từ vị trí đích tua tới.
Ngoài ra, nó dùng các yêu cầu byte-range để tua tới cuối media (giả sử bạn phục vụ tiêu đề {{HTTPHeader("Content-Length")}}) nhằm xác định thời lượng của media.

Máy chủ của bạn nên chấp nhận tiêu đề {{HTTPHeader("Accept-Ranges")}} nếu có thể nhận các yêu cầu phạm vi.
Nó phải trả về {{HTTPStatus("206", "206 Partial Content")}} cho mọi yêu cầu phạm vi, nếu không trình duyệt sẽ không thể xác định liệu máy chủ có hỗ trợ yêu cầu phạm vi hay không.
Máy chủ cũng phải trả về `206: Partial Content` cho yêu cầu `Range: bytes=0-`.

Xem thêm [yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) để biết thêm thông tin.

## Bao gồm key frame đều đặn

Khi trình duyệt tua qua media Ogg đến một thời điểm xác định, nó phải tìm tới key frame gần nhất trước vị trí đích tua, rồi tải xuống và giải mã video từ đó cho đến thời điểm được yêu cầu. Key frame càng cách xa nhau, việc này càng lâu, vì vậy nên chèn key frame ở các khoảng đều đặn.

Theo mặc định, [`ffmpeg2theora`](https://gitlab.xiph.org/xiph/ffmpeg2theora) dùng một key frame cho mỗi 64 khung hình (xấp xỉ mỗi 2 giây ở 30 khung hình/giây), và cách này hoạt động khá tốt.

> [!NOTE]
> Dĩ nhiên, bạn dùng càng nhiều key frame thì tệp video càng lớn, vì vậy có thể bạn sẽ cần thử nghiệm một chút để tìm ra điểm cân bằng phù hợp giữa kích thước tệp và hiệu năng tua.

## Cân nhắc dùng thuộc tính preload

Phần tử HTML {{HTMLElement("audio")}} và {{HTMLElement("video")}} cung cấp thuộc tính `preload`, cho trình duyệt biết nên cố gắng tải xuống toàn bộ media khi trang được tải. Nếu không có `preload`, trình duyệt sẽ tải đủ media để hiển thị khung hình video đầu tiên và xác định thời lượng media.

- `preload` mặc định ở trạng thái tắt, vì vậy nếu mục đích của trang web là hiển thị video, người dùng có thể sẽ thấy hữu ích nếu bạn thêm `preload` vào các phần tử video.
- Dùng `preload="metadata"` sẽ tải trước metadata của tệp media và có thể cả vài khung hình đầu của video. Đặt `payload` thành `auto` cho trình duyệt biết tự động bắt đầu tải media ngay khi trang được tải, với giả định rằng người dùng sẽ phát nó.

## Không dùng nén HTTP cho media Ogg

Một cách phổ biến để giảm tải cho máy chủ web là dùng [nén gzip hoặc deflate](https://betterexplained.com/articles/how-to-optimize-your-site-with-gzip-compression/) khi phục vụ cho trình duyệt hỗ trợ.

Mặc dù khả năng này không cao, trình duyệt có thể thông báo rằng nó hỗ trợ nén HTTP (gzip/deflate) bằng tiêu đề `Accept-Encoding: gzip,deflate` khi yêu cầu các tệp media. Máy chủ của bạn nên được cấu hình để không làm vậy. Dữ liệu trong các tệp media vốn đã được nén, nên bạn sẽ không nhận được lợi ích thực sự nào từ nén, và việc nén khiến trình duyệt không thể tua video đúng cách hoặc xác định thời lượng của nó.

Một vấn đề khác khi cho phép nén HTTP với streaming media là: máy chủ Apache sẽ không gửi tiêu đề phản hồi {{HTTPHeader("Content-Length")}} nếu đang dùng mã hóa gzip.

## Lấy thời lượng của media Ogg

Bạn có thể dùng công cụ `oggz-info` để lấy thời lượng media; công cụ này đi kèm với gói [`oggz-tools`](https://www.xiph.org/oggz/). Đầu ra từ `oggz-info` trông như sau:

```bash
$ oggz-info /g/media/bruce_vs_ironman.ogv
Content-Duration: 00:01:00.046

Skeleton: serialno 1976223438
        4 packets in 3 pages, 1.3 packets/page, 27.508% Ogg overhead
        Presentation-Time: 0.000
        Basetime: 0.000

Theora: serialno 0170995062
        1790 packets in 1068 pages, 1.7 packets/page, 1.049% Ogg overhead
        Video-Framerate: 29.983 fps
        Video-Width: 640
        Video-Height: 360

Vorbis: serialno 0708996688
        4531 packets in 167 pages, 27.1 packets/page, 1.408% Ogg overhead
        Audio-Samplerate: 44100 Hz
        Audio-Channels: 2
```

Lưu ý rằng bạn không thể phục vụ nguyên dòng `Content-Duration` do `oggz-info` báo cáo, vì nó được xuất ra theo định dạng `HH:MM:SS`.
Bạn cần chuyển nó sang giây, rồi phục vụ giá trị đó làm `X-Content-Duration`.
Bạn có thể làm điều này bằng cách phân tích các phần `HH`, `MM`, và `SS`, rồi chuyển sang `(HH * 3600) + (MM * 60) + SS` để lấy giá trị cần báo cáo.

Điều quan trọng là `oggz-info` dường như đọc toàn bộ media để tính thời lượng, vì vậy nên lưu sẵn giá trị thời lượng để tránh độ trễ lớn khi giá trị đó phải được tính lại cho mỗi yêu cầu HTTP đối với media Ogg của bạn.

## Xem thêm

- [Định dạng container media](/en-US/docs/Web/Media/Guides/Formats/Containers)
- [HTML video và audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
