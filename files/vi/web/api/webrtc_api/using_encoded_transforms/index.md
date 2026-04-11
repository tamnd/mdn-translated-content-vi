---
title: Sử dụng WebRTC Biến đổi được mã hóa
slug: Web/API/WebRTC_API/Using_Encoded_Transforms
page-type: guide
browser-compat: api.RTCRtpReceiver.transform
---

{{DefaultAPISidebar("WebRTC")}}

Chuyển đổi mã hóa WebRTC cung cấp cơ chế đưa [API luồng](/en-US/docs/Web/API/Streams_API) hiệu suất cao để sửa đổi khung âm thanh và video được mã hóa vào đường dẫn WebRTC đến và đi.
Điều này cho phép các trường hợp sử dụng như mã hóa đầu cuối các khung được mã hóa bằng mã của bên thứ ba.

API xác định cả đối tượng luồng chính và đối tượng bên công nhân.
Giao diện luồng chính là một phiên bản {{domxref("RTCRtpScriptTransform")}}, trong quá trình xây dựng chỉ định {{domxref("Worker")}} dùng để triển khai mã máy biến áp.
Biến đổi đang chạy trong trình chạy được chèn vào đường dẫn WebRTC đến hoặc đi bằng cách thêm `RTCRtpScriptTransform` vào {{domxref("RTCRtpReceiver.transform")}} hoặc {{domxref("RTCRtpSender.transform")}} tương ứng.

Một đối tượng {{domxref("RTCRtpScriptTransformer")}} tương ứng được tạo trong luồng công việc, có thuộc tính {{domxref("ReadableStream")}} `readable`, thuộc tính {{domxref("WritableStream")}} `writable` và đối tượng `options` được truyền từ hàm tạo {{domxref("RTCRtpScriptTransform")}} liên kết.
Các khung hình video được mã hóa ({{domxref("RTCEncodedVideoFrame")}}) hoặc khung âm thanh ({{domxref("RTCEncodedAudioFrame")}}) từ quy trình WebRTC được xếp vào hàng đợi trên `readable` để xử lý.

`RTCRtpScriptTransformer` được cung cấp để mã hóa dưới dạng thuộc tính `transformer` của sự kiện {{domxref("DedicatedWorkerGlobalScope/rtctransform_event", "rtctransform")}}, được kích hoạt ở phạm vi toàn cầu của nhân viên bất cứ khi nào một khung được mã hóa được xếp vào hàng đợi để xử lý (và ban đầu là xây dựng {{domxref("RTCRtpScriptTransform")}} tương ứng).
Mã công việc phải triển khai trình xử lý cho sự kiện đọc các khung được mã hóa từ `transformer.readable`, sửa đổi chúng nếu cần và ghi chúng vào `transformer.writable` theo cùng thứ tự và không có bất kỳ sự trùng lặp nào.

Mặc dù giao diện không đặt ra bất kỳ hạn chế nào khác đối với việc triển khai, nhưng cách tự nhiên để chuyển đổi khung là tạo [chuỗi ống](/en-US/docs/Web/API/Streams_API/Concepts#pipe_chains) gửi các khung được xếp vào hàng đợi trên luồng `event.transformer.readable` thông qua {{DOMxRef("TransformStream")}} đến luồng `event.transformer.writable`.
Chúng ta có thể sử dụng thuộc tính `event.transformer.options` để định cấu hình bất kỳ mã biến đổi nào tùy thuộc vào việc biến đổi đang xếp hàng các khung hình đến từ bộ đóng gói hay các khung đi từ codec.

Giao diện {{domxref("RTCRtpScriptTransformer")}} cũng cung cấp các phương thức có thể được sử dụng khi gửi video được mã hóa để lấy codec tạo khung "khóa" và khi nhận video để yêu cầu gửi khung khóa mới.
Những điều này có thể hữu ích khi cho phép người nhận bắt đầu xem video nhanh hơn, nếu (ví dụ) họ tham gia cuộc gọi hội nghị khi các khung delta đang được gửi.

Các ví dụ sau đây cung cấp các ví dụ cụ thể hơn về cách sử dụng khung bằng cách triển khai dựa trên {{DOMxRef("TransformStream")}}.

## Kiểm tra xem các phép biến đổi được mã hóa có được hỗ trợ không

Kiểm tra xem [các biến đổi được mã hóa được hỗ trợ](#browser_compatibility) bằng cách kiểm tra sự tồn tại của {{domxref("RTCRtpSender.transform")}} (hoặc {{domxref("RTCRtpReceiver.transform")}}):

```js
const supportsEncodedTransforms =
  window.RTCRtpSender && "transform" in RTCRtpSender.prototype;
```

## Thêm một biến đổi cho các khung gửi đi

Một biến đổi đang chạy trong một trình chạy được chèn vào đường dẫn WebRTC đi bằng cách gán `RTCRtpScriptTransform` tương ứng của nó cho {{domxref("RTCRtpSender.transform")}} cho một rãnh đi.

Ví dụ này cho thấy cách bạn có thể truyền phát video từ webcam của người dùng qua WebRTC, thêm biến đổi được mã hóa WebRTC để sửa đổi các luồng đi.
Mã giả định rằng có một {{domxref("RTCPeerConnection")}} tên là `peerConnection` đã được kết nối với một thiết bị ngang hàng từ xa.

Trước tiên, chúng tôi nhận được {{domxref("MediaStreamTrack")}}, sử dụng {{domxref("MediaDevices/getUserMedia", "getUserMedia()")}} để lấy video {{domxref("MediaStream")}} từ thiết bị đa phương tiện, sau đó sử dụng phương thức {{domxref("MediaStream.getTracks()")}} để lấy {{domxref("MediaStreamTrack")}} đầu tiên trong luồng.

Bản nhạc được thêm vào kết nối ngang hàng bằng cách sử dụng {{domxref("RTCPeerConnection/addTrack()", "addTrack()")}} để bắt đầu truyền trực tuyến đến thiết bị ngang hàng từ xa.
Phương thức `addTrack()` trả về {{domxref("RTCRtpSender")}} đang được sử dụng để gửi bản nhạc.

````js
// Get Video stream and MediaTrack
const stream = await navigator.mediaDevices.getUserMedia({ video: true });
const [track] = stream.getTracks();
const videoSender = peerConnection.addTrack(track, stream);
```Sau đó, một `RTCRtpScriptTransform` được xây dựng bằng cách sử dụng một tập lệnh Worker, xác định phép biến đổi và một đối tượng tùy chọn có thể được sử dụng để truyền các thông báo tùy ý cho trình chạy (trong trường hợp này, chúng tôi đã sử dụng thuộc tính `name` có giá trị "senderTransform" để thông báo cho trình chạy rằng biến đổi này sẽ được thêm vào luồng đi).
Chúng tôi thêm phép biến đổi vào đường dẫn đi bằng cách gán nó cho thuộc tính {{domxref("RTCRtpSender.transform")}}.

```js
// Create a worker containing a TransformStream
const worker = new Worker("worker.js");
videoSender.transform = new RTCRtpScriptTransform(worker, {
  name: "senderTransform",
});
````

Phần [Sử dụng các biến đổi người gửi và người nhận riêng biệt](#using_separate_sender_and_receiver_transforms) bên dưới cho biết cách sử dụng `name` trong một worker.

Lưu ý rằng bạn có thể thêm biến đổi bất kỳ lúc nào, nhưng bằng cách thêm nó ngay sau khi gọi `addTrack()` biến đổi sẽ nhận được khung được mã hóa đầu tiên được gửi.

## Thêm một biến đổi cho các khung hình đến

Một biến đổi đang chạy trong một trình chạy được chèn vào đường dẫn WebRTC đến bằng cách gán `RTCRtpScriptTransform` tương ứng của nó cho {{domxref("RTCRtpReceiver.transform")}} cho rãnh đến.

Ví dụ này cho thấy cách bạn thêm một biến đổi để sửa đổi luồng đến.
Mã giả định rằng có một {{domxref("RTCPeerConnection")}} tên là `peerConnection` đã được kết nối với một thiết bị ngang hàng từ xa.

Đầu tiên, chúng tôi thêm trình xử lý `RTCPeerConnection` [sự kiện `track`](/en-US/docs/Web/API/RTCPeerConnection/track_event) để nắm bắt sự kiện khi thiết bị ngang hàng bắt đầu nhận bản nhạc mới.
Trong trình xử lý, chúng ta tạo một `RTCRtpScriptTransform` và thêm nó vào `event.receiver.transform` (`event.receiver` là một {{domxref("RTCRtpReceiver")}}).
Như trong phần trước, hàm tạo lấy một đối tượng có thuộc tính `name`, nhưng ở đây chúng tôi sử dụng `receiverTransform` làm giá trị để thông báo cho nhân viên biết rằng các khung đang đến.

```js
peerConnection.ontrack = (event) => {
  const worker = new Worker("worker.js");
  event.receiver.transform = new RTCRtpScriptTransform(worker, {
    name: "receiverTransform",
  });
  receivedVideo.srcObject = event.streams[0];
};
```

Xin lưu ý lại rằng bạn có thể thêm luồng biến đổi bất kỳ lúc nào.
Tuy nhiên, bằng cách thêm nó vào trình xử lý sự kiện `track` sẽ đảm bảo rằng luồng biến đổi sẽ nhận được khung được mã hóa đầu tiên cho bản nhạc.

## Công nhân thực hiện

Tập lệnh Worker phải triển khai trình xử lý cho sự kiện {{domxref("DedicatedWorkerGlobalScope/rtctransform_event", "rtctransform")}}, tạo một [chuỗi ống](/en-US/docs/Web/API/Streams_API/Concepts#pipe_chains) dẫn luồng `event.transformer.readable` ({{DOMxRef("ReadableStream")}}) qua luồng {{DOMxRef("TransformStream")}} đến luồng `event.transformer.writable` ({{DOMxRef("WritableStream")}}).

Một nhân viên có thể hỗ trợ chuyển đổi các khung được mã hóa đến hoặc đi hoặc cả hai và việc chuyển đổi có thể được mã hóa cứng hoặc được định cấu hình trong thời gian chạy bằng cách sử dụng thông tin được truyền từ ứng dụng web.

### Chuyển đổi được mã hóa WebRTC cơ bản

Ví dụ bên dưới hiển thị một biến đổi Mã hóa WebRTC cơ bản, loại bỏ tất cả các bit trong các khung được xếp hàng đợi.
Nó không sử dụng hoặc cần các tùy chọn được truyền vào từ luồng chính vì thuật toán tương tự có thể được sử dụng trong đường dẫn bên gửi để phủ định các bit và trong đường dẫn bên nhận để khôi phục chúng.

Mã triển khai trình xử lý sự kiện cho sự kiện `rtctransform`.
Điều này xây dựng một {{DOMxRef("TransformStream")}}, sau đó chuyển qua nó bằng cách sử dụng {{domxref("ReadableStream.pipeThrough()")}} và cuối cùng chuyển đến `event.transformer.writable` bằng cách sử dụng {{domxref("ReadableStream.pipeTo()")}}.

```js
addEventListener("rtctransform", (event) => {
  const transform = new TransformStream({
    start() {}, // Called on startup.
    flush() {}, // Called when the stream is about to be closed.
    async transform(encodedFrame, controller) {
      // Reconstruct the original frame.
      const view = new DataView(encodedFrame.data);

      // Construct a new buffer
      const newData = new ArrayBuffer(encodedFrame.data.byteLength);
      const newView = new DataView(newData);

      // Negate all bits in the incoming frame
      for (let i = 0; i < encodedFrame.data.byteLength; ++i) {
        newView.setInt8(i, ~view.getInt8(i));
      }

      encodedFrame.data = newData;
      controller.enqueue(encodedFrame);
    },
  });
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
});
```

Việc triển khai phép biến đổi được mã hóa WebRTC tương tự như phép biến đổi "chung" {{DOMxRef("TransformStream")}} nhưng có một số khác biệt quan trọng.
Giống như luồng chung, [[LK6]]] của nó nhận một đối tượng xác định phương thức _Optional_ [`start()`](/en-US/docs/Web/API/TransformStream/TransformStream#startcontroller), được gọi khi xây dựng, phương thức [`flush()`](/en-US/docs/Web/API/TransformStream/TransformStream#flushcontroller), được gọi khi luồng sắp bị đóng và phương thức [`transform()`](/en-US/docs/Web/API/TransformStream/TransformStream#transformchunk_controller), được gọi mỗi khi có một đoạn cần xử lý.
Không giống như hàm tạo chung, mọi thuộc tính `writableStrategy` hoặc `readableStrategy` được truyền trong đối tượng hàm tạo đều bị bỏ qua và chiến lược xếp hàng hoàn toàn được quản lý bởi tác nhân người dùng.

Phương thức `transform()` cũng khác ở chỗ nó được truyền một {{domxref("RTCEncodedVideoFrame")}} hoặc {{domxref("RTCEncodedAudioFrame")}} thay vì một "đoạn" chung chung.
Mã thực tế được hiển thị ở đây cho phương thức này không có gì đáng chú ý ngoài việc nó trình bày cách chuyển đổi khung thành một dạng mà bạn có thể sửa đổi và xếp nó vào hàng đợi sau đó trên luồng.### Sử dụng các biến đổi người gửi và người nhận riêng biệt

Ví dụ trước hoạt động nếu hàm biến đổi giống nhau khi gửi và nhận, nhưng trong nhiều trường hợp, thuật toán sẽ khác nhau.
Bạn có thể sử dụng các tập lệnh riêng biệt cho người gửi và người nhận hoặc xử lý cả hai trường hợp trong một trình chạy như minh họa bên dưới.

Nếu công nhân được sử dụng cho cả người gửi và người nhận, thì nó cần biết liệu khung được mã hóa hiện tại đang đi ra từ codec hay đến từ bộ đóng gói.
Thông tin này có thể được chỉ định bằng tùy chọn thứ hai trong [hàm tạo `RTCRtpScriptTransform`](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform).
Ví dụ: chúng ta có thể xác định một `RTCRtpScriptTransform` riêng cho người gửi và người nhận, chuyển cùng một nhân viên và một đối tượng tùy chọn có thuộc tính `name` cho biết liệu biến đổi được sử dụng trong người gửi hay người nhận (như được hiển thị trong các phần trước ở trên).
Sau đó, thông tin sẽ có sẵn trong nhân viên trong `event.transformer.options`.

Trong ví dụ này, chúng tôi triển khai trình xử lý sự kiện `onrtctransform` trên đối tượng phạm vi công nhân chuyên dụng toàn cầu.
Giá trị của thuộc tính `name` được sử dụng để xác định `TransformStream` nào sẽ được xây dựng (các phương thức khởi tạo thực tế không được hiển thị).

```js
// Code to instantiate transform and attach them to sender/receiver pipelines.
onrtctransform = (event) => {
  let transform;
  if (event.transformer.options.name === "senderTransform")
    transform = createSenderTransform(); // returns a TransformStream
  else if (event.transformer.options.name === "receiverTransform")
    transform = createReceiverTransform(); // returns a TransformStream
  else return;
  event.transformer.readable
    .pipeThrough(transform)
    .pipeTo(event.transformer.writable);
};
```

Lưu ý rằng mã để tạo chuỗi ống giống như trong ví dụ trước.

### Giao tiếp trong thời gian chạy với biến đổi

[hàm tạo `RTCRtpScriptTransform`](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform) cho phép bạn chuyển các tùy chọn và chuyển đối tượng cho nhân viên.
Trong ví dụ trước, chúng tôi đã chuyển thông tin tĩnh, nhưng đôi khi bạn có thể muốn sửa đổi thuật toán biến đổi trong trình chạy trong thời gian chạy hoặc lấy lại thông tin từ trình chạy.
Ví dụ: cuộc gọi hội nghị WebRTC hỗ trợ mã hóa có thể cần thêm khóa mới vào thuật toán được biến đổi sử dụng.

Mặc dù có thể chia sẻ thông tin giữa nhân viên đang chạy mã chuyển đổi và luồng chính bằng cách sử dụng {{domxref("Worker.postMessage()")}}, nhưng nhìn chung, việc chia sẻ {{domxref("MessageChannel")}} dưới dạng tùy chọn [hàm tạo `RTCRtpScriptTransform`](/en-US/docs/Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform) sẽ dễ dàng hơn vì khi đó bối cảnh kênh sẽ có sẵn trực tiếp trong `event.transformer.options` khi bạn đang xử lý khung được mã hóa mới.

Mã bên dưới tạo cổng thứ hai {{domxref("MessageChannel")}} và [chuyển nhượng](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) cho nhân viên.
Luồng chính và biến đổi sau đó có thể giao tiếp bằng cổng thứ nhất và thứ hai.

```js
// Create a worker containing a TransformStream
const worker = new Worker("worker.js");

// Create a channel
// Pass channel.port2 to the transform as a constructor option
// and also transfer it to the worker
const channel = new MessageChannel();
const transform = new RTCRtpScriptTransform(
  worker,
  { purpose: "encrypt", port: channel.port2 },
  [channel.port2],
);

// Use the port1 to send a string.
// (we can send and transfer basic types/objects).
channel.port1.postMessage("A message for the worker");
channel.port1.start();
```

Trong công nhân, cổng có sẵn là `event.transformer.options.port`.
Mã bên dưới cho biết cách bạn có thể nghe sự kiện `message` của cổng để nhận tin nhắn từ chuỗi chính.
Bạn cũng có thể sử dụng cổng để gửi tin nhắn trở lại luồng chính.

```js
event.transformer.options.port.onmessage = (event) => {
  // The message payload is in 'event.data';
  console.log(event.data);
};
```

### Kích hoạt khung chính

Video thô hiếm khi được gửi hoặc lưu trữ vì nó tiêu tốn nhiều dung lượng và băng thông để thể hiện từng khung hình dưới dạng một hình ảnh hoàn chỉnh.
Thay vào đó, các codec định kỳ tạo ra một "khung chính" chứa đủ thông tin để xây dựng một hình ảnh đầy đủ và giữa các khung chính sẽ gửi "khung delta" chỉ bao gồm những thay đổi kể từ khung delta cuối cùng.
Mặc dù điều này hiệu quả hơn nhiều so với việc gửi video thô, nhưng điều đó có nghĩa là để hiển thị hình ảnh được liên kết với một khung delta cụ thể, bạn cần có khung hình chính cuối cùng và tất cả các khung delta tiếp theo.

Điều này có thể gây ra sự chậm trễ cho người dùng mới tham gia ứng dụng hội nghị WebRTC vì họ không thể hiển thị video cho đến khi nhận được khung chính đầu tiên.
Tương tự, nếu một biến đổi được mã hóa được sử dụng để mã hóa khung hình, người nhận sẽ không thể hiển thị video cho đến khi họ nhận được khung khóa đầu tiên được mã hóa bằng khóa của mình.Để đảm bảo rằng khung khóa mới có thể được gửi sớm nhất có thể khi cần, đối tượng {{domxref("RTCRtpScriptTransformer")}} trong `event.transformer` có hai phương thức: {{domxref("RTCRtpScriptTransformer.generateKeyFrame()")}}, khiến codec tạo khung khóa và {{domxref("RTCRtpScriptTransformer.sendKeyFrameRequest()")}}, mà người nhận có thể sử dụng để yêu cầu khung khóa từ người gửi.

Ví dụ bên dưới cho thấy cách luồng chính có thể chuyển khóa mã hóa đến biến đổi người gửi và kích hoạt codec để tạo khung khóa.
Lưu ý rằng luồng chính không có quyền truy cập trực tiếp vào đối tượng {{domxref("RTCRtpScriptTransformer")}}, do đó, nó cần chuyển khóa và mã định danh hạn chế ("rid") cho nhân viên ("rid" là id luồng, cho biết bộ mã hóa phải tạo khung khóa).
Ở đây chúng ta thực hiện điều đó với `MessageChannel`, sử dụng mẫu tương tự như trong phần trước.
Mã giả định đã có kết nối ngang hàng và `videoSender` là {{domxref("RTCRtpSender")}}.

```js
const worker = new Worker("worker.js");
const channel = new MessageChannel();

videoSender.transform = new RTCRtpScriptTransform(
  worker,
  { name: "senderTransform", port: channel.port2 },
  [channel.port2],
);

// Post rid and new key to the sender
channel.port1.start();
channel.port1.postMessage({
  rid: "1",
  key: "93ae0927a4f8e527f1gce6d10bc6ab6c",
});
```

Trình xử lý sự kiện {{domxref("DedicatedWorkerGlobalScope/rtctransform_event", "rtctransform")}} trong worker nhận cổng và sử dụng nó để lắng nghe các sự kiện `message` từ luồng chính.
Nếu một sự kiện được nhận, nó sẽ nhận được `rid` và `key`, sau đó gọi `generateKeyFrame()`.

```js
event.transformer.options.port.onmessage = (event) => {
  const { rid, key } = event.data;
  // key is used by the transformer to encrypt frames (not shown)

  // Get codec to generate a new key frame using the rid
  // Here 'rcEvent' is the rtctransform event.
  rcEvent.transformer.generateKeyFrame(rid);
};
```

Mã để người nhận yêu cầu khung khóa mới sẽ gần như giống hệt nhau, ngoại trừ "loại bỏ" không được chỉ định.
Đây là mã chỉ dành cho trình xử lý thông báo cổng:

```js
event.transformer.options.port.onmessage = (event) => {
  const { key } = event.data;
  // key is used by the transformer to decrypt frames (not shown)

  // Request sender to emit a key frame.
  transformer.sendKeyFrameRequest();
};
```

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpScriptTransform")}}
- {{domxref("RTCRtpReceiver.transform")}}
- {{domxref("RTCRtpSender.transform")}}
- sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}}
- {{domxref("RTCTransformEvent")}}
- {{domxref("RTCRtpScriptTransformer")}}
- {{domxref("RTCEncodedVideoFrame")}}
- {{domxref("RTCEncodedAudioFrame")}}
