---
title: "RTCIceTransport: phương thức getRemoteCandidates()"
short-title: getRemoteCandidates()
slug: Web/API/RTCIceTransport/getRemoteCandidates
page-type: web-api-instance-method
browser-compat: api.RTCIceTransport.getRemoteCandidates
---

{{APIRef("WebRTC")}}

Phương thức **`getRemoteCandidates()`** của giao diện {{domxref("RTCIceTransport")}} trả về một mảng chứa một {{domxref("RTCIceCandidate")}} cho mỗi ứng cử viên đã được nhận từ đối tác từ xa đến nay trong phiên thu thập {{Glossary("ICE")}} hiện tại.

Mỗi khi mã tín hiệu của bạn gọi {{domxref("RTCPeerConnection.addIceCandidate()")}} để thêm một ứng cử viên đã nhận vào phiên ICE, tác nhân ICE đặt nó vào danh sách được trả về bởi hàm này.

## Cú pháp

```js-nolint
getRemoteCandidates()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chứa một đối tượng {{domxref("RTCIceCandidate")}} cho mỗi ứng cử viên đã được nhận đến nay từ đối tác từ xa trong phiên thu thập ứng cử viên ICE hiện tại.

Điều quan trọng cần lưu ý là không có cách nào để tương quan các ứng cử viên từ xa này với các ứng cử viên cục bộ tương thích.
Để tìm cặp phù hợp tốt nhất đến nay, hãy gọi {{domxref("RTCIceTransport.getSelectedCandidatePair()")}}.

## Ví dụ

Ví dụ đơn giản này lấy danh sách ứng cử viên từ xa từ {{domxref("RTCIceTransport")}} cho {{domxref("RTCRtpSender")}} đầu tiên trên {{domxref("RTCPeerConnection")}}, sau đó xuất ra bảng điều khiển tất cả các ứng cử viên trong danh sách.

```js
const remoteCandidates = pc
  .getSenders()[0]
  .transport.transport.getRemoteCandidates();

remoteCandidates.forEach((candidate, index) => {
  console.log(`Candidate ${index}: ${candidate.candidate}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
