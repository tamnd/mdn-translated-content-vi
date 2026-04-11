---
title: "RTCDataChannel: sự kiện bufferedamountlow"
short-title: bufferedamountlow
slug: Web/API/RTCDataChannel/bufferedamountlow_event
page-type: web-api-event
browser-compat: api.RTCDataChannel.bufferedamountlow_event
---

{{APIRef("WebRTC")}}

Sự kiện **`bufferedamountlow`** được gửi đến {{domxref("RTCDataChannel")}} khi số byte hiện có trong bộ đệm truyền dữ liệu gửi đi ({{domxref("RTCDataChannel.bufferedAmount", "bufferedAmount")}}) giảm từ trên xuống dưới hoặc bằng ngưỡng được chỉ định trong {{domxref("RTCDataChannel.bufferedAmountLowThreshold", "bufferedAmountLowThreshold")}}.

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("bufferedamountlow", (event) => { })

onbufferedamountlow = (event) => { }
```

## Loại sự kiện

Một [[[PH5]] chung chung.

## Ví dụ

Ví dụ này thiết lập trình xử lý cho `bufferedamountlow` để yêu cầu thêm dữ liệu bất cứ khi nào bộ đệm của kênh dữ liệu giảm xuống dưới số byte được chỉ định bởi {{domxref("RTCDataChannel.bufferedAmountLowThreshold", "bufferedAmountLowThreshold")}} mà chúng tôi đã đặt thành 65536. Nói cách khác, chúng tôi sẽ cố gắng giữ ít nhất 64kB dữ liệu trong bộ đệm, đọc 64kB mỗi lần từ nguồn.

```js
let pc = new RTCPeerConnection();
let dc = pc.createDataChannel("SendFile");
// Replace with your own source object, such as a file handle
let source = null;
dc.bufferedAmountLowThreshold = 65536;

pc.addEventListener("bufferedamountlow", (ev) => {
  if (source.position <= source.length) {
    dc.send(source.readFile(65536));
  }
});
```

Sau khi tạo `RTCPeerConnection`, thao tác này gọi {{domxref("RTCPeerConnection.createDataChannel()")}} để tạo kênh dữ liệu. Sau đó, một trình nghe được tạo cho `bufferedamountlow` để nạp lại bộ đệm dữ liệu đến bất kỳ khi nào nội dung của nó giảm xuống dưới 65536 byte.

Bạn cũng có thể thiết lập trình xử lý cho `bufferedamountlow` bằng thuộc tính trình xử lý sự kiện của nó, `onbufferedamountlow`:

```js
pc.onbufferedamountlow = (ev) => {
  if (source.position <= source.length) {
    dc.send(source.readFile(65536));
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.bufferedAmountLowThreshold")}}
