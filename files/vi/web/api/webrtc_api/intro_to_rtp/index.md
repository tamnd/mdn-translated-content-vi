---
title: Giới thiệu về Giao thức truyền tải thời gian thực (RTP)
slug: Web/API/WebRTC_API/Intro_to_RTP
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

**Giao thức truyền tải thời gian thực** (**RTP**), được định nghĩa trong {{RFC(3550)}}, là giao thức chuẩn IETF cho phép kết nối thời gian thực nhằm trao đổi dữ liệu cần mức độ ưu tiên trong thời gian thực. Bài viết này cung cấp thông tin tổng quan về RTP là gì và cách thức hoạt động của nó trong bối cảnh WebRTC.

> [!LƯU Ý]
> WebRTC thực sự sử dụng **SRTP** (Giao thức truyền tải thời gian thực an toàn) để đảm bảo rằng dữ liệu được trao đổi được bảo mật và xác thực khi thích hợp.

Việc duy trì độ trễ ở mức tối thiểu đặc biệt quan trọng đối với WebRTC vì giao tiếp mặt đối mặt cần được thực hiện với càng ít {{Glossary("latency")}} càng tốt. Càng có nhiều khoảng thời gian trễ giữa một người dùng nói điều gì đó và một người khác nghe thấy điều đó thì càng có nhiều khả năng xảy ra các đợt nói chuyện chéo và các hình thức nhầm lẫn khác.

## Tính năng chính của RTP

Trước khi kiểm tra việc sử dụng RTP trong ngữ cảnh WebRTC, sẽ rất hữu ích nếu bạn có ý tưởng chung về những gì RTP cung cấp và không cung cấp. RTP là một giao thức truyền tải dữ liệu, có nhiệm vụ di chuyển dữ liệu giữa hai điểm cuối một cách hiệu quả nhất có thể trong điều kiện hiện tại. Những điều kiện đó có thể bị ảnh hưởng bởi mọi thứ, từ các lớp cơ bản của ngăn xếp mạng đến kết nối mạng vật lý, các mạng can thiệp, hiệu suất của điểm cuối từ xa, mức độ nhiễu, mức lưu lượng, v.v.

Vì RTP là phương tiện truyền tải dữ liệu nên nó được tăng cường bởi **Giao thức điều khiển RTP** (**RTCP**) có liên quan chặt chẽ, được xác định trong {{RFC(3550, "", 6)}}. RTCP bổ sung các tính năng bao gồm giám sát **Chất lượng dịch vụ** (**QoS**), chia sẻ thông tin người tham gia và những tính năng tương tự. Nó không phù hợp với mục đích quản lý đầy đủ người dùng, tư cách thành viên, quyền, v.v. nhưng cung cấp những điều cơ bản cần thiết cho phiên giao tiếp nhiều người dùng không hạn chế.

Thực tế là RTCP được định nghĩa trong cùng một RFC với RTP là manh mối cho thấy hai giao thức này có mối liên hệ chặt chẽ với nhau như thế nào.

### Khả năng của RTP

Các lợi ích chính của RTP xét về WebRTC bao gồm:

- Nói chung độ trễ thấp.
- Các gói được đánh số thứ tự và được đánh dấu thời gian để tập hợp lại nếu chúng đến không đúng thứ tự. Điều này cho phép dữ liệu được gửi bằng RTP được phân phối trên các phương tiện vận chuyển không đảm bảo đặt hàng hoặc thậm chí không đảm bảo việc giao hàng.
- Điều này có nghĩa là RTP có thể — nhưng không bắt buộc phải — được sử dụng trên {{Glossary("UDP")}} để có hiệu suất cũng như các tính năng ghép kênh và tổng kiểm tra của nó.
- RTP hỗ trợ phát đa hướng; mặc dù điều này chưa quan trọng đối với WebRTC, nhưng nó có thể sẽ quan trọng trong tương lai, khi WebRTC (hy vọng) được cải tiến để hỗ trợ các cuộc hội thoại nhiều người dùng.
- RTP không bị giới hạn sử dụng trong giao tiếp nghe nhìn. Nó có thể được sử dụng cho bất kỳ hình thức truyền dữ liệu liên tục hoặc hoạt động nào, bao gồm truyền dữ liệu, huy hiệu hoạt động hoặc cập nhật hiển thị trạng thái hoặc truyền tải thông tin điều khiển và đo lường.

### Những điều RTP không làm được

Bản thân RTP không cung cấp mọi tính năng có thể có, đó là lý do tại sao các giao thức khác cũng được WebRTC sử dụng. Một số điều đáng chú ý hơn RTP không bao gồm:

- RTP _not_ đảm bảo **[chất lượng dịch vụ](https://en.wikipedia.org/wiki/Quality-of-service)** (**QoS**).
- Mặc dù RTP được thiết kế để sử dụng trong các tình huống quan trọng về độ trễ nhưng nó vốn không cung cấp bất kỳ tính năng nào đảm bảo QoS. Thay vào đó, nó chỉ cung cấp thông tin cần thiết để cho phép QoS được triển khai ở nơi khác trong ngăn xếp.
- RTP không xử lý việc phân bổ hoặc đặt trước các tài nguyên có thể cần thiết.

Khi quan trọng đối với mục đích của WebRTC, những vấn đề này sẽ được xử lý ở nhiều nơi khác nhau trong cơ sở hạ tầng WebRTC. Ví dụ: RTCP xử lý việc giám sát QoS.

## RTCPeerConnection và RTPMỗi {{domxref("RTCPeerConnection")}} có các phương thức cung cấp quyền truy cập vào danh sách vận chuyển RTP phục vụ kết nối ngang hàng. Những điều này tương ứng với ba loại truyền tải sau được hỗ trợ bởi `RTCPeerConnection`

- {{domxref("RTCRtpSender")}}
  - : `RTCRtpSender`s xử lý việc mã hóa và truyền dữ liệu {{domxref("MediaStreamTrack")}} tới một thiết bị ngang hàng từ xa. Người gửi cho một kết nối nhất định có thể được lấy bằng cách gọi {{domxref("RTCPeerConnection.getSenders()")}}.
- {{domxref("RTCRtpReceiver")}}
  - : `RTCRtpReceiver`s cung cấp khả năng kiểm tra và lấy thông tin về dữ liệu `MediaStreamTrack` đến. Bạn có thể nhận được bộ thu của kết nối bằng cách gọi {{domxref("RTCPeerConnection.getReceivers()")}}.
- {{domxref("RTCRtpTransceiver")}}
  - : `RTCRtpTransceiver` là một cặp gồm một bên gửi RTP và một bên nhận RTP có chung thuộc tính SDP `mid`, có nghĩa là chúng chia sẻ cùng một dòng m phương tiện SDP (đại diện cho luồng SRTP hai chiều). Các giá trị này được trả về bằng phương thức {{domxref("RTCPeerConnection.getTransceivers()")}} và mỗi `mid` và bộ thu phát chia sẻ mối quan hệ một-một, trong đó `mid` là duy nhất cho mỗi `RTCPeerConnection`.

### Tận dụng RTP để triển khai tính năng "giữ"

Vì các luồng cho `RTCPeerConnection` được triển khai bằng RTP và giao diện [bên trên](#rtcpeerconnection_and_rtp) nên bạn có thể tận dụng quyền truy cập mà tính năng này mang lại cho bạn vào phần bên trong của luồng để thực hiện điều chỉnh. Một trong những điều đơn giản nhất bạn có thể làm là triển khai tính năng "giữ", trong đó người tham gia cuộc gọi có thể nhấp vào nút và tắt micrô của họ, bắt đầu gửi nhạc đến thiết bị ngang hàng khác và ngừng nhận âm thanh đến.

> [!LƯU Ý]
> Ví dụ này sử dụng các tính năng JavaScript hiện đại bao gồm [chức năng không đồng bộ](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) và biểu thức [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await). Điều này giúp đơn giản hóa rất nhiều và làm cho mã xử lý các lời hứa được trả về bằng các phương thức WebRTC trở nên dễ đọc hơn nhiều.

Trong các ví dụ bên dưới, chúng tôi sẽ coi thiết bị ngang hàng đang bật và tắt chế độ "giữ" là thiết bị ngang hàng cục bộ và người dùng được đặt ở trạng thái chờ là thiết bị ngang hàng từ xa.

#### Đang kích hoạt chế độ giữ

##### Máy ngang hàng cục bộ

Khi người dùng cục bộ quyết định bật chế độ giữ, phương thức `enableHold()` bên dưới sẽ được gọi. Nó chấp nhận đầu vào là {{domxref("MediaStream")}} chứa âm thanh để phát trong khi cuộc gọi đang chờ.

```js
async function enableHold(audioStream) {
  try {
    await audioTransceiver.sender.replaceTrack(audioStream.getAudioTracks()[0]);
    audioTransceiver.receiver.track.enabled = false;
    audioTransceiver.direction = "sendonly";
  } catch (err) {
    /* handle the error */
  }
}
```

Ba dòng mã trong khối [`try`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) thực hiện các bước sau:

1. Thay thế rãnh âm thanh đi ra bằng {{domxref("MediaStreamTrack")}} chứa nhạc chờ.
2. Tắt đoạn âm thanh đến.
3. Chuyển bộ thu phát âm thanh sang chế độ chỉ gửi.

Điều này kích hoạt việc đàm phán lại `RTCPeerConnection` bằng cách gửi cho nó một sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} mà mã của bạn sẽ phản hồi việc tạo ưu đãi SDP bằng cách sử dụng {{domxref("RTCPeerConnection.createOffer")}} và gửi nó qua máy chủ báo hiệu đến thiết bị ngang hàng từ xa.

`audioStream`, chứa âm thanh để phát thay vì âm thanh micrô của thiết bị ngang hàng cục bộ, có thể đến từ mọi nơi. Một khả năng là có phần tử {{HTMLElement("audio")}} ẩn và sử dụng {{domxref("HTMLMediaElement.captureStream", "HTMLAudioElement.captureStream()")}} để nhận luồng âm thanh của nó.

##### Máy ngang hàng từ xa

Trên thiết bị ngang hàng từ xa, khi chúng tôi nhận được ưu đãi SDP với hướng được đặt thành `"sendonly"`, chúng tôi sẽ xử lý ưu đãi đó bằng phương thức `holdRequested()`, phương thức này chấp nhận làm đầu vào chuỗi ưu đãi SDP.

```js
async function holdRequested(offer) {
  try {
    await peerConnection.setRemoteDescription(offer);
    await audioTransceiver.sender.replaceTrack(null);
    audioTransceiver.direction = "recvonly";
    await sendAnswer();
  } catch (err) {
    /* handle the error */
  }
}
```

Các bước được thực hiện ở đây là:1. Đặt mô tả từ xa thành `offer` được chỉ định bằng cách gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}}. 2. Thay thế rãnh {{domxref("RTCRtpSender")}} của bộ thu phát âm thanh bằng `null`, nghĩa là không có rãnh. Điều này dừng gửi âm thanh trên bộ thu phát. 3. Đặt thuộc tính {{domxref("RTCRtpTransceiver.direction", "direction")}} của bộ thu phát âm thanh thành `"recvonly"`, hướng dẫn bộ thu phát chỉ chấp nhận âm thanh và không gửi bất kỳ âm thanh nào. 4. Câu trả lời SDP được tạo và gửi bằng phương thức có tên `sendAnswer()`, phương thức này tạo ra câu trả lời bằng cách sử dụng {{domxref("RTCPeerConnection.createAnswer", "createAnswer()")}} sau đó gửi SDP kết quả đến thiết bị ngang hàng khác qua dịch vụ báo hiệu.

#### Tắt chế độ giữ

##### Máy ngang hàng cục bộ

Khi người dùng cục bộ nhấp vào tiện ích giao diện để tắt chế độ giữ, phương thức `disableHold()` sẽ được gọi để bắt đầu quá trình khôi phục chức năng bình thường.

```js
async function disableHold(micStream) {
  await audioTransceiver.sender.replaceTrack(micStream.getAudioTracks()[0]);
  audioTransceiver.receiver.track.enabled = true;
  audioTransceiver.direction = "sendrecv";
}
```

Điều này đảo ngược các bước được thực hiện trong `enableHold()` như sau:

1. Rãnh của `RTCRtpSender` của bộ thu phát âm thanh được thay thế bằng rãnh âm thanh đầu tiên của luồng được chỉ định.
2. Đường âm thanh đến của bộ thu phát được bật lại.
3. Hướng của bộ thu phát âm thanh được đặt thành `"sendrecv"`, cho biết rằng bộ thu phát sẽ quay lại cả gửi và nhận âm thanh truyền phát, thay vì chỉ gửi.

Giống như khi lệnh giữ được thực hiện, điều này sẽ kích hoạt thương lượng lại, dẫn đến việc mã của bạn gửi ưu đãi mới đến thiết bị ngang hàng ở xa.

##### Máy ngang hàng từ xa

Khi thiết bị từ xa nhận được ưu đãi `"sendrecv"`, nó sẽ gọi phương thức `holdEnded()` của nó:

```js
async function holdEnded(offer, micStream) {
  try {
    await peerConnection.setRemoteDescription(offer);
    await audioTransceiver.sender.replaceTrack(micStream.getAudioTracks()[0]);
    audioTransceiver.direction = "sendrecv";
    await sendAnswer();
  } catch (err) {
    /* handle the error */
  }
}
```

Các bước được thực hiện bên trong khối `try` ở đây là:

1. Ưu đãi đã nhận được lưu trữ dưới dạng mô tả từ xa bằng cách gọi `setRemoteDescription()`.
2. Phương thức {{domxref("RTCRtpSender.replaceTrack", "replaceTrack()")}} của bộ thu phát âm thanh được sử dụng để đặt rãnh âm thanh đi ra thành rãnh đầu tiên trong luồng âm thanh của micrô.
3. Hướng của bộ thu phát được đặt thành `"sendrecv"`, cho biết rằng bộ thu phát sẽ tiếp tục cả việc gửi và nhận âm thanh.

Từ thời điểm này trở đi, micrô được kết nối lại và người dùng từ xa một lần nữa có thể nghe thấy người dùng cục bộ cũng như nói chuyện với họ.

## Xem thêm

- [Kết nối WebRTC](/en-US/docs/Web/API/WebRTC_API/Connectivity)
- [Giới thiệu về giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
- [Thời gian tồn tại của phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
