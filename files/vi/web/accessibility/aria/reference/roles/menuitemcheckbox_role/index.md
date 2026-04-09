---
title: "ARIA: vai trò menuitemcheckbox"
short-title: menuitemcheckbox
slug: Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#menuitemcheckbox
  - https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/
sidebar: accessibilitysidebar
---

`menuitemcheckbox` là một `menuitem` có trạng thái có thể đánh dấu, với các giá trị có thể là `true`, `false` hoặc `mixed`.

## Mô tả

Các mục trong menu và menubar là menu item. Có ba kiểu menu item: [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role), và `menuitemcheckbox`.

Ba phần tử này chỉ có thể được chứa trong, hoặc được sở hữu bởi, một phần tử có vai trò [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role) hoặc [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role), tùy chọn được lồng trong một phần tử nhóm có vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role). Việc lồng hoặc được sở hữu khác đi (xem [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)) trong một `menu` hoặc `menubar` xác định các menu item là những widget liên quan với nhau.

Các menu item, bao gồm các phần tử `menuitemcheckbox`, có thể được nhóm trong các phần tử `group` hoặc được ngăn cách bằng các phần tử có vai trò [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) hoặc vai trò gốc tương đương khác như {{HTMLElement('fieldset')}} và {{HTMLElement('hr')}}.

Các menu item chứa vai trò `menuitemcheckbox` phải bao gồm thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) để công nghệ hỗ trợ thấy được trạng thái checkbox, trừ khi dùng [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox), trong trường hợp đó nên dùng thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#checked).

Tương tự như thuộc tính `checked` của các phần tử {{HTMLElement('input')}} kiểu `checkbox`, thuộc tính `aria-checked` của `menuitemcheckbox` cho biết menu item đang được đánh dấu (`true`), chưa được đánh dấu (`false`), hay đại diện cho một menu cấp dưới khác gồm các menu item có giá trị vừa được đánh dấu vừa chưa được đánh dấu (`mixed`). Giá trị `mixed` tương tự thuộc tính [`indeterminate`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#indeterminate_state_checkboxes) của checkbox, tạo ra trạng thái thứ ba, không được đánh dấu cũng không chưa được đánh dấu.

Bắt buộc phải có tên khả năng tiếp cận. Lý tưởng nhất, tên này nên đến từ một phần tử {{htmlelement('label')}} liên kết nếu dùng `<input type="checkbox">` hoặc nội dung con hiển thị. Lưu ý rằng nếu nhãn hoặc nội dung con không đủ và, tốt hơn là, dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) tham chiếu nội dung không phải con hoặc dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), thì hai thuộc tính ARIA này sẽ ẩn các nội dung con khác khỏi công nghệ hỗ trợ.

Nếu tất cả phần tử trong tập không có trong DOM, hãy bao gồm các thuộc tính [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize) và [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset). Khi chỉ định `aria-setsize` và `aria-posinset` trên một `menuitemcheckbox`, hãy đặt giá trị theo tổng số mục trong menu, không tính các separator.

Phần tử `menuitemcheckbox` có thể có nội dung theo cụm từ, nhưng không được có nội dung tương tác làm phần tử con và không có phần tử con nào có thuộc tính `tabindex` được chỉ định.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `menuitemcheckbox`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `menuitemcheckbox` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `menuitemcheckbox` sau, có chứa một tiêu đề.

```html
<div role="menuitemcheckbox"><h6>Name of my checkbox</h6></div>
```

Vì các phần tử con của `menuitemcheckbox` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="menuitemcheckbox">
  <h6 role="presentation">Name of my checkbox</h6>
</div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="menuitemcheckbox">Name of my checkbox</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Vai trò [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
  - : Widget cung cấp danh sách các hành động hoặc chức năng phổ biến mà người dùng có thể gọi.
- Vai trò [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
  - : Tương tự `menu` nhưng dành cho một tập lệnh thường dùng nhất quán, luôn hiển thị và thường trình bày theo chiều ngang.
- Vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Vùng chứa cho một nhóm phần tử `menuitem`, bao gồm các phần tử `menuitemcheckbox` trong một `menu` hoặc `menubar`.
- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) (Bắt buộc)
  - : Đặt thành `true`, `false` hoặc `mixed`, nó cho biết trạng thái "đã đánh dấu" hiện tại của menuitemcheckbox

### Tương tác bàn phím

Khi một `menu` mở ra, hoặc khi một `menubar` nhận focus, focus bàn phím được đặt vào mục đầu tiên. Tất cả các mục trong cả hai đều có thể nhận focus, bao gồm mọi phần tử `menuitemcheckbox`.

Nếu `menuitemcheckbox` nằm trong submenu của một `menubar` hoặc một menu được mở bằng menu button, các tương tác bàn phím sau phải được lập trình:

- <kbd>Enter</kbd>
  - : Chuyển trạng thái `aria-checked` của `menuitemcheckbox` và đóng menu.
- <kbd>Space</kbd>
  - : Chuyển trạng thái `aria-checked` của `menuitemcheckbox`. Không đóng menu.
- <kbd>Escape</kbd>
  - : Đóng menu. Trong menubar, chuyển focus về mục cha của menubar.
- <kbd>Right Arrow</kbd>
  - : Đóng submenu. Trong menubar, chuyển focus tới mục tiếp theo trong menubar, mở bất kỳ submenu nào nếu có.
- <kbd>Left Arrow</kbd>
  - : Đóng menu. Trong menubar, chuyển focus tới mục trước đó trong menubar, mở bất kỳ submenu nào nếu có.
- <kbd>Down Arrow</kbd>
  - : Chuyển focus tới mục tiếp theo trong menu. Nếu focus đang ở mục cuối, chuyển focus về mục đầu.
- <kbd>Up Arrow</kbd>
  - : Chuyển focus tới mục trước đó trong menu. Nếu focus đang ở mục đầu, chuyển focus về mục cuối.
- <kbd>Home</kbd>
  - : Chuyển focus tới mục đầu tiên trong menu.
- <kbd>End</kbd>
  - : Chuyển focus tới mục cuối cùng trong menu.
- <kbd>Character</kbd>
  - : Chuyển focus tới mục tiếp theo có nhãn bắt đầu bằng ký tự vừa gõ. Nếu không có mục nào có nhãn bắt đầu bằng ký tự đó, focus không di chuyển.

### JavaScript bắt buộc

#### Trình xử lý sự kiện bắt buộc

- `onclick`
  - : Xử lý nhấp chuột trên cả checkbox và nhãn liên quan, thay đổi trạng thái checkbox bằng cách đổi giá trị thuộc tính `aria-checked` và đổi giao diện của checkbox để người dùng nhìn thấy nó như được đánh dấu hoặc không được đánh dấu
- `onKeyDown`
  - : Xử lý trường hợp người dùng nhấn phím <kbd>Space</kbd> để thay đổi trạng thái checkbox bằng cách đổi giá trị thuộc tính `aria-checked` và đổi giao diện của checkbox để người dùng nhìn thấy nó như được đánh dấu hoặc không được đánh dấu. Đồng thời xử lý tất cả các phím đã liệt kê ở phần điều hướng bàn phím ở trên.

## Ví dụ

```html
<li role="menuitemcheckbox" tabindex="-1" aria-checked="false">Purple</li>
```

[`tabindex="-1"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) làm cho `menuitemcheckbox` có thể nhận focus nhưng không nằm trong chuỗi tab của trang. Nếu chúng ta bao gồm `aria-checked="true"` thì nó sẽ cho biết `menuitemcheckbox` đang được đánh dấu, và chúng ta sẽ tạo kiểu trực quan cho trạng thái được chọn giống như được đánh dấu bằng bộ chọn thuộc tính `[role='menuitemcheckbox'][aria-checked='true']`. Thay vào đó, sự hiện diện của `aria-checked="false"` chỉ ra với công nghệ hỗ trợ rằng `menuitemcheckbox` có thể được đánh dấu nhưng hiện chưa được đánh dấu. Tên khả năng tiếp cận "purple" đến từ nội dung.

Giao diện trực quan của trạng thái được chọn là một checkbox đã được đánh dấu, và chúng ta có thể tạo nó bằng [generated content](/en-US/docs/Web/CSS/Guides/Generated_content), làm cho nó hiển thị và cùng màu với nội dung bằng cách đồng bộ với giá trị `aria-checked` bằng các [attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) CSS và [kế thừa](/en-US/docs/Web/CSS/Reference/Values/inherit) màu sắc.

```css
[role="menuitemcheckbox"]::before {
  display: inline-block;
  content: "";
  color: transparent;
  width: 1em;
  text-align: center;
  outline: 1px solid;
  margin-inline-end: 2px;
  font-family: sans-serif;
}
[role="menuitemcheckbox"][aria-checked="true"]::before {
  color: inherit;
  content: "X";
}
```

### Ưu tiên HTML

Quy tắc đầu tiên của ARIA là: nếu một phần tử hoặc thuộc tính HTML gốc có ngữ nghĩa và hành vi bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử và thêm vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có thể tiếp cận. Vì vậy, nên dùng điều khiển biểu mẫu [checkbox HTML](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) gốc thay vì dựng lại chức năng checkbox bằng JavaScript và ARIA.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`menuitemradio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`checkbox` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)
