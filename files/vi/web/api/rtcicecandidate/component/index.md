---
title: "RTCIceCandidate: thuộc tính component"
short-title: component
slug: Web/API/RTCIceCandidate/component
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.component
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`component`**
trên giao diện {{domxref("RTCIceCandidate")}} là một chuỗi cho biết
candidate là [RTP](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP) hay
RTCP candidate.

Nếu một candidate biểu diễn cả RTP và RTCP được ghép chung, nó được báo cáo là
RTP candidate.

## Giá trị

Một chuỗi là một trong các giá trị sau:

- `rtp`
  - : Xác định một truyền tải ICE đang được sử dụng cho [Real-time Transport Protocol](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP) (RTP), hoặc cho RTP được ghép với RTP Control Protocol (RTCP). RTP được định nghĩa trong {{RFC(3550)}}. Giá trị này tương ứng với trường ID component trong chuỗi a-line `candidate` với giá trị 1.
- `rtcp`
  - : Xác định một truyền tải ICE đang được sử dụng cho RTCP, được định nghĩa trong {{RFC(3550, "", 6)}}. Giá trị này tương ứng với component ID 2.

## Ghi chú sử dụng

Hãy xem xét dòng thuộc tính {{Glossary("SDP")}} (a-line) này:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

Đây là a-line ICE candidate, có {{domxref("RTCIceCandidate.foundation", "foundation")}}
là 4234997325. Trường tiếp theo trên a-line, `"1"`, là
component ID. Giá trị `"1"` cho biết RTP, được ghi trong thuộc tính
`component` là `"rtp"`. Nếu giá trị này là
`"2"`, a-line sẽ mô tả một RTCP candidate, và
`component` sẽ là `"rtcp"`.

## Ví dụ

Đoạn mã này kiểm tra loại component của candidate và gửi candidate tới
các trình xử lý khác nhau tùy theo giá trị.

```js
if (candidate.component === "rtp") {
  handleRTPCandidate(candidate);
} else if (candidate.component === "rtcp") {
  handleRTCPCandidate(candidate);
} else {
  handleUnknownCandidate(candidate);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
