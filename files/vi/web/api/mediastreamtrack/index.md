---
title: MediaStreamTrack
slug: Web/API/MediaStreamTrack
page-type: web-api-interface
browser-compat: api.MediaStreamTrack
---

{{APIRef("Media Capture and Streams")}}

Giao diện **`MediaStreamTrack`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} đại diện cho một track phương tiện duy nhất trong một luồng; thông thường, đây là các track âm thanh hoặc video, nhưng các loại track khác cũng có thể tồn tại.

Một số tác nhân người dùng phân lớp giao diện này để cung cấp thông tin hoặc chức năng chính xác hơn, chẳng hạn như {{domxref("CanvasCaptureMediaStreamTrack")}}.

{{InheritanceDiagram}}

## Thuộc tính instance

Ngoài các thuộc tính được liệt kê bên dưới, `MediaStreamTrack` có các thuộc tính có thể ràng buộc có thể được đặt bằng {{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}} và truy cập bằng {{domxref("MediaStreamTrack.getConstraints", "getConstraints()")}} và {{domxref("MediaStreamTrack.getSettings", "getSettings()")}}. Xem [Khả năng, ràng buộc và cài đặt](/vi/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để tìm hiểu cách làm việc chính xác với các thuộc tính có thể ràng buộc. Không làm như vậy một cách chính xác sẽ khiến mã của bạn trở nên không đáng tin cậy.

- {{domxref("MediaStreamTrack.contentHint")}}
  - : Một chuỗi mà ứng dụng web có thể sử dụng để cung cấp gợi ý về loại nội dung mà track chứa nhằm hướng dẫn cách xử lý bởi các API tiêu thụ. Các giá trị cho phép phụ thuộc vào giá trị của thuộc tính {{domxref("MediaStreamTrack.kind")}}.
- {{domxref("MediaStreamTrack.enabled")}}
  - : Một giá trị Boolean có giá trị `true` nếu track được bật, tức là được phép hiển thị luồng nguồn phương tiện; hoặc `false` nếu nó bị tắt, tức là không hiển thị luồng nguồn phương tiện nhưng là im lặng và màu đen. Nếu track đã bị ngắt kết nối, giá trị này có thể được thay đổi nhưng không còn hiệu lực.

    > [!NOTE]
    > Bạn có thể triển khai chức năng "tắt tiếng" tiêu chuẩn bằng cách đặt `enabled` thành `false`. Thuộc tính `muted` đề cập đến tình trạng không có phương tiện do sự cố kỹ thuật.

- {{domxref("MediaStreamTrack.id")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa một định danh duy nhất (GUID) cho track; nó được tạo bởi trình duyệt.
- {{domxref("MediaStreamTrack.kind")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi được đặt thành `"audio"` nếu track là track âm thanh và `"video"` nếu nó là track video. Nó không thay đổi nếu track bị ngắt kết nối khỏi nguồn.
- {{domxref("MediaStreamTrack.label")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa nhãn do tác nhân người dùng gán để xác định nguồn track, ví dụ như `"internal microphone"`. Chuỗi có thể bị bỏ trống và trống miễn là chưa có nguồn nào được kết nối. Khi track bị ngắt kết nối khỏi nguồn, nhãn không bị thay đổi.
- {{domxref("MediaStreamTrack.muted")}} {{ReadOnlyInline}}
  - : Trả về một giá trị Boolean cho biết liệu track có không thể cung cấp dữ liệu phương tiện do sự cố kỹ thuật hay không.

    > [!NOTE]
    > Bạn có thể triển khai chức năng "tắt tiếng" tiêu chuẩn bằng cách đặt `enabled` thành `false`, và bật tiếng lại phương tiện bằng cách đặt nó về `true`.

- {{domxref("MediaStreamTrack.readyState")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi được liệt kê cho biết trạng thái của track. Giá trị sẽ là một trong các giá trị sau:
    - `"live"` cho biết một đầu vào đã được kết nối và nỗ lực hết mức để cung cấp dữ liệu thời gian thực. Trong trường hợp đó, đầu ra dữ liệu có thể được bật hoặc tắt bằng thuộc tính {{domxref("MediaStreamTrack.enabled", "enabled")}}.
    - `"ended"` cho biết đầu vào không còn cung cấp thêm dữ liệu và sẽ không bao giờ cung cấp dữ liệu mới.

## Phương thức instance

- {{domxref("MediaStreamTrack.applyConstraints()")}}
  - : Cho phép ứng dụng chỉ định các giá trị lý tưởng và/hoặc phạm vi giá trị chấp nhận được cho bất kỳ số lượng thuộc tính có thể ràng buộc nào của `MediaStreamTrack`.
- {{domxref("MediaStreamTrack.clone()")}}
  - : Trả về một bản sao của `MediaStreamTrack`.
- {{domxref("MediaStreamTrack.getCapabilities()")}}
  - : Trả về một đối tượng mô tả các giá trị được chấp nhận hoặc phạm vi giá trị cho mỗi thuộc tính có thể ràng buộc của `MediaStreamTrack` được liên kết.
- {{domxref("MediaStreamTrack.getConstraints()")}}
  - : Trả về một đối tượng {{domxref('MediaTrackConstraints')}} chứa các ràng buộc hiện được đặt cho track; giá trị trả về khớp với các ràng buộc được đặt lần cuối bằng {{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}}.
- {{domxref("MediaStreamTrack.getSettings()")}}
  - : Trả về một đối tượng {{domxref("MediaTrackSettings")}} chứa các giá trị hiện tại của mỗi thuộc tính có thể ràng buộc của `MediaStreamTrack`.
- {{domxref("MediaStreamTrack.stop()")}}
  - : Dừng phát nguồn được liên kết với track, cả nguồn và track đều bị ngắt kết nối. Trạng thái track được đặt thành `ended`.

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này:

- {{domxref("MediaStreamTrack/ended_event", "ended")}}
  - : Được gửi khi việc phát lại track kết thúc (khi giá trị {{domxref("MediaStreamTrack.readyState", "readyState")}} thay đổi thành `ended`), trừ khi track bị kết thúc bằng cách gọi {{domxref("MediaStreamTrack.stop")}}.
- {{domxref("MediaStreamTrack/mute_event", "mute")}}
  - : Được gửi đến `MediaStreamTrack` khi giá trị của thuộc tính {{domxref("MediaStreamTrack.muted", "muted")}} được thay đổi thành `true`, cho biết rằng track tạm thời không thể cung cấp dữ liệu (chẳng hạn như khi mạng gặp sự cố dịch vụ).
- {{domxref("MediaStreamTrack/unmute_event", "unmute")}}
  - : Được gửi đến track khi dữ liệu trở lại khả dụng, kết thúc trạng thái `muted`.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [API Media Capture and Streams](/vi/docs/Web/API/Media_Capture_and_Streams_API)
- {{domxref("MediaStream")}}
