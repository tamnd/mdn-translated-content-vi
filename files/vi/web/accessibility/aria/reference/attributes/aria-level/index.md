---
title: "ARIA: thuộc tính aria-level"
short-title: aria-level
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-level
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-level
sidebar: accessibilitysidebar
---

Thuộc tính `aria-level` định nghĩa mức phân cấp của một phần tử trong một cấu trúc.

## Mô tả

Các mức phân cấp xuất hiện trong tiêu đề, cây, grid lồng nhau, tablist lồng nhau, và nhiều nơi khác. Nếu quan hệ tổ tiên trong DOM không biểu diễn chính xác cấp độ, thuộc tính `aria-level` nên được dùng để định nghĩa mức phân cấp của các phần tử trong cấu trúc phân cấp của chúng. Cấp độ tăng theo độ sâu. Giá trị của aria-level là một số nguyên lớn hơn hoặc bằng `1`.

Khi xét đến các tiêu đề trong một cấu trúc tài liệu, bạn có thể có tiêu đề cấp 1, tiêu đề cấp 2, tiêu đề cấp 3, v.v. Trong cây, bạn có phần tử gốc, các phần tử con của nó, các phần tử con của các phần tử con đó, và cứ tiếp tục như vậy.

Thuộc tính `aria-level` làm lộ cấu trúc phân cấp cho công nghệ hỗ trợ để có thể truyền đạt cho người dùng. Giống như tất cả các thuộc tính ARIA, nó không ảnh hưởng đến tác nhân người dùng và vì vậy không ảnh hưởng đến việc tác nhân người dùng xác định cấu trúc tài liệu.

Nếu quan hệ tổ tiên trong DOM biểu diễn chính xác cấp độ, tác nhân người dùng có thể tính toán cấp độ của một mục từ cấu trúc tài liệu, khiến `aria-level` không chỉ dư thừa mà còn có nguy cơ tạo ra thông tin sai. Thực ra `aria-level` chỉ nên được dùng để cung cấp chỉ dẫn tường minh về cấp độ khi không thể tính toán từ cấu trúc tài liệu. Hãy kiểm thử để xem thuộc tính này có cần thiết không. Nếu tác nhân người dùng có thể tính được cấp độ, tốt nhất là bỏ qua thuộc tính `aria-level`.

### Với vai trò `heading`

Thuộc tính `aria-level` là một thuộc tính bắt buộc của vai trò [`heading`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role), vốn cho công nghệ hỗ trợ biết rằng phần tử nên được xem như một tiêu đề. `<div role="heading" aria-level="1">` định nghĩa `<div>` là tiêu đề chính của trang. Một tiêu đề cấp 2, được định nghĩa với `aria-level="2"`, sẽ là phần phụ đầu tiên, cấp 3 là phần phụ của phần đó, và cứ thế tiếp tục.

```html
<div role="heading" aria-level="3">Tiêu đề cho phần phụ này</div>
```

Hãy ưu tiên dùng các phần tử {{htmlelement("Heading_Elements", "h1")}} đến {{htmlelement("Heading_Elements", "h6")}}.

### Trong vai trò `treegrid`

Trong trường hợp một [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role), `aria-level` được hỗ trợ trên các phần tử có vai trò [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role), chứ không phải trên các phần tử có vai trò [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role). Các hàng đóng vai trò là nút lá trong hướng dọc của grid. Gridcell là nút lá trong hướng ngang của từng hàng. Thuộc tính `aria-level` không được hỗ trợ trên các ô trong hàng. Vì vậy, trong treegrid, thuộc tính `aria-level` được áp dụng cho phần tử có vai trò `row`.

Nếu một tập đầy đủ các nút sẵn có không có trong DOM do tải động khi người dùng di chuyển tiêu điểm hoặc cuộn trong cây, mỗi nút sẽ bao gồm `aria-level`, [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), và [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset).

## Giá trị

- `<integer>`
  - : Một số nguyên lớn hơn hoặc bằng 1

## Giao diện liên quan

- {{domxref("Element.ariaLevel")}}
  - : Thuộc tính [`ariaLevel`](/en-US/docs/Web/API/Element/ariaLevel), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-level`.
- {{domxref("ElementInternals.ariaLevel")}}
  - : Thuộc tính [`ariaLevel`](/en-US/docs/Web/API/ElementInternals/ariaLevel), là một phần của giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-level`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`associationlistitemkey`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`comment`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/comment_role)
- [`heading`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`<h1>` đến `<h6>`: các phần tử tiêu đề của HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) ({{htmlelement("Heading_Elements", "h1")}}, {{htmlelement("Heading_Elements", "h2")}}, {{htmlelement("Heading_Elements", "h3")}}, {{htmlelement("Heading_Elements", "h4")}}, {{htmlelement("Heading_Elements", "h5")}}, và {{htmlelement("Heading_Elements", "h6")}})
