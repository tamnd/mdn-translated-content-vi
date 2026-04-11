---
title: Thời gian tồn tại của phiên WebRTC
slug: Web/API/WebRTC_API/Session_lifetime
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

WebRTC cho phép bạn xây dựng giao tiếp ngang hàng về dữ liệu, âm thanh hoặc video tùy ý—hoặc bất kỳ sự kết hợp nào của chúng—vào một ứng dụng trình duyệt. Trong bài viết này, chúng ta sẽ xem xét thời gian tồn tại của phiên WebRTC, từ việc thiết lập kết nối cho đến việc đóng kết nối khi không còn cần thiết.

Bài viết này không đi sâu vào chi tiết về các API thực tế liên quan đến việc thiết lập và xử lý kết nối WebRTC; nó xem xét quy trình nói chung với một số thông tin về lý do tại sao mỗi bước lại được yêu cầu. Xem [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling) để biết ví dụ thực tế kèm theo giải thích từng bước về chức năng của mã.

> [!LƯU Ý]
> Trang này hiện đang được xây dựng và một số nội dung sẽ chuyển sang các trang khác khi tài liệu hướng dẫn WebRTC được xây dựng. Xin lỗi bụi của chúng tôi!

## Thiết lập kết nối

Internet rất lớn. Thực sự lớn. Nó lớn đến mức cách đây nhiều năm, những người thông minh đã thấy nó lớn như thế nào, tốc độ phát triển của nó và [hạn chế](https://en.wikipedia.org/wiki/IPv4_address_exhaustion) của hệ thống địa chỉ IP 32-bit và nhận ra rằng cần phải làm gì đó trước khi chúng ta hết địa chỉ để sử dụng, vì vậy họ bắt đầu nghiên cứu thiết kế một hệ thống địa chỉ 64-bit mới. Nhưng họ nhận ra rằng sẽ mất nhiều thời gian hơn để hoàn tất quá trình chuyển đổi so với thời gian tồn tại của địa chỉ 32 bit, vì vậy những người thông minh khác đã nghĩ ra cách cho phép nhiều máy tính chia sẻ cùng một địa chỉ IP 32 bit. Dịch địa chỉ mạng ({{Glossary("NAT")}}) là một tiêu chuẩn hỗ trợ việc chia sẻ địa chỉ này bằng cách xử lý việc định tuyến dữ liệu vào và ra đến và đi từ các thiết bị trên mạng LAN, tất cả đều đang chia sẻ một địa chỉ IP WAN (toàn cầu).

Vấn đề đối với người dùng là mỗi máy tính riêng lẻ trên internet không còn nhất thiết phải có một địa chỉ IP duy nhất và trên thực tế, địa chỉ IP của mỗi thiết bị có thể thay đổi không chỉ nếu chúng chuyển từ mạng này sang mạng khác mà còn nếu địa chỉ mạng của chúng bị thay đổi bởi {{Glossary("NAT")}} và/hoặc [DHCP](https://en.wikipedia.org/wiki/DHCP). Đối với các nhà phát triển đang cố gắng thực hiện kết nối mạng ngang hàng, điều này đặt ra một câu hỏi hóc búa: không có mã định danh duy nhất cho mọi thiết bị người dùng, không thể biết ngay lập tức và tự động cách kết nối với một thiết bị cụ thể trên internet. Mặc dù bạn biết mình muốn nói chuyện với ai nhưng bạn không nhất thiết phải biết cách liên hệ với họ hoặc thậm chí địa chỉ của họ là gì.

Điều này giống như việc cố gắng gửi một gói hàng cho người bạn Michelle của bạn bằng cách dán nhãn là "Michelle" và bỏ nó vào hộp thư khi bạn không biết địa chỉ của cô ấy. Bạn cần tra cứu địa chỉ của cô ấy và ghi nó vào gói hàng, nếu không cô ấy sẽ tự hỏi tại sao bạn lại quên ngày sinh nhật của cô ấy.

Đây là nơi tín hiệu xuất hiện.

### Báo hiệu

Báo hiệu là quá trình gửi thông tin điều khiển giữa hai thiết bị để xác định các giao thức, kênh, codec và định dạng truyền thông cũng như phương thức truyền dữ liệu cũng như mọi thông tin định tuyến cần thiết. Điều quan trọng nhất cần biết về quy trình báo hiệu cho WebRTC: **nó không được xác định trong thông số kỹ thuật**.

Bạn có thể thắc mắc tại sao điều gì đó cơ bản trong quá trình thiết lập kết nối WebRTC lại nằm ngoài thông số kỹ thuật? Câu trả lời rất đơn giản: vì hai thiết bị không có cách nào để liên lạc trực tiếp với nhau và thông số kỹ thuật không thể dự đoán mọi trường hợp sử dụng có thể có cho WebRTC, nên sẽ hợp lý hơn nếu để nhà phát triển chọn công nghệ mạng và giao thức nhắn tin phù hợp.Đặc biệt, nếu nhà phát triển đã có sẵn phương pháp để kết nối hai thiết bị, thì việc họ phải sử dụng một phương pháp khác, được xác định theo thông số kỹ thuật, chỉ dành cho WebRTC là vô nghĩa. Vì WebRTC không hoạt động trong môi trường chân không nên có thể có các kết nối khác đang hoạt động, do đó, sẽ hợp lý hơn nếu tránh phải thêm các kênh kết nối bổ sung để báo hiệu nếu có thể sử dụng kênh kết nối hiện có.

Để trao đổi thông tin báo hiệu, bạn có thể chọn gửi qua lại các đối tượng JSON qua kết nối WebSocket hoặc bạn có thể sử dụng XMPP hoặc SIP qua một kênh thích hợp hoặc bạn có thể sử dụng {{domxref("Window/fetch", "fetch()")}} qua {{Glossary("HTTPS")}} với tính năng thăm dò ý kiến ​​hoặc bất kỳ sự kết hợp công nghệ nào khác mà bạn có thể nghĩ ra. Bạn thậm chí có thể sử dụng email làm kênh báo hiệu.

Cũng cần lưu ý rằng kênh thực hiện tín hiệu thậm chí không cần phải qua mạng. Một thiết bị ngang hàng có thể xuất ra một đối tượng dữ liệu có thể được in ra, mang theo vật lý (đi bộ hoặc bằng chim bồ câu) sang một thiết bị khác, được nhập vào thiết bị đó và sau đó thiết bị đó xuất ra một phản hồi để gửi lại bằng chân, v.v., cho đến khi kết nối ngang hàng WebRTC được mở. Nó sẽ có độ trễ rất cao nhưng nó có thể được thực hiện.

#### Thông tin được trao đổi trong quá trình truyền tín hiệu

Có ba loại thông tin cơ bản cần được trao đổi trong quá trình truyền tín hiệu:

- Các thông báo điều khiển dùng để thiết lập, mở, đóng kênh liên lạc và xử lý lỗi.
- Thông tin cần thiết để thiết lập kết nối: địa chỉ IP và thông tin cổng cần thiết để các thiết bị ngang hàng có thể giao tiếp với nhau.
- Thương lượng về khả năng truyền thông: các đồng nghiệp có thể hiểu được những codec và định dạng dữ liệu đa phương tiện nào? Những điều này cần phải được thống nhất trước khi phiên WebRTC có thể bắt đầu.

Chỉ khi quá trình báo hiệu được hoàn tất thành công thì quá trình mở kết nối ngang hàng WebRTC thực sự mới có thể bắt đầu.

Điều đáng lưu ý là máy chủ báo hiệu không thực sự cần phải hiểu hoặc làm bất cứ điều gì với dữ liệu được hai máy ngang hàng trao đổi thông qua nó trong quá trình báo hiệu. Về bản chất, máy chủ báo hiệu là một trạm chuyển tiếp: một điểm chung mà cả hai bên kết nối để biết rằng dữ liệu báo hiệu của họ có thể được truyền qua nó. Máy chủ không cần phải phản ứng với thông tin này dưới bất kỳ hình thức nào.

#### Quá trình truyền tín hiệu

Có một chuỗi những điều phải xảy ra để có thể bắt đầu phiên WebRTC:

1. Mỗi thiết bị ngang hàng tạo một đối tượng {{domxref("RTCPeerConnection")}} thể hiện sự kết thúc phiên WebRTC của chúng.
2. Mỗi thiết bị ngang hàng thiết lập một trình xử lý cho các sự kiện {{domxref("RTCPeerConnection/icecandidate_event", "icecandidate")}}, xử lý việc gửi các ứng cử viên đó đến thiết bị ngang hàng khác qua kênh báo hiệu.
3. Mỗi thiết bị ngang hàng thiết lập một trình xử lý cho sự kiện {{domxref("RTCPeerConnection.track_event", "track")}}, sự kiện này được nhận khi thiết bị ngang hàng từ xa thêm một bản nhạc vào luồng. Mã này sẽ kết nối các bản nhạc với người tiêu dùng, chẳng hạn như phần tử {{HTMLElement("video")}}.
4. Người gọi tạo và chia sẻ với thiết bị ngang hàng nhận một mã định danh hoặc mã thông báo duy nhất thuộc loại nào đó để cuộc gọi giữa họ có thể được xác định bằng mã trên máy chủ báo hiệu. Nội dung và hình thức chính xác của mã định danh này tùy thuộc vào bạn.
5. Mỗi thiết bị ngang hàng kết nối với một máy chủ báo hiệu đã được thỏa thuận, chẳng hạn như máy chủ WebSocket mà cả hai đều biết cách trao đổi tin nhắn.
6. Mỗi thiết bị ngang hàng thông báo cho máy chủ báo hiệu rằng họ muốn tham gia cùng một phiên WebRTC (được xác định bằng mã thông báo được thiết lập ở bước 4).
7. **_mô tả, ứng viên, v.v. — sắp có thêm thông tin_**

## khởi động lại ICEĐôi khi, trong suốt thời gian tồn tại của phiên WebRTC, điều kiện mạng sẽ thay đổi. Ví dụ: một trong những người dùng có thể chuyển từ mạng di động sang mạng Wi-Fi hoặc mạng có thể bị tắc nghẽn. Khi điều này xảy ra, nhân viên ICE có thể chọn thực hiện **khởi động lại ICE**. Đây là quá trình trong đó kết nối mạng được đàm phán lại, giống hệt như cách thực hiện đàm phán ICE ban đầu, ngoại trừ một ngoại lệ: phương tiện tiếp tục truyền qua kết nối mạng ban đầu cho đến khi kết nối mạng mới được thiết lập và chạy. Sau đó, phương tiện truyền thông chuyển sang kết nối mạng mới và mạng cũ bị đóng

> [!LƯU Ý]
> Các trình duyệt khác nhau hỗ trợ khởi động lại ICE trong các điều kiện khác nhau. Ví dụ: không phải tất cả các trình duyệt sẽ thực hiện khởi động lại ICE do tắc nghẽn mạng.

Việc xử lý `failed` [Trạng thái kết nối ICE](/en-US/docs/Web/API/RTCPeerConnection/iceConnectionState) bên dưới cho biết cách bạn có thể khởi động lại kết nối.

```js
pc.oniceconnectionstatechange = () => {
  if (pc.iceConnectionState === "failed") {
    pc.setConfiguration(restartConfig);
    pc.restartIce();
  }
};
```

Mã đầu tiên gọi {{domxref("RTCPeerConnection.setConfiguration()")}} với đối tượng cấu hình được cập nhật. Điều này nên được thực hiện trước khi khởi động lại ICE nếu bạn cần thay đổi cấu hình kết nối theo một cách nào đó (chẳng hạn như thay đổi sang một nhóm máy chủ ICE khác).

Sau đó, trình xử lý sẽ gọi {{domxref("RTCPeerConnection.restartIce()")}}. Điều này yêu cầu lớp ICE tự động thêm cờ `iceRestart` vào lệnh gọi `createOffer()` tiếp theo, kích hoạt khởi động lại ICE. Nó cũng tạo ra các giá trị mới cho đoạn tên người dùng ICE (ufrag) và mật khẩu, những giá trị này sẽ được sử dụng trong quá trình đàm phán lại và kết nối đạt được.

Phía trả lời của kết nối sẽ tự động bắt đầu khởi động lại ICE khi phát hiện các giá trị mới cho mật khẩu ICE ufrag và ICE.
