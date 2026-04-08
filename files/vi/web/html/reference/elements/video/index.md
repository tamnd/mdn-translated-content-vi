---
title: "<video>: Phần tử Nhúng Video"
slug: Web/HTML/Reference/Elements/video
page-type: html-element
browser-compat: html.elements.video
sidebar: htmlsidebar
---

Phần tử **`<video>`** [HTML](/en-US/docs/Web/HTML) nhúng một trình phát phương tiện hỗ trợ phát lại video vào tài liệu. Bạn cũng có thể sử dụng `<video>` cho nội dung âm thanh, nhưng phần tử {{HTMLElement("audio")}} có thể cung cấp trải nghiệm người dùng phù hợp hơn.

{{InteractiveExample("HTML Demo: &lt;video&gt;", "tabbed-standard")}}

```html interactive-example
<video controls width="250">
  <source src="/shared-assets/videos/flower.webm" type="video/webm" />

  <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />

  Download the
  <a href="/shared-assets/videos/flower.webm">WEBM</a>
  or
  <a href="/shared-assets/videos/flower.mp4">MP4</a>
  video.
</video>
```

Ví dụ trên cho thấy cách sử dụng phần tử `<video>`. Tương tự như phần tử {{htmlelement("img")}}, chúng ta bao gồm đường dẫn đến phương tiện muốn hiển thị bên trong thuộc tính `src`; chúng ta có thể bao gồm các thuộc tính khác để chỉ định thông tin như chiều rộng và chiều cao video, liệu chúng ta có muốn tự động phát và lặp lại không, hay hiển thị các điều khiển video mặc định của trình duyệt không, v.v.

Nội dung bên trong thẻ mở và đóng `<video></video>` được hiển thị như nội dung dự phòng trong các trình duyệt không hỗ trợ phần tử này.

## Thuộc tính

Giống như tất cả các phần tử HTML khác, phần tử này hỗ trợ [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `autoplay`
  - : Thuộc tính Boolean; nếu được chỉ định, video tự động bắt đầu phát lại ngay khi có thể mà không dừng để hoàn tất tải dữ liệu.

    > [!NOTE]
    > Các trình duyệt hiện đại chặn âm thanh (hoặc video có rãnh âm thanh không bị tắt tiếng) tự động phát, vì các trang web tự động phát âm thanh có thể là trải nghiệm khó chịu cho người dùng. Xem [hướng dẫn autoplay](/en-US/docs/Web/Media/Guides/Autoplay) để biết thêm thông tin về cách sử dụng autoplay đúng cách.

    Để vô hiệu hóa tự động phát video, `autoplay="false"` sẽ không hoạt động; video sẽ tự động phát nếu thuộc tính có trong thẻ `<video>`. Để loại bỏ autoplay, thuộc tính cần được loại bỏ hoàn toàn.

    > [!NOTE]
    > Video có thuộc tính [`loading="lazy"`](#loading) được đặt sẽ không bắt đầu tải và tự động phát cho đến khi phần tử ở gần hoặc trong vùng hiển thị.

- `controls`
  - : Nếu thuộc tính này có mặt, trình duyệt sẽ cung cấp các điều khiển để cho phép người dùng điều khiển phát lại video, bao gồm âm lượng, tìm kiếm, và tạm dừng/tiếp tục phát lại.
- `controlslist`
  - : Thuộc tính [`controlslist`](https://wicg.github.io/controls-list/explainer.html), khi được chỉ định, giúp trình duyệt chọn những điều khiển nào để hiển thị cho phần tử `video` bất cứ khi nào trình duyệt hiển thị bộ điều khiển riêng của nó (nghĩa là khi thuộc tính `controls` được chỉ định).

    Các giá trị được phép là `nodownload`, `nofullscreen` và `noremoteplayback`.

    Sử dụng thuộc tính [`disablepictureinpicture`](#disablepictureinpicture) nếu bạn muốn vô hiệu hóa chế độ Hình-trong-Hình (và điều khiển).

- [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
  - : Thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) này chỉ định liệu có sử dụng CORS để tải video liên quan hay không. [Tài nguyên hỗ trợ CORS](/en-US/docs/Web/HTML/How_to/CORS_enabled_image) có thể được tái sử dụng trong phần tử {{HTMLElement("canvas")}} mà không bị _nhiễm_. Các giá trị được phép là:
    - `anonymous`
      - : Gửi yêu cầu nguồn gốc chéo mà không có thông tin xác thực. Nói cách khác, nó gửi tiêu đề HTTP `Origin:` mà không có cookie, chứng chỉ X.509, hoặc thực hiện xác thực HTTP Basic. Nếu máy chủ không cung cấp thông tin xác thực cho trang web nguồn gốc (bằng cách không đặt tiêu đề HTTP `Access-Control-Allow-Origin:`), tài nguyên sẽ bị _nhiễm_ và việc sử dụng nó bị hạn chế.
    - `use-credentials`
      - : Gửi yêu cầu nguồn gốc chéo với thông tin xác thực. Nói cách khác, nó gửi tiêu đề HTTP `Origin:` với cookie, chứng chỉ, hoặc thực hiện xác thực HTTP Basic. Nếu máy chủ không cung cấp thông tin xác thực cho trang web nguồn gốc (qua tiêu đề HTTP `Access-Control-Allow-Credentials:`), tài nguyên sẽ bị _nhiễm_ và việc sử dụng nó bị hạn chế.

    Khi không có mặt, tài nguyên được tải mà không có yêu cầu CORS (tức là không gửi tiêu đề HTTP `Origin:`), ngăn việc sử dụng không bị nhiễm trong các phần tử {{HTMLElement('canvas')}}. Nếu không hợp lệ, nó được xử lý như thể từ khóa liệt kê `anonymous` được sử dụng. Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết thêm thông tin.

- `disablepictureinpicture`
  - : Ngăn trình duyệt đề xuất menu ngữ cảnh Hình-trong-Hình hoặc yêu cầu Hình-trong-Hình tự động trong một số trường hợp.
- `disableremoteplayback`
  - : Thuộc tính Boolean được dùng để vô hiệu hóa khả năng phát lại từ xa trên các thiết bị được kết nối qua công nghệ có dây (HDMI, DVI, v.v.) và không dây (Miracast, Chromecast, DLNA, AirPlay, v.v.).

    Trong Safari, bạn có thể sử dụng [`x-webkit-airplay="deny"`](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/AirPlayGuide/OptingInorOutofAirPlay/OptingInorOutofAirPlay.html) như là phương án dự phòng.

- `height`
  - : Chiều cao của vùng hiển thị video, tính bằng [CSS pixels](https://drafts.csswg.org/css-values/#px) (chỉ giá trị tuyệt đối; [không có phần trăm](https://html.spec.whatwg.org/multipage/embedded-content.html#dimension-attributes)).

- `loading`
  - : Chỉ định cách trình duyệt nên tải video (bao gồm cả hình ảnh poster):
    - `eager`
      - : Tải video ngay lập tức, bất kể video hiện có trong vùng hiển thị hay không (đây là giá trị mặc định).
    - `lazy`
      - : Trì hoãn tải video cho đến khi nó đạt đến một khoảng cách tính toán từ vùng hiển thị, như được xác định bởi trình duyệt.

        Tải chậm tránh được băng thông mạng và lưu trữ cần thiết để xử lý video cho đến khi chắc chắn hợp lý rằng nó sẽ cần thiết. Điều này cải thiện hiệu năng trong hầu hết các trường hợp sử dụng thông thường.

    Trong khi các thuộc tính [`width`](#width) và [`height`](#height) rõ ràng được khuyến nghị cho tất cả video để tránh thay đổi bố cục, chúng đặc biệt quan trọng cho các video tải chậm. Video tải chậm sẽ không bao giờ được tải nếu chúng không giao với phần hiển thị của phần tử, ngay cả khi tải chúng sẽ thay đổi điều đó, vì các video chưa tải có `width` và `height` bằng `0`. Nó tạo ra trải nghiệm người dùng thậm chí gây rối hơn khi nội dung hiển thị trong vùng hiển thị bị sắp xếp lại ở giữa lúc đọc.

    Video tải chậm nằm trong vùng hiển thị trực quan có thể chưa hiển thị khi sự kiện {{domxref("Window.load_event", "load")}} của Window được kích hoạt. Điều này là vì sự kiện được kích hoạt dựa trên video tải liền — video tải chậm không được tính đến ngay cả khi chúng nằm trong vùng hiển thị trực quan khi trang được tải lần đầu.

    Tải chỉ bị trì hoãn khi JavaScript được bật. Đây là biện pháp chống theo dõi, vì nếu tác nhân người dùng hỗ trợ tải chậm khi script bị vô hiệu hóa, vẫn có thể cho một trang web theo dõi vị trí cuộn xấp xỉ của người dùng trong suốt một phiên, bằng cách đặt chiến lược các video trong đánh dấu trang sao cho máy chủ có thể theo dõi có bao nhiêu video được yêu cầu và khi nào.

    > [!NOTE]
    > Thuộc tính `loading="lazy"` cũng ảnh hưởng đến các thuộc tính [`autoplay`](#autoplay), [`poster`](#poster), và [`preload`](#preload), như được mô tả trong mỗi phần đó của trang.

- `loop`
  - : Thuộc tính Boolean; nếu được chỉ định, trình duyệt sẽ tự động quay về đầu khi đến cuối video.

- `muted`
  - : Thuộc tính Boolean chỉ định cài đặt tắt tiếng âm thanh mặc định trong video. Nếu được đặt, âm thanh sẽ bị tắt ban đầu. Giá trị mặc định của nó là `false`, nghĩa là âm thanh sẽ được phát khi video phát.

- `playsinline`
  - : Thuộc tính Boolean chỉ định rằng video cần được phát "nội tuyến", nghĩa là trong vùng phát lại của phần tử. Lưu ý rằng sự vắng mặt của thuộc tính này _không_ ngụ ý rằng video sẽ luôn được phát toàn màn hình.

- `poster`
  - : URL cho hình ảnh được hiển thị trong khi video đang tải xuống. Nếu thuộc tính này không được chỉ định, không có gì được hiển thị cho đến khi khung đầu tiên có sẵn, sau đó khung đầu tiên được hiển thị làm hình poster.

    > [!NOTE]
    > Video có thuộc tính [`loading="lazy"`](#loading) được đặt sẽ chỉ tải tài nguyên `poster` khi video ở gần hoặc trong vùng hiển thị.

- `preload`
  - : Thuộc tính {{Glossary("enumerated")}} này nhằm cung cấp gợi ý cho trình duyệt về những gì tác giả nghĩ sẽ dẫn đến trải nghiệm người dùng tốt nhất liên quan đến nội dung nào được tải trước khi video được phát. Nó có thể có một trong các giá trị sau:
    - `none`: Chỉ định rằng video không nên được tải trước.
    - `metadata`: Chỉ định rằng chỉ siêu dữ liệu video (ví dụ: độ dài) được tải.
    - `auto`: Chỉ định rằng toàn bộ tệp video có thể được tải xuống, ngay cả khi người dùng không được kỳ vọng sẽ sử dụng nó.
    - _chuỗi rỗng_: Từ đồng nghĩa với giá trị `auto`.

    Giá trị mặc định khác nhau cho từng trình duyệt. Thông số kỹ thuật khuyến nghị đặt thành `metadata`.

    > [!NOTE]
    >
    > - Thuộc tính `autoplay` có ưu tiên hơn `preload`. Nếu `autoplay` được chỉ định, trình duyệt rõ ràng cần bắt đầu tải video để phát.
    > - Thông số kỹ thuật không buộc trình duyệt phải theo giá trị của thuộc tính này; đây chỉ là gợi ý.

    > [!NOTE]
    > Video có thuộc tính [`loading="lazy"`](#loading) được đặt sẽ chỉ áp dụng hành vi `preload` khi video ở gần hoặc trong vùng hiển thị.

- `src`
  - : URL của video cần nhúng. Đây là tùy chọn; bạn có thể thay vào đó sử dụng phần tử {{HTMLElement("source")}} bên trong khối video để chỉ định video cần nhúng.
- `width`
  - : Chiều rộng của vùng hiển thị video, tính bằng [CSS pixels](https://drafts.csswg.org/css-values/#px) (chỉ giá trị tuyệt đối; [không có phần trăm](https://html.spec.whatwg.org/multipage/embedded-content.html#dimension-attributes)).

## Sự kiện

- {{domxref("ScriptProcessorNode.audioprocess_event","audioprocess")}} {{Deprecated_Inline}}
  - : Bộ đệm đầu vào của {{DOMxRef("ScriptProcessorNode")}} sẵn sàng để xử lý.
- {{domxref("HTMLMediaElement.canplay_event", 'canplay')}}
  - : Trình duyệt có thể phát phương tiện, nhưng ước tính rằng chưa đủ dữ liệu đã được tải để phát phương tiện đến cuối mà không phải dừng để đệm thêm nội dung.
- {{domxref("HTMLMediaElement.canplaythrough_event", 'canplaythrough')}}
  - : Trình duyệt ước tính nó có thể phát phương tiện đến cuối mà không dừng để đệm nội dung.
- {{domxref("OfflineAudioContext.complete_event", "complete")}}
  - : Việc kết xuất của {{DOMxRef("OfflineAudioContext")}} đã kết thúc.
- {{domxref("HTMLMediaElement.durationchange_event", 'durationchange')}}
  - : Thuộc tính `duration` đã được cập nhật.
- {{domxref("HTMLMediaElement.emptied_event", 'emptied')}}
  - : Phương tiện đã trở nên rỗng; ví dụ, sự kiện này được gửi nếu phương tiện đã được tải (hoặc tải một phần), và phương thức [`load()`](/en-US/docs/Web/API/HTMLMediaElement/load) được gọi để tải lại nó.
- {{domxref("HTMLMediaElement.ended_event", 'ended')}}
  - : Phát lại đã dừng vì đã đến cuối phương tiện.
- {{domxref("HTMLMediaElement.error_event", 'error')}}
  - : Đã xảy ra lỗi khi tải dữ liệu phương tiện, hoặc loại tài nguyên không phải là định dạng phương tiện được hỗ trợ.
- {{domxref("HTMLMediaElement.loadeddata_event", 'loadeddata')}}
  - : Khung đầu tiên của phương tiện đã hoàn tất tải.
- {{domxref("HTMLMediaElement.loadedmetadata_event", 'loadedmetadata')}}
  - : Siêu dữ liệu đã được tải.
- {{domxref("HTMLMediaElement.loadstart_event", 'loadstart')}}
  - : Được kích hoạt khi trình duyệt bắt đầu tải tài nguyên.
- {{domxref("HTMLMediaElement.pause_event", 'pause')}}
  - : Phát lại đã bị tạm dừng.
- {{domxref("HTMLMediaElement.play_event", 'play')}}
  - : Phát lại đã bắt đầu.
- {{domxref("HTMLMediaElement.playing_event", 'playing')}}
  - : Phát lại sẵn sàng bắt đầu sau khi bị tạm dừng hoặc trì hoãn do thiếu dữ liệu.
- {{domxref("HTMLMediaElement.progress_event", 'progress')}}
  - : Được kích hoạt định kỳ khi trình duyệt tải tài nguyên.
- {{domxref("HTMLMediaElement.ratechange_event", 'ratechange')}}
  - : Tốc độ phát lại đã thay đổi.
- {{domxref("HTMLMediaElement.seeked_event", 'seeked')}}
  - : Thao tác _tìm kiếm_ đã hoàn thành.
- {{domxref("HTMLMediaElement.seeking_event", 'seeking')}}
  - : Thao tác _tìm kiếm_ đã bắt đầu.
- {{domxref("HTMLMediaElement.stalled_event", 'stalled')}}
  - : Tác nhân người dùng đang cố tải dữ liệu phương tiện, nhưng dữ liệu không đến như mong đợi.
- {{domxref("HTMLMediaElement.suspend_event", 'suspend')}}
  - : Tải dữ liệu phương tiện đã bị tạm dừng.
- {{domxref("HTMLMediaElement.timeupdate_event", 'timeupdate')}}
  - : Thời gian được chỉ định bởi thuộc tính `currentTime` đã được cập nhật.
- {{domxref("HTMLMediaElement.volumechange_event", 'volumechange')}}
  - : Âm lượng đã thay đổi.
- {{domxref("HTMLMediaElement.waiting_event", 'waiting')}}
  - : Phát lại đã dừng do thiếu dữ liệu tạm thời.

## Ghi chú sử dụng

Các trình duyệt không phải tất cả đều hỗ trợ cùng định dạng video; bạn có thể cung cấp nhiều nguồn bên trong các phần tử {{htmlelement("source")}} lồng nhau, và trình duyệt sẽ sử dụng cái đầu tiên mà nó hiểu.

```html
<video controls>
  <source src="myVideo.webm" type="video/webm" />
  <source src="myVideo.mp4" type="video/mp4" />
  <p>
    Your browser doesn't support HTML video. Here is a
    <a href="myVideo.mp4" download="myVideo.mp4">link to the video</a> instead.
  </p>
</video>
```

Khi sử dụng các phần tử {{htmlelement("source")}}, trình duyệt cố tải từng nguồn tuần tự. Nếu một nguồn thất bại (ví dụ: do URL không hợp lệ hoặc định dạng không được hỗ trợ), nguồn tiếp theo được thử, và tiếp tục như vậy. Sự kiện `error` được kích hoạt trên phần tử `<video>` sau khi tất cả các nguồn đã thất bại; sự kiện `error` không được kích hoạt trên từng phần tử `<source>` riêng lẻ.

Chúng tôi cung cấp [hướng dẫn toàn diện về các loại tệp phương tiện](/en-US/docs/Web/Media/Guides/Formats) và [hướng dẫn về các codec được hỗ trợ cho video](/en-US/docs/Web/Media/Guides/Formats/Video_codecs). Cũng có sẵn hướng dẫn về [các codec âm thanh có thể được sử dụng với chúng](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs).

Các ghi chú sử dụng khác:

- Nếu bạn không chỉ định thuộc tính `controls`, video sẽ không bao gồm các điều khiển mặc định của trình duyệt; bạn có thể tạo các điều khiển tùy chỉnh của riêng mình bằng JavaScript và API {{domxref("HTMLMediaElement")}}. Xem [Tạo trình phát video đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player) để biết thêm chi tiết.
- Để kiểm soát chính xác nội dung video (và âm thanh) của bạn, các `HTMLMediaElement` kích hoạt nhiều [sự kiện](/en-US/docs/Web/API/HTMLMediaElement#events) khác nhau. Ngoài việc cung cấp khả năng điều khiển, các sự kiện này cho phép bạn theo dõi tiến trình tải xuống và phát lại phương tiện, cũng như trạng thái và vị trí phát lại.
- Bạn có thể sử dụng thuộc tính {{cssxref("object-position")}} để điều chỉnh vị trí của video trong khung của phần tử, và thuộc tính {{cssxref("object-fit")}} để kiểm soát cách kích thước video được điều chỉnh để vừa với khung.
- Để hiển thị phụ đề/chú thích cùng với video của bạn, bạn có thể sử dụng một số JavaScript cùng với phần tử {{htmlelement("track")}} và định dạng [WebVTT](/en-US/docs/Web/API/WebVTT_API). Xem [Thêm phụ đề và chú thích vào video HTML](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video) để biết thêm thông tin.
- Bạn có thể phát các tệp âm thanh bằng phần tử `<video>`. Điều này có thể hữu ích nếu, ví dụ, bạn cần thực hiện âm thanh với bản ghi thoại [WebVTT](/en-US/docs/Web/API/WebVTT_API), vì phần tử {{HTMLElement("audio")}} không cho phép phụ đề sử dụng WebVTT.
- Để kiểm tra nội dung dự phòng trên các trình duyệt hỗ trợ phần tử, bạn có thể thay thế `<video>` bằng một phần tử không tồn tại như `<notavideo>`.

Nguồn thông tin chung tốt về việc sử dụng `<video>` HTML là hướng dẫn cho người mới bắt đầu [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio).

### Tạo kiểu với CSS

Phần tử `<video>` là một phần tử thay thế — giá trị {{cssxref("display")}} của nó là `inline` theo mặc định — nhưng chiều rộng và chiều cao mặc định của nó trong vùng hiển thị được xác định bởi video được nhúng.

Không có cân nhắc đặc biệt nào cho việc tạo kiểu `<video>`; một chiến lược phổ biến là đặt giá trị `display` thành `block` để dễ dàng định vị, điều chỉnh kích thước hơn, v.v., và sau đó cung cấp thông tin tạo kiểu và bố cục theo yêu cầu. [Kiến thức cơ bản về tạo kiểu trình phát video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Video_player_styling_basics) cung cấp một số kỹ thuật tạo kiểu hữu ích.

### Thêm phụ đề và các rãnh văn bản có thời gian khác

Các rãnh văn bản có thời gian cho phụ đề, chú thích kín, tiêu đề chương, v.v., có thể được thêm theo khai báo bằng cách lồng phần tử {{HTMLElement("track")}}.
Các rãnh được chỉ định trong [Định dạng Tệp Rãnh Văn bản Video Web (WebVTT)](/en-US/docs/Web/API/WebVTT_API/Web_Video_Text_Tracks_Format) (tệp `.vtt`).

Ví dụ, HTML bên dưới bao gồm tệp "captions.vtt", sẽ được dùng để phủ lên phụ đề kín trên video nếu phụ đề được người dùng bật.

```html
<video controls src="video.webm">
  <track default kind="captions" src="captions.vtt" />
</video>
```

Các rãnh văn bản có thời gian cũng có thể được thêm theo chương trình bằng cách sử dụng [WebVTT API](/en-US/docs/Web/API/WebVTT_API).

### Phát hiện thêm và xóa rãnh

Bạn có thể phát hiện khi các rãnh được thêm vào và xóa khỏi phần tử `<video>` bằng cách sử dụng các sự kiện {{domxref("VideoTrackList/addtrack_event", "addtrack")}} và {{domxref("VideoTrackList/removetrack_event", "removetrack")}}. Tuy nhiên, các sự kiện này không được gửi trực tiếp đến phần tử `<video>` chính nó.
Thay vào đó, chúng được gửi đến đối tượng danh sách rãnh bên trong {{domxref("HTMLMediaElement")}} của phần tử `<video>` tương ứng với loại rãnh đã được thêm vào phần tử:

- {{domxref("HTMLMediaElement.audioTracks")}}
  - : {{domxref("AudioTrackList")}} chứa tất cả các rãnh âm thanh của phần tử media.
    Thêm trình lắng nghe cho `addtrack` vào đối tượng này để được thông báo khi các rãnh âm thanh mới được thêm vào phần tử.
- {{domxref("HTMLMediaElement.videoTracks")}}
  - : {{domxref("VideoTrackList")}} chứa tất cả các rãnh video của phần tử media.
    Thêm trình lắng nghe `addtrack` vào đối tượng này để được thông báo khi các rãnh video được thêm vào phần tử.
- {{domxref("HTMLMediaElement.textTracks")}}
  - : {{domxref("TextTrackList")}} chứa tất cả các rãnh văn bản của phần tử media (được dùng cho phụ đề, chú thích kín, v.v.).
    Thêm trình lắng nghe `addtrack` vào đối tượng này để được thông báo khi các rãnh văn bản được thêm vào phần tử.

Ví dụ, để phát hiện khi các rãnh âm thanh được thêm vào hoặc xóa khỏi phần tử `<video>`, bạn có thể sử dụng mã như sau:

```js
const elem = document.querySelector("video");

elem.audioTracks.onaddtrack = (event) => {
  trackEditor.addTrack(event.track);
};

elem.audioTracks.onremovetrack = (event) => {
  trackEditor.removeTrack(event.track);
};
```

Mã này theo dõi các rãnh âm thanh được thêm vào và xóa khỏi phần tử, và gọi một hàm giả định trên trình chỉnh sửa rãnh để đăng ký và xóa rãnh khỏi danh sách các rãnh có sẵn của trình chỉnh sửa.

Bạn cũng có thể sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để lắng nghe các sự kiện {{domxref("VideoTrackList/addtrack_event", "addtrack")}} và {{domxref("VideoTrackList/removetrack_event", "removetrack")}}.

### Hỗ trợ máy chủ cho video

Nếu loại MIME cho video không được đặt đúng trên máy chủ, video có thể không hiển thị hoặc hiển thị hộp màu xám có dấu X (nếu JavaScript được bật).

Nếu bạn sử dụng Apache Web Server để phục vụ video WebM, bạn có thể sửa vấn đề này bằng cách thêm các phần mở rộng loại tệp video vào loại MIME `video/webm` (phần mở rộng tệp WebM phổ biến nhất là `.webm`). Để làm điều này, hãy chỉnh sửa tệp `mime.types` trong `/etc/apache` hoặc sử dụng chỉ thị cấu hình `AddType` trong `httpd.conf`:

```plain
AddType video/webm .webm
```

Nhà cung cấp dịch vụ web của bạn có thể cung cấp giao diện dễ dàng để thay đổi cấu hình loại MIME cho các công nghệ mới cho đến khi cập nhật toàn cầu tự nhiên xảy ra.

## Khả năng tiếp cận

Video nên cung cấp cả phụ đề và bản ghi thoại mô tả chính xác nội dung của chúng (xem [Thêm phụ đề và chú thích vào video HTML](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Adding_captions_and_subtitles_to_HTML5_video) để biết thêm thông tin về cách triển khai). Phụ đề cho phép những người bị suy giảm thính lực hiểu nội dung âm thanh của video khi video đang được phát, trong khi bản ghi thoại cho phép những người cần thêm thời gian để có thể xem lại nội dung âm thanh theo tốc độ và định dạng phù hợp với họ.

Đáng chú ý là trong khi bạn có thể chú thích phương tiện chỉ âm thanh, bạn chỉ có thể làm như vậy khi phát âm thanh trong phần tử `<video>` vì vùng video của phần tử được dùng để trình bày phụ đề. Đây là một trong những trường hợp đặc biệt mà việc phát âm thanh trong phần tử video là hữu ích.

Nếu các dịch vụ tạo phụ đề tự động được sử dụng, điều quan trọng là xem xét nội dung được tạo để đảm bảo nó đại diện chính xác video nguồn.

Ngoài hội thoại nói, phụ đề và bản ghi thoại cũng phải xác định âm nhạc và hiệu ứng âm thanh truyền đạt thông tin quan trọng. Điều này bao gồm cảm xúc và giai điệu:

```plain
14
00:03:14 --> 00:03:18
[Dramatic rock music]

15
00:03:19 --> 00:03:21
[whispering] What's that off in the distance?

16
00:03:22 --> 00:03:24
It's… it's a…

16 00:03:25 --> 00:03:32
[Loud thumping]
[Dishes clattering]
```

Phụ đề không nên che khuất chủ đề chính của video. Chúng có thể được định vị bằng [cài đặt cue `align` VTT](/en-US/docs/Web/API/WebVTT_API/Web_Video_Text_Tracks_Format#cue_settings).

- [Web Video Text Tracks Format (WebVTT)](/en-US/docs/Web/API/WebVTT_API)
- [WebAIM: Phụ đề, Bản ghi thoại, và Mô tả âm thanh](https://webaim.org/techniques/captions/)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 1.2](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.2_—_providing_text_alternatives_for_time-based_media)
- [Hiểu Tiêu chí Thành công 1.2.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-av-only-alt.html)
- [Hiểu Tiêu chí Thành công 1.2.2 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-captions.html)

## Ví dụ

### Nguồn đơn

Ví dụ này phát video khi được kích hoạt, cung cấp cho người dùng các điều khiển video mặc định của trình duyệt để điều khiển phát lại.

#### HTML

```html
<!-- Basic video example -->
<!-- 'Big Buck Bunny' licensed under CC 3.0 by the Blender foundation. Hosted by archive.org -->
<!-- Poster from peach.blender.org -->
<video
  controls
  src="https://archive.org/download/BigBuckBunny_124/Content/big_buck_bunny_720p_surround.mp4"
  poster="https://peach.blender.org/wp-content/uploads/title_anouncement.jpg?x11217"
  width="620">
  Sorry, your browser doesn't support embedded videos, but don't worry, you can
  <a href="https://archive.org/details/BigBuckBunny_124">download it</a>
  and watch it with your favorite video player!
</video>
```

#### Kết quả

{{EmbedLiveSample('Single source', '', '400')}}

Cho đến khi video bắt đầu phát, hình ảnh được cung cấp trong thuộc tính `poster` được hiển thị ở vị trí của nó. Nếu trình duyệt không hỗ trợ phát lại video, nó hiển thị văn bản dự phòng.

### Nhiều nguồn

Ví dụ này xây dựng dựa trên ví dụ trước, cung cấp ba nguồn khác nhau cho phương tiện; điều này cho phép video được xem bất kể codec video nào được trình duyệt hỗ trợ.

#### HTML

```html
<!-- Using multiple sources as fallbacks for a video tag -->
<!-- 'Elephants Dream' by Orange Open Movie Project Studio, licensed under CC-3.0, hosted by archive.org -->
<!-- Poster hosted by Wikimedia -->
<video
  width="620"
  controls
  poster="https://upload.wikimedia.org/wikipedia/commons/e/e8/Elephants_Dream_s5_both.jpg">
  <source
    src="https://archive.org/download/ElephantsDream/ed_hd.avi"
    type="video/avi" />
  <source
    src="https://archive.org/download/ElephantsDream/ed_1024_512kb.mp4"
    type="video/mp4" />

  Sorry, your browser doesn't support embedded videos, but don't worry, you can
  <a
    href="https://archive.org/download/ElephantsDream/ed_1024_512kb.mp4"
    download="ed_1024_512kb.mp4">
    download the MP4
  </a>
  and watch it with your favorite video player!
</video>
```

#### Kết quả

{{EmbedLiveSample('Multiple sources', '', '400')}}

Đầu tiên AVI được thử. Nếu không thể phát, [MP4](/en-US/docs/Web/Media/Guides/Formats/Containers#mpeg-4_mp4) được thử. Thông báo dự phòng được hiển thị nếu phần tử video không được hỗ trợ, nhưng không phải nếu tất cả các nguồn đều thất bại.

Một số loại tệp media cho phép bạn cung cấp thông tin cụ thể hơn bằng cách sử dụng tham số [`codecs`](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) như một phần của chuỗi loại tệp. Ví dụ, `video/webm; codecs="vp8, vorbis"` cho biết tệp là video [WebM](/en-US/docs/Web/Media/Guides/Formats/Containers#webm) sử dụng [VP8](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#vp8) cho video và [Vorbis](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs#vorbis) cho âm thanh.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>, nội dung cụm từ, nội dung nhúng. Nếu nó có thuộc tính <a href="#controls"><code>controls</code></a>: nội dung tương tác và nội dung có thể nhìn thấy.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <p>
          Nếu phần tử có thuộc tính <a href="#src"><code>src</code></a>:
          không hoặc nhiều phần tử {{HTMLElement("track")}}, theo sau là nội dung trong suốt không chứa phần tử media — tức là không có {{HTMLElement("audio")}} hay <code>&lt;video&gt;</code>.
        </p>
        <p>
          Còn lại: không hoặc nhiều phần tử {{HTMLElement("source")}}, theo sau là không hoặc nhiều phần tử {{HTMLElement("track")}}, theo sau là nội dung trong suốt không chứa phần tử media — tức là không có {{HTMLElement("audio")}} hay <code>&lt;video&gt;</code>.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào chấp nhận nội dung nhúng.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a></td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLVideoElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn về các loại và định dạng phương tiện trên web](/en-US/docs/Web/Media/Guides/Formats)
  - [Định dạng container media (loại tệp)](/en-US/docs/Web/Media/Guides/Formats/Containers)
  - [Hướng dẫn codec video web](/en-US/docs/Web/Media/Guides/Formats/Video_codecs)
  - [Hướng dẫn codec âm thanh web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs)

- Định vị và điều chỉnh kích thước hình ảnh trong khung: {{cssxref("object-position")}} và {{cssxref("object-fit")}}
- {{htmlelement("audio")}}
- [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
- [Thao tác video bằng canvas](/en-US/docs/Web/API/Canvas_API/Manipulating_video_using_canvas)
- [Cấu hình máy chủ cho media Ogg](/en-US/docs/Web/Media/Guides/Formats/Configuring_servers_for_Ogg_media)
