---
title: "ARIA: vai trò option"
short-title: option
slug: Web/Accessibility/ARIA/Reference/Roles/option_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#option
  - https://www.w3.org/WAI/ARIA/apg/patterns/listbox/examples/listbox-scrollable/
sidebar: accessibilitysidebar
---

Vai trò `option` được dùng cho các mục có thể chọn trong `listbox`.

## Mô tả

Vai trò `option` được dùng để xác định các lựa chọn mà người dùng có thể thực hiện trong một [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role). Các tùy chọn này tương tự các phần tử {{HTMLElement('option')}} trong một phần tử {{HTMLElement('select')}}, nhưng chúng có thể chứa hình ảnh.

Tất cả các tùy chọn có thể chọn nên có [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) khớp với trạng thái của chúng, `true` khi được chọn và `false` khi không được chọn. Nếu một tùy chọn không thể chọn, có thể bỏ qua `aria-selected`. Một tùy chọn bị vô hiệu hóa có thể có [`aria-disabled="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled) và `aria-selected="false"` để báo cho người dùng rằng tùy chọn đó có tồn tại, dù bị vô hiệu hóa.

Vai trò `option` dùng để xác định các lựa chọn có thể chọn của một `listbox`. Các option phải được cung cấp một tên khả năng tiếp cận. Thông thường, tên khả năng tiếp cận của một option nên đến từ nội dung con của phần tử.

Tác giả cũng có thể cung cấp rõ ràng một tên khả năng tiếp cận bằng cách chỉ định [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) cho phần tử có vai trò `option`. Nếu dùng `aria-label` hoặc `aria-labelledby`, và option cũng hiển thị một nhãn văn bản trực quan, tác giả phải bảo đảm tuân thủ <a href="https://www.w3.org/WAI/WCAG21/Understanding/label-in-name.html">Tiêu chí thành công WCAG 2.5.3 Label in Name</a>.

Nên ưu tiên dùng phần tử {{HTMLElement('select')}} hoặc phần tử {{HTMLElement('input')}} với kiểu `checkbox` hoặc `radio` khi có thể. Các phần tử HTML gốc này tự động cung cấp tương tác bàn phím để quản lý focus cho tất cả phần tử con thay cho bạn.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `option`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `option` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `option` sau, có chứa một tiêu đề.

```html
<div role="option"><h3>Title of my option</h3></div>
```

Vì các phần tử con của `option` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="option"><h3 role="presentation">Title of my option</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="option">Title of my option</div>
```

### Các vai trò, trạng thái và thuộc tính ARIA liên quan

#### Vai trò liên quan

- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
  - : Một `option` _phải_ được chứa trong hoặc được sở hữu bởi một `listbox`.

#### Trạng thái và thuộc tính

- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
  - : Dùng để mô tả trạng thái được chọn của option.

- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
  - : Dùng để mô tả trạng thái được đánh dấu khi option được dùng theo kiểu chọn nhiều. Hỗ trợ `true`, `false` và `mixed`. Tùy chọn.

- [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset)
  - : Dùng để mô tả vị trí trong tập option khi nó không khớp với DOM, như trong virtual scrolling nơi chỉ một số option xuất hiện tại một thời điểm. Tùy chọn.

- [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize)
  - : Dùng cùng với `aria-posinset` để khai báo tổng số option. Tùy chọn.

- [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled)
  - : Dùng để chỉ ra rằng option có mặt nhưng không thể chỉnh sửa. Tùy chọn.

- [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden)
  - : Dùng để ẩn option khỏi công cụ khả năng tiếp cận. Nó chỉ nên được dùng để ẩn nội dung không hiển thị hoặc nội dung hiển thị nếu điều đó cải thiện trải nghiệm của công nghệ hỗ trợ, chẳng hạn nội dung thừa. Tùy chọn.

- [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid)
  - : Dùng để chỉ ra rằng giá trị của option được ứng dụng xem là không hợp lệ. Tùy chọn.

- [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy)
  - : Dùng để chỉ ra rằng một phần tử đang được sửa đổi, chẳng hạn trong lúc tải. Tùy chọn.

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Dùng để chỉ ra phần tử nào gắn nhãn cho option. Trong trường hợp phù hợp, nội dung của option nên được dùng thay thế. Tùy chọn.

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Dùng để gắn nhãn cho option. Nếu nhãn đã có trong DOM, nên dùng `aria-labelledby` thay thế. Tùy chọn.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('select')}}
- Phần tử HTML {{HTMLElement('label')}}
- Phần tử HTML {{HTMLElement('option')}}
- [ARIA: vai trò `combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [ARIA: vai trò `list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
- [ARIA: vai trò `listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
