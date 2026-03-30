---
title: "Đa phương tiện: video"
slug: Learn_web_development/Extensions/Performance/video
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/Multimedia", "Learn_web_development/Extensions/Performance/JavaScript", "Learn_web_development/Extensions/Performance")}}

Như chúng ta đã học trong phần trước, đa phương tiện, cụ thể là hình ảnh và video, chiếm hơn 70% lượng byte được tải xuống cho một trang web trung bình. Chúng ta đã xem xét cách tối ưu hóa hình ảnh. Bài viết này xem xét cách tối ưu hóa video để cải thiện hiệu suất web.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu về các định dạng video khác nhau, tác động của chúng đến hiệu suất, và cách giảm tác động của video đến tổng thời gian tải trang trong khi phục vụ kích thước tệp video nhỏ nhất dựa trên hỗ trợ loại tệp của từng trình duyệt.
      </td>
    </tr>
  </tbody>
</table>

## Tại sao tối ưu hóa đa phương tiện của bạn?

Đối với trang web trung bình, [25% băng thông đến từ video](https://discuss.httparchive.org/t/state-of-the-web-top-image-optimization-strategies/1367). Tối ưu hóa video có tiềm năng tiết kiệm băng thông rất lớn dẫn đến hiệu suất trang web tốt hơn.

## Tối ưu hóa phân phối video

Các phần dưới đây mô tả các kỹ thuật tối ưu hóa sau:

- [nén tất cả video](#compress_all_videos)
- [tối ưu hóa thứ tự `<source>`](#optimize_source_order)
- [xóa âm thanh khỏi video bị tắt tiếng](#remove_audio_from_muted_hero_videos)
- [tối ưu hóa preload video](#video_preload)
- [xem xét streaming](#consider_streaming)

### Nén tất cả video

Hầu hết công việc nén video so sánh các khung hình liền kề trong video, với mục đích loại bỏ chi tiết giống hệt nhau trong cả hai khung hình. Nén video và xuất sang nhiều định dạng video, bao gồm WebM và MPEG-4/H.264.

Phần mềm chỉnh sửa video của bạn có thể có tính năng để giảm kích thước tệp. Nếu không, có các công cụ trực tuyến, chẳng hạn như [FFmpeg](https://www.ffmpeg.org/) (được thảo luận trong phần bên dưới), có thể mã hóa, giải mã, chuyển đổi và thực hiện các chức năng tối ưu hóa khác.

### Tối ưu hóa thứ tự `<source>`

Sắp xếp nguồn video từ nhỏ đến lớn. Ví dụ, cho các nén video ở định dạng 10MB và 12MB, khai báo tài nguyên 10MB trước:

```html
<video width="400" height="300" controls="controls">
  <!-- WebM: 10 MB -->
  <source src="video.webm" type="video/webm" />
  <!-- MPEG-4/H.264: 12 MB -->
  <source src="video.mp4" type="video/mp4" />
</video>
```

Trình duyệt tải xuống định dạng đầu tiên mà nó hiểu. Mục tiêu là đề xuất các phiên bản nhỏ hơn trước các phiên bản lớn hơn. Với phiên bản nhỏ nhất, hãy đảm bảo rằng video được nén nhiều nhất vẫn trông tốt. Có một số thuật toán nén có thể làm cho video trông (xấu) như GIF động. Trong khi video 128 Kb có vẻ như có thể cung cấp trải nghiệm người dùng tốt hơn so với tải xuống 10 MB, video giống GIF có hạt có thể phản ánh không tốt về thương hiệu hoặc dự án.

### Xóa âm thanh khỏi video hero bị tắt tiếng

Đối với video hero hoặc video khác không có âm thanh, việc xóa âm thanh là thông minh.

```html
<video autoplay="" loop="" muted playsinline="" id="hero-video">
  <source src="banner_video.webm" type='video/webm; codecs="vp8, vorbis"' />
  <source src="web_banner.mp4" type="video/mp4" />
</video>
```

Mã video hero này (ở trên) phổ biến ở các trang web hội nghị và trang chủ công ty. Nó bao gồm video tự động phát, lặp và bị tắt tiếng. Không có điều khiển, vì vậy không có cách nào để nghe âm thanh. Âm thanh thường trống, nhưng vẫn hiện diện và vẫn sử dụng băng thông. Không có lý do gì để phục vụ âm thanh với video luôn bị tắt tiếng. **Xóa âm thanh có thể tiết kiệm 20% băng thông.**

Tùy thuộc vào lựa chọn phần mềm của bạn, bạn có thể xóa âm thanh trong quá trình xuất và nén. Nếu không, một tiện ích miễn phí gọi là [FFmpeg](https://www.ffmpeg.org/) có thể làm điều đó cho bạn. Đây là chuỗi lệnh FFmpeg để xóa âm thanh:

```bash
ffmpeg -i original.mp4 -an -c:v copy audioFreeVersion.mp4
```

### Preload video

Thuộc tính preload có ba tùy chọn có sẵn: `auto`, `metadata` và `none`. Cài đặt mặc định là `metadata`. Các cài đặt này kiểm soát bao nhiêu tệp video tải xuống khi tải trang. Bạn có thể tiết kiệm dữ liệu bằng cách hoãn tải xuống cho các video ít phổ biến hơn.

Đặt `preload="none"` dẫn đến không có video nào được tải xuống cho đến khi phát. Nó trì hoãn khởi động, nhưng mang lại tiết kiệm dữ liệu đáng kể cho các video có xác suất phát thấp.

Cung cấp tiết kiệm băng thông khiêm tốn hơn, cài đặt `preload="metadata"` có thể tải xuống lên đến 3% video khi tải trang. Đây là tùy chọn hữu ích cho một số tệp nhỏ hoặc kích thước vừa phải.

Thay đổi cài đặt thành `auto` cho trình duyệt biết tự động tải xuống toàn bộ video. Chỉ làm điều này khi phát lại rất có khả năng xảy ra. Nếu không, nó sẽ lãng phí rất nhiều băng thông.

### Xem xét streaming

[Video streaming cho phép kích thước video phù hợp và băng thông](https://www.smashingmagazine.com/2018/10/video-playback-on-the-web-part-2/) (dựa trên tốc độ mạng) được phân phối đến người dùng cuối. Tương tự như hình ảnh đáp ứng, video có kích thước đúng được phân phối đến trình duyệt, đảm bảo khởi động video nhanh, vùng đệm thấp và phát lại được tối ưu hóa.

## Kết luận

Tối ưu hóa video có tiềm năng cải thiện đáng kể hiệu suất trang web. Các tệp video tương đối lớn so với các tệp trang web khác, và luôn xứng đáng được chú ý. Bài viết này giải thích cách tối ưu hóa video trang web thông qua việc giảm kích thước tệp, với cài đặt tải xuống (HTML) và với streaming.

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/Multimedia", "Learn_web_development/Extensions/Performance/JavaScript", "Learn_web_development/Extensions/Performance")}}
