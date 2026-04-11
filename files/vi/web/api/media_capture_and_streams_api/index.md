---
title: Media Capture and Streams API (Media Stream)
slug: Web/API/Media_Capture_and_Streams_API
page-type: web-api-overview
browser-compat:
  - api.MediaStream
  - api.MediaStreamTrack
  - api.MediaDevices
  - api.MediaDeviceInfo
  - api.InputDeviceInfo
  - api.CanvasCaptureMediaStreamTrack
spec-urls:
  - https://w3c.github.io/mediacapture-main/
  - https://w3c.github.io/mediacapture-fromelement/
---

{{DefaultAPISidebar("Media Capture and Streams")}}

**Media Capture and Streams** API, thường được gọi là **Media Streams API** hoặc **MediaStream API**, là một API liên quan đến [WebRTC](/en-US/docs/Web/API/WebRTC_API) cung cấp hỗ trợ cho việc truyền phát dữ liệu âm thanh và video.

Nó cung cấp các giao diện và phương thức để làm việc với các luồng và các track thành phần của chúng, các ràng buộc liên quan đến định dạng dữ liệu, các callback thành công và lỗi khi dùng dữ liệu một cách bất đồng bộ, cùng các sự kiện được phát trong quá trình đó.

## Khái niệm và cách dùng

API này dựa trên việc thao tác một đối tượng {{domxref("MediaStream")}} đại diện cho một luồng dữ liệu âm thanh hoặc video. Xem một ví dụ trong [Lấy media stream](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Taking_still_photos#demo).

Một `MediaStream` gồm từ không đến nhiều đối tượng {{domxref("MediaStreamTrack")}}, đại diện cho các **track** âm thanh hoặc video khác nhau. Mỗi `MediaStreamTrack` có thể có một hoặc nhiều **channel**. Channel đại diện cho đơn vị nhỏ nhất của một media stream, chẳng hạn như một tín hiệu âm thanh gắn với một loa nhất định, ví dụ _trái_ hoặc _phải_ trong một track âm thanh stereo.

Các đối tượng `MediaStream` có một **đầu vào** và một **đầu ra** duy nhất. Một đối tượng `MediaStream` được tạo bởi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} được gọi là _local_, và có nguồn đầu vào là một trong các camera hoặc micro của người dùng. Một `MediaStream` không-local có thể đại diện cho một phần tử media, như {{HTMLElement("video")}} hoặc {{HTMLElement("audio")}}, một stream xuất phát qua mạng và được lấy thông qua API WebRTC {{domxref("RTCPeerConnection")}}, hoặc một stream được tạo bằng [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) {{domxref("MediaStreamAudioDestinationNode")}}.

Đầu ra của đối tượng `MediaStream` được liên kết với một **consumer**. Nó có thể là một phần tử media, như {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}, API WebRTC {{domxref("RTCPeerConnection")}} hoặc một [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) {{domxref("MediaStreamAudioSourceNode")}}.

## Giao diện

Trong các bài viết tham chiếu này, bạn sẽ tìm thấy thông tin nền tảng cần biết về từng giao diện tạo nên Media Capture and Streams API.

- {{domxref("CanvasCaptureMediaStreamTrack")}}
- {{domxref("InputDeviceInfo")}}
- {{domxref("MediaDeviceInfo")}}
- {{domxref("MediaDevices")}}
- {{domxref("MediaStream")}}
- {{domxref("MediaStreamTrack")}}
- {{domxref("MediaStreamTrackEvent")}}
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaTrackSettings")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("OverconstrainedError")}}

## Sự kiện

- {{domxref("MediaStream/addtrack_event", "addtrack")}}
- {{domxref("MediaStreamTrack/ended_event", "ended")}}
- {{domxref("MediaStreamTrack/mute_event", "mute")}}
- {{domxref("MediaStream/removetrack_event", "removetrack")}}
- {{domxref("MediaStreamTrack/unmute_event", "unmute")}}

## Hướng dẫn và bài viết

Bài viết [Capabilities, constraints, and settings](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints) thảo luận về các khái niệm **constraints** và **capabilities**, cũng như các media setting, và bao gồm một [Constraint Exerciser](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser) cho phép bạn thử nghiệm kết quả của các bộ constraint khác nhau được áp dụng cho các track âm thanh và video đến từ các thiết bị đầu vào A/V của máy tính (chẳng hạn như webcam và micro).

Bài viết [Taking still photos with getUserMedia()](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Taking_still_photos) cho thấy cách dùng [`getUserMedia()`](/en-US/docs/Web/API/MediaDevices/getUserMedia) để truy cập camera trên máy tính hoặc điện thoại di động có hỗ trợ `getUserMedia()` và chụp ảnh bằng nó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API) - trang giới thiệu của API.
- [Chụp ảnh tĩnh với WebRTC](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Taking_still_photos): một bản trình diễn và hướng dẫn về cách dùng `getUserMedia()`.
