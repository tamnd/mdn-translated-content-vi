---
title: "ARIA: vai trò form"
short-title: form
slug: Web/Accessibility/ARIA/Reference/Roles/form_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#form
  - https://www.w3.org/WAI/ARIA/apg/patterns/landmarks/examples/form.html
sidebar: accessibilitysidebar
---

Vai trò `form` có thể được dùng để xác định một nhóm phần tử trên trang cung cấp chức năng tương đương với một biểu mẫu HTML. Biểu mẫu sẽ không được hiển thị như một vùng landmark trừ khi nó có một [tên truy cập](/en-US/docs/Glossary/Accessible_name).

```html
<div role="form" id="contact-info" aria-label="Thông tin liên hệ">
  <!-- nội dung biểu mẫu -->
</div>
```

Đây là một biểu mẫu thu thập và lưu thông tin liên hệ của người dùng.

> [!WARNING]
> Hãy dùng phần tử HTML {{htmlelement("form")}} để chứa các điều khiển biểu mẫu của bạn, thay vì vai trò ARIA `form`, trừ khi bạn có lý do rất chính đáng.
> Phần tử HTML `<form>` đã đủ để nói cho công nghệ hỗ trợ biết rằng có một biểu mẫu.

## Mô tả

Vai trò `form` [landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) xác định một vùng nội dung chứa một tập hợp các mục và đối tượng, mà xét tổng thể, kết hợp lại để tạo thành một biểu mẫu khi không có landmark có tên nào khác phù hợp hơn (ví dụ [`main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role) hoặc [`search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)).

> [!NOTE]
> Dùng phần tử {{HTMLElement('form')}} sẽ tự động truyền đạt một phần nội dung như một landmark `form`, nếu nó được cung cấp một tên truy cập. Nhà phát triển luôn nên ưu tiên dùng phần tử HTML ngữ nghĩa đúng thay vì dùng ARIA.

Hãy dùng phần tử HTML {{HTMLElement('form')}} nếu có thể. Phần tử `<form>` xác định một landmark `form` khi nó có một tên truy cập (ví dụ [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby), [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title)). Hãy bảo đảm mỗi biểu mẫu trong tài liệu có một nhãn duy nhất để giúp người dùng hiểu mục đích của biểu mẫu. Nhãn này nên hiển thị cho tất cả người dùng, không chỉ người dùng công nghệ hỗ trợ. Hãy dùng landmark `search` thay vì landmark `form` khi biểu mẫu được dùng cho chức năng tìm kiếm.

Dùng `role="form"` để xác định một vùng của trang; đừng dùng nó để xác định từng trường biểu mẫu. Ngay cả khi bạn đang dùng landmark form thay vì `<form>`, bạn vẫn nên dùng các điều khiển biểu mẫu HTML gốc như {{HTMLElement('button')}}, {{HTMLElement('input')}}, {{HTMLElement('select')}}, và {{HTMLElement('textarea')}}.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có trạng thái hoặc thuộc tính riêng cho vai trò này.

### Tương tác bàn phím

Không có tương tác bàn phím riêng cho vai trò này

### Các tính năng JavaScript bắt buộc

- `onsubmit`
  - : Bộ xử lý sự kiện onSubmit xử lý sự kiện được phát ra khi biểu mẫu được gửi. Bất cứ thứ gì không phải là `<form>` đều không thể được gửi, vì vậy bạn sẽ phải dùng JavaScript để xây dựng một cơ chế gửi dữ liệu thay thế, chẳng hạn với {{domxref("Window/fetch", "fetch()")}}.

## Ví dụ

```html
<div role="form" id="send-comment" aria-label="Thêm bình luận">
  <label for="username">Tên người dùng</label>
  <input
    id="username"
    name="username"
    autocomplete="nickname"
    autocorrect="off"
    type="text" />

  <label for="email">Email</label>
  <input
    id="email"
    name="email"
    autocomplete="email"
    autocapitalize="off"
    autocorrect="off"
    spellcheck="false"
    type="text" />

  <label for="comment">Bình luận</label>
  <textarea id="comment" name="comment"></textarea>

  <input value="Bình luận" type="submit" />
</div>
```

Bạn nên dùng `<form>` thay thế.

```html
<form id="send-comment" aria-label="Thêm bình luận">…</form>
```

## Các vấn đề về trợ năng

### Dùng tiết chế

[Các vai trò landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) nhằm xác định các phần lớn hơn của tài liệu. Dùng quá nhiều vai trò landmark có thể tạo ra "nhiễu" trong trình đọc màn hình, khiến người dùng khó hiểu bố cục tổng thể của trang.

### Các input không phải là form

Bạn không cần khai báo `role="form"` trên mỗi [phần tử biểu mẫu](/en-US/docs/Web/HTML/Reference/Elements#forms) (input, textarea, select, v.v.). Nó nên được khai báo trên phần tử HTML bao bọc các phần tử biểu mẫu. Tốt nhất là dùng phần tử {{HTMLElement('form')}} làm phần tử bao bọc và không khai báo `role="form"`.

### Tìm kiếm

Nếu biểu mẫu được dùng để tìm kiếm, bạn nên dùng giá trị chuyên biệt hơn [`role="search"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role).

### Gắn nhãn cho landmark

Mỗi phần tử {{HTMLElement('form')}} và vai trò form cần được hiển thị như một landmark phải được gán một tên truy cập. Tên này sẽ giúp người dùng công nghệ hỗ trợ nhanh chóng hiểu được mục đích của landmark biểu mẫu.

Dùng `aria-labelledby`, `aria-label` hoặc `title` trên chính phần tử được gán `role="form"` để cung cấp tên truy cập cho nó.

#### Dùng `role="form"`

```html
<div role="form" id="gift-cards" aria-label="Mua thẻ quà tặng">
  <!-- nội dung biểu mẫu -->
</div>
```

#### Mô tả dư thừa

Trình đọc màn hình sẽ đọc loại vai trò của landmark. Vì vậy, bạn không cần mô tả landmark là gì ngay trong nhãn của nó. Ví dụ, khai báo `role="form"` với `aria-label="Biểu mẫu liên hệ"` có thể được đọc dư thừa thành "biểu mẫu liên hệ form".

## Thực hành tốt nhất

### Ưu tiên HTML

Dùng phần tử {{HTMLElement('form')}} sẽ tự động truyền đạt rằng phần tử đó có vai trò `form`. Nếu có thể, hãy ưu tiên dùng phần tử `<form>` ngữ nghĩa thay vì vai trò `form`.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('form')}}
- Phần tử {{HTMLElement('legend')}}
