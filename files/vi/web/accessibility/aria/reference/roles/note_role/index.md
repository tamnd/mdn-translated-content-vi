---
title: "ARIA: vai trò note"
short-title: note
slug: Web/Accessibility/ARIA/Reference/Roles/note_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#note
sidebar: accessibilitysidebar
---

Vai trò `note` gợi ý một phần có nội dung mang tính phụ chú hoặc bổ trợ cho nội dung chính.

## Mô tả

Vai trò `note` có thể được thêm vào nội dung mang tính phụ chú hoặc bổ trợ nếu không có phần tử gốc hay vai trò nào khác phù hợp với mục đích.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) (tùy chọn)
  - : Việc đặt tên cho note là tùy chọn, nhưng có thể giúp người dùng trình đọc màn hình hiểu ngữ cảnh và mục đích của nó. Tên có thể được cung cấp bằng `aria-labelledby` nếu có nhãn hiển thị, nếu không thì dùng `aria-label`.

## Ví dụ

```html
<h1>Madam C. J. Walker</h1>
<p>
  Madam C.J. Walker was an African American entrepreneur, philanthropist, and
  political and social activist.
</p>
<h2>Early Life</h2>
…
<h2>Career</h2>
…
<p role="note" class="highlight-box">
  At the height of the depression, Madam C. J. Walker trained 20,000 women to
  sell hair pomade door-to-door
</p>
<h2>Activism and Philanthropy</h2>
…
```

Trong mục kiểu Wikipedia ở trên về Madam C.J. Walker, khối `highlight-box` mang vai trò `note` có thể đã là một {{HTMLElement('blockquote')}} nếu nó chứa một trích dẫn, hoặc {{HTMLElement('figcaption')}} trong một {{HTMLElement('figure')}} nếu có một hình ảnh đi kèm. Trong trường hợp này, vì cả hai đều không phù hợp, vai trò `note` được thêm vào để mang ngữ nghĩa cho nội dung phụ chú.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Document structure roles](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#1._document_structure_roles)
