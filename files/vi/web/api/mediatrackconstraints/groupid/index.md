---
title: "MediaTrackConstraints: groupId property"
short-title: groupId
slug: Web/API/MediaTrackConstraints/groupId
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.groupId_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`groupId`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.groupId", "groupId")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.groupId")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Đối tượng dựa trên [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) chỉ định một hoặc nhiều ID nhóm có thể chấp nhận, lý tưởng và/hoặc chính xác (bắt buộc) là các nguồn nội dung phương tiện có thể chấp nhận.

ID nhóm là duy nhất cho một nguồn gốc nhất định trong suốt thời gian của một phiên duyệt web và được chia sẻ bởi tất cả các nguồn phương tiện đến từ cùng một thiết bị vật lý. Ví dụ, micro và loa trên cùng một tai nghe sẽ chia sẻ một ID nhóm. Điều này giúp có thể sử dụng ID nhóm để đảm bảo rằng các thiết bị âm thanh và đầu vào đều ở trên cùng một tai nghe bằng cách lấy ID nhóm của thiết bị đầu vào và chỉ định nó khi yêu cầu thiết bị đầu ra.

Tuy nhiên, giá trị của `groupId` được xác định bởi nguồn nội dung của rãnh, và không có định dạng cụ thể nào được bắt buộc bởi thông số kỹ thuật (mặc dù một loại GUID nào đó được khuyến nghị). Điều đó có nghĩa là một rãnh nhất định sẽ chỉ trả về một giá trị cho `groupId` khi bạn gọi {{domxref("MediaStreamTrack.getCapabilities", "getCapabilities()")}}, và lưu ý rằng giá trị này sẽ thay đổi cho mỗi phiên duyệt web.

Vì điều này, không có trường hợp nào sử dụng ID nhóm khi gọi {{domxref("MediaStreamTrack.applyConstraints()")}}, vì chỉ có một giá trị có thể, và bạn không thể sử dụng nó để đảm bảo cùng một nhóm được sử dụng qua nhiều phiên duyệt web khi gọi `getUserMedia()`.

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
