---
title: Các công nghệ media trên web
short-title: Media
slug: Web/Media
page-type: landing-page
sidebar: mediasidebar
---

Qua nhiều năm, khả năng trình bày, tạo và quản lý âm thanh, video cùng các dạng media khác của web đã ngày càng trưởng thành.
Hiện nay có rất nhiều API, cũng như các phần tử HTML, giao diện DOM và các tính năng khác giúp làm việc với media theo những cách hấp dẫn và giàu tính nhập vai.
Bài viết này liệt kê các hướng dẫn và tài liệu tham khảo cho nhiều tính năng mà bạn có thể dùng khi tích hợp media vào dự án của mình.

## Hướng dẫn

[Các hướng dẫn về media](/en-US/docs/Web/Media/Guides) là các tài nguyên giúp bạn hiểu, chuyển đổi và tối ưu media trên web, bao gồm âm thanh, video và hình ảnh bằng các công nghệ web hiện đại.

- [Phân phối âm thanh và video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery)
  - : Chúng ta có thể phân phối âm thanh và video trên web theo nhiều cách, từ các tệp media "tĩnh" đến các luồng trực tiếp thích ứng. Bài viết này nhằm làm điểm khởi đầu để khám phá các cơ chế phân phối media trên web khác nhau và khả năng tương thích với các trình duyệt phổ biến.
- [Thao tác với âm thanh và video](/en-US/docs/Web/Media/Guides/Audio_and_video_manipulation)
  - : Việc có âm thanh và video gốc trong trình duyệt đồng nghĩa chúng ta có thể dùng các luồng dữ liệu này với những công nghệ như {{htmlelement("canvas")}}, [WebGL](/en-US/docs/Web/API/WebGL_API) hoặc [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) để sửa đổi trực tiếp âm thanh và video, ví dụ như thêm hiệu ứng dội âm/nén cho âm thanh, hoặc bộ lọc grayscale/sepia cho video.
- [Hướng dẫn autoplay cho media và Web Audio API](/en-US/docs/Web/Media/Guides/Autoplay)
  - : Việc media hoặc âm thanh tự phát bất ngờ có thể là điều người dùng không mong muốn. Dù autoplay có mục đích sử dụng riêng, nó cần được dùng cẩn trọng. Để trao quyền kiểm soát cho người dùng, nhiều trình duyệt hiện cung cấp các hình thức chặn autoplay. Bài viết này là hướng dẫn về autoplay, với các mẹo về khi nào và cách sử dụng nó, cũng như cách phối hợp với trình duyệt để xử lý việc chặn autoplay một cách mượt mà.
- [DASH Adaptive Streaming cho video HTML 5](/en-US/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming)
  - : Dynamic Adaptive Streaming over HTTP (DASH) là một giao thức truyền phát thích ứng. Điều này có nghĩa là nó cho phép luồng video chuyển đổi giữa các mức bitrate dựa trên hiệu năng mạng, nhằm giữ cho video tiếp tục phát.
- [Truyền phát âm thanh và video](/en-US/docs/Web/Media/Guides/Streaming)
  - : Hướng dẫn bao quát cách truyền phát âm thanh và video, cũng như các kỹ thuật và công nghệ bạn có thể tận dụng để đảm bảo chất lượng và/hoặc hiệu năng tốt nhất có thể cho các luồng của mình.
- [Loại và định dạng media trên web](/en-US/docs/Web/Media/Guides/Formats)
  - : Hướng dẫn về các loại tệp và codec có sẵn cho media hình ảnh, âm thanh và video trên web. Tài liệu này bao gồm khuyến nghị về nên dùng định dạng nào cho từng loại nội dung, các thực hành tốt nhất như cách cung cấp fallback và ưu tiên loại media, đồng thời cũng có thông tin hỗ trợ trình duyệt nói chung cho từng container và codec.
- [Sử dụng hình ảnh trong HTML](/en-US/docs/Web/Media/Guides/Images)
  - : Hướng dẫn thêm hình ảnh vào website theo cách đáp ứng, có khả năng truy cập và đạt hiệu năng tốt.

## Tài liệu tham khảo

### HTML

Các phần tử HTML sau đây được dùng để nhúng media vào một trang.

- {{HTMLElement("audio")}}
  - : Phần tử `<audio>` được dùng để phát âm thanh. Chúng có thể được dùng ẩn như đích đến cho media phức tạp hơn, hoặc với các điều khiển hiển thị để người dùng tự điều khiển việc phát tệp âm thanh. Có thể truy cập từ JavaScript dưới dạng đối tượng {{domxref("HTMLAudioElement")}}.
- {{HTMLElement("video")}}
  - : Phần tử `<video>` được dùng để phát nội dung video. Nó có thể được dùng để trình bày tệp video hoặc làm đích đến cho nội dung video được truyền phát. Ví dụ, `<video>` cũng có thể được dùng như một cách liên kết các API media với các công nghệ HTML và DOM khác, bao gồm {{HTMLElement("canvas")}} (để lấy và thao tác từng khung hình). Có thể truy cập từ JavaScript dưới dạng đối tượng {{domxref("HTMLVideoElement")}}.
- {{HTMLElement("track")}}
  - : Phần tử HTML `<track>` có thể được đặt bên trong phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}} để cung cấp tham chiếu đến một rãnh phụ đề hoặc chú thích định dạng [WebVTT](/en-US/docs/Web/API/WebVTT_API) dùng khi phát media. Có thể truy cập từ JavaScript dưới dạng đối tượng {{domxref("HTMLTrackElement")}}.
- {{HTMLElement("source")}}
  - : Phần tử HTML `<source>` được dùng bên trong phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}} để chỉ định media nguồn cần trình bày. Có thể dùng nhiều nguồn để cung cấp media ở các định dạng, kích thước hoặc độ phân giải khác nhau. Có thể truy cập từ JavaScript dưới dạng đối tượng {{domxref("HTMLSourceElement")}}.

### API

- [Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API)
  - : Media Capabilities API cho phép bạn xác định khả năng mã hóa và giải mã của thiết bị mà ứng dụng hoặc trang web của bạn đang chạy trên đó. Điều này giúp bạn đưa ra quyết định theo thời gian thực về nên dùng định dạng nào và khi nào.
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
  - : Tài liệu tham khảo cho API giúp truyền phát, ghi lại và thao tác media cả cục bộ lẫn qua mạng. Điều này bao gồm việc dùng camera và microphone cục bộ để chụp video, âm thanh và ảnh tĩnh.
- [Media Session API](/en-US/docs/Web/API/Media_Session_API)
  - : Media Session API cung cấp cách tùy biến thông báo media. Nó thực hiện điều này bằng cách cung cấp metadata để user agent hiển thị cho media mà ứng dụng web của bạn đang phát. Nó cũng cung cấp các action handler mà trình duyệt có thể dùng để truy cập các phím media của nền tảng như phím phần cứng trên bàn phím, tai nghe, điều khiển từ xa, và các phím phần mềm trong khu vực thông báo cũng như trên màn hình khóa của thiết bị di động.
- [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API)
  - : MediaStream Recording API cho phép bạn ghi lại các luồng media để xử lý hoặc lọc dữ liệu, hoặc ghi chúng ra đĩa.
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
  - : Web Audio API cho phép bạn tạo, lọc và thao tác dữ liệu âm thanh cả theo thời gian thực lẫn trên nội dung đã ghi sẵn, sau đó gửi âm thanh đó đến một đích như phần tử `<audio>`, một luồng media hoặc ra đĩa.
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
  - : WebRTC (Web Real-Time Communication) cho phép truyền phát âm thanh và video trực tiếp, cũng như truyền dữ liệu tùy ý, giữa hai peer qua Internet mà không cần bên trung gian.

## Chủ đề liên quan

Các chủ đề liên quan có thể đáng quan tâm vì chúng có thể được dùng kết hợp với API media theo những cách thú vị.

- [Nội dung đa phương tiện có khả năng truy cập](/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia)
  - : Trong hướng dẫn này, chúng tôi đề cập đến các cách mà nhà thiết kế và nhà phát triển web có thể tạo nội dung có thể truy cập đối với những người có năng lực khác nhau. Điều này trải dài từ việc dùng thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) trên phần tử {{HTMLElement("img")}} đến phụ đề và gắn thẻ media cho trình đọc màn hình.
- [Canvas API](/en-US/docs/Web/API/Canvas_API)
  - : Canvas API cho phép bạn vẽ vào {{HTMLElement("canvas")}}, thao tác và thay đổi nội dung của một hình ảnh. Nó có thể được dùng với media theo nhiều cách, bao gồm đặt phần tử `<canvas>` làm đích đến cho việc phát video hoặc chụp từ camera để bạn có thể thu và thao tác các khung hình video.
- [WebGL](/en-US/docs/Web/API/WebGL_API)
  - : WebGL cung cấp một API tương thích OpenGL ES phía trên Canvas API hiện có, cho phép thực hiện đồ họa 3D mạnh mẽ trên Web. Thông qua canvas, nó có thể được dùng để thêm hình ảnh 3D vào nội dung media.
- [WebXR](/en-US/docs/Web/API/WebXR_Device_API)
  - : WebXR, đã thay thế WebVR API nay đã lỗi thời, là công nghệ hỗ trợ tạo nội dung thực tế ảo (VR) và thực tế tăng cường (AR). Nội dung thực tế hỗn hợp sau đó có thể được hiển thị trên màn hình thiết bị hoặc bằng kính bảo hộ hay headset.
- [WebVR](/en-US/docs/Web/API/WebVR_API) {{deprecated_inline}}
  - : Web Virtual Reality API hỗ trợ các thiết bị thực tế ảo (VR) như Oculus Rift hoặc HTC Vive, cho phép nhà phát triển chuyển vị trí và chuyển động của người dùng thành chuyển động trong một cảnh 3D rồi trình bày trên thiết bị. WebVR đã được WebXR thay thế và sẽ sớm bị loại bỏ khỏi trình duyệt.
- [Những điều cơ bản về định vị âm thanh trong Web Audio](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
  - : Trong các môi trường 3D, có thể là cảnh 3D được dựng lên màn hình hoặc trải nghiệm thực tế hỗn hợp qua headset, điều quan trọng là âm thanh phải được phát sao cho nghe như đến từ đúng hướng của nguồn phát. Hướng dẫn này trình bày cách thực hiện điều đó.
