---
title: SubmitEvent
slug: Web/API/SubmitEvent
page-type: web-api-interface
browser-compat: api.SubmitEvent
---

{{APIRef("HTML DOM")}}

Giao diện **`SubmitEvent`** định nghĩa đối tượng được dùng để đại diện cho sự kiện {{domxref("HTMLFormElement.submit_event", "submit")}} của biểu mẫu {{Glossary("HTML")}}. Sự kiện này được kích hoạt tại {{HTMLElement("form")}} khi hành động submit của biểu mẫu được gọi.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SubmitEvent.SubmitEvent", "SubmitEvent()")}}
  - : Tạo và trả về đối tượng `SubmitEvent` mới với {{domxref("Event.type", "type")}} và các tùy chọn khác được cấu hình như đã chỉ định. Lưu ý rằng hiện tại `type` hợp lệ duy nhất cho `SubmitEvent` là `submit`.

## Thuộc tính phiên bản

_Ngoài các thuộc tính được liệt kê dưới đây, giao diện này kế thừa các thuộc tính của giao diện cha, {{domxref("Event")}}._

- {{domxref("SubmitEvent.submitter", "submitter")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("HTMLElement")}} xác định nút hoặc phần tử khác đã được gọi để kích hoạt việc submit biểu mẫu.

## Phương thức phiên bản

_Trong khi `SubmitEvent` không cung cấp phương thức nào riêng, nó kế thừa bất kỳ phương thức nào được chỉ định bởi giao diện cha, {{domxref("Event")}}._

## Ví dụ

Trong ví dụ này, giỏ hàng có thể có nhiều nút submit khác nhau tùy thuộc vào các yếu tố như cài đặt người dùng, cài đặt cửa hàng và bất kỳ tổng số tối thiểu hoặc tối đa của giỏ hàng do nhà xử lý thanh toán đặt ra. Mỗi {{domxref("Element.id", "id")}} của phần tử submit được dùng để xác định nhà xử lý thanh toán nào mà nút đó tương ứng.

```js
let form = document.querySelector("form");
form.addEventListener("submit", (event) => {
  let submitter = event.submitter;
  let handler = submitter.id;

  if (handler) {
    processOrder(form, handler);
  } else {
    showAlertMessage(
      "Loại thanh toán không xác định hoặc không được chấp nhận đã được chọn. Vui lòng thử lại.",
      "OK",
    );
  }
});
```

ID của handler được lấy bằng cách sử dụng thuộc tính {{domxref("SubmitEvent.submitter", "submitter")}} của sự kiện `submit` để lấy nút submit, từ đó chúng ta lấy được ID. Với ID đó, chúng ta có thể gọi hàm `processOrder()` để xử lý đơn hàng, truyền biểu mẫu và ID handler.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
