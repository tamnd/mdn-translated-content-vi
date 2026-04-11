---
title: "MediaTrackConstraints: displaySurface property"
short-title: displaySurface
slug: Web/API/MediaTrackConstraints/displaySurface
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.displaySurface_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`displaySurface`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) mô tả giá trị ưu tiên cho thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.displaySurface","displaySurface")}}.

Điều này được ứng dụng thiết lập để thông báo cho user agent về loại bề mặt hiển thị (`window`, `browser`, hoặc `monitor`) mà ứng dụng ưu tiên. Nó không ảnh hưởng đến những gì người dùng có thể chọn để chia sẻ, nhưng có thể được sử dụng để trình bày các tùy chọn theo thứ tự khác.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.displaySurface")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

[`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) chỉ định loại bề mặt hiển thị mà ứng dụng ưu tiên. Giá trị này không thêm hoặc loại bỏ các nguồn hiển thị trong giao diện người dùng của trình duyệt, nhưng có thể sắp xếp lại thứ tự của chúng. Bạn không thể sử dụng thuộc tính này để giới hạn người dùng chỉ trong một tập hợp con của ba giá trị bề mặt hiển thị `window`, `browser` và `monitor` - nhưng, như bạn sẽ thấy bên dưới, bạn có thể xem cái nào đã được chọn và từ chối nó.

Xem [cách ràng buộc được định nghĩa](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#how_constraints_are_defined).

> [!NOTE]
> Bạn không thể đặt [`monitorTypeSurfaces: "exclude"`](/en-US/docs/Web/API/MediaDevices/getDisplayMedia#monitortypesurfaces) cùng lúc với `displaySurface: "monitor"` vì hai cài đặt này mâu thuẫn nhau. Cố thực hiện điều này sẽ dẫn đến lệnh gọi `getDisplayMedia()` liên quan thất bại với lỗi `TypeError`.

## Ghi chú sử dụng

Bạn có thể kiểm tra cài đặt được user agent chọn sau khi phương tiện hiển thị đã được tạo bởi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} bằng cách gọi {{domxref("MediaStreamTrack.getSettings", "getSettings()")}} trên rãnh video {{domxref("MediaStreamTrack")}} của phương tiện hiển thị, sau đó kiểm tra giá trị của đối tượng {{domxref("MediaTrackSettings")}} được trả về {{domxref("MediaTrackSettings.displaySurface", "displaySurface")}}.

Ví dụ, nếu ứng dụng của bạn không muốn chia sẻ màn hình - có nghĩa là có thể có phông nền không phải nội dung đang được chụp - nó có thể sử dụng code tương tự như sau:

```js
let mayHaveBackdropFlag = false;
let displaySurface = displayStream
  .getVideoTracks()[0]
  .getSettings().displaySurface;

if (displaySurface === "monitor") {
  mayHaveBackdropFlag = true;
}
```

Sau code này, `mayHaveBackdrop` là `true` nếu bề mặt hiển thị trong luồng thuộc loại `monitor`. Code sau này có thể sử dụng cờ này để xác định xem có thực hiện xử lý đặc biệt hay không, chẳng hạn như để loại bỏ hoặc thay thế phông nền, hoặc để "cắt" các vùng hiển thị riêng lẻ ra khỏi các khung video nhận được.

## Ví dụ

Dưới đây là một số ví dụ về đối tượng ràng buộc cho `getDisplayMedia()` sử dụng thuộc tính `displaySurface`.

```js
dsConstraints = { displaySurface: "window" }; // 'browser' và 'monitor' cũng có thể dùng
applyConstraints(dsConstraints);
// Người dùng vẫn có thể chọn chia sẻ màn hình hoặc trình duyệt,
// nhưng chúng tôi đã chỉ ra rằng cửa sổ được ưu tiên.
```

Ngoài ra, xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser) để biết cách sử dụng ràng buộc.

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
