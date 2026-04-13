---
title: Báo hiệu và gọi video
slug: Web/API/WebRTC_API/Signaling_and_video_calling
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

[WebRTC](/en-US/docs/Web/API/WebRTC_API) cho phép trao đổi phương tiện ngang hàng, theo thời gian thực giữa hai thiết bị. Kết nối được thiết lập thông qua quá trình khám phá và đàm phán được gọi là **báo hiệu**. Hướng dẫn này sẽ hướng dẫn bạn cách xây dựng cuộc gọi điện video hai chiều.

[WebRTC](/en-US/docs/Web/API/WebRTC_API) là công nghệ ngang hàng hoàn toàn để trao đổi âm thanh, video và dữ liệu theo thời gian thực, với một cảnh báo trung tâm. Một hình thức khám phá và đàm phán định dạng phương tiện phải diễn ra, [như đã thảo luận ở nơi khác](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#establishing_the_connection), để hai thiết bị trên các mạng khác nhau định vị được nhau. Quá trình này được gọi là **báo hiệu** và bao gồm cả hai thiết bị kết nối với máy chủ thứ ba được hai bên đồng ý. Thông qua máy chủ thứ ba này, hai thiết bị có thể định vị lẫn nhau và trao đổi tin nhắn đàm phán.

Trong bài viết này, chúng tôi sẽ nâng cao hơn nữa khả năng hỗ trợ mở cuộc gọi video hai chiều giữa những người dùng. Bạn cũng có thể [hãy thử ví dụ này trên Render](https://webrtc-from-chat.onrender.com) để thử nghiệm nó.
Bạn cũng có thể [nhìn vào toàn bộ dự án](https://github.com/bsmth/examples/tree/main/webrtc-from-chat) trên GitHub.

## Máy chủ báo hiệu

Việc thiết lập kết nối WebRTC giữa hai thiết bị yêu cầu sử dụng **máy chủ báo hiệu** để giải quyết cách kết nối chúng qua internet. Công việc của máy chủ báo hiệu là đóng vai trò trung gian để cho phép hai máy chủ tìm và thiết lập kết nối đồng thời giảm thiểu việc lộ thông tin cá nhân tiềm ẩn nhiều nhất có thể. Làm cách nào để tạo máy chủ này và quá trình báo hiệu thực sự hoạt động như thế nào?

Đầu tiên chúng ta cần chính máy chủ báo hiệu. WebRTC không chỉ định cơ chế truyền tải thông tin báo hiệu. Bạn có thể sử dụng bất cứ thứ gì bạn thích, từ [WebSocket](/en-US/docs/Web/API/WebSockets_API) đến {{domxref("Window/fetch", "fetch()")}} đến chim bồ câu đưa thư để trao đổi thông tin báo hiệu giữa hai đồng nghiệp.

Điều quan trọng cần lưu ý là máy chủ không cần hiểu hoặc giải thích nội dung dữ liệu báo hiệu. Mặc dù nó là {{Glossary("SDP")}}, nhưng điều này cũng không quá quan trọng: nội dung của tin nhắn đi qua máy chủ báo hiệu trên thực tế là một hộp đen. Điều quan trọng là khi hệ thống con {{Glossary("ICE")}} hướng dẫn bạn gửi dữ liệu báo hiệu đến thiết bị ngang hàng khác, bạn làm như vậy và thiết bị ngang hàng kia biết cách nhận thông tin này và gửi nó đến hệ thống con ICE của chính nó. Tất cả những gì bạn phải làm là chuyển thông tin qua lại. Nội dung hoàn toàn không quan trọng đối với máy chủ báo hiệu.

### Đang chuẩn bị máy chủ trò chuyện để báo hiệu

[máy chủ trò chuyện](https://github.com/mdn/samples-server/tree/master/s/websocket-chat) của chúng tôi sử dụng [API WebSocket](/en-US/docs/Web/API/WebSockets_API) để gửi thông tin dưới dạng chuỗi {{Glossary("JSON")}} giữa mỗi máy khách và máy chủ. Máy chủ hỗ trợ một số loại tin nhắn để xử lý các tác vụ, chẳng hạn như đăng ký người dùng mới, đặt tên người dùng và gửi tin nhắn trò chuyện công khai.

Để cho phép máy chủ hỗ trợ báo hiệu và đàm phán ICE, chúng ta cần cập nhật mã. Chúng tôi sẽ phải cho phép gửi tin nhắn trực tiếp đến một người dùng cụ thể thay vì phát tới tất cả người dùng được kết nối và đảm bảo các loại tin nhắn không được nhận dạng sẽ được chuyển qua và gửi mà máy chủ không cần biết chúng là gì. Điều này cho phép chúng tôi gửi tin nhắn báo hiệu bằng cùng một máy chủ này, thay vì cần một máy chủ riêng.

Chúng ta hãy xem những thay đổi mà chúng ta cần thực hiện đối với máy chủ trò chuyện để hỗ trợ tín hiệu WebRTC. Phần này nằm trong tệp [`chatserver.js`](https://github.com/bsmth/examples/blob/main/webrtc-from-chat/chat-server.js).

Đầu tiên là việc bổ sung hàm `sendToOneUser()`. Như tên cho thấy, thao tác này sẽ gửi một thông báo JSON được xâu chuỗi tới một tên người dùng cụ thể.

````js
function sendToOneUser(target, msgString) {
  connectionArray.find((conn) => conn.username === target).send(msgString);
}
```Hàm này lặp lại danh sách người dùng được kết nối cho đến khi tìm thấy tên người dùng phù hợp với tên người dùng đã chỉ định, sau đó gửi tin nhắn đến người dùng đó. Tham số `msgString` là một đối tượng JSON được xâu chuỗi. Chúng ta có thể làm cho nó nhận đối tượng tin nhắn ban đầu, nhưng trong ví dụ này thì cách này hiệu quả hơn. Vì tin nhắn đã được xâu chuỗi nên chúng tôi có thể gửi nó mà không cần xử lý thêm. Mỗi mục trong `connectionArray` là một đối tượng {{domxref("WebSocket")}}, vì vậy chúng ta chỉ cần gọi trực tiếp phương thức {{domxref("WebSocket.send", "send()")}} của nó.

Bản demo trò chuyện ban đầu của chúng tôi không hỗ trợ gửi tin nhắn đến một người dùng cụ thể. Nhiệm vụ tiếp theo là cập nhật trình xử lý thông báo WebSocket chính để hỗ trợ thực hiện việc đó. Điều này liên quan đến một thay đổi ở gần cuối trình xử lý thông báo `"connection"`:

```js
if (sendToClients) {
  const msgString = JSON.stringify(msg);

  if (msg.target && msg.target.length !== 0) {
    sendToOneUser(msg.target, msgString);
  } else {
    for (const connection of connectionArray) {
      connection.send(msgString);
    }
  }
}
````

Mã này bây giờ xem xét tin nhắn đang chờ xử lý để xem nó có thuộc tính `target` hay không. Nếu thuộc tính đó xuất hiện, nó sẽ chỉ định tên người dùng của ứng dụng khách sẽ gửi tin nhắn đến và chúng tôi gọi `sendToOneUser()` để gửi tin nhắn cho họ. Nếu không, tin nhắn sẽ được phát tới tất cả người dùng bằng cách lặp lại danh sách kết nối, gửi tin nhắn đến từng người dùng.

Vì mã hiện tại cho phép gửi các loại tin nhắn tùy ý nên không cần thay đổi bổ sung. Giờ đây, khách hàng của chúng tôi có thể gửi tin nhắn thuộc loại không xác định đến bất kỳ người dùng cụ thể nào, cho phép họ gửi tin nhắn báo hiệu qua lại theo ý muốn.

Đó là tất cả những gì chúng ta cần thay đổi ở phía máy chủ của phương trình. Bây giờ hãy xem xét giao thức báo hiệu mà chúng ta sẽ triển khai.

### Thiết kế giao thức báo hiệu

Bây giờ chúng ta đã xây dựng được cơ chế trao đổi tin nhắn, chúng ta cần một giao thức xác định những tin nhắn đó sẽ trông như thế nào. Điều này có thể được thực hiện theo một số cách; những gì được trình bày ở đây chỉ là một cách khả thi để cấu trúc các thông điệp báo hiệu.

Máy chủ của ví dụ này sử dụng các đối tượng JSON được xâu chuỗi để giao tiếp với các máy khách của nó. Điều này có nghĩa là các thông báo báo hiệu của chúng tôi sẽ ở định dạng JSON, với nội dung chỉ rõ loại thông báo cũng như mọi thông tin bổ sung cần thiết để xử lý thông báo đúng cách.

#### Trao đổi mô tả phiên

Khi bắt đầu quá trình báo hiệu, **ưu đãi** được tạo bởi người dùng bắt đầu cuộc gọi. Ưu đãi này bao gồm mô tả phiên, ở định dạng {{Glossary("SDP")}} và cần được gửi đến người dùng nhận mà chúng tôi sẽ gọi là **callee**. Người được gọi trả lời lời đề nghị bằng tin nhắn **answer**, cũng chứa mô tả SDP. Máy chủ báo hiệu của chúng tôi sẽ sử dụng WebSocket để truyền các tin nhắn ưu đãi có loại `"video-offer"` và trả lời các tin nhắn có loại `"video-answer"`. Những tin nhắn này có các trường sau:

- `type`
  - : Loại tin nhắn; `"video-offer"` hoặc `"video-answer"`.
- `name`
  - : Tên người dùng của người gửi.
- `target`
  - : Tên người dùng của người nhận mô tả (nếu người gọi đang gửi tin nhắn thì phần này chỉ định người được gọi và ngược lại).
- `sdp`
  - : Chuỗi SDP (Giao thức mô tả phiên) mô tả điểm cuối cục bộ của kết nối theo quan điểm của người gửi (hoặc điểm cuối từ xa của kết nối theo quan điểm của người nhận).

Tại thời điểm này, hai người tham gia biết [codec](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) và [thông số codec](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter) nào sẽ được sử dụng cho cuộc gọi này. Tuy nhiên, họ vẫn không biết cách truyền dữ liệu đa phương tiện. Đây là lúc {{Glossary('ICE', 'Interactive Connectivity Establishment (ICE)')}} xuất hiện.

### Trao đổi ứng viên ICEHai đồng nghiệp cần trao đổi ứng viên ICE để đàm phán kết nối thực tế giữa họ. Mỗi ứng viên ICE mô tả một phương thức mà thiết bị gửi có thể sử dụng để liên lạc. Mỗi đồng nghiệp gửi ứng viên theo thứ tự họ được phát hiện và tiếp tục gửi ứng viên cho đến khi hết đề xuất, ngay cả khi phương tiện truyền thông đã bắt đầu phát trực tuyến

Một sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} được gửi đến {{domxref("RTCPeerConnection")}} để hoàn tất quá trình thêm mô tả cục bộ bằng `pc.setLocalDescription(offer)`.

Sau khi hai đồng nghiệp đồng ý về một ứng cử viên tương thích lẫn nhau, SDP của ứng cử viên đó sẽ được mỗi đồng nghiệp sử dụng để xây dựng và mở kết nối, qua đó phương tiện truyền thông sẽ bắt đầu truyền đi. Nếu sau đó họ đồng ý về một ứng viên tốt hơn (thường có hiệu suất cao hơn), luồng có thể thay đổi định dạng nếu cần.

Mặc dù hiện không được hỗ trợ, nhưng về mặt lý thuyết, một ứng cử viên nhận được sau khi phương tiện đã được truyền cũng có thể được sử dụng để hạ cấp xuống kết nối băng thông thấp hơn nếu cần.

Mỗi ứng cử viên ICE được gửi đến thiết bị ngang hàng khác bằng cách gửi tin nhắn JSON thuộc loại `"new-ice-candidate"` qua máy chủ báo hiệu tới thiết bị ngang hàng từ xa. Mỗi tin nhắn ứng viên bao gồm các trường sau:

- `type`
  - : Loại thông báo: `"new-ice-candidate"`.
- `target`
  - : Tên người dùng của người đang tiến hành đàm phán; máy chủ sẽ chỉ gửi tin nhắn đến người dùng này.
- `candidate`
  - : Chuỗi ứng cử viên SDP, mô tả phương thức kết nối được đề xuất. Bạn thường không cần xem nội dung của chuỗi này. Tất cả những gì mã của bạn cần làm là định tuyến nó đến thiết bị ngang hàng từ xa bằng máy chủ báo hiệu.

Mỗi thông báo ICE đề xuất một giao thức liên lạc (TCP hoặc UDP), địa chỉ IP, số cổng, loại kết nối (ví dụ: IP được chỉ định là máy ngang hàng hay máy chủ chuyển tiếp), cùng với các thông tin khác cần thiết để liên kết hai máy tính với nhau. Điều này bao gồm NAT hoặc độ phức tạp mạng khác.

> [!LƯU Ý]
> Điều quan trọng cần lưu ý là: điều duy nhất mà mã của bạn chịu trách nhiệm trong quá trình đàm phán ICE là chấp nhận các ứng cử viên gửi đi từ lớp ICE và gửi chúng qua kết nối báo hiệu đến thiết bị ngang hàng khác khi trình xử lý {{domxref("RTCPeerConnection.icecandidate_event", "onicecandidate")}} của bạn được thực thi và nhận các tin nhắn ứng cử viên ICE từ máy chủ báo hiệu (khi nhận được thông báo `"new-ice-candidate"`) và gửi chúng đến lớp ICE của bạn bằng cách gọi {{domxref("RTCPeerConnection.addIceCandidate()")}}. Thế thôi.
>
> Nội dung của SDP về cơ bản không liên quan đến bạn trong mọi trường hợp. Tránh cố gắng làm cho vấn đề trở nên phức tạp hơn cho đến khi bạn thực sự biết mình đang làm gì. Cách đó là sự điên rồ.

Tất cả những gì máy chủ báo hiệu của bạn bây giờ cần làm là gửi tin nhắn mà nó yêu cầu. Quy trình làm việc của bạn cũng có thể yêu cầu chức năng đăng nhập/xác thực, nhưng các chi tiết đó sẽ khác nhau.

> [!LƯU Ý]
> Sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "onicecandidate")}} và Lời hứa {{domxref("RTCPeerConnection.createAnswer", "createAnswer()")}} đều là các lệnh gọi không đồng bộ được xử lý riêng. Hãy chắc chắn rằng tín hiệu của bạn không thay đổi thứ tự! Ví dụ: {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} với ứng viên băng của máy chủ phải được gọi sau khi đặt câu trả lời bằng {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}.

### Luồng giao dịch báo hiệu

Quá trình báo hiệu bao gồm việc trao đổi tin nhắn giữa hai thiết bị ngang hàng bằng cách sử dụng một máy chủ trung gian, máy chủ báo hiệu. Tất nhiên, quy trình chính xác sẽ khác nhau, nhưng nói chung có một số điểm chính để xử lý các thông báo báo hiệu:

- Mỗi client của người dùng chạy trong một trình duyệt web
- Trình duyệt web của mỗi người dùng
- Máy chủ báo hiệu
- Máy chủ web lưu trữ dịch vụ trò chuyệnHãy tưởng tượng rằng Naomi và Priya đang thảo luận bằng phần mềm trò chuyện và Naomi quyết định mở cuộc gọi điện video giữa hai người. Đây là chuỗi sự kiện dự kiến:

![Sơ đồ quá trình truyền tín hiệu](webrtc_-_signaling_diagram.svg)

Chúng ta sẽ thấy điều này chi tiết hơn trong suốt bài viết này.

### Quy trình trao đổi ứng viên ICE

Khi lớp ICE của mỗi máy ngang hàng bắt đầu gửi ứng viên, nó sẽ tham gia trao đổi giữa các điểm khác nhau trong chuỗi trông như thế này:

![Sơ đồ quy trình trao đổi ứng viên ICE](webrtc_-_ice_candidate_exchange.svg)

Mỗi bên gửi ứng viên cho bên kia khi nhận được họ từ lớp ICE địa phương của họ; không có việc thay phiên nhau hoặc chia đợt thí sinh. Ngay sau khi hai bên đồng ý về một ứng cử viên mà cả hai có thể sử dụng để trao đổi phương tiện, phương tiện truyền thông bắt đầu chảy. Mỗi đồng nghiệp tiếp tục gửi ứng viên cho đến khi hết lựa chọn, ngay cả sau khi phương tiện truyền thông đã bắt đầu chảy. Điều này được thực hiện với hy vọng xác định được các lựa chọn thậm chí còn tốt hơn so với lựa chọn ban đầu.

Nếu các điều kiện thay đổi (ví dụ: kết nối mạng kém đi), một hoặc cả hai thiết bị ngang hàng có thể đề xuất chuyển sang độ phân giải phương tiện có băng thông thấp hơn hoặc sang một codec thay thế. Điều đó kích hoạt một cuộc trao đổi ứng viên mới, sau đó một định dạng phương tiện và/hoặc thay đổi codec khác có thể diễn ra. Trong hướng dẫn [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs) bạn có thể tìm hiểu thêm về các codec mà WebRTC yêu cầu trình duyệt hỗ trợ, các codec bổ sung được trình duyệt nào hỗ trợ và cách chọn các codec tốt nhất để sử dụng.

Tùy ý, hãy xem {{RFC(8445, "Interactive Connectivity Establishment")}}, [phần 2.3 ("Đàm phán các cặp ứng viên và kết thúc ICE")](https://datatracker.ietf.org/doc/html/rfc5245#section-2.3) nếu bạn muốn hiểu rõ hơn về cách hoàn tất quá trình này bên trong lớp ICE. Bạn nên lưu ý rằng các ứng viên được trao đổi và phương tiện bắt đầu truyền ngay khi lớp ICE được đáp ứng. Tất cả điều này được chăm sóc đằng sau hậu trường. Vai trò của chúng tôi là gửi các ứng viên qua lại thông qua máy chủ báo hiệu.

## Ứng dụng khách

Cốt lõi của bất kỳ quá trình báo hiệu nào là việc xử lý thông điệp của nó. Không cần thiết phải sử dụng WebSockets để báo hiệu nhưng đó là một giải pháp phổ biến. Tất nhiên, bạn nên chọn một cơ chế trao đổi thông tin báo hiệu phù hợp với ứng dụng của mình.

Hãy cập nhật ứng dụng trò chuyện để hỗ trợ gọi video.

### Cập nhật HTML

HTML dành cho khách hàng của chúng tôi cần một vị trí để hiển thị video. Điều này yêu cầu các phần tử video và một nút để kết thúc cuộc gọi:

```html
<div class="flexChild" id="camera-container">
  <div class="camera-box">
    <video id="received_video" autoplay></video>
    <video id="local_video" autoplay muted></video>
    <button id="hangup-button" disabled>Hang Up</button>
  </div>
</div>
```

```js
document.getElementById("hangup-button").addEventListener("click", hangUpCall);
```

Cấu trúc trang được xác định ở đây đang sử dụng các phần tử {{HTMLElement("div")}}, cho phép chúng tôi toàn quyền kiểm soát bố cục trang bằng cách cho phép sử dụng CSS. Chúng tôi sẽ bỏ qua chi tiết bố cục trong hướng dẫn này nhưng [hãy xem CSS](https://github.com/bsmth/examples/blob/main/webrtc-from-chat/chat.css) trên GitHub để xem cách chúng tôi xử lý nó. Hãy lưu ý đến hai phần tử {{HTMLElement("video")}}, một phần tử để bạn tự xem, một phần tử dành cho kết nối và phần tử {{HTMLElement("button")}}.

Phần tử `<video>` có `id` `received_video` sẽ hiển thị video nhận được từ người dùng được kết nối. Chúng tôi chỉ định thuộc tính `autoplay` để đảm bảo khi video bắt đầu đến, video sẽ phát ngay lập tức. Điều này loại bỏ mọi nhu cầu xử lý rõ ràng việc phát lại trong mã của chúng tôi. Phần tử `local_video` `<video>` hiển thị bản xem trước của máy ảnh của người dùng; chỉ định thuộc tính `muted` vì chúng tôi không cần nghe âm thanh cục bộ trong bảng xem trước này.

Cuối cùng, `hangup-button` {{HTMLElement("button")}}, để ngắt kết nối khỏi cuộc gọi, được xác định và định cấu hình để tắt bắt đầu (đặt cài đặt này làm mặc định của chúng tôi khi không có cuộc gọi nào được kết nối) và áp dụng chức năng `hangUpCall()` khi nhấp chuột. Vai trò của chức năng này là kết thúc cuộc gọi và gửi thông báo máy chủ báo hiệu đến thiết bị ngang hàng khác, yêu cầu nó cũng đóng.

### Mã JavaScriptChúng tôi sẽ chia mã này thành các vùng chức năng để mô tả cách thức hoạt động của nó dễ dàng hơn. Phần chính của mã này nằm trong hàm `connect()`: nó mở máy chủ {{domxref("WebSocket")}} trên cổng 6503 và thiết lập trình xử lý để nhận tin nhắn ở định dạng đối tượng JSON. Mã này thường xử lý tin nhắn trò chuyện văn bản như trước đây

#### Gửi tin nhắn đến máy chủ báo hiệu

Trong suốt mã của chúng tôi, chúng tôi gọi `sendToServer()` để gửi tin nhắn đến máy chủ báo hiệu. Hàm này sử dụng kết nối [WebSocket](/en-US/docs/Web/API/WebSockets_API) để thực hiện công việc của nó:

```js
function sendToServer(msg) {
  const msgJSON = JSON.stringify(msg);

  connection.send(msgJSON);
}
```

Đối tượng tin nhắn được truyền vào hàm này được chuyển đổi thành chuỗi JSON bằng cách gọi {{jsxref("JSON.stringify()")}}, sau đó chúng ta gọi hàm {{domxref("WebSocket.send", "send()")}} của kết nối WebSocket để truyền tin nhắn đến máy chủ.

#### Giao diện người dùng để bắt đầu cuộc gọi

Mã xử lý tin nhắn `"user-list"` gọi `handleUserListMsg()`. Ở đây chúng tôi thiết lập trình xử lý cho từng người dùng được kết nối trong danh sách người dùng được hiển thị ở bên trái bảng trò chuyện. Hàm này nhận một đối tượng tin nhắn có thuộc tính `users` là một mảng các chuỗi chỉ định tên người dùng của mọi người dùng được kết nối.

```js
function handleUserListMsg(msg) {
  const listElem = document.querySelector(".user-list-box");

  while (listElem.firstChild) {
    listElem.removeChild(listElem.firstChild);
  }

  msg.users.forEach((username) => {
    const item = document.createElement("li");
    item.appendChild(document.createTextNode(username));
    item.addEventListener("click", invite);

    listElem.appendChild(item);
  });
}
```

Sau khi nhận được tham chiếu đến {{HTMLElement("ul")}} chứa danh sách tên người dùng vào biến `listElem`, chúng tôi làm trống danh sách bằng cách xóa từng phần tử con của nó.

> [!LƯU Ý]
> Rõ ràng, sẽ hiệu quả hơn nếu cập nhật danh sách bằng cách thêm và xóa từng người dùng thay vì xây dựng lại toàn bộ danh sách mỗi khi danh sách thay đổi, nhưng điều này đủ tốt cho mục đích của ví dụ này.

Sau đó, chúng tôi lặp lại mảng tên người dùng bằng cách sử dụng {{jsxref("Array.forEach", "forEach()")}}. Đối với mỗi tên, chúng tôi tạo một phần tử {{HTMLElement("li")}} mới, sau đó tạo một nút văn bản mới chứa tên người dùng bằng {{domxref("Document.createTextNode", "createTextNode()")}}. Nút văn bản đó được thêm vào dưới dạng phần tử con của phần tử `<li>`. Tiếp theo, chúng tôi đặt trình xử lý cho sự kiện {{domxref("Element/click_event", "click")}} trên mục danh sách, việc nhấp vào tên người dùng sẽ gọi phương thức `invite()` của chúng tôi mà chúng tôi sẽ xem xét trong phần tiếp theo.

Cuối cùng, chúng tôi thêm mục mới vào `<ul>` chứa tất cả tên người dùng.

#### Bắt đầu cuộc gọi

Khi người dùng nhấp vào tên người dùng mà họ muốn gọi, hàm `invite()` sẽ được gọi làm trình xử lý sự kiện cho sự kiện {{domxref("Element/click_event", "click")}} đó:

```js
const mediaConstraints = {
  audio: true, // We want an audio track
  video: true, // And we want a video track
};

function invite(evt) {
  if (myPeerConnection) {
    alert("You can't start a call because you already have one open!");
  } else {
    const clickedUsername = evt.target.textContent;

    if (clickedUsername === myUsername) {
      alert(
        "I'm afraid I can't let you talk to yourself. That would be weird.",
      );
      return;
    }

    targetUsername = clickedUsername;
    createPeerConnection();

    navigator.mediaDevices
      .getUserMedia(mediaConstraints)
      .then((localStream) => {
        document.getElementById("local_video").srcObject = localStream;
        localStream
          .getTracks()
          .forEach((track) => myPeerConnection.addTrack(track, localStream));
      })
      .catch(handleGetUserMediaError);
  }
}
```

Việc này bắt đầu bằng việc kiểm tra tình trạng cơ bản: người dùng đã kết nối chưa? Nếu đã có {{domxref("RTCPeerConnection")}} thì rõ ràng là họ không thể thực hiện cuộc gọi. Sau đó, tên của người dùng được nhấp vào sẽ được lấy từ thuộc tính {{domxref("Node.textContent", "textContent")}} của mục tiêu sự kiện và chúng tôi kiểm tra để chắc chắn rằng đó không phải là người dùng đang cố gắng bắt đầu cuộc gọi.

Sau đó, chúng tôi sao chép tên của người dùng mà chúng tôi đang gọi vào biến `targetUsername` và gọi `createPeerConnection()`, một hàm sẽ tạo và thực hiện cấu hình cơ bản của {{domxref("RTCPeerConnection")}}.

Khi `RTCPeerConnection` đã được tạo, chúng tôi yêu cầu quyền truy cập vào máy ảnh và micrô của người dùng bằng cách gọi {{domxref("MediaDevices.getUserMedia()")}}, được hiển thị cho chúng tôi thông qua thuộc tính {{domxref("MediaDevices.getUserMedia")}}. Khi điều này thành công, thực hiện lời hứa được trả lại, trình xử lý `then` của chúng tôi sẽ được thực thi. Nó nhận làm đầu vào một đối tượng {{domxref("MediaStream")}} đại diện cho luồng có âm thanh từ micrô của người dùng và video từ webcam của họ.> [!LƯU Ý]

> Chúng tôi có thể hạn chế tập hợp đầu vào phương tiện được phép ở một thiết bị hoặc một nhóm thiết bị cụ thể bằng cách gọi {{domxref("MediaDevices.enumerateDevices", "navigator.mediaDevices.enumerateDevices()")}} để nhận danh sách thiết bị, lọc danh sách kết quả dựa trên tiêu chí mong muốn của chúng tôi, sau đó sử dụng các giá trị {{domxref("MediaTrackConstraints.deviceId", "deviceId")}} của thiết bị đã chọn trong trường `deviceId` của đối tượng `mediaConstraints` được chuyển vào `getUserMedia()`. Trong thực tế, điều này hiếm khi cần thiết vì hầu hết công việc đó được thực hiện cho bạn bởi `getUserMedia()`.

Chúng tôi đính kèm luồng đến vào phần tử xem trước cục bộ {{HTMLElement("video")}} bằng cách đặt thuộc tính {{domxref("HTMLMediaElement.srcObject", "srcObject")}} của phần tử. Vì phần tử được định cấu hình để tự động phát video đến nên luồng sẽ bắt đầu phát trong hộp xem trước cục bộ của chúng tôi.

Sau đó, chúng tôi lặp lại các bản nhạc trong luồng, gọi {{domxref("RTCPeerConnection.addTrack", "addTrack()")}} để thêm từng bản nhạc vào `RTCPeerConnection`. Mặc dù kết nối chưa được thiết lập đầy đủ nhưng bạn có thể bắt đầu gửi dữ liệu khi cảm thấy thích hợp để làm như vậy. Phương tiện nhận được trước khi quá trình đàm phán ICE hoàn tất có thể được sử dụng để giúp ICE quyết định phương pháp kết nối tốt nhất cần thực hiện, từ đó hỗ trợ quá trình đàm phán.

Lưu ý rằng đối với các ứng dụng gốc, chẳng hạn như ứng dụng điện thoại, bạn không nên bắt đầu gửi cho đến khi kết nối được chấp nhận ở cả hai đầu, ở mức tối thiểu, để tránh vô tình gửi dữ liệu video và/hoặc âm thanh khi người dùng chưa chuẩn bị sẵn sàng.

Ngay sau khi phương tiện được gắn vào `RTCPeerConnection`, sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} sẽ được kích hoạt tại kết nối để có thể bắt đầu đàm phán ICE.

Nếu xảy ra lỗi trong khi cố gắng lấy luồng phương tiện cục bộ, mệnh đề bắt của chúng tôi sẽ gọi `handleGetUserMediaError()`, hiển thị lỗi thích hợp cho người dùng theo yêu cầu.

#### Xử lý lỗi getUserMedia()

Nếu lời hứa được trả về bởi `getUserMedia()` kết thúc thất bại, thì hàm `handleGetUserMediaError()` của chúng tôi sẽ thực hiện.

```js
function handleGetUserMediaError(e) {
  switch (e.name) {
    case "NotFoundError":
      alert(
        "Unable to open your call because no camera and/or microphone" +
          "were found.",
      );
      break;
    case "SecurityError":
    case "PermissionDeniedError":
      // Do nothing; this is the same as the user canceling the call.
      break;
    default:
      alert(`Error opening your camera and/or microphone: ${e.message}`);
      break;
  }

  closeVideoCall();
}
```

Một thông báo lỗi được hiển thị trong mọi trường hợp ngoại trừ một trường hợp. Trong ví dụ này, chúng tôi bỏ qua kết quả `"SecurityError"` và `"PermissionDeniedError"`, coi việc từ chối cấp quyền sử dụng phần cứng phương tiện giống như việc người dùng hủy cuộc gọi.

Bất kể lý do tại sao nỗ lực nhận luồng không thành công, chúng tôi gọi hàm `closeVideoCall()` để tắt {{domxref("RTCPeerConnection")}} và giải phóng mọi tài nguyên đã được phân bổ trong quá trình thực hiện cuộc gọi. Mã này được thiết kế để xử lý an toàn các cuộc gọi được bắt đầu một phần.

#### Tạo kết nối ngang hàng

Hàm `createPeerConnection()` được cả người gọi và người được gọi sử dụng để xây dựng các đối tượng {{domxref("RTCPeerConnection")}}, các đầu tương ứng của kết nối WebRTC. Nó được gọi bởi `invite()` khi người gọi cố gắng bắt đầu cuộc gọi và bởi `handleVideoOfferMsg()` khi người được gọi nhận được tin nhắn ưu đãi từ người gọi.

```js
function createPeerConnection() {
  myPeerConnection = new RTCPeerConnection({
    iceServers: [
      // Information about ICE servers - Use your own!
      {
        urls: "stun:stun.stunprotocol.org",
      },
    ],
  });

  myPeerConnection.onicecandidate = handleICECandidateEvent;
  myPeerConnection.ontrack = handleTrackEvent;
  myPeerConnection.onnegotiationneeded = handleNegotiationNeededEvent;
  myPeerConnection.onremovetrack = handleRemoveTrackEvent;
  myPeerConnection.oniceconnectionstatechange =
    handleICEConnectionStateChangeEvent;
  myPeerConnection.onicegatheringstatechange =
    handleICEGatheringStateChangeEvent;
  myPeerConnection.onsignalingstatechange = handleSignalingStateChangeEvent;
}
```

Khi sử dụng hàm tạo {{domxref("RTCPeerConnection.RTCPeerConnection", "RTCPeerConnection()")}}, chúng ta sẽ chỉ định một đối tượng cung cấp các tham số cấu hình cho kết nối. Chúng tôi chỉ sử dụng một trong số này trong ví dụ này: `iceServers`. Đây là một mảng các đối tượng mô tả các máy chủ STUN và/hoặc TURN cho lớp {{Glossary("ICE")}} để sử dụng khi cố gắng thiết lập tuyến đường giữa người gọi và người được gọi. Các máy chủ này được sử dụng để xác định tuyến đường và giao thức tốt nhất để sử dụng khi liên lạc giữa các máy chủ ngang hàng, ngay cả khi chúng ở phía sau tường lửa hoặc sử dụng {{Glossary("NAT")}}.

> [!LƯU Ý]
> Bạn phải luôn sử dụng máy chủ STUN/TURN mà bạn sở hữu hoặc bạn có quyền sử dụng cụ thể. Ví dụ này đang sử dụng máy chủ STUN công cộng đã biết nhưng lạm dụng chúng là một hình thức xấu.Mỗi đối tượng trong `iceServers` chứa ít nhất một trường `urls` cung cấp các URL mà tại đó có thể truy cập máy chủ được chỉ định. Nó cũng có thể cung cấp các giá trị `username` và `credential` để cho phép xác thực diễn ra, nếu cần.

Sau khi tạo {{domxref("RTCPeerConnection")}}, chúng tôi thiết lập trình xử lý cho các sự kiện quan trọng đối với chúng tôi.

Ba trình xử lý sự kiện đầu tiên là bắt buộc; bạn phải xử lý chúng để thực hiện bất kỳ điều gì liên quan đến phương tiện truyền phát trực tuyến bằng WebRTC. Phần còn lại không bắt buộc phải có nhưng có thể hữu ích và chúng ta sẽ khám phá chúng. Có một vài sự kiện khác có sẵn mà chúng tôi không sử dụng trong ví dụ này. Dưới đây là bản tóm tắt về từng trình xử lý sự kiện mà chúng tôi sẽ triển khai:

- {{domxref("RTCPeerConnection.icecandidate_event", "onicecandidate")}}
  - : Lớp ICE cục bộ gọi trình xử lý sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} của bạn, khi nó cần bạn truyền một ứng cử viên ICE đến thiết bị ngang hàng khác, thông qua máy chủ báo hiệu của bạn. Xem [Gửi ứng viên ICE](#sending_ice_candidates) để biết thêm thông tin và xem mã cho ví dụ này.
- {{domxref("RTCPeerConnection.track_event", "ontrack")}}
  - : Trình xử lý này cho sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} được lớp WebRTC cục bộ gọi khi một bản nhạc được thêm vào kết nối. Điều này cho phép bạn kết nối phương tiện đến với một phần tử để hiển thị nó chẳng hạn. Xem [Nhận luồng mới](#receiving_new_streams) để biết chi tiết.
- {{domxref("RTCPeerConnection.negotiationneeded_event", "onnegotiationneeded")}}
  - : Chức năng này được gọi bất cứ khi nào cơ sở hạ tầng WebRTC cần bạn bắt đầu lại quá trình đàm phán phiên. Công việc của nó là tạo và gửi một lời đề nghị đến người được gọi, yêu cầu họ kết nối với chúng tôi. Xem [Bắt đầu đàm phán](#starting_negotiation) để biết cách chúng tôi xử lý vấn đề này.
- {{domxref("RTCPeerConnection.removetrack_event", "onremovetrack")}}
  - : Bản sao này của `ontrack` được gọi để xử lý sự kiện {{domxref("MediaStream/removetrack_event", "removetrack")}}; nó được gửi đến `RTCPeerConnection` khi thiết bị ngang hàng từ xa xóa một bản nhạc khỏi phương tiện được gửi. Xem [Xử lý việc xóa dấu vết](#handling_the_removal_of_tracks).
- {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "oniceconnectionstatechange")}}
  - : Sự kiện {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}} được gửi bởi lớp ICE để cho bạn biết về những thay đổi đối với trạng thái kết nối ICE. Điều này có thể giúp bạn biết khi nào kết nối bị lỗi hoặc bị mất. Chúng ta sẽ xem mã cho ví dụ này trong [Trạng thái kết nối ICE](#ice_connection_state) bên dưới.
- {{domxref("RTCPeerConnection.icegatheringstatechange_event", "onicegatheringstatechange")}}
  - : Lớp ICE gửi cho bạn sự kiện {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}, khi quá trình thu thập ứng viên của đại lý ICE thay đổi, từ trạng thái này sang trạng thái khác (chẳng hạn như bắt đầu thu thập ứng viên hoặc hoàn tất đàm phán). Xem [Trạng thái thu thập ICE](#ice_gathering_state) bên dưới.
- {{domxref("RTCPeerConnection.signalingstatechange_event", "onsignalingstatechange")}}
  - : Cơ sở hạ tầng WebRTC gửi cho bạn thông báo {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}} khi trạng thái của quá trình báo hiệu thay đổi (hoặc nếu kết nối đến máy chủ báo hiệu thay đổi). Xem [Trạng thái báo hiệu](#ice_signaling_state) để xem mã của chúng tôi.

#### Bắt đầu đàm phán

Sau khi người gọi đã tạo {{domxref("RTCPeerConnection")}}, tạo luồng phương tiện và thêm các bản nhạc của nó vào kết nối như được hiển thị trong [Bắt đầu cuộc gọi](#starting_a_call), trình duyệt sẽ gửi sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} tới {{domxref("RTCPeerConnection")}} để cho biết rằng nó đã sẵn sàng bắt đầu đàm phán với thiết bị ngang hàng khác. Đây là mã của chúng tôi để xử lý sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}:

```js
function handleNegotiationNeededEvent() {
  myPeerConnection
    .createOffer()
    .then((offer) => myPeerConnection.setLocalDescription(offer))
    .then(() => {
      sendToServer({
        name: myUsername,
        target: targetUsername,
        type: "video-offer",
        sdp: myPeerConnection.localDescription,
      });
    })
    .catch(window.reportError);
}
```

Để bắt đầu quá trình đàm phán, chúng tôi cần tạo và gửi ưu đãi SDP đến thiết bị ngang hàng mà chúng tôi muốn kết nối. Ưu đãi này bao gồm danh sách các cấu hình được hỗ trợ cho kết nối, bao gồm thông tin về luồng phương tiện mà chúng tôi đã thêm vào kết nối cục bộ (nghĩa là video mà chúng tôi muốn gửi đến đầu bên kia của cuộc gọi) và mọi ứng cử viên ICE đã được lớp ICE thu thập. Chúng tôi tạo ưu đãi này bằng cách gọi {{domxref("RTCPeerConnection.createOffer", "myPeerConnection.createOffer()")}}.

Khi `createOffer()` thành công (thực hiện lời hứa), chúng tôi chuyển thông tin ưu đãi đã tạo vào {{domxref("RTCPeerConnection.setLocalDescription", "myPeerConnection.setLocalDescription()")}} để định cấu hình kết nối và trạng thái cấu hình phương tiện cho điểm cuối kết nối của người gọi.

> [!LƯU Ý]
> Về mặt kỹ thuật, chuỗi được trả về bởi `createOffer()` là một ưu đãi {{RFC(3264)}}.Chúng tôi biết mô tả là hợp lệ và đã được đặt khi lời hứa được trả về bởi `setLocalDescription()` được thực hiện. Đây là khi chúng tôi gửi ưu đãi của mình cho đối tác ngang hàng khác bằng cách tạo một tin nhắn `"video-offer"` mới chứa mô tả cục bộ (hiện giống với ưu đãi), sau đó gửi nó qua máy chủ báo hiệu của chúng tôi tới người được gọi. Ưu đãi có các thành viên sau:

- `type`
  - : Loại tin nhắn: `"video-offer"`.
- `name`
  - : Tên người dùng của người gọi.
- `target`
  - : Tên của người dùng chúng tôi muốn gọi.
- `sdp`
  - : Chuỗi SDP mô tả ưu đãi.

Nếu xảy ra lỗi, trong `createOffer()` ban đầu hoặc trong bất kỳ trình xử lý thực hiện nào tiếp theo, lỗi sẽ được báo cáo bằng cách gọi hàm `window.reportError()` của chúng tôi.

Sau khi trình xử lý thực hiện của `setLocalDescription()` chạy, tác nhân ICE bắt đầu gửi các sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} đến {{domxref("RTCPeerConnection")}}, một sự kiện cho mỗi cấu hình tiềm năng mà nó phát hiện. Trình xử lý của chúng tôi cho sự kiện `icecandidate` chịu trách nhiệm truyền các ứng cử viên sang thiết bị ngang hàng khác.

#### Phiên đàm phán

Bây giờ chúng ta đã bắt đầu đàm phán với đối tác ngang hàng khác và đã chuyển một lời đề nghị, hãy xem điều gì sẽ xảy ra ở phía bên nhận cuộc gọi trong một thời gian. Người được gọi nhận được ưu đãi và gọi hàm `handleVideoOfferMsg()` để xử lý. Hãy xem cách callee xử lý tin nhắn `"video-offer"` như thế nào.

##### Xử lý lời mời

Khi ưu đãi đến, chức năng `handleVideoOfferMsg()` của người được gọi sẽ được gọi với tin nhắn `"video-offer"` đã nhận được. Chức năng này cần phải làm hai việc. Đầu tiên, nó cần tạo {{domxref("RTCPeerConnection")}} của riêng mình và thêm các bản nhạc chứa âm thanh và video từ micrô và webcam của nó vào đó. Thứ hai, nó cần xử lý lời đề nghị nhận được, xây dựng và gửi câu trả lời.

```js
function handleVideoOfferMsg(msg) {
  let localStream = null;

  targetUsername = msg.name;
  createPeerConnection();

  const desc = new RTCSessionDescription(msg.sdp);

  myPeerConnection
    .setRemoteDescription(desc)
    .then(() => navigator.mediaDevices.getUserMedia(mediaConstraints))
    .then((stream) => {
      localStream = stream;
      document.getElementById("local_video").srcObject = localStream;

      localStream
        .getTracks()
        .forEach((track) => myPeerConnection.addTrack(track, localStream));
    })
    .then(() => myPeerConnection.createAnswer())
    .then((answer) => myPeerConnection.setLocalDescription(answer))
    .then(() => {
      const msg = {
        name: myUsername,
        target: targetUsername,
        type: "video-answer",
        sdp: myPeerConnection.localDescription,
      };

      sendToServer(msg);
    })
    .catch(handleGetUserMediaError);
}
```

Mã này rất giống với những gì chúng ta đã làm trong hàm `invite()` trong [Bắt đầu cuộc gọi](#starting_a_call). Quá trình này bắt đầu bằng cách tạo và định cấu hình {{domxref("RTCPeerConnection")}} bằng hàm `createPeerConnection()` của chúng tôi. Sau đó, nó nhận ưu đãi SDP từ tin nhắn `"video-offer"` đã nhận và sử dụng nó để tạo đối tượng {{domxref("RTCSessionDescription")}} mới đại diện cho mô tả phiên của người gọi.

Mô tả phiên đó sau đó được chuyển vào {{domxref("RTCPeerConnection.setRemoteDescription", "myPeerConnection.setRemoteDescription()")}}. Điều này thiết lập đề nghị nhận được dưới dạng mô tả về điểm cuối kết nối từ xa (của người gọi). Nếu điều này thành công, trình xử lý thực hiện lời hứa (trong mệnh đề `then()`) sẽ bắt đầu quá trình truy cập vào máy ảnh và micrô của người được gọi bằng cách sử dụng {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}, thêm bản nhạc vào kết nối, v.v., như chúng ta đã thấy trước đây trong `invite()`.

Khi câu trả lời đã được tạo bằng cách sử dụng {{domxref("RTCPeerConnection.createAnswer", "myPeerConnection.createAnswer()")}}, mô tả về đầu cuối cục bộ của kết nối được đặt thành SDP của câu trả lời bằng cách gọi {{domxref("RTCPeerConnection.setLocalDescription", "myPeerConnection.setLocalDescription()")}}, sau đó câu trả lời sẽ được truyền qua máy chủ báo hiệu tới người gọi để cho họ biết câu trả lời là gì.

Mọi lỗi đều được phát hiện và chuyển đến `handleGetUserMediaError()`, được mô tả trong [Xử lý lỗi getUserMedia()](#handling_getusermedia_errors).

> [!LƯU Ý]
> Giống như trường hợp của phương thức gọi, sau khi trình xử lý thực hiện `setLocalDescription()` chạy, trình duyệt sẽ bắt đầu kích hoạt {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} sự kiện mà phương thức gọi phải xử lý, một sự kiện cho mỗi ứng viên cần được truyền đến thiết bị ngang hàng từ xa.

Cuối cùng, bên gọi xử lý thông báo trả lời mà nó nhận được bằng cách tạo một đối tượng {{domxref("RTCSessionDescription")}} mới thể hiện mô tả phiên của bên được gọi và chuyển nó vào
{{domxref("RTCPeerConnection.setRemoteDescription", "myPeerConnection.setRemoteDescription()")}}.

```js
function handleVideoAnswerMsg(msg) {
  const desc = new RTCSessionDescription(msg.sdp);
  myPeerConnection.setRemoteDescription(desc).catch(window.reportError);
}
```

##### Gửi ứng viên ICEQuá trình đàm phán ICE bao gồm việc mỗi bên gửi ứng viên cho bên kia nhiều lần cho đến khi không còn cách nào có thể hỗ trợ nhu cầu vận chuyển phương tiện của `RTCPeerConnection`. Vì ICE không biết về máy chủ báo hiệu của bạn nên mã của bạn sẽ xử lý việc truyền từng ứng cử viên trong trình xử lý của bạn cho sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}

Trình xử lý {{domxref("RTCPeerConnection.icecandidate_event", "onicecandidate")}} của bạn nhận được một sự kiện có thuộc tính `candidate` là SDP mô tả ứng cử viên (hoặc là `null` để chỉ ra rằng lớp ICE đã hết cấu hình tiềm năng để đề xuất). Nội dung của `candidate` là nội dung bạn cần truyền bằng máy chủ báo hiệu của mình. Đây là cách triển khai ví dụ của chúng tôi:

```js
function handleICECandidateEvent(event) {
  if (event.candidate) {
    sendToServer({
      type: "new-ice-candidate",
      target: targetUsername,
      candidate: event.candidate,
    });
  }
}
```

Thao tác này xây dựng một đối tượng chứa ứng cử viên, sau đó gửi nó đến thiết bị ngang hàng khác bằng cách sử dụng hàm `sendToServer()` được mô tả trước đó trong [Gửi tin nhắn đến máy chủ báo hiệu](#sending_messages_to_the_signaling_server). Thuộc tính của tin nhắn là:

- `type`
  - : Loại tin nhắn: `"new-ice-candidate"`.
- `target`
  - : Tên người dùng mà ứng viên ICE cần được gửi tới. Điều này cho phép máy chủ báo hiệu định tuyến tin nhắn.
- `candidate`
  - : SDP đại diện cho ứng viên mà lớp ICE muốn truyền tới thiết bị ngang hàng khác.

Định dạng của thông báo này (như trường hợp của mọi việc bạn làm khi xử lý tín hiệu) hoàn toàn tùy thuộc vào bạn, tùy thuộc vào nhu cầu của bạn; bạn có thể cung cấp thông tin khác theo yêu cầu.

> [!LƯU Ý]
> Điều quan trọng cần lưu ý là sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} **không** được gửi khi ứng viên ICE đến từ đầu bên kia của cuộc gọi. Thay vào đó, chúng sẽ được gửi khi bạn kết thúc cuộc gọi để bạn có thể đảm nhận công việc truyền dữ liệu qua bất kỳ kênh nào bạn chọn. Điều này có thể gây nhầm lẫn khi bạn mới làm quen với WebRTC.

##### Tiếp nhận thí sinh ICE

Máy chủ báo hiệu phân phối từng ứng cử viên ICE đến thiết bị ngang hàng đích bằng bất kỳ phương thức nào nó chọn; trong ví dụ của chúng tôi, đây là đối tượng JSON, với thuộc tính `type` chứa chuỗi `"new-ice-candidate"`. Hàm `handleNewICECandidateMsg()` của chúng tôi được gọi bằng mã tin nhắn đến [WebSocket](/en-US/docs/Web/API/WebSockets_API) chính để xử lý các tin nhắn này:

```js
function handleNewICECandidateMsg(msg) {
  const candidate = new RTCIceCandidate(msg.candidate);

  myPeerConnection.addIceCandidate(candidate).catch(window.reportError);
}
```

Hàm này xây dựng một đối tượng {{domxref("RTCIceCandidate")}} bằng cách chuyển SDP nhận được vào hàm tạo của nó, sau đó phân phối ứng cử viên đến lớp ICE bằng cách chuyển nó vào {{domxref("RTCPeerConnection.addIceCandidate", "myPeerConnection.addIceCandidate()")}}. Điều này sẽ trao ứng cử viên ICE mới cho lớp ICE cục bộ và cuối cùng, vai trò của chúng tôi trong quá trình xử lý ứng viên này đã hoàn tất.

Mỗi máy ngang hàng gửi cho máy ngang hàng khác một ứng cử viên cho mỗi cấu hình truyền tải có thể có mà nó tin rằng có thể khả thi đối với phương tiện được trao đổi. Tại một thời điểm nào đó, hai đồng nghiệp đồng ý rằng một ứng cử viên nhất định là một lựa chọn tốt và họ mở kết nối và bắt đầu chia sẻ phương tiện. Tuy nhiên, điều quan trọng cần lưu ý là việc đàm phán ICE không dừng lại khi phương tiện đang được truyền đi. Thay vào đó, các ứng viên vẫn có thể tiếp tục được trao đổi sau khi cuộc trò chuyện đã bắt đầu, trong khi cố gắng tìm một phương thức kết nối tốt hơn hoặc vì họ đã sẵn sàng khi các đồng nghiệp thiết lập kết nối thành công.

Ngoài ra, nếu có điều gì đó xảy ra làm thay đổi kịch bản phát trực tuyến, quá trình thương lượng sẽ bắt đầu lại, với sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} được gửi tới {{domxref("RTCPeerConnection")}} và toàn bộ quá trình sẽ bắt đầu lại như mô tả trước đó. Điều này có thể xảy ra trong nhiều tình huống khác nhau, bao gồm:

- Thay đổi trạng thái mạng, chẳng hạn như thay đổi băng thông, chuyển từ Wi-Fi sang kết nối di động hoặc tương tự.
- Chuyển đổi giữa camera trước và sau trên điện thoại.
- Thay đổi cấu hình của luồng, chẳng hạn như độ phân giải hoặc tốc độ khung hình.##### Nhận luồng mới

Khi các bản nhạc mới được thêm vào `RTCPeerConnection`— bằng cách gọi phương thức {{domxref("RTCPeerConnection.addTrack", "addTrack()")}} của nó hoặc do thương lượng lại định dạng của luồng—sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} được đặt thành `RTCPeerConnection` cho mỗi bản nhạc được thêm vào kết nối. Việc sử dụng phương tiện mới được thêm vào yêu cầu triển khai trình xử lý cho sự kiện `track`. Nhu cầu chung là đính kèm phương tiện đến vào một phần tử HTML thích hợp. Trong ví dụ của chúng tôi, chúng tôi thêm luồng của bản nhạc vào phần tử {{HTMLElement("video")}} hiển thị video đến:

```js
function handleTrackEvent(event) {
  document.getElementById("received_video").srcObject = event.streams[0];
  document.getElementById("hangup-button").disabled = false;
}
```

Luồng đến được gắn vào phần tử `"received_video"` {{HTMLElement("video")}} và phần tử "Hang Up" {{HTMLElement("button")}} được bật để người dùng có thể cúp máy.

Khi mã này đã hoàn tất, cuối cùng video được gửi bởi thiết bị ngang hàng khác sẽ được hiển thị trong cửa sổ trình duyệt cục bộ!

##### Xử lý việc xóa dấu vết

Mã của bạn nhận được sự kiện {{domxref("MediaStream/removetrack_event", "removetrack")}} khi thiết bị ngang hàng từ xa xóa bản nhạc khỏi kết nối bằng cách gọi {{domxref("RTCPeerConnection.removeTrack()")}}. Trình xử lý của chúng tôi cho `"removetrack"` là:

```js
function handleRemoveTrackEvent(event) {
  const stream = document.getElementById("received_video").srcObject;
  const trackList = stream.getTracks();

  if (trackList.length === 0) {
    closeVideoCall();
  }
}
```

Mã này tìm nạp video đến {{domxref("MediaStream")}} từ thuộc tính {{HTMLElement("video")}} của phần tử `"received_video"` {{HTMLElement("video")}}, sau đó gọi phương thức {{domxref("MediaStream.getTracks", "getTracks()")}} của luồng để nhận một loạt các bản nhạc của luồng.

Nếu độ dài của mảng bằng 0, nghĩa là không còn bản nhạc nào trong luồng, chúng tôi kết thúc cuộc gọi bằng cách gọi `closeVideoCall()`. Thao tác này sẽ khôi phục rõ ràng ứng dụng của chúng tôi về trạng thái sẵn sàng bắt đầu hoặc nhận cuộc gọi khác. Xem [Kết thúc cuộc gọi](#ending_the_call) để tìm hiểu cách hoạt động của `closeVideoCall()`.

#### Kết thúc cuộc gọi

Có nhiều lý do khiến cuộc gọi có thể kết thúc. Một cuộc gọi có thể đã kết thúc nhưng một hoặc cả hai bên đã gác máy. Có lẽ đã xảy ra lỗi mạng hoặc một người dùng có thể đã thoát khỏi trình duyệt của họ hoặc gặp sự cố hệ thống. Dù thế nào đi nữa, mọi điều tốt đẹp đều phải kết thúc.

##### Cúp máy

Khi người dùng nhấp vào nút "Cúp máy" để kết thúc cuộc gọi, chức năng `hangUpCall()` được gọi:

```js
function hangUpCall() {
  closeVideoCall();
  sendToServer({
    name: myUsername,
    target: targetUsername,
    type: "hang-up",
  });
}
```

`hangUpCall()` thực thi `closeVideoCall()` để tắt và đặt lại kết nối cũng như giải phóng tài nguyên. Sau đó, nó tạo một thông báo `"hang-up"` và gửi nó đến đầu bên kia của cuộc gọi để yêu cầu thiết bị ngang hàng khác tự tắt chính nó một cách gọn gàng.

##### Kết thúc cuộc gọi

Hàm `closeVideoCall()`, hiển thị bên dưới, chịu trách nhiệm dừng luồng, dọn dẹp và xử lý đối tượng {{domxref("RTCPeerConnection")}}:

```js
function closeVideoCall() {
  const remoteVideo = document.getElementById("received_video");
  const localVideo = document.getElementById("local_video");

  if (myPeerConnection) {
    myPeerConnection.ontrack = null;
    myPeerConnection.onremovetrack = null;
    myPeerConnection.onremovestream = null;
    myPeerConnection.onicecandidate = null;
    myPeerConnection.oniceconnectionstatechange = null;
    myPeerConnection.onsignalingstatechange = null;
    myPeerConnection.onicegatheringstatechange = null;
    myPeerConnection.onnegotiationneeded = null;

    if (remoteVideo.srcObject) {
      remoteVideo.srcObject.getTracks().forEach((track) => track.stop());
    }

    if (localVideo.srcObject) {
      localVideo.srcObject.getTracks().forEach((track) => track.stop());
    }

    myPeerConnection.close();
    myPeerConnection = null;
  }

  remoteVideo.removeAttribute("src");
  remoteVideo.removeAttribute("srcObject");
  localVideo.removeAttribute("src");
  localVideo.removeAttribute("srcObject");

  document.getElementById("hangup-button").disabled = true;
  targetUsername = null;
}
```

Sau khi lấy tham chiếu đến hai phần tử {{HTMLElement("video")}}, chúng tôi kiểm tra xem có tồn tại kết nối WebRTC hay không; nếu đúng thì chúng ta tiến hành ngắt kết nối và đóng cuộc gọi:

1. Tất cả các trình xử lý sự kiện đều bị xóa. Điều này ngăn chặn việc kích hoạt các trình xử lý sự kiện đi lạc trong khi kết nối đang trong quá trình đóng, có khả năng gây ra lỗi.
2. Đối với cả luồng video từ xa và cục bộ, chúng tôi lặp lại từng bản nhạc, gọi phương thức {{domxref("MediaStreamTrack.stop()")}} để đóng từng bản nhạc.
3. Đóng {{domxref("RTCPeerConnection")}} bằng cách gọi {{domxref("RTCPeerConnection.close", "myPeerConnection.close()")}}.
4. Đặt `myPeerConnection` thành `null`, đảm bảo mã của chúng tôi biết rằng không có cuộc gọi nào đang diễn ra; điều này rất hữu ích khi người dùng nhấp vào tên trong danh sách người dùng.

Sau đó, đối với cả phần tử {{HTMLElement("video")}} đến và đi, chúng tôi xóa thuộc tính [`src`](/en-US/docs/Web/API/HTMLMediaElement/src) và [`srcObject`](/en-US/docs/Web/API/HTMLMediaElement/srcObject) bằng cách sử dụng phương thức {{domxref("Element.removeAttribute", "removeAttribute()")}} của chúng. Điều này hoàn thành việc tách các luồng khỏi các phần tử video.

Cuối cùng, chúng tôi đặt thuộc tính {{domxref("HTMLButtonElement.disabled", "disabled")}} thành `true` trên nút "Cúp máy", làm cho thuộc tính này không thể nhấp được khi không có cuộc gọi nào đang diễn ra; sau đó chúng tôi đặt `targetUsername` thành `null` vì chúng tôi không còn nói chuyện với bất kỳ ai nữa. Điều này cho phép người dùng gọi cho người dùng khác hoặc nhận cuộc gọi đến.

#### Xử lý các thay đổi trạng tháiCó một số sự kiện bổ sung mà bạn có thể đặt người nghe thông báo cho mã của mình về nhiều thay đổi trạng thái. Chúng tôi sử dụng ba trong số chúng: {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}, {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}} và {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}

##### Trạng thái kết nối ICE

Các sự kiện {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}} được lớp ICE gửi đến {{domxref("RTCPeerConnection")}} khi trạng thái kết nối thay đổi (chẳng hạn như khi cuộc gọi bị chấm dứt từ đầu bên kia).

```js
function handleICEConnectionStateChangeEvent(event) {
  switch (myPeerConnection.iceConnectionState) {
    case "closed":
    case "failed":
      closeVideoCall();
      break;
  }
}
```

Ở đây, chúng tôi áp dụng chức năng `closeVideoCall()` khi trạng thái kết nối ICE thay đổi thành `"closed"` hoặc `"failed"`. Thao tác này sẽ tắt kết nối của chúng tôi để chúng tôi sẵn sàng bắt đầu hoặc chấp nhận cuộc gọi một lần nữa.

> [!LƯU Ý]
> Chúng tôi không xem trạng thái báo hiệu `disconnected` ở đây vì nó có thể chỉ ra sự cố tạm thời và có thể quay trở lại trạng thái `connected` sau một thời gian. Việc xem nó sẽ kết thúc cuộc gọi điện video đối với bất kỳ sự cố mạng tạm thời nào.

##### Trạng thái báo hiệu ICE

Tương tự, chúng tôi theo dõi các sự kiện {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}. Nếu trạng thái báo hiệu thay đổi thành `closed`, chúng tôi cũng sẽ đóng lệnh gọi.

```js
function handleSignalingStateChangeEvent(event) {
  switch (myPeerConnection.signalingState) {
    case "closed":
      closeVideoCall();
      break;
  }
}
```

> [!LƯU Ý]
> Trạng thái tín hiệu `closed` không còn được dùng nữa để chuyển sang trạng thái `closed` {{domxref("RTCPeerConnection.iceConnectionState", "iceConnectionState")}}. Chúng tôi đang theo dõi nó ở đây để bổ sung thêm một chút khả năng tương thích ngược.

##### Trạng thái thu thập ICE

Sự kiện {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}} được dùng để cho bạn biết khi nào trạng thái quy trình thu thập ứng viên ICE thay đổi. Ví dụ của chúng tôi không sử dụng điều này cho bất kỳ mục đích nào, nhưng có thể hữu ích khi xem các sự kiện này nhằm mục đích gỡ lỗi cũng như phát hiện khi nào việc thu thập ứng viên đã hoàn tất.

```js
function handleICEGatheringStateChangeEvent(event) {
  // Our sample just logs information to console here,
  // but you can do whatever you need.
}
```

## Các bước tiếp theo

Bây giờ bạn có thể [hãy thử ví dụ này](https://webrtc-from-chat.onrender.com/) để xem nó hoạt động.
Mở bảng điều khiển Web trên cả hai thiết bị và xem kết quả được ghi lại—mặc dù bạn không thấy nó trong mã như được hiển thị ở trên, nhưng mã trên máy chủ (và trên [GitHub](https://github.com/bsmth/examples/tree/main/webrtc-from-chat)) có rất nhiều đầu ra của bảng điều khiển để bạn có thể thấy quá trình báo hiệu và kết nối đang hoạt động.

Một cải tiến rõ ràng khác là thêm tính năng "đổ chuông", để thay vì chỉ yêu cầu người dùng cho phép sử dụng máy ảnh và micrô, "Người dùng X đang gọi. Bạn có muốn trả lời không?" lời nhắc xuất hiện đầu tiên.

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Công nghệ truyền thông web](/en-US/docs/Web/Media)
- [Hướng dẫn về các loại và định dạng phương tiện trên web](/en-US/docs/Web/Media/Guides/Formats)
- [API thu thập và truyền phát phương tiện](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [API khả năng truyền thông](/en-US/docs/Web/API/Media_Capabilities_API)
- [API ghi MediaStream](/en-US/docs/Web/API/MediaStream_Recording_API)
- Mẫu [Đàm phán hoàn hảo](/en-US/docs/Web/API/WebRTC_API/Perfect_negotiation)
