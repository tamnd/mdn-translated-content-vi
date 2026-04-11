---
title: Sử dụng kênh dữ liệu WebRTC
slug: Web/API/WebRTC_API/Using_data_channels
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

Trong hướng dẫn này, chúng tôi sẽ xem xét cách thêm kênh dữ liệu vào kết nối ngang hàng, sau đó có thể được sử dụng để trao đổi dữ liệu tùy ý một cách an toàn; nghĩa là, bất kỳ loại dữ liệu nào chúng tôi muốn, ở bất kỳ định dạng nào chúng tôi chọn.

> [!LƯU Ý]
> Vì tất cả các thành phần WebRTC đều bắt buộc phải sử dụng mã hóa nên mọi dữ liệu được truyền trên `RTCDataChannel` đều được bảo mật tự động bằng cách sử dụng Bảo mật lớp truyền tải gói dữ liệu (**DTLS**). Xem [Bảo vệ](#security) bên dưới để biết thêm thông tin.

## Tạo kênh dữ liệu

Việc truyền tải dữ liệu cơ bản được sử dụng bởi {{domxref("RTCDataChannel")}} có thể được tạo theo một trong hai cách:

- Hãy để WebRTC tạo phương tiện truyền tải và thông báo nó cho thiết bị ngang hàng từ xa cho bạn (bằng cách khiến nó nhận sự kiện {{domxref("RTCPeerConnection.datachannel_event", "datachannel")}}). Đây là cách dễ dàng và phù hợp với nhiều trường hợp sử dụng khác nhau nhưng có thể không đủ linh hoạt cho nhu cầu của bạn.
- Viết mã của riêng bạn để đàm phán việc vận chuyển dữ liệu và viết mã của riêng bạn để báo hiệu cho thiết bị ngang hàng khác rằng nó cần kết nối với kênh mới.

Chúng ta hãy xem xét từng trường hợp này, bắt đầu với trường hợp đầu tiên, trường hợp phổ biến nhất.

### Đàm phán tự động

Thông thường, bạn có thể cho phép kết nối ngang hàng xử lý việc thương lượng kết nối {{domxref("RTCDataChannel")}} cho bạn. Để thực hiện việc này, hãy gọi {{domxref("RTCPeerConnection.createDataChannel", "createDataChannel()")}} mà không chỉ định giá trị cho thuộc tính `negotiated` hoặc chỉ định thuộc tính có giá trị `false`. Điều này sẽ tự động kích hoạt `RTCPeerConnection` để xử lý các cuộc thương lượng cho bạn, khiến thiết bị ngang hàng từ xa tạo kênh dữ liệu và liên kết cả hai kênh với nhau trên mạng.

Đối tượng `RTCDataChannel` được trả về ngay lập tức bởi `createDataChannel()`; bạn có thể biết khi nào kết nối được thực hiện thành công bằng cách xem sự kiện {{domxref("RTCDataChannel.open_event", "open")}} được gửi đến `RTCDataChannel`.

```js
let dataChannel = pc.createDataChannel("MyApp Channel");

dataChannel.addEventListener("open", (event) => {
  beginTransmission(dataChannel);
});
```

### Đàm phán thủ công

Để thương lượng kết nối kênh dữ liệu theo cách thủ công, trước tiên bạn cần tạo một đối tượng {{domxref("RTCDataChannel")}} mới bằng cách sử dụng phương thức {{domxref("RTCPeerConnection.createDataChannel", "createDataChannel()")}} trên {{domxref("RTCPeerConnection")}}, chỉ định trong các tùy chọn một thuộc tính `negotiated` được đặt thành `true`. Điều này báo hiệu cho kết nối ngang hàng không cố gắng thương lượng kênh thay mặt bạn.

Sau đó đàm phán kết nối ngoài băng tần, sử dụng máy chủ web hoặc các phương tiện khác. Quá trình này sẽ báo hiệu cho thiết bị ngang hàng từ xa rằng nó sẽ tạo `RTCDataChannel` của riêng mình với thuộc tính `negotiated` cũng được đặt thành `true`, sử dụng cùng {{domxref("RTCDataChannel.id", "id")}}. Điều này sẽ liên kết hai đối tượng trên `RTCPeerConnection`.

```js
let dataChannel = pc.createDataChannel("MyApp Channel", {
  negotiated: true,
});

dataChannel.addEventListener("open", (event) => {
  beginTransmission(dataChannel);
});

requestRemoteChannel(dataChannel.id);
```

Trong đoạn mã này, kênh được tạo với `negotiated` được đặt thành `true`, sau đó, một hàm có tên `requestRemoteChannel()` được sử dụng để kích hoạt đàm phán, tạo kênh từ xa có cùng ID với kênh cục bộ.

Việc thực hiện này cho phép bạn tạo các kênh dữ liệu với mỗi thiết bị ngang hàng bằng các thuộc tính khác nhau và tạo các kênh được khai báo bằng cách sử dụng cùng một giá trị cho `id`.

## Đang đệm

Các kênh dữ liệu WebRTC hỗ trợ đệm dữ liệu gửi đi. Việc này được xử lý tự động. Mặc dù không có cách nào để kiểm soát kích thước của bộ đệm nhưng bạn có thể tìm hiểu lượng dữ liệu hiện được lưu vào bộ đệm và bạn có thể chọn nhận thông báo bởi một sự kiện khi bộ đệm bắt đầu sắp hết dữ liệu trong hàng đợi. Điều này giúp bạn dễ dàng viết các quy trình hiệu quả để đảm bảo luôn có dữ liệu sẵn sàng gửi mà không sử dụng quá mức bộ nhớ hoặc làm ngập hoàn toàn kênh.

## Hiểu giới hạn kích thước tin nhắnBạn nên giữ kích thước tin nhắn nhỏ vừa phải. Mặc dù hầu hết các trình duyệt hiện đại đều hỗ trợ gửi tin nhắn có dung lượng ít nhất 256 kilobyte, nhưng việc gửi tin nhắn lớn cũng có nhược điểm, đặc biệt là khi không có tính năng xen kẽ tin nhắn. Nếu không xen kẽ tin nhắn (như được định nghĩa trong {{rfc("8260")}}), việc gửi một tin nhắn lớn trên một kênh dữ liệu có thể gây ra {{glossary("Head_of_line_blocking", "head-of-line blocking")}}, do đó có thể ảnh hưởng tiêu cực đến độ trễ của tin nhắn trên các kênh dữ liệu khác

Kích thước tin nhắn tối đa có thể được thương lượng bằng cách sử dụng thuộc tính SDP `max-message-size`, như được xác định trong [RFC 8841](https://www.rfc-editor.org/rfc/rfc8841.html). Thuộc tính này cho phép mỗi thiết bị ngang hàng khai báo kích thước tối đa của tin nhắn người dùng SCTP mà nó sẵn sàng nhận. Bằng cách thương lượng giá trị này, các điểm cuối có thể tránh gửi tin nhắn lớn hơn mức mà các thiết bị ngang hàng khác có thể xử lý. Nếu thuộc tính `max-message-size` không có trong SDP thì giá trị mặc định là 64 kilobyte sẽ được giả sử. Giá trị 0 cho biết điểm cuối có thể xử lý các tin nhắn có kích thước bất kỳ, chỉ bị giới hạn bởi bộ nhớ khả dụng.

## Bảo mật

Tất cả dữ liệu được truyền bằng WebRTC đều được mã hóa. Trong trường hợp `RTCDataChannel`, mã hóa được sử dụng là Bảo mật lớp truyền tải dữ liệu (DTLS), dựa trên [Bảo mật lớp vận chuyển](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security) (TLS). Vì TLS được sử dụng để bảo mật mọi kết nối HTTPS nên mọi dữ liệu bạn gửi trên kênh dữ liệu đều an toàn như mọi dữ liệu khác được trình duyệt của người dùng gửi hoặc nhận.

Về cơ bản hơn, vì WebRTC là kết nối ngang hàng giữa hai tác nhân người dùng nên dữ liệu không bao giờ đi qua máy chủ web hoặc ứng dụng. Điều này làm giảm cơ hội để dữ liệu bị chặn.
