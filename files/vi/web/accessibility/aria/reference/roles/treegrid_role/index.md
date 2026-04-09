---
title: "ARIA: vai trò treegrid"
short-title: treegrid
slug: Web/Accessibility/ARIA/Reference/Roles/treegrid_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#treegrid
  - https://www.w3.org/WAI/ARIA/apg/patterns/treegrid/examples/treegrid-1/
sidebar: accessibilitysidebar
---

Vai trò `treegrid` xác định một phần tử là một grid mà các hàng của nó có thể được mở rộng và thu gọn theo cách giống như một `tree`.

## Mô tả

`treegrid` là một lưới dữ liệu phân cấp, hay bảng, gồm thông tin dạng bảng có thể chỉnh sửa hoặc tương tác. `treegrid` là sự kết hợp của các vai trò [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role) và [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role). Giống `grid`, `treegrid` được cấu thành từ các hàng, cột và gridcell. Giống `tree`, các node cha trong `treegrid` có thể mở rộng và thu gọn.
Widget `treegrid` chứa một hoặc nhiều phần tử [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role), tùy chọn với các phần tử [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role) nhóm các hàng. Mỗi hàng, đến lượt nó, chứa một hoặc nhiều ô. Mỗi ô hoặc là hậu duệ DOM của phần tử row hoặc được phần tử row sở hữu, và là một phần tử [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role), [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role), hoặc [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), trong đó vai trò `gridcell` được dùng cho mọi ô không chứa thông tin tiêu đề cột hoặc hàng.

Một `row` có thể được mở rộng hoặc thu gọn để hiển thị hoặc ẩn một tập các hàng con là một **parent row**. Mỗi parent row có trạng thái [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) được đặt trên phần tử row hoặc trên một ô nằm trong row đó.

Trạng thái `aria-expanded` được đặt thành `true` khi các hàng con được hiển thị và đặt thành `false` khi các hàng con bị ẩn. Các phần tử không điều khiển việc hiển thị các hàng con không nên có thuộc tính `aria-expanded` vì sự hiện diện của thuộc tính này báo cho công nghệ hỗ trợ rằng phần tử mang thuộc tính là một phần tử cha.

Khi giao diện grid của bạn yêu cầu các hàng hỗ trợ `aria-expanded` hoặc nếu grid của bạn cần hỗ trợ [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset), [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), hoặc [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level), hãy dùng `treegrid` chứ không phải `grid`.

Mỗi `row` hoặc `gridcell` trong một hàng nên có thể focus bằng bàn phím, và focus bàn phím cho tất cả hậu duệ tree grid này phải được quản lý. Ngoại lệ là các ô tiêu đề cột không bắt buộc phải có thể focus nếu chúng không cung cấp chức năng như sắp xếp hay lọc. Mỗi hàng và ô nên hoặc chứa một phần tử có thể focus hoặc tự nó có thể focus, bất kể nội dung ô riêng lẻ có thể chỉnh sửa hoặc tương tác hay không.

### Treegrid một và nhiều mục chọn

Nếu `treegrid` cho phép người dùng chọn chỉ một mục cho một hành động, thì đó là treegrid **single-select**. Trong treegrid single-select, mục đang có focus cũng có trạng thái được chọn được đặt bằng [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected).

Nếu treegrid hỗ trợ chọn nhiều hơn một hàng hoặc ô, thì đó là treegrid **multi-select**. Trong treegrid multi-select, trạng thái chọn độc lập với focus. Thiết kế trực quan và công nghệ hỗ trợ phải phân biệt giữa các mục được chọn và mục đang có focus.

Đối với treegrid multi-select, bao gồm [`aria-multiselectable="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable) trên phần tử mang vai trò `treegrid`. Tất cả hàng hoặc ô được chọn có [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) đặt thành true. Tất cả hàng và ô có thể chọn nhưng hiện chưa được chọn có `aria-selected` đặt thành `false`. Đừng thêm thuộc tính `aria-selected` trên các hàng và ô không thể chọn riêng lẻ vì sự hiện diện của thuộc tính này báo cho công nghệ hỗ trợ rằng hàng hoặc ô đó có thể chọn.

### Hàng mồ côi

Trong trường hợp một `row` hoặc `rowgroup` con không được lồng trong `treegrid` trong DOM, thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns), tham chiếu tới tất cả ID của các phần tử con không phải hậu duệ, phải được đặt trên phần tử `treegrid`. Nếu hàng hoặc ô được bao gồm trong treegrid thông qua `aria-owns`, chúng sẽ được trình bày cho công nghệ hỗ trợ sau các hậu duệ DOM của phần tử `treegrid` trừ khi các hậu duệ DOM thực tế của grid cũng được bao gồm trong thuộc tính `aria-owns`.

### Treegrid có nội dung tải động

Nếu một số hàng hoặc cột không có trong DOM và được tải động khi cuộn, [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount), [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount), [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex) và [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex) sẽ phát huy tác dụng. Các thuộc tính `aria-colcount` và `aria-rowcount` được đặt trên `treegrid`. Giá trị là tổng số cột và hàng của grid đã tải đầy đủ, tương ứng. Chỉ số cho mỗi hàng và cột được đặt trên các ô riêng lẻ, không phải trên phần tử `treegrid`.

### Tên, mô tả và focus của treegrid

Phần tử mang vai trò `treegrid` phải có một tên truy cập được. Nếu có một nhãn phù hợp hiển thị trong nội dung, hãy cung cấp tên qua [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Nói cách khác, nếu có một phần tử trong giao diện người dùng đóng vai trò nhãn cho treegrid, hãy thêm `aria-labelledby` làm thuộc tính trên phần tử mang vai trò `treegrid`, và đặt giá trị của thuộc tính bằng `id` của phần tử hoặc các phần tử gắn nhãn. Nếu không có nhãn hiển thị, hãy dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label). Không dùng cả hai.

Nếu nội dung bao gồm một chú thích hoặc mô tả cho `treegrid`, hãy bao gồm [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) trên phần tử `treegrid` với giá trị thuộc tính là `id` của phần tử chứa mô tả.

Nếu bản thân vùng chứa `treegrid` nhận focus, giá trị của thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) của nó nên tham chiếu tới [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của `row`, `columnheader`, `rowheader` hoặc `gridcell` đã chọn, trừ khi roving tabindex được dùng để quản lý focus giữa các vai trò đó, trong trường hợp đó không nên dùng `aria-activedescendant`.

Nếu `treegrid` bị vô hiệu hóa, hãy làm trạng thái đó hiển thị rõ ràng, thực thi theo chương trình, và bao gồm thuộc tính [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled) trên chính `treegrid` để thông báo cho công nghệ hỗ trợ về trạng thái bị vô hiệu hóa của nó.

### Sắp xếp trong treegrid

Nếu treegrid cung cấp chức năng sắp xếp, thuộc tính [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort) được bao gồm trên các phần tử ô tiêu đề liên quan, không phải trên chính grid.

### Menu của treegrid

Nếu `treegrid` có một [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role) đính kèm mở ra khi nhấp chuột phải, hãy bao gồm [`aria-haspopup="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) trên phần tử `treegrid`. Điều này thông báo cho công nghệ hỗ trợ rằng `treegrid` có một popup liên kết. Khả năng mở menu và đặt focus vào đó cho cả người dùng bàn phím lẫn người dùng thiết bị trỏ phải được thêm bằng JavaScript.

### Treegrid chỉ đọc

Theo mặc định, treegrid được coi là có thể chỉnh sửa. Nếu tree grid không thể chỉnh sửa, hãy dùng thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly) để thông báo cho công nghệ hỗ trợ rằng `treegrid` là chỉ đọc. Giá trị thuộc tính này, khi được đặt trên phần tử mang vai trò `treegrid`, sẽ truyền xuống tất cả các phần tử `columnheader`, `rowheader`, và `gridcell`. Giá trị toàn cục đó có thể được ghi đè cho từng phần tử `gridcell` riêng lẻ bằng cách bao gồm `aria-readonly` trên các phần tử con tree grid riêng lẻ.

Giống như mọi thuộc tính ARIA, việc thêm `aria-readonly` chỉ thông báo cho công nghệ hỗ trợ rằng nội dung có thể hoặc không thể chỉnh sửa, nhưng không làm gì để bật hoặc tắt tính tương tác. Việc đó phải được thực hiện bằng thuộc tính toàn cục [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) của HTML hoặc bằng JavaScript.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) role
  - : Một hàng các ô trong một cấu trúc dạng bảng, tùy chọn bên trong một `rowgroup`. Chứa một hoặc nhiều hàng các ô lưới, tiêu đề cột, hoặc tiêu đề hàng.
- [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role) role
  - : Một nhóm [hàng](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) trong một cấu trúc dạng bảng.
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role) role
  - : Được thiết kế để mô phỏng chức năng của phần tử HTML {{HTMLElement('td')}}, xuất hiện trong các vai trò `grid` và `treegrid` và phải là con trực tiếp của một `row`.
- [columnheader](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role) role
  - : Một ô trong hàng chứa thông tin tiêu đề cho một cột, tương tự phần tử HTML {{HTMLElement('th')}} gốc với phạm vi cột
- [rowheader](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role) role
  - : Một ô chứa thông tin tiêu đề cho một `row` trong một cấu trúc dạng bảng.
- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Với các mục có thể mở rộng, giá trị là `true` hoặc `false`. Nó cũng cho biết mục đó có thể mở rộng, vì vậy không nên hiện diện nếu mục đó không thể mở rộng.
- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
  - : Xác định mối quan hệ theo ngữ cảnh giữa phần tử cha và các phần tử con của nó khi không thể dùng hệ thống phân cấp DOM để biểu diễn mối quan hệ
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Dùng thuộc tính này để gắn nhãn cho `treegrid`. Thuộc tính `aria-labelledby` thường là id của phần tử dùng để đặt tiêu đề cho treegrid.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Một giá trị chuỗi dễ đọc bằng người dùng xác định `treegrid`. Nếu có nhãn hiển thị, thì nên dùng `aria-labelledby` thay vào đó.

### Tương tác bàn phím

Có thể di chuyển focus giữa các hàng và ô của grid bằng bàn phím là điều bắt buộc để tạo một treegrid có thể truy cập. Việc di chuyển focus vào grid có thể khiến ô đầu tiên hoặc hàng đầu tiên được focus. Việc focus đi tới ô liền kề tiếp theo hay hàng phụ thuộc vào yêu cầu nội dung của nó, với một số treegrid không đưa focus vào hàng.

Các tương tác bàn phím sau đây cần được hỗ trợ khi một phần tử trong grid đã nhận focus, ví dụ sau khi người dùng đã di chuyển focus vào grid bằng Tab.

- <kbd>Enter</kbd>
  - : Nếu chỉ focus ô được bật và focus đang ở ô đầu tiên có thuộc tính `aria-expanded`, mở hoặc đóng các hàng con. Nếu không, thực hiện hành động mặc định cho ô.
- <kbd>Tab</kbd>
  - : Nếu hàng đang có focus chứa các phần tử có thể focus như {{HTMLElement('input')}}, {{HTMLElement('button')}} hoặc {{HTMLElement('a')}}, chuyển focus đến input kế tiếp trong hàng. Nếu focus ở phần tử có thể focus cuối cùng trong hàng, chuyển focus ra khỏi widget treegrid đến phần tử có thể focus tiếp theo.
- <kbd>Right Arrow</kbd>
  - : Nếu focus ở một hàng đang thu gọn, mở rộng hàng đó. Nếu focus ở một hàng đang mở rộng hoặc ở một hàng không có hàng con, chuyển focus đến ô đầu tiên trong hàng. Nếu focus ở ô ngoài cùng bên phải trong một hàng, focus không di chuyển. Nếu focus ở bất kỳ ô nào khác, chuyển focus một ô sang phải.
- <kbd>Left Arrow</kbd>
  - : Nếu focus ở một hàng đang mở rộng, thu gọn hàng đó. Nếu focus ở một hàng đang thu gọn hoặc ở một hàng không có hàng con, focus không di chuyển. Nếu focus ở ô đầu tiên trong một hàng và row focus được hỗ trợ, chuyển focus đến hàng. Nếu focus ở ô đầu tiên trong một hàng và row focus không được hỗ trợ, focus không di chuyển. Nếu focus ở bất kỳ ô nào khác, chuyển focus một ô sang trái.
- <kbd>Down Arrow</kbd>
  - : Nếu focus ở một hàng, chuyển focus xuống một hàng. Nếu focus ở hàng cuối cùng, focus không di chuyển. Nếu focus ở một ô, chuyển focus xuống một ô. Nếu focus ở ô cuối của cột, focus không di chuyển.
- <kbd>Up Arrow</kbd>
  - : Nếu focus ở một hàng, chuyển focus lên một hàng. Nếu focus ở hàng đầu tiên, focus không di chuyển. Nếu focus ở một ô, chuyển focus lên một ô. Nếu focus ở ô đầu của cột, focus không di chuyển.
- <kbd>Page Down</kbd>
  - : Nếu focus ở một hàng hoặc ô, chuyển focus xuống một số hàng hoặc ô được xác định trước. Thông thường, nó đi xuống tương đương với chiều cao của treegrid, cuộn sao cho hàng cuối trong tập hàng đang hiển thị hiện tại trở thành một trong những hàng đầu tiên được hiển thị. Nếu focus đang ở hàng cuối cùng, focus không di chuyển.
- <kbd>Page Up</kbd>
  - : Nếu focus ở một hàng hoặc ô, chuyển focus lên một số hàng được xác định trước. Thông thường, nó đi lên tương đương với chiều cao của treegrid, cuộn sao cho hàng đầu tiên trong tập hàng đang hiển thị hiện tại trở thành một trong những hàng cuối cùng được hiển thị. Nếu focus đang ở hàng đầu tiên, focus không di chuyển.
- <kbd>Home</kbd> <kbd>Control + Home</kbd>
  - : Nếu focus ở một hàng, chuyển focus đến hàng đầu tiên. Nếu focus đang ở hàng đầu tiên, focus không di chuyển. Nếu focus ở một ô, chuyển focus đến ô đầu tiên trong hàng. Nếu focus đang ở ô đầu tiên của hàng, focus không di chuyển.
- <kbd>End</kbd> <kbd>Control + End</kbd></td><td>
  - : Nếu focus ở một hàng, chuyển focus đến hàng cuối cùng. Nếu focus đang ở hàng cuối cùng, focus không di chuyển. Nếu focus ở một ô, chuyển focus đến ô cuối cùng trong hàng. Nếu focus đang ở ô cuối cùng của hàng, focus không di chuyển. Nếu không phải tất cả các hàng đều có trong DOM, điều này có thể được dùng để focus vào hàng cuối cùng hiện diện trong DOM, hoặc hàng cuối cùng khả dụng nếu toàn bộ cơ sở dữ liệu có trong DOM.

Nếu treegrid hỗ trợ chọn ô, hàng hoặc cột, các phím sau thường được dùng cho các chức năng này.

- <kbd>Control + Space</kbd>
  - : Nếu focus ở một hàng, chọn tất cả các ô. Nếu focus ở một ô, chọn cột chứa focus.
- <kbd>Shift + Space</kbd>
  - : Nếu focus ở một hàng, chọn hàng đó. Nếu focus ở một ô, chọn hàng chứa focus. Nếu treegrid bao gồm một cột có hộp kiểm để chọn hàng, phím này cũng có thể được dùng như một phím tắt để đánh dấu hộp kiểm khi focus không ở hộp kiểm.
- <kbd>Control + A</kbd>
  - : Chọn tất cả các ô.
- <kbd>Shift + Right Arrow</kbd>
  - : nếu focus ở một ô, mở rộng vùng chọn sang một ô bên phải.
- <kbd>Shift + Left Arrow</kbd>
  - : nếu focus ở một ô, mở rộng vùng chọn sang một ô bên trái.
- <kbd>Shift + Down Arrow</kbd>
  - : Nếu focus ở một hàng, mở rộng vùng chọn sang tất cả các ô trong hàng kế tiếp. Nếu focus ở một ô, mở rộng vùng chọn xuống một ô.
- <kbd>Shift + Up Arrow</kbd>
  - : Nếu focus ở một hàng, mở rộng vùng chọn sang tất cả các ô trong hàng trước đó. Nếu focus ở một ô, mở rộng vùng chọn lên một ô.

Nếu các chức năng điều hướng có thể thêm động nhiều hàng hoặc cột vào DOM, các sự kiện phím di chuyển focus đến đầu hoặc cuối grid, như <kbd>control + End</kbd>, có thể di chuyển focus đến hàng cuối cùng trong DOM thay vì hàng cuối cùng khả dụng trong dữ liệu phía sau.

Trong khi các phím điều hướng, như phím mũi tên, đang di chuyển focus từ ô này sang ô khác, chúng không sẵn sàng để làm những việc như điều khiển combobox hoặc di chuyển con trỏ chỉnh sửa bên trong một ô. Nếu cần chức năng này, xem [Editing and Navigating Inside a Cell](https://www.w3.org/WAI/ARIA/apg/patterns/grid/#gridNav_inside).

<!--
### Required JavaScript features

## Examples
-->

## Lưu ý về khả năng truy cập

Điều quan trọng là tất cả các ô đều phải có thể nhận hoặc chứa focus bàn phím vì trình đọc màn hình thường ở chế độ đọc ứng dụng, thay vì chế độ đọc tài liệu, khi người dùng đang tương tác với grid. Trong chế độ ứng dụng, người dùng trình đọc màn hình chỉ nghe thấy các phần tử có thể focus và nội dung gắn nhãn cho các phần tử có thể focus. Nếu nội dung không thể nhận focus, người dùng trình đọc màn hình có thể vô tình bỏ sót các phần tử chứa trong treegrid.

<!--
## Best Practices

### Prefer HTML
-->

## Thông số kỹ thuật

{{Specifications}}
