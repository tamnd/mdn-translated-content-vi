---
title: "RTCPeerConnection: sự kiện icegatheringstatechange"
short-title: icegatheringstatechange
slug: Web/API/RTCPeerConnection/icegatheringstatechange_event
page-type: web-api-event
browser-compat: api.RTCPeerConnection.icegatheringstatechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`icegatheringstatechange`** của giao diện {{domxref("RTCPeerConnection")}} được gửi khi trạng thái thu thập của lớp {{Glossary("ICE")}}, được phản ánh bởi {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}}, thay đổi.
Điều này cho biết liệu việc thương lượng ICE chưa bắt đầu (`new`), đã bắt đầu thu thập candidate (`gathering`) hay đã hoàn tất (`complete`).

## Cú pháp

```js-nolint
addEventListener("icegatheringstatechange", (event) => { })

onicegatheringstatechange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
