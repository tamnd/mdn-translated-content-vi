---
title: "RTCSctpTransport: thuộc tính maxMessageSize"
short-title: maxMessageSize
slug: Web/API/RTCSctpTransport/maxMessageSize
page-type: web-api-instance-property
browser-compat: api.RTCSctpTransport.maxMessageSize
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`maxMessageSize`** của giao diện {{DOMxRef("RTCSctpTransport")}} cho biết kích thước tối đa của một tin nhắn có thể được gửi bằng phương thức {{DOMxRef("RTCDataChannel.send()")}}.

## Giá trị

Một giá trị số nguyên cho biết kích thước tối đa, tính bằng byte, của một tin nhắn có thể được gửi bằng phương thức {{DOMxRef("RTCDataChannel.send()")}}.

## Ví dụ

Ví dụ này cho thấy cách bạn có thể chia chuỗi thành các phần đủ nhỏ để gửi dựa trên kích thước tin nhắn tối đa.

```js
// Function splits strings to a specified size and returns array.
function splitStringToMax(str, maxLength) {
  const result = [];
  let i = 0;
  while (i < str.length) {
    result.push(str.substring(i, i + maxLength));
    i += maxLength;
  }
  return result;
}

const peerConnection = new RTCPeerConnection(options);
const channel = peerConnection.createDataChannel("chat");
channel.onopen = (event) => {
  const maximumMessageSize = peerConnection.sctp.maxMessageSize;
  const textToSend = "This is my possibly overly long string!";
  splitStringToMax(textToSend, maximumMessageSize).forEach((elem) => {
    channel.send(elem);
  });
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("RTCSctpTransport")}}
- [Understanding message size limits](/en-US/docs/Web/API/WebRTC_API/Using_data_channels#understanding_message_size_limits) section of [Using WebRTC data channels](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
