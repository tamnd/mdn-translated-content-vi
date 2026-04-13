---
title: "MediaTrackConstraints: latency property"
short-title: latency
slug: Web/API/MediaTrackConstraints/latency
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.latency_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`latency`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.latency", "latency")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.latency")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

[`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) mô tả các giá trị có thể chấp nhận hoặc bắt buộc cho độ trễ của rãnh âm thanh, với các giá trị tính bằng giây. Trong xử lý âm thanh, độ trễ là thời gian giữa lúc bắt đầu xử lý (khi âm thanh xảy ra trong thế giới thực, hoặc được tạo bởi thiết bị phần cứng) và dữ liệu được cung cấp cho bước tiếp theo trong quá trình đầu vào hoặc đầu ra âm thanh. Trong hầu hết các trường hợp, độ trễ thấp là mong muốn vì mục đích hiệu suất và trải nghiệm người dùng, nhưng khi tiêu thụ điện năng là mối quan tâm, hoặc khi sự chậm trễ là chấp nhận được vì lý do khác, độ trễ cao hơn có thể được chấp nhận.

Nếu giá trị của thuộc tính này là một số, user agent sẽ cố gắng lấy phương tiện có độ trễ gần nhất với số này trong khả năng của phần cứng và các ràng buộc khác được chỉ định. Nếu không, giá trị của [`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) này sẽ hướng dẫn user agent trong nỗ lực cung cấp kết quả khớp chính xác với độ trễ yêu cầu (nếu `exact` được chỉ định hoặc cả `min` và `max` được cung cấp và có cùng giá trị) hoặc giá trị tốt nhất có thể.

> [!NOTE]
> Độ trễ luôn có xu hướng dao động do các yêu cầu sử dụng phần cứng, các ràng buộc mạng, v.v., vì vậy ngay cả với kết quả khớp "chính xác", một số dao động vẫn có thể xảy ra.

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
