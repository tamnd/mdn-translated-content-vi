---
title: "ARIA: vai trò meter"
short-title: meter
slug: Web/Accessibility/ARIA/Reference/Roles/meter_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#meter
sidebar: accessibilitysidebar
---

Vai trò `meter` được dùng để xác định một phần tử đang được dùng như một đồng hồ đo.

> [!NOTE]
> Khi có thể, nên dùng phần tử gốc {{HTMLElement("meter")}} thay vì vai trò `meter`, vì các phần tử gốc được hỗ trợ rộng rãi hơn bởi tác nhân người dùng và công nghệ hỗ trợ.

## Mô tả

Meter là một hiển thị đồ họa của một giá trị số trong một khoảng xác định. Ví dụ, hiển thị phần trăm pin. Meter không phù hợp với các giá trị không có giới hạn tối đa có ý nghĩa. Meter cũng không nên được dùng để biểu thị tiến trình (ví dụ đang tải), việc này nên dùng phần tử {{HTMLElement('progress')}}.

Mỗi phần tử với `role="meter"` cũng phải có một trong các giá trị sau:

- Thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).
- Thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) trỏ tới một phần tử có văn bản mô tả meter.

### Mọi hậu duệ đều mang tính trình bày

Có một số kiểu thành phần giao diện người dùng khi được biểu diễn trong API truy cập của nền tảng thì chỉ có thể chứa văn bản. API truy cập không có cách biểu diễn các phần tử ngữ nghĩa nằm bên trong `meter`. Để xử lý hạn chế này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử hậu duệ của bất kỳ phần tử `meter` nào, vì đây là một vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, xét phần tử `meter` sau, chứa một tiêu đề.

```html
<div role="meter"><h3>Title of my meter</h3></div>
```

Vì các hậu duệ của `meter` mang tính trình bày, đoạn mã sau là tương đương:

```html
<div role="meter"><h3 role="presentation">Title of my meter</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với nội dung sau trong [cây truy cập](/en-US/docs/Glossary/Accessibility_tree).:

```html
<div role="meter">Title of my meter</div>
```

### Các vai trò, trạng thái và thuộc tính ARIA liên quan

- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
  - : Đặt thành một giá trị thập phân nằm giữa `aria-valuemin` và `aria-valuemax`, cho biết giá trị hiện tại của meter.
- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
  - : Công nghệ hỗ trợ thường biểu diễn giá trị `aria-valuenow` như một phần trăm. Nếu điều này không chính xác, hãy dùng thuộc tính này để làm cho giá trị meter dễ hiểu hơn.
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
  - : Đặt thành giá trị thập phân biểu diễn giá trị nhỏ nhất và nhỏ hơn `aria-valuemax`.
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
  - : Đặt thành giá trị thập phân biểu diễn giá trị lớn nhất và lớn hơn `aria-valuemin`.

Nên dùng phần tử gốc {{HTMLElement("meter")}} thay vì vai trò `meter`. Tác nhân người dùng cung cấp widget có kiểu dáng cho phần tử {{HTMLElement("meter")}} dựa trên giá trị `value` hiện tại tương quan với các giá trị `min` và `max`. Khi dùng các phần tử không ngữ nghĩa, mọi tính năng của phần tử ngữ nghĩa gốc cần được tái tạo bằng thuộc tính ARIA, JavaScript và CSS.

## Ví dụ

Ví dụ về meter dùng `role="meter"`:

```html
<div
  role="meter"
  aria-valuenow="90"
  aria-valuemin="0"
  aria-valuemax="100"
  aria-labelledby="cpu_usage_label">
  <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" style="width: 90%">
    <rect x="0" y="0" width="100%" height="100%" fill="currentColor"></rect>
  </svg>
</div>
```

Trong tình huống trên, khi giá trị `aria-valuenow` thay đổi, chiều rộng của SVG cũng cần được cập nhật như có thể thấy trong [ví dụ meter đang hoạt động của ARIA Authoring Practices Guide (APG)](https://www.w3.org/WAI/ARIA/apg/patterns/meter/examples/meter/).

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{HTMLElement('meter')}}
- {{HTMLElement('progress')}}
