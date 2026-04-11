---
title: "MediaTrackConstraints: echoCancellation property"
short-title: echoCancellation
slug: Web/API/MediaTrackConstraints/echoCancellation
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.echoCancellation_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`echoCancellation`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainBooleanOrDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constrainbooleanordomstring) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.echoCancellation", "echoCancellation")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.echoCancellation")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị boolean, chuỗi, hoặc đối tượng [`ConstrainBooleanOrDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constrainbooleanordomstring).

Nếu trình duyệt hỗ trợ các loại khử tiếng vọng cụ thể, giá trị có thể được đặt thành một trong các giá trị sau:

- `"all"` {{experimental_inline}}
  - : Tất cả âm thanh do hệ thống người dùng tạo ra được micro của người dùng chụp sẽ bị loại bỏ. Điều này hữu ích, ví dụ trong các tình huống bạn muốn tránh chụp âm thanh nhạy cảm về quyền riêng tư như đầu ra trình đọc màn hình và thông báo hệ thống.
- `"remote-only"` {{experimental_inline}}
  - : Chỉ âm thanh do hệ thống người dùng tạo ra được micro của người dùng chụp từ các nguồn từ xa (được đại diện bởi các {{domxref("MediaStreamTrack")}} có nguồn gốc từ {{domxref("RTCPeerConnection")}}) mới bị loại bỏ. Điều này hữu ích khi bạn muốn loại bỏ tiếng vọng từ giao tiếp với các đối tác từ xa nhưng vẫn chia sẻ âm thanh cục bộ, chẳng hạn như trong trường hợp bài học âm nhạc nơi giáo viên muốn nghe học sinh chơi theo một bản nhạc nhưng vẫn giao tiếp rõ ràng với họ.
- `true`
  - : Trình duyệt quyết định âm thanh nào sẽ bị loại bỏ khỏi tín hiệu được micro ghi âm. Nó phải cố gắng hủy ít nhất nhiều như `remote-only` và nên cố gắng hủy nhiều như `all`.
- `false`
  - : Không có âm thanh nào bị loại bỏ; sẽ không có khử tiếng vọng nào xảy ra.

Nếu trình duyệt không hỗ trợ các loại khử tiếng vọng cụ thể, giá trị có thể là `true` hoặc `false`.

Nếu được đặt thành một trong các giá trị trên, user agent sẽ cố gắng lấy phương tiện với khử tiếng vọng được bật hoặc tắt như đã chỉ định, nếu có thể, nhưng sẽ không thất bại nếu không thể thực hiện.

Nếu giá trị được đưa ra dưới dạng đối tượng với trường `exact`, giá trị của trường đó chỉ ra cài đặt bắt buộc cho tính năng khử tiếng vọng; nếu không thể đáp ứng, yêu cầu sẽ dẫn đến lỗi.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

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
