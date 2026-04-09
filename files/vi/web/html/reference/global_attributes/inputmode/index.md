---
title: HTML inputmode global attribute
short-title: inputmode
slug: Web/HTML/Reference/Global_attributes/inputmode
page-type: html-attribute
browser-compat: html.global_attributes.inputmode
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`inputmode`** là thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) cung cấp gợi ý về kiểu dữ liệu có thể được người dùng nhập trong khi chỉnh sửa phần tử hoặc nội dung của nó.
Điều này cho phép trình duyệt hiển thị bàn phím ảo phù hợp.

Nó chủ yếu được sử dụng trên các phần tử {{HTMLElement("input")}}, nhưng có thể sử dụng trên bất kỳ phần tử nào ở chế độ [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

Điều quan trọng cần hiểu là thuộc tính `inputmode` không gây ra bất kỳ yêu cầu hợp lệ nào được áp dụng trên đầu vào. Để yêu cầu đầu vào phải tuân theo một kiểu dữ liệu cụ thể, hãy chọn loại phần tử [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input#input_types) phù hợp. Để được hướng dẫn cụ thể về việc chọn loại {{HTMLElement("input")}}, xem phần [Giá trị](#value).

## Giá trị

Thuộc tính có thể có bất kỳ giá trị nào sau đây:

- `none`
  - : Không có bàn phím ảo.
    Dùng khi trang tự triển khai điều khiển nhập bàn phím của riêng nó.
- `text` (giá trị mặc định)
  - : Bàn phím nhập chuẩn theo ngôn ngữ hiện tại của người dùng.
- `decimal`
  - : Bàn phím nhập số thập phân có chứa các chữ số và dấu phân cách thập phân theo ngôn ngữ của người dùng (thường là <kbd>.</kbd> hoặc <kbd>,</kbd>).
    Thiết bị có thể hoặc không hiển thị phím trừ (<kbd>-</kbd>).
- `numeric`
  - : Bàn phím nhập số, nhưng chỉ yêu cầu các chữ số 0–9.
    Thiết bị có thể hoặc không hiển thị phím trừ.
- `tel`
  - : Bàn phím số điện thoại, bao gồm các chữ số 0–9, dấu sao (<kbd>\*</kbd>), và phím thăng (<kbd>#</kbd>).
    Các đầu vào _yêu cầu_ số điện thoại nên thường sử dụng `{{HTMLElement("input/tel", '&lt;input type="tel"&gt;')}}` thay thế.
- `search`
  - : Bàn phím ảo được tối ưu hóa cho đầu vào tìm kiếm.
    Ví dụ, [phím return/submit](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute) có thể được gắn nhãn "Search", cùng với các tối ưu hóa khác có thể có.
    Các đầu vào _yêu cầu_ truy vấn tìm kiếm nên thường sử dụng `{{HTMLElement("input/search", '&lt;input type="search"&gt;')}}` thay thế.
- `email`
  - : Bàn phím ảo được tối ưu hóa để nhập địa chỉ email.
    Thường bao gồm ký tự <kbd>@</kbd> cùng với các tối ưu hóa khác.
    Các đầu vào _yêu cầu_ địa chỉ email nên thường sử dụng `{{HTMLElement("input/email", '&lt;input type="email"&gt;')}}` thay thế.
- `url`
  - : Bàn phím được tối ưu hóa để nhập URL.
    Ví dụ, phím <kbd>/</kbd> có thể nổi bật hơn.
    Các tính năng nâng cao có thể bao gồm truy cập lịch sử và nhiều hơn nữa.
    Các đầu vào _yêu cầu_ URL nên thường sử dụng `{{HTMLElement("input/url", '&lt;input type="url"&gt;')}}` thay thế.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- Thuộc tính toàn cục [`enterkeyhint`](/en-US/docs/Web/HTML/Reference/Global_attributes/enterkeyhint)
