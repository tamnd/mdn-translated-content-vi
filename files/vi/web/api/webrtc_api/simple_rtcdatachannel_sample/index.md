---
title: Một mẫu RTCDataChannel đơn giản
slug: Web/API/WebRTC_API/Simple_RTCDataChannel_sample
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

Giao diện {{domxref("RTCDataChannel")}} là một tính năng của [API WebRTC](/en-US/docs/Web/API/WebRTC_API) cho phép bạn mở một kênh giữa hai thiết bị ngang hàng mà qua đó bạn có thể gửi và nhận dữ liệu tùy ý. API này có chủ ý tương tự như [API WebSocket](/en-US/docs/Web/API/WebSockets_API), do đó có thể sử dụng cùng một mô hình lập trình cho mỗi API.

Trong ví dụ này, chúng tôi sẽ mở kết nối {{domxref("RTCDataChannel")}} liên kết hai thành phần trên cùng một trang. Mặc dù đó rõ ràng là một kịch bản có sẵn nhưng nó rất hữu ích trong việc chứng minh quy trình kết nối hai thiết bị ngang hàng. Chúng tôi sẽ đề cập đến các cơ chế hoàn thành kết nối, truyền và nhận dữ liệu, nhưng chúng tôi sẽ lưu lại một số thông tin về định vị và liên kết với máy tính từ xa cho một ví dụ khác.

## HTML

Trước tiên, chúng ta hãy xem nhanh [HTML cần thiết](https://github.com/mdn/samples-server/blob/master/s/webrtc-simple-datachannel/index.html). Không có gì cực kỳ phức tạp ở đây. Đầu tiên, chúng ta có một vài nút để thiết lập và đóng kết nối:

```html
<button id="connectButton" name="connectButton" class="buttonleft">
  Connect
</button>
<button
  id="disconnectButton"
  name="disconnectButton"
  class="buttonright"
  disabled>
  Disconnect
</button>
```

Sau đó, có một hộp chứa hộp nhập văn bản mà người dùng có thể nhập tin nhắn để truyền đi bằng nút để gửi văn bản đã nhập. {{HTMLElement("div")}} này sẽ là thiết bị ngang hàng đầu tiên trong kênh.

```html
<div class="messagebox">
  <label for="message"
    >Enter a message:
    <input
      type="text"
      name="message"
      id="message"
      placeholder="Message text"
      inputmode="latin"
      size="60"
      maxlength="120"
      disabled />
  </label>
  <button id="sendButton" name="sendButton" class="buttonright" disabled>
    Send
  </button>
</div>
```

Cuối cùng, có một hộp nhỏ để chúng ta chèn tin nhắn vào. Khối {{HTMLElement("div")}} này sẽ là khối ngang hàng thứ hai.

```html
<div class="messagebox" id="receive-box">
  <p>Messages received:</p>
</div>
```

## Mã JavaScript

Mặc dù bạn chỉ có thể [nhìn vào chính mã trên GitHub](https://github.com/mdn/samples-server/blob/master/s/webrtc-simple-datachannel/main.js) nhưng bên dưới chúng tôi sẽ xem xét các phần của mã thực hiện công việc nặng nhọc.

### Khởi động

Khi tập lệnh được chạy, chúng tôi thiết lập trình xử lý sự kiện {{domxref("Window/load_event", "load")}} để khi trang được tải đầy đủ, hàm `startup()` của chúng tôi sẽ được gọi.

```js
let connectButton = null;
let disconnectButton = null;
let sendButton = null;
let messageInputBox = null;
let receiveBox = null;

let localConnection = null; // RTCPeerConnection for our "local" connection
let remoteConnection = null; // RTCPeerConnection for the "remote"

let sendChannel = null; // RTCDataChannel for the local (sender)
let receiveChannel = null; // RTCDataChannel for the remote (receiver)

function startup() {
  connectButton = document.getElementById("connectButton");
  disconnectButton = document.getElementById("disconnectButton");
  sendButton = document.getElementById("sendButton");
  messageInputBox = document.getElementById("message");
  receiveBox = document.getElementById("receive-box");

  // Set event listeners for user interface widgets

  connectButton.addEventListener("click", connectPeers);
  disconnectButton.addEventListener("click", disconnectPeers);
  sendButton.addEventListener("click", sendMessage);
}
```

Điều này khá đơn giản. Chúng tôi khai báo các biến và lấy tham chiếu đến tất cả các thành phần trang mà chúng tôi sẽ cần truy cập, sau đó đặt [người nghe sự kiện](/en-US/docs/Web/API/EventTarget/addEventListener) trên ba nút.

### Thiết lập kết nối

Khi người dùng nhấp vào nút "Kết nối", phương thức `connectPeers()` sẽ được gọi. Chúng ta sẽ chia nhỏ điều này ra và xem xét nó từng chút một để làm rõ.

> [!LƯU Ý]
> Mặc dù cả hai đầu kết nối của chúng ta đều nằm trên cùng một trang, nhưng chúng ta sẽ gọi đầu cuối kết nối là đầu "cục bộ" và đầu kia là đầu "từ xa".

#### Thiết lập máy ngang hàng cục bộ

```js
localConnection = new RTCPeerConnection();

sendChannel = localConnection.createDataChannel("sendChannel");
sendChannel.onopen = handleSendChannelStatusChange;
sendChannel.onclose = handleSendChannelStatusChange;
```

Bước đầu tiên là tạo đầu cuối "cục bộ" của kết nối. Đây là thiết bị ngang hàng sẽ gửi yêu cầu kết nối. Bước tiếp theo là tạo {{domxref("RTCDataChannel")}} bằng cách gọi {{domxref("RTCPeerConnection.createDataChannel()")}} và thiết lập trình xử lý sự kiện để giám sát kênh để chúng tôi biết khi nào kênh được mở và đóng (nghĩa là khi kênh được kết nối hoặc ngắt kết nối trong kết nối ngang hàng đó).

Điều quan trọng cần lưu ý là mỗi đầu của kênh có đối tượng {{domxref("RTCDataChannel")}} riêng.

#### Thiết lập máy ngang hàng từ xa

```js
remoteConnection = new RTCPeerConnection();
remoteConnection.ondatachannel = receiveChannelCallback;
```

Đầu từ xa được thiết lập tương tự, ngoại trừ việc chúng ta không cần phải tự tạo {{domxref("RTCDataChannel")}} một cách rõ ràng vì chúng ta sẽ được kết nối thông qua kênh được thiết lập ở trên. Thay vào đó, chúng tôi thiết lập trình xử lý sự kiện {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}}; cái này sẽ được gọi khi kênh dữ liệu được mở; trình xử lý này sẽ nhận được một đối tượng `RTCDataChannel`; bạn sẽ thấy điều này bên dưới.

#### Thiết lập ứng viên ICE

Bước tiếp theo là thiết lập từng kết nối với trình nghe ứng viên ICE; những điều này sẽ được gọi khi có một ứng cử viên ICE mới để thông báo cho bên kia.> [!LƯU Ý]

> Trong tình huống thực tế trong đó hai thiết bị ngang hàng không chạy trong cùng một bối cảnh, quá trình này sẽ phức tạp hơn một chút; Mỗi bên lần lượt cung cấp một cách được đề xuất để kết nối (ví dụ: UDP, UDP với rơle, TCP, v.v.) bằng cách gọi {{domxref("RTCPeerConnection.addIceCandidate()")}} và họ quay đi quay lại cho đến khi đạt được thỏa thuận. Nhưng ở đây, chúng tôi chỉ chấp nhận lời đề nghị đầu tiên của mỗi bên vì không có mối quan hệ thực sự nào liên quan.

```js
localConnection.onicecandidate = (e) =>
  !e.candidate ||
  remoteConnection.addIceCandidate(e.candidate).catch(handleAddCandidateError);

remoteConnection.onicecandidate = (e) =>
  !e.candidate ||
  localConnection.addIceCandidate(e.candidate).catch(handleAddCandidateError);
```

Chúng tôi định cấu hình mỗi {{domxref("RTCPeerConnection")}} để có trình xử lý sự kiện cho sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}.

#### Bắt đầu thử kết nối

Điều cuối cùng chúng ta cần làm để bắt đầu kết nối các đồng nghiệp của mình là tạo ra một đề nghị kết nối.

```js
localConnection
  .createOffer()
  .then((offer) => localConnection.setLocalDescription(offer))
  .then(() =>
    remoteConnection.setRemoteDescription(localConnection.localDescription),
  )
  .then(() => remoteConnection.createAnswer())
  .then((answer) => remoteConnection.setLocalDescription(answer))
  .then(() =>
    localConnection.setRemoteDescription(remoteConnection.localDescription),
  )
  .catch(handleCreateDescriptionError);
```

Chúng ta hãy đi qua từng dòng một và giải mã ý nghĩa của nó.

1. Đầu tiên, chúng ta gọi phương thức {{domxref("RTCPeerConnection.createOffer()")}} để tạo blob {{Glossary("SDP")}} (Giao thức mô tả phiên) mô tả kết nối mà chúng ta muốn thực hiện. Tùy chọn, phương pháp này chấp nhận một đối tượng có các ràng buộc cần đáp ứng để kết nối đáp ứng được nhu cầu của bạn, chẳng hạn như liệu kết nối có hỗ trợ âm thanh, video hay cả hai hay không. Trong ví dụ đơn giản của chúng tôi, chúng tôi không có bất kỳ ràng buộc nào.
2. Nếu ưu đãi được tạo thành công, chúng tôi sẽ chuyển blob sang phương thức {{domxref("RTCPeerConnection.setLocalDescription()")}} của kết nối cục bộ. Điều này cấu hình kết thúc cục bộ của kết nối.
3. Bước tiếp theo là kết nối máy ngang hàng cục bộ với máy điều khiển từ xa bằng cách thông báo cho máy ngang hàng từ xa về nó. Việc này được thực hiện bằng cách gọi {{domxref("RTCPeerConnection.setRemoteDescription()", "remoteConnection.setRemoteDescription()")}}. Bây giờ `remoteConnection` đã biết về kết nối đang được xây dựng. Trong ứng dụng thực tế, điều này sẽ yêu cầu máy chủ báo hiệu trao đổi đối tượng mô tả.
4. Điều đó có nghĩa là đã đến lúc đối tác ở xa trả lời. Nó làm như vậy bằng cách gọi phương thức {{domxref("RTCPeerConnection.createAnswer", "createAnswer()")}} của nó. Điều này tạo ra một khối SDP mô tả kết nối mà thiết bị ngang hàng từ xa sẵn sàng và có thể thiết lập. Cấu hình này nằm ở đâu đó trong sự kết hợp của các tùy chọn mà cả hai thiết bị ngang hàng có thể hỗ trợ.
5. Khi câu trả lời đã được tạo, nó sẽ được chuyển vào remoteConnection bằng cách gọi {{domxref("RTCPeerConnection.setLocalDescription()")}}. Điều đó thiết lập điểm cuối kết nối của điều khiển từ xa (đối với thiết bị ngang hàng từ xa, là điểm cuối cục bộ của nó. Nội dung này có thể gây nhầm lẫn, nhưng bạn sẽ quen với nó). Một lần nữa, điều này thường được trao đổi thông qua một máy chủ báo hiệu.
6. Cuối cùng, mô tả từ xa của kết nối cục bộ được đặt để tham chiếu đến thiết bị ngang hàng từ xa bằng cách gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}} của localConnection.
7. `catch()` gọi một quy trình xử lý mọi lỗi xảy ra.

> [!LƯU Ý]
> Một lần nữa, quy trình này không phải là quá trình triển khai trong thế giới thực; trong cách sử dụng thông thường, có hai đoạn mã chạy trên hai máy, tương tác và đàm phán kết nối. Kênh bên, thường được gọi là "máy chủ báo hiệu", thường được sử dụng để trao đổi mô tả (ở dạng **application/sdp**) giữa hai thiết bị ngang hàng.

#### Xử lý kết nối ngang hàng thành công

Khi mỗi bên của kết nối ngang hàng được liên kết thành công, sự kiện {{domxref("RTCPeerConnection")}} tương ứng sẽ được kích hoạt. Những trình xử lý này có thể làm bất cứ điều gì cần thiết, nhưng trong ví dụ này, tất cả những gì chúng ta cần làm là cập nhật giao diện người dùng:

```js
function handleCreateDescriptionError(error) {
  console.log(`Unable to create an offer: ${error.toString()}`);
}

function handleLocalAddCandidateSuccess() {
  connectButton.disabled = true;
}

function handleRemoteAddCandidateSuccess() {
  disconnectButton.disabled = false;
}

function handleAddCandidateError() {
  console.log("Oh noes! addICECandidate failed!");
}
```

Điều duy nhất chúng tôi làm ở đây là tắt nút "Kết nối" khi thiết bị ngang hàng cục bộ được kết nối và bật nút "Ngắt kết nối" khi thiết bị ngang hàng từ xa kết nối.

#### Kết nối kênh dữ liệu

Khi {{domxref("RTCPeerConnection")}} mở, sự kiện {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}} sẽ được gửi đến điều khiển từ xa để hoàn tất quá trình mở kênh dữ liệu; cái này gọi phương thức `receiveChannelCallback()` của chúng tôi, trông như thế này:

````js
function receiveChannelCallback(event) {
  receiveChannel = event.channel;
  receiveChannel.onmessage = handleReceiveMessage;
  receiveChannel.onopen = handleReceiveChannelStatusChange;
  receiveChannel.onclose = handleReceiveChannelStatusChange;
}
```Sự kiện {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}} bao gồm, trong thuộc tính kênh của nó, một tham chiếu đến {{domxref("RTCDataChannel")}} đại diện cho điểm cuối của kênh của thiết bị ngang hàng từ xa. Điều này được lưu và chúng tôi thiết lập, trên kênh, trình xử lý sự kiện cho các sự kiện mà chúng tôi muốn xử lý. Sau khi hoàn thành việc này, phương thức `handleReceiveMessage()` của chúng tôi sẽ được gọi mỗi khi thiết bị ngang hàng từ xa nhận được dữ liệu và phương thức `handleReceiveChannelStatusChange()` sẽ được gọi bất cứ khi nào trạng thái kết nối của kênh thay đổi, vì vậy chúng tôi có thể phản ứng khi kênh được mở hoàn toàn và khi kênh được đóng.

### Xử lý thay đổi trạng thái kênh
Cả các đồng nghiệp cục bộ và từ xa của chúng tôi đều sử dụng một phương pháp duy nhất để xử lý các sự kiện cho thấy sự thay đổi về trạng thái kết nối của kênh.

Khi máy ngang hàng cục bộ trải qua một sự kiện mở hoặc đóng, phương thức `handleSendChannelStatusChange()` được gọi:

```js
function handleSendChannelStatusChange(event) {
  if (sendChannel) {
    const state = sendChannel.readyState;

    if (state === "open") {
      messageInputBox.disabled = false;
      messageInputBox.focus();
      sendButton.disabled = false;
      disconnectButton.disabled = false;
      connectButton.disabled = true;
    } else {
      messageInputBox.disabled = true;
      sendButton.disabled = true;
      connectButton.disabled = false;
      disconnectButton.disabled = true;
    }
  }
}
````

Nếu trạng thái của kênh thay đổi thành "mở", điều đó cho thấy rằng chúng tôi đã hoàn tất việc thiết lập liên kết giữa hai thiết bị ngang hàng. Giao diện người dùng được cập nhật tương ứng bằng cách bật hộp nhập văn bản để gửi tin nhắn, tập trung vào hộp nhập để người dùng có thể bắt đầu nhập ngay lập tức, bật các nút "Gửi" và "Ngắt kết nối", giờ đây chúng có thể sử dụng được và tắt nút "Kết nối", vì nó không cần thiết khi kết nối mở.

Nếu trạng thái thay đổi thành "đã đóng", thì sẽ xảy ra nhóm hành động ngược lại: hộp nhập và nút "Gửi" bị tắt, nút "Kết nối" được bật để người dùng có thể mở kết nối mới nếu họ muốn, và nút "Ngắt kết nối" bị tắt vì nó không hữu ích khi không có kết nối nào tồn tại.

Mặt khác, thiết bị ngang hàng từ xa trong ví dụ của chúng tôi bỏ qua các sự kiện thay đổi trạng thái, ngoại trừ việc ghi sự kiện vào bảng điều khiển:

```js
function handleReceiveChannelStatusChange(event) {
  if (receiveChannel) {
    console.log(
      `Receive channel's status has changed to ${receiveChannel.readyState}`,
    );
  }
}
```

Phương thức `handleReceiveChannelStatusChange()` nhận tham số đầu vào là sự kiện đã xảy ra; đây sẽ là {{domxref("RTCDataChannelEvent")}}.

### Gửi tin nhắn

Khi người dùng nhấn nút "Gửi", phương thức sendMessage() mà chúng tôi đã thiết lập làm trình xử lý cho sự kiện {{domxref("Element/click_event", "click")}} của nút sẽ được gọi. Phương pháp đó đủ đơn giản:

```js
function sendMessage() {
  const message = messageInputBox.value;
  sendChannel.send(message);

  messageInputBox.value = "";
  messageInputBox.focus();
}
```

Đầu tiên, văn bản của tin nhắn được tìm nạp từ thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của hộp nhập liệu. Sau đó, thông tin này được gửi đến thiết bị ngang hàng từ xa bằng cách gọi {{domxref("RTCDataChannel.send", "sendChannel.send()")}}. Đó là tất cả những gì cần làm! Phần còn lại của phương pháp này chỉ là một số trải nghiệm của người dùng - hộp nhập liệu được làm trống và tập trung lại để người dùng có thể bắt đầu nhập một tin nhắn khác ngay lập tức.

### Nhận tin nhắn

Khi một sự kiện "tin nhắn" xảy ra trên kênh từ xa, phương thức `handleReceiveMessage()` của chúng tôi được gọi là trình xử lý sự kiện.

```js
function handleReceiveMessage(event) {
  const el = document.createElement("p");
  const textNode = document.createTextNode(event.data);

  el.appendChild(textNode);
  receiveBox.appendChild(el);
}
```

Phương pháp này thực hiện một số phép tiêm {{Glossary("DOM")}} cơ bản; nó tạo ra một phần tử {{HTMLElement("p")}} (đoạn) mới, sau đó tạo một nút {{domxref("Text")}} mới chứa văn bản tin nhắn, được nhận trong thuộc tính `data` của sự kiện. Nút văn bản này được thêm vào dưới dạng phần tử con của phần tử mới, sau đó được chèn vào khối `receiveBox`, do đó khiến nó vẽ trong cửa sổ trình duyệt.

### Ngắt kết nối các đồng nghiệp

Khi người dùng nhấp vào nút "Ngắt kết nối", phương thức `disconnectPeers()` được đặt trước đó làm trình xử lý của nút đó sẽ được gọi.

```js
function disconnectPeers() {
  // Close the RTCDataChannels if they're open.

  sendChannel.close();
  receiveChannel.close();

  // Close the RTCPeerConnections

  localConnection.close();
  remoteConnection.close();

  sendChannel = null;
  receiveChannel = null;
  localConnection = null;
  remoteConnection = null;

  // Update user interface elements

  connectButton.disabled = false;
  disconnectButton.disabled = true;
  sendButton.disabled = true;

  messageInputBox.value = "";
  messageInputBox.disabled = true;
}
```

Việc này bắt đầu bằng cách đóng {{domxref("RTCDataChannel")}} của mỗi thiết bị ngang hàng, sau đó, tương tự, đóng từng {{domxref("RTCPeerConnection")}}. Sau đó, tất cả các tham chiếu đã lưu cho các đối tượng này được đặt thành `null` để tránh vô tình sử dụng lại và giao diện người dùng được cập nhật để phản ánh thực tế là kết nối đã bị đóng.

## Các bước tiếp theo

Hãy xem mã nguồn [webrtc-đơn giản-datachannel](https://github.com/mdn/samples-server/tree/master/s/webrtc-simple-datachannel), có sẵn trên GitHub.

## Xem thêm

- [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling).
- Mẫu [Đàm phán hoàn hảo](/en-US/docs/Web/API/WebRTC_API/Perfect_negotiation).
