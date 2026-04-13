---
title: "RTCRtpScriptTransform: hàm khởi tạo RTCRtpScriptTransform()"
short-title: RTCRtpScriptTransform()
slug: Web/API/RTCRtpScriptTransform/RTCRtpScriptTransform
page-type: web-api-constructor
browser-compat: api.RTCRtpScriptTransform.RTCRtpScriptTransform
---

{{APIRef("WebRTC")}}

Hàm khởi tạo **`RTCRtpScriptTransform()`** tạo một đối tượng {{domxref("RTCRtpScriptTransform")}} mới.

Việc xây dựng `RTCRtpScriptTransform` tạo ra một {{domxref("RTCRtpScriptTransformer")}} đối xứng trong worker được chỉ định, cùng với các tùy chọn được truyền (nếu có). Các đối tượng trong tham số thứ ba của hàm khởi tạo được chuyển.

Sự kiện {{domxref("DedicatedWorkerGlobalScope.rtctransform_event", "rtctransform")}} sau đó được kích hoạt tại đối tượng toàn cục worker.
Mã worker có thể dùng thuộc tính `event.transformer` để lấy {{domxref("RTCRtpScriptTransformer")}} đối xứng, và `event.transformer.options` được dùng để lấy các tùy chọn.

Lưu ý rằng các tùy chọn chủ yếu được dùng để thông báo cho worker biết transformer đang xử lý các khung đến hay đi, để nó có thể áp dụng một transform phù hợp.

## Cú pháp

```js-nolint
new RTCRtpScriptTransform(worker)
new RTCRtpScriptTransform(worker, options)
new RTCRtpScriptTransform(worker, options, transfer)
```

### Tham số

- `worker`
  - : Một {{domxref("Worker")}}, sẽ định nghĩa mã cho một hoặc nhiều WebRTC transform stream.
- `options` {{optional_inline}}
  - : Một đối tượng tùy ý sẽ được cung cấp trong worker.
    Đây thường được dùng để thông báo cho worker biết liệu nó được chèn vào pipeline gửi hay nhận của WebRTC, và do đó transform nào nên được áp dụng.
    Tuy nhiên nó cũng có thể được dùng để gửi bất kỳ đối tượng nào khác, chẳng hạn như {{domxref("MessagePort")}} để giao tiếp động với transformer.
- `transfer` {{optional_inline}}
  - : Một [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) tùy chọn của [đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) sẽ được chuyển đến worker.
    Sau khi chuyển, các đối tượng này không thể sử dụng trong luồng chính.

### Ngoại lệ

- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu một đối tượng trong `transfer` không thể được chuyển.

## Ví dụ

Ví dụ đầu tiên bên dưới cho thấy việc xây dựng một {{domxref("RTCRtpScriptTransform")}} sau đó được gán cho một {{domxref("RTCRtpSender.transform")}}.
Hàm khởi tạo nhận một đối tượng tùy chọn với thuộc tính `name` và `senderTransform`.
Worker có thể dùng tùy chọn này để hiểu khi nào nó đang biến đổi các khung được mã hóa từ bộ mã hóa (thay vì các khung đến từ bộ tháo gói).

```js
// Create a worker containing a TransformStream
const worker = new Worker("worker.js");
videoSender.transform = new RTCRtpScriptTransform(worker, {
  name: "senderTransform",
});
```

Bất kỳ tên và giá trị thuộc tính nào cũng có thể được dùng trong options, miễn là chúng có thể được tuần tự hóa (và [chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) nếu được chỉ định trong tham số cuối của hàm khởi tạo).
Mã bên dưới chuyển cổng thứ hai của một {{domxref("MessageChannel")}} cho worker, điều này chúng ta có thể làm để cập nhật động mã transform với (giả sử) một khóa mã hóa mới.

```js
// Create a worker containing a TransformStream
const worker = new Worker("worker.js");
const channel = new MessageChannel();

const transform = new RTCRtpScriptTransform(
  worker,
  { purpose: "encrypt", port: channel.port2 },
  [channel.port2],
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
- {{domxref("RTCRtpSender.transform")}}
- {{domxref("RTCRtpReceiver.transform")}}
