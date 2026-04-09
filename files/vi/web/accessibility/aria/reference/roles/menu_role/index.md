---
title: "ARIA: vai trò menu"
short-title: menu
slug: Web/Accessibility/ARIA/Reference/Roles/menu_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#menu
  - https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/
sidebar: accessibilitysidebar
---

Vai trò `menu` là một kiểu widget tổ hợp cung cấp cho người dùng một danh sách các lựa chọn.

## Mô tả

Một `menu` thường biểu thị một nhóm các hành động hoặc chức năng chung mà người dùng có thể gọi. Vai trò `menu` phù hợp khi một danh sách các mục menu được trình bày theo cách giống menu trong một ứng dụng desktop. Các menu con, còn được gọi là menu bật lên, cũng có vai trò `menu`.

Mặc dù từ "menu" thường được dùng chung để mô tả điều hướng trang web, vai trò `menu` dành cho danh sách các hành động hoặc chức năng đòi hỏi chức năng phức tạp, như quản lý focus của widget tổ hợp và điều hướng theo ký tự đầu tiên.

Menu có thể là danh sách điều khiển luôn hiển thị hoặc là widget có thể mở và đóng. Một widget `menu` đang đóng thường được mở hoặc làm hiển thị bằng cách kích hoạt một nút menu, chọn một mục trong menu mở ra menu con, hoặc gọi một lệnh như <kbd>Shift + F10</kbd> trên Windows để mở một menu theo ngữ cảnh.

Khi người dùng kích hoạt một lựa chọn trong menu đã mở, menu thường sẽ đóng lại. Nếu hành động của lựa chọn menu kích hoạt một menu con, menu sẽ vẫn mở và menu con sẽ được hiển thị.

Khi menu mở ra, focus bàn phím sẽ được đặt vào mục menu đầu tiên. Để có thể truy cập bằng bàn phím, bạn cần [quản lý focus](https://primer.style/accessibility/design-guidance/focus-management/) cho tất cả phần tử con: mọi mục menu bên trong `menu` đều có thể focus. Nút menu mở menu và các mục menu, thay vì chính menu, là các phần tử có thể focus.

Các mục menu bao gồm các vai trò [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role), và [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role). Các mục menu [bị vô hiệu hóa](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled) vẫn có thể focus nhưng không thể kích hoạt.

Các mục menu có thể được nhóm trong phần tử có vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role), và được phân tách bằng các phần tử mang vai trò [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role). Cả `group` lẫn `separator` đều không nhận focus và không tương tác.

Nếu `menu` được mở do một thao tác ngữ cảnh, <kbd>Escape</kbd> hoặc <kbd>Enter</kbd> có thể đưa focus trở lại ngữ cảnh đã gọi menu. Nếu focus đang ở nút menu, <kbd>Enter</kbd> sẽ mở menu và đưa focus vào mục menu đầu tiên. Nếu focus đang ở chính menu, <kbd>Escape</kbd> sẽ đóng menu và trả focus về nút menu hoặc mục menubar cha (hoặc thao tác ngữ cảnh đã mở menu).

Các phần tử có vai trò `menu` có giá trị ngầm định của [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) là `vertical`. Với menu nằm ngang, hãy dùng [`aria-orientation="horizontal"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation).

Nếu menu là cố định về mặt trực quan, hãy cân nhắc dùng vai trò [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role) thay thế.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Các vai trò [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role), và [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
  - : Các vai trò của các mục nằm trong một `menu` hoặc `menubar` chứa, được gọi chung là "các mục menu". Chúng phải có thể nhận focus.
- Vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Các mục menu có thể được lồng trong một [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- Vai trò [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
  - : Một đường phân chia ngăn cách và phân biệt các phần nội dung hoặc các nhóm mục menu trong menu

- Thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
  - : Vùng chứa `menu` có `tabindex` đặt thành `-1` hoặc `0` và mỗi mục trong menu có `tabindex` đặt thành `-1`.
- [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
  - : Được đặt thành ID của mục đang focus, nếu có.
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : cho biết menu là nằm ngang hay dọc; mặc định là `vertical` nếu bỏ qua.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : `menu` bắt buộc phải có tên truy cập được. Hãy dùng `aria-labelledby` nếu có nhãn hiển thị, nếu không thì dùng `aria-label`. Hoặc đặt `aria-labelledby` trỏ tới `id` của `menuitem` hoặc `button` điều khiển việc hiển thị của nó, hoặc dùng `aria-label` để định nghĩa nhãn.
- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
  - : Chỉ đặt trên vùng chứa menu để bao gồm các phần tử không phải là con DOM của vùng chứa. Nếu được đặt, các phần tử đó sẽ xuất hiện trong thứ tự đọc theo trình tự mà chúng được tham chiếu và sau mọi mục là con DOM. Khi quản lý focus, hãy đảm bảo thứ tự focus trực quan khớp với thứ tự đọc của công nghệ hỗ trợ này.

### Tương tác bàn phím

- <kbd>Space</kbd> / <kbd>Enter</kbd>
  - : Nếu mục là mục menu cha, nó sẽ mở menu con và chuyển focus đến mục đầu tiên trong menu con. Nếu không, nó kích hoạt mục menu, tải nội dung mới và đặt focus vào tiêu đề của nội dung đó.
- <kbd>Escape</kbd>
  - : Khi ở trong menu con, nó sẽ đóng menu con và đưa focus đến mục menu hoặc menubar cha.
- <kbd>Right Arrow</kbd>
  - : Trong menubar, chuyển focus đến mục tiếp theo trong menubar. Nếu focus ở mục cuối cùng, chuyển focus đến mục đầu tiên. Khi ở trong menu con, nếu focus đang ở mục không có menu con, nó sẽ đóng menu con và chuyển focus đến mục tiếp theo trong menubar. Ngược lại, nó mở menu con của mục menubar vừa được focus mới, giữ focus ở mục menubar cha đó. Nếu không ở trong menubar hay menu con và không ở trên một `menuitem` có menu con, nếu focus không phải là phần tử có thể focus cuối cùng trong menu, nó tùy chọn chuyển focus đến phần tử có thể focus tiếp theo.
- <kbd>Left Arrow </kbd>
  - : Chuyển focus đến mục trước đó trong menubar. Nếu focus ở mục đầu tiên, chuyển focus đến mục cuối cùng. Khi ở trong menu con, nó đóng menu con và chuyển focus đến mục menu cha. Nếu không ở trong menubar hoặc menu con, nếu focus không phải là phần tử có thể focus đầu tiên trong menu, nó tùy chọn chuyển focus đến phần tử có thể focus cuối cùng.
- <kbd>Down Arrow</kbd>
  - : Mở menu con và chuyển focus đến mục đầu tiên trong menu con.
- <kbd>Up Arrow</kbd>
  - : Mở menu con và chuyển focus đến mục cuối cùng trong menu con.
- <kbd>Home</kbd>
  - : Chuyển focus đến mục đầu tiên trong menubar.
- <kbd>End</kbd>
  - : Chuyển focus đến mục cuối cùng trong menubar.
- Bất kỳ phím ký tự nào
  - : Chuyển focus đến mục tiếp theo trong menubar có tên bắt đầu bằng ký tự đã nhập. Nếu không có mục nào có tên bắt đầu bằng ký tự đó, focus không di chuyển.

## Ví dụ

Bên dưới là hai ví dụ triển khai menu.

### Ví dụ 1: menu điều hướng

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

Để tăng cường dần widget điều hướng này, vốn mặc định đã có thể truy cập, lớp dùng để ẩn `menu` và việc thêm `tabindex="-1"` vào nội dung `menuitem` tương tác nên được thêm bằng JavaScript khi tải trang.

Khi đưa một "menu" vào điều hướng trang, đừng dùng vai trò `menu`. Thay vào đó, với điều hướng chính của trang hãy dùng phần tử HTML ngữ nghĩa {{HTMLElement('nav')}} hoặc đơn giản là một danh sách liên kết. Vai trò `menu` nên được dành cho các widget tổ hợp cần quản lý focus. Xem [ARIA practices for disclosure navigation](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure/examples/disclosure-navigation/) để hiểu rõ hơn và xem thêm ví dụ.

### Ví dụ 2: bộ chọn tùy chọn con trong menubar

Đoạn mã sau là một menu bật lên được lồng trong menubar. Nó được hiển thị khi nút menu được kích hoạt. Đây là một menu để chọn màu văn bản từ một danh sách tùy chọn màu:

```html
<div>
  <button
    type="button"
    aria-haspopup="menu"
    aria-controls="colormenu"
    tabindex="0"
    aria-label="Text Color: purple">
    Purple
  </button>
  <ul role="menu" id="colormenu" aria-label="Color Options" tabindex="-1">
    <li
      role="menuitemradio"
      aria-checked="true"
      style="color: purple"
      tabindex="-1">
      Purple
    </li>
    <li
      role="menuitemradio"
      aria-checked="false"
      style="color: magenta"
      tabindex="-1">
      Magenta
    </li>
    <li
      role="menuitemradio"
      aria-checked="false"
      style="color: black;"
      tabindex="-1">
      Black
    </li>
  </ul>
</div>
```

Nút mở menu có đặt [`aria-haspopup="menu"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup), cho biết rõ ràng rằng popup mà nó điều khiển là một `menu`.

Để mở menu, người dùng thường tương tác với một nút menu đóng vai trò trình mở. Nút menu phải có thể focus và phản hồi cả sự kiện click lẫn bàn phím. Khi được focus, chọn <kbd>Enter</kbd>, <kbd>Space</kbd>, <kbd>Down Arrow</kbd>, hoặc <kbd>Up Arrow</kbd> sẽ mở menu và đưa focus vào một mục menu.

Việc mở và đóng menu sẽ bật tắt thuộc tính [`aria-expanded="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) trên nút. Thuộc tính này được thêm khi menu mở. Nó bị gỡ bỏ hoặc đặt thành `false` khi menu đóng. Giá trị `true` cho biết menu đang hiển thị và việc kích hoạt nút menu sẽ đóng menu.

Khi menu mở, bản thân nút thường không nhận focus khi người dùng dùng mũi tên để di chuyển qua các mục menu. Thay vào đó, <kbd>Escape</kbd> và tùy chọn <kbd>Shift + Tab</kbd> sẽ đóng menu và trả focus về nút menu.

Vai trò `menu` được đặt trên {{HTMLElement('ul')}}, xác định phần tử `<ul>` là một menu.

Việc hiển thị và ẩn menu có thể làm bằng CSS. Ví dụ, trong các ví dụ mã này, chúng ta có thể dùng các bộ chọn thuộc tính và bộ chọn anh em kế tiếp để chuyển đổi khả năng hiển thị của menu:

```css
[role="menu"] {
  display: none;
}
[aria-expanded="true"] + [role="menu"] {
  display: block;
}
```

Ví dụ điều hướng có một nút tĩnh. Ví dụ menu con có một nút được cập nhật khi người dùng chọn giá trị mới. Trong trường hợp này, `aria-label="Text Color: purple"` được đặt trên phần tử `menu`. Nó định nghĩa tên truy cập được cho menu là "Text color: purple", xác định mục đích của menu (chọn màu văn bản) và giá trị hiện tại (purple). Khi một màu mới được chọn, giá trị của thuộc tính `aria-label` cũng nên được cập nhật.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
- [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup)
