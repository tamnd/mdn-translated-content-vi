---
title: "RTCDataChannel: thuộc tính bufferedAmountLowThreshold"
short-title: bufferedAmountLowThreshold
slug: Web/API/RTCDataChannel/bufferedAmountLowThreshold
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.bufferedAmountLowThreshold
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel`
**`bufferedAmountLowThreshold`** được sử dụng để chỉ định số
byte dữ liệu gửi đi được lưu vào bộ đệm được coi là "thấp". Giá trị mặc định là
0\. Khi số lượng byte gửi đi được đệm, như được chỉ định bởi
Thuộc tính {{domxref("RTCDataChannel.bufferedAmount", "bufferedAmount")}}, rơi vào hoặc
dưới giá trị này, sự kiện {{DOMxRef("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}} sẽ được kích hoạt. Sự kiện này có thể
được sử dụng, ví dụ, để triển khai mã xếp hàng nhiều tin nhắn hơn được gửi bất cứ khi nào
có chỗ để đệm chúng. Người nghe có thể được thêm vào với
{{domxref("RTCDataChannel.bufferedamountlow_event", "onbufferedamountlow")}} hoặc
{{domxref("EventTarget.addEventListener", "addEventListener()")}}.

Tác nhân người dùng có thể thực hiện quá trình gửi dữ liệu thực tế theo bất kỳ cách nào nó
lựa chọn; việc này có thể được thực hiện định kỳ trong vòng lặp sự kiện hoặc thực sự không đồng bộ. Như
tin nhắn thực sự được gửi đi, giá trị này sẽ giảm đi tương ứng.

> [!LƯU Ý]
> Sự kiện `bufferedamountlow` không được kích hoạt sau khi đóng kênh dữ liệu.

## Giá trị

Số byte dữ liệu gửi đi được xếp hàng đợi mà bên dưới bộ đệm được coi là
"thấp."

## Ví dụ

Trong đoạn mã này, `bufferedAmountLowThreshold` được đặt thành 64kB và
trình xử lý cho sự kiện {{DOMxRef("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}} được thiết lập bằng cách đặt
Thuộc tính {{domxref("RTCDataChannel.bufferedamountlow_event", "onbufferedamountlow")}} cho một hàm cần
gửi thêm dữ liệu vào bộ đệm bằng cách gọi {{domxref("RTCDataChannel.send", "send()")}}.

```js
const dc = peerConnection.createDataChannel("File Transfer");
dc.bufferedAmountLowThreshold = 65535;

dc.onbufferedamountlow = () => {
  /* use send() to queue more data to be sent */
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.bufferedAmount")}}
- sự kiện {{DOMxRef("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}}
