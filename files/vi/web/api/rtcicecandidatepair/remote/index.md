---
title: "RTCIceCandidatePair: thuộc tính remote"
short-title: remote
slug: Web/API/RTCIceCandidatePair/remote
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidatePair.remote
---

{{APIRef("WebRTC")}}

Thuộc tính **`remote`** của từ điển **{{domxref("RTCIceCandidatePair")}}** xác định {{domxref("RTCIceCandidate")}} mô tả cấu hình của đầu từ xa của một kết nối WebRTC khả thi.

## Giá trị

Một {{domxref("RTCIceCandidate")}} mô tả cấu hình của đầu từ xa của một cặp ứng viên ICE khả thi. `RTCIceCandidatePair` được trả về bởi phương thức {{domxref("RTCIceTransport")}} {{domxref("RTCIceTransport.getSelectedCandidatePair", "getSelectedCandidatePair()")}}.

## Ví dụ

Ví dụ một dòng này lấy cặp ứng viên hiện tại và sau đó lấy ứng viên từ xa từ đó.

```js
const candidatePair = pc
  .getSenders()[0]
  .transport.transport.getSelectedCandidatePair();
const remoteCandidate = candidatePair.remote;
```

{{domxref("RTCIceTransport")}} được tìm thấy bằng cách lấy danh sách đối tượng {{domxref("RTCRtpSender")}} cho {{domxref("RTCPeerConnection")}} `pc`. Trong `RTCRtpSender` đầu tiên, chúng ta lấy {{domxref("RTCDtlsTransport")}} mà qua đó dữ liệu phương tiện đang được truyền và cuối cùng, từ đó, `RTCIceTransport`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
