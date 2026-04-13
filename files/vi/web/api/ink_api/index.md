---
title: Ink API
slug: Web/API/Ink_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Ink
---

{{DefaultAPISidebar("Ink API")}}{{SeeCompatTable}}

Ink API cho phép các trình duyệt trực tiếp sử dụng các compositor cấp hệ điều hành có sẵn khi vẽ các nét bút trong tính năng inking của ứng dụng, qua đó giảm độ trễ và tăng hiệu suất.

## Khái niệm và cách sử dụng

Inking trên web đề cập đến các tính năng ứng dụng liên quan đến việc sử dụng [pointer events](/en-US/docs/Web/API/Pointer_events) để vẽ nét bút mượt mà, ví dụ như ứng dụng vẽ hoặc tính năng ký tài liệu.

Các sự kiện con trỏ thường được gửi đầu tiên đến tiến trình trình duyệt, sau đó chuyển tiếp các sự kiện này đến vòng lặp sự kiện JavaScript để thực thi các hàm xử lý liên quan và kết xuất kết quả trong ứng dụng. Độ trễ thời gian giữa đầu và cuối quá trình này có thể đáng kể, dẫn đến độ trễ giữa khi người dùng bắt đầu vẽ (ví dụ với bút stylus hoặc chuột) và nét vẽ hiện ra trên màn hình.

Ink API giảm đáng kể độ trễ này bằng cách cho phép trình duyệt bỏ qua hoàn toàn vòng lặp sự kiện JavaScript. Nơi có thể, trình duyệt sẽ truyền trực tiếp các lệnh kết xuất đó đến compositor cấp hệ điều hành.

Điểm vào là thuộc tính {{domxref("Navigator.ink")}}, trả về đối tượng {{domxref("Ink")}} cho tài liệu hiện tại. Phương thức {{domxref("Ink.requestPresenter","Ink.requestPresenter()")}} trả về {{jsxref("Promise")}} hoàn thành với thể hiện đối tượng {{domxref("DelegatedInkTrailPresenter")}}.

## Các giao diện

- {{domxref("Ink")}} {{Experimental_Inline}}
  - : Cung cấp quyền truy cập vào các đối tượng {{domxref("DelegatedInkTrailPresenter")}} để ứng dụng sử dụng kết xuất các nét vẽ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
