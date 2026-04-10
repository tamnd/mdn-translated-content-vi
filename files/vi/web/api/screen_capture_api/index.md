---
title: Screen Capture API
slug: Web/API/Screen_Capture_API
page-type: web-api-overview
browser-compat:
  - api.MediaDevices.getDisplayMedia
  - api.CropTarget
  - api.RestrictionTarget
spec-urls:
  - https://w3c.github.io/mediacapture-screen-share/
  - https://screen-share.github.io/element-capture/
  - https://w3c.github.io/mediacapture-region/
  - https://w3c.github.io/mediacapture-surface-control/
---

{{DefaultAPISidebar("Screen Capture API")}}

Screen Capture API bổ sung vào Media Capture and Streams API hiện có để cho phép người dùng chọn một màn hình hoặc một phần của màn hình (chẳng hạn một cửa sổ) để ghi lại dưới dạng một media stream. Stream này sau đó có thể được ghi lại hoặc chia sẻ với người khác qua mạng.

## Khái niệm và cách dùng của Screen Capture API

Screen Capture API khá đơn giản để sử dụng. Phương thức chính của nó là {{domxref("MediaDevices.getDisplayMedia()")}}, có nhiệm vụ yêu cầu người dùng chọn một màn hình hoặc một phần màn hình để ghi lại dưới dạng {{domxref("MediaStream")}}.

Để bắt đầu ghi video từ màn hình, hãy gọi `getDisplayMedia()` trên `navigator.mediaDevices`:

```js
captureStream =
  await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
```

{{jsxref("Promise")}} được trả về bởi `getDisplayMedia()` sẽ được giải quyết thành một {{domxref("MediaStream")}} phát luồng vùng hiển thị đã được ghi lại.

Xem bài viết [Dùng Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture) để tìm hiểu sâu hơn về cách dùng API này để ghi nội dung màn hình thành một stream.

### Các phần mở rộng của screen capture

Screen Capture API có thêm các tính năng mở rộng khả năng của nó:

#### Giới hạn vùng màn hình được ghi trong stream

- **Element Capture API** giới hạn vùng được ghi chỉ còn một cây DOM đã hiển thị cụ thể cùng các phần tử con của nó.
- **Region Capture API** cắt vùng được ghi thành khu vực của màn hình nơi một phần tử DOM được chỉ định đang được hiển thị.

Xem [Dùng Element Capture và Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture) để biết thêm.

#### Điều khiển vùng màn hình được ghi

**Captured Surface Control API** cho phép ứng dụng ghi cung cấp một mức điều khiển giới hạn đối với vùng hiển thị được ghi, chẳng hạn phóng to và cuộn nội dung của nó.

Xem [Dùng Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) để biết thêm.

## Giao diện

- {{domxref("BrowserCaptureMediaStreamTrack")}}
  - : Đại diện cho một video track đơn lẻ; mở rộng lớp {{domxref("MediaStreamTrack")}} với các phương thức để giới hạn phần của stream tự ghi (chẳng hạn màn hình hoặc cửa sổ của người dùng) được ghi lại.
- {{domxref("CaptureController")}}
  - : Cung cấp các phương thức có thể dùng để thao tác sâu hơn lên một vùng hiển thị được ghi (ghi qua {{domxref("MediaDevices.getDisplayMedia()")}}). Một đối tượng `CaptureController` được gắn với vùng hiển thị được ghi bằng cách truyền nó vào lời gọi `getDisplayMedia()` dưới dạng giá trị của thuộc tính `controller` trong đối tượng tùy chọn.
- {{domxref("CropTarget")}}
  - : Cung cấp một phương thức tĩnh, {{domxref("CropTarget.fromElement_static", "fromElement()")}}, trả về một thể hiện {{domxref("CropTarget")}} có thể dùng để cắt một video track đã ghi về khu vực mà một phần tử được chỉ định đang được hiển thị.
- {{domxref("RestrictionTarget")}}
  - : Cung cấp một phương thức tĩnh, {{domxref("RestrictionTarget.fromElement_static", "fromElement()")}}, trả về một thể hiện {{domxref("RestrictionTarget")}} có thể dùng để giới hạn một video track đã ghi chỉ còn một phần tử DOM cụ thể.

## Bổ sung cho giao diện MediaDevices

- {{domxref("MediaDevices.getDisplayMedia()")}}
  - : Phương thức `getDisplayMedia()` được thêm vào giao diện `MediaDevices`. Tương tự như {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}, phương thức này tạo một promise giải quyết thành một {{domxref("MediaStream")}} chứa vùng hiển thị mà người dùng đã chọn, ở định dạng khớp với các tùy chọn đã chỉ định.

## Bổ sung cho các dictionary hiện có

Screen Capture API thêm thuộc tính vào các dictionary sau được định nghĩa bởi các đặc tả khác.

### MediaTrackConstraints

- {{domxref("MediaTrackConstraints.displaySurface")}}
  - : Một [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) cho biết loại vùng hiển thị nào sẽ được ghi. Giá trị có thể là `browser`, `monitor` hoặc `window`.
- {{domxref("MediaTrackConstraints.logicalSurface")}}
  - : Cho biết liệu video trong stream có đại diện cho một vùng hiển thị logic hay không (tức là một vùng có thể không hoàn toàn hiển thị trên màn hình, hoặc có thể hoàn toàn nằm ngoài màn hình). Giá trị `true` cho biết một vùng hiển thị logic sẽ được ghi.
- {{domxref("MediaTrackConstraints.suppressLocalAudioPlayback")}}
  - : Điều khiển việc âm thanh đang phát trong tab có tiếp tục được phát qua loa cục bộ của người dùng khi tab được ghi hay không, hoặc nó sẽ bị chặn. Giá trị `true` cho biết âm thanh sẽ bị chặn.

### MediaTrackSettings

- {{domxref("MediaTrackSettings.cursor")}}
  - : Một chuỗi cho biết vùng hiển thị đang được ghi có bao gồm con trỏ chuột hay không, và nếu có thì nó chỉ hiển thị khi chuột đang di chuyển hay luôn hiển thị. Giá trị có thể là `always`, `motion` hoặc `never`.
- {{domxref("MediaTrackSettings.displaySurface")}}
  - : Một chuỗi cho biết loại vùng hiển thị nào hiện đang được ghi. Giá trị có thể là `browser`, `monitor` hoặc `window`.
- {{domxref("MediaTrackSettings.logicalSurface")}}
  - : Một giá trị boolean là `true` nếu video đang được ghi không tương ứng trực tiếp với một vùng hiển thị đơn lẻ trên màn hình.
- {{domxref("MediaTrackSettings.suppressLocalAudioPlayback")}}
  - : Một giá trị boolean là `true` nếu âm thanh đang được ghi không được phát ra loa cục bộ của người dùng.
- {{domxref("MediaTrackSettings.screenPixelRatio")}}
  - : Một số biểu diễn tỷ lệ giữa kích thước vật lý của một pixel trên vùng hiển thị được ghi (hiển thị ở độ phân giải vật lý của nó) và kích thước logic của một CSS pixel trên màn hình ghi (hiển thị ở độ phân giải logic của nó). Không thể dùng nó làm constraint hoặc capability.

### MediaTrackSupportedConstraints

- {{domxref("MediaTrackSupportedConstraints.displaySurface")}}
  - : Một boolean là `true` nếu môi trường hiện tại hỗ trợ constraint {{domxref("MediaTrackConstraints.displaySurface")}}.
- {{domxref("MediaTrackSupportedConstraints.logicalSurface")}}
  - : Một boolean là `true` nếu môi trường hiện tại hỗ trợ constraint {{domxref("MediaTrackConstraints.logicalSurface")}}.
- {{domxref("MediaTrackSupportedConstraints.suppressLocalAudioPlayback")}}
  - : Một boolean là `true` nếu môi trường hiện tại hỗ trợ constraint {{domxref("MediaTrackConstraints.suppressLocalAudioPlayback")}}.

## Lưu ý về bảo mật

Các website hỗ trợ [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) (dùng HTTP header {{HTTPHeader("Permissions-Policy")}} hoặc thuộc tính {{HTMLElement("iframe")}} [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow)) có thể chỉ rõ rằng chúng muốn dùng Screen Capture API bằng chỉ thị {{HTTPHeader("Permissions-Policy/display-capture", "display-capture")}}:

```html
<iframe allow="display-capture" src="/some-other-document.html">…</iframe>
```

Một site cũng có thể chỉ rõ rằng nó muốn dùng [Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control) thông qua chỉ thị {{HTTPHeader("Permissions-Policy/captured-surface-control", "captured-surface-control")}}. Cụ thể, các phương thức {{domxref("CaptureController.forwardWheel", "forwardWheel()")}}, {{domxref("CaptureController.increaseZoomLevel", "increaseZoomLevel()")}}, {{domxref("CaptureController.decreaseZoomLevel", "decreaseZoomLevel()")}} và {{domxref("CaptureController.resetZoomLevel", "resetZoomLevel()")}} được kiểm soát bởi chỉ thị này.

Danh sách cho phép mặc định cho cả hai chỉ thị là `self`, nghĩa là mọi nội dung trong cùng origin đều có thể dùng Screen Capture.

Các phương thức này được xem là [tính năng mạnh](/en-US/docs/Web/Security#secure_contexts_and_feature_permissions), nghĩa là ngay cả khi quyền được cho phép qua `Permissions-Policy`, người dùng vẫn sẽ được nhắc cấp quyền để dùng chúng. [Permissions API](/en-US/docs/Web/API/Permissions_API) có thể được dùng để truy vấn quyền tổng hợp (từ cả website lẫn người dùng) cho các tính năng được liệt kê.

Ngoài ra, đặc tả yêu cầu người dùng phải vừa mới tương tác với trang để dùng các tính năng này - tức là cần [transient activation](/en-US/docs/Glossary/Transient_activation). Xem các trang phương thức riêng lẻ để biết thêm chi tiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
- [Using the Captured Surface Control API](/en-US/docs/Web/API/Screen_Capture_API/Captured_Surface_Control)
- {{domxref("MediaDevices.getDisplayMedia()")}}
