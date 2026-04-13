---
title: MediaStreamTrackAudioSourceNode
slug: Web/API/MediaStreamTrackAudioSourceNode
page-type: web-api-interface
browser-compat: api.MediaStreamTrackAudioSourceNode
---

{{APIRef("Web Audio API")}}

Giao diện **`MediaStreamTrackAudioSourceNode`** là một loại {{domxref("AudioNode")}} đại diện cho nguồn dữ liệu âm thanh được lấy từ một {{domxref("MediaStreamTrack")}} cụ thể thu được thông qua các API [WebRTC](/en-US/docs/Web/API/WebRTC_API) hoặc [Media Capture and Streams](/en-US/docs/Web/API/Media_Capture_and_Streams_API).

Bản thân âm thanh có thể được nhập từ micrô hoặc thiết bị lấy mẫu âm thanh khác, hoặc có thể được nhận qua {{domxref("RTCPeerConnection")}}, trong số các tùy chọn khả dụng khác.

Một `MediaStreamTrackAudioSourceNode` không có đầu vào và có đúng một đầu ra, và được tạo bằng phương thức {{domxref("AudioContext.createMediaStreamTrackSource()")}}. Giao diện này tương tự với {{domxref("MediaStreamAudioSourceNode")}}, ngoại trừ nó cho phép bạn chỉ định rõ ràng track để sử dụng, thay vì giả định track âm thanh đầu tiên trên một luồng.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td>
        được xác định bởi {{domxref("MediaStreamTrack")}} âm thanh đầu tiên
        được truyền cho phương thức
        {{domxref("AudioContext.createMediaStreamTrackSource()")}}
        đã tạo ra nó.
      </td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("MediaStreamTrackAudioSourceNode.MediaStreamTrackAudioSourceNode", "MediaStreamTrackAudioSourceNode()")}}
  - : Tạo một đối tượng `MediaStreamTrackAudioSourceNode` mới với các tùy chọn được chỉ định.

## Thuộc tính phiên bản

_Giao diện `MediaStreamTrackAudioSourceNode` không có thuộc tính riêng; tuy nhiên, nó kế thừa các thuộc tính của giao diện cha {{domxref("AudioNode")}}._

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha {{domxref("AudioNode")}}_.

## Ví dụ

Xem mã ví dụ tại [`AudioContext.createMediaStreamSource()`](/en-US/docs/Web/API/AudioContext/createMediaStreamSource#examples) để biết cách sử dụng đối tượng này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Media Capture and Streams API (Media Streams)](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaStreamAudioSourceNode")}}
