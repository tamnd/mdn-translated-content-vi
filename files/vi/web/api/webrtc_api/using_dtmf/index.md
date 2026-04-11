---
title: Sử dụng DTMF với WebRTC
slug: Web/API/WebRTC_API/Using_DTMF
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

Để hỗ trợ đầy đủ hơn hội nghị âm thanh/video, [WebRTC](/en-US/docs/Web/API/WebRTC_API) hỗ trợ gửi {{Glossary("DTMF")}} tới thiết bị ngang hàng từ xa trên {{domxref("RTCPeerConnection")}}. Bài viết này cung cấp thông tin tổng quan ngắn gọn ở cấp độ cao về cách DTMF hoạt động trên WebRTC, sau đó cung cấp hướng dẫn cho các nhà phát triển hàng ngày về cách gửi DTMF qua `RTCPeerConnection`. Hệ thống DTMF thường được gọi là "âm chạm", theo tên thương mại cũ của hệ thống.

WebRTC không gửi mã DTMF dưới dạng dữ liệu âm thanh. Thay vào đó, chúng được gửi ngoài băng tần dưới dạng tải trọng RTP. Tuy nhiên, lưu ý rằng mặc dù có thể _send_ DTMF bằng WebRTC nhưng hiện tại không có cách nào để phát hiện hoặc nhận _incoming_ DTMF. WebRTC hiện bỏ qua các trọng tải này; điều này là do hỗ trợ DTMF của WebRTC chủ yếu nhằm mục đích sử dụng với các dịch vụ điện thoại cũ dựa vào âm DTMF để thực hiện các tác vụ như:

- Hệ thống hội nghị truyền hình
- Hệ thống thực đơn
- Hệ thống thư thoại
- Nhập thẻ tín dụng hoặc thông tin thanh toán khác
- Nhập mật mã

> [!LƯU Ý]
> Mặc dù DTMF không được gửi đến thiết bị ngang hàng từ xa dưới dạng âm thanh, nhưng trình duyệt có thể chọn phát âm thanh tương ứng cho người dùng cục bộ như một phần trải nghiệm người dùng của họ, vì người dùng thường quen nghe điện thoại của họ phát âm thanh đó.

## Gửi DTMF trên RTCPeerConnection

Một {{domxref("RTCPeerConnection")}} nhất định có thể có nhiều bản nhạc được gửi hoặc nhận trên đó. Khi bạn muốn truyền tín hiệu DTMF, trước tiên bạn cần quyết định nên gửi chúng đi trên rãnh nào, vì DTMF được gửi dưới dạng một loạt tải trọng ngoài băng tần trên {{domxref("RTCRtpSender")}} chịu trách nhiệm truyền dữ liệu của rãnh đó đến thiết bị ngang hàng khác.

Sau khi bản nhạc được chọn, bạn có thể lấy từ `RTCRtpSender` đối tượng {{domxref("RTCDTMFSender")}} mà bạn sẽ sử dụng để gửi DTMF. Từ đó, bạn có thể gọi {{domxref("RTCDTMFSender.insertDTMF()")}} để xếp các tín hiệu DTMF vào hàng đợi để gửi trên đường đi tới thiết bị ngang hàng khác. Sau đó, `RTCRtpSender` sẽ gửi âm báo đến thiết bị ngang hàng khác dưới dạng gói cùng với dữ liệu âm thanh của bản nhạc.

Mỗi lần một âm được gửi, `RTCPeerConnection` sẽ nhận được một sự kiện [`tonechange`](/en-US/docs/Web/API/RTCDTMFSender/tonechange_event) với thuộc tính {{domxref("RTCDTMFToneChangeEvent.tone", "tone")}} chỉ định âm nào đã phát xong, chẳng hạn như cơ hội để cập nhật các thành phần giao diện. Khi bộ đệm âm trống, cho biết rằng tất cả các âm đã được gửi, một sự kiện `tonechange` có thuộc tính `tone` được đặt thành "" (một chuỗi trống) sẽ được gửi đến đối tượng kết nối.

Nếu bạn muốn biết thêm về cách hoạt động của tính năng này, hãy đọc {{RFC(3550, "RTP: A Transport Protocol for Real-Time Applications")}} và {{RFC(4733, "RTP Payload for DTMF Digits, Telephony Tones, and Telephony Signals")}}. Chi tiết về cách xử lý tải trọng DTMF trên RTP nằm ngoài phạm vi của bài viết này. Thay vào đó, chúng ta sẽ tập trung vào cách sử dụng DTMF trong ngữ cảnh của {{domxref("RTCPeerConnection")}} bằng cách nghiên cứu cách hoạt động của một ví dụ.

## Ví dụ đơn giản

Ví dụ đơn giản này xây dựng hai {{domxref("RTCPeerConnection")}}, thiết lập kết nối giữa chúng, sau đó đợi người dùng nhấp vào nút "Quay số". Khi nhấp vào nút, chuỗi DTMF sẽ được gửi qua kết nối bằng {{domxref("RTCDTMFSender.insertDTMF()")}}. Sau khi âm báo được truyền xong, kết nối sẽ bị đóng.

> [!LƯU Ý]
> Ví dụ này rõ ràng có phần giả tạo, vì thông thường hai đối tượng `RTCPeerConnection` sẽ tồn tại trên các thiết bị khác nhau và việc truyền tín hiệu sẽ được thực hiện qua mạng thay vì tất cả được liên kết nội tuyến như ở đây.

### HTML

HTML cho ví dụ này rất cơ bản; chỉ có ba yếu tố quan trọng:

- Phần tử {{HTMLElement("audio")}} để phát âm thanh mà `RTCPeerConnection` được "gọi".
- Phần tử {{HTMLElement("button")}} để kích hoạt việc tạo và kết nối hai đối tượng `RTCPeerConnection`, sau đó gửi âm DTMF.
- A {{HTMLElement("div")}} để nhận và hiển thị văn bản nhật ký để hiển thị thông tin trạng thái.

```html
<p>
  This example demonstrates the use of DTMF in WebRTC. Note that this example is
  "cheating" by generating both peers in one code stream, rather than having
  each be a truly separate entity.
</p>

<audio id="audio" autoplay controls></audio><br />
<button name="dial" id="dial">Dial</button>

<div class="log"></div>
```

### JavascriptChúng ta hãy xem mã JavaScript tiếp theo. Hãy nhớ rằng quá trình thiết lập kết nối ở đây phần nào được dàn dựng; bạn thường không xây dựng cả hai đầu kết nối trong cùng một tài liệu

#### Biến toàn cục

Đầu tiên, chúng tôi thiết lập các biến toàn cục.

```js
let dialString = "12024561111";

let callerPC = null;
let receiverPC = null;
let dtmfSender = null;

let hasAddTrack = false;

let mediaConstraints = {
  audio: true,
  video: false,
};
```

Đây là, theo thứ tự:

- `dialString`
  - : Chuỗi DTMF người gọi sẽ gửi khi nhấp vào nút "Quay số".
- `callerPC` và `receiverPC`
  - : Các đối tượng {{domxref("RTCPeerConnection")}} tương ứng đại diện cho người gọi và người nhận. Chúng sẽ được khởi tạo khi cuộc gọi bắt đầu, trong hàm `connectAndDial()` của chúng tôi, như được hiển thị trong [Bắt đầu quá trình kết nối](#starting_the_connection_process) bên dưới.
- `dtmfSender`
  - : Đối tượng {{domxref("RTCDTMFSender")}} dành cho kết nối. Điều này sẽ có được trong khi thiết lập kết nối, trong chức năng `gotStream()` được hiển thị trong [Thêm âm thanh vào kết nối](#adding_the_audio_to_the_connection).
- `hasAddTrack`
  - : Do một số trình duyệt chưa triển khai {{domxref("RTCPeerConnection.addTrack()")}} nên yêu cầu sử dụng phương thức {{domxref("RTCPeerConnection.addStream", "addStream()")}} lỗi thời nên chúng tôi sử dụng Boolean này để xác định xem tác nhân người dùng có hỗ trợ `addTrack()` hay không; nếu không, chúng tôi sẽ quay lại `addStream()`. Điều này được tìm ra trong `connectAndDial()`, như được hiển thị trong [Bắt đầu quá trình kết nối](#starting_the_connection_process).
- `mediaConstraints`
  - : Một đối tượng chỉ định các ràng buộc sẽ sử dụng khi bắt đầu kết nối. Chúng tôi muốn kết nối chỉ có âm thanh, vì vậy `video` là `false`, trong khi `audio` là `true`.

#### Khởi tạo

Chúng tôi tìm nạp các tham chiếu đến nút quay số và các thành phần hộp đầu ra nhật ký, đồng thời chúng tôi sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thêm trình xử lý sự kiện vào nút quay số để việc nhấp vào nút đó sẽ gọi hàm `connectAndDial()` để bắt đầu quá trình kết nối.

```js
const dialButton = document.querySelector("#dial");
const logElement = document.querySelector(".log");
dialButton.addEventListener("click", connectAndDial);
```

#### Bắt đầu quá trình kết nối

Khi nhấp vào nút quay số, `connectAndDial()` sẽ được gọi. Việc này bắt đầu xây dựng kết nối WebRTC để chuẩn bị gửi mã DTMF.

```js
function connectAndDial() {
  callerPC = new RTCPeerConnection();

  hasAddTrack = callerPC.addTrack !== undefined;

  callerPC.onicecandidate = handleCallerIceEvent;
  callerPC.onnegotiationneeded = handleCallerNegotiationNeeded;
  callerPC.oniceconnectionstatechange = handleCallerIceConnectionStateChange;
  callerPC.onsignalingstatechange = handleCallerSignalingStateChangeEvent;
  callerPC.onicegatheringstatechange = handleCallerGatheringStateChangeEvent;

  receiverPC = new RTCPeerConnection();
  receiverPC.onicecandidate = handleReceiverIceEvent;

  if (hasAddTrack) {
    receiverPC.ontrack = handleReceiverTrackEvent;
  } else {
    receiverPC.onaddstream = handleReceiverAddStreamEvent;
  }

  navigator.mediaDevices
    .getUserMedia(mediaConstraints)
    .then(gotStream)
    .catch((err) => log(err.message));
}
```

Sau khi tạo `RTCPeerConnection` cho người gọi (`callerPC`), chúng tôi xem liệu nó có phương thức {{domxref("RTCPeerConnection.addTrack", "addTrack()")}} hay không. Nếu đúng như vậy, chúng tôi đặt `hasAddTrack` thành `true`; nếu không, chúng tôi đặt nó thành `false`. Biến này sẽ cho phép ví dụ hoạt động ngay cả trên các trình duyệt chưa triển khai phương thức `addTrack()` mới hơn; chúng ta sẽ làm như vậy bằng cách quay lại phương thức {{domxref("RTCPeerConnection.addStream", "addStream()")}} cũ hơn.

Tiếp theo, trình xử lý sự kiện cho người gọi được thiết lập. Chúng tôi sẽ trình bày chi tiết những điều này sau.

Sau đó, `RTCPeerConnection` thứ hai, đại diện cho phần nhận cuộc gọi kết thúc, được tạo và lưu trữ trong `receiverPC`; trình xử lý sự kiện `onicecandidate` của nó cũng được thiết lập.

Nếu `addTrack()` được hỗ trợ, chúng tôi sẽ thiết lập trình xử lý sự kiện `ontrack` của bộ thu; nếu không, chúng tôi sẽ thiết lập `onaddstream`. Các sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} và {{domxref("RTCPeerConnection/addstream_event", "addstream")}} được gửi khi phương tiện được thêm vào kết nối.

Cuối cùng, chúng tôi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} để có quyền truy cập vào micrô của người gọi. Nếu thành công, hàm `gotStream()` sẽ được gọi, nếu không chúng ta sẽ ghi lỗi vì việc gọi không thành công.

#### Thêm âm thanh vào kết nối

Như đã đề cập ở trên, khi nhận được đầu vào âm thanh từ micrô, `gotStream()` sẽ được gọi. Công việc của nó là xây dựng luồng được gửi đến máy thu, để quá trình bắt đầu truyền thực tế có thể bắt đầu. Nó cũng có quyền truy cập vào `RTCDTMFSender` mà chúng tôi sẽ sử dụng để phát DTMF trên kết nối.

```js
function gotStream(stream) {
  log("Got access to the microphone.");

  let audioTracks = stream.getAudioTracks();

  if (hasAddTrack) {
    if (audioTracks.length > 0) {
      audioTracks.forEach((track) => callerPC.addTrack(track, stream));
    }
  } else {
    log(
      "Your browser doesn't support RTCPeerConnection.addTrack(). Falling " +
        "back to the <strong>deprecated</strong> addStream() method…",
    );
    callerPC.addStream(stream);
  }

  if (callerPC.getSenders) {
    dtmfSender = callerPC.getSenders()[0].dtmf;
  } else {
    log(
      "Your browser doesn't support RTCPeerConnection.getSenders(), so " +
        "falling back to use <strong>deprecated</strong> createDTMFSender() " +
        "instead.",
    );
    dtmfSender = callerPC.createDTMFSender(audioTracks[0]);
  }

  dtmfSender.ontonechange = handleToneChangeEvent;
}
```

Sau khi đặt `audioTracks` thành danh sách các bản âm thanh trên luồng từ micrô của người dùng, đã đến lúc thêm phương tiện vào `RTCPeerConnection` của người gọi. Nếu `addTrack()` có sẵn trên `RTCPeerConnection`, chúng tôi sẽ thêm từng bản âm thanh của luồng vào kết nối bằng {{domxref("RTCPeerConnection.addTrack()")}}. Nếu không, chúng tôi gọi {{domxref("RTCPeerConnection.addStream()")}} để thêm luồng vào cuộc gọi dưới dạng một đơn vị.Tiếp theo, chúng ta xem liệu phương thức {{domxref("RTCPeerConnection.getSenders()")}} có được triển khai hay không. Nếu đúng như vậy, chúng tôi gọi nó trên `callerPC` và nhận mục nhập đầu tiên trong danh sách người gửi được trả về; đây là {{domxref("RTCRtpSender")}} chịu trách nhiệm truyền dữ liệu cho bản âm thanh đầu tiên trong cuộc gọi (là bản nhạc chúng tôi sẽ gửi DTMF qua). Sau đó, chúng tôi lấy thuộc tính {{domxref("RTCRtpSender.dtmf", "dtmf")}} của `RTCRtpSender`, là một đối tượng {{domxref("RTCDTMFSender")}} có thể gửi DTMF trên kết nối, từ người gọi đến người nhận.

Nếu `getSenders()` không có sẵn, thay vào đó chúng ta gọi {{domxref("RTCPeerConnection.createDTMFSender()")}} để lấy đối tượng `RTCDTMFSender`. Mặc dù phương pháp này đã lỗi thời nhưng ví dụ này hỗ trợ nó như một phương pháp dự phòng để cho phép các trình duyệt cũ hơn (và những trình duyệt chưa được cập nhật để hỗ trợ API WebRTC DTMF hiện tại) chạy ví dụ.

Cuối cùng, chúng tôi đặt trình xử lý sự kiện {{domxref("RTCDTMFSender.tonechange_event", "ontonechange")}} của người gửi DTMF để chúng tôi nhận được thông báo mỗi khi âm DTMF phát xong.

Bạn có thể tìm thấy chức năng nhật ký ở cuối tài liệu.

#### Khi một âm kết thúc phát

Mỗi khi âm DTMF phát xong, một sự kiện [`tonechange`](/en-US/docs/Web/API/RTCDTMFSender/tonechange_event) sẽ được gửi tới `callerPC`. Trình xử lý sự kiện cho những điều này được triển khai dưới dạng hàm `handleToneChangeEvent()`.

```js
function handleToneChangeEvent(event) {
  if (event.tone !== "") {
    log(`Tone played: ${event.tone}`);
  } else {
    log("All tones have played. Disconnecting.");
    callerPC.getLocalStreams().forEach((stream) => {
      stream.getTracks().forEach((track) => {
        track.stop();
      });
    });
    receiverPC.getLocalStreams().forEach((stream) => {
      stream.getTracks().forEach((track) => {
        track.stop();
      });
    });

    audio.pause();
    audio.srcObject = null;
    receiverPC.close();
    callerPC.close();
  }
}
```

Sự kiện [`tonechange`](/en-US/docs/Web/API/RTCDTMFSender/tonechange_event) được sử dụng để cho biết khi nào một âm riêng lẻ đã phát và khi tất cả các âm đã phát xong. Thuộc tính {{domxref("RTCDTMFToneChangeEvent.tone", "tone")}} của sự kiện là một chuỗi cho biết âm nào vừa phát xong. Nếu tất cả các âm đã phát xong, `tone` là một chuỗi trống; trong trường hợp đó, {{domxref("RTCDTMFSender.toneBuffer")}} trống.

Trong ví dụ này, chúng tôi đăng nhập vào màn hình âm báo vừa phát xong. Trong một ứng dụng nâng cao hơn, bạn có thể cập nhật giao diện người dùng, chẳng hạn như để cho biết nốt nào hiện đang được phát.

Mặt khác, nếu bộ đệm âm trống, ví dụ của chúng tôi được thiết kế để ngắt kết nối cuộc gọi. Điều này được thực hiện bằng cách dừng từng luồng trên cả người gọi và người nhận bằng cách lặp lại danh sách bản nhạc của mỗi `RTCPeerConnection` (như được trả về bởi phương thức {{domxref("MediaStream.getTracks", "getTracks()")}} của nó) và gọi phương thức {{domxref("MediaStreamTrack.stop", "stop()")}} của từng bản nhạc.

Sau khi tất cả các rãnh phương tiện của người gọi và người nhận đều dừng lại, chúng tôi tạm dừng phần tử {{HTMLElement("audio")}} và đặt {{domxref("HTMLMediaElement.srcObject", "srcObject")}} của nó thành `null`. Thao tác này sẽ tách luồng âm thanh khỏi phần tử {{HTMLElement("audio")}}.

Sau đó, cuối cùng, mỗi `RTCPeerConnection` được đóng bằng cách gọi phương thức {{domxref("RTCPeerConnection.close", "close()")}} của nó.

#### Thêm ứng viên vào người gọi

Khi lớp ICE `RTCPeerConnection` của người gọi đưa ra một ứng cử viên mới để đề xuất, nó sẽ đưa ra một sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} cho `callerPC`. Công việc của trình xử lý sự kiện `icecandidate` là truyền ứng viên đến người nhận. Trong ví dụ của chúng tôi, chúng tôi đang trực tiếp điều khiển cả người gọi và người nhận, vì vậy chúng tôi có thể trực tiếp thêm ứng cử viên vào người nhận bằng cách gọi phương thức {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} của nó. Việc đó được xử lý bởi `handleCallerIceEvent()`:

```js
function handleCallerIceEvent(event) {
  if (event.candidate) {
    log(`Adding candidate to receiver: ${event.candidate.candidate}`);

    receiverPC
      .addIceCandidate(new RTCIceCandidate(event.candidate))
      .catch((err) => log(`Error adding candidate to receiver: ${err}`));
  } else {
    log("Caller is out of candidates.");
  }
}
```

Nếu sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} có thuộc tính non-`null` `candidate`, thì chúng tôi tạo một đối tượng {{domxref("RTCIceCandidate")}} mới từ chuỗi `event.candidate` và "truyền" nó đến người nhận bằng cách gọi `receiverPC.addIceCandidate()`, cung cấp `RTCIceCandidate` mới làm đầu vào. Nếu `addIceCandidate()` không thành công, mệnh đề `catch()` sẽ đưa ra lỗi vào hộp nhật ký của chúng tôi.

Nếu `event.candidate` là `null`, điều đó cho biết rằng không còn ứng viên nào trống nữa và chúng tôi ghi lại thông tin đó.

#### Quay số khi kết nối được mở

Thiết kế của chúng tôi yêu cầu khi kết nối được thiết lập, chúng tôi sẽ gửi ngay chuỗi DTMF. Để thực hiện điều đó, chúng tôi theo dõi người gọi để nhận được sự kiện {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}. Sự kiện này được gửi khi một trong số các thay đổi xảy ra đối với trạng thái của quá trình kết nối ICE, bao gồm cả việc thiết lập kết nối thành công.

````js
function handleCallerIceConnectionStateChange() {
  log(`Caller's connection state changed to ${callerPC.iceConnectionState}`);
  if (callerPC.iceConnectionState === "connected") {
    log(`Sending DTMF: "${dialString}"`);
    dtmfSender.insertDTMF(dialString, 400, 50);
  }
}
```Sự kiện `iceconnectionstatechange` thực tế không bao gồm trạng thái mới trong đó, vì vậy chúng tôi lấy trạng thái hiện tại của quá trình kết nối từ thuộc tính {{domxref("RTCPeerConnection.iceConnectionState")}} của `callerPC`. Sau khi ghi lại trạng thái mới, chúng tôi xem liệu trạng thái đó có phải là `"connected"` hay không. Nếu vậy, chúng tôi ghi lại thông tin chúng tôi sắp gửi DTMF, sau đó chúng tôi gọi {{domxref("RTCDTMFSender.insertDTMF", "dtmf.insertDTMF()")}} để gửi DTMF trên cùng một rãnh với phương thức dữ liệu âm thanh trên đối tượng `RTCDTMFSender` mà chúng tôi [được lưu trữ trước đó](#adding_the_audio_to_the_connection) trong `dtmfSender`.

Lệnh gọi của chúng tôi tới `insertDTMF()` chỉ định không chỉ DTMF cần gửi (`dialString`) mà còn chỉ định độ dài của mỗi âm tính bằng mili giây (400 mili giây) và khoảng thời gian giữa các âm (50 mili giây).

#### Đàm phán kết nối
Khi cuộc gọi {{domxref("RTCPeerConnection")}} bắt đầu nhận phương tiện (sau khi luồng của micrô được thêm vào), sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} sẽ được gửi tới người gọi, cho họ biết rằng đã đến lúc bắt đầu đàm phán kết nối với người nhận. Như đã đề cập trước đó, ví dụ của chúng tôi được đơn giản hóa phần nào vì chúng tôi kiểm soát cả người gọi và người nhận, vì vậy `handleCallerNegotiationNeeded()` có thể nhanh chóng xây dựng kết nối bằng cách gọi các phương thức cho cả người gọi và người nhận, như được hiển thị bên dưới.

```js
// Offer to receive audio but not video
const constraints = { audio: true, video: false };

async function handleCallerNegotiationNeeded() {
  log("Negotiating…");
  try {
    const stream = await navigator.mediaDevices.getUserMedia(constraints);
    for (const track of stream.getTracks()) {
      pc.addTrack(track, stream);
    }
    const offer = await callerPC.createOffer();
    log(`Setting caller's local description: ${offer.sdp}`);
    await callerPC.setLocalDescription(offer);
    log("Setting receiver's remote description to the same as caller's local");
    await receiverPC.setRemoteDescription(callerPC.localDescription);
    log("Creating answer");
    const answer = await receiverPC.createAnswer();
    log(`Setting receiver's local description to ${answer.sdp}`);
    await receiverPC.setLocalDescription(answer);
    log("Setting caller's remote description to match");
    await callerPC.setRemoteDescription(receiverPC.localDescription);
  } catch (err) {
    log(`Error during negotiation: ${err.message}`);
  }
}
````

Vì có nhiều phương pháp khác nhau liên quan đến việc đàm phán kết nối trả về {{jsxref("promise")}}, nên chúng ta có thể xâu chuỗi chúng lại với nhau như thế này:

1. Gọi {{domxref("RTCPeerConnection.createOffer", "callerPC.createOffer()")}} để nhận ưu đãi.
2. Sau đó, hãy nhận lời đề nghị đó và đặt mô tả địa phương của người gọi cho phù hợp bằng cách gọi {{domxref("RTCPeerConnection.setLocalDescription", "callerPC.setLocalDescription()")}}.
3. Sau đó "chuyển" ưu đãi đến người nhận bằng cách gọi {{domxref("RTCPeerConnection.setRemoteDescription", "receiverPC.setRemoteDescription()")}}. Điều này sẽ cấu hình máy thu để nó biết người gọi được cấu hình như thế nào.
4. Sau đó, người nhận sẽ tạo câu trả lời bằng cách gọi {{domxref("RTCPeerConnection.createAnswer", "receiverPC.createAnswer()")}}.
5. Sau đó, người nhận đặt mô tả cục bộ của mình để khớp với câu trả lời mới được tạo bằng cách gọi {{domxref("RTCPeerConnection.setLocalDescription", "receiverPC.setLocalDescription()")}}.
6. Sau đó, câu trả lời sẽ được "truyền" đến người gọi bằng cách gọi {{domxref("RTCPeerConnection.setRemoteDescription", "callerPC.setRemoteDescription()")}}. Điều này cho phép người gọi biết cấu hình của người nhận.
7. Nếu xảy ra lỗi bất cứ lúc nào, mệnh đề `catch()` sẽ xuất thông báo lỗi vào nhật ký.

#### Theo dõi các thay đổi trạng thái khác

Chúng tôi cũng có thể theo dõi các thay đổi đối với trạng thái báo hiệu (bằng cách chấp nhận sự kiện {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}) và trạng thái thu thập ICE (bằng cách chấp nhận sự kiện {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}). Chúng tôi không sử dụng những thứ này cho bất kỳ mục đích gì, vì vậy tất cả những gì chúng tôi làm là ghi lại chúng. Chúng tôi hoàn toàn không thể thiết lập những trình xử lý sự kiện này.

```js
function handleCallerSignalingStateChangeEvent() {
  log(`Caller's signaling state changed to ${callerPC.signalingState}`);
}

function handleCallerGatheringStateChangeEvent() {
  log(`Caller's ICE gathering state changed to ${callerPC.iceGatheringState}`);
}
```

#### Thêm ứng viên vào người nhận

Khi lớp ICE `RTCPeerConnection` của người nhận đưa ra một ứng cử viên mới để đề xuất, nó sẽ đưa ra một sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} cho `receiverPC`. Công việc của trình xử lý sự kiện `icecandidate` là truyền ứng viên cho người gọi. Trong ví dụ của chúng tôi, chúng tôi đang trực tiếp điều khiển cả người gọi và người nhận, vì vậy chúng tôi có thể trực tiếp thêm ứng cử viên vào người gọi bằng cách gọi phương thức {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} của nó. Việc đó được xử lý bởi `handleReceiverIceEvent()`.

Mã này tương tự như trình xử lý sự kiện `icecandidate` dành cho người gọi, được thấy trong [Thêm ứng viên vào người gọi](#adding_candidates_to_the_caller) ở trên.

```js
function handleReceiverIceEvent(event) {
  if (event.candidate) {
    log(`Adding candidate to caller: ${event.candidate.candidate}`);

    callerPC
      .addIceCandidate(new RTCIceCandidate(event.candidate))
      .catch((err) => log(`Error adding candidate to caller: ${err}`));
  } else {
    log("Receiver is out of candidates.");
  }
}
```

Nếu sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} có thuộc tính non-`null` `candidate` thì chúng ta sẽ tạo một đối tượng {{domxref("RTCIceCandidate")}} mới từ chuỗi `event.candidate` và gửi nó đến người gọi bằng cách chuyển đối tượng đó vào `callerPC.addIceCandidate()`. Nếu `addIceCandidate()` không thành công, mệnh đề `catch()` sẽ đưa ra lỗi vào hộp nhật ký của chúng tôi.

Nếu `event.candidate` là `null`, điều đó cho biết rằng không còn ứng viên nào trống nữa và chúng tôi ghi lại thông tin đó.

#### Thêm phương tiện vào máy thuKhi người nhận bắt đầu nhận phương tiện, một sự kiện sẽ được gửi đến {{domxref("RTCPeerConnection")}}, `receiverPC` của người nhận. Như đã giải thích trong [Bắt đầu quá trình kết nối](#starting_the_connection_process), đặc tả WebRTC hiện tại sử dụng sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} cho việc này. Vì một số trình duyệt chưa được cập nhật để hỗ trợ tính năng này nên chúng tôi cũng cần xử lý sự kiện {{domxref("RTCPeerConnection/addstream_event", "addstream")}}. Điều này được thể hiện trong các phương pháp `handleReceiverTrackEvent()` và `handleReceiverAddStreamEvent()` bên dưới

```js
function handleReceiverTrackEvent(event) {
  audio.srcObject = event.streams[0];
}

function handleReceiverAddStreamEvent(event) {
  audio.srcObject = event.stream;
}
```

Sự kiện `track` bao gồm thuộc tính {{domxref("RTCTrackEvent.streams", "streams")}} chứa một mảng các luồng mà bản nhạc là thành viên (một bản nhạc có thể là một phần của nhiều luồng). Chúng tôi lấy luồng đầu tiên và đính kèm nó vào phần tử {{HTMLElement("audio")}}.

Sự kiện `addstream` bao gồm thuộc tính {{domxref("MediaStreamEvent.stream", "stream")}} chỉ định một luồng duy nhất được thêm vào bản nhạc. Chúng tôi đính kèm nó vào phần tử `<audio>`.

#### Ghi nhật ký

Hàm `log()` đơn giản được sử dụng trong toàn bộ mã để nối văn bản vào hộp {{HTMLElement("div")}} nhằm hiển thị trạng thái và lỗi cho người dùng.

```js
function log(msg) {
  logElement.innerText += `${msg}\n`;
}
```

### Kết quả

Bạn có thể thử ví dụ này ở đây. Khi nhấp vào nút "Quay số", bạn sẽ thấy một loạt thông báo ghi nhật ký xuất ra; sau đó việc quay số sẽ bắt đầu. Nếu trình duyệt của bạn phát âm thanh rõ ràng như một phần của trải nghiệm người dùng, bạn sẽ nghe thấy chúng khi chúng được truyền đi.

{{ EmbedLiveSample('Simple_example', 600, 500, "", "", "", "microphone") }}

Sau khi truyền xong âm báo, kết nối sẽ đóng lại. Bạn có thể nhấp vào "Quay số" lần nữa để kết nối lại và gửi âm báo.

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Thời gian tồn tại của phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
- [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling) (hướng dẫn và ví dụ giải thích chi tiết hơn về quá trình truyền tín hiệu)
- [Giới thiệu về giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
