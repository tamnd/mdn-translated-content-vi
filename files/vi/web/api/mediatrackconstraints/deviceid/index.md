---
title: "MediaTrackConstraints: deviceId property"
short-title: deviceId
slug: Web/API/MediaTrackConstraints/deviceId
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.deviceId_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`deviceId`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.deviceId", "deviceId")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.deviceId")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Đối tượng dựa trên [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) chỉ định một hoặc nhiều ID thiết bị có thể chấp nhận, lý tưởng và/hoặc chính xác (bắt buộc) là các nguồn nội dung phương tiện có thể chấp nhận.

ID thiết bị là duy nhất cho một nguồn gốc nhất định và được đảm bảo là như nhau qua các phiên duyệt web trên cùng một nguồn gốc. Tuy nhiên, giá trị của `deviceId` được xác định bởi nguồn nội dung của rãnh, và không có định dạng cụ thể nào được bắt buộc bởi thông số kỹ thuật (mặc dù một loại GUID nào đó được khuyến nghị). Điều đó có nghĩa là một rãnh nhất định sẽ chỉ trả về một giá trị cho `deviceId` khi bạn gọi {{domxref("MediaStreamTrack.getCapabilities", "getCapabilities()")}}.

Vì điều này, không có trường hợp nào sử dụng ID thiết bị khi gọi {{domxref("MediaStreamTrack.applyConstraints()")}}, vì chỉ có một giá trị có thể; tuy nhiên, bạn có thể ghi lại `deviceId` và sử dụng nó để đảm bảo bạn nhận được cùng nguồn cho nhiều lần gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}.

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
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
