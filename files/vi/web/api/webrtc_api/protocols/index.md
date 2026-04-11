---
title: Giới thiệu về giao thức WebRTC
slug: Web/API/WebRTC_API/Protocols
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

Bài viết này giới thiệu các giao thức mà API WebRTC được xây dựng trên đó.

## BĂNG

[Cơ sở kết nối tương tác (ICE)](https://en.wikipedia.org/wiki/Interactive_Connectivity_Establishment) là một khung cho phép trình duyệt web của bạn kết nối với các đồng nghiệp. Có nhiều lý do khiến kết nối thẳng từ Peer A đến Peer B không hoạt động. Nó cần vượt qua tường lửa ngăn chặn việc mở kết nối, cung cấp cho bạn một địa chỉ duy nhất nếu giống như hầu hết các trường hợp, thiết bị của bạn không có địa chỉ IP công cộng và chuyển tiếp dữ liệu qua máy chủ nếu bộ định tuyến của bạn không cho phép bạn kết nối trực tiếp với các thiết bị ngang hàng. ICE sử dụng máy chủ STUN và/hoặc TURN để thực hiện việc này, như được mô tả bên dưới.

## choáng váng

[Tiện ích truyền tải phiên cho NAT (STUN)](https://en.wikipedia.org/wiki/STUN) là một giao thức để khám phá địa chỉ công cộng của bạn và xác định mọi hạn chế trong bộ định tuyến của bạn nhằm ngăn kết nối trực tiếp với thiết bị ngang hàng.

Máy khách sẽ gửi yêu cầu đến máy chủ STUN trên Internet, máy chủ này sẽ trả lời bằng địa chỉ công cộng của máy khách và liệu máy khách có thể truy cập được sau NAT của bộ định tuyến hay không.

![Sự tương tác giữa hai người dùng ứng dụng WebRTC liên quan đến máy chủ STUN.](webrtc-stun.png)

## NAT

[Dịch địa chỉ mạng (NAT)](https://en.wikipedia.org/wiki/Network_address_translation) được sử dụng để cung cấp cho thiết bị của bạn một địa chỉ IP công cộng. Bộ định tuyến sẽ có địa chỉ IP công cộng và mọi thiết bị được kết nối với bộ định tuyến sẽ có địa chỉ IP riêng. Các yêu cầu sẽ được dịch từ IP riêng của thiết bị sang IP công cộng của bộ định tuyến bằng một cổng duy nhất. Bằng cách đó, bạn không cần IP công cộng duy nhất cho mỗi thiết bị nhưng vẫn có thể được phát hiện trên Internet.

Một số bộ định tuyến sẽ có những hạn chế về người có thể kết nối với các thiết bị trên mạng. Điều này có thể có nghĩa là mặc dù chúng tôi có địa chỉ IP công cộng được máy chủ STUN tìm thấy nhưng không phải ai cũng có thể tạo kết nối. Trong tình huống này chúng ta cần sử dụng TURN.

## QUAY

Một số bộ định tuyến sử dụng NAT áp dụng một hạn chế gọi là 'NAT đối xứng'. Điều này có nghĩa là bộ định tuyến sẽ chỉ chấp nhận kết nối từ các thiết bị ngang hàng mà bạn đã kết nối trước đó.

[Truyền tải bằng cách sử dụng Rơle xung quanh NAT (TURN)](https://en.wikipedia.org/wiki/TURN) có nghĩa là bỏ qua hạn chế NAT đối xứng bằng cách mở kết nối với máy chủ TURN và chuyển tiếp tất cả thông tin qua máy chủ đó. Bạn sẽ tạo kết nối với máy chủ TURN và yêu cầu tất cả các máy ngang hàng gửi các gói đến máy chủ, sau đó máy chủ này sẽ được chuyển tiếp đến bạn. Điều này rõ ràng đi kèm với một số chi phí nên nó chỉ được sử dụng nếu không có lựa chọn thay thế nào khác.

![Sự tương tác giữa hai người dùng ứng dụng WebRTC liên quan đến máy chủ STUN và TURN.](webrtc-turn.png)

## SDP

[Giao thức mô tả phiên (SDP)](https://en.wikipedia.org/wiki/Session_Description_Protocol) là tiêu chuẩn để mô tả nội dung đa phương tiện của kết nối như độ phân giải, định dạng, codec, mã hóa, v.v. để cả hai thiết bị ngang hàng có thể hiểu nhau khi dữ liệu được truyền. Về bản chất, đây là siêu dữ liệu mô tả nội dung chứ không phải nội dung phương tiện.

Về mặt kỹ thuật, SDP không thực sự là một giao thức mà là một định dạng dữ liệu được sử dụng để mô tả kết nối chia sẻ phương tiện giữa các thiết bị.

Việc ghi lại SDP nằm ngoài phạm vi của tài liệu này; tuy nhiên, có một số điều đáng chú ý ở đây.

### Cấu trúc

SDP bao gồm một hoặc nhiều dòng văn bản UTF-8, mỗi dòng bắt đầu bằng một loại ký tự, theo sau là dấu bằng (`"="`), tiếp theo là văn bản có cấu trúc bao gồm một giá trị hoặc mô tả, có định dạng tùy thuộc vào loại. Các dòng văn bản bắt đầu bằng một chữ cái nhất định thường được gọi là "_letter_-lines". Ví dụ: các dòng cung cấp mô tả phương tiện có loại `"m"`, vì vậy những dòng đó được gọi là "m-lines".

### Để biết thêm thông tin

Để tìm hiểu thêm về SDP, hãy xem các tài nguyên hữu ích sau:

- Đặc điểm kỹ thuật: {{RFC(8866, "SDP: Session Description Protocol")}}
- [Đăng ký IANA của các tham số SDP](https://www.iana.org/assignments/sip-parameters/sip-parameters.xhtml)

## Hội nghị truyền hình nhiều bênTrong mạng ngang hàng WebRTC, các đồng nghiệp đàm phán codec/luồng video phù hợp dựa trên khả năng của thiết bị và băng thông mạng.Sau đó, mỗi người gửi sẽ gửi ("singlecasts") một luồng chứa thông tin video đến đối tác ngang hàng của nó

Hội nghị truyền hình giữa nhiều bên phức tạp hơn vì các bên có thể có khả năng và điều kiện mạng khác nhau: độ phân giải, tốc độ và chất lượng của một luồng video cụ thể có thể không phù hợp với tất cả người nhận, đồng thời nó không hiệu quả hoặc có thể mở rộng để người gửi tạo và gửi nhiều luồng đến nhiều người nhận.

Cách tiếp cận phổ biến nhất để giải quyết những vấn đề này là sử dụng máy chủ trung gian được gọi là _Đơn vị chuyển tiếp chọn lọc_ (SFU) hoặc _Hộp trung gian chuyển tiếp chọn lọc_ (SFM).
Người gửi xuất video được mã hóa sao cho SFM có thể chuyển tiếp có chọn lọc luồng video phù hợp cho từng người nhận.
Có hai công nghệ chính được WebRTC sử dụng để mã hóa video trong trường hợp này: mã hóa video simulcast và có thể mở rộng.

### Phát sóng đồng thời

_Simulcast_ gửi nhiều phiên bản đồng thời của cùng một nguồn với độ phân giải và tốc độ bit khác nhau trong các luồng riêng biệt.
SFM chuyển tiếp luồng phù hợp nhất tới từng người nhận dựa trên điều kiện mạng và khả năng của thiết bị.

SFM dựa vào khả năng xác định các mối quan hệ phụ thuộc khung, chẳng hạn như giữa một chuỗi các khung liên kết trở lại khung hình chính cuối cùng, để chuyển tiếp các gói và chuyển đổi các lớp mô phỏng mà không cần người nhận nhận thấy.

Các codec VP8 và VP9 có thể bao gồm thông tin phụ thuộc khung trong bộ mô tả tải trọng VP8 và bộ mô tả tải trọng VP9 tương ứng.
Đối với codec AV1, thông tin được gửi trong [Phần mở rộng tiêu đề RTP của bộ mô tả phụ thuộc (DD)](#dependency_descriptor_rtp_header_extension).

Việc triển khai trình duyệt gần đây thường sử dụng tiêu đề DD cho tất cả các codec, vì nó không liên quan đến codec, điều này có thể đơn giản hóa việc triển khai SFM.
Ngoài ra, vì nó là một phần của tiêu đề RTP chứ không phải tải trọng nên nó có thể được sử dụng trong các tình huống mã hóa đầu cuối.

### Mã hóa video có thể mở rộng

[Mã hóa video có thể mở rộng (SVC)](https://w3c.github.io/webrtc-svc/) mã hóa nguồn video trong một luồng duy nhất, với nhiều lớp có thể được giải mã có chọn lọc để thu được video có độ phân giải, tốc độ bit hoặc chất lượng cụ thể.
SFM có thể chuyển tiếp một tập hợp con của các lớp để gửi luồng phù hợp với mạng và thiết bị của từng người nhận.

Lưu ý rằng các phần phụ thuộc phức tạp hơn nhiều so với mức cần thiết để chọn luồng để chuyển tiếp khi sử dụng simulcast (xem [sơ đồ phụ thuộc](https://w3c.github.io/webrtc-svc/#dependencydiagrams*) trong đặc tả SVC để biết "hương vị" của độ phức tạp).
Luồng SVC bao gồm một lớp cơ sở cung cấp mức chất lượng tối thiểu và có thể bao gồm một số lớp nâng cao cho phép thay đổi tốc độ khung hình ("khả năng mở rộng theo thời gian"), tăng độ phân giải ("khả năng mở rộng không gian") và cùng độ phân giải ở các tốc độ bit khác nhau.
Codec VP8 chỉ hỗ trợ các lớp thời gian, trong khi VP9 hỗ trợ cả lớp thời gian và không gian.

Các codec VP8 và VP9 có thể bao gồm thông tin phụ thuộc khung trong bộ mô tả tải trọng VP8 và bộ mô tả tải trọng VP9 tương ứng.
Đối với codec AV1, thông tin được gửi trong [Phần mở rộng tiêu đề RTP của bộ mô tả phụ thuộc (DD)](#dependency_descriptor_rtp_header_extension).

Đối với simulcast, các triển khai trình duyệt gần đây thường sử dụng tiêu đề DD cho tất cả các codec hỗ trợ SVC, để đơn giản là triển khai SFM và vì nó hỗ trợ các kịch bản mã hóa đầu cuối.

Chrome 111 trở lên hỗ trợ SVC.
Firefox không hỗ trợ SVC tại thời điểm viết bài (khoảng FF136).

### Phần mở rộng tiêu đề RTP của bộ mô tả phụ thuộc[Phần mở rộng tiêu đề RTP của bộ mô tả phụ thuộc (DD)](https://aomediacodec.github.io/av1-rtp-spec/#43-dependency-descriptor-rtp-header-extension), được xác định trong đặc tả _RTP Payload Format For AV1 (v1.0)_, cung cấp cách thức không xác định codec, linh hoạt, hiệu quả và có thể mở rộng để mô tả mối quan hệ giữa các khung trong luồng video nhiều lớp

Chúng có thể được SFM sử dụng để chọn và chuyển tiếp các gói liên quan đến các lớp dành cho người nhận.
Vì tiêu đề là một phần mở rộng thực sự nên nó không phải là một phần của tải trọng và do đó vẫn có sẵn cho SFM trong các tình huống mã hóa hai đầu (E2EE).

Chrome và Firefox (136+) hỗ trợ tiêu đề DD.

### Codec được WebRTC hỗ trợ

Thông tin này được cung cấp trong [Codec được WebRTC sử dụng](/en-US/docs/Web/Media/Guides/Formats/WebRTC_codecs)
