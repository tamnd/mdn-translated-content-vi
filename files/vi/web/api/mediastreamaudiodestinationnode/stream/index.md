---
title: "MediaStreamAudioDestinationNode: thuộc tính stream"
short-title: stream
slug: Web/API/MediaStreamAudioDestinationNode/stream
page-type: web-api-instance-property
browser-compat: api.MediaStreamAudioDestinationNode.stream
---

{{ APIRef("Web Audio API") }}

Thuộc tính `stream` của giao diện {{ domxref("AudioContext") }} đại diện cho {{domxref("MediaStream")}} chứa một track âm thanh {{domxref("MediaStreamTrack")}} duy nhất có cùng số kênh với chính nút đó.

Bạn có thể sử dụng thuộc tính này để lấy luồng từ đồ thị âm thanh và đưa nó vào cấu trúc khác, chẳng hạn như [Media Recorder](/en-US/docs/Web/API/MediaStream_Recording_API).

## Giá trị

Một {{domxref("MediaStream")}} chứa một track âm thanh duy nhất. Track âm thanh là một {{domxref("MediaStreamTrack")}} có {{domxref("MediaStreamTrack.kind", "kind")}} là `audio`.

## Ví dụ

Xem [`AudioContext.createMediaStreamDestination()`](/en-US/docs/Web/API/AudioContext/createMediaStreamDestination#examples) để xem mã ví dụ tạo `MediaStreamAudioDestinationNode` và sử dụng thuộc tính `stream` của nó làm nguồn âm thanh để ghi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
