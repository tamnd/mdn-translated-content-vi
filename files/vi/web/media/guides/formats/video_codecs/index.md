---
title: Hướng dẫn codec video trên web
slug: Web/Media/Guides/Formats/Video_codecs
page-type: guide
sidebar: mediasidebar
---

Hướng dẫn này giới thiệu các codec video bạn có khả năng gặp hoặc cân nhắc dùng trên web, tóm tắt khả năng của chúng cùng các vấn đề về tương thích và tính hữu dụng, và đưa ra gợi ý để giúp bạn chọn codec phù hợp cho video của dự án.

Do dữ liệu video chưa nén có kích thước rất lớn, việc nén là điều bắt buộc nếu muốn lưu trữ, chứ chưa nói đến truyền qua mạng. Hãy hình dung lượng dữ liệu cần để lưu video chưa nén:

- Một frame video độ phân giải cao (1920x1080) ở màu đầy đủ (4 byte mỗi pixel) có kích thước 8,294,400 byte.
- Ở 30 frame mỗi giây, mỗi giây video HD sẽ chiếm 248,832,000 byte, tức khoảng 249 MB.
- Một phút video HD cần 14.93 GB dung lượng.
- Một cuộc họp video 30 phút sẽ cần khoảng 447.9 GB, còn một bộ phim 2 giờ sẽ chiếm gần 1.79 TB.

Không chỉ dung lượng lưu trữ là rất lớn, băng thông mạng để truyền video chưa nén cũng rất cao, khoảng 249 MB/giây, chưa tính âm thanh và phần phụ trợ. Đây là lúc codec video phát huy tác dụng. Giống như codec âm thanh làm với dữ liệu âm thanh, codec video nén dữ liệu video và mã hóa nó thành một định dạng có thể giải mã và phát lại hoặc chỉnh sửa sau này.

Hầu hết codec video là **mất dữ liệu**: video sau khi giải mã không khớp hoàn toàn với nguồn. Có thể mất một số chi tiết; mức độ phụ thuộc vào codec và cách cấu hình, nhưng nói chung, càng nén mạnh thì càng mất nhiều chi tiết và độ trung thực. Cũng có codec không mất dữ liệu, nhưng chúng thường dùng cho lưu trữ và phát cục bộ hơn là qua mạng.

## Codec phổ biến

Các codec video sau đây là những codec thường dùng nhất trên web. Với mỗi codec, container (kiểu tệp) có thể hỗ trợ nó cũng được liệt kê. Mỗi codec có một liên kết đến phần chi tiết bên dưới, nơi cung cấp thông tin bổ sung về khả năng, cũng như các vấn đề tương thích mà bạn có thể cần lưu ý.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row">Tên viết tắt</th>
      <th scope="col">Tên đầy đủ</th>
      <th scope="col">Hỗ trợ container</th>
    </tr>
  </thead>
  <tbody>
    <tr><th scope="row"><a href="#av1">AV1</a></th><td>AOMedia Video 1</td><td>MP4, WebM</td></tr>
    <tr><th scope="row"><a href="#avc_h.264">AVC (H.264)</a></th><td>Advanced Video Coding</td><td>3GP, MP4</td></tr>
    <tr><th scope="row"><a href="#h.263">H.263</a></th><td>H.263 Video</td><td>3GP</td></tr>
    <tr><th scope="row"><a href="#hevc_h.265">HEVC (H.265)</a></th><td>High Efficiency Video Coding</td><td>MP4</td></tr>
    <tr><th scope="row"><a href="#mp4v-es">MP4V-ES</a></th><td>MPEG-4 Video Elemental Stream</td><td>3GP, MP4</td></tr>
    <tr><th scope="row"><a href="#mpeg-1_part_2_video">MPEG-1</a></th><td>MPEG-1 Part 2 Visual</td><td>MPEG, QuickTime</td></tr>
    <tr><th scope="row"><a href="#mpeg-2_part_2_video">MPEG-2</a></th><td>MPEG-2 Part 2 Visual</td><td>MP4, MPEG, QuickTime</td></tr>
    <tr><th scope="row"><a href="#theora">Theora</a> {{deprecated_inline}}</th><td>Theora</td><td>Ogg</td></tr>
    <tr><th scope="row"><a href="#vp8">VP8</a></th><td>Video Processor 8</td><td>3GP, Ogg, WebM</td></tr>
    <tr><th scope="row"><a href="#vp9">VP9</a></th><td>Video Processor 9</td><td>MP4, Ogg, WebM</td></tr>
  </tbody>
</table>

## Các yếu tố ảnh hưởng đến video đã mã hóa

Cũng như với bất kỳ bộ mã hóa nào, có hai nhóm yếu tố cơ bản ảnh hưởng đến kích thước và chất lượng video đã mã hóa: đặc điểm của định dạng và nội dung video nguồn, và đặc tính cũng như cấu hình của codec dùng để mã hóa.

Quy tắc đơn giản nhất là: bất cứ thứ gì làm video đã mã hóa giống với video gốc chưa nén hơn thì thường cũng làm dữ liệu kết quả lớn hơn. Vì vậy, đây luôn là bài toán đánh đổi giữa kích thước và chất lượng.

### Ảnh hưởng của định dạng video nguồn lên kết quả mã hóa

Mức độ ảnh hưởng của định dạng video nguồn phụ thuộc vào codec và cách nó hoạt động. Nếu codec chuyển media sang một định dạng pixel nội bộ, hoặc biểu diễn ảnh bằng cách khác ngoài các pixel đơn giản, thì định dạng ảnh gốc không tạo ra khác biệt. Tuy nhiên, các yếu tố như frame rate và đặc biệt là độ phân giải luôn ảnh hưởng đến kích thước đầu ra.

### Ảnh hưởng của cấu hình codec lên kết quả mã hóa

Các thuật toán mã hóa video thường dùng một hoặc nhiều kỹ thuật chung để thực hiện việc nén. Nói chung, bất kỳ tùy chọn cấu hình nào nhằm giảm kích thước đầu ra đều có thể làm giảm chất lượng tổng thể hoặc tạo ra artefact nhất định. Bạn cũng có thể chọn mã hóa không mất dữ liệu, nhưng tệp kết quả sẽ lớn hơn nhiều.

## Artefact nén

**Artefact** là các tác dụng phụ của quá trình mã hóa mất dữ liệu, trong đó dữ liệu bị mất hoặc sắp xếp lại dẫn đến các hiệu ứng xấu thấy rõ. Một khi artefact xuất hiện, nó có thể tồn tại một thời gian vì cách video được hiển thị.

### Aliasing

Aliasing là thuật ngữ chung cho bất cứ thứ gì khi được tái tạo từ dữ liệu đã mã hóa mà trông không giống trước khi nén. Các dạng phổ biến gồm:

- Moiré pattern
- Staircase effect
- Wagon-wheel effect

### Mất độ sắc nét

Khi dữ liệu bị loại bỏ trong quá trình mã hóa video, một số chi tiết sẽ mất đi. Nếu nén đủ mạnh, một phần hoặc toàn bộ ảnh có thể bị mềm, mờ hoặc nhòe.

### Ringing

Ringing là một artefact của nén mất dữ liệu, trong đó các vùng ngoài đối tượng bị nhiễm các pixel màu do thuật toán nén sinh ra. Điều này đặc biệt phổ biến ở mức nén cao.

### Posterizing

Posterization xảy ra khi nén làm mất chi tiết màu trong các vùng chuyển sắc. Thay vì chuyển mượt giữa các màu, ảnh trở nên khối và có mảng màu rõ ràng.

### Contouring

Contouring, hay color banding, là một dạng posterization trong đó các khối màu tạo thành dải hoặc sọc trong ảnh.

### Mosquito noise

Mosquito noise là một artefact theo thời gian, biểu hiện thành nhiễu hoặc "edge busyness" quanh viền các đối tượng có cạnh sắc. Nó có thể giống ringing.

### Motion compensation block boundary artifacts

Nén video thường hoạt động bằng cách so sánh hai frame và ghi lại phần khác biệt giữa chúng. Motion compensation giúp bù cho chuyển động của camera hoặc vật thể. Tuy nhiên, các artefact vẫn có thể xuất hiện dọc theo ranh giới khối.

### Giảm kích thước frame

Trong một số tình huống, giảm độ phân giải video trước khi mã hóa có thể cải thiện kích thước cuối cùng. Nếu video 1080p được giảm xuống 720p trước khi mã hóa, kết quả có thể nhỏ hơn nhiều trong khi chất lượng cảm nhận vẫn tốt.

### Giảm frame rate

Tương tự, bạn có thể bỏ bớt frame và giảm frame rate để bù lại. Điều này làm video nhỏ hơn và giúp motion compensation hiệu quả hơn.

## Chi tiết codec

### AV1

AV1 là một định dạng mở, miễn phí bản quyền, được thiết kế riêng cho video Internet. Nó cung cấp mức nén cao và được hỗ trợ bởi phần tử `video` và WebRTC.

AV1 hiện có ba profile: main, high và professional, cùng các level quy định giới hạn về kích thước frame, tốc độ hiển thị, bitrate và số lượng tile. AV1 được hỗ trợ trong mọi trình duyệt, nhưng trên Safari việc hỗ trợ phụ thuộc vào phần cứng có decoder AV1.

### AVC (H.264)

AVC là chuẩn video rất phổ biến, được dùng nhiều trong phát sóng, hội nghị truyền hình RTP, và đĩa Blu-ray. Nó linh hoạt, có nhiều profile, nhưng là định dạng độc quyền và đi kèm yêu cầu giấy phép.

### H.263

H.263 được thiết kế cho băng thông thấp, đặc biệt cho hội nghị video và các hệ thống cũ. Nó đã bị H.264 thay thế và hiện là định dạng di sản nên thường nên tránh.

### HEVC (H.265)

HEVC được thiết kế để mã hóa và giải mã hiệu quả hơn cho video độ phân giải cao, thậm chí 8K. Nó có nén tốt hơn AVC nhưng là định dạng độc quyền và có yêu cầu cấp phép riêng.

### MP4V-ES

MP4V-ES là một phần của MPEG-4 Part 2 Visual, chủ yếu dùng cho RTP hoặc 3GP. Hầu như bạn không nên dùng nó trong dự án web mới.

### MPEG-1 Part 2 Video

MPEG-1 Video là định dạng cũ từ đầu thập niên 1990. Nó tương thích với nhiều thiết bị cũ nhưng hầu hết trình duyệt hiện đại không hỗ trợ trực tiếp, nên đây là lựa chọn kém cho web.

### MPEG-2 Part 2 Video

MPEG-2 tương tự MPEG-1 nhưng hỗ trợ bitrate và kỹ thuật mã hóa tốt hơn. Nó từng là chuẩn chính cho DVD video, nhưng cũng không phải lựa chọn tốt cho web hiện đại.

### Theora

Theora là codec mở và miễn phí do Xiph.org phát triển. Nó từng là lựa chọn hợp lý cho web, nhưng hiện không còn được khuyến nghị vì hỗ trợ đã rất nhỏ và đang bị gỡ dần khỏi trình duyệt.

### VP8

VP8 là codec mở, miễn phí bản quyền của Google. Nó có chất lượng và mức nén tương đương AVC, và được hỗ trợ tốt trong nội dung HTML, đặc biệt trong WebM.

### VP9

VP9 là phiên bản kế tiếp của VP8, cũng mở và miễn phí bản quyền. Nó có chất lượng gần HEVC ở bitrate tương đương, hỗ trợ HDR và được hỗ trợ rộng rãi trong trình duyệt.

## Hạn chế artefact

Chất lượng cuối cùng phụ thuộc vào codec, cấu hình encoder, và các lựa chọn như lossless/lossy, bitrate, frame rate và độ phân giải. Nếu bạn cần giảm kích thước video, hãy cân nhắc kỹ trade-off giữa kích thước và chất lượng.

## Thông số kỹ thuật và tương thích

Các bảng đặc tả và tương thích trình duyệt của từng codec được giữ nguyên theo dữ liệu chuẩn của MDN; các giá trị hỗ trợ trình duyệt, container và ghi chú nền tảng vẫn là nguồn tham khảo chính khi bạn chọn codec.
