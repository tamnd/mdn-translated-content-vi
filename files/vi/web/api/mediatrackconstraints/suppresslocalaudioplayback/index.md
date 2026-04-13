---
title: "MediaTrackConstraints: suppressLocalAudioPlayback property"
short-title: suppressLocalAudioPlayback
slug: Web/API/MediaTrackConstraints/suppressLocalAudioPlayback
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.applyConstraints.suppressLocalAudioPlayback_constraint
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`suppressLocalAudioPlayback`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainBoolean`](/en-US/docs/Web/API/MediaTrackConstraints#constrainboolean) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.suppressLocalAudioPlayback","suppressLocalAudioPlayback")}}. Thuộc tính này kiểm soát xem âm thanh đang phát trong một tab có tiếp tục được phát ra loa cục bộ của người dùng hay không khi tab đó được chụp.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.suppressLocalAudioPlayback")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị [`ConstrainBoolean`](/en-US/docs/Web/API/MediaTrackConstraints#constrainboolean).

Nếu giá trị này là `true` hoặc `false` đơn giản, user agent sẽ cố gắng lấy phương tiện với phát âm thanh cục bộ được bật hoặc tắt như đã chỉ định, nếu có thể, nhưng sẽ không thất bại nếu không thể thực hiện.

Nếu giá trị được đưa ra là `ideal`, giá trị boolean của trường đó chỉ ra cài đặt lý tưởng cho tính năng triệt âm thanh phát cục bộ; nếu không thể đáp ứng, yêu cầu sẽ dẫn đến lỗi.

## Ví dụ

```js
let isLocalAudioSuppressed = displayStream
  .getVideoTracks()[0]
  .getSettings().suppressLocalAudioPlayback;
```

Ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser) cho thấy cách sử dụng các ràng buộc rãnh phương tiện.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
