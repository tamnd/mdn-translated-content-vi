---
title: "Thuộc tính track của RTCRtpSender"
short-title: track
slug: Web/API/RTCRtpSender/track
page-type: web-api-instance-property
browser-compat: api.RTCRtpSender.track
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`track`** của giao diện {{domxref("RTCRtpSender")}} trả về {{domxref("MediaStreamTrack")}} đang được xử lý bởi `RTCRtpSender`.

## Giá trị

Một đối tượng {{domxref("MediaStreamTrack")}} đại diện cho media được liên kết với `RTCRtpSender`. Nếu không có track nào được liên kết với sender, giá trị này là `null`, trong trường hợp đó sender không truyền tải gì cả.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
