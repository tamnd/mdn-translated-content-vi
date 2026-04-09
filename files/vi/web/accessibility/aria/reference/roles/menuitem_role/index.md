---
title: "ARIA: vai trò menuitem"
short-title: menuitem
slug: Web/Accessibility/ARIA/Reference/Roles/menuitem_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#menuitem
  - https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/
sidebar: accessibilitysidebar
---

Vai trò `menuitem` cho biết phần tử là một tùy chọn trong một tập các lựa chọn nằm trong `menu` hoặc `menubar`.

## Mô tả

`menuitem` là một trong ba kiểu tùy chọn trong một tập các lựa chọn nằm trong [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role) hoặc [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role); hai kiểu còn lại là [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role) và [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role). `menuitem` chỉ xuất hiện như phần tử con hoặc phần tử được sở hữu bởi các phần tử có vai trò `menu` hoặc `menubar`, tùy chọn được lồng trong một phần tử có vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role) nằm trong, hoặc được sở hữu bởi, một menu.

Nếu `menuitem` không phải là phần tử con của menu trong DOM, hãy thêm thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) vào menu để chỉ ra mối quan hệ này. Nếu `aria-owns` được đặt trên vùng chứa menu để bao gồm các phần tử không phải là phần tử con DOM của vùng chứa, những phần tử đó sẽ xuất hiện trong thứ tự đọc theo thứ tự chúng được tham chiếu và sau bất kỳ phần tử con DOM nào trong các công nghệ hỗ trợ có hỗ trợ. Hãy bảo đảm thứ tự focus trực quan khớp với thứ tự đọc của công nghệ hỗ trợ.

Mọi `menuitem` trong menu đều có thể nhận focus, dù có bị vô hiệu hóa hay không. Chỉ ra một `menuitem` bị vô hiệu hóa bằng cách đặt [`aria-disabled="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled) trên phần tử đó.

Nếu một `menuitem` có submenu, hãy lập trình để nó hiển thị một menu cấp dưới mới khi menu item được kích hoạt và thêm [`aria-haspopup="menu"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) hoặc giá trị `true` để báo cho công nghệ hỗ trợ rằng menu item dùng để mở một submenu.

Một quy ước phổ biến để chỉ ra rằng một `menuitem` mở hộp thoại là thêm "…" (dấu ba chấm) vào nhãn menu item, ví dụ "Save as …".

Mọi `menuitem` phải có một tên khả năng tiếp cận. Tên này mặc định lấy từ nội dung của phần tử. Nếu nội dung không cung cấp được tên khả năng tiếp cận hữu ích, có thể dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) để tham chiếu nhãn hiển thị. Nếu không có nội dung hiển thị nào để cung cấp tên khả năng tiếp cận, có thể cung cấp tên bằng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Vai trò [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
  - : Một widget cung cấp danh sách các lựa chọn. Vai trò ngữ cảnh bắt buộc (hoặc `menubar`)
- Vai trò [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
  - : Một trình bày của `menu` thường luôn hiển thị và thường được trình bày theo chiều ngang. Vai trò ngữ cảnh bắt buộc (hoặc `menu`)
- Vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Có thể được dùng để xác định một tập các `menuitem` liên quan trong hoặc thuộc sở hữu của một `menu` hoặc `menubar`
- [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled)
  - : Chỉ ra phần tử có thể nhận biết được nhưng bị vô hiệu hóa, nên không thể thao tác
- [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup)
  - : Chỉ ra sự tồn tại và kiểu popup tương tác có thể được kích hoạt bởi `menuitem`

### Tương tác bàn phím

- <kbd>Enter</kbd> và <kbd>Space</kbd>
  - : Nếu `menuitem` có submenu, mở submenu và đặt focus lên phần tử đầu tiên trong submenu. Nếu không, kích hoạt mục và đóng menu.
- <kbd>Down Arrow</kbd>
  - : Trên một `menuitem` có submenu trong `menubar`, mở submenu và đặt focus lên phần tử đầu tiên trong submenu. Nếu không, chuyển focus tới mục tiếp theo, tùy chọn quay vòng từ cuối về đầu.
- <kbd>Up Arrow</kbd>
  - : Chuyển focus tới mục trước đó, tùy chọn quay vòng từ đầu về cuối. Tùy chọn, nếu `menuitem` nằm trong menubar và có submenu, mở submenu và đặt focus lên phần tử cuối cùng trong submenu.
- <kbd>Right Arrow</kbd>
  - : Nếu đang ở trong một `menu` được mở bằng menubutton và không nằm trong `menubar`, và menuitem không có submenu, không làm gì cả. Khi focus nằm trong `menubar`, chuyển focus tới mục tiếp theo, tùy chọn quay vòng từ cuối về đầu. Khi focus nằm trong một `menu` và trên một `menuitem` có submenu, mở submenu và đặt focus lên phần tử đầu tiên của nó. Khi focus nằm trong một `menu` và trên một mục không có submenu, đóng submenu và mọi menu cha, chuyển focus tới mục tiếp theo trong `menubar`, và nếu focus lúc này nằm trên một `menuitem` có submenu, либо mở submenu của `menuitem` đó mà không chuyển focus vào submenu, hoặc mở submenu của `menuitem` đó và đặt focus lên phần tử đầu tiên trong submenu.
- <kbd>Left Arrow</kbd>
  - : Khi focus nằm trong `menubar`, chuyển focus tới mục trước đó, tùy chọn quay vòng từ đầu về cuối. Khi focus nằm trong submenu của một mục trong menu, đóng submenu và trả focus về `menuitem` cha. Khi focus nằm trong submenu của một mục trong `menubar`, đóng submenu, chuyển focus tới mục trước đó trong `menubar`, và nếu focus lúc này nằm trên một `menuitem` có submenu, либо mở submenu của `menuitem` đó mà không chuyển focus vào submenu, hoặc mở submenu của `menuitem` đó và đặt focus lên phần tử đầu tiên trong submenu.
- <kbd>Home</kbd>
  - : Nếu không hỗ trợ quay vòng bằng phím mũi tên, chuyển focus tới mục đầu tiên trong `menu` hoặc `menubar` hiện tại.
- <kbd>End</kbd>
  - : Nếu không hỗ trợ quay vòng bằng phím mũi tên, chuyển focus tới mục cuối cùng trong `menu` hoặc `menubar` hiện tại.
- Bất kỳ phím nào tương ứng với một ký tự có thể in ra (tùy chọn)
  - : Chuyển focus tới mục tiếp theo trong menu hiện tại có nhãn bắt đầu bằng ký tự có thể in ra vừa được gõ.
- <kbd>Escape</kbd>
  - : Đóng menu đang chứa focus và trả focus về phần tử hoặc ngữ cảnh, ví dụ menubutton hoặc `menuitem` cha, từ đó menu đã được mở.
- <kbd>Tab</kbd>
  - : Chuyển focus tới phần tử tiếp theo trong chuỗi tab, và nếu mục đang có focus không nằm trong menubar, đóng menu của nó và mọi vùng chứa menu cha đang mở.
- <kbd>Shift + Tab</kbd>
  - : Chuyển focus tới phần tử trước đó trong chuỗi tab, và nếu mục đang có focus không nằm trong menubar, đóng menu của nó và mọi vùng chứa menu cha đang mở.

Nếu một menu được mở hoặc một menu bar nhận focus do một hành động ngữ cảnh, <kbd>Escape</kbd> hoặc <kbd>Enter</kbd> có thể trả focus về ngữ cảnh đã gọi.

Một số triển khai menubar điều hướng có thể có các phần tử menuitem vừa thực hiện một chức năng vừa mở submenu. Trong các triển khai như vậy, <kbd>Enter</kbd> và <kbd>Space</kbd> thực hiện chức năng điều hướng, còn <kbd>Down Arrow</kbd>, trong một menubar ngang, mở submenu gắn với chính menuitem đó.

Khi các mục trong một `menubar` được bố trí theo chiều dọc và các mục trong vùng chứa menu được bố trí theo chiều ngang thì <kbd>Down Arrow</kbd> hoạt động như <kbd>Right Arrow</kbd> như mô tả ở trên, <kbd>Up Arrow</kbd> hoạt động như <kbd>Left Arrow</kbd> như mô tả ở trên, và ngược lại.

## Ví dụ

```html
<div>
  <button id="menubutton" aria-haspopup="true" aria-controls="menu">
    <img src="hamburger.svg" alt="Page Sections" />
  </button>
  <ul id="menu" role="menu" aria-labelledby="menubutton">
    <li role="presentation">
      <a role="menuitem" href="#description">Description</a>
    </li>
    <li role="presentation">
      <a
        role="menuitem"
        href="#associated_wai-aria_roles_states_and_properties">
        Associated WAI-ARIA roles, states, and properties
      </a>
    </li>
    <li role="presentation">
      <a role="menuitem" href="#keyboard_interactions">
        Keyboard interactions
      </a>
    </li>
    <li role="presentation">
      <a role="menuitem" href="#examples">Examples</a>
    </li>
    <li role="presentation">
      <a role="menuitem" href="#specifications">Specifications</a>
    </li>
    <li role="presentation">
      <a role="menuitem" href="#see_also">See Also</a>
    </li>
  </ul>
</div>
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [`menuitemcheckbox` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`listitem` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
- [`option` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
