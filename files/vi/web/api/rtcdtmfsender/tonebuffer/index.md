---
title: "RTCDTMFSender: toneBuffer property"
short-title: toneBuffer
slug: Web/API/RTCDTMFSender/toneBuffer
page-type: web-api-instance-property
browser-compat: api.RTCDTMFSender.toneBuffer
---

{{APIRef("WebRTC")}}

Thuộc tính toneBuffer của giao diện {{domxref("RTCDTMFSender")}} trả về một chuỗi chứa danh sách các âm thanh {{Glossary("DTMF")}} hiện đang trong hàng đợi để gửi đến peer từ xa qua {{domxref("RTCPeerConnection")}}. Để đặt các âm thanh vào buffer, gọi {{domxref("RTCDTMFSender.insertDTMF", "insertDTMF()")}}.

Các âm thanh bị xóa khỏi chuỗi khi chúng được phát, vì vậy chỉ có các âm thanh sắp tới được liệt kê.

## Giá trị

Một chuỗi liệt kê các âm thanh cần phát. Nếu chuỗi rỗng, không có âm thanh nào đang chờ.

### Ngoại lệ

- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu một ký tự không phải là ký tự âm thanh DTMF (`0-9`, `A-D`, `#`, hoặc `,`).

### Định dạng buffer âm thanh

Buffer âm thanh là một chuỗi có thể chứa bất kỳ sự kết hợp nào của các ký tự được cho phép bởi chuẩn DTMF.

#### Các ký tự âm thanh DTMF

- Các chữ số 0-9
  - : Các ký tự này đại diện cho các phím số trên bàn phím điện thoại.
- Các chữ cái A-D
  - : Các ký tự này đại diện cho các phím "A" đến "D" là một phần của chuẩn DTMF nhưng không có trong hầu hết các điện thoại. Chúng _không_ được hiểu là số. Chữ thường "a"-"d" tự động được chuyển thành chữ hoa.
- Ký hiệu pound/hash ("#") và dấu hoa thị ("\*")
  - : Chúng tương ứng với các phím được gán nhãn tương tự thường có ở hàng cuối của bàn phím điện thoại.
- Dấu phẩy (",")
  - : Ký tự này hướng dẫn quá trình quay số tạm dừng hai giây trước khi gửi ký tự tiếp theo trong buffer.

> [!NOTE]
> Tất cả các ký tự khác đều không được nhận ra và sẽ khiến {{domxref("RTCDTMFSender.insertDTMF", "insertDTMF()")}} ném ra `InvalidCharacterError` {{domxref("DOMException")}}.

#### Sử dụng chuỗi buffer âm thanh

Ví dụ, nếu bạn đang viết mã để kiểm soát hệ thống thư thoại bằng cách gửi mã DTMF, bạn có thể sử dụng chuỗi như `"*,1,5555"`. Trong ví dụ này, chúng ta gửi `"*"` để yêu cầu truy cập vào hệ thống VM, sau đó sau một khoảng dừng, gửi "1" để bắt đầu phát lại các tin nhắn thư thoại, sau đó sau một khoảng dừng, quay số "5555" làm số PIN để mở các tin nhắn.

Đặt buffer âm thanh thành chuỗi rỗng (`""`) hủy bỏ bất kỳ mã DTMF nào đang chờ.

## Ví dụ

tbd

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Using DTMF with WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- {{domxref("RTCDTMFSender.insertDTMF()")}}
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCDTMFSender")}}
- {{domxref("RTCRtpSender")}}
