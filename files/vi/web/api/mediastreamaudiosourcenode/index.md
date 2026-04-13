---
title: MediaStreamAudioSourceNode
slug: Web/API/MediaStreamAudioSourceNode
page-type: web-api-interface
browser-compat: api.MediaStreamAudioSourceNode
---

{{APIRef("Web Audio API")}}

Giao diện **`MediaStreamAudioSourceNode`** là loại {{domxref("AudioNode")}} hoạt động như nguồn âm thanh có phương tiện nhận từ {{domxref("MediaStream")}} thu được bằng API WebRTC hoặc Media Capture and Streams.

Phương tiện này có thể từ micrô (thông qua {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}) hoặc từ đối tác từ xa trong cuộc gọi WebRTC (sử dụng track âm thanh của {{domxref("RTCPeerConnection")}}).

`MediaStreamAudioSourceNode` không có đầu vào và chính xác một đầu ra, được tạo bằng phương thức {{domxref("AudioContext.createMediaStreamSource()")}}.

`MediaStreamAudioSourceNode` lấy âm thanh từ {{domxref("MediaStreamTrack")}} _đầu tiên_ có giá trị thuộc tính {{domxref("MediaStreamTrack.kind", "kind")}} là `audio`. Xem [Thứ tự track](#track_ordering) để biết thêm thông tin về thứ tự các track.

Số kênh đầu ra của nút khớp với số track được tìm thấy trong track âm thanh được chọn.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Number of inputs</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Number of outputs</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Channel count</th>
      <td>
        2 (but note that {{domxref("AudioNode.channelCount")}} is only used for up-mixing and down-mixing {{domxref("AudioNode")}} inputs, and <code>MediaStreamAudioSourceNode</code> doesn't have any input)
      </td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("MediaStreamAudioSourceNode.MediaStreamAudioSourceNode", "MediaStreamAudioSourceNode()")}}
  - : Tạo phiên bản đối tượng `MediaStreamAudioSourceNode` mới với các tùy chọn được chỉ định.

## Thuộc tính phiên bản

_Ngoài các thuộc tính sau, `MediaStreamAudioSourceNode` kế thừa các thuộc tính của lớp cha, {{domxref("AudioNode")}}._

- {{domxref("MediaStreamAudioSourceNode.mediaStream", "mediaStream")}} {{ReadOnlyInline}}
  - : {{domxref("MediaStream")}} được sử dụng khi tạo `MediaStreamAudioSourceNode` này.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("AudioNode")}}_.

## Ghi chú sử dụng

### Thứ tự track

Đối với giao diện `MediaStreamTrackAudioSourceNode`, thứ tự của các track âm thanh trên luồng được xác định bằng cách lấy các track có {{domxref("MediaStreamTrack.kind", "kind")}} là `audio`, sau đó sắp xếp các track theo giá trị thuộc tính {{domxref("MediaStreamTrack.id", "id")}} của chúng, theo thứ tự điểm mã Unicode (về cơ bản là thứ tự chữ cái hoặc từ điển, đối với các ID là chuỗi chữ và số đơn giản).

Track **đầu tiên** là track có `id` xuất hiện đầu tiên khi tất cả các ID track được sắp xếp theo điểm mã Unicode.

Tuy nhiên, điều quan trọng cần lưu ý là quy tắc thiết lập thứ tự này được thêm vào rất lâu sau khi giao diện này lần đầu được giới thiệu vào [Web Audio API](/en-US/docs/Web/API/Web_Audio_API). Vì vậy, bạn không thể dễ dàng dựa vào thứ tự khớp giữa bất kỳ hai trình duyệt hoặc phiên bản trình duyệt nào.

Giao diện {{domxref("MediaStreamTrackAudioSourceNode")}} tương tự như `MediaStreamAudioSourceNode`, nhưng tránh vấn đề này bằng cách cho phép bạn chỉ định track nào bạn muốn sử dụng.

## Ví dụ

Xem [`AudioContext.createMediaStreamSource()`](/en-US/docs/Web/API/AudioContext/createMediaStreamSource#examples) để xem mã ví dụ sử dụng đối tượng này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Media Capture and Streams API (Media Streams)](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaStreamTrackAudioSourceNode")}}
