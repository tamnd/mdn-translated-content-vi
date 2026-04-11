---
title: "HTMLElement: thuộc tính inputMode"
short-title: inputMode
slug: Web/API/HTMLElement/inputMode
page-type: web-api-instance-property
browser-compat: api.HTMLElement.inputMode
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`inputMode`** của {{domxref("HTMLElement")}} phản ánh giá trị của thuộc tính [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode) của phần tử.

Nó cung cấp gợi ý về loại dữ liệu mà người dùng có thể nhập khi chỉnh sửa phần tử hoặc nội dung của nó. Điều này cho phép trình duyệt hiển thị bàn phím ảo phù hợp.

Thuộc tính này chủ yếu được dùng trên các phần tử {{HTMLElement("input")}}, nhưng có thể dùng trên bất kỳ phần tử nào ở chế độ [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

## Giá trị

Thuộc tính này có thể có một trong các giá trị sau:

- `decimal`
  - : Bàn phím số thập phân chứa các chữ số và dấu phân cách thập phân theo ngôn ngữ của người dùng (thường là <kbd>.</kbd> hoặc <kbd>,</kbd>).
- `email`
  - : Bàn phím ảo được tối ưu hóa để nhập địa chỉ email.
    Thường bao gồm ký tự <kbd>@</kbd> cùng các tối ưu hóa khác.
- `none`
  - : Không có bàn phím ảo. Được dùng khi trang thực hiện điều khiển nhập bàn phím riêng.
- `numeric`
  - : Bàn phím nhập số chỉ yêu cầu các chữ số 0-9.
    Thiết bị có thể hoặc không hiển thị phím trừ.
- `search`
  - : Bàn phím ảo được tối ưu hóa cho đầu vào tìm kiếm.
    Ví dụ: [phím return/submit](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute) có thể được đặt nhãn là "Search".
- `tel`
  - : Bàn phím nhập điện thoại bao gồm các chữ số 0-9, dấu sao (<kbd>\*</kbd>) và phím thăng (<kbd>#</kbd>).
- `text`
  - : Bàn phím nhập tiêu chuẩn theo ngôn ngữ hiện tại của người dùng.
- `url`
  - : Bàn phím được tối ưu hóa để nhập URL.
    Ví dụ: phím <kbd>/</kbd> có thể nổi bật hơn.

Để biết chi tiết về cách sử dụng thuộc tính này, hãy xem trang dành cho thuộc tính HTML [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode) mà thuộc tính này phản ánh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính [inputmode](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode)
