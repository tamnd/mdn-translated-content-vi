---
title: "ARIA: thuộc tính aria-multiline"
short-title: aria-multiline
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-multiline
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-multiline
sidebar: accessibilitysidebar
---

Thuộc tính `aria-multiline` cho biết một `textbox` có chấp nhận nhiều dòng nhập liệu hay chỉ một dòng.

## Mô tả

Hành vi mặc định của phím <kbd>Enter</kbd> hoặc <kbd>Return</kbd> khác nhau giữa trường nhập một dòng và nhiều dòng. Khi focus của người dùng nằm trong một `{{htmlelement("input/text", '&lt;input type="text"&gt;')}}` một dòng, nhấn <kbd>Enter</kbd> hoặc <kbd>Return</kbd> thường sẽ gửi biểu mẫu.

Khi focus của người dùng nằm trong {{HTMLElement('textarea')}} nhiều dòng, phím này sẽ chèn một ký tự xuống dòng. Chỉ có ý nghĩa đối với các phần tử đã được đặt vai trò [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), thuộc tính `aria-multiline` cho công nghệ hỗ trợ biết liệu hộp văn bản đó có chấp nhận nhiều dòng nhập hay chỉ một dòng, từ đó đặt kỳ vọng về loại dữ liệu cần nhập và phím bấm đó sẽ làm gì.

> [!NOTE]
> Nếu có thể, hãy dùng HTML {{HTMLElement('input')}} hoặc {{HTMLElement('textarea')}}, vì chúng đã có sẵn ngữ nghĩa và hành vi, không cần thuộc tính ARIA hay script, và đã tích hợp sẵn hỗ trợ bàn phím.

Nếu đặt `aria-multiline="true"`, điều đó có nghĩa là widget textbox sẽ chấp nhận xuống dòng trong nội dung nhập, tương tự như HTML {{HTMLElement('textarea')}}. Những phần tử có vai trò `textbox` mà không có thuộc tính này, hoặc có giá trị `false`, là các hộp văn bản đơn giản.

Hãy chú ý đến focus và phím bấm khi thiết kế hộp văn bản. ARIA chỉ sửa đổi cây trợ năng và do đó chỉ thay đổi cách công nghệ hỗ trợ trình bày textbox cho người dùng của bạn. ARIA không thay đổi chức năng hay hành vi mặc định của phần tử. Khi không dùng phần tử HTML ngữ nghĩa cho đúng mục đích và chức năng mặc định của chúng, bạn phải dùng JavaScript để quản lý hành vi và chức năng, bao gồm cả việc phản hồi các sự kiện phím bấm.

## Giá trị

- `true`
  - : Hộp văn bản chấp nhận nhiều dòng nhập liệu.

- `false`
  - : Hộp văn bản chỉ chấp nhận một dòng nhập liệu.

## Giao diện liên quan

- {{domxref("Element.ariaMultiLine")}}
  - : Thuộc tính [`ariaMultiLine`](/en-US/docs/Web/API/Element/ariaMultiLine), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-multiline`.
- {{domxref("ElementInternals.ariaMultiLine")}}
  - : Thuộc tính [`ariaMultiLine`](/en-US/docs/Web/API/ElementInternals/ariaMultiLine), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-multiline`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)

Kế thừa vào các vai trò:

- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Vai trò ARIA [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- Vai trò ARIA [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
