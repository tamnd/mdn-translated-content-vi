---
title: "<audio>: Phần tử Nhúng Âm thanh"
slug: Web/HTML/Reference/Elements/audio
page-type: html-element
browser-compat: html.elements.audio
sidebar: htmlsidebar
---

Phần tử **`<audio>`** [HTML](/en-US/docs/Web/HTML) được sử dụng để nhúng nội dung âm thanh vào tài liệu. Nó có thể chứa một hoặc nhiều nguồn âm thanh, được đại diện bằng thuộc tính `src` hoặc phần tử {{HTMLElement("source")}}: trình duyệt sẽ chọn phần tử phù hợp nhất.
Nó cũng có thể là đích đến của phương tiện phát trực tiếp, sử dụng {{domxref("MediaStream")}}.

{{InteractiveExample("HTML Demo: &lt;audio&gt;", "tabbed-standard")}}

```html interactive-example
<figure>
  <figcaption>Listen to the T-Rex:</figcaption>
  <audio controls src="/shared-assets/audio/t-rex-roar.mp3"></audio>
  <a href="/shared-assets/audio/t-rex-roar.mp3"> Download audio </a>
</figure>
```

```css interactive-example
figure {
  margin: 0;
}
```

Ví dụ trên cho thấy cách sử dụng cơ bản của phần tử `<audio>`.
Tương tự như phần tử {{htmlelement("img")}}, chúng ta bao gồm đường dẫn đến phương tiện muốn nhúng bên trong thuộc tính `src`; chúng ta có thể bao gồm các thuộc tính khác để chỉ định thông tin như liệu chúng ta có muốn tự động phát và lặp lại không, có muốn hiển thị các điều khiển âm thanh mặc định của trình duyệt không, v.v.

Nội dung bên trong thẻ mở và đóng `<audio></audio>` được hiển thị như nội dung dự phòng trong các trình duyệt không hỗ trợ phần tử này.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `autoplay`
  - : Thuộc tính Boolean: nếu được chỉ định, âm thanh sẽ tự động bắt đầu phát ngay khi có thể, mà không cần đợi toàn bộ tệp âm thanh tải xong.

    > [!NOTE]
    > Các trang web tự động phát âm thanh (hoặc video có rãnh âm thanh) có thể là trải nghiệm khó chịu cho người dùng, vì vậy nên tránh khi có thể.
    > Nếu bạn phải cung cấp chức năng tự động phát, bạn nên đặt nó là tùy chọn (yêu cầu người dùng cụ thể bật nó).
    > Tuy nhiên, điều này có thể hữu ích khi tạo các phần tử media có nguồn được đặt vào thời điểm sau, theo điều khiển của người dùng.
    > Xem [hướng dẫn tự động phát](/en-US/docs/Web/Media/Guides/Autoplay) để biết thêm thông tin về cách sử dụng tự động phát đúng cách.

    > [!NOTE]
    > Âm thanh có thuộc tính [`loading="lazy"`](#loading) được đặt sẽ không bắt đầu tải và tự động phát cho đến khi phần tử ở gần hoặc trong vùng hiển thị.

- `controls`
  - : Nếu thuộc tính này có mặt, trình duyệt sẽ cung cấp các điều khiển để cho phép người dùng điều khiển phát lại âm thanh, bao gồm âm lượng, tìm kiếm, và tạm dừng/tiếp tục phát lại.

- `controlslist`
  - : Thuộc tính [`controlslist`](https://wicg.github.io/controls-list/explainer.html), khi được chỉ định, giúp trình duyệt chọn những điều khiển nào để hiển thị cho phần tử `audio` bất cứ khi nào trình duyệt hiển thị bộ điều khiển riêng của nó (nghĩa là khi thuộc tính `controls` được chỉ định).

    Các giá trị được phép là `nodownload`, `nofullscreen` và `noremoteplayback`.

- [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
  - : Thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) này chỉ định liệu có sử dụng CORS để tải tệp âm thanh liên quan hay không. [Tài nguyên hỗ trợ CORS](/en-US/docs/Web/HTML/How_to/CORS_enabled_image) có thể được tái sử dụng trong phần tử {{HTMLElement("canvas")}} mà không bị _nhiễm_. Các giá trị được phép là:
    - `anonymous`
      - : Gửi yêu cầu nguồn gốc chéo mà không có thông tin xác thực. Nói cách khác, nó gửi tiêu đề HTTP `Origin:` mà không có cookie, chứng chỉ X.509, hoặc thực hiện xác thực HTTP Basic. Nếu máy chủ không cung cấp thông tin xác thực cho trang web nguồn gốc (bằng cách không đặt tiêu đề HTTP `Access-Control-Allow-Origin:`), tài nguyên sẽ bị _nhiễm_ và việc sử dụng nó bị hạn chế.
    - `use-credentials`
      - : Gửi yêu cầu nguồn gốc chéo với thông tin xác thực. Nói cách khác, nó gửi tiêu đề HTTP `Origin:` với cookie, chứng chỉ, hoặc thực hiện xác thực HTTP Basic. Nếu máy chủ không cung cấp thông tin xác thực cho trang web nguồn gốc (qua tiêu đề HTTP `Access-Control-Allow-Credentials:`), tài nguyên sẽ bị _nhiễm_ và việc sử dụng nó bị hạn chế.

    Khi không có mặt, tài nguyên được tải mà không có yêu cầu CORS (tức là không gửi tiêu đề HTTP `Origin:`), ngăn việc sử dụng không bị nhiễm trong các phần tử {{HTMLElement('canvas')}}. Nếu không hợp lệ, nó được xử lý như thể từ khóa liệt kê **anonymous** được sử dụng. Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết thêm thông tin.

- `disableremoteplayback`
  - : Thuộc tính Boolean được dùng để vô hiệu hóa khả năng phát lại từ xa trên các thiết bị được kết nối qua công nghệ có dây (HDMI, DVI, v.v.) và không dây (Miracast, Chromecast, DLNA, AirPlay, v.v.). Xem [đặc tả Remote Playback API đề xuất](https://w3c.github.io/remote-playback/#the-disableremoteplayback-attribute) để biết thêm thông tin.

    Trong Safari, bạn có thể sử dụng [`x-webkit-airplay="deny"`](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/AirPlayGuide/OptingInorOutofAirPlay/OptingInorOutofAirPlay.html) như là phương án dự phòng.

- `loading`
  - : Chỉ định cách trình duyệt nên tải âm thanh:
    - `eager`
      - : Tải âm thanh ngay lập tức, bất kể âm thanh hiện có trong vùng hiển thị hay không (đây là giá trị mặc định).
    - `lazy`
      - : Trì hoãn tải âm thanh cho đến khi nó đạt đến một khoảng cách tính toán từ vùng hiển thị, như được xác định bởi trình duyệt.

        Tải chậm tránh được băng thông mạng và lưu trữ cần thiết để xử lý âm thanh cho đến khi chắc chắn hợp lý rằng nó sẽ cần thiết. Điều này cải thiện hiệu năng trong hầu hết các trường hợp sử dụng thông thường.

    Âm thanh tải chậm nằm trong vùng hiển thị trực quan có thể chưa được tải khi sự kiện {{domxref("Window.load_event", "load")}} của Window được kích hoạt. Điều này là vì sự kiện được kích hoạt dựa trên âm thanh tải liền — âm thanh tải chậm không được tính đến ngay cả khi chúng nằm trong vùng hiển thị trực quan khi trang được tải lần đầu.

    Tải chỉ bị trì hoãn khi JavaScript được bật. Đây là biện pháp chống theo dõi, vì nếu tác nhân người dùng hỗ trợ tải chậm khi script bị vô hiệu hóa, vẫn có thể cho một trang web theo dõi vị trí cuộn xấp xỉ của người dùng trong suốt một phiên, bằng cách đặt chiến lược các tệp âm thanh trong đánh dấu trang sao cho máy chủ có thể theo dõi có bao nhiêu tệp âm thanh được yêu cầu và khi nào.

    > [!NOTE]
    > Thuộc tính `loading="lazy"` cũng ảnh hưởng đến thuộc tính [`autoplay`](#autoplay) như được mô tả trong phần đó của trang này.

- `loop`
  - : Thuộc tính Boolean: nếu được chỉ định, trình phát âm thanh sẽ tự động quay về đầu khi đến cuối âm thanh.
- `muted`
  - : Thuộc tính Boolean chỉ định liệu âm thanh có bị tắt tiếng ban đầu không. Giá trị mặc định của nó là `false`.
- `preload`
  - : Thuộc tính {{Glossary("enumerated")}} này nhằm cung cấp gợi ý cho trình duyệt về những gì tác giả nghĩ sẽ dẫn đến trải nghiệm người dùng tốt nhất. Nó có thể có một trong các giá trị sau:
    - `none`: Chỉ định rằng âm thanh không nên được tải trước.
    - `metadata`: Chỉ định rằng chỉ siêu dữ liệu âm thanh (ví dụ: độ dài) được tải.
    - `auto`: Chỉ định rằng toàn bộ tệp âm thanh có thể được tải xuống, ngay cả khi người dùng không được kỳ vọng sẽ sử dụng nó.
    - _chuỗi rỗng_: Từ đồng nghĩa với giá trị `auto`.

    Giá trị mặc định khác nhau cho từng trình duyệt. Thông số kỹ thuật khuyến nghị đặt thành `metadata`.

    > [!NOTE]
    >
    > - Thuộc tính `autoplay` có ưu tiên hơn `preload`. Nếu `autoplay` được chỉ định, trình duyệt rõ ràng cần bắt đầu tải âm thanh để phát.
    > - Trình duyệt không bị buộc bởi thông số kỹ thuật phải theo giá trị của thuộc tính này; đây chỉ là gợi ý.

- `src`
  - : URL của âm thanh cần nhúng. Điều này tuân theo [kiểm soát truy cập HTTP](/en-US/docs/Web/HTTP/Guides/CORS). Đây là tùy chọn; bạn có thể thay vào đó sử dụng phần tử {{htmlelement("source")}} bên trong khối âm thanh để chỉ định âm thanh cần nhúng.

## Sự kiện

- {{domxref("ScriptProcessorNode/audioprocess_event", "audioprocess")}} {{Deprecated_Inline}}
  - : Bộ đệm đầu vào của {{DOMxRef("ScriptProcessorNode")}} sẵn sàng để xử lý.
- {{domxref("HTMLMediaElement.canplay_event", 'canplay')}}
  - : Trình duyệt có thể phát phương tiện, nhưng ước tính rằng chưa đủ dữ liệu đã được tải để phát phương tiện đến cuối mà không phải dừng để đệm thêm nội dung.
- {{domxref("HTMLMediaElement.canplaythrough_event", 'canplaythrough')}}
  - : Trình duyệt ước tính nó có thể phát phương tiện đến cuối mà không dừng để đệm nội dung.
- {{domxref("OfflineAudioContext/complete_event", "complete")}}
  - : Việc kết xuất của {{DOMxRef("OfflineAudioContext")}} đã kết thúc.
- {{domxref("HTMLMediaElement.durationchange_event", 'durationchange')}}
  - : Thuộc tính `duration` đã được cập nhật.
- {{domxref("HTMLMediaElement.emptied_event", 'emptied')}}
  - : Phương tiện đã trở nên rỗng; ví dụ, sự kiện này được gửi nếu phương tiện đã được tải (hoặc tải một phần), và phương thức {{domxref("HTMLMediaElement.load")}} được gọi để tải lại nó.
- {{domxref("HTMLMediaElement.ended_event", 'ended')}}
  - : Phát lại đã dừng vì đã đến cuối phương tiện.
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

Các trình duyệt không phải tất cả đều hỗ trợ cùng các [loại tệp](/en-US/docs/Web/Media/Guides/Formats/Containers) và [codec âm thanh](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs); bạn có thể cung cấp nhiều nguồn bên trong các phần tử {{htmlelement("source")}} lồng nhau, và trình duyệt sẽ sử dụng cái đầu tiên mà nó hiểu:

```html
<audio controls>
  <source src="myAudio.mp3" type="audio/mpeg" />
  <source src="myAudio.ogg" type="audio/ogg" />
  <p>
    Download <a href="myAudio.mp3" download="myAudio.mp3">MP3</a> or
    <a href="myAudio.ogg" download="myAudio.ogg">OGG</a> audio.
  </p>
</audio>
```

Nguồn âm thanh có thể được đặt thành bất kỳ [URL](/en-US/docs/Web/URI) hợp lệ nào, bao gồm URL HTTP(S) và [Data URLs](/en-US/docs/Web/URI/Reference/Schemes/data). Khi sử dụng URL HTTP(S), hãy lưu ý rằng hành vi bộ nhớ đệm của trình duyệt sẽ ảnh hưởng đến tần suất tệp được yêu cầu từ máy chủ. Data URLs nhúng dữ liệu âm thanh trực tiếp trong HTML, có thể hữu ích cho các tệp âm thanh nhỏ nhưng không được khuyến nghị cho các tệp lớn hơn vì nó tăng kích thước tệp HTML.

Khi sử dụng các phần tử {{htmlelement("source")}}, trình duyệt cố tải từng nguồn tuần tự. Nếu một nguồn thất bại (ví dụ: do URL không hợp lệ hoặc định dạng không được hỗ trợ), nguồn tiếp theo được thử, và tiếp tục như vậy. Sự kiện `error` được kích hoạt trên phần tử `<audio>` sau khi tất cả các nguồn đã thất bại; sự kiện `error` không được kích hoạt trên từng phần tử `<source>` riêng lẻ.

Bạn cũng có thể sử dụng [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) để trực tiếp tạo và thao tác luồng âm thanh từ mã JavaScript thay vì phát trực tuyến các tệp âm thanh có sẵn. Bạn có thể đặt [`srcObject`](/en-US/docs/Web/API/HTMLMediaElement/srcObject) trong JavaScript thành đối tượng {{domxref("MediaStream")}}. Điều này thường được sử dụng cho các luồng âm thanh trực tiếp hoặc xử lý âm thanh theo thời gian thực.

```js
const audioElement = document.querySelector("audio");
navigator.mediaDevices
  .getUserMedia({ audio: true })
  .then((stream) => {
    audioElement.srcObject = stream;
  })
  .catch((error) => {
    console.error("Error accessing the microphone", error);
  });
```

Lưu ý rằng nguồn `MediaStream` có các hạn chế: chúng không thể tìm kiếm và chỉ hỗ trợ một bộ codec giới hạn.

Chúng tôi cung cấp một [hướng dẫn toàn diện về các loại tệp phương tiện](/en-US/docs/Web/Media/Guides/Formats) và [các codec âm thanh có thể được sử dụng trong chúng](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs). Cũng có sẵn [hướng dẫn về các codec được hỗ trợ cho video](/en-US/docs/Web/Media/Guides/Formats/Video_codecs).

Các ghi chú sử dụng khác:

- Nếu bạn không chỉ định thuộc tính `controls`, trình phát âm thanh sẽ không bao gồm các điều khiển mặc định của trình duyệt. Tuy nhiên, bạn có thể tạo các điều khiển tùy chỉnh của riêng mình bằng JavaScript và API {{domxref("HTMLMediaElement")}}.
- Để kiểm soát chính xác nội dung âm thanh của bạn, các `HTMLMediaElement` kích hoạt nhiều [sự kiện](/en-US/docs/Web/API/HTMLMediaElement#events) khác nhau. Điều này cũng cung cấp cách theo dõi quá trình tải âm thanh để bạn có thể theo dõi lỗi hoặc phát hiện khi đủ dữ liệu sẵn sàng để bắt đầu phát hoặc thao tác nó.
- Các phần tử `<audio>` không thể có phụ đề hoặc chú thích liên kết với chúng theo cách mà các phần tử `<video>` có thể. Xem [WebVTT và Âm thanh](https://www.iandevlin.com/blog/2015/12/html5/webvtt-and-audio/) của Ian Devlin để biết một số thông tin và giải pháp hữu ích.
- Để kiểm tra nội dung dự phòng trên các trình duyệt hỗ trợ phần tử, bạn có thể thay thế `<audio>` bằng một phần tử không tồn tại như `<notanaudio>`.

Nguồn thông tin chung tốt về việc sử dụng `<audio>` HTML là hướng dẫn cho người mới bắt đầu [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio).

### Tạo kiểu với CSS

Phần tử `<audio>` không có đầu ra trực quan nội tại của riêng nó trừ khi thuộc tính `controls` được chỉ định, trong trường hợp đó các điều khiển mặc định của trình duyệt được hiển thị.

Các điều khiển mặc định có giá trị {{cssxref("display")}} là `inline` theo mặc định, và thường là ý tưởng tốt để đặt giá trị thành `block` để cải thiện việc kiểm soát vị trí và bố cục, trừ khi bạn muốn nó nằm trong một khối văn bản hoặc tương tự.

Bạn có thể tạo kiểu cho các điều khiển mặc định với các thuộc tính ảnh hưởng đến khối như một đơn vị duy nhất, vì vậy ví dụ bạn có thể đặt {{cssxref("border")}} và {{cssxref("border-radius")}}, {{cssxref("padding")}}, {{cssxref("margin")}}, v.v. Tuy nhiên bạn không thể tạo kiểu cho các thành phần riêng lẻ bên trong trình phát âm thanh (ví dụ: thay đổi kích thước nút hoặc biểu tượng, thay đổi font), và các điều khiển khác nhau giữa các trình duyệt.

Để có giao diện nhất quán giữa các trình duyệt, bạn cần tạo các điều khiển tùy chỉnh; chúng có thể được đánh dấu và tạo kiểu theo bất kỳ cách nào bạn muốn, và sau đó JavaScript có thể được sử dụng cùng với API {{domxref("HTMLMediaElement")}} để kết nối chức năng của chúng.

[Các kỹ thuật tạo kiểu cơ bản cho trình phát video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Video_player_styling_basics) cung cấp một số kỹ thuật tạo kiểu hữu ích — nó được viết trong ngữ cảnh `<video>`, nhưng phần lớn đều áp dụng tương đương với `<audio>`.

### Phát hiện thêm và xóa rãnh

Bạn có thể phát hiện khi các rãnh được thêm vào và xóa khỏi phần tử `<audio>` bằng cách sử dụng các sự kiện {{domxref("AudioTrackList/addtrack_event", "addtrack")}} và {{domxref("AudioTrackList/removetrack_event", "removetrack")}}. Tuy nhiên, các sự kiện này không được gửi trực tiếp đến phần tử `<audio>` chính nó. Thay vào đó, chúng được gửi đến đối tượng danh sách rãnh bên trong {{domxref("HTMLMediaElement")}} của phần tử `<audio>` tương ứng với loại rãnh đã được thêm vào phần tử:

- {{domxref("HTMLMediaElement.audioTracks")}}
  - : {{domxref("AudioTrackList")}} chứa tất cả các rãnh âm thanh của phần tử media. Bạn có thể thêm một trình lắng nghe cho `addtrack` vào đối tượng này để được thông báo khi các rãnh âm thanh mới được thêm vào phần tử.
- {{domxref("HTMLMediaElement.videoTracks")}}
  - : Thêm trình lắng nghe `addtrack` vào đối tượng {{domxref("VideoTrackList")}} này để được thông báo khi các rãnh video được thêm vào phần tử.
- {{domxref("HTMLMediaElement.textTracks")}}
  - : Thêm trình lắng nghe sự kiện `addtrack` vào {{domxref("TextTrackList")}} này để được thông báo khi các rãnh văn bản mới được thêm vào phần tử.

> [!NOTE]
> Mặc dù nó là phần tử `<audio>`, nó vẫn có danh sách rãnh video và văn bản, và thực sự có thể được sử dụng để trình bày video, mặc dù ý nghĩa giao diện người dùng có thể kỳ lạ.

Ví dụ, để phát hiện khi các rãnh âm thanh được thêm vào hoặc xóa khỏi phần tử `<audio>`, bạn có thể sử dụng mã như sau:

```js
const elem = document.querySelector("audio");

elem.audioTrackList.onaddtrack = (event) => {
  trackEditor.addTrack(event.track);
};

elem.audioTrackList.onremovetrack = (event) => {
  trackEditor.removeTrack(event.track);
};
```

Mã này theo dõi các rãnh âm thanh được thêm vào và xóa khỏi phần tử, và gọi một hàm giả định trên trình chỉnh sửa rãnh để đăng ký và xóa rãnh khỏi danh sách các rãnh có sẵn của trình chỉnh sửa.

Bạn cũng có thể sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để lắng nghe các sự kiện {{domxref("AudioTrackList/addtrack_event", "addtrack")}} và {{domxref("AudioTrackList/removetrack_event", "removetrack")}}.

## Khả năng tiếp cận

Âm thanh có hội thoại nói phải cung cấp cả phụ đề và bản ghi thoại mô tả chính xác nội dung của nó. Phụ đề, được chỉ định bằng [WebVTT](/en-US/docs/Web/API/WebVTT_API), cho phép những người bị suy giảm thính lực hiểu nội dung của bản ghi âm khi bản ghi âm đang được phát, trong khi bản ghi thoại cho phép những người cần thêm thời gian để có thể xem lại nội dung bản ghi âm theo tốc độ và định dạng phù hợp với họ.

Nếu các dịch vụ tạo phụ đề tự động được sử dụng, điều quan trọng là xem xét nội dung được tạo để đảm bảo nó đại diện chính xác âm thanh nguồn.

Phần tử `<audio>` không hỗ trợ trực tiếp WebVTT. Bạn sẽ phải tìm thư viện hoặc framework cung cấp khả năng này cho bạn, hoặc viết mã để tự hiển thị phụ đề. Một tùy chọn là phát âm thanh của bạn bằng phần tử {{HTMLElement("video")}}, hỗ trợ WebVTT.

Ngoài hội thoại nói, phụ đề và bản ghi thoại cũng phải xác định âm nhạc và hiệu ứng âm thanh truyền đạt thông tin quan trọng. Điều này bao gồm cảm xúc và giai điệu. Ví dụ, trong WebVTT bên dưới, hãy chú ý việc sử dụng dấu ngoặc vuông để cung cấp thông tin về giai điệu và cảm xúc cho người xem; điều này có thể giúp thiết lập tâm trạng mà nếu không thì được cung cấp bằng âm nhạc, âm thanh phi ngôn ngữ và hiệu ứng âm thanh quan trọng, v.v.

<!-- cSpell:ignore switchwatch Swisswatch -->

```plain
1
00:00:00 --> 00:00:45
[Energetic techno music]

2
00:00:46 --> 00:00:51
Welcome to the Time Keeper's podcast! In this episode we're discussing which Swisswatch is a wrist switchwatch?

16
00:00:52 --> 00:01:02
[Laughing] Sorry! I mean, which wristwatch is a Swiss wristwatch?
```

Ngoài ra, đây là thực hành tốt để cung cấp một số nội dung (chẳng hạn như liên kết tải xuống trực tiếp) như là nội dung dự phòng cho những người xem sử dụng trình duyệt không hỗ trợ phần tử `<audio>`:

```html
<audio controls>
  <source src="myAudio.mp3" type="audio/mpeg" />
  <source src="myAudio.ogg" type="audio/ogg" />
  <p>
    Download <a href="myAudio.mp3">MP3</a> or
    <a href="myAudio.ogg" download="myAudio.ogg">OGG</a> audio.
  </p>
</audio>
```

- [Web Video Text Tracks Format (WebVTT)](/en-US/docs/Web/API/WebVTT_API)
- [WebAIM: Phụ đề, Bản ghi thoại, và Mô tả âm thanh](https://webaim.org/techniques/captions/)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 1.2](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.2_—_providing_text_alternatives_for_time-based_media)
- [Hiểu Tiêu chí Thành công 1.2.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-av-only-alt.html)
- [Hiểu Tiêu chí Thành công 1.2.2 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/media-equiv-captions.html)

## Ví dụ

### Sử dụng cơ bản

Ví dụ sau đây cho thấy cách sử dụng cơ bản của phần tử `<audio>` để phát tệp OGG. Nó sẽ tự động phát do thuộc tính `autoplay` — nếu trang có quyền làm vậy — và cũng bao gồm nội dung dự phòng.

```html
<!-- Basic audio playback -->
<audio src="AudioTest.ogg" autoplay>
  <a href="AudioTest.ogg" download="AudioTest.ogg">Download OGG audio</a>.
</audio>
```

Để biết chi tiết về khi nào autoplay hoạt động, cách lấy quyền sử dụng autoplay, và cách và khi nào phù hợp để sử dụng autoplay, xem [hướng dẫn autoplay](/en-US/docs/Web/Media/Guides/Autoplay) của chúng tôi.

### Phần tử \<audio> với phần tử \<source>

Ví dụ này chỉ định rãnh âm thanh nào cần nhúng bằng cách sử dụng thuộc tính `src` trên phần tử `<source>` lồng nhau thay vì trực tiếp trên phần tử `<audio>`. Luôn hữu ích khi bao gồm loại MIME của tệp bên trong thuộc tính `type`, vì trình duyệt có thể ngay lập tức xác định xem nó có thể phát tệp đó không, và không lãng phí thời gian vào nó nếu không thể.

```html
<audio controls>
  <source src="foo.wav" type="audio/wav" />
  <a href="foo.wav" download="foo.wav">Download WAV audio</a>.
</audio>
```

### \<audio> với nhiều phần tử \<source>

Ví dụ này bao gồm nhiều phần tử `<source>`. Trình duyệt cố tải phần tử nguồn đầu tiên (Opus) nếu có thể phát; nếu không thì chuyển sang phần tử thứ hai (Vorbis) và cuối cùng là MP3:

```html
<audio controls>
  <source src="foo.opus" type="audio/ogg; codecs=opus" />
  <source src="foo.ogg" type="audio/ogg; codecs=vorbis" />
  <source src="foo.mp3" type="audio/mpeg" />
</audio>
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >, nội dung cụm từ, nội dung nhúng. Nếu nó có thuộc tính
        <a href="#controls"><code>controls</code></a>: nội dung tương tác và nội dung có thể nhìn thấy.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Nếu phần tử có thuộc tính <a href="#src"><code>src</code></a>:
        không hoặc nhiều phần tử {{HTMLElement("track")}}
        theo sau là nội dung trong suốt không chứa phần tử media
        <code>&lt;audio&gt;</code> hoặc {{HTMLElement("video")}}.<br />Còn lại: không hoặc nhiều phần tử {{HTMLElement("source")}}
        theo sau là không hoặc nhiều phần tử {{HTMLElement("track")}}
        theo sau là nội dung trong suốt không chứa phần tử media
        <code>&lt;audio&gt;</code> hoặc {{HTMLElement("video")}}.
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
      <td>{{domxref("HTMLAudioElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Công nghệ media web](/en-US/docs/Web/Media)
  - [Định dạng container media (loại tệp)](/en-US/docs/Web/Media/Guides/Formats/Containers)
  - [Hướng dẫn về các codec âm thanh được sử dụng trên web](/en-US/docs/Web/Media/Guides/Formats/Audio_codecs)

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- {{domxref("HTMLAudioElement")}}
- {{htmlelement("source")}}
- {{htmlelement("video")}}
- [Khu vực học tập: Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
- [Kiến thức cơ bản về âm thanh đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Cross-browser_audio_basics)
