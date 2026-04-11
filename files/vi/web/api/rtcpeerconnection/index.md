---
title: RTCPeerConnection
slug: Web/API/RTCPeerConnection
page-type: web-api-interface
browser-compat: api.RTCPeerConnection
---

{{APIRef("WebRTC")}}

Giao diện **`RTCPeerConnection`** biểu diễn một kết nối WebRTC giữa máy tính cục bộ và một máy ngang hàng từ xa.
Giao diện này cung cấp các phương thức để kết nối với máy ngang hàng từ xa, duy trì và theo dõi kết nối, rồi đóng kết nối khi không còn cần thiết.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("RTCPeerConnection.RTCPeerConnection", "RTCPeerConnection()")}}
  - : Trả về một `RTCPeerConnection` mới, đại diện cho một kết nối giữa thiết bị cục bộ và một máy ngang hàng từ xa.

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ {{DOMxRef("EventTarget")}}._

- {{DOMxRef("RTCPeerConnection.canTrickleIceCandidates", "canTrickleIceCandidates")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết máy ngang hàng từ xa có thể chấp nhận [ICE candidate được gửi dần](https://datatracker.ietf.org/doc/html/draft-ietf-mmusic-trickle-ice) hay không.
- {{DOMxRef("RTCPeerConnection.connectionState", "connectionState")}} {{ReadOnlyInline}}
  - : Cho biết trạng thái hiện tại của kết nối ngang hàng bằng cách trả về một trong các chuỗi: `new`, `connecting`, `connected`, `disconnected`, `failed` hoặc `closed`.
- {{DOMxRef("RTCPeerConnection.currentLocalDescription", "currentLocalDescription")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSessionDescription")}} mô tả đầu cục bộ của kết nối như lần thương lượng thành công gần nhất kể từ khi `RTCPeerConnection` này hoàn tất việc thương lượng và kết nối với máy ngang hàng từ xa.
    Thuộc tính này cũng bao gồm danh sách bất kỳ ICE candidate nào đã được bộ máy ICE tạo ra kể từ khi offer hoặc answer được mô tả được khởi tạo lần đầu.
- {{DOMxRef("RTCPeerConnection.currentRemoteDescription", "currentRemoteDescription")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSessionDescription")}} mô tả đầu từ xa của kết nối như lần thương lượng thành công gần nhất kể từ khi `RTCPeerConnection` này hoàn tất việc thương lượng và kết nối với máy ngang hàng từ xa.
    Thuộc tính này cũng bao gồm danh sách bất kỳ ICE candidate nào đã được bộ máy ICE tạo ra kể từ khi offer hoặc answer được mô tả được khởi tạo lần đầu.
- {{DOMxRef("RTCPeerConnection.iceConnectionState", "iceConnectionState")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết trạng thái của bộ máy ICE gắn với `RTCPeerConnection` này.
    Giá trị có thể là một trong các trạng thái sau: `new`, `checking`, `connected`, `completed`, `failed`, `disconnected` hoặc `closed`.
- {{DOMxRef("RTCPeerConnection.iceGatheringState", "iceGatheringState")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi mô tả trạng thái thu thập ICE của kết nối.
    Điều này cho phép bạn phát hiện, chẳng hạn, khi quá trình thu thập ICE candidate đã hoàn tất.
    Các giá trị có thể là: `new`, `gathering` hoặc `complete`.
- {{DOMxRef("RTCPeerConnection.localDescription", "localDescription")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSessionDescription")}}
    mô tả phiên cho đầu cục bộ của kết nối.
    Nếu chưa được đặt, thuộc tính này trả về `null`.
- {{DOMxRef("RTCPeerConnection.peerIdentity", "peerIdentity")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành một {{DOMxRef("RTCIdentityAssertion")}} chứa một chuỗi định danh máy ngang hàng từ xa.
    Khi promise này được giải quyết thành công, danh tính thu được sẽ là danh tính máy ngang hàng đích và sẽ không thay đổi trong suốt thời gian kết nối.
- {{DOMxRef("RTCPeerConnection.pendingLocalDescription", "pendingLocalDescription")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSessionDescription")}} mô tả một thay đổi cấu hình đang chờ xử lý cho đầu cục bộ của kết nối.
    Nó không mô tả trạng thái hiện tại của kết nối, mà là trạng thái có thể xuất hiện trong tương lai gần.
- {{DOMxRef("RTCPeerConnection.pendingRemoteDescription", "pendingRemoteDescription")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSessionDescription")}}
    mô tả một thay đổi cấu hình đang chờ xử lý cho đầu từ xa của kết nối.
    Nó không mô tả trạng thái hiện tại của kết nối, mà là trạng thái có thể xuất hiện trong tương lai gần.
- {{DOMxRef("RTCPeerConnection.remoteDescription", "remoteDescription")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSessionDescription")}} mô tả phiên, bao gồm thông tin cấu hình và phương tiện, cho đầu từ xa của kết nối.
    Nếu chưa được đặt, giá trị trả về là `null`.
- {{DOMxRef("RTCPeerConnection.sctp", "sctp")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("RTCSctpTransport")}} mô tả lớp truyền tải {{Glossary("SCTP")}} mà qua đó dữ liệu SCTP được gửi và nhận.
    Nếu SCTP chưa được thương lượng, giá trị này là `null`.
- {{DOMxRef("RTCPeerConnection.signalingState", "signalingState")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi mô tả trạng thái của quá trình báo hiệu ở đầu cục bộ của kết nối trong khi đang kết nối hoặc kết nối lại với một máy ngang hàng khác.
    Giá trị có thể là một trong các trạng thái sau: `stable`, `have-local-offer`, `have-remote-offer`, `have-local-pranswer`, `have-remote-pranswer` hoặc `closed`.

## Phương thức tĩnh

- {{DOMxRef("RTCPeerConnection.generateCertificate_static", "RTCPeerConnection.generateCertificate()")}}
  - : Tạo một chứng chỉ X.509 và khóa riêng tương ứng của nó, trả về một {{jsxref("Promise")}} được giải quyết thành {{DOMxRef("RTCCertificate")}} mới khi quá trình tạo hoàn tất.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ {{DOMxRef("EventTarget")}}._

- {{DOMxRef("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}
  - : Thêm một candidate từ xa mới vào `remoteDescription` của `RTCPeerConnection`, mô tả trạng thái của đầu từ xa của kết nối.
- {{DOMxRef("RTCPeerConnection.addTrack", "addTrack()")}}
  - : Thêm một {{DOMxRef("MediaStreamTrack")}} mới vào tập các track sẽ được truyền tới máy ngang hàng còn lại.
- {{DOMxRef("RTCPeerConnection.addTransceiver", "addTransceiver()")}}
  - : Tạo một {{DOMxRef("RTCRtpTransceiver")}} mới và thêm nó vào tập các transceiver gắn với kết nối.
    Mỗi transceiver biểu diễn một luồng hai chiều, với cả một {{DOMxRef("RTCRtpSender")}} và một {{DOMxRef("RTCRtpReceiver")}} gắn với nó.
- {{DOMxRef("RTCPeerConnection.close", "close()")}}
  - : Đóng kết nối ngang hàng hiện tại.
- {{DOMxRef("RTCPeerConnection.createAnswer", "createAnswer()")}}
  - : Bắt đầu tạo một câu trả lời {{Glossary("SDP")}} cho một lời mời nhận được từ một máy ngang hàng từ xa trong quá trình thương lượng offer/answer của một kết nối WebRTC.
    Câu trả lời chứa thông tin về bất kỳ phương tiện nào đã được gắn vào phiên, các codec và tùy chọn được trình duyệt hỗ trợ, cùng với bất kỳ {{Glossary("ICE")}} candidate nào đã được thu thập.
- {{DOMxRef("RTCPeerConnection.createDataChannel", "createDataChannel()")}}
  - : Bắt đầu tạo một kênh mới được liên kết với máy ngang hàng từ xa, qua đó có thể truyền bất kỳ loại dữ liệu nào.
    Điều này hữu ích cho nội dung kênh phụ, chẳng hạn như hình ảnh, truyền tệp, chat văn bản, gói cập nhật trò chơi, v.v.
- {{DOMxRef("RTCPeerConnection.createOffer", "createOffer()")}}
  - : Bắt đầu tạo một lời mời {{Glossary("SDP")}} nhằm khởi động một kết nối WebRTC mới tới máy ngang hàng từ xa.
    Lời mời SDP bao gồm thông tin về bất kỳ đối tượng {{DOMxRef("MediaStreamTrack")}} nào đã được gắn vào phiên WebRTC, codec và tùy chọn được trình duyệt hỗ trợ, cũng như mọi candidate đã được bộ máy {{Glossary("ICE")}} thu thập, với mục đích được gửi qua kênh báo hiệu tới một máy ngang hàng tiềm năng để yêu cầu kết nối hoặc cập nhật cấu hình của kết nối hiện có.
- {{DOMxRef("RTCPeerConnection.getConfiguration", "getConfiguration()")}}
  - : Trả về một đối tượng cho biết cấu hình hiện tại của kết nối.
- {{DOMxRef("RTCPeerConnection.getIdentityAssertion", "getIdentityAssertion()")}}
  - : Bắt đầu thu thập một chứng thực danh tính và trả về một {{jsxref("Promise")}} được giải quyết thành chuỗi mã hóa chứng thực danh tính.
    Điều này chỉ có tác dụng nếu {{DOMxRef("RTCPeerConnection.signalingState", "signalingState")}} không phải là `closed`.
- {{DOMxRef("RTCPeerConnection.getReceivers", "getReceivers()")}}
  - : Trả về một mảng các đối tượng {{DOMxRef("RTCRtpReceiver")}}, mỗi đối tượng biểu diễn một bộ nhận {{Glossary("RTP")}}.
- {{DOMxRef("RTCPeerConnection.getSenders", "getSenders()")}}
  - : Trả về một mảng các đối tượng {{DOMxRef("RTCRtpSender")}}, mỗi đối tượng biểu diễn bộ gửi {{Glossary("RTP")}} chịu trách nhiệm truyền dữ liệu của một track.
- {{DOMxRef("RTCPeerConnection.getStats", "getStats()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết với dữ liệu cung cấp thống kê về toàn bộ kết nối hoặc về {{DOMxRef("MediaStreamTrack")}} được chỉ định.
- {{DOMxRef("RTCPeerConnection.getTransceivers", "getTransceivers()")}}
  - : Trả về danh sách tất cả các đối tượng {{DOMxRef("RTCRtpTransceiver")}} đang được dùng để gửi và nhận dữ liệu trên kết nối.
- {{DOMxRef("RTCPeerConnection.removeTrack", "removeTrack()")}}
  - : Yêu cầu đầu cục bộ của kết nối ngừng gửi phương tiện từ track được chỉ định, mà không thực sự xóa {{DOMxRef("RTCRtpSender")}} tương ứng khỏi danh sách sender
    như được báo cáo bởi {{DOMxRef("RTCPeerConnection.getSenders", "getSenders()")}}.
    Nếu track đã dừng, hoặc không có trong danh sách sender của kết nối, phương thức này không có tác dụng.
- {{DOMxRef("RTCPeerConnection.restartIce", "restartIce()")}}
  - : Cho phép dễ dàng yêu cầu thực hiện lại việc thu thập ICE candidate ở cả hai đầu của kết nối.
    Điều này đơn giản hóa quá trình bằng cách cho phép cùng một phương thức được dùng bởi cả bên gọi lẫn bên nhận để kích hoạt khởi động lại {{Glossary("ICE")}}.
- {{DOMxRef("RTCPeerConnection.setConfiguration", "setConfiguration()")}}
  - : Đặt cấu hình hiện tại của kết nối dựa trên các giá trị được bao gồm trong đối tượng chỉ định.
    Điều này cho phép bạn thay đổi các máy chủ {{Glossary("ICE")}} được kết nối sử dụng và chính sách truyền tải nào sẽ được dùng.
- {{DOMxRef("RTCPeerConnection.setIdentityProvider", "setIdentityProvider()")}}
  - : Đặt Nhà cung cấp danh tính (IdP) theo bộ ba được truyền vào tham số: tên của nó, giao thức được dùng để giao tiếp với nó và tên người dùng.
    Giao thức và tên người dùng là tùy chọn.
- {{DOMxRef("RTCPeerConnection.setLocalDescription", "setLocalDescription()")}}
  - : Thay đổi mô tả cục bộ gắn với kết nối.
    Mô tả này chỉ định các thuộc tính của đầu cục bộ của kết nối, bao gồm định dạng media.
    Nó trả về một {{jsxref("Promise")}} được thực thi khi mô tả đã được thay đổi, theo cách bất đồng bộ.
- {{DOMxRef("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}
  - : Đặt mô tả phiên được chỉ định làm offer hoặc answer hiện tại của máy ngang hàng từ xa.
    Mô tả này chỉ định các thuộc tính của đầu từ xa của kết nối, bao gồm định dạng media.
    Nó trả về một {{jsxref("Promise")}} được thực thi khi mô tả đã được thay đổi, theo cách bất đồng bộ.

### Phương thức lỗi thời

- {{DOMxRef("RTCPeerConnection.addStream", "addStream()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Thêm một {{DOMxRef("MediaStream")}} làm nguồn cục bộ cho âm thanh hoặc video.
    Thay vì dùng phương thức lỗi thời này, bạn nên dùng {{DOMxRef("RTCPeerConnection.addTrack", "addTrack()")}} một lần cho mỗi track bạn muốn gửi đến máy ngang hàng từ xa.
- {{DOMxRef("RTCPeerConnection.createDTMFSender", "createDTMFSender()")}} {{Deprecated_Inline}} {{non-standard_inline}}
  - : Tạo một {{DOMxRef("RTCDTMFSender")}} mới, gắn với một {{DOMxRef("MediaStreamTrack")}} cụ thể, để có thể gửi tín hiệu điện thoại {{Glossary("DTMF")}} qua kết nối.
- {{DOMxRef("RTCPeerConnection.removeStream", "removeStream()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Xóa một {{DOMxRef("MediaStream")}} làm nguồn cục bộ cho âm thanh hoặc video.
    Vì phương thức này đã lỗi thời, bạn nên dùng {{DOMxRef("RTCPeerConnection.removeTrack", "removeTrack()")}}.

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}}
  - : Được gửi khi trạng thái kết nối tổng thể của `RTCPeerConnection` thay đổi.
- {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}}
  - : Được gửi khi máy ngang hàng từ xa thêm một {{domxref("RTCDataChannel")}} vào kết nối.
- {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}
  - : Được gửi để yêu cầu candidate được chỉ định được truyền tới máy ngang hàng từ xa.
- {{domxref("RTCPeerConnection.icecandidateerror_event", "icecandidateerror")}}
  - : Được gửi tới kết nối nếu xảy ra lỗi trong quá trình thu thập {{Glossary("ICE")}} candidate. Sự kiện này mô tả lỗi.
- {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}
  - : Được gửi khi trạng thái của kết nối {{Glossary("ICE")}} thay đổi, chẳng hạn khi nó bị ngắt.
- {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}
  - : Được gửi khi trạng thái thu thập của lớp {{Glossary("ICE")}}, được phản ánh bởi {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}}, thay đổi.
    Điều này cho biết quá trình thương lượng ICE chưa bắt đầu (`new`), đã bắt đầu thu thập candidate (`gathering`) hay đã hoàn tất (`complete`).
- {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}
  - : Được gửi khi cần thực hiện thương lượng hoặc thương lượng lại kết nối {{Glossary("ICE")}};
    việc này có thể xảy ra khi mở kết nối lần đầu cũng như khi cần thích ứng với các điều kiện mạng thay đổi.
    Bên nhận nên phản hồi bằng cách tạo một offer và gửi nó đến máy ngang hàng còn lại.
- {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}
  - : Được gửi khi trạng thái báo hiệu của kết nối {{Glossary("ICE")}} thay đổi.
- {{domxref("RTCPeerConnection.track_event", "track")}}
  - : Được gửi sau khi một track mới được thêm vào một trong các thể hiện {{domxref("RTCRtpReceiver")}} tạo nên kết nối.

### Sự kiện lỗi thời

- {{domxref("RTCPeerConnection.addstream_event", "addstream")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Được gửi khi một {{domxref("MediaStream")}} mới được thêm vào kết nối.
    Thay vì lắng nghe sự kiện lỗi thời này, bạn nên lắng nghe các sự kiện {{domxref("RTCPeerConnection.track_event", "track")}};
    một sự kiện được gửi cho mỗi {{domxref("MediaStreamTrack")}} được thêm vào kết nối.
- {{domxref("RTCPeerConnection.removestream_event", "removestream")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Được gửi khi một {{domxref("MediaStream")}} bị xóa khỏi kết nối.
    Thay vì lắng nghe sự kiện lỗi thời này, bạn nên lắng nghe các sự kiện {{domxref("MediaStream.removetrack_event", "removetrack")}} trên từng luồng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- <https://github.com/jesup/nightly-gupshup/blob/master/static/js/chat.js>
- [Bắt đầu với WebRTC](https://web.dev/articles/webrtc-basics)
- [TutorRoom](https://github.com/chrisjohndigital/TutorRoom): ứng dụng Node.js để chụp video HTML, video ngang hàng và chia sẻ tệp ([mã nguồn trên GitHub](https://github.com/chrisjohndigital/TutorRoom))
