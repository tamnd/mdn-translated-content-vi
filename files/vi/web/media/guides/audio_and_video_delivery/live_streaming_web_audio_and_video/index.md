---
title: Truyền phát trực tiếp audio và video trên web
slug: Web/Media/Guides/Audio_and_video_delivery/Live_streaming_web_audio_and_video
page-type: guide
sidebar: mediasidebar
---

Công nghệ truyền phát trực tiếp thường được dùng để tiếp sóng các sự kiện trực tiếp như thể thao, hòa nhạc và nói chung là các chương trình TV và Radio được phát trực tiếp. Thường được rút gọn thành streaming, livestreaming là quá trình truyền media "trực tiếp" tới máy tính và thiết bị. Đây là một chủ đề khá phức tạp và còn non trẻ, với nhiều biến số, nên trong bài viết này chúng ta sẽ giới thiệu về chủ đề đó và cho bạn biết cách để bắt đầu.

Điểm then chốt khi truyền media tới trình duyệt là thay vì phát một tệp có độ dài hữu hạn, chúng ta đang truyền một tệp được tạo ra ngay trong quá trình chạy và không có điểm bắt đầu hay kết thúc xác định trước.

## Những khác biệt chính giữa media phát trực tuyến và media tĩnh

Trong trường hợp này, chúng ta dùng media tĩnh để mô tả media được thể hiện bởi một tệp, dù đó là tệp mp3 hay WebM. Tệp này nằm trên một máy chủ và có thể được phân phối, như hầu hết các tệp khác, tới trình duyệt. Điều này thường được gọi là tải xuống tiến dần (progressive download).

Media được phát trực tiếp không có thời điểm bắt đầu và kết thúc hữu hạn mà thay vào đó là một luồng dữ liệu do máy chủ chuyển tiếp đến trình duyệt và thường có tính thích ứng (xem bên dưới). Thông thường, để đạt được điều này, chúng ta cần các định dạng khác nhau và phần mềm phía máy chủ chuyên dụng.

## Adaptive streaming

Một trong những ưu tiên chính của livestreaming là giữ cho trình phát đồng bộ với luồng: adaptive streaming là một kỹ thuật để làm việc này trong trường hợp băng thông thấp. Ý tưởng là theo dõi tốc độ truyền dữ liệu và nếu thấy nó không theo kịp, ta hạ xuống một luồng có băng thông thấp hơn (và do đó chất lượng thấp hơn). Để có khả năng này, chúng ta cần dùng các định dạng hỗ trợ nó. Các định dạng livestreaming thường cho phép adaptive streaming bằng cách chia luồng thành một chuỗi các đoạn nhỏ và cung cấp những đoạn đó ở các mức chất lượng và bitrate khác nhau.

## Streaming Audio and Video on Demand

Công nghệ streaming không chỉ dùng cho các luồng trực tiếp. Nó cũng có thể được dùng thay cho phương pháp tải xuống tiến dần truyền thống cho Audio và Video on demand:

Có một số lợi ích:

- Độ trễ nhìn chung thấp hơn nên media sẽ bắt đầu phát nhanh hơn
- Adaptive streaming mang lại trải nghiệm tốt hơn trên nhiều thiết bị khác nhau
- Media được tải ngay khi cần, giúp việc sử dụng băng thông hiệu quả hơn

## Streaming Protocols

Trong khi media tĩnh thường được phục vụ qua HTTP, có nhiều giao thức để phục vụ các luồng thích ứng; hãy xem qua các lựa chọn.

### HTTP

Hiện tại, HTTP là giao thức được hỗ trợ phổ biến nhất để truyền media on demand hoặc trực tiếp.

### RTMP

Real Time Messaging Protocol (RTMP) là một giao thức độc quyền do Macromedia (nay là Adobe) phát triển và được hỗ trợ bởi plugin Adobe Flash. RTMP có nhiều biến thể, bao gồm RTMPE (mã hóa), RTMPS (bảo mật qua TLS/SSL) và RTMPT (được đóng gói trong các yêu cầu HTTP).

### RTSP

> [!NOTE]
> Real Time Streaming Protocol (RTSP) điều khiển các phiên media giữa các đầu cuối và thường được dùng cùng với Real-time Transport Protocol (RTP) và Real-time Control Protocol (RTCP) để phân phối luồng media. Việc dùng RTP với RTCP cho phép adaptive streaming. Hiện tại điều này vẫn chưa được hỗ trợ nguyên bản trong hầu hết trình duyệt.
>
> Một số nhà cung cấp triển khai các giao thức truyền tải độc quyền, chẳng hạn như RealNetworks và Real Data Transport (RDT) của họ.

### RTSP 2.0

RTSP 2.0 hiện đang được phát triển và không tương thích ngược với RTSP 1.0.

> [!WARNING]
> Mặc dù các thẻ {{ htmlelement("audio") }} và {{ htmlelement("video") }} không phụ thuộc vào giao thức, hiện chưa có trình duyệt nào hỗ trợ bất kỳ thứ gì khác ngoài HTTP mà không cần plugin, dù điều này có vẻ sẽ thay đổi. Các giao thức ngoài HTTP cũng có thể bị tường lửa hoặc proxy chặn.

## Sử dụng các giao thức streaming

Quá trình sử dụng các giao thức khác nhau khá quen thuộc nếu bạn đã từng làm việc với media qua HTTP.

Ví dụ:

```html
<video src="rtsp://myhost.com/mymedia.format">
  <!-- Nguồn dự phòng ở đây -->
</video>
```

## Media Source Extensions (MSE)

[Media Source Extensions](https://w3c.github.io/media-source/) là một bản thảo làm việc của W3C dự kiến mở rộng {{ domxref("HTMLMediaElement") }} để cho phép JavaScript tạo luồng media để phát lại. Việc cho phép JavaScript tạo luồng giúp hỗ trợ nhiều trường hợp sử dụng như adaptive streaming và time shifting của các luồng trực tiếp.

Ví dụ, [bạn có thể triển khai MPEG-DASH bằng JavaScript trong khi chuyển phần giải mã cho MSE](https://web.archive.org/web/20170504035455/https://msopentech.com/blog/2014/01/03/streaming_video_player/).

> [!NOTE]
> Time shifting là quá trình tiêu thụ một luồng trực tiếp vào một thời điểm nào đó sau khi nó diễn ra.

## Định dạng tệp video cho streaming

Một vài định dạng video livestreaming dựa trên HTTP đang bắt đầu được hỗ trợ trên các trình duyệt.

> [!NOTE]
> Bạn có thể tìm hướng dẫn về mã hóa HLS và MPEG-DASH để dùng trên web tại [Thiết lập nguồn media cho adaptive streaming](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Setting_up_adaptive_streaming_media_sources).

### MPEG-DASH

DASH là viết tắt của Dynamic Adaptive Streaming over HTTP. Nó được hỗ trợ thông qua Media Source Extensions, vốn được dùng bởi các thư viện JavaScript như [DASH.js](https://github.com/Dash-Industry-Forum/dash.js/). Cách tiếp cận này cho phép chúng ta tải các đoạn nhỏ của luồng video bằng XHR và "ghép" các đoạn đó vào luồng được phát bởi phần tử {{ htmlelement("video") }}. Ví dụ, nếu phát hiện mạng chậm, ta có thể bắt đầu yêu cầu các đoạn chất lượng thấp hơn (nhỏ hơn) cho phần tiếp theo. Công nghệ này cũng cho phép chèn/gắn một đoạn quảng cáo vào luồng.

> [!NOTE]
> Bạn cũng có thể [dùng WebM với hệ thống adaptive streaming MPEG DASH](https://wiki.webmproject.org/adaptive-streaming/webm-dash-specification).

### HLS

HLS hay HTTP Live Streaming là một giao thức do Apple Inc phát minh và được hỗ trợ trên iOS, Safari và các phiên bản mới nhất của trình duyệt Android / Chrome. HLS cũng có tính thích ứng.

HLS cũng có thể được giải mã bằng JavaScript, nghĩa là chúng ta có thể hỗ trợ các phiên bản mới nhất của Firefox, Chrome và Safari. Xem [HTTP Live Streaming JavaScript player](https://github.com/video-dev/hls.js).

Khi bắt đầu phiên streaming, một [extended M3U (m3u8) playlist](https://en.wikipedia.org/wiki/M3U8#Extended_M3U_directives) sẽ được tải xuống. Nó chứa metadata cho các sub-stream khác nhau được cung cấp.

## Định dạng tệp audio cho streaming

Cũng có một số định dạng audio:

### Opus

Opus là một định dạng mở, không tính tiền bản quyền, có thể tối ưu chất lượng ở nhiều bitrate khác nhau cho các loại audio khác nhau. Nhạc và giọng nói có thể được tối ưu theo những cách khác nhau và Opus dùng các codec SILK và CELT để đạt được điều này.

Hiện tại, Opus được hỗ trợ bởi Firefox trên desktop và di động cũng như các phiên bản mới nhất của Chrome và Opera trên desktop.

> [!NOTE]
> [Opus là một định dạng bắt buộc](https://datatracker.ietf.org/doc/html/draft-ietf-rtcweb-audio-05) đối với các triển khai trình duyệt WebRTC.

### MP3, AAC, Ogg Vorbis

Hầu hết các định dạng audio phổ biến đều có thể được truyền phát bằng các công nghệ phía máy chủ cụ thể.

Lưu ý: Truyền phát audio bằng các định dạng không phải streaming có thể dễ hơn, vì khác với video, audio không có keyframe.

## Công nghệ streaming phía máy chủ

Để truyền phát audio và video trực tiếp, bạn sẽ cần chạy phần mềm streaming cụ thể trên máy chủ hoặc dùng các dịch vụ bên thứ ba.

### GStreamer

[GStreamer](https://gstreamer.freedesktop.org/) là một framework đa phương tiện mã nguồn mở, đa nền tảng, cho phép bạn tạo ra nhiều thành phần xử lý media khác nhau, bao gồm cả các thành phần streaming. Thông qua hệ thống plugin của mình, GStreamer hỗ trợ hơn một trăm codec (bao gồm MPEG-1, MPEG-2, MPEG-4, H.261, H.263, H.264, RealVideo, MP3, WMV và FLV.)

Các plugin của GStreamer như [souphttpclientsink](https://gstreamer.freedesktop.org/documentation/soup/souphttpclientsink.html?gi-language=c) và [shout2send](https://gstreamer.freedesktop.org/documentation/shout2/index.html?gi-language=c#shout2send-page) tồn tại để truyền media qua HTTP, hoặc bạn cũng có thể tích hợp với framework Twisted của Python.

Để truyền RTMP, bạn có thể dùng [Nginx RTMP Module](https://github.com/arut/nginx-rtmp-module).

### SHOUTcast

[SHOUTcast](https://en.wikipedia.org/wiki/SHOUTcast) là một công nghệ độc quyền, đa nền tảng để truyền phát media. Được phát triển bởi Nullsoft, nó cho phép phát nội dung audio số ở định dạng MP3 hoặc AAC. Khi dùng trên web, các luồng SHOUTcast được truyền qua HTTP.

> [!NOTE]
> [Các URL SHOUTcast có thể cần thêm dấu chấm phẩy ở cuối](https://stackoverflow.com/questions/2743279/how-could-i-play-a-shoutcast-icecast-stream-using-html5).

### Icecast

Máy chủ [Icecast](https://www.icecast.org/) là một công nghệ mã nguồn mở để truyền phát media. Được duy trì bởi [Xiph.org Foundation](https://www.xiph.org/), nó truyền Ogg Vorbis/Theora cũng như MP3 và AAC qua giao thức SHOUTcast.

> [!NOTE]
> SHOUTcast và Icecast là một trong những công nghệ phổ biến và lâu đời nhất, nhưng còn rất nhiều [hệ thống media streaming khác](https://en.wikipedia.org/wiki/List_of_streaming_media_systems#Servers).

### Dịch vụ streaming

Mặc dù bạn có thể cài đặt các phần mềm như GStreamer, SHOUTcast và Icecast, bạn cũng sẽ tìm thấy rất nhiều [dịch vụ streaming bên thứ ba](https://en.wikipedia.org/wiki/Comparison_of_streaming_media_systems) có thể làm phần lớn công việc giúp bạn.

## Xem thêm

- [HTTP Live Streaming](https://en.wikipedia.org/wiki/HTTP_Live_Streaming)
- [HLS Browser Support](https://caniuse.com/?search=hls)
- [HTTP Live Streaming JavaScript player](https://github.com/RReverser/mpegts)
- [The Basics of HTTP Live Streaming](https://larryjordan.com/articles/basics-of-http-live-streaming/)
- [DASH Adaptive Streaming for HTML 5 Video](/en-US/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming)
- [Dynamic Adaptive Streaming over HTTP (MPEG-DASH)](https://en.wikipedia.org/wiki/Dynamic_Adaptive_Streaming_over_HTTP)
- [MPEG-DASH Media Source Demo](https://web.archive.org/web/20170703160817/https://dash-mse-test.appspot.com/media.html)
- [DASH Reference Client](https://reference.dashif.org/dash.js/v4.4.0/samples/dash-if-reference-player/index.html)
- [Dynamic Streaming over HTTP](https://en.wikipedia.org/wiki/Dynamic_Adaptive_Streaming_over_HTTP)
- [The State of MPEG-DASH Deployment](https://www.streamingmediaglobal.com/Articles/Editorial/Featured-Articles/The-State-of-MPEG-DASH-Deployment-96144.aspx)
- [Look, no plugins: Live streaming to the browser using Media Source Extensions and MPEG-DASH](https://www.bbc.co.uk/rd/blog/2014-03-media-source-extensions)
- [Media Source Extensions (W3C)](https://w3c.github.io/media-source/)
- [Icecast](https://en.wikipedia.org/wiki/Icecast)
- [SHOUTcast](https://en.wikipedia.org/wiki/Shoutcast)
- [GStreamer](https://en.wikipedia.org/wiki/GStreamer)
- [Streaming GStreamer Pipelines Via HTTP](https://coaxion.net/blog/2013/10/streaming-gstreamer-pipelines-via-http/)
- [GStreamer and Raspberry Pi](https://nginx-rtmp.blogspot.com/2013/07/gstreamer-and-raspberry-pi.html)
- [Comparison of Streaming Media Systems](https://en.wikipedia.org/wiki/Comparison_of_streaming_media_systems)
- [Mozilla Hacks - Streaming Media on demand with Media Source Extensions](https://hacks.mozilla.org/2015/07/streaming-media-on-demand-with-media-source-extensions/)
