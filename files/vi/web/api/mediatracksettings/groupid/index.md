---
title: "MediaTrackSettings: groupId property"
short-title: groupId
slug: Web/API/MediaTrackSettings/groupId
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.groupId_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`groupId`** của từ điển {{domxref("MediaTrackSettings")}} là chuỗi duy nhất trong phiên duyệt web xác định nhóm thiết bị bao gồm nguồn cho {{domxref("MediaStreamTrack")}}. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.groupId")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.groupId")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Chuỗi có giá trị là định danh duy nhất trong phiên duyệt web cho một nhóm thiết bị bao gồm nguồn nội dung của rãnh. Hai thiết bị chia sẻ cùng một ID nhóm nếu chúng thuộc cùng một thiết bị phần cứng vật lý. Ví dụ, tai nghe có hai thiết bị trên nó: micro có thể dùng làm nguồn cho rãnh âm thanh và loa có thể dùng làm đầu ra cho âm thanh.

ID nhóm không thể sử dụng qua nhiều phiên duyệt web. Tuy nhiên, nó có thể được sử dụng để đảm bảo rằng đầu vào và đầu ra âm thanh đều được thực hiện trên cùng một tai nghe, chẳng hạn, hoặc để đảm bảo rằng camera và micro tích hợp sẵn trên điện thoại đang được sử dụng cho mục đích hội nghị truyền hình.

Tuy nhiên, giá trị thực của chuỗi được xác định bởi nguồn của rãnh, và không có đảm bảo về hình thức của nó, mặc dù thông số kỹ thuật khuyến nghị nó là GUID.

Vì thuộc tính này không ổn định qua các phiên duyệt web, tính hữu ích của nó khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} thường bị giới hạn trong việc đảm bảo rằng các tác vụ được thực hiện trong cùng một phiên duyệt web sử dụng các thiết bị từ cùng một nhóm (hoặc chúng không sử dụng thiết bị từ cùng một nhóm). Không có tình huống nào mà groupId hữu ích khi gọi `applyConstraints()`, vì giá trị không thể thay đổi.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackSettings.deviceId")}}
- {{domxref("MediaTrackConstraints.groupId")}}
- {{domxref("MediaTrackSettings")}}
