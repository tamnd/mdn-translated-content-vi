---
title: "RTCDataChannel: thuộc tính bufferedAmount"
short-title: bufferedAmount
slug: Web/API/RTCDataChannel/bufferedAmount
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.bufferedAmount
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`bufferedAmount`** trả về số byte dữ liệu
hiện đang xếp hàng để được gửi qua kênh dữ liệu. Hàng đợi có thể được xây dựng thành một
kết quả của các cuộc gọi đến phương thức {{domxref("RTCDataChannel.send", "send()")}}. Chỉ điều này
bao gồm dữ liệu được đệm bởi chính tác nhân người dùng; nó không bao gồm bất kỳ chi phí đóng khung nào
hoặc việc đệm được thực hiện bởi hệ điều hành hoặc phần cứng mạng.

Tác nhân người dùng có thể thực hiện quá trình gửi dữ liệu thực tế theo bất kỳ cách nào nó
lựa chọn; việc này có thể được thực hiện định kỳ trong vòng lặp sự kiện hoặc thực sự không đồng bộ. Như
tin nhắn thực sự được gửi đi, giá trị này sẽ giảm đi tương ứng.

> [!LƯU Ý]
> Đóng kênh dữ liệu không đặt lại số lượng này, mặc dù tác nhân người dùng đã xóa
> các tin nhắn được xếp hàng đợi. Tuy nhiên, ngay cả sau khi đóng kênh, vẫn cố gắng gửi
> các tin nhắn tiếp tục được thêm vào giá trị `bufferedAmount`, mặc dù
> tin nhắn không được gửi cũng như không được lưu vào bộ nhớ đệm.

Bất cứ khi nào giá trị này giảm xuống bằng hoặc thấp hơn giá trị được chỉ định trong
{{domxref("RTCDataChannel.bufferedAmountLowThreshold", "bufferedAmountLowThreshold")}}
thuộc tính, tác nhân người dùng sẽ kích hoạt sự kiện {{DOMxRef("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}}. Sự kiện này có thể
được sử dụng, ví dụ, để triển khai mã xếp hàng nhiều tin nhắn hơn để gửi bất cứ khi nào
có chỗ để đệm chúng.

## Giá trị

Số byte dữ liệu hiện đang được xếp hàng để gửi qua kênh dữ liệu nhưng có
vẫn chưa được gửi.

## Ví dụ

Đoạn mã bên dưới bao gồm một chức năng thay đổi nội dung của một khối có ID
"bufferSize" thành một chuỗi cho biết số byte hiện được lưu vào bộ đệm trên một
{{domxref("RTCDataChannel")}}.

```js
const dc = peerConnection.createDataChannel("File Transfer");

// …

function showBufferedAmount(channel) {
  const el = document.getElementById("bufferSize");

  el.innerText = `${channel.bufferedAmount} bytes`;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.bufferedAmountLowThreshold")}}
- sự kiện {{DOMxRef("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}}
