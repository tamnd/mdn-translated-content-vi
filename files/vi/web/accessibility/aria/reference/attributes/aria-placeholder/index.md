---
title: "ARIA: thuộc tính aria-placeholder"
short-title: aria-placeholder
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-placeholder
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-placeholder
sidebar: accessibilitysidebar
---

Thuộc tính `aria-placeholder` định nghĩa một gợi ý ngắn gọn, thường là một từ hoặc cụm từ ngắn, nhằm giúp người dùng nhập dữ liệu khi một form control chưa có giá trị. Gợi ý này có thể là một giá trị mẫu hoặc một mô tả ngắn về định dạng mong đợi.

## Mô tả

Placeholder là văn bản xuất hiện trong form control khi nó chưa có giá trị. Thuộc tính HTML [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) cho phép cung cấp một giá trị mẫu hoặc một mô tả ngắn về định dạng mong đợi cho một số kiểu {{HTMLElement('input')}} và {{HTMLElement('textarea')}} của HTML.

Nếu bạn đang tạo một `textbox` bằng bất kỳ phần tử nào khác, `placeholder` sẽ không được hỗ trợ. Đó là lúc `aria-placeholder` phát huy tác dụng. Thuộc tính `aria-placeholder` có thể được dùng để xác định một gợi ý ngắn giúp người dùng hiểu loại dữ liệu nào đang được mong đợi khi một form control không ngữ nghĩa chưa có giá trị.

```html
<span id="date-of-birth">Birthday</span>
<div
  contenteditable
  role="textbox"
  aria-labelledby="date-of-birth"
  aria-placeholder="MM-DD-YYYY">
  MM-DD-YYYY
</div>
```

Gợi ý placeholder nên được hiển thị cho người dùng bất cứ khi nào giá trị của control trống, kể cả khi một giá trị đã bị xóa.

> [!NOTE]
> ARIA chỉ sửa đổi cây trợ năng của một phần tử và do đó chỉ thay đổi cách công nghệ hỗ trợ trình bày nội dung cho người dùng của bạn. ARIA không thay đổi chức năng hay hành vi của phần tử. Khi không dùng các phần tử HTML ngữ nghĩa cho đúng mục đích và chức năng mặc định của chúng, bạn phải dùng JavaScript để quản lý hành vi.

`aria-placeholder` được dùng bổ sung cho label, không phải thay thế label. Chúng có mục đích và chức năng khác nhau. Label giải thích loại thông tin nào được mong đợi. Văn bản placeholder cung cấp một gợi ý về giá trị mong đợi.

> [!WARNING]
> Dùng placeholder thay cho label hiển thị làm giảm trợ năng và khả năng sử dụng đối với nhiều người dùng, bao gồm người lớn tuổi và người dùng có suy giảm nhận thức, vận động, kỹ năng vận động tinh và thị lực. Label tốt hơn: chúng luôn hiển thị và cung cấp vùng nhấn lớn hơn để focus vào control. Placeholder có một số nhược điểm: chúng biến mất khi control có bất kỳ giá trị nào, kể cả chỉ là khoảng trắng; chúng có thể khiến người dùng nghĩ rằng giá trị đã được điền sẵn; và màu mặc định có độ tương phản không đủ.

> [!NOTE]
> Placeholder chỉ nên được dùng để hiển thị ví dụ về loại dữ liệu cần nhập vào form; chúng không thay thế một label đúng nghĩa.

## Giá trị

- `<string>`
  - : Từ hoặc cụm từ ngắn sẽ hiển thị trong control khi control chưa có giá trị.

## Giao diện liên quan

- {{domxref("Element.ariaPlaceholder")}}
  - : Thuộc tính [`ariaPlaceholder`](/en-US/docs/Web/API/Element/ariaPlaceholder), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-placeholder`.
- {{domxref("ElementInternals.ariaPlaceholder")}}
  - : Thuộc tính [`ariaPlaceholder`](/en-US/docs/Web/API/ElementInternals/ariaPlaceholder), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-placeholder`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)

Kế thừa vào các vai trò:

- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính HTML [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder)
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
