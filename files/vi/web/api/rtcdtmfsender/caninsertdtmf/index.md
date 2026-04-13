---
title: "RTCDTMFSender: canInsertDTMF property"
short-title: canInsertDTMF
slug: Web/API/RTCDTMFSender/canInsertDTMF
page-type: web-api-instance-property
browser-compat: api.RTCDTMFSender.canInsertDTMF
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`canInsertDTMF`** của giao diện {{domxref("RTCDTMFSender")}} trả về một giá trị boolean cho biết `RTCDTMFSender` có khả năng gửi âm thanh DTMF qua {{domxref("RTCPeerConnection")}} hay không.

## Giá trị

Một giá trị boolean là `true` nếu `RTCDTMFSender` có khả năng gửi âm thanh DTMF, hoặc `false` nếu không.

## Ví dụ

### Sử dụng canInsertDTMF để kiểm tra hỗ trợ DTMF

Ví dụ này cho thấy cách sử dụng thuộc tính `canInsertDTMF` để kiểm tra hỗ trợ DTMF trong kết nối WebRTC và sau đó gửi âm thanh nếu được hỗ trợ.

Mã đầu tiên kiểm tra xem thuộc tính `canInsertDTMF` có được định nghĩa hay không, và nếu có, sử dụng nó để kiểm tra xem việc chèn âm thanh DTMF có được hỗ trợ không. Nếu tính năng được hỗ trợ, {{domxref("RTCDTMFSender.insertDTMF()")}} được gọi để chèn một âm thanh.

```js
if (sender.dtmf.canInsertDTMF) {
  const duration = 500;
  sender.dtmf.insertDTMF("1234", duration);
} else {
  console.log("DTMF function not available");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Using DTMF with WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- {{domxref("RTCDTMFSender.insertDTMF()")}}
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCDTMFSender")}}
- {{domxref("RTCRtpSender")}}
