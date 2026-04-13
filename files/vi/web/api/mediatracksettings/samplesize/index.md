---
title: "MediaTrackSettings: sampleSize property"
short-title: sampleSize
slug: Web/API/MediaTrackSettings/sampleSize
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.sampleSize_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`sampleSize`** của từ điển {{domxref("MediaTrackSettings")}} là số nguyên cho biết kích thước mẫu tuyến tính (tính bằng bit mỗi mẫu) mà {{domxref("MediaStreamTrack")}} hiện được cấu hình. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.sampleSize")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.sampleSize")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị số nguyên cho biết có bao nhiêu bit mỗi mẫu âm thanh được biểu diễn. Kích thước mẫu được sử dụng phổ biến nhất trong nhiều năm là 16 bit mỗi mẫu, được sử dụng cho âm thanh CD trong số những thứ khác. Các kích thước mẫu phổ biến khác là 8 (để giảm yêu cầu băng thông) và 24 (cho âm thanh chuyên nghiệp độ phân giải cao).

Mỗi kênh âm thanh trên rãnh cần sampleSize bit. Điều đó có nghĩa là một mẫu nhất định thực sự sử dụng (`sampleSize` / 8) \* {{domxref("MediaTrackSettings.channelCount","channelCount")}} byte dữ liệu. Ví dụ, âm thanh stereo 16 bit cần (16/8)\*2 hay 4 byte mỗi mẫu.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.sampleSize")}}
- {{domxref("MediaTrackSettings")}}
