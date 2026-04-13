---
title: MediaTrackSupportedConstraints
slug: Web/API/MediaTrackSupportedConstraints
page-type: web-api-interface
spec-urls: https://w3c.github.io/mediacapture-main/#media-track-supported-constraints
---

{{APIRef("Media Capture and Streams")}}

Từ điển **`MediaTrackSupportedConstraints`** thiết lập danh sách các thuộc tính có thể ràng buộc được {{Glossary("user agent")}} hay trình duyệt nhận ra trong việc triển khai đối tượng {{domxref("MediaStreamTrack")}}. Đối tượng tuân theo `MediaTrackSupportedConstraints` được trả về bởi {{domxref("MediaDevices.getSupportedConstraints()")}}.

Do cách các định nghĩa giao diện trong WebIDL hoạt động, nếu một ràng buộc được yêu cầu nhưng không được hỗ trợ, sẽ không có lỗi xảy ra. Thay vào đó, các ràng buộc được chỉ định sẽ được áp dụng, với bất kỳ ràng buộc không được nhận ra nào sẽ bị loại bỏ khỏi yêu cầu. Điều đó có thể dẫn đến các lỗi khó hiểu và khó gỡ lỗi, vì vậy hãy chắc chắn sử dụng `getSupportedConstraints()` để lấy thông tin này trước khi cố gắng thiết lập ràng buộc nếu bạn cần biết sự khác biệt giữa việc bỏ qua ràng buộc một cách lặng lẽ và việc ràng buộc được chấp nhận.

Một tập hợp ràng buộc thực tế được mô tả bằng đối tượng dựa trên từ điển {{domxref("MediaTrackConstraints")}}.

Để tìm hiểu thêm về cách ràng buộc hoạt động, xem [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints).

## Thuộc tính phiên bản

Một số kết hợp nhất định nhưng không nhất thiết phải là tất cả các thuộc tính sau đây sẽ tồn tại trong đối tượng.

- {{domxref("MediaTrackSupportedConstraints.aspectRatio", "aspectRatio")}}
  - : Boolean là `true` nếu ràng buộc [`aspectRatio`](/en-US/docs/Web/API/MediaTrackConstraints/aspectRatio) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.autoGainControl", "autoGainControl")}}
  - : Boolean là `true` nếu ràng buộc [`autoGainControl`](/en-US/docs/Web/API/MediaTrackConstraints/autoGainControl) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.channelCount", "channelCount")}}
  - : Boolean là `true` nếu ràng buộc [`channelCount`](/en-US/docs/Web/API/MediaTrackConstraints/channelCount) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.deviceId", "deviceId")}}
  - : Boolean là `true` nếu ràng buộc [`deviceId`](/en-US/docs/Web/API/MediaTrackConstraints/deviceId) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.echoCancellation", "echoCancellation")}}
  - : Boolean là `true` nếu ràng buộc [`echoCancellation`](/en-US/docs/Web/API/MediaTrackConstraints/echoCancellation) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.facingMode", "facingMode")}}
  - : Boolean là `true` nếu ràng buộc [`facingMode`](/en-US/docs/Web/API/MediaTrackConstraints/facingMode) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.frameRate", "frameRate")}}
  - : Boolean là `true` nếu ràng buộc [`frameRate`](/en-US/docs/Web/API/MediaTrackConstraints/frameRate) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.groupId", "groupId")}}
  - : Boolean là `true` nếu ràng buộc [`groupId`](/en-US/docs/Web/API/MediaTrackConstraints/groupId) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.height", "height")}}
  - : Boolean là `true` nếu ràng buộc [`height`](/en-US/docs/Web/API/MediaTrackConstraints/height) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.latency", "latency")}}
  - : Boolean là `true` nếu ràng buộc [`latency`](/en-US/docs/Web/API/MediaTrackConstraints/latency) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.noiseSuppression", "noiseSuppression")}}
  - : Boolean là `true` nếu ràng buộc [`noiseSuppression`](/en-US/docs/Web/API/MediaTrackConstraints/noiseSuppression) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.restrictOwnAudio", "restrictOwnAudio")}}
  - : Boolean là `true` nếu ràng buộc {{domxref("MediaTrackConstraints.restrictOwnAudio", "restrictOwnAudio")}} được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.resizeMode", "resizeMode")}}
  - : Boolean là `true` nếu ràng buộc [`resizeMode`](/en-US/docs/Web/API/MediaTrackConstraints/resizeMode) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.sampleRate", "sampleRate")}}
  - : Boolean là `true` nếu ràng buộc [`sampleRate`](/en-US/docs/Web/API/MediaTrackConstraints/sampleRate) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.sampleSize", "sampleSize")}}
  - : Boolean là `true` nếu ràng buộc [`sampleSize`](/en-US/docs/Web/API/MediaTrackConstraints/sampleSize) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.suppressLocalAudioPlayback", "suppressLocalAudioPlayback")}}
  - : Boolean là `true` nếu ràng buộc [`suppressLocalAudioPlayback`](/en-US/docs/Web/API/MediaTrackConstraints/suppressLocalAudioPlayback) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.volume", "volume")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Boolean là `true` nếu ràng buộc [`volume`](/en-US/docs/Web/API/MediaTrackConstraints/volume) được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.width", "width")}}
  - : Boolean là `true` nếu ràng buộc [`width`](/en-US/docs/Web/API/MediaTrackConstraints/width) được hỗ trợ trong môi trường hiện tại.

### Thuộc tính phiên bản đặc thù cho rãnh chia sẻ màn hình

Đối với các rãnh chứa nguồn video từ màn hình của người dùng, các thuộc tính bổ sung sau đây có thể được bao gồm, ngoài các thuộc tính có sẵn cho rãnh video:

- {{domxref("MediaTrackSupportedConstraints.displaySurface", "displaySurface")}}
  - : Boolean là `true` nếu ràng buộc {{domxref("MediaTrackConstraints.displaySurface", "displaySurface")}} được hỗ trợ trong môi trường hiện tại.
- {{domxref("MediaTrackSupportedConstraints.logicalSurface", "logicalSurface")}}
  - : Boolean là `true` nếu ràng buộc {{domxref("MediaTrackConstraints.logicalSurface", "logicalSurface")}} được hỗ trợ trong môi trường hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getUserMedia()")}}
- {{domxref("MediaStreamTrack.getConstraints()")}}
- {{domxref("MediaStreamTrack.applyConstraints()")}}
- {{domxref("MediaStreamTrack.getSettings()")}}
