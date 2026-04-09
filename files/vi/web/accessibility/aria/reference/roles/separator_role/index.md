---
title: "ARIA: vai trò separator"
short-title: separator
slug: Web/Accessibility/ARIA/Reference/Roles/separator_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#separator
  - https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-editor/
sidebar: accessibilitysidebar
---

Vai trò `separator` cho biết phần tử là một vạch phân cách tách và phân biệt các phần nội dung hoặc các nhóm menu item. Vai trò ARIA ngầm định của phần tử ngắt chủ đề gốc {{HTMLElement('hr')}} là `separator`.

## Mô tả

Một separator là một vạch phân cách tách và phân biệt các phần nội dung hoặc các nhóm menu item. Có hai loại separator: một cấu trúc tĩnh cung cấp ranh giới hiển thị, tương tự phần tử HTML {{HTMLElement('hr')}}, và một widget có thể nhận focus, có thể di chuyển.

Các phần tử có vai trò `separator` có giá trị ngầm định của [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) là `horizontal`.

### Separator không thể nhận focus

Một separator không thể nhận focus là một phần tử cấu trúc tĩnh có thể được dùng để giúp phân chia trực quan hai nhóm menu item trong một menu hoặc để cung cấp một đường ngang giữa hai phần của trang. Các ngắt chủ đề không thể nhận focus vẫn có thể được người dùng trình đọc màn hình cảm nhận khi dùng con trỏ đọc không phụ thuộc vào focus.

```html
<h2>My first blog post</h2>
…
<img src="blueline.gif" role="separator" alt="" />
<h2>Two years later, my second post</h2>
…
```

Trong ví dụ này, một hình ảnh tạo ra một vạch phân cách trực quan giữa hai bài blog. Tác giả có thể đã dùng phần tử ngắt chủ đề ngữ nghĩa {{HTMLElement('hr')}} và tạo kiểu bằng CSS để nó có màu xanh (và không phải thay đổi hình ảnh khi thay đổi chủ đề blog), hoặc tác giả có thể đã bao bọc mỗi bài trong phần tử {{HTMLElement('article')}} ngữ nghĩa, hoặc cả hai.

```html
<section role="feed">
  <article>
    <h2>My first blog post</h2>
    …
  </article>
  <hr />
  <article>
    <h2>Two years later, my second post</h2>
    …
  </article>
</section>
```

```css
[role="feed"] > hr {
  height: 3px;
  background-color: blue;
}
```

Không cần tên khả năng tiếp cận.

### Separator có thể nhận focus

Vai trò separator có thể được dùng để xác định phần tử là một vạch phân cách trực quan giữa các nhóm mục trong một menu, chẳng hạn giữa các nhóm phần tử `menuitemradio` hoặc `menuitemcheckbox`.

Nếu separator có thể nhận focus, cung cấp một ranh giới hiển thị giữa hai phần nội dung và cho phép người dùng thay đổi kích thước tương đối của các phần nó ngăn cách bằng cách thay đổi vị trí của nó, giá trị [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow) phải được đặt thành một số phản ánh vị trí hiện tại của separator và giá trị đó phải được cập nhật khi nó thay đổi. Các thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) và [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) cũng nên được bao gồm nếu chúng không được đặt theo giá trị mặc định là 0 và 100 tương ứng.

Nên có một tên khả năng tiếp cận, với [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), nếu có nhiều hơn một separator có thể nhận focus.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `separator`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `separator` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `separator` sau, có chứa một tiêu đề.

```html
<div role="separator"><h3>Title of my separator</h3></div>
```

Vì các phần tử con của `separator` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="separator"><h3 role="presentation">Title of my separator</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="separator">Title of my separator</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) (mặc định là horizontal cho separator)
  - : Theo mặc định, vạch phân cách cho các vai trò `separator` được giả định là horizontal. Giá trị có thể được bao gồm và đặt thành horizontal, undefined (mặc định cho các vai trò khác trừ khi có quy định khác), hoặc vertical.

- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
  - : Nếu separator có thể nhận focus và có giá trị đã biết, `aria-valuenow` xác định giá trị hiện tại. Nếu không thể nhận focus hoặc giá trị không xác định, đừng bao gồm thuộc tính này.

- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) (mặc định là 0)
  - : Nếu separator có thể nhận focus, và giá trị tối thiểu không phải 0, hãy bao gồm giá trị tối thiểu với `aria-valuemin`. Nếu …

- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) (mặc định là 100)
  - : Nếu separator có thể nhận focus, và giá trị tối đa không phải 100, hãy bao gồm `aria-valuemax` với giá trị bằng hoặc lớn hơn `aria-valuemin`.

- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
  - : Nếu separator có thể nhận focus, và `aria-valuenow` không tối ưu trong việc cung cấp thông tin hữu ích cho người dùng, nội dung `aria-valuetext` được bao gồm sẽ được đọc thay cho giá trị `aria-valuenow`.

<!--
### Tương tác bàn phím

### Tính năng JavaScript bắt buộc

## Ví dụ

## Lưu ý về khả năng tiếp cận

## Thực hành tốt nhất

### Ưu tiên HTML -->

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử ngắt chủ đề HTML {{HTMLElement('hr')}}
- [Ví dụ separator trong menubar](https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-editor/)
