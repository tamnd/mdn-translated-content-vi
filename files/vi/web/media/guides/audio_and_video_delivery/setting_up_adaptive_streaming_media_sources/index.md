---
title: Thiết lập các nguồn media cho adaptive streaming
slug: Web/Media/Guides/Audio_and_video_delivery/Setting_up_adaptive_streaming_media_sources
page-type: guide
sidebar: mediasidebar
---

Giả sử bạn muốn thiết lập một nguồn media adaptive streaming trên máy chủ để được sử dụng bên trong một phần tử media HTML. Bạn sẽ làm điều đó như thế nào? Bài viết này giải thích cách làm, xem xét hai định dạng phổ biến nhất: MPEG-DASH và HLS (HTTP Live Streaming.)

## Chọn định dạng

Về các định dạng adaptive streaming, có rất nhiều lựa chọn; chúng tôi quyết định chọn hai định dạng sau vì kết hợp lại, chúng ta có thể hỗ trợ hầu hết trình duyệt hiện đại.

- MPEG-DASH
- HLS (HTTP Live Streaming)

Để phát media theo cách thích ứng, chúng ta cần chia media thành các đoạn nhỏ. Chúng ta phải cung cấp nhiều tệp chất lượng khác nhau, được chia theo nhiều mốc thời gian khác nhau. Càng nhiều mức chất lượng và mốc thời gian, luồng của bạn sẽ càng "thích ứng" hơn, nhưng thông thường ta sẽ muốn tìm một sự cân bằng thực dụng giữa dung lượng, thời gian mã hóa và mức độ thích ứng.

Tin tốt là sau khi đã mã hóa media ở định dạng phù hợp, chúng ta gần như đã sẵn sàng. Với adaptive streaming qua HTTP, không cần thành phần đặc biệt nào phía máy chủ.

Cả MPEG-DASH và HLS đều dùng định dạng playlist để cấu trúc các mảnh media tạo thành các luồng khả dĩ. Các luồng với bitrate khác nhau được chia thành các segment và đặt vào các thư mục phù hợp trên máy chủ - chúng ta phải cung cấp cho trình phát media một liên kết tới các tệp tra cứu hoặc playlist chỉ định tên và vị trí của các thư mục luồng này.

## Mã hóa MPEG-DASH

MPEG-DASH là một kỹ thuật truyền phát bitrate thích ứng cho phép truyền tải nội dung media qua Internet từ các máy chủ web HTTP thông thường.

Một tệp media presentation description (MPD) được dùng để chứa thông tin về các luồng khác nhau và băng thông liên quan đến chúng. Trong thuộc tính nguồn video (src) của bạn, bạn trỏ tới MPD thay vì tới tệp media như với media không thích ứng.

Tệp MPD cho trình duyệt biết các mảnh media khác nhau nằm ở đâu, nó cũng bao gồm metadata như mimeType và codecs, cùng các chi tiết khác như byte range - đây là một tài liệu XML và trong nhiều trường hợp sẽ được tạo tự động cho bạn.

Có một vài profile mà chúng ta có thể dùng. Chúng ta sẽ xem qua profile Ondemand cho Video On Demand (VOD) và profile LIVE.

Đối với việc phát dịch vụ trực tiếp, profile LIVE là bắt buộc. Khả năng chuyển đổi luồng là như nhau giữa các profile.

Các lý do khác để dùng profile LIVE thay vì Ondemand cho nội dung VOD có thể là:

1. Máy khách hoặc máy chủ của bạn không hỗ trợ [range requests](/en-US/docs/Web/HTTP/Guides/Range_requests)
2. Máy chủ của bạn không thể cache các range request một cách hiệu quả
3. Máy chủ của bạn không thể prefetch các range request một cách hiệu quả
4. SIDX\* quá lớn và việc phải tải nó trước làm chậm quá trình khởi động một chút
5. Bạn muốn dùng cùng một tệp gốc cho cả DASH và các hình thức phân phối khác (chẳng hạn Microsoft Smooth Streaming) như một chiến lược chuyển tiếp
6. Bạn có thể dùng cùng một tệp media cho cả truyền phát trực tiếp và VOD ở giai đoạn sau

\*SIDX hay SegmentIndexBox là một cấu trúc mô tả một segment bằng cách cho biết thời điểm trình bày sớm nhất của nó cùng các siêu dữ liệu khác, và thường có thể chiếm một phần khá lớn của tệp MPD.

### Profile Ondemand

Profile này cho phép chuyển đổi giữa các luồng "theo yêu cầu" - tức là bạn chỉ cần cung cấp một bộ tệp liên tiếp và chỉ định băng thông cho từng tệp, tệp phù hợp sẽ được chọn tự động.

Đây là một ví dụ cung cấp một biểu diễn track âm thanh và bốn biểu diễn video riêng biệt.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<MPD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="urn:mpeg:dash:schema:mpd:2011"
  xsi:schemaLocation="urn:mpeg:dash:schema:mpd:2011 DASH-MPD.xsd"
  type="static"
  mediaPresentationDuration="PT654S"
  minBufferTime="PT2S"
  profiles="urn:mpeg:dash:profile:isoff-on-demand:2011">

  <BaseURL>http://example.com/ondemand/</BaseURL>
  <Period>
    <!-- English Audio -->
    <AdaptationSet mimeType="audio/mp4" codecs="mp4a.40.5" lang="en" subsegmentAlignment="true" subsegmentStartsWithSAP="1">
      <Representation id="1" bandwidth="64000">
        <BaseURL>ElephantsDream_AAC48K_064.mp4.dash</BaseURL>
      </Representation>
    </AdaptationSet>
    <!-- Video -->
    <AdaptationSet mimeType="video/mp4" codecs="avc1.42401E" subsegmentAlignment="true" subsegmentStartsWithSAP="1">
      <Representation id="2" bandwidth="100000" width="480" height="360">
        <BaseURL>ElephantsDream_H264BPL30_0100.264.dash</BaseURL>
      </Representation>
      <Representation id="3" bandwidth="175000" width="480" height="360">
        <BaseURL>ElephantsDream_H264BPL30_0175.264.dash</BaseURL>
      </Representation>
      <Representation id="4" bandwidth="250000" width="480" height="360">
        <BaseURL>ElephantsDream_H264BPL30_0250.264.dash</BaseURL>
      </Representation>
      <Representation id="5" bandwidth="500000" width="480" height="360">
        <BaseURL>ElephantsDream_H264BPL30_0500.264.dash</BaseURL>
      </Representation>
    </AdaptationSet>
  </Period>
</MPD>
```

Sau khi đã tạo tệp MPD, bạn có thể tham chiếu nó từ bên trong thẻ video.

```html
<video src="my.mpd" type="application/dash+xml"></video>
```

Có lẽ nên cung cấp phương án dự phòng cho các trình duyệt chưa hỗ trợ MPEG-DASH:

```html
<video>
  <source src="my.mpd" type="application/dash+xml" />
  <!-- dự phòng -->
  <source src="my.mp4" type="video/mp4" />
  <source src="my.webm" type="video/webm" />
</video>
```

### Profile LIVE

Một phần mềm hữu ích khi làm việc với MPEG-DASH là [Dash Encoder](https://github.com/slederer/DASHEncoder). Phần mềm này dùng [MP4Box](https://github.com/gpac/gpac/wiki/mp4box-dash-opts) để mã hóa media sang định dạng MPEG-DASH.

> [!NOTE]
> Bạn sẽ cần quen với make file và cài đặt dependencies để đưa phần mềm này lên và chạy.

> [!NOTE]
> Vì giải mã MPEG-DASH được thực hiện một phần bằng JavaScript và các tệp MSE thường được lấy bằng XHR, hãy nhớ đến các quy tắc same origin.

> [!NOTE]
> Nếu bạn dùng WebM, bạn có thể sử dụng các phương pháp được trình bày trong hướng dẫn này [DASH Adaptive Streaming for HTML 5 Video](/en-US/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming).

Sau khi mã hóa, cấu trúc tệp của bạn có thể trông như sau:

```plain
play list ->                /segments/news.mp4.mpd

main segment folder ->      /segments/main/

100 Kbps segment folder ->  /segments/main/news100 contains (1.m4s, 2.m4s, 3.m4s … )

200 Kbps segment folder ->  /segments/main/news200 contains (1.m4s, 2.m4s, 3.m4s … )

300 Kbps segment folder ->  /segments/main/news300 contains (1.m4s, 2.m4s, 3.m4s … )

400 Kbps segment folder ->  /segments/main/news400 contains (1.m4s, 2.m4s, 3.m4s … )
```

Tệp playlist hay tệp `.mpd` chứa XML liệt kê rõ nơi lưu tất cả các tệp bitrate khác nhau.

```xml
<?xml version="1.0"?>
  <MPD xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:mpeg:DASH:schema:MPD:2011" xsi:schemaLocation="urn:mpeg:DASH:schema:MPD:2011" profiles="urn:mpeg:dash:profile:isoff-main:2011" type="static" mediaPresentationDuration="PT0H9M56.46S">
    <BaseURL>
      http://example.com/segments
    </BaseURL>
    <Period start="PT0S">
      <AdaptationSet bitstreamSwitching="true">

        <Representation id="0" codecs="avc1" mimeType="video/mp4" width="320" height="240" startWithSAP="1" bandwidth="46986">
          <SegmentBase>
            <Initialization sourceURL="main/news100/1.m4s" range="0-862"/>
          </SegmentBase>
          <SegmentList duration="1">
            <SegmentURL media="main/news100/2.m4s" mediaRange="863-7113"/>
            <SegmentURL media="main/news100/3.m4s" mediaRange="7114-14104"/>
            <SegmentURL media="main/news100/4.m4s" mediaRange="14105-17990"/>
          </SegmentList>
        </Representation>

        <Representation id="1" codecs="avc1" mimeType="video/mp4" width="320" height="240" startWithSAP="1" bandwidth="91932">
          <SegmentBase>
            <Initialization sourceURL="main/news200/1.m4s" range="0-864"/>
          </SegmentBase>
          <SegmentList duration="1">
            <SegmentURL media="main/news200/2.m4s" mediaRange="865-11523"/>
            <SegmentURL media="main/news200/3.m4s" mediaRange="11524-25621"/>
            <SegmentURL media="main/news200/4.m4s" mediaRange="25622-33693"/>
          </SegmentList>
        </Representation>

        <Representation id="1" codecs="avc1" mimeType="video/mp4" width="320" height="240" startWithSAP="1" bandwidth="270370">
          <SegmentBase>
            <Initialization sourceURL="main/news300/1.m4s" range="0-865"/>
          </SegmentBase>
          <SegmentList duration="1">
            <SegmentURL media="main/news300/2.m4s" mediaRange="866-26970"/>
            <SegmentURL media="main/news300/3.m4s" mediaRange="26971-72543"/>
            <SegmentURL media="main/news300/4.m4s" mediaRange="72544-95972"/>
          </SegmentList>
        </Representation>

        …

      </AdaptationSet>
    </Period>
  </MPD>
```

Tệp MPD cho trình duyệt biết các mảnh media khác nhau nằm ở đâu, nó cũng bao gồm metadata như mimeType và codecs và còn có các chi tiết khác như byte-range. Thông thường các tệp này sẽ được tạo tự động cho bạn.

> [!NOTE]
> Bạn cũng có thể tách riêng các luồng audio và video thành các tệp khác nhau, rồi ưu tiên và phục vụ chúng riêng biệt tùy theo băng thông.

Sau khi đã tạo tệp MPD, bạn có thể tham chiếu nó như bình thường từ bên trong phần tử {{ htmlelement("video") }}:

```html
<video src="my.mpd" type="application/dash+xml"></video>
```

Có lẽ nên cung cấp một phương án dự phòng:

```html
<video>
  <source src="my.mpd" type="application/dash+xml" />
  <!-- dự phòng -->
  <source src="my.mp4" type="video/mp4" />
  <source src="my.webm" type="video/webm" />
</video>
```

> [!NOTE]
> Việc phát MPEG-DASH phụ thuộc vào [dash.js](https://github.com/Dash-Industry-Forum/dash.js/) và khả năng hỗ trợ của trình duyệt cho [Media Source Extensions](https://w3c.github.io/media-source/), xem [dash.js reference player](https://reference.dashif.org/dash.js/v4.4.0/samples/dash-if-reference-player/index.html) mới nhất.

## Mã hóa HLS

HTTP Live Streaming (HLS) là một giao thức truyền phát media dựa trên HTTP do Apple triển khai. Nó được tích hợp trong các nền tảng iOS và macOS và hoạt động tốt trên [Safari di động và desktop, cùng hầu hết thiết bị Android](https://caniuse.com/?search=hls).

Media thường được mã hóa dưới dạng MPEG-4 (video H.264 và audio AAC) rồi đóng gói vào MPEG-2 Transport Stream, sau đó được chia thành các segment và lưu thành một hoặc nhiều tệp media `.ts`. Apple cung cấp các công cụ để chuyển đổi tệp media sang định dạng phù hợp.

### Công cụ mã hóa HLS

Có một số công cụ hữu ích cho việc mã hóa HLS

- Stream Segmenter - do Apple cung cấp cho nền tảng Mac - lấy một luồng media từ mạng cục bộ và chia media thành các tệp có kích thước bằng nhau cùng với một tệp chỉ mục.
- Apple cũng cung cấp File Segmenter cho Mac - nó lấy một tệp đã được mã hóa phù hợp, chia nó ra và tạo ra một tệp chỉ mục, theo cách tương tự như Stream Segmenter.

> [!NOTE]
> Bạn có thể tìm thêm chi tiết về các công cụ này tại [Using HTTP Live Streaming](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/StreamingMediaGuide/UsingHTTPLiveStreaming/UsingHTTPLiveStreaming.html).

### Tệp chỉ mục (Playlist)

HLS Index File (giống như tệp `.mpd` của MPEG-DASH) chứa thông tin về nơi tất cả các segment media nằm, cũng như các metadata khác như phân bổ băng thông. Apple dùng định dạng `.m3u8` (một phần mở rộng của định dạng playlist `.m3u`) cho các tệp chỉ mục — xem ví dụ bên dưới:

```plain
#EXT-X-VERSION:3
#EXTM3U
#EXT-X-TARGETDURATION:10
#EXT-X-MEDIA-SEQUENCE:1

# Old-style integer duration; avoid for newer clients.
#EXTINF:10,
http://media.example.com/segment0.ts

# New-style floating-point duration; use for modern clients.
#EXTINF:10.0,
http://media.example.com/segment1.ts
#EXTINF:9.5,
http://media.example.com/segment2.ts
#EXT-X-ENDLIST
```

> [!NOTE]
> Thông tin đầy đủ về cách mã hóa media cho định dạng HLS của Apple có thể được tìm thấy trên [trang Developer của Apple](https://developer.apple.com/streaming/).

## Xem thêm

Tài nguyên bổ sung về adaptive streaming.

### Thông tin chung

- [Adaptive Streaming in the Field](https://www.streamingmedia.com/Articles/Editorial/Featured-Articles/Adaptive-Streaming-in-the-Field-73017.aspx)

### Tổng quan và tham chiếu về HLS

- [HTTP Live Streaming](https://developer.apple.com/streaming/)
- [What is HLS (HTTP-Live-Streaming)?](<https://www.streamingmedia.com/Articles/Editorial/What-Is-.../What-is-HLS-(HTTP-Live-Streaming)-78221.aspx>)
- [HTTP Live Streaming Overview](https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/StreamingMediaGuide/Introduction/Introduction.html)

### Tổng quan và tham chiếu về MPEG-DASH

- [Dynamic Adaptive Streaming over HTTP Dataset](https://dl.acm.org/doi/10.1145/2155555.2155570)
- [DASH Adaptive Streaming for HTML 5 Video](/en-US/docs/Web/API/Media_Source_Extensions_API/DASH_Adaptive_Streaming)
- [Dynamic Adaptive Streaming over HTTP: From Content Creation to Consumption](https://www.slideshare.net/slideshow/dynamic-adaptive-streaming-over-http-from-content-creation-to-consumption/14933566)

### Công cụ MPEG-DASH

- [DASHEncoder](https://github.com/slederer/DASHEncoder)
- [MP4Box](https://github.com/gpac/gpac/wiki/MP4Box)
- [DASH.js](https://github.com/Dash-Industry-Forum/dash.js)
- [DASH.js Google Group](https://groups.google.com/forum/#!forum/dashjs)

Các ví dụ adaptive streaming

- [ITEC – Dynamic Adaptive Streaming over HTTP](https://dash.itec.aau.at/dash-dataset/)
- [MPEG DASH Media Source Demo](https://web.archive.org/web/20170703160817/https://dash-mse-test.appspot.com/media.html)
