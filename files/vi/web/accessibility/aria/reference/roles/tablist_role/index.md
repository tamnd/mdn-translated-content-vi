---
title: "ARIA: vai trò tablist"
short-title: tablist
slug: Web/Accessibility/ARIA/Reference/Roles/tablist_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#tablist
sidebar: accessibilitysidebar
---

Vai trò `tablist` xác định phần tử đóng vai trò là vùng chứa cho một tập hợp các `tab`. Nội dung của tab được gọi là các phần tử `tabpanel`.

## Mô tả

Bạn có thể đang tương tác với một giao diện theo tab khi đọc phần này! Các tab của trình duyệt cho phép người dùng mở nhiều trang web trong một cửa sổ duy nhất. Nhấp vào một tab trong tablist ở đầu cửa sổ trình duyệt cho phép người dùng hiển thị nội dung liên quan trong vùng nội dung chính, tức tabpanel, từng trang một. Đây được gọi là "mẫu thiết kế tab".

Khi triển khai mẫu thiết kế tab, các vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role), `tablist` và [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role) được dùng.

Tabs là một tập hợp các phần nội dung xếp lớp, được gọi là tab panels, hiển thị một panel nội dung tại một thời điểm. Mỗi tab panel có một phần tử `tab` liên kết, và khi được kích hoạt, nó sẽ hiển thị panel. Danh sách các phần tử tab được sắp xếp dọc theo một cạnh của panel đang hiển thị, thường là cạnh trên, và được lồng trong một phần tử `tablist`.

Mỗi `tab` trong `tablist` đóng vai trò là nhãn cho một `tabpanel` và có thể được kích hoạt để hiển thị panel đó. `tablist` là phần tử chứa cho tập hợp các phần tử tab bên trong.

Khi một giao diện theo tab được khởi tạo, một tab panel được hiển thị và tab liên kết của nó được tạo kiểu để cho biết nó đang hoạt động. Khi người dùng kích hoạt một trong các phần tử tab khác, tab panel trước đó được hiển thị sẽ bị ẩn, tab panel liên kết với tab đã kích hoạt sẽ trở nên hiển thị, và tab đó được xem là "đang hoạt động".

Đối với một tablist chỉ chọn một mục, các phần tử tabpanel không hoạt động nên bị ẩn khỏi người dùng cho đến khi người dùng chọn tab liên kết với tabpanel đó.

Khi tạo một tablist cho phép chọn nhiều mục, hãy bao gồm [`aria-multiselectable="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable) trên phần tử `tablist`.

Các phần tử `tab`, không phải `tablist`, có thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected). Đặt `aria-selected="true"` cho các tab liên kết với mỗi tabpanel đang hiển thị. Các tab liên kết với các phần tử tabpanel bị ẩn có thuộc tính `aria-selected` được đặt thành `false`.

Nếu danh sách tab có nhãn hiển thị, hãy đặt [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) thành `id` của phần tử gắn nhãn. Nếu không, dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) để cung cấp nhãn.

Để có thể truy cập bằng bàn phím, focus phải được quản lý cho các phần tử con của vai trò này.

Các phần tử mang vai trò `tablist` có giá trị ngầm định của [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) là `horizontal`.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) role
  - : Required Owned Elements. Mỗi tablist phải có một hoặc nhiều phần tử con `tab`.
- [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable)
  - : Khi đặt thành `true`, cho biết người dùng có thể chọn nhiều hơn một `tab` từ các phần tử con của `tablist`.
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : Nếu phần tử tablist được định hướng dọc, hãy đặt `aria-orientation="vertical"`. Mặc định là `horizontal`.

### Tương tác bàn phím

Đối với danh sách tab:

- <kbd>Tab</kbd>
  - : Khi focus di chuyển vào tab list, đặt focus vào phần tử `tab` đang hoạt động. <br/><br/>Khi tab list đang chứa focus, chuyển focus đến phần tử kế tiếp trong chuỗi tab của trang bên ngoài tablist, tức tabpanel, trừ khi phần tử đầu tiên chứa nội dung có ý nghĩa bên trong tabpanel là phần tử có thể focus.

Khi focus ở một phần tử tab trong tab list ngang:

- <kbd>Left Arrow</kbd>
  - : chuyển focus tới tab trước đó. Nếu focus ở tab đầu tiên, chuyển focus đến tab cuối cùng. Tùy chọn, kích hoạt tab vừa được focus
- <kbd>Right Arrow</kbd>
  - : Chuyển focus tới tab tiếp theo. Nếu focus ở phần tử tab cuối cùng, chuyển focus đến tab đầu tiên. Tùy chọn, kích hoạt tab vừa được focus

Khi focus ở một phần tử tab trong tab list dọc:

- <kbd>Up Arrow</kbd>
  - : chuyển focus tới tab trước đó. Nếu focus ở tab đầu tiên, chuyển focus đến tab cuối cùng. Tùy chọn, kích hoạt tab vừa được focus
- <kbd>Down Arrow</kbd>
  - : Chuyển focus tới tab tiếp theo. Nếu focus ở phần tử tab cuối cùng, chuyển focus đến tab đầu tiên. Tùy chọn, kích hoạt tab vừa được focus

Nếu tab list là ngang, nó không lắng nghe <kbd>Down Arrow</kbd> hoặc <kbd>Up Arrow</kbd> để các phím đó vẫn thực hiện chức năng cuộn mặc định của trình duyệt ngay cả khi focus nằm trong tab list.

Khi focus ở một tab trong tablist với định hướng ngang hoặc dọc:

- <kbd>Space</kbd> hoặc <kbd>Enter</kbd>
  - : Kích hoạt tab nếu nó chưa được kích hoạt tự động khi focus.
- <kbd>Home</kbd> (Tùy chọn)
  - : Chuyển focus đến tab đầu tiên. Tùy chọn, kích hoạt tab vừa được focus
- <kbd>End</kbd> (Tùy chọn)
  - : Chuyển focus đến tab cuối cùng. Tùy chọn, kích hoạt tab vừa được focus
- <kbd>Shift + F10</kbd>
  - : Nếu tab có menu bật lên liên kết, mở menu.
- <kbd>Delete</kbd> (Tùy chọn)
  - : Nếu được phép xóa, xóa (đóng) phần tử tab hiện tại và tab panel liên kết của nó, đặt focus vào tab theo sau tab vừa bị đóng, và tùy chọn kích hoạt tab vừa được focus. Nếu không có tab nào theo sau tab đã bị xóa, ví dụ tab bị xóa là tab ngoài cùng bên phải trong tab list ngang từ trái sang phải, sẽ đặt focus và tùy chọn kích hoạt tab đứng trước tab đã bị xóa. Nếu ứng dụng cho phép xóa tất cả các tab, và người dùng xóa tab còn lại cuối cùng trong tab list, ứng dụng sẽ chuyển focus sang một phần tử khác có luồng công việc hợp lý. Ngoài Delete, hoặc bên cạnh hỗ trợ Delete, chức năng xóa có sẵn trong menu ngữ cảnh.

<!--
### Required JavaScript features

## Accessibility concerns

## Best Practices

### Prefer HTML
-->

## Ví dụ

Xem ví dụ [`tabpanel`, `tab`, và `tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role#example) trong định nghĩa vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role).

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`tab` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
- [`tabpanel` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role)
