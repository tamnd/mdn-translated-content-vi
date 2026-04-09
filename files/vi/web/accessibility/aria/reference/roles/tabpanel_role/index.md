---
title: "ARIA: vai trò tabpanel"
short-title: tabpanel
slug: Web/Accessibility/ARIA/Reference/Roles/tabpanel_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#tabpanel
  - https://www.w3.org/WAI/ARIA/apg/patterns/tabs/examples/tabs-manual/
sidebar: accessibilitysidebar
---

ARIA `tabpanel` là một vùng chứa các tài nguyên của nội dung xếp lớp liên kết với một `tab`.

## Mô tả

Vai trò `tabpanel` cho biết phần tử là một vùng chứa cho các tài nguyên liên kết với vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), trong đó mỗi `tab` được chứa trong một [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role).

`tabpanel` là một phần của giao diện tab, một mẫu trải nghiệm người dùng phổ biến trong đó một nhóm tab trực quan cho phép chuyển nhanh giữa nhiều chế độ xem xếp lớp. Mỗi tab được xác định như vậy bằng vai trò `tab`, và các tab này nằm trong một phần tử mang vai trò `tablist`. `tablist` thường được đặt trực quan phía trên hoặc bên cạnh một vùng nội dung, chứa các tabpanel liên quan. `tabpanel` là vai trò của vùng chứa cho mỗi khung nội dung liên kết với một `tab` tương ứng trong `tablist` của giao diện tab.

Trong nhiều giao diện tab, chỉ một `tabpanel` sẽ hiển thị tại một thời điểm. Tuy nhiên, một số giao diện có thể cần hiển thị nhiều tab panel cùng lúc. Trong các trường hợp này, `tablist` sẽ được cung cấp thuộc tính [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable), và các phần tử `tab` sẽ dùng thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) để cho biết `tabpanel` liên kết của nó có đang hiển thị hay không. Trạng thái đã chọn của tab sẽ được dùng để chỉ ra tabpanel nào là panel "đang hoạt động" hiện tại. Ví dụ, điều này có thể cho biết tabpanel nào focus bàn phím sẽ di chuyển đến nếu ai đó nhấn phím <kbd>tab</kbd> khi đang focus vào một tab trong tablist nhiều mục chọn.

Trong giao diện tab chỉ chọn một mục, chỉ `tabpanel` liên kết với tab đang được chọn mới được hiển thị. Tất cả các phần tử `tabpanel` khác liên kết với các tab chưa chọn phải bị ẩn khỏi người dùng. Vì vậy khi lựa chọn tab thay đổi, tabpanel đang hiển thị cũng sẽ thay đổi, và tabpanel trước đó sẽ trở nên bị ẩn.

Trong giao diện tab nhiều mục chọn, có thể hiển thị nhiều phần tử `tabpanel`, khớp với trạng thái mở rộng của các phần tử `tab` liên kết của chúng.

Các tab không hoạt động như liên kết neo tới từng panel riêng lẻ - và khi được kích hoạt, focus bàn phím nên vẫn ở phần tử `tab` hiện tại chứ không tự động chuyển đến `tabpanel` vừa được hiển thị. Mặc dù một giao diện tab có thể được tăng cường dần dựa trên mẫu đánh dấu nền là các siêu liên kết trong trang trỏ tới các phần nội dung liên kết của chúng, khi JavaScript được dùng để biến các phần tử này thành một giao diện tab, hành vi mặc định của các siêu liên kết nên bị ngăn lại. Lý tưởng nhất, việc này có thể được thực hiện bằng cách gỡ bỏ hoặc sửa đổi thuộc tính `href`, vì điều này còn có thêm lợi ích là loại bỏ các mục menu riêng cho siêu liên kết khỏi menu ngữ cảnh của trình duyệt của phần tử.

Khi focus bàn phím đang ở `tablist`, hoặc một `tab` trong `tablist`, phím <kbd>Tab</kbd> nên được lập trình để di chuyển từ tab đang focus - có thể là tab được chọn hoặc không - sang `tabpanel` đại diện cho tab hiện được chọn.

Mỗi `tab` trong `tablist` có thể đóng vai trò là nhãn cho `tabpanel` tương ứng của nó. Bao gồm `id` của mỗi `tab` làm giá trị cho thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) của mỗi `tabpanel`.

Bạn cũng có thể tùy chọn liên kết mỗi `tabpanel` với tab tương ứng của nó bằng cách bao gồm `id` của `tabpanel` làm giá trị cho thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) của tab.

Khi một giao diện tab được khởi tạo, một `tabpanel` được hiển thị và tab liên kết của nó được tạo kiểu để cho biết nó đang hoạt động, phản ánh trạng thái theo chương trình của nó. Tất cả các phần tử `tabpanel` không hoạt động phải bị ẩn với mọi người dùng. Việc này thường được thực hiện bằng thuộc tính CSS `display: none`.

Xem bài viết [ARIA `tab` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) để biết thêm thông tin cụ thể về việc dùng vai trò này.

Bao gồm [`tabindex="-1"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để cho phép một `tabpanel` nhận focus mà không đưa `tabpanel` vào thứ tự focus bàn phím của trang.

Hãy đảm bảo định nghĩa kiểu cho một `tabpanel` khi nó nhận focus, tốt nhất là dùng pseudo-class CSS {{CSSXref(':focus')}}, để người dùng bàn phím biết có sự thay đổi focus và nhận biết nội dung nào hiện đang có focus.

Có thể tạo carousel bằng mẫu tab này: các điều khiển chọn slide có thể được đánh dấu là `tabs` trong một `tablist` với slide được biểu diễn bằng phần tử `tabpanel`.

### Vai trò và thuộc tính liên quan

- [`tab` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
  - : Điều khiển khả năng hiển thị của `tabpanel` liên quan
- [`tablist` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
  - : Nhóm các phần tử `tab`.
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Cung cấp tên truy cập được. Tham chiếu đến phần tử `tab` điều khiển panel
- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Nên được dùng trên các phần tử `tab` cần thiết nếu dùng `tablist` cho phép chọn nhiều mục.

### Tương tác bàn phím

Xem [tương tác bàn phím của `tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role#keyboard_interactions) trong định nghĩa vai trò [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role).

## Ví dụ

Xem ví dụ [`tabpanel`, `tab`, và `tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role#example) trong định nghĩa vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role).

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [ARIA `tab` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
- [ARIA `tablist` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
- [Example: Tabs with Automatic Activation](https://www.w3.org/WAI/ARIA/apg/example-index/tabs/tabs-automatic.html) - W3C
- [Example: Tabs with Manual Activation](https://www.w3.org/WAI/ARIA/apg/example-index/tabs/tabs-manual.html) -W3C
