---
title: "MediaTrackSettings: deviceId property"
short-title: deviceId
slug: Web/API/MediaTrackSettings/deviceId
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.deviceId_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`deviceId`** của từ điển {{domxref("MediaTrackSettings")}} là chuỗi xác định duy nhất nguồn cho {{domxref("MediaStreamTrack")}} tương ứng đối với nguồn gốc tương ứng với phiên duyệt web. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.deviceId")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.deviceId")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Chuỗi có giá trị là định danh duy nhất theo nguồn gốc cho nguồn của rãnh. ID này hợp lệ trong nhiều phiên duyệt web cho cùng một nguồn gốc và được đảm bảo là khác với tất cả các nguồn gốc khác, vì vậy bạn có thể dùng nó một cách an toàn để yêu cầu cùng một nguồn được sử dụng cho nhiều phiên.

Tuy nhiên, giá trị thực của chuỗi được xác định bởi nguồn của rãnh, và không có đảm bảo về hình thức của nó, mặc dù thông số kỹ thuật khuyến nghị nó là GUID.

Vì có sự ghép một-một của ID với mỗi nguồn, tất cả các rãnh có cùng nguồn sẽ chia sẻ cùng một ID cho bất kỳ nguồn gốc nào, vì vậy {{domxref("MediaStreamTrack.getCapabilities()")}} sẽ luôn trả về chính xác một giá trị cho `deviceId`. Điều đó làm cho ID thiết bị không hữu ích cho bất kỳ thay đổi nào đối với ràng buộc khi gọi {{domxref("MediaStreamTrack.applyConstraints()")}}.

> [!NOTE]
> Ngoại lệ cho quy tắc ID thiết bị là như nhau trong các phiên duyệt web: chế độ duyệt riêng tư sẽ sử dụng ID khác và thay đổi nó trong mỗi phiên duyệt web.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackSettings.groupId")}}
- {{domxref("MediaTrackConstraints.deviceId")}}
- {{domxref("MediaTrackSettings")}}
