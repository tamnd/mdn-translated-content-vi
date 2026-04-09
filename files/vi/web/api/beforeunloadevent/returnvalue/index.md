---
title: "BeforeUnloadEvent: thuộc tính returnValue"
short-title: returnValue
slug: Web/API/BeforeUnloadEvent/returnValue
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.BeforeUnloadEvent.returnValue
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính **`returnValue`** của giao diện
{{domxref("BeforeUnloadEvent")}}, khi được đặt thành một giá trị truthy, sẽ kích hoạt một hộp thoại xác nhận do trình duyệt tạo ra để yêu cầu người dùng xác nhận xem họ có _thực sự_ muốn rời khỏi trang khi cố đóng hoặc tải lại trang, hoặc điều hướng sang nơi khác hay không. Thuộc tính này nhằm giúp ngăn việc mất dữ liệu chưa lưu.

> [!NOTE]
> `returnValue` là một tính năng cũ, và cách làm được khuyến nghị là kích hoạt hộp thoại bằng cách gọi {{domxref("Event.preventDefault()")}} trên đối tượng `BeforeUnloadEvent`, đồng thời cũng đặt `returnValue` để hỗ trợ các trường hợp cũ. Xem trang tham chiếu của sự kiện {{domxref("Window/beforeunload_event", "beforeunload")}} để biết hướng dẫn chi tiết, cập nhật.

## Giá trị

`returnValue` được khởi tạo với giá trị chuỗi rỗng (`""`).

Việc đặt nó thành gần như bất kỳ giá trị [truthy](/en-US/docs/Glossary/Truthy) nào cũng sẽ khiến hộp thoại được kích hoạt khi đóng hoặc tải lại trang. Tuy nhiên, lưu ý rằng việc này cũng yêu cầu [sticky activation](/en-US/docs/Glossary/Sticky_activation). Nói cách khác, trình duyệt sẽ chỉ hiển thị hộp thoại nếu khung hiện tại hoặc bất kỳ khung nhúng nào đã nhận được một cử chỉ hay tương tác từ người dùng. Nếu người dùng chưa từng tương tác với trang, thì sẽ không có dữ liệu người dùng nào cần lưu, nên cũng không có trường hợp sử dụng hợp lệ nào cho hộp thoại này.

> [!NOTE]
> Một chuỗi thông báo chung do trình duyệt chỉ định sẽ được hiển thị trong hộp thoại. Mã của trang web không thể kiểm soát nội dung này.

## Ví dụ

Xem trang tham chiếu của sự kiện {{domxref("Window/beforeunload_event", "beforeunload")}} để có ví dụ theo cách làm được khuyến nghị.

## Tiêu chuẩn kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
