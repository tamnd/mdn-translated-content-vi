---
title: MediaStreamAudioDestinationNode
slug: Web/API/MediaStreamAudioDestinationNode
page-type: web-api-interface
browser-compat: api.MediaStreamAudioDestinationNode
---

{{APIRef("Web Audio API")}}

Giao diện `MediaStreamAudioDestinationNode` đại diện cho đích âm thanh bao gồm {{domxref("MediaStream")}} [WebRTC](/en-US/docs/Web/API/WebRTC_API) với một `AudioMediaStreamTrack` duy nhất, có thể được sử dụng theo cách tương tự như `MediaStream` thu được từ {{domxref("MediaDevices.getUserMedia", "navigator.mediaDevices.getUserMedia()")}}.

Đây là {{domxref("AudioNode")}} hoạt động như đích âm thanh, được tạo bằng phương thức {{domxref("AudioContext.createMediaStreamDestination()")}}.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Number of inputs</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Number of outputs</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Channel count</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Channel count mode</th>
      <td><code>"explicit"</code></td>
    </tr>
    <tr>
      <th scope="row">Channel count interpretation</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("MediaStreamAudioDestinationNode.MediaStreamAudioDestinationNode", "MediaStreamAudioDestinationNode()")}}
  - : Tạo phiên bản đối tượng `MediaStreamAudioDestinationNode` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("AudioNode")}}_.

- {{domxref("MediaStreamAudioDestinationNode.stream")}}
  - : Một {{domxref("MediaStream")}} chứa một {{domxref("MediaStreamTrack")}} duy nhất có {{domxref("MediaStreamTrack.kind", "kind")}} là `audio` và cùng số kênh với nút. Bạn có thể sử dụng thuộc tính này để lấy luồng từ đồ thị âm thanh và đưa nó vào cấu trúc khác, chẳng hạn như [Media Recorder](/en-US/docs/Web/API/MediaStream_Recording_API).

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("AudioNode")}}_.

## Ví dụ

Xem [`AudioContext.createMediaStreamDestination()`](/en-US/docs/Web/API/AudioContext/createMediaStreamDestination#examples) để xem mã ví dụ tạo `MediaStreamAudioDestinationNode` và sử dụng nó làm nguồn âm thanh để ghi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
