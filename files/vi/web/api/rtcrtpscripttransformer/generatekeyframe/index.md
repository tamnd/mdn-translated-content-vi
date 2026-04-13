---
title: "RTCRtpScriptTransformer: phương thức generateKeyFrame()"
short-title: generateKeyFrame()
slug: Web/API/RTCRtpScriptTransformer/generateKeyFrame
page-type: web-api-instance-method
browser-compat: api.RTCRtpScriptTransformer.generateKeyFrame
---

{{APIRef("WebRTC")}}

Phương thức **`generateKeyFrame()`** của giao diện {{domxref("RTCRtpScriptTransformer")}} khiến bộ mã hóa video tạo ra một khung chính.

## Cú pháp

```js-nolint
generateKeyFrame()
generateKeyFrame(rid)
```

### Tham số

- `rid` {{optional_inline}}
  - : Một chuỗi chứa "restriction identifier" ("RID") của stream/bộ mã hóa phải tạo khung chính mới.

    Giá trị phải có từ 1 đến 255 ký tự (bao gồm), và chỉ chứa các ký tự chữ số, dấu gạch dưới, và dấu gạch ngang (`A-Z`, `a-z`, `0-9`, `-`, `_`).
    RID phân biệt chữ hoa chữ thường và phải là duy nhất cho kênh giao tiếp peer.
    <!-- RFC8851 allows '-' and '_' and unlimited length. RFC 8852 disagrees (https://www.rfc-editor.org/errata/eid7132) -->

    Bộ mã hóa đầu tiên khớp với `rid` được chỉ định được sử dụng.
    Nếu không có bộ mã hóa nào khớp với `rid` thì bộ mã hóa đầu tiên được sử dụng, và `rid` được đặt theo các hạn chế của bộ mã hóa.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với timestamp của khung, hoặc bị từ chối với một giá trị ngoại lệ.

### Ngoại lệ

- `InvalidStateError`
  - : Bộ mã hóa không xử lý các khung video, hoặc là `undefined`.
- `TypeError`
  - : `rid` được cung cấp nhưng không tuân thủ các yêu cầu ngữ pháp.
- `NotFoundError`
  - : Không có bộ mã hóa video nào. Điều này có thể được ném ra nếu `RTCRtpSender` tương ứng không hoạt động hoặc track của nó đã kết thúc.

## Mô tả

Phương thức này có thể được gọi bởi một transformer đang xử lý các khung video được mã hóa đi để buộc gửi một khung hoàn chỉnh (khung chính) mới.
Điều này có thể cần thiết bởi một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) mã hóa các khung, để đảm bảo rằng nếu một khóa mã hóa mới được thêm vào, một khung chính được mã hóa bằng khóa đó được gửi càng sớm càng tốt.

Người gửi có thể chỉ định một RID (còn được gọi là "restriction identifier" hoặc "RTP stream ID") để kiểm soát codec nào tạo ra khung chính mới.
Một stream có thể chứa (simulcast) nhiều phiên bản của cùng một nguồn, mỗi phiên bản với các thuộc tính khác nhau như độ phân giải và tốc độ khung.
RID được sử dụng để chỉ một luồng RTP cụ thể, và do đó là bộ mã hóa cần tạo khung mới.
Lưu ý rằng các giá trị RID có sẵn được đặt khi transceiver được sử dụng bởi kết nối được tạo.
Các giá trị RID đang được sử dụng có thể được truy vấn bằng cách gọi {{domxref("RTCRtpSender.getParameters()")}} và kiểm tra thuộc tính [`encodings`](/en-US/docs/Web/API/RTCRtpSender/getParameters#encodings) của giá trị được trả về.

Promise được trả về bởi phương thức sẽ được giải quyết ngay trước khi xếp hàng đợi khung chính tương ứng trong `RTCRtpScriptTransformer` readable.

> [!NOTE]
> Gửi nhiều stream (RID) cùng một lúc được gọi là "simulcast".
> Tính năng này cung cấp cho [middlebox](https://en.wikipedia.org/wiki/Middlebox) cùng một stream ở nhiều cấp chất lượng video, cho phép nó quản lý băng thông bằng cách truyền có chọn lọc các cấp phù hợp cho người tham gia và chuyển đổi độ phân giải nhanh chóng (tức là chuyển sang chuyển tiếp video chất lượng thấp cho mọi người ngoại trừ người nói tích cực).
> Người nhận chỉ nhận một stream, đó là lý do tại sao phương thức receiver tương đương {{domxref("RTCRtpScriptTransformer.sendKeyFrameRequest()")}} không yêu cầu RID được chỉ định.

## Ví dụ

### Gửi khung chính

Ví dụ bên dưới cho thấy cách luồng chính có thể truyền khóa mã hóa đến transform gửi, và kích hoạt codec tạo khung chính.

Lưu ý rằng luồng chính không có quyền truy cập trực tiếp vào đối tượng {{domxref("RTCRtpScriptTransformer")}}, vì vậy nó cần truyền khóa và RID đến worker.
Ở đây chúng ta thực hiện điều đó với một `MessageChannel`, transfer cổng thứ hai đến mã transformer chạy trong worker.
Mã giả định đã có một peer connection, và `videoSender` là một {{domxref("RTCRtpSender")}}.

```js
const worker = new Worker("worker.js");
const channel = new MessageChannel();

videoSender.transform = new RTCRtpScriptTransform(
  worker,
  { name: "senderTransform", port: channel.port2 },
  [channel.port2],
);

// Post RID and new key to the sender
channel.port1.start();
channel.port1.postMessage({
  rid: "1",
  key: "93ae0927a4f8e527f1gce6d10bc6ab6c",
});
```

Trình xử lý sự kiện {{domxref("DedicatedWorkerGlobalScope/rtctransform_event", "rtctransform")}} trong worker lấy cổng và sử dụng nó để lắng nghe các sự kiện `message`.
Nếu nhận được sự kiện, nó lấy `rid` và `key`, sau đó gọi `generateKeyFrame()`.

```js
event.transformer.options.port.onmessage = (event) => {
  const { rid, key } = event.data;
  // key is used by the transformer to encrypt frames (not shown)

  // Get codec to generate a new key frame using the rid
  // Here 'rcEvent' is the rtctransform event.
  rcEvent.transformer.generateKeyFrame(rid);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
