---
title: HTMLMediaElement
slug: Web/API/HTMLMediaElement
page-type: web-api-interface
browser-compat: api.HTMLMediaElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLMediaElement`** thêm vào {{domxref("HTMLElement")}} các thuộc tính và phương thức cần thiết để hỗ trợ các khả năng cơ bản liên quan đến phương tiện phổ biến đối với âm thanh và video.

Các phần tử {{domxref("HTMLVideoElement")}} và {{domxref("HTMLAudioElement")}} đều kế thừa giao diện này.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính từ tổ tiên của nó {{domxref("HTMLElement")}}, {{domxref("Element")}}, {{domxref("Node")}}, và {{domxref("EventTarget")}}._

- {{domxref("HTMLMediaElement.audioTracks")}} {{ReadOnlyInline}}
- : {{domxref("AudioTrackList")}} liệt kê các đối tượng {{domxref("AudioTrack")}} có trong phần tử.
- {{domxref("HTMLMediaElement.autoplay")}}
- : Giá trị boolean phản ánh thuộc tính HTML [`autoplay`](/en-US/docs/Web/HTML/Reference/Elements/video#autoplay), cho biết liệu quá trình phát lại có tự động bắt đầu ngay khi có đủ phương tiện để thực hiện việc đó mà không bị gián đoạn hay không.

      > [!NOTE]
  >

  > Tự động phát âm thanh khi người dùng không mong đợi hoặc mong muốn đó là trải nghiệm người dùng kém và nên tránh trong hầu hết các trường hợp, mặc dù vẫn có trường hợp ngoại lệ. Xem [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay) để biết thêm thông tin. Hãy nhớ rằng trình duyệt có thể bỏ qua các yêu cầu tự động phát, vì vậy bạn nên đảm bảo rằng mã của bạn không phụ thuộc vào hoạt động tự động phát.

- {{domxref("HTMLMediaElement.buffered")}} {{ReadOnlyInline}}
- : Trả về đối tượng {{domxref("TimeRanges")}} cho biết phạm vi của nguồn phương tiện mà trình duyệt đã lưu vào bộ đệm (nếu có) tại thời điểm thuộc tính `buffered` được truy cập.
- {{domxref("HTMLMediaElement.controls")}}
- : Một boolean phản ánh thuộc tính HTML [`controls`](/en-US/docs/Web/HTML/Reference/Elements/video#controls), cho biết liệu các mục giao diện người dùng để kiểm soát tài nguyên có được hiển thị hay không.
- {{domxref("HTMLMediaElement.controlsList")}}
- : Trả về {{domxref("DOMTokenList")}} giúp tác nhân người dùng chọn những điều khiển nào sẽ hiển thị trên thành phần phương tiện bất cứ khi nào tác nhân người dùng hiển thị bộ điều khiển của chính nó. `DOMTokenList` nhận một hoặc nhiều hơn trong số ba giá trị có thể có: `nodownload`, `nofullscreen` và `noremoteplayback`.
- {{domxref("HTMLMediaElement.crossOrigin")}}
- : Một chuỗi biểu thị [CORS setting](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) cho phần tử phương tiện này.
- {{domxref("HTMLMediaElement.currentSrc")}} {{ReadOnlyInline}}
- : Trả về một chuỗi có URL tuyệt đối của tài nguyên phương tiện đã chọn.
- {{domxref("HTMLMediaElement.currentTime")}}
- : Giá trị dấu phẩy động có độ chính xác kép cho biết thời gian phát lại hiện tại tính bằng giây; nếu phương tiện chưa bắt đầu phát và chưa được tìm kiếm thì giá trị này là thời gian phát lại ban đầu của phương tiện. Đặt giá trị này sẽ tìm kiếm phương tiện truyền thông theo thời gian mới. Thời gian được chỉ định tương ứng với dòng thời gian của phương tiện truyền thông.
- {{domxref("HTMLMediaElement.defaultMuted")}}
- : Một boolean phản ánh thuộc tính HTML [`muted`](/en-US/docs/Web/HTML/Reference/Elements/video#muted), cho biết liệu đầu ra âm thanh của thành phần đa phương tiện có nên bị tắt tiếng theo mặc định hay không.
- {{domxref("HTMLMediaElement.defaultPlaybackRate")}}
- : A `double` cho biết tốc độ phát lại mặc định cho phương tiện.
- {{domxref("HTMLMediaElement.disableRemotePlayback")}}
- : Boolean đặt hoặc trả về trạng thái phát lại từ xa, cho biết liệu phần tử phương tiện có được phép có giao diện người dùng phát lại từ xa hay không.
- {{domxref("HTMLMediaElement.duration")}} {{ReadOnlyInline}}
- : Giá trị dấu phẩy động có độ chính xác kép chỉ đọc cho biết tổng thời lượng của phương tiện tính bằng giây. Nếu không có sẵn dữ liệu đa phương tiện thì giá trị trả về là `NaN`. Nếu phương tiện có độ dài không xác định (chẳng hạn như phương tiện truyền trực tiếp, phương tiện của cuộc gọi WebRTC hoặc tương tự), thì giá trị là `Infinity`.
- {{domxref("HTMLMediaElement.ended")}} {{ReadOnlyInline}}
- : Trả về một boolean cho biết phần tử media đã phát xong hay chưa.
- {{domxref("HTMLMediaElement.error")}} {{ReadOnlyInline}}
- : Trả về đối tượng {{domxref("MediaError")}} cho lỗi gần đây nhất hoặc `null` nếu không có lỗi.
- {{domxref("HTMLMediaElement.loading")}}
- : Một chuỗi cho biết trình duyệt nên tải phương tiện ngay lập tức (`eager`) hay khi cần (`lazy`). Xem các thuộc tính HTML [`<video loading>`](/en-US/docs/Web/HTML/Reference/Elements/video#loading) và [`<audio loading>`](/en-US/docs/Web/HTML/Reference/Elements/audio#loading) để biết thêm thông tin.
- {{domxref("HTMLMediaElement.loop")}}
- : Một boolean phản ánh thuộc tính HTML [`loop`](/en-US/docs/Web/HTML/Reference/Elements/video#loop), cho biết liệu phần tử phương tiện có nên bắt đầu lại khi nó kết thúc hay không.
- {{domxref("HTMLMediaElement.mediaKeys")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
- : Trả về đối tượng {{domxref("MediaKeys")}}, đó là một tập hợp các khóa mà phần tử có thể sử dụng để giải mã dữ liệu đa phương tiện trong khi phát lại. Nếu không có khóa nào thì có thể là `null`.
- {{domxref("HTMLMediaElement.muted")}}
- : Một boolean xác định xem âm thanh có bị tắt tiếng hay không. `true` nếu âm thanh bị tắt tiếng và `false` nếu ngược lại.
- {{domxref("HTMLMediaElement.networkState")}} {{ReadOnlyInline}}
- : Trả về `unsigned short` (liệt kê) cho biết trạng thái hiện tại của việc tìm nạp phương tiện qua mạng.
- {{domxref("HTMLMediaElement.paused")}} {{ReadOnlyInline}}
- : Trả về một boolean cho biết phần tử media có bị tạm dừng hay không.
- {{domxref("HTMLMediaElement.playbackRate")}}
- : `double` cho biết tốc độ phát lại phương tiện.
- {{domxref("HTMLMediaElement.played")}} {{ReadOnlyInline}}
- : Trả về đối tượng {{domxref('TimeRanges')}} chứa phạm vi nguồn phương tiện mà trình duyệt đã phát, nếu có.
- {{domxref("HTMLMediaElement.preload")}}
- : Một chuỗi phản ánh thuộc tính HTML [`preload`](/en-US/docs/Web/HTML/Reference/Elements/video#preload), cho biết dữ liệu nào sẽ được tải trước, nếu có. Các giá trị có thể có là: `none`, `metadata`, `auto`.
- {{domxref("HTMLMediaElement.preservesPitch")}}
- : Giá trị boolean xác định xem cao độ của âm thanh có được giữ nguyên hay không. Nếu được đặt thành `false`, cao độ sẽ điều chỉnh theo tốc độ của âm thanh.
- {{domxref("HTMLMediaElement.readyState")}} {{ReadOnlyInline}}
- : Trả về `unsigned short` (liệt kê) cho biết trạng thái sẵn sàng của phương tiện.
- {{domxref("HTMLMediaElement.remote")}} {{ReadOnlyInline}}
- : Trả về một phiên bản đối tượng {{domxref("RemotePlayback")}} được liên kết với phần tử media.
- {{domxref("HTMLMediaElement.seekable")}} {{ReadOnlyInline}}
- : Trả về đối tượng {{domxref('TimeRanges')}} chứa khoảng thời gian mà người dùng có thể tìm kiếm, nếu có.
- {{domxref("HTMLMediaElement.seeking")}} {{ReadOnlyInline}}
- : Trả về một boolean cho biết liệu phương tiện có đang trong quá trình tìm kiếm vị trí mới hay không.
- {{domxref("HTMLMediaElement.sinkId")}} {{ReadOnlyInline}} {{SecureContext_Inline}}
- : Trả về một chuỗi là ID duy nhất của thiết bị âm thanh cung cấp đầu ra hoặc một chuỗi trống nếu thiết bị âm thanh mặc định của tác nhân người dùng đang được sử dụng.
- {{domxref("HTMLMediaElement.src")}}
- : Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src), chứa URL của tài nguyên phương tiện sẽ sử dụng.
- {{domxref("HTMLMediaElement.srcObject")}}
- : Một đối tượng đóng vai trò là nguồn của phương tiện được liên kết với `HTMLMediaElement` hoặc `null` nếu không được chỉ định.
- {{domxref("HTMLMediaElement.textTracks")}} {{ReadOnlyInline}}
- : Trả về đối tượng {{domxref('TextTrackList')}} chứa danh sách các đối tượng {{domxref("TextTrack")}} có trong phần tử.
- {{domxref("HTMLMediaElement.videoTracks")}} {{ReadOnlyInline}}
- : Trả về đối tượng {{domxref('VideoTrackList')}} chứa danh sách các đối tượng {{domxref("VideoTrack")}} có trong phần tử.
- {{domxref("HTMLMediaElement.volume")}}
- : A `double` cho biết âm lượng âm thanh, từ 0,0 (im lặng) đến 1,0 (to nhất).

## Thuộc tính lỗi thời

Các thuộc tính này đã lỗi thời và không nên sử dụng, ngay cả khi trình duyệt vẫn hỗ trợ chúng.

- {{domxref("HTMLMediaElement.controller")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
- : Đối tượng {{domxref("MediaController")}} đại diện cho bộ điều khiển phương tiện được gán cho phần tử hoặc `null` nếu không được chỉ định.
- {{domxref("HTMLMediaElement.mediaGroup")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
- : Một chuỗi phản ánh thuộc tính HTML `mediagroup`, cho biết tên của nhóm phần tử mà nó thuộc về. Một nhóm các thành phần truyền thông có chung {{domxref('MediaController')}}.
- `HTMLMediaElement.mozAudioCaptured` {{ReadOnlyInline}} {{Non-standard_Inline}} {{Deprecated_Inline}}
- : Trả về một boolean. Liên quan đến việc ghi lại luồng âm thanh.
- `HTMLMediaElement.mozFragmentEnd` {{Non-standard_Inline}} {{Deprecated_Inline}}
- : `double` cung cấp quyền truy cập vào thời gian kết thúc phân đoạn nếu phần tử phương tiện có URI phân đoạn cho `currentSrc`, nếu không thì nó bằng thời lượng phương tiện.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ tổ tiên của nó {{domxref("HTMLElement")}}, {{domxref("Element")}}, {{domxref("Node")}}, và {{domxref("EventTarget")}}._

- {{domxref("HTMLMediaElement.addTextTrack()")}}
- : Thêm đối tượng {{domxref("TextTrack")}} mới (chẳng hạn như bản nhạc dành cho phụ đề) vào thành phần phương tiện. Đây chỉ là giao diện lập trình và không ảnh hưởng đến DOM.
- {{domxref("HTMLMediaElement.captureStream()")}}
- : Trả về {{domxref("MediaStream")}}, ghi lại luồng nội dung đa phương tiện.
- {{domxref("HTMLMediaElement.canPlayType()")}}
- : Cho một chuỗi chỉ định loại phương tiện MIME (có thể bao gồm [`codecs` parameter](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter)), `canPlayType()` trả về chuỗi `probably` nếu phương tiện có thể phát được, `maybe` nếu không có đủ thông tin để xác định liệu phương tiện có phát hay không hoặc một chuỗi trống nếu phương tiện không thể phát.
- {{domxref("HTMLMediaElement.fastSeek()")}}
- : Tìm kiếm nhanh chóng thời gian nhất định với độ chính xác thấp.
- {{domxref("HTMLMediaElement.getStartDate()")}}
- : Trả về một đối tượng {{jsxref("Date")}} đại diện cho ngày và giờ trong thế giới thực tương ứng với thời điểm bắt đầu của phương tiện. Đối với luồng trực tiếp, đây là thời điểm bắt đầu phát sóng trên máy chủ, có thể là trước khi người dùng bắt đầu xem.
- {{domxref("HTMLMediaElement.load()")}}
- : Đặt lại phương tiện về đầu và chọn nguồn có sẵn tốt nhất từ ​​các nguồn được cung cấp bằng thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src) hoặc phần tử {{HTMLElement("source")}}.
- {{domxref("HTMLMediaElement.pause()")}}
- : Tạm dừng phát lại media.
- {{domxref("HTMLMediaElement.play()")}}
- : Bắt đầu phát lại media.
- {{domxref("HTMLMediaElement.seekToNextFrame()")}} {{Deprecated_Inline}} {{non-standard_inline}}
- : Tìm kiếm khung hình tiếp theo trong phương tiện. Phương pháp thử nghiệm, phi tiêu chuẩn này cho phép điều khiển việc đọc và hiển thị phương tiện theo cách thủ công ở tốc độ tùy chỉnh hoặc di chuyển qua từng khung hình phương tiện để thực hiện lọc hoặc các hoạt động khác.
- {{domxref("HTMLMediaElement.setMediaKeys()")}} {{SecureContext_Inline}}
- : Trả về {{jsxref("Promise")}}. Đặt các phím {{domxref("MediaKeys")}} để sử dụng khi giải mã phương tiện trong khi phát lại.
- {{domxref("HTMLMediaElement.setSinkId()")}} {{SecureContext_Inline}}
- : Đặt ID của thiết bị âm thanh sẽ sử dụng cho đầu ra và trả về {{jsxref("Promise")}}. Điều này chỉ hoạt động khi ứng dụng được phép sử dụng thiết bị được chỉ định.

## Phương thức lỗi thời

_Các phương pháp này đã lỗi thời và không nên sử dụng, ngay cả khi trình duyệt vẫn hỗ trợ chúng._

- {{domxref("HTMLMediaElement.captureStream", "HTMLMediaElement.mozCaptureStream()")}} {{Non-standard_Inline}}
- : Tương đương với tiền tố Firefox của {{domxref("HTMLMediaElement.captureStream()")}}. Xem [browser compatibility](/en-US/docs/Web/API/HTMLMediaElement/captureStream#browser_compatibility) của nó để biết chi tiết.
- `HTMLMediaElement.mozCaptureStreamUntilEnded()` {{Non-standard_Inline}} {{Deprecated_Inline}}
- : Một phương pháp không chuẩn, không được dùng nữa để thu hơi nước cho đến khi nó kết thúc.
- `HTMLMediaElement.mozGetMetadata()` {{Non-standard_Inline}} {{Deprecated_Inline}}
- : Trả về {{jsxref('Object')}}, chứa các thuộc tính đại diện cho siêu dữ liệu từ tài nguyên phương tiện đang phát dưới dạng cặp `{key: value}`. Một bản sao dữ liệu riêng biệt được trả về mỗi lần phương thức được gọi. Phương thức này phải được gọi sau khi sự kiện [`loadedmetadata`](/en-US/docs/Web/API/HTMLMediaElement/loadedmetadata_event) xảy ra.

## Sự kiện

_Kế thừa các sự kiện từ cha mẹ của nó, {{domxref("HTMLElement")}}_.

Nghe những sự kiện này bằng cách sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách chỉ định trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("HTMLMediaElement.abort_event", 'abort')}}
- : Được kích hoạt khi tài nguyên chưa được tải đầy đủ nhưng không phải do lỗi.
- {{domxref("HTMLMediaElement.canplay_event", 'canplay')}}
- : Được kích hoạt khi tác nhân người dùng có thể phát phương tiện nhưng ước tính rằng **không** đủ dữ liệu đã được tải để phát phương tiện đến hết mà không phải dừng để lưu thêm nội dung vào bộ đệm.
- {{domxref("HTMLMediaElement.canplaythrough_event", 'canplaythrough')}}
- : Được kích hoạt khi tác nhân người dùng có thể phát phương tiện và ước tính rằng đủ dữ liệu đã được tải để phát phương tiện cho đến hết mà không cần phải dừng để lưu thêm nội dung vào bộ đệm.
- {{domxref("HTMLMediaElement.durationchange_event", 'durationchange')}}
- : Được kích hoạt khi thuộc tính thời lượng đã được cập nhật.
- {{domxref("HTMLMediaElement.emptied_event", 'emptied')}}
- : Kích hoạt khi thẻ nhớ đã trống; ví dụ: khi phương tiện đã được tải (hoặc được tải một phần) và phương thức {{domxref("HTMLMediaElement.load()")}} được gọi để tải lại nó.
- {{domxref("HTMLMediaElement.encrypted_event", 'encrypted')}}
- : Được kích hoạt khi tìm thấy dữ liệu khởi tạo trong phương tiện cho biết phương tiện đã được mã hóa.
- {{domxref("HTMLMediaElement.ended_event", 'ended')}}
- : Được kích hoạt khi quá trình phát lại dừng khi kết thúc phương tiện (\<audio> hoặc \<video>) hoặc do không có thêm dữ liệu.
- {{domxref("HTMLMediaElement.error_event", 'error')}}
- : Được kích hoạt khi không thể tải tài nguyên do lỗi.
- {{domxref("HTMLMediaElement.loadeddata_event", 'loadeddata')}}
- : Được kích hoạt khi khung đầu tiên của phương tiện đã tải xong.
- {{domxref("HTMLMediaElement.loadedmetadata_event", 'loadedmetadata')}}
- : Được kích hoạt khi siêu dữ liệu đã được tải.
- {{domxref("HTMLMediaElement.loadstart_event", 'loadstart')}}
- : Được kích hoạt khi trình duyệt bắt đầu tải tài nguyên.
- {{domxref("HTMLMediaElement.pause_event", 'pause')}}
- : Được kích hoạt khi yêu cầu tạm dừng phát được xử lý và hoạt động đã chuyển sang trạng thái tạm dừng, thường xảy ra nhất khi phương thức {{domxref("HTMLMediaElement.pause()")}} của phương tiện được gọi.
- {{domxref("HTMLMediaElement.play_event", 'play')}}
- : Được kích hoạt khi thuộc tính `paused` được thay đổi từ `true` thành `false`, do phương thức {{domxref("HTMLMediaElement.play()")}} hoặc thuộc tính `autoplay`.
- {{domxref("HTMLMediaElement.playing_event", "playing")}}
- : Được kích hoạt khi quá trình phát lại sẵn sàng bắt đầu sau khi bị tạm dừng hoặc bị trì hoãn do thiếu dữ liệu.
- {{domxref("HTMLMediaElement.progress_event", "progress")}}
- : Được kích hoạt định kỳ khi trình duyệt tải tài nguyên.
- {{domxref("HTMLMediaElement.ratechange_event", 'ratechange')}}
- : Kích hoạt khi tốc độ phát lại đã thay đổi.
- {{domxref("HTMLMediaElement.seeked_event", 'seeked')}}
- : Được kích hoạt khi thao tác tìm kiếm hoàn tất.
- {{domxref("HTMLMediaElement.seeking_event", 'seeking')}}
- : Được kích hoạt khi hoạt động tìm kiếm bắt đầu.
- {{domxref("HTMLMediaElement.stalled_event", 'stalled')}}
- : Được kích hoạt khi tác nhân người dùng đang cố gắng tìm nạp dữ liệu phương tiện, nhưng dữ liệu không được gửi đến.
- {{domxref("HTMLMediaElement.suspend_event", 'suspend')}}
- : Được kích hoạt khi quá trình tải dữ liệu đa phương tiện bị tạm dừng.
- {{domxref("HTMLMediaElement.timeupdate_event", 'timeupdate')}}
- : Được kích hoạt khi thời gian được chỉ định bởi thuộc tính {{domxref("HTMLMediaElement.currentTime", "currentTime")}} đã được cập nhật.
- {{domxref("HTMLMediaElement.volumechange_event", 'volumechange')}}
- : Kích hoạt khi âm lượng đã thay đổi.
- {{domxref("HTMLMediaElement.waiting_event", 'waiting')}}
- : Được kích hoạt khi quá trình phát lại đã dừng do thiếu dữ liệu tạm thời.
- {{domxref("HTMLMediaElement.waitingforkey_event", 'waitingforkey')}}
- : Được kích hoạt khi quá trình phát lại bị chặn lần đầu trong khi chờ phím.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

### Tài liệu tham khảo

- Các phần tử HTML {{HTMLElement("video")}} và {{HTMLElement("audio")}}
- Giao diện {{domxref("HTMLVideoElement")}} và {{domxref("HTMLAudioElement")}}, bắt nguồn từ `HTMLMediaElement`

### Hướng dẫn

- [Web media technologies](/en-US/docs/Web/Media)
- Khu vực học tập: [HTML video and audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
- [Media type and format guide](/en-US/docs/Web/Media/Guides/Formats)
- [Handling media support issues in web content](/en-US/docs/Web/Media/Guides/Formats/Support_issues)
