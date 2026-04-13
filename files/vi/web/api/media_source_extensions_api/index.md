---
title: API Media Source
slug: Web/API/Media_Source_Extensions_API
page-type: web-api-overview
spec-urls:
  - https://w3c.github.io/media-source/
  - https://w3c.github.io/media-playback-quality/
---

{{DefaultAPISidebar("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

**Media Source API**, tên chính thức là **Media Source Extensions** (**MSE**), cung cấp các chức năng cho phép phát trực tuyến phương tiện trên web mà không cần plugin. Sử dụng MSE, các luồng phương tiện có thể được tạo qua JavaScript và phát bằng các phần tử {{htmlelement("audio")}} và {{htmlelement("video")}}.

## Khái niệm và cách sử dụng

Phát video và âm thanh đã có sẵn trong các ứng dụng web mà không cần plugin trong vài năm gần đây, nhưng các tính năng cơ bản được cung cấp thực sự chỉ hữu ích để phát các bài hát đơn lẻ hoàn chỉnh. Ví dụ, chúng ta không thể kết hợp/tách các arraybuffer. Cho đến gần đây, phát trực tuyến phương tiện vẫn là lĩnh vực của Flash, với các công nghệ như Flash Media Server phục vụ các luồng video bằng giao thức RTMP.

### Tiêu chuẩn MSE

Với Media Source Extensions (MSE), điều này đang thay đổi. MSE cho phép chúng ta thay thế URI `src` đơn lẻ thông thường được cấp cho các phần tử phương tiện bằng một tham chiếu đến đối tượng `MediaSource`, là một vùng chứa cho các thông tin như trạng thái sẵn sàng của phương tiện để phát, và các tham chiếu đến nhiều đối tượng `SourceBuffer` đại diện cho các khối phương tiện khác nhau tạo nên toàn bộ luồng. MSE cho phép chúng ta kiểm soát chi tiết hơn về lượng nội dung được tải và tần suất tải, cũng như một số kiểm soát về mức sử dụng bộ nhớ, chẳng hạn như khi các bộ đệm bị giải phóng. Nó đặt nền móng cho các ứng dụng khách phát trực tuyến bit rate thích ứng (như những ứng dụng sử dụng DASH hoặc HLS) được xây dựng trên API mở rộng của nó.

Việc tạo các tài sản hoạt động với MSE trong các trình duyệt hiện đại là một quá trình tốn nhiều công sức, đòi hỏi thời gian đáng kể, sức mạnh tính toán và năng lượng. Cần sử dụng các tiện ích bên ngoài để xử lý nội dung sang định dạng phù hợp. Trong khi hỗ trợ trình duyệt cho các vùng chứa phương tiện khác nhau với MSE không đồng đều, việc sử dụng codec video H.264, codec âm thanh AAC và định dạng vùng chứa MP4 là mức cơ sở phổ biến. MSE cũng cung cấp một API để phát hiện hỗ trợ vùng chứa và codec trong thời gian chạy.

Nếu bạn không cần kiểm soát rõ ràng chất lượng video theo thời gian, tốc độ tải nội dung hoặc tốc độ giải phóng bộ nhớ, thì các thẻ {{htmlelement("video")}} và {{htmlelement("source")}} có thể là một giải pháp đơn giản và phù hợp.

### DASH

Dynamic Adaptive Streaming over HTTP (DASH) là một giao thức để chỉ định cách tải nội dung thích ứng. Nó thực chất là một lớp được xây dựng trên MSE để xây dựng các ứng dụng khách phát trực tuyến bit rate thích ứng. Trong khi có các giao thức khác (như HTTP Live Streaming (HLS)), DASH có hỗ trợ nền tảng nhiều nhất.

DASH chuyển nhiều logic ra khỏi giao thức mạng và vào logic ứng dụng phía máy khách, sử dụng giao thức HTTP đơn giản hơn để tải tệp. Thật vậy, người ta có thể hỗ trợ DASH với một máy chủ tệp tĩnh đơn giản, điều này cũng rất tốt cho CDN. Điều này tương phản trực tiếp với các giải pháp phát trực tuyến trước đây yêu cầu giấy phép đắt tiền cho các triển khai giao thức máy khách/máy chủ độc quyền không tiêu chuẩn.

Hai trường hợp sử dụng phổ biến nhất cho DASH liên quan đến việc xem nội dung "theo yêu cầu" hoặc "trực tiếp". Nội dung theo yêu cầu cho phép nhà phát triển dành thời gian chuyển mã tài sản thành nhiều độ phân giải với chất lượng khác nhau.

Nội dung hồ sơ trực tiếp có thể gây ra độ trễ do quá trình chuyển mã và phát sóng, vì vậy DASH không phù hợp để giao tiếp thời gian thực như [WebRTC](/en-US/docs/Web/API/WebRTC_API). Tuy nhiên, nó có thể hỗ trợ nhiều kết nối máy khách hơn đáng kể so với WebRTC.

Có nhiều công cụ mã nguồn mở và miễn phí để chuyển mã nội dung và chuẩn bị sử dụng với DASH, máy chủ tệp DASH và các thư viện máy khách DASH viết bằng JavaScript. Bài viết [Phát trực tuyến thích ứng DASH cho HTML video](/vi/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming) cung cấp ví dụ về cách sử dụng DASH với MSE.

### Khả dụng trong worker

Bắt đầu với Chrome 108, các tính năng MSE có sẵn trong {{domxref("Web Workers API", "web worker", "", "nocode")}} chuyên dụng, cho phép cải thiện hiệu suất khi thao tác các {{domxref("MediaSource")}} và {{domxref("SourceBuffer")}}. Để phát lại phương tiện, thuộc tính {{domxref("MediaSource.handle")}} được sử dụng để lấy tham chiếu đến đối tượng {{domxref("MediaSourceHandle")}}, một proxy cho `MediaSource` có thể được chuyển lại luồng chính và gắn vào phần tử phương tiện qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}} của nó.

Xem [MSE-in-Workers Demo by Matt Wolenetz](https://wolenetz.github.io/mse-in-workers-demo/mse-in-workers-demo.html) để có ví dụ trực tiếp.

## Các interface

- {{domxref("MediaSource")}}
  - : Đại diện cho một nguồn phương tiện sẽ được phát qua đối tượng {{domxref("HTMLMediaElement")}}.
- {{domxref("MediaSourceHandle")}}
  - : Một proxy cho {{domxref("MediaSource")}} có thể được chuyển từ worker chuyên dụng về luồng chính và gắn vào phần tử phương tiện qua thuộc tính {{domxref("HTMLMediaElement.srcObject")}} của nó.
- {{domxref("SourceBuffer")}}
  - : Đại diện cho một khối phương tiện được chuyển vào {{domxref("HTMLMediaElement")}} qua đối tượng `MediaSource`.
- {{domxref("SourceBufferList")}}
  - : Một danh sách vùng chứa đơn giản cho nhiều đối tượng `SourceBuffer`.
- {{domxref("ManagedMediaSource")}}
  - : Một {{domxref("MediaSource")}} chủ động quản lý nội dung bộ nhớ của nó. Không giống như `MediaSource` thông thường, `ManagedMediaSource` có thể giải phóng nội dung khỏi các bộ đệm nguồn bất cứ lúc nào vì các lý do như hạn chế về bộ nhớ hoặc phần cứng.
- {{domxref("ManagedSourceBuffer")}}
  - : Một {{domxref("SourceBuffer")}} được tạo bởi `ManagedMediaSource`. Phát các sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}} để thông báo cho ứng dụng khi các phạm vi được đệm thay đổi, bao gồm cả khi tác nhân người dùng giải phóng nội dung.
- {{domxref("BufferedChangeEvent")}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}}, chứa {{domxref("TimeRanges")}} đại diện cho các phạm vi đệm đã thêm và đã xóa.
- {{domxref("VideoPlaybackQuality")}}
  - : Chứa thông tin về chất lượng video đang được phát bởi phần tử {{htmlelement("video")}}, chẳng hạn như số khung hình bị dropped hoặc bị hỏng. Được trả về bởi phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}}.

### Mở rộng cho các interface khác

- {{domxref("HTMLMediaElement.buffered")}}
  - : Trả về đối tượng {{domxref("TimeRanges")}} cho biết các phạm vi của nguồn phương tiện mà trình duyệt đã đệm (nếu có) tại thời điểm truy cập thuộc tính `buffered`.
- {{domxref("HTMLMediaElement.seekable")}}
  - : Trả về đối tượng {{domxref('TimeRanges')}} chứa các phạm vi thời gian mà người dùng có thể tua đến, nếu có.
- {{domxref("HTMLMediaElement.srcObject")}}
  - : Một đối tượng cung cấp phương tiện đại diện cho tài nguyên phương tiện sẽ phát hoặc đã phát trong `HTMLMediaElement` hiện tại, hoặc `null` nếu không được gán.
- {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}}
  - : Trả về đối tượng {{domxref("VideoPlaybackQuality")}} cho video đang được phát hiện tại.
- {{domxref("AudioTrack.sourceBuffer")}}, {{domxref("VideoTrack.sourceBuffer")}}, {{domxref("TextTrack.sourceBuffer")}}
  - : Trả về {{domxref("SourceBuffer")}} đã tạo track tương ứng.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Chuyển mã tài sản cho Media Source Extensions](/vi/docs/Web/API/Media_Source_Extensions_API/Transcoding_assets_for_MSE)
- Sử dụng MSE để tạo dịch vụ phát trực tuyến cơ bản (TBD)
- Sử dụng MPEG DASH để tạo ứng dụng phát trực tuyến (TBD)
- Các phần tử {{htmlelement("audio")}} và {{htmlelement("video")}}.
- {{domxref("HTMLMediaElement")}}, {{domxref("HTMLVideoElement")}}, {{domxref("HTMLAudioElement")}}.
