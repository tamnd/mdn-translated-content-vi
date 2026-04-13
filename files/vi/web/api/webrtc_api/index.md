---
title: WebRTC API
slug: Web/API/WebRTC_API
page-type: web-api-overview
spec-urls:
  - https://w3c.github.io/webrtc-pc/
  - https://w3c.github.io/mediacapture-main/
  - https://w3c.github.io/mediacapture-fromelement/
---

{{DefaultAPISidebar("WebRTC")}}

**WebRTC** (Giao tiếp thời gian thực trên web) là công nghệ cho phép các ứng dụng và trang web thu thập và tùy ý truyền phát âm thanh và/hoặc video, cũng như trao đổi dữ liệu tùy ý giữa các trình duyệt mà không cần qua trung gian. Bộ tiêu chuẩn bao gồm WebRTC giúp có thể chia sẻ dữ liệu và thực hiện hội nghị truyền hình ngang hàng mà không yêu cầu người dùng cài đặt phần bổ trợ hoặc bất kỳ phần mềm nào khác của bên thứ ba.

WebRTC bao gồm một số API và giao thức có liên quan với nhau, hoạt động cùng nhau để đạt được điều này. Tài liệu bạn tìm thấy ở đây sẽ giúp bạn hiểu các nguyên tắc cơ bản của WebRTC, cách thiết lập và sử dụng cả kết nối dữ liệu và phương tiện, v.v.

## Khái niệm và cách sử dụng WebRTC

WebRTC phục vụ nhiều mục đích; cùng với [API thu thập và truyền phát phương tiện](/en-US/docs/Web/API/Media_Capture_and_Streams_API), chúng cung cấp các khả năng đa phương tiện mạnh mẽ cho Web, bao gồm hỗ trợ hội nghị âm thanh và video, trao đổi tập tin, chia sẻ màn hình, quản lý danh tính và giao tiếp với các hệ thống điện thoại cũ bao gồm hỗ trợ gửi tín hiệu {{Glossary("DTMF")}} (quay số bằng âm chạm). Kết nối giữa các thiết bị ngang hàng có thể được thực hiện mà không yêu cầu bất kỳ trình điều khiển hoặc trình cắm đặc biệt nào và thường có thể được thực hiện mà không cần bất kỳ máy chủ trung gian nào.

Kết nối giữa hai thiết bị ngang hàng được thể hiện bằng giao diện {{DOMxRef("RTCPeerConnection")}}. Khi kết nối đã được thiết lập và mở bằng `RTCPeerConnection`, các luồng phương tiện ({{DOMxRef("MediaStream")}}s) và/hoặc kênh dữ liệu ({{DOMxRef("RTCDataChannel")}}s) có thể được thêm vào kết nối.

Các luồng phương tiện có thể bao gồm bất kỳ số lượng thông tin phương tiện nào; các bản nhạc, được thể hiện bằng các đối tượng dựa trên giao diện {{DOMxRef("MediaStreamTrack")}}, có thể chứa một trong số loại dữ liệu phương tiện, bao gồm âm thanh, video và văn bản (chẳng hạn như phụ đề hoặc thậm chí cả tên chương). Hầu hết các luồng bao gồm ít nhất một bản âm thanh và có thể cả một đoạn video, đồng thời có thể được sử dụng để gửi và nhận cả phương tiện trực tiếp hoặc thông tin phương tiện được lưu trữ (chẳng hạn như phim được phát trực tuyến).

Bạn cũng có thể sử dụng kết nối giữa hai thiết bị ngang hàng để trao đổi dữ liệu nhị phân tùy ý bằng giao diện {{DOMxRef("RTCDataChannel")}}. Điều này có thể được sử dụng cho thông tin kênh sau, trao đổi siêu dữ liệu, gói trạng thái trò chơi, truyền tệp hoặc thậm chí làm kênh chính để truyền dữ liệu.

### Khả năng tương tác

WebRTC nói chung được hỗ trợ tốt trong các trình duyệt hiện đại, nhưng vẫn còn một số điểm không tương thích. Thư viện [adapter.js](https://github.com/webrtcHacks/adapter) là một biện pháp nhằm cách ly các ứng dụng khỏi những điểm không tương thích này.

## Tham chiếu WebRTC

Vì WebRTC cung cấp các giao diện phối hợp với nhau để thực hiện nhiều tác vụ khác nhau nên chúng tôi đã chia tài liệu tham khảo theo danh mục. Vui lòng xem thanh bên để biết danh sách theo thứ tự bảng chữ cái.

### Thiết lập và quản lý kết nối

Các giao diện, từ điển và loại này được sử dụng để thiết lập, mở và quản lý các kết nối WebRTC. Bao gồm các giao diện đại diện cho các kết nối phương tiện ngang hàng, kênh dữ liệu và giao diện được sử dụng khi trao đổi thông tin về khả năng của từng thiết bị ngang hàng để chọn cấu hình tốt nhất có thể cho kết nối phương tiện hai chiều.

#### Giao diện- {{DOMxRef("RTCPeerConnection")}} - : Thể hiện kết nối WebRTC giữa máy tính cục bộ và máy ngang hàng từ xa. Nó được sử dụng để xử lý việc truyền dữ liệu hiệu quả giữa hai thiết bị ngang hàng

- {{DOMxRef("RTCDataChannel")}}
  - : Thể hiện kênh dữ liệu hai chiều giữa hai thiết bị ngang hàng của một kết nối.
- {{DOMxRef("RTCDataChannelEvent")}}
  - : Biểu thị các sự kiện xảy ra khi gắn {{DOMxRef("RTCDataChannel")}} vào {{DOMxRef("RTCPeerConnection")}}. Sự kiện duy nhất được gửi bằng giao diện này là {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}}.
- {{DOMxRef("RTCSessionDescription")}}
  - : Đại diện cho các tham số của một phiên. Mỗi `RTCSessionDescription` bao gồm một mô tả {{DOMxRef("RTCSessionDescription.type", "type")}} cho biết phần nào của quy trình thương lượng đề nghị/câu trả lời mà nó mô tả và của bộ mô tả {{Glossary("SDP")}} của phiên.
- {{DOMxRef("RTCStatsReport")}}
  - : Cung cấp thông tin thống kê chi tiết cho một kết nối hoặc cho một tuyến đường riêng lẻ trên kết nối; bạn có thể lấy báo cáo bằng cách gọi {{DOMxRef("RTCPeerConnection.getStats()")}}.
- {{DOMxRef("RTCIceCandidate")}}
  - : Đại diện cho máy chủ Thiết lập kết nối tương tác ({{Glossary("ICE")}}) ứng viên để thiết lập {{DOMxRef("RTCPeerConnection")}}.
- {{DOMxRef("RTCIceTransport")}}
  - : Thể hiện thông tin về một phương tiện vận chuyển {{Glossary("ICE")}}.
- {{DOMxRef("RTCPeerConnectionIceEvent")}}
  - : Biểu thị các sự kiện xảy ra liên quan đến các ứng cử viên ICE với mục tiêu, thường là {{DOMxRef("RTCPeerConnection")}}. Chỉ có một sự kiện thuộc loại này: {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}.
- {{DOMxRef("RTCRtpSender")}}
  - : Quản lý việc mã hóa và truyền dữ liệu cho {{DOMxRef("MediaStreamTrack")}} trên {{DOMxRef("RTCPeerConnection")}}.
- {{DOMxRef("RTCRtpReceiver")}}
  - : Quản lý việc tiếp nhận và giải mã dữ liệu cho {{DOMxRef("MediaStreamTrack")}} trên {{DOMxRef("RTCPeerConnection")}}.
- {{DOMxRef("RTCTrackEvent")}}
  - : Giao diện được sử dụng để thể hiện sự kiện {{domxref("RTCPeerConnection.track_event", "track")}}, cho biết rằng một đối tượng {{DOMxRef("RTCRtpReceiver")}} đã được thêm vào đối tượng {{DOMxRef("RTCPeerConnection")}}, cho biết rằng một {{DOMxRef("MediaStreamTrack")}} mới đến đã được tạo và thêm vào `RTCPeerConnection`.
- {{DOMxRef("RTCSctpTransport")}}
  - : Cung cấp thông tin mô tả quá trình truyền tải Giao thức truyền điều khiển luồng (**{{Glossary("SCTP")}}**) và cũng cung cấp cách truy cập vào quá trình truyền tải Bảo mật lớp truyền tải gói dữ liệu cơ bản (**{{Glossary("DTLS")}}**) qua đó các gói SCTP cho tất cả các kênh dữ liệu của [`RTCPeerConnection`](/en-US/docs/Web/API/RTCPeerConnection) được gửi và nhận.

#### Sự kiện- {{domxref("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}} - : Lượng dữ liệu hiện được kênh dữ liệu lưu vào bộ đệm—như được biểu thị bằng thuộc tính {{domxref("RTCDataChannel.bufferedAmount", "bufferedAmount")}} của nó—đã giảm xuống bằng hoặc thấp hơn kích thước dữ liệu được lưu vào bộ đệm tối thiểu của kênh, như được chỉ định bởi {{domxref("RTCDataChannel.bufferedAmountLowThreshold", "bufferedAmountLowThreshold")}}

- {{domxref("RTCDataChannel.close_event", "close")}}
  - : Kênh dữ liệu đã hoàn tất quá trình đóng và hiện ở trạng thái `closed`. Việc vận chuyển dữ liệu cơ bản của nó đã hoàn toàn bị đóng vào thời điểm này. Thay vào đó, bạn có thể được thông báo \_trước khi quá trình đóng hoàn tất bằng cách theo dõi sự kiện `closing`.
- {{domxref("RTCDataChannel.closing_event", "closing")}}
  - : `RTCDataChannel` đã chuyển sang trạng thái `closing`, cho biết rằng nó sẽ sớm bị đóng. Bạn có thể phát hiện việc hoàn tất quá trình đóng bằng cách theo dõi sự kiện `close`.
- {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}}
  - : Trạng thái của kết nối có thể được truy cập trong {{domxref("RTCPeerConnection.connectionState", "connectionState")}} đã thay đổi.
- {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}}
  - : Một {{domxref("RTCDataChannel")}} mới khả dụng sau khi thiết bị ngang hàng từ xa mở kênh dữ liệu mới. Loại sự kiện này là {{domxref("RTCDataChannelEvent")}}.
- {{domxref("RTCDataChannel.error_event", "error")}}
  - : Một {{domxref("RTCErrorEvent")}} chỉ ra rằng đã xảy ra lỗi trên kênh dữ liệu.
- {{domxref("RTCDtlsTransport.error_event", "error")}}
  - : Một {{domxref("RTCErrorEvent")}} chỉ ra rằng đã xảy ra lỗi trên {{domxref("RTCDtlsTransport")}}. Lỗi này sẽ là `dtls-failure` hoặc `fingerprint-failure`.
- {{domxref("RTCIceTransport.gatheringstatechange_event", "gatheringstatechange")}}
  - : Trạng thái thu thập của {{domxref("RTCIceTransport")}} đã thay đổi.
- {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}
  - : Một {{domxref("RTCPeerConnectionIceEvent")}} được gửi bất cứ khi nào thiết bị cục bộ xác định được một ứng cử viên ICE mới cần được thêm vào thiết bị ngang hàng cục bộ bằng cách gọi {{domxref("RTCPeerConnection.setLocalDescription", "setLocalDescription()")}}.
- {{domxref("RTCPeerConnection.icecandidateerror_event", "icecandidateerror")}}
  - : Một {{domxref("RTCPeerConnectionIceErrorEvent")}} chỉ ra rằng đã xảy ra lỗi khi thu thập các ứng cử viên ICE.
- {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}
  - : Được gửi tới {{domxref("RTCPeerConnection")}} khi trạng thái kết nối ICE của nó—được tìm thấy trong thuộc tính {{domxref("RTCPeerConnection.iceConnectionState", "iceConnectionState")}}—thay đổi.
- {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}
  - : Được gửi tới {{domxref("RTCPeerConnection")}} khi trạng thái thu thập ICE của nó—được tìm thấy trong thuộc tính {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}}—thay đổi.
- {{domxref("RTCDataChannel.message_event", "message")}}
  - : Đã nhận được tin nhắn trên kênh dữ liệu. Sự kiện thuộc loại {{domxref("MessageEvent")}}.
- {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}
  - : Thông báo cho `RTCPeerConnection` rằng nó cần thực hiện đàm phán phiên bằng cách gọi {{domxref("RTCPeerConnection.createOffer", "createOffer()")}} theo sau là {{domxref("RTCPeerConnection.setLocalDescription", "setLocalDescription()")}}.
- {{domxref("RTCDataChannel.open_event", "open")}}
  - : Việc truyền tải dữ liệu cơ bản cho `RTCDataChannel` đã được mở hoặc mở lại thành công.
- {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "selectedcandidatepairchange")}}
  - : Cặp ứng cử viên ICE hiện được chọn đã thay đổi cho `RTCIceTransport` nơi sự kiện được kích hoạt.
- {{domxref("RTCPeerConnection.track_event", "track")}}
  - : Sự kiện `track` thuộc loại {{domxref("RTCTrackEvent")}} được gửi tới {{domxref("RTCPeerConnection")}} khi một bản nhạc mới được thêm vào kết nối sau khi đàm phán thành công việc truyền phát phương tiện.
- {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}
  - : Được gửi đến kết nối ngang hàng khi {{domxref("RTCPeerConnection.signalingState", "signalingState")}} của nó đã thay đổi. Điều này xảy ra do lệnh gọi tới {{domxref("RTCPeerConnection.setLocalDescription", "setLocalDescription()")}} hoặc {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}.
- {{domxref("RTCDtlsTransport.statechange_event", "statechange")}}
  - : Trạng thái của `RTCDtlsTransport` đã thay đổi.
- {{domxref("RTCIceTransport.statechange_event", "statechange")}}
  - : Trạng thái của `RTCIceTransport` đã thay đổi.
- {{domxref("RTCSctpTransport.statechange_event", "statechange")}}
  - : Trạng thái của `RTCSctpTransport` đã thay đổi.
- {{DOMxRef("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}
  - : Khung video hoặc âm thanh được mã hóa đã sẵn sàng để xử lý bằng cách sử dụng luồng biến đổi trong trình chạy.

#### Các loại

- {{DOMxRef("RTCSctpTransport.state")}}
  - : Cho biết trạng thái của phiên bản {{DOMxRef("RTCSctpTransport")}}.

### Danh tính và bảo mật

Các API này được sử dụng để quản lý danh tính và bảo mật người dùng nhằm xác thực người dùng khi kết nối.

- {{DOMxRef("RTCIdentityProvider")}}
  - : Cho phép tác nhân người dùng có thể yêu cầu tạo hoặc xác thực xác nhận danh tính.
- {{DOMxRef("RTCIdentityAssertion")}}
  - : Thể hiện danh tính của thiết bị ngang hàng từ xa của kết nối hiện tại. Nếu chưa có thiết bị ngang hàng nào được thiết lập và xác minh thì giao diện này sẽ trả về `null`. Một khi đã thiết lập thì không thể thay đổi được.
- {{DOMxRef("RTCIdentityProviderRegistrar")}}
  - : Đăng ký nhà cung cấp danh tính (idP).
- {{DOMxRef("RTCCertificate")}}
  - : Thể hiện chứng chỉ mà {{DOMxRef("RTCPeerConnection")}} sử dụng để xác thực.### Điện thoại

Các giao diện và sự kiện này có liên quan đến khả năng tương tác với Mạng Điện thoại Chuyển mạch Công cộng (PSTN). Chúng chủ yếu được sử dụng để gửi âm thanh quay số bằng âm—hoặc các gói đại diện cho các âm đó—qua mạng tới thiết bị ngang hàng từ xa.

#### Giao diện

- {{DOMxRef("RTCDTMFSender")}}
  - : Quản lý việc mã hóa và truyền tín hiệu Đa tần số kép ({{Glossary("DTMF")}}) cho {{DOMxRef("RTCPeerConnection")}}.
- {{DOMxRef("RTCDTMFToneChangeEvent")}}
  - : Được sử dụng bởi sự kiện {{domxref("RTCDTMFSender.tonechange_event", "tonechange")}} để biểu thị rằng âm DTMF đã bắt đầu hoặc kết thúc. Sự kiện này không bong bóng (trừ khi có quy định khác) và không thể hủy được (trừ khi có quy định khác).

#### Sự kiện

- {{domxref("RTCDTMFSender.tonechange_event", "tonechange")}}
  - : Âm {{Glossary("DTMF")}} mới đã bắt đầu phát qua kết nối hoặc âm cuối cùng trong `RTCDTMFSender` của {{domxref("RTCDTMFSender.toneBuffer", "toneBuffer")}} đã được gửi và bộ đệm hiện trống. Loại sự kiện là {{domxref("RTCDTMFToneChangeEvent")}}.

### Biến đổi được mã hóa

Các giao diện và sự kiện này được sử dụng để xử lý các khung hình âm thanh và video được mã hóa đến và đi bằng cách sử dụng luồng biến đổi đang chạy trong một trình chạy.

#### Giao diện

- {{DOMxRef("RTCRtpScriptTransform")}}
  - : Giao diện để chèn (các) luồng biến đổi đang chạy trong một công nhân vào đường dẫn RTC.
- {{DOMxRef("RTCRtpScriptTransformer")}}
  - : Bản sao phía công nhân của `RTCRtpScriptTransform` chuyển các tùy chọn từ luồng chính, cùng với luồng có thể đọc và luồng có thể ghi có thể được sử dụng để chuyển các khung được mã hóa thông qua {{DOMxRef("TransformStream")}}.
- {{DOMxRef("RTCEncodedVideoFrame")}}
  - : Biểu thị khung video được mã hóa sẽ được chuyển đổi trong đường dẫn RTC.
- {{DOMxRef("RTCEncodedAudioFrame")}}
  - : Biểu thị khung âm thanh được mã hóa sẽ được chuyển đổi trong đường dẫn RTC.

#### Thuộc tính

- {{DOMxRef("RTCRtpReceiver.transform")}}
  - : Thuộc tính được sử dụng để chèn luồng biến đổi vào đường dẫn máy thu cho các khung hình âm thanh và video được mã hóa đến.
- {{DOMxRef("RTCRtpSender.transform")}}
  - : Thuộc tính được sử dụng để chèn luồng biến đổi vào đường dẫn người gửi cho các khung hình âm thanh và video được mã hóa đi.

#### Sự kiện

- {{DOMxRef("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}
  - : Biến đổi RTC đã sẵn sàng để chạy trong Worker hoặc khung âm thanh hoặc video được mã hóa đã sẵn sàng để xử lý.

## Hướng dẫn- [Giới thiệu về Giao thức truyền tải thời gian thực (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP) - : Giao thức truyền tải thời gian thực (RTP), được định nghĩa trong {{RFC(3550)}}, là giao thức chuẩn IETF cho phép kết nối thời gian thực để trao đổi dữ liệu cần ưu tiên thời gian thực. Bài viết này cung cấp thông tin tổng quan về RTP là gì và cách thức hoạt động của nó trong bối cảnh WebRTC

- [Giới thiệu về giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
  - : Bài viết này giới thiệu các giao thức trên đó API WebRTC được xây dựng.
- [Kết nối WebRTC](/en-US/docs/Web/API/WebRTC_API/Connectivity)
  - : Hướng dẫn về cách hoạt động của kết nối WebRTC cũng như cách sử dụng cùng nhau các giao thức và giao diện khác nhau để xây dựng các ứng dụng giao tiếp mạnh mẽ.
- [Thời gian tồn tại của phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
  - : WebRTC cho phép bạn xây dựng giao tiếp ngang hàng về dữ liệu, âm thanh hoặc video tùy ý—hoặc bất kỳ sự kết hợp nào của chúng—vào một ứng dụng trình duyệt. Trong bài viết này, chúng ta sẽ xem xét thời gian tồn tại của phiên WebRTC, từ việc thiết lập kết nối cho đến việc đóng kết nối khi không còn cần thiết.
- [Thiết lập kết nối: Mô hình đàm phán hoàn hảo](/en-US/docs/Web/API/WebRTC_API/Perfect_negotiation)
  - : **Thương lượng hoàn hảo** là mẫu thiết kế được đề xuất để quá trình ra tín hiệu của bạn tuân theo, mang lại sự minh bạch trong đàm phán đồng thời cho phép cả hai bên trở thành người đề nghị hoặc người trả lời mà không cần mã hóa đáng kể để phân biệt cả hai.
- [Báo hiệu và gọi video hai chiều](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling)
  - : Hướng dẫn và ví dụ biến hệ thống trò chuyện dựa trên WebSocket được tạo cho ví dụ trước và thêm hỗ trợ mở cuộc gọi điện video giữa những người tham gia. Kết nối WebSocket của máy chủ trò chuyện được sử dụng để truyền tín hiệu WebRTC.
- [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs)
  - : Hướng dẫn về codec mà WebRTC yêu cầu trình duyệt hỗ trợ cũng như các codec tùy chọn được nhiều trình duyệt phổ biến khác nhau hỗ trợ. Bao gồm là hướng dẫn giúp bạn chọn codec tốt nhất cho nhu cầu của mình.
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
  - : Hướng dẫn này trình bày cách bạn có thể sử dụng kết nối ngang hàng và {{DOMxRef("RTCDataChannel")}} được liên kết để trao đổi dữ liệu tùy ý giữa hai đồng nghiệp.
- [Sử dụng DTMF với WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
  - : Hỗ trợ của WebRTC để tương tác với các cổng liên kết với hệ thống điện thoại cũ bao gồm hỗ trợ gửi âm DTMF bằng giao diện {{DOMxRef("RTCDTMFSender")}}. Hướng dẫn này cho thấy làm thế nào để làm như vậy.
- [Sử dụng các biến đổi được mã hóa WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
  - : Hướng dẫn này cho biết cách ứng dụng web có thể sửa đổi các khung hình âm thanh và video được mã hóa WebRTC đến và đi bằng cách sử dụng {{DOMxRef("TransformStream")}} chạy vào một nhân viên.

## Hướng dẫn

- [Cải thiện khả năng tương thích bằng cách sử dụng WebRTC adapter.js](#interoperability)
  - : Tổ chức WebRTC [cung cấp trên GitHub bộ điều hợp WebRTC](https://github.com/webrtc/adapter/) giải quyết các vấn đề tương thích trong quá trình triển khai WebRTC của các trình duyệt khác nhau. Bộ điều hợp là một mô phỏng JavaScript cho phép mã của bạn được ghi theo thông số kỹ thuật để nó "chỉ hoạt động" trong tất cả các trình duyệt có hỗ trợ WebRTC.
- [Một mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
  - : Giao diện {{DOMxRef("RTCDataChannel")}} là một tính năng cho phép bạn mở một kênh giữa hai thiết bị ngang hàng mà qua đó bạn có thể gửi và nhận dữ liệu tùy ý. API này có chủ ý tương tự như [API WebSocket](/en-US/docs/Web/API/WebSockets_API), do đó có thể sử dụng cùng một mô hình lập trình cho mỗi API.
- [Xây dựng điện thoại kết nối internet với Peer.js](/en-US/docs/Web/API/WebRTC_API/Build_a_phone_with_peerjs)
  - : Hướng dẫn này là hướng dẫn từng bước về cách xây dựng điện thoại bằng Peer.js

## Thông số kỹ thuật

{{Specifications}}

### Giao thức phù hợp với WebRTC

- [Đàm phán giao thức lớp ứng dụng cho truyền thông thời gian thực trên web](https://datatracker.ietf.org/doc/rfc8833/)
- [Yêu cầu xử lý và giải mã âm thanh WebRTC](https://datatracker.ietf.org/doc/rfc7874/)
- [Kênh dữ liệu RTCWeb](https://datatracker.ietf.org/doc/rfc8831/)
- [Giao thức kênh dữ liệu RTCWeb](https://datatracker.ietf.org/doc/rfc8832/)
- [Giao tiếp thời gian thực trên web (WebRTC): Truyền tải phương tiện và sử dụng RTP](https://datatracker.ietf.org/doc/rfc8834/)
- [Kiến trúc bảo mật WebRTC](https://datatracker.ietf.org/doc/rfc8827/)
- [Vận chuyển cho RTCWEB](https://datatracker.ietf.org/doc/rfc8835/)

### Các giao thức hỗ trợ liên quan

- [Thiết lập kết nối tương tác (ICE): Giao thức truyền tải địa chỉ mạng (NAT) cho giao thức ưu đãi/trả lời](https://datatracker.ietf.org/doc/html/rfc5245)
- [Tiện ích truyền tải phiên cho NAT (STUN)](https://datatracker.ietf.org/doc/html/rfc5389)
- [Lược đồ URI cho Tiện ích truyền tải phiên cho giao thức NAT (STUN)](https://datatracker.ietf.org/doc/html/rfc7064)
- [Truyền tải bằng cách sử dụng Rơle xung quanh Bộ nhận dạng tài nguyên thống nhất NAT (TURN)](https://datatracker.ietf.org/doc/html/rfc7065)
- [Mô hình Ưu đãi/Trả lời với Giao thức Mô tả Phiên (SDP)](https://datatracker.ietf.org/doc/html/rfc3264)
- [Tiện ích truyền tải phiên dành cho tiện ích mở rộng NAT (STUN) cho ủy quyền của bên thứ ba](https://datatracker.ietf.org/doc/rfc7635/)

## Xem thêm

- {{DOMxRef("MediaDevices")}}
- {{DOMxRef("MediaStreamEvent")}}
- {{DOMxRef("MediaStreamTrack")}}
- {{DOMxRef("MessageEvent")}}
- {{DOMxRef("MediaStream")}}
- [API thu thập và truyền phát phương tiện](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Firefox đa luồng và đàm phán lại cho Jitsi Videobridge](https://hacks.mozilla.org/2015/06/firefox-multistream-and-renegotiation-for-jitsi-videobridge/)
- [Nhìn xuyên qua sương mù WebRTC với SocketPeer](https://hacks.mozilla.org/2015/04/peering-through-the-webrtc-fog-with-socketpeer/)
- [Bên trong xe buýt tiệc tùng: Xây dựng ứng dụng web với nhiều luồng video trực tiếp + Đồ họa tương tác](https://hacks.mozilla.org/2014/04/inside-the-party-bus-building-a-web-app-with-multiple-live-video-streams-interactive-graphics/)
- [Công nghệ truyền thông web](/en-US/docs/Web/Media)
