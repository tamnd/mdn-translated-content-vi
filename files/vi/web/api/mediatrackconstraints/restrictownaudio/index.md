---
title: "MediaTrackConstraints: restrictOwnAudio property"
short-title: restrictOwnAudio
slug: Web/API/MediaTrackConstraints/restrictOwnAudio
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaStreamTrack.applyConstraints.restrictOwnAudio_constraint
---

{{APIRef("Media Capture and Streams")}}{{SeeCompatTable}}

Thuộc tính **`restrictOwnAudio`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainBoolean`](/en-US/docs/Web/API/MediaTrackConstraints#constrainboolean) chỉ định các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.restrictOwnAudio","restrictOwnAudio")}}.

Thuộc tính này kiểm soát xem âm thanh hệ thống xuất phát từ tab đang chụp có bị lọc bỏ khỏi chụp màn hình hay không, cho phép ghi màn hình rõ ràng hơn trong một số trường hợp. Ví dụ, nếu trang web đang chụp tự phát âm thanh hoặc video nhúng, thì âm thanh đó sẽ được đưa vào bản chụp. Vì điều này có thể dẫn đến tiếng vọng không mong muốn hoặc can thiệp với các nguồn âm thanh dự định từ các tab hoặc ứng dụng khác, việc loại bỏ nó khỏi bản chụp là mong muốn.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.restrictOwnAudio")}}, như được trả về bởi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, điều này hiếm khi cần thiết vì các trình duyệt thường bỏ qua mọi ràng buộc mà chúng không nhận ra.

## Giá trị

Giá trị [`ConstrainBoolean`](/en-US/docs/Web/API/MediaTrackConstraints#constrainboolean).

Nếu giá trị là `true`, user agent sẽ cố gắng loại bỏ bất kỳ âm thanh nào xuất phát từ tab đã gọi {{domxref("MediaDevices.getDisplayMedia()")}} để bắt đầu chụp màn hình. Nếu việc loại bỏ âm thanh qua xử lý thất bại, user agent có thể loại trừ tất cả âm thanh xuất phát từ tab đang chụp.

> [!NOTE]
> Nếu bề mặt hiển thị được chụp không bao gồm âm thanh hệ thống, thiết lập này sẽ không có hiệu lực.

Nếu giá trị được đưa ra là `exact`, giá trị boolean của trường đó chỉ ra yêu cầu chính xác cho tính năng `restrictOwnAudio`; nếu user agent không thể đáp ứng yêu cầu này, yêu cầu sẽ dẫn đến lỗi.

Nếu giá trị là `false`, user agent sẽ không cố gắng hạn chế bất kỳ âm thanh hệ thống nào xuất phát từ tab đang chụp.

## Ví dụ

```js
let isCapturingTabSystemAudioRestricted = displayStream
  .getAudioTracks()[0]
  .getSettings().restrictOwnAudio;
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
