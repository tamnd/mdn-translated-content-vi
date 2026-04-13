---
title: "Thiết lập kết nối: Mô hình đàm phán hoàn hảo WebRTC"
slug: Web/API/WebRTC_API/Perfect_negotiation
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

Bài viết này giới thiệu WebRTC **thỏa thuận hoàn hảo**, mô tả cách hoạt động và lý do nên thương lượng kết nối WebRTC giữa các thiết bị ngang hàng, đồng thời cung cấp mã mẫu để minh họa kỹ thuật này.

Bởi vì [WebRTC](/en-US/docs/Web/API/WebRTC_API) không yêu cầu một cơ chế truyền tải cụ thể để báo hiệu trong quá trình đàm phán kết nối ngang hàng mới nên nó rất linh hoạt. Tuy nhiên, bất chấp sự linh hoạt trong việc vận chuyển và liên lạc các thông điệp báo hiệu, vẫn có một mẫu thiết kế được đề xuất mà bạn nên tuân theo khi có thể, được gọi là đàm phán hoàn hảo.

Sau lần triển khai đầu tiên các trình duyệt hỗ trợ WebRTC, người ta nhận thấy rằng các phần của quy trình thương lượng phức tạp hơn mức cần thiết đối với các trường hợp sử dụng thông thường. Điều này là do một số vấn đề nhỏ với API và một số điều kiện chạy đua tiềm ẩn cần được ngăn chặn. Kể từ đó, những vấn đề này đã được giải quyết, cho phép chúng tôi đơn giản hóa đáng kể quá trình đàm phán WebRTC của mình. Mẫu đàm phán hoàn hảo là một ví dụ về cách thức đàm phán đã được cải thiện kể từ những ngày đầu của WebRTC.

## Khái niệm đàm phán hoàn hảo

Việc đàm phán hoàn hảo giúp bạn có thể tách biệt hoàn toàn và liền mạch quá trình đàm phán khỏi phần logic còn lại của ứng dụng. Đàm phán vốn là một hoạt động không đối xứng: một bên cần đóng vai trò là "người gọi" trong khi bên kia là "người được gọi". Mẫu đàm phán hoàn hảo sẽ loại bỏ sự khác biệt này bằng cách tách sự khác biệt đó thành logic đàm phán độc lập, để ứng dụng của bạn không cần quan tâm đến đầu cuối của kết nối. Đối với ứng dụng của bạn, việc bạn gọi đi hay nhận cuộc gọi không có gì khác biệt.

Điều tốt nhất về đàm phán hoàn hảo là cùng một mã được sử dụng cho cả người gọi và người được gọi, do đó không có sự lặp lại hoặc các cấp độ mã đàm phán bổ sung cần viết.

Đàm phán hoàn hảo hoạt động bằng cách chỉ định cho mỗi người trong số hai người ngang hàng một vai trò trong quá trình đàm phán hoàn toàn tách biệt với trạng thái kết nối WebRTC:

- Một đối tác **lịch sự**, sử dụng tính năng khôi phục ICE để tránh xung đột với các ưu đãi gửi đến. Về cơ bản, một người ngang hàng lịch sự là người có thể gửi lời đề nghị nhưng sau đó sẽ phản hồi nếu lời đề nghị đến từ người ngang hàng kia với câu "Được rồi, đừng bận tâm, hãy bỏ lời đề nghị của tôi đi và thay vào đó tôi sẽ xem xét lời đề nghị của bạn."
- Một người ngang hàng **bất lịch sự**, luôn bỏ qua những lời đề nghị đến xung đột với những lời đề nghị của chính mình. Nó không bao giờ xin lỗi hay từ bỏ bất cứ điều gì với người bạn lịch sự. Bất cứ khi nào xảy ra va chạm, người ngang hàng bất lịch sự sẽ thắng.

Bằng cách này, cả hai bên đều biết chính xác điều gì sẽ xảy ra nếu có sự xung đột giữa các ưu đãi đã được gửi. Việc phản hồi các điều kiện lỗi trở nên dễ dự đoán hơn.

Cách bạn xác định người nào lịch sự và người nào bất lịch sự nói chung là tùy thuộc vào bạn. Nó có thể đơn giản như chỉ định vai trò lịch sự cho người ngang hàng đầu tiên kết nối với máy chủ báo hiệu hoặc bạn có thể làm điều gì đó phức tạp hơn như yêu cầu các đồng nghiệp trao đổi số ngẫu nhiên và gán vai trò lịch sự cho người chiến thắng. Tuy nhiên, bạn quyết tâm, khi các vai trò này được giao cho hai đồng nghiệp, họ có thể làm việc cùng nhau để quản lý tín hiệu theo cách không bế tắc và không yêu cầu nhiều mã bổ sung để quản lý.Một điều quan trọng cần ghi nhớ là: vai trò của người gọi và người được gọi có thể chuyển đổi trong quá trình đàm phán hoàn hảo. Nếu người ngang hàng lịch sự là người gọi và nó gửi lời đề nghị nhưng có xung đột với người ngang hàng bất lịch sự, thì người ngang hàng lịch sự sẽ từ bỏ lời đề nghị của mình và thay vào đó trả lời lời đề nghị mà nó đã nhận được từ người ngang hàng bất lịch sự. Bằng cách đó, người lịch sự đã chuyển từ người gọi sang người được gọi!

Chúng ta hãy xem một ví dụ triển khai mô hình đàm phán hoàn hảo. Mã giả định rằng có một lớp `SignalingChannel` được xác định được sử dụng để liên lạc với máy chủ báo hiệu. Tất nhiên, mã của riêng bạn có thể sử dụng bất kỳ kỹ thuật báo hiệu nào bạn muốn.

Lưu ý rằng mã này giống hệt nhau đối với cả hai thiết bị ngang hàng tham gia kết nối.

## Tạo kết nối báo hiệu và ngang hàng

Đầu tiên, kênh báo hiệu cần được mở và {{domxref("RTCPeerConnection")}} cần được tạo. Máy chủ {{Glossary("STUN")}} được liệt kê ở đây rõ ràng không phải là máy chủ thực; bạn sẽ cần thay thế `stun.my-server.tld` bằng địa chỉ của máy chủ STUN thực.

```js
const config = {
  iceServers: [{ urls: "stun:stun.my-stun-server.tld" }],
};

const signaler = new SignalingChannel();
const pc = new RTCPeerConnection(config);
```

Mã này cũng lấy các phần tử {{HTMLElement("video")}} sử dụng các lớp "self-view" và "remote-view"; tương ứng, những thứ này sẽ chứa chế độ xem tự xem của người dùng cục bộ và chế độ xem luồng đến từ thiết bị ngang hàng từ xa.

## Kết nối với một máy ngang hàng từ xa

```js
const constraints = { audio: true, video: true };
const selfVideo = document.querySelector("video.self-view");
const remoteVideo = document.querySelector("video.remote-view");

async function start() {
  try {
    const stream = await navigator.mediaDevices.getUserMedia(constraints);

    for (const track of stream.getTracks()) {
      pc.addTrack(track, stream);
    }
    selfVideo.srcObject = stream;
  } catch (err) {
    console.error(err);
  }
}
```

Hàm `start()` hiển thị ở trên có thể được gọi bởi một trong hai điểm cuối muốn nói chuyện với nhau. Không quan trọng ai làm việc đó trước; cuộc đàm phán sẽ thành công.

Điều này không khác biệt đáng kể so với mã thiết lập kết nối WebRTC cũ hơn. Máy ảnh và micrô của người dùng được lấy bằng cách gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}. Sau đó, các bản nhạc phương tiện thu được sẽ được thêm vào {{domxref("RTCPeerConnection")}} bằng cách chuyển chúng vào {{domxref("RTCPeerConnection.addTrack", "addTrack()")}}. Sau đó, cuối cùng, nguồn phương tiện cho phần tử tự xem {{HTMLElement("video")}} được biểu thị bằng hằng số `selfVideo` được đặt thành luồng camera và micrô, cho phép người dùng cục bộ xem những gì thiết bị ngang hàng khác nhìn thấy.

## Xử lý các bản nhạc đến

Tiếp theo, chúng ta cần thiết lập trình xử lý cho các sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} để xử lý các đoạn âm thanh và video gửi đến đã được thương lượng để kết nối ngang hàng này nhận được. Để thực hiện việc này, chúng tôi triển khai trình xử lý sự kiện {{domxref("RTCPeerConnection.track_event", "ontrack")}} của {{domxref("RTCPeerConnection")}}.

```js
pc.ontrack = ({ track, streams }) => {
  track.onunmute = () => {
    if (remoteVideo.srcObject) {
      return;
    }
    remoteVideo.srcObject = streams[0];
  };
};
```

Khi sự kiện `track` xảy ra, trình xử lý này sẽ thực thi. Bằng cách sử dụng [phá hủy](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring), các thuộc tính {{domxref("RTCTrackEvent.track", "track")}} và {{domxref("RTCTrackEvent.streams", "streams")}} của {{domxref("RTCTrackEvent")}} sẽ được trích xuất. Cái trước là đoạn video hoặc đoạn âm thanh đang được nhận. Cái sau là một mảng gồm các đối tượng {{domxref("MediaStream")}}, mỗi đối tượng đại diện cho một luồng chứa bản nhạc này (trong một số trường hợp hiếm hoi, một bản nhạc có thể thuộc về nhiều luồng cùng một lúc). Trong trường hợp của chúng tôi, luồng này sẽ luôn chứa một luồng, ở chỉ mục 0, vì chúng tôi đã chuyển một luồng vào `addTrack()` trước đó.

Chúng tôi thêm trình xử lý sự kiện bật tiếng vào bản nhạc vì bản nhạc sẽ không bị tắt tiếng sau khi bắt đầu nhận gói. Chúng tôi đặt phần còn lại của mã tiếp nhận vào đó.

Nếu chúng tôi đã có video đến từ thiết bị ngang hàng từ xa (chúng tôi có thể biết liệu thuộc tính `<video>` của phần tử chế độ xem từ xa đã có giá trị hay chưa thì chúng tôi sẽ không làm gì cả. Mặt khác, chúng tôi đặt `srcObject` thành luồng ở chỉ mục 0 trong mảng `streams`.

## Logic đàm phán hoàn hảo

Bây giờ chúng ta đi vào logic đàm phán hoàn hảo thực sự, hoạt động hoàn toàn độc lập với phần còn lại của ứng dụng.

### Xử lý sự kiện cần thương lượng

Đầu tiên, chúng tôi triển khai trình xử lý sự kiện {{domxref("RTCPeerConnection")}} {{domxref("RTCPeerConnection.negotiationneeded_event", "onnegotiationneeded")}} để nhận mô tả cục bộ và gửi nó bằng kênh báo hiệu đến thiết bị ngang hàng từ xa.

````js
let makingOffer = false;

pc.onnegotiationneeded = async () => {
  try {
    makingOffer = true;
    await pc.setLocalDescription();
    signaler.send({ description: pc.localDescription });
  } catch (err) {
    console.error(err);
  } finally {
    makingOffer = false;
  }
};
```Lưu ý rằng `setLocalDescription()` không có đối số sẽ tự động tạo và đặt mô tả phù hợp dựa trên {{domxref("RTCPeerConnection.signalingState", "signalingState")}} hiện tại. Mô tả đã đặt là câu trả lời cho ưu đãi gần đây nhất từ ​​đối tác từ xa _hoặc_ một ưu đãi mới được tạo nếu không có cuộc đàm phán nào được tiến hành. Ở đây, nó sẽ luôn là `offer`, vì sự kiện cần thương lượng chỉ được kích hoạt ở trạng thái `stable`.

Chúng tôi đặt biến Boolean, `makingOffer` thành `true` để đánh dấu rằng chúng tôi đang chuẩn bị ưu đãi. Chúng tôi đặt `makingOffer` ngay trước khi gọi `setLocalDescription()` để khóa việc can thiệp vào việc gửi ưu đãi này và chúng tôi không xóa ưu đãi đó trở lại `false` cho đến khi ưu đãi được gửi đến máy chủ báo hiệu (hoặc đã xảy ra lỗi khiến ưu đãi không được thực hiện). Để tránh chạy đua, sau này chúng tôi sẽ sử dụng giá trị này thay vì trạng thái báo hiệu để xác định xem một ưu đãi có được xử lý hay không vì giá trị của {{domxref("RTCPeerConnection.signalingState", "signalingState")}} thay đổi không đồng bộ, gây ra xung đột tiềm ẩn giữa cuộc gọi đi và cuộc gọi đến ("lóa").

### Xử lý các ứng viên ICE mới đến
Tiếp theo, chúng ta cần xử lý sự kiện `RTCPeerConnection` {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}}, đó là cách lớp ICE cục bộ chuyển các ứng cử viên cho chúng ta để phân phối đến thiết bị ngang hàng từ xa qua kênh báo hiệu.

```js
pc.onicecandidate = ({ candidate }) => signaler.send({ candidate });
````

Việc này lấy thành viên `candidate` của sự kiện ICE này và chuyển nó tới phương thức `send()` của kênh báo hiệu để gửi qua máy chủ báo hiệu đến thiết bị ngang hàng từ xa.

### Xử lý tin nhắn đến trên kênh báo hiệu

Phần cuối cùng của câu đố là mã để xử lý các tin nhắn đến từ máy chủ báo hiệu. Điều đó được triển khai ở đây dưới dạng trình xử lý sự kiện `onmessage` trên đối tượng kênh báo hiệu. Phương thức này được gọi mỗi khi có tin nhắn đến từ máy chủ báo hiệu.

```js
let ignoreOffer = false;
let isSettingRemoteAnswerPending = false;

signaler.onmessage = async ({ data: { description, candidate } }) => {
  try {
    if (description) {
      const readyForOffer =
        !makingOffer &&
        (pc.signalingState === "stable" || isSettingRemoteAnswerPending);
      const offerCollision = description.type === "offer" && !readyForOffer;

      ignoreOffer = !polite && offerCollision;
      if (ignoreOffer) {
        return;
      }
      isSettingRemoteAnswerPending = description.type === "answer";
      await pc.setRemoteDescription(description);
      isSettingRemoteAnswerPending = false;
      if (description.type === "offer") {
        await pc.setLocalDescription();
        signaler.send({ description: pc.localDescription });
      }
    } else if (candidate) {
      try {
        await pc.addIceCandidate(candidate);
      } catch (err) {
        if (!ignoreOffer) {
          throw err;
        }
      }
    }
  } catch (err) {
    console.error(err);
  }
};
```

Khi nhận được tin nhắn đến từ `SignalingChannel` thông qua trình xử lý sự kiện `onmessage` của nó, đối tượng JSON nhận được sẽ bị hủy cấu trúc để lấy `description` hoặc `candidate` được tìm thấy bên trong. Nếu tin nhắn đến có `description` thì đó là một lời đề nghị hoặc một câu trả lời được gửi bởi thiết bị ngang hàng khác.

Mặt khác, nếu tin nhắn có `candidate` thì đó là ứng cử viên ICE nhận được từ thiết bị ngang hàng ở xa như một phần của [ICE nhỏ giọt](/en-US/docs/Web/API/RTCPeerConnection/canTrickleIceCandidates). Ứng cử viên sẽ được chuyển đến lớp ICE cục bộ bằng cách chuyển nó vào {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}.

#### Khi nhận được mô tả

Nếu chúng tôi nhận được `description`, chúng tôi sẽ chuẩn bị phản hồi đề nghị hoặc câu trả lời sắp tới. Trước tiên, chúng tôi kiểm tra để đảm bảo rằng chúng tôi đang ở trạng thái có thể chấp nhận lời đề nghị. Nếu trạng thái báo hiệu của kết nối không phải là `stable` hoặc nếu đầu kết nối của chúng tôi đã bắt đầu quá trình đưa ra ưu đãi của riêng mình thì chúng tôi cần chú ý đến xung đột ưu đãi.

Nếu chúng tôi là người ngang hàng bất lịch sự và chúng tôi đang nhận được một lời đề nghị xung đột, chúng tôi quay lại mà không đặt mô tả và thay vào đó, đặt `ignoreOffer` thành `true` để đảm bảo chúng tôi cũng bỏ qua tất cả các ứng cử viên mà phía bên kia có thể gửi cho chúng tôi trên kênh báo hiệu thuộc về lời đề nghị này. Làm như vậy sẽ tránh được tiếng ồn do lỗi vì chúng tôi chưa bao giờ thông báo cho phía mình về ưu đãi này.

Nếu chúng ta là người ngang hàng lịch sự và chúng ta đang nhận được một lời đề nghị trái ngược nhau, thì chúng ta không cần phải làm bất cứ điều gì đặc biệt vì lời đề nghị hiện tại của chúng ta sẽ tự động được hủy bỏ trong bước tiếp theo.

Sau khi đảm bảo rằng chúng tôi muốn chấp nhận lời đề nghị, chúng tôi đặt mô tả từ xa cho lời đề nghị đến bằng cách gọi {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}. Điều này cho phép WebRTC biết cấu hình được đề xuất của thiết bị ngang hàng khác là gì. Nếu chúng ta là người lịch sự, chúng ta sẽ từ bỏ lời đề nghị và chấp nhận lời đề nghị mới.Nếu mô tả từ xa mới đặt là một ưu đãi, chúng tôi sẽ yêu cầu WebRTC chọn cấu hình cục bộ phù hợp bằng cách gọi phương thức {{domxref("RTCPeerConnection")}} {{domxref("RTCPeerConnection.setLocalDescription", "setLocalDescription()")}} không có tham số. Điều này khiến `setLocalDescription()` tự động tạo câu trả lời thích hợp để đáp lại lời đề nghị nhận được. Sau đó, chúng tôi gửi câu trả lời qua kênh báo hiệu trở lại thiết bị ngang hàng đầu tiên.

#### Khi tiếp nhận ứng viên ICE

Mặt khác, nếu tin nhắn nhận được có chứa ứng cử viên ICE, chúng tôi sẽ gửi nó đến lớp {{Glossary("ICE")}} cục bộ bằng cách gọi phương thức {{domxref("RTCPeerConnection")}} {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}. Nếu xảy ra lỗi và chúng tôi đã bỏ qua đề nghị gần đây nhất, chúng tôi cũng bỏ qua mọi lỗi có thể xảy ra khi cố gắng thêm ứng viên.

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Thời gian tồn tại của phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
