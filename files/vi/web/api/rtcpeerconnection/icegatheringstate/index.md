---
title: "RTCPeerConnection: thuộc tính iceGatheringState"
short-title: iceGatheringState
slug: Web/API/RTCPeerConnection/iceGatheringState
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.iceGatheringState
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`iceGatheringState`** của giao diện {{domxref("RTCPeerConnection")}} trả về một chuỗi mô tả trạng thái thu thập ICE của kết nối.
Điều này cho phép bạn phát hiện, chẳng hạn, khi quá trình thu thập ICE candidate đã hoàn tất.
Các giá trị có thể là: `new`, `gathering` hoặc `complete`.

## Giá trị

- `new`
  - : Bộ máy ICE đang bắt đầu, nhưng chưa thu thập candidate nào.
- `gathering`
  - : Bộ máy ICE đang thu thập candidate.
- `complete`
  - : Bộ máy ICE đã thu thập xong tất cả candidate có thể.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection(configuration);

const iceGatheringState = peerConnection.iceGatheringState;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
