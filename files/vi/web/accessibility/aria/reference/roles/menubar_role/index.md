---
title: "ARIA: vai trò menubar"
short-title: menubar
slug: Web/Accessibility/ARIA/Reference/Roles/menubar_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#menubar
  - https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/
sidebar: accessibilitysidebar
---

`menubar` là một cách trình bày của `menu` thường luôn hiển thị và thường được trình bày theo chiều ngang.

## Mô tả

Một menu là một widget cung cấp một danh sách các lựa chọn cho người dùng, như một tập hành động hoặc chức năng. Kiểu menu menubar thường được trình bày như một thanh lệnh ngang luôn hiển thị. Menubar hoạt động giống thanh menu gốc của hệ điều hành, chẳng hạn các thanh menu chứa menu thả xuống, thường thấy ở đầu nhiều cửa sổ ứng dụng desktop.

Vai trò `menubar` được dùng để tạo một thanh menu giống như những thanh ở gần đầu cửa sổ trong nhiều ứng dụng desktop, luôn hiển thị, thường theo chiều ngang, cung cấp cho người dùng quyền truy cập nhanh vào một tập lệnh nhất quán.

Một `menubar` chứa ba kiểu menu item, gồm [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role) và [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role). Các menu item này có thể tùy chọn được lồng trong một hoặc nhiều vùng chứa [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role). Các group hoặc item có thể tùy chọn được ngăn cách bằng các phần tử [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role). Trong khi mọi menu item đều phải có thể nhận focus, kể cả khi bị vô hiệu hóa, các phần tử `group` và `separator` không thể nhận focus.

Một ví dụ về menubar gốc là thanh có thể xuất hiện ở đầu màn hình nếu bạn đang đọc trang này trong trình duyệt desktop. Một ví dụ về menubar trên web là thanh menu ngang hiển thị "File Edit View Insert Format", v.v., thường thấy bên dưới tên tài liệu trong Google Docs.

Tương tác với menubar nên tương tự với cách tương tác điển hình của thanh menu trong giao diện đồ họa desktop. Trong Google Docs, mỗi menu item đó là một `menuitem` có submenu popup, vì vậy mỗi cái đều có thuộc tính `aria-haspopup` đặt thành `true`. Bản thân phần tử `menubar` thì không.

Menubar và tất cả menu item đều có thể nhận focus và có thuộc tính [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) được đặt. Khi menubar nhận focus qua việc tab, focus bàn phím được đặt vào menuitem đầu tiên. Mỗi mục trong menu có `tabindex` đặt thành `-1`, ngoại trừ mục đầu tiên có `tabindex` đặt thành `0`.

Nếu một menubar nhận focus do một hành động ngữ cảnh, chẳng hạn phím tắt, <kbd>Escape</kbd> hoặc <kbd>Enter</kbd> có thể trả focus về ngữ cảnh đã gọi. Tuy nhiên, hãy bảo đảm không tạo các phím tắt xung đột với phím tắt của user agent, hệ điều hành hoặc công nghệ hỗ trợ - bất kỳ UA, OS, hay AT nào.

Mọi menu item, dù được lồng sâu đến đâu, đều có thể nhận focus, kể cả khi bị vô hiệu hóa.

Nếu một `menubar` có nhãn hiển thị, hãy bao gồm [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) được đặt thành một giá trị tham chiếu tới phần tử gắn nhãn. Nếu không, hãy cung cấp cho menubar một tên khả năng tiếp cận bằng cách bao gồm một [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) mô tả.

Một phần tử `menuitem` trong `menubar` có thể chứa submenu con gồm các menu item. Submenu có thể được lồng nhiều tầng. Thông thường, menubar ngoài cùng là ngang và tất cả submenu là dọc. Nếu không như vậy, nếu menubar của bạn là dọc, hãy thêm [`aria-orientation="vertical"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) vào phần tử `menubar`. Nếu không, thuộc tính này không cần thiết vì giá trị mặc định là horizontal.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Xác định một tập menu item
- Vai trò [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
  - : Một tùy chọn trong tập lựa chọn được chứa bởi một `menubar`. Có thể có submenu.
- Vai trò [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
  - : Một menu item có thể đánh dấu trong một tập phần tử có cùng vai trò, trong đó chỉ một phần tử có thể được đánh dấu tại một thời điểm.
- Vai trò [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
  - : một menu item có trạng thái có thể đánh dấu với các giá trị có thể là `true`, `false` hoặc `mixed`.
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : Bao gồm `aria-orientation="vertical"` trên phần tử `menubar` nếu menubar là dọc. Hướng mặc định là `horizontal`.

### Tương tác bàn phím

Khi focus nằm trong `menubar`, nó luôn nằm trên một menu item bên trong thanh menu. Khi focus nằm trên một `menuitem` cấp cao nhất trong thanh menu, các tương tác bàn phím sau phải được hỗ trợ:

- <kbd>Down Arrow</kbd>
  - : Nếu `menuitem` hiện đang focus có submenu, mở submenu và đặt focus lên phần tử đầu tiên trong submenu.
- <kbd>Up Arrow</kbd>
  - : (Tùy chọn) Nếu `menuitem` hiện đang focus có submenu, mở submenu và đặt focus lên phần tử _cuối cùng_ trong submenu.
- <kbd>Right Arrow</kbd>
  - : Chuyển focus tới mục tiếp theo, tùy chọn quay vòng từ cuối về đầu.
- <kbd>Left Arrow</kbd>
  - : Chuyển focus tới mục trước đó, tùy chọn quay vòng từ đầu về cuối.
- <kbd>Home</kbd>
  - : Nếu không hỗ trợ quay vòng bằng phím mũi tên, chuyển focus tới mục đầu tiên trong `menubar`.
- <kbd>End</kbd>
  - : Nếu không hỗ trợ quay vòng bằng phím mũi tên, chuyển focus tới mục cuối cùng trong `menubar`.
- <kbd>Tab</kbd>
  - : Chuyển focus tới phần tử tiếp theo trong chuỗi tab. Nếu điều đó làm nó rời khỏi menubar, tất cả submenu trong menubar sẽ bị đóng.
- <kbd>shift + Tab</kbd>
  - : Chuyển focus tới phần tử trước đó trong chuỗi tab. Nếu điều đó làm nó rời khỏi menubar, tất cả submenu trong menubar sẽ bị đóng.

Xem [`menuitem` keyboard interactions](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role#keyboard_interactions), [`menuitemradio` keyboard interactions](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role#keyboard_interactions), và [`menuitemcheckbox` keyboard interactions](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role#keyboard_interactions) để biết thêm về tương tác bàn phím khi focus nằm trên một menuitem trong menubar (vốn luôn là như vậy).

Lưu ý: Các tương tác trên giả định `menubar` là ngang. Nếu `menubar` là dọc, hãy thêm `aria-orientation="vertical"` và thay đổi các phím bàn phím sau tương ứng:

- <kbd>Down Arrow</kbd>
  - : Hoạt động như <kbd>Right Arrow</kbd> như đã mô tả ở trên.
- <kbd>Up Arrow</kbd>
  - : Hoạt động như <kbd>Left Arrow</kbd> như đã mô tả ở trên
- <kbd>Right Arrow</kbd>
  - : Hoạt động như <kbd>Down Arrow</kbd> như đã mô tả ở trên.
- <kbd>Left Arrow</kbd>
  - : Hoạt động như <kbd>Up Arrow</kbd> như đã mô tả ở trên

## Ví dụ

- [W3C WAI-ARIA practices: navigation `menubar` example](https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/)
- [W3C WAI-ARIA practices: editor `menubar` example](https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-editor/)

## Đặc tả

{{Specifications}}

## Xem thêm

- Vai trò [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)
