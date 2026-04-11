---
title: kết nối WebRTC
slug: Web/API/WebRTC_API/Connectivity
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

Bài viết này mô tả cách các giao thức khác nhau liên quan đến WebRTC tương tác với nhau để tạo kết nối và truyền dữ liệu và/hoặc phương tiện giữa các thiết bị ngang hàng.

> [!LƯU Ý]
> Trang này cần được viết lại nhiều để đảm bảo tính toàn vẹn về cấu trúc và tính đầy đủ của nội dung. Rất nhiều thông tin ở đây là tốt nhưng tổ chức thì lộn xộn vì hiện tại đây giống như một bãi rác.

## Báo hiệu

Thật không may, WebRTC không thể tạo kết nối nếu không có loại máy chủ nào đó ở giữa. Chúng tôi gọi đây là **kênh tín hiệu** hoặc **dịch vụ báo hiệu**. Đó là bất kỳ loại kênh liên lạc nào để trao đổi thông tin trước khi thiết lập kết nối, cho dù qua email, bưu thiếp hay chim bồ câu vận chuyển. Tùy bạn đấy.

Thông tin chúng ta cần trao đổi là Ưu đãi và Trả lời chỉ chứa {{Glossary("SDP")}} được đề cập bên dưới.

Peer A, người sẽ là người khởi tạo kết nối, sẽ tạo Ưu đãi. Sau đó, họ sẽ gửi ưu đãi này đến Peer B bằng kênh tín hiệu đã chọn. Peer B sẽ nhận được Offer từ kênh tín hiệu và tạo Câu trả lời. Sau đó, họ sẽ gửi thông tin này trở lại Peer A dọc theo kênh tín hiệu.

### Mô tả phiên

Cấu hình của điểm cuối trên kết nối WebRTC được gọi là **mô tả phiên**. Mô tả bao gồm thông tin về loại phương tiện được gửi, định dạng của nó, giao thức truyền đang được sử dụng, địa chỉ IP và cổng của điểm cuối cũng như các thông tin khác cần thiết để mô tả điểm cuối truyền phương tiện. Thông tin này được trao đổi và lưu trữ bằng **Giao thức mô tả phiên** ({{Glossary("SDP")}}); nếu bạn muốn biết chi tiết về định dạng của dữ liệu SDP, bạn có thể tìm thấy nó trong {{RFC(8866)}}.

Khi người dùng bắt đầu cuộc gọi WebRTC tới một người dùng khác, một mô tả đặc biệt sẽ được tạo có tên là **ưu đãi**. Mô tả này bao gồm tất cả thông tin về cấu hình đề xuất của người gọi cho cuộc gọi. Sau đó, người nhận sẽ trả lời bằng **câu trả lời**, đây là mô tả về việc họ kết thúc cuộc gọi. Bằng cách này, cả hai thiết bị đều chia sẻ với nhau thông tin cần thiết để trao đổi dữ liệu đa phương tiện. Việc trao đổi này được xử lý bằng cách sử dụng Thiết lập kết nối tương tác ({{Glossary("ICE")}}), một giao thức cho phép hai thiết bị sử dụng một thiết bị trung gian để trao đổi các ưu đãi và câu trả lời ngay cả khi hai thiết bị được phân tách bằng Dịch địa chỉ mạng ({{Glossary("NAT")}}).

Sau đó, mỗi thiết bị ngang hàng giữ hai mô tả: **mô tả cục bộ**, mô tả chính nó và **mô tả từ xa**, mô tả đầu bên kia của cuộc gọi.

Quá trình đề nghị/trả lời được thực hiện cả khi cuộc gọi được thiết lập lần đầu cũng như bất kỳ lúc nào định dạng cuộc gọi hoặc cấu hình khác cần thay đổi. Bất kể đó là cuộc gọi mới hay định cấu hình lại cuộc gọi hiện có, đây là các bước cơ bản phải thực hiện để trao đổi lời đề nghị và câu trả lời, tạm thời loại bỏ lớp ICE:1. Người gọi chụp Phương tiện cục bộ qua {{domxref("MediaDevices.getUserMedia")}} 2. Người gọi tạo `RTCPeerConnection` và gọi {{domxref("RTCPeerConnection.addTrack()")}} (Vì `addStream` không được dùng nữa) 3. Người gọi gọi {{domxref("RTCPeerConnection.createOffer()")}} để tạo ưu đãi. 4. Người gọi gọi {{domxref("RTCPeerConnection.setLocalDescription()")}} để đặt ưu đãi đó làm _local description_ (nghĩa là mô tả về điểm cuối cục bộ của kết nối). 5. Sau setLocalDescription(), người gọi sẽ yêu cầu máy chủ STUN tạo ra các ứng cử viên băng 6. Người gọi sử dụng máy chủ báo hiệu để truyền lời đề nghị đến người nhận cuộc gọi dự định. 7. Người nhận nhận được ưu đãi và gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}} để ghi lại dưới dạng _remote description_ (mô tả đầu bên kia của kết nối). 8. Người nhận thực hiện bất kỳ thiết lập nào cần thực hiện khi kết thúc cuộc gọi: ghi lại phương tiện cục bộ của mình và đính kèm từng rãnh phương tiện vào kết nối ngang hàng qua {{domxref("RTCPeerConnection.addTrack()")}} 9. Sau đó, người nhận sẽ tạo câu trả lời bằng cách gọi {{domxref("RTCPeerConnection.createAnswer()")}}. 10. Người nhận gọi {{domxref("RTCPeerConnection.setLocalDescription()")}}, chuyển câu trả lời đã tạo vào, để đặt câu trả lời làm mô tả cục bộ của nó. Người nhận bây giờ đã biết cấu hình của cả hai đầu kết nối. 11. Người nhận sử dụng máy chủ báo hiệu để gửi câu trả lời cho người gọi. 12. Người gọi nhận được câu trả lời. 13. Người gọi gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}} để đặt câu trả lời làm mô tả từ xa khi kết thúc cuộc gọi. Bây giờ nó đã biết cấu hình của cả hai thiết bị ngang hàng. Phương tiện bắt đầu truyền theo cấu hình.

### Đang chờ xử lý và mô tả hiện tại

Tiến sâu hơn một bước vào quy trình, chúng tôi nhận thấy rằng `localDescription` và `remoteDescription`, các thuộc tính trả về hai mô tả này, không đơn giản như vẻ ngoài của chúng. Bởi vì trong quá trình đàm phán lại, một đề nghị có thể bị từ chối vì đề xuất một định dạng không tương thích, nên mỗi điểm cuối cần có khả năng đề xuất một định dạng mới nhưng không thực sự chuyển sang định dạng đó cho đến khi được thiết bị ngang hàng kia chấp nhận. Vì lý do đó, WebRTC sử dụng mô tả _pending_ và _current_.

**mô tả hiện tại** (được trả về bởi thuộc tính {{domxref("RTCPeerConnection.currentLocalDescription")}} và {{domxref("RTCPeerConnection.currentRemoteDescription")}}) thể hiện mô tả hiện đang được kết nối sử dụng thực tế. Đây là kết nối gần đây nhất mà cả hai bên đã hoàn toàn đồng ý sử dụng.

**Mô tả đang chờ xử lý** (được trả về bởi {{domxref("RTCPeerConnection.pendingLocalDescription")}} và {{domxref("RTCPeerConnection.pendingRemoteDescription")}}) biểu thị một mô tả hiện đang được xem xét sau lệnh gọi tới `setLocalDescription()` hoặc `setRemoteDescription()` tương ứng.

Khi đọc mô tả (được trả về bởi {{domxref("RTCPeerConnection.localDescription")}} và {{domxref("RTCPeerConnection.remoteDescription")}}), giá trị được trả về là giá trị của `pendingLocalDescription`/`pendingRemoteDescription` nếu có mô tả đang chờ xử lý (nghĩa là mô tả đang chờ xử lý không phải là `null`); nếu không, mô tả hiện tại (`currentLocalDescription`/`currentRemoteDescription`) sẽ được trả về.

Khi thay đổi mô tả bằng cách gọi `setLocalDescription()` hoặc `setRemoteDescription()`, mô tả đã chỉ định sẽ được đặt làm mô tả đang chờ xử lý và lớp WebRTC bắt đầu đánh giá xem nó có được chấp nhận hay không. Khi mô tả đề xuất đã được thống nhất, giá trị của `currentLocalDescription` hoặc `currentRemoteDescription` sẽ được thay đổi thành mô tả đang chờ xử lý và mô tả đang chờ xử lý lại được đặt thành rỗng, cho biết rằng không có mô tả đang chờ xử lý.

> [!LƯU Ý]
> `pendingLocalDescription` không chỉ chứa lời đề nghị hoặc câu trả lời đang được xem xét mà còn chứa bất kỳ ứng cử viên ICE địa phương nào đã được thu thập kể từ khi lời đề nghị hoặc câu trả lời được tạo. Tương tự, `pendingRemoteDescription` bao gồm mọi ứng cử viên ICE từ xa đã được cung cấp bởi các cuộc gọi tới {{domxref("RTCPeerConnection.addIceCandidate()")}}.Xem các bài viết riêng lẻ về các thuộc tính và phương pháp này để biết thêm chi tiết cụ thể và [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) để biết thông tin về các codec được WebRTC hỗ trợ và tương thích với trình duyệt nào. Hướng dẫn về codec cũng cung cấp hướng dẫn giúp bạn chọn codec tốt nhất cho nhu cầu của mình.

## ứng viên ICE

Cùng với việc trao đổi thông tin về phương tiện truyền thông (đã thảo luận ở trên trong Ưu đãi/Trả lời và SDP), các đồng nghiệp phải trao đổi thông tin về kết nối mạng. Đây được gọi là **ứng viên ICE** và nêu chi tiết các phương thức có sẵn mà thiết bị ngang hàng có thể giao tiếp (trực tiếp hoặc thông qua máy chủ TURN). Thông thường, mỗi đồng nghiệp sẽ đề xuất những ứng viên tốt nhất trước tiên, sau đó mới tìm đến những ứng viên kém hơn. Lý tưởng nhất là các ứng cử viên là UDP (vì nó nhanh hơn và các luồng phương tiện có thể phục hồi sau khi bị gián đoạn tương đối dễ dàng), nhưng tiêu chuẩn ICE cũng cho phép các ứng cử viên TCP.

> [!LƯU Ý]
> Nói chung, các ứng cử viên ICE sử dụng TCP sẽ chỉ được sử dụng khi UDP không khả dụng hoặc bị hạn chế theo những cách khiến nó không phù hợp để truyền phát phương tiện. Tuy nhiên, không phải tất cả các trình duyệt đều hỗ trợ ICE qua TCP.

ICE cho phép các ứng viên thể hiện các kết nối qua {{Glossary("TCP")}} hoặc {{Glossary("UDP")}}, trong đó UDP thường được ưu tiên hơn (và được hỗ trợ rộng rãi hơn). Mỗi giao thức hỗ trợ một số loại ứng viên, trong đó các loại ứng viên xác định cách dữ liệu di chuyển từ ngang hàng này sang ngang hàng khác.

### Loại ứng viên UDP

Ứng viên UDP (ứng viên có {{domxref("RTCIceCandidate.protocol", "protocol")}} được đặt thành `udp`) có thể là một trong những loại sau:

- `host`
  - : Ứng cử viên máy chủ là máy chủ có địa chỉ {{domxref("RTCIceCandidate/address", "ip")}} của nó là địa chỉ IP trực tiếp, thực tế của thiết bị ngang hàng từ xa.
- `prflx`
  - : Ứng cử viên phản xạ ngang hàng là ứng cử viên có địa chỉ IP đến từ NAT đối xứng giữa hai thiết bị ngang hàng, thường là ứng cử viên bổ sung trong quá trình ICE nhỏ giọt (nghĩa là trao đổi ứng viên bổ sung xảy ra sau khi báo hiệu chính nhưng trước khi giai đoạn xác minh kết nối kết thúc).
- `srflx`
  - : Ứng cử viên phản xạ máy chủ được tạo bởi máy chủ STUN/TURN; người khởi tạo kết nối yêu cầu một ứng cử viên từ máy chủ STUN, chuyển tiếp yêu cầu thông qua NAT của thiết bị ngang hàng từ xa, tạo và trả về một ứng cử viên có địa chỉ IP cục bộ cho thiết bị ngang hàng từ xa. Sau đó, máy chủ STUN sẽ trả lời yêu cầu của người khởi tạo với một ứng cử viên có địa chỉ IP không liên quan đến máy ngang hàng từ xa.
- `relay`
  - : Ứng viên chuyển tiếp được tạo giống như ứng viên phản xạ của máy chủ (`"srflx"`), nhưng sử dụng {{Glossary("TURN")}} thay vì {{Glossary("STUN")}}.

### Các loại ứng cử viên TCP

Các ứng cử viên TCP (nghĩa là các ứng cử viên có {{domxref("RTCIceCandidate.protocol", "protocol")}} là `tcp`) có thể thuộc các loại sau:

- `active`
  - : Transport sẽ cố gắng mở một kết nối gửi đi nhưng sẽ không nhận được các yêu cầu kết nối đến. Đây là loại phổ biến nhất và là loại duy nhất mà hầu hết các tác nhân người dùng sẽ thu thập.
- `passive`
  - : Phương tiện vận chuyển sẽ nhận các nỗ lực kết nối đến nhưng sẽ không tự thực hiện kết nối.
- `so`
  - : Transport sẽ cố gắng đồng thời mở một kết nối với thiết bị ngang hàng của nó.

### Chọn cặp ứng viên

Lớp ICE chọn một trong hai đồng nghiệp làm **tác nhân kiểm soát**. Đây là tác nhân ICE sẽ đưa ra quyết định cuối cùng về việc sử dụng cặp ứng cử viên nào cho kết nối. Thiết bị ngang hàng còn lại được gọi là **tác nhân được kiểm soát**. Bạn có thể xác định đầu cuối của kết nối là đầu nào bằng cách kiểm tra giá trị của {{domxref("RTCIceTransport.role", "RTCIceCandidate.transport.role")}}, mặc dù nhìn chung việc đó là đầu nào không quan trọng.Tác nhân kiểm soát không chỉ chịu trách nhiệm đưa ra quyết định cuối cùng về việc sử dụng cặp ứng cử viên nào mà còn báo hiệu lựa chọn đó cho tác nhân bị kiểm soát bằng cách sử dụng STUN và một đề nghị cập nhật, nếu cần. Tác nhân được kiểm soát chỉ chờ được cho biết nên sử dụng cặp ứng cử viên nào.

Điều quan trọng cần lưu ý là một phiên ICE có thể dẫn đến việc tác nhân kiểm soát chọn nhiều hơn một cặp ứng cử viên. Mỗi lần nó làm như vậy và chia sẻ thông tin đó với tác nhân được kiểm soát, hai thiết bị ngang hàng sẽ cấu hình lại kết nối của họ để sử dụng cấu hình mới được mô tả bởi cặp ứng viên mới.

Sau khi phiên ICE hoàn tất, cấu hình hiện có hiệu lực là cấu hình cuối cùng, trừ khi xảy ra quá trình đặt lại ICE.

Vào cuối mỗi thế hệ ứng cử viên, một thông báo kết thúc ứng cử viên sẽ được gửi dưới dạng {{domxref("RTCIceCandidate")}} có thuộc tính {{domxref("RTCIceCandidate.candidate", "candidate")}} là một chuỗi trống. Ứng cử viên này vẫn phải được thêm vào kết nối bằng phương thức {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}, như thường lệ, để gửi thông báo đó đến thiết bị ngang hàng từ xa.

Khi không còn ứng cử viên nào được mong đợi trong quá trình trao đổi thương lượng hiện tại, thông báo kết thúc ứng cử viên sẽ được gửi bằng cách gửi {{domxref("RTCIceCandidate")}} có thuộc tính {{domxref("RTCIceCandidate.candidate", "candidate")}} là `null`. Tin nhắn này _không_ cần được gửi đến thiết bị ngang hàng ở xa. Thay vào đó, đó là thông báo kế thừa về một trạng thái có thể được phát hiện bằng cách theo dõi {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}} thay đổi thành `complete`, bằng cách theo dõi sự kiện {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}.

## Khi mọi chuyện không như ý muốn

Trong quá trình đàm phán, sẽ có lúc mọi việc không diễn ra suôn sẻ. Ví dụ: khi đàm phán lại một kết nối—chẳng hạn như để thích ứng với việc thay đổi cấu hình phần cứng hoặc mạng—có thể việc đàm phán có thể đi vào ngõ cụt hoặc có thể xảy ra một số dạng lỗi khiến cản trở việc đàm phán. Về vấn đề đó, có thể có vấn đề về quyền hoặc các vấn đề khác.

### khôi phục ICE

Khi đàm phán lại một kết nối đã hoạt động và xảy ra tình huống đàm phán thất bại, bạn không thực sự muốn kết thúc cuộc gọi đang chạy. Suy cho cùng, rất có thể bạn chỉ đang cố gắng nâng cấp hoặc hạ cấp kết nối hoặc thực hiện các điều chỉnh cho phù hợp với phiên đang diễn ra. Việc hủy bỏ cuộc gọi sẽ là một phản ứng thái quá trong tình huống đó.

Thay vào đó, bạn có thể bắt đầu **khôi phục ICE**. Việc khôi phục sẽ khôi phục ưu đãi SDP (và cấu hình kết nối theo tiện ích mở rộng) về cấu hình mà lần cuối cùng {{domxref("RTCPeerConnection.signalingState", "signalingState")}} của kết nối là `stable`.

Để bắt đầu khôi phục theo chương trình, hãy gửi mô tả có {{domxref("RTCSessionDescription.type", "type")}} là `rollback`. Bất kỳ thuộc tính nào khác trong đối tượng mô tả đều bị bỏ qua.

Ngoài ra, tác nhân ICE sẽ tự động bắt đầu khôi phục khi một đồng nghiệp đã tạo ưu đãi trước đó nhận được ưu đãi từ đồng nghiệp ở xa. Nói cách khác, nếu thiết bị ngang hàng cục bộ ở trạng thái `have-local-offer`, cho biết rằng thiết bị ngang hàng cục bộ trước đó đã _sent_ một ưu đãi, việc gọi `setRemoteDescription()` với một ưu đãi _received_ sẽ kích hoạt khôi phục để quá trình đàm phán chuyển từ thiết bị ngang hàng từ xa là người gọi sang thiết bị ngang hàng cục bộ là người gọi.

### ICE khởi động lại

Tìm hiểu về quy trình [khởi động lại ICE](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#ice_restart).

## Toàn bộ quá trình trao đổi trong một sơ đồ phức tạp

![Sơ đồ kiến ​​trúc hoàn chỉnh hiển thị toàn bộ quy trình WebRTC.](webrtc-complete-diagram.png)

[Nguồn gốc](https://hacks.mozilla.org/2013/07/webrtc-and-the-ocean-of-acronyms/)
