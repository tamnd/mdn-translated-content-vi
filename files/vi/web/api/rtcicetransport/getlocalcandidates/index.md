---
title: "RTCIceTransport: phương thức getLocalCandidates()"
short-title: getLocalCandidates()
slug: Web/API/RTCIceTransport/getLocalCandidates
page-type: web-api-instance-method
browser-compat: api.RTCIceTransport.getLocalCandidates
---

{{APIRef("WebRTC")}}

Phương thức **`getLocalCandidates()`** của giao diện {{domxref("RTCIceTransport")}} trả về một mảng các đối tượng {{domxref("RTCIceCandidate")}}, mỗi đối tượng cho một trong các ứng cử viên đã được thiết bị cục bộ thu thập trong phiên tác nhân {{Glossary("ICE")}} hiện tại.

Các ứng cử viên cục bộ được tác nhân ICE đặt vào danh sách này trước khi được gửi đến mã của máy khách cục bộ trong sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} để máy khách có thể chuyển tiếp các ứng cử viên đến đối tác từ xa.

## Cú pháp

```js-nolint
getLocalCandidates()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} JavaScript chứa một đối tượng {{domxref("RTCIceCandidate")}} cho mỗi ứng cử viên đã được xác định cho đến nay trong phiên thu thập ứng cử viên ICE.

Bạn không thể tương quan các ứng cử viên cục bộ này với các ứng cử viên từ xa tương ứng.
Để tìm cặp phù hợp tốt nhất đến nay, hãy gọi {{domxref("RTCIceTransport.getSelectedCandidatePair()")}}.

## Ví dụ

Ví dụ đơn giản này lấy danh sách ứng cử viên cục bộ từ {{domxref("RTCIceTransport")}} cho {{domxref("RTCRtpSender")}} đầu tiên trên {{domxref("RTCPeerConnection")}}, sau đó xuất ra bảng điều khiển tất cả các ứng cử viên trong danh sách.

```js
const localCandidates = pc
  .getSenders()[0]
  .transport.iceTransport.getLocalCandidates();

localCandidates.forEach((candidate, index) => {
  console.log(`Candidate ${index}: ${candidate.candidate}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
