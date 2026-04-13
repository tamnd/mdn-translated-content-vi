---
title: "RTCPeerConnectionStats: thuộc tính dataChannelsClosed"
short-title: dataChannelsClosed
slug: Web/API/RTCPeerConnectionStats/dataChannelsClosed
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_peer-connection.dataChannelsClosed
---

{{APIRef("WebRTC")}}

Thuộc tính **`dataChannelsClosed`** của dictionary {{domxref("RTCPeerConnectionStats")}} cho biết số lượng đối tượng {{domxref("RTCDataChannel")}} duy nhất đã rời trạng thái [`open`](/en-US/docs/Web/API/RTCDataChannel/readyState#open) trong suốt vòng đời của chúng.

Một kênh sẽ rời trạng thái `open` nếu một trong hai đầu của kết nối hoặc giao thức truyền tải bên dưới bị đóng.
Lưu ý rằng các kênh chuyển sang [`closing`](/en-US/docs/Web/API/RTCDataChannel/readyState#closing) hoặc [`closed`](/en-US/docs/Web/API/RTCDataChannel/readyState#closed) mà không bao giờ ở trạng thái `open` thì không được tính vào số này.

## Giá trị

Một số nguyên dương cho biết số lượng đối tượng {{domxref("RTCDataChannel")}} duy nhất đã rời trạng thái [`open`](/en-US/docs/Web/API/RTCDataChannel/readyState#open) trong suốt vòng đời của chúng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
