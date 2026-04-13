---
title: "MediaTrackConstraints: logicalSurface property"
short-title: logicalSurface
slug: Web/API/MediaTrackConstraints/logicalSurface
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.logicalSurface_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`logicalSurface`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.logicalSurface","logicalSurface")}}.

Điều này được sử dụng để chỉ định xem {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} có nên cho phép người dùng chọn các bề mặt hiển thị không nhất thiết hoàn toàn hiển thị trên màn hình hay không, chẳng hạn như các cửa sổ bị che khuất hoặc toàn bộ nội dung của các cửa sổ đủ lớn để yêu cầu cuộn để xem toàn bộ nội dung của chúng.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.logicalSurface")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

[`ConstrainBoolean`](/en-US/docs/Web/API/MediaTrackConstraints#constrainboolean) là `true` nếu các bề mặt logic nên được cho phép trong số các lựa chọn có thể cho người dùng.

Xem [cách ràng buộc được định nghĩa](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#how_constraints_are_defined).

## Ghi chú sử dụng

Bạn có thể kiểm tra cài đặt được user agent chọn sau khi phương tiện hiển thị đã được tạo bởi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} bằng cách gọi {{domxref("MediaStreamTrack.getSettings", "getSettings()")}} trên rãnh video {{domxref("MediaStreamTrack")}} của phương tiện hiển thị, sau đó kiểm tra giá trị của đối tượng {{domxref("MediaTrackSettings")}} được trả về {{domxref("MediaTrackSettings.logicalSurface", "logicalSurface")}}.

Ví dụ, nếu ứng dụng của bạn cần biết liệu bề mặt hiển thị được chọn có phải là bề mặt logic hay không:

```js
let isLogicalSurface = displayStream
  .getVideoTracks()[0]
  .getSettings().logicalSurface;
```

Sau code này, `isLogicalSurface` là `true` nếu bề mặt hiển thị trong luồng là bề mặt logic; tức là bề mặt có thể không hoàn toàn hiển thị trên màn hình, hoặc thậm chí hoàn toàn nằm ngoài màn hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
