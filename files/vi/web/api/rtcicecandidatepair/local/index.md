---
title: "RTCIceCandidatePair: thuộc tính local"
short-title: local
slug: Web/API/RTCIceCandidatePair/local
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidatePair.local
---

{{APIRef("WebRTC")}}

Thuộc tính **`local`** của từ điển **{{domxref("RTCIceCandidatePair")}}** xác định {{domxref("RTCIceCandidate")}} mô tả cấu hình của đầu cục bộ của một kết nối WebRTC khả thi.

## Giá trị

Một {{domxref("RTCIceCandidate")}} mô tả cấu hình của đầu cục bộ của một cặp ứng viên ICE khả thi.
`RTCIceCandidatePair` được trả về bởi phương thức {{domxref("RTCIceTransport")}} {{domxref("RTCIceTransport.getSelectedCandidatePair", "getSelectedCandidatePair()")}}.

## Ví dụ

Ví dụ một dòng này lấy cặp ứng viên hiện tại và sau đó lấy ứng viên cục bộ từ đó.

```js
const candidatePair = pc
  .getSenders()[0]
  .transport.iceTransport.getSelectedCandidatePair();
const localCandidate = candidatePair.local;
```

{{domxref("RTCIceTransport")}} được tìm thấy bằng cách lấy danh sách đối tượng {{domxref("RTCRtpSender")}} cho {{domxref("RTCPeerConnection")}} `pc`.
Trong `RTCRtpSender` đầu tiên, chúng ta lấy {{domxref("RTCDtlsTransport")}} mà qua đó dữ liệu phương tiện đang được truyền và cuối cùng, từ đó, `RTCIceTransport`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
