---
title: "ARIA: vai trò tree"
short-title: tree
slug: Web/Accessibility/ARIA/Reference/Roles/tree_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#tree
  - https://www.w3.org/WAI/ARIA/apg/patterns/treeview/examples/treeview-navigation/
sidebar: accessibilitysidebar
---

`tree` là một widget cho phép người dùng chọn một hoặc nhiều mục từ một tập hợp được tổ chức theo thứ bậc.

## Mô tả

Widget `tree` là một danh sách phân cấp với các nút cha và con có thể mở rộng và thu gọn. Bất kỳ mục nào trong thứ bậc cũng có thể có các tree item con, được đặt bằng [`role="treeitem"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role). Các tree item có con có thể được mở rộng hoặc thu gọn, hiển thị và ẩn các con của chúng.

Một ví dụ về `tree` là giao diện người dùng chọn hệ thống tệp: dạng cây hiển thị thư mục và tệp. Các mục thư mục có thể mở rộng để lộ nội dung của thư mục - có thể là tệp, thư mục, hoặc cả hai - và thu gọn để ẩn nội dung đó.

Các tree view ARIA chủ yếu được điều hướng bằng các phím mũi tên trên bàn phím thay vì phím <kbd>Tab</kbd>. Kiểu điều hướng này không phổ biến với hầu hết nội dung web, mặc dù là bình thường và quen thuộc trong ứng dụng gốc. Vì lý do này, trước khi tạo tree view, hãy cân nhắc các tùy chọn thay thế để đáp ứng chức năng bạn cần.

> [!WARNING]
> Tree view dùng cách điều hướng gần giống ứng dụng gốc hơn là ứng dụng web. Vì lý do này, hãy cân nhắc các tùy chọn thay thế để đáp ứng nhu cầu của bạn trước khi tạo tree view.

### Cây chọn một và nhiều mục

Cây có thể là "single-select", cho phép người dùng chỉ chọn một mục cho một hành động, hoặc "multi-select", nơi người dùng có thể chọn nhiều hơn một mục cho một hành động. Trong cây multi-select, `tree` có [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable) đặt thành true. Nếu không, `aria-multiselectable` hoặc được đặt thành `false` hoặc giá trị mặc định `false` được ngầm hiểu. Trong cả hai trường hợp, để có thể truy cập bằng bàn phím, focus phải được quản lý cho tất cả phần tử con của tree.

Trong một số triển khai cây single-select, mục đang được focus cũng có trạng thái được chọn; điều này được gọi là "selection follows focus". Khi một cây single-select nhận focus, nếu chưa có tree item nào được chọn trước khi cây nhận focus, focus được đặt vào nút đầu tiên. Nếu một tree item đã được chọn trước khi cây nhận focus, focus được đặt vào tree item đã chọn. Trong cây single-select, [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) được đặt thành `true` cho các tree item đã chọn và không xuất hiện trên bất kỳ tree item nào khác trong cây.

Trong cây multi-select, tất cả tree item đã chọn đều có `aria-selected="true"` và tất cả các node tree item có thể chọn nhưng hiện chưa được chọn đều có `aria-selected="false"`. Không thêm thuộc tính `aria-selected` vào các tree item không thể chọn.

Khi một cây multi-select nhận focus, nếu chưa có tree item nào được chọn trước khi cây nhận focus, focus được đặt vào tree item đầu tiên. Nếu có một hoặc nhiều tree item đã được chọn trước khi cây nhận focus, focus được đặt vào node đã chọn đầu tiên.

Trong cây multi-select, trạng thái đã chọn luôn độc lập với focus. Ví dụ, trong một trình điều hướng hệ thống tệp thông thường, người dùng có thể di chuyển focus để chọn bất kỳ số lượng tệp nào cho một hành động như sao chép hoặc di chuyển. Thiết kế trực quan nên làm rõ mục nào được chọn và mục nào đang có focus.

### Cấu trúc thứ bậc của tree

Trong tree view, node `tree` là node gốc; nó có thể có các node `treeitem` con, cháu, và hậu duệ sâu hơn.

Mỗi phần tử đóng vai trò là một node tree có vai trò `treeitem`, ngoại trừ node tree gốc có vai trò `tree`. Một `tree` không có node `tree` cha - nó là node gốc. Nếu một node vừa được lồng trong tree vừa có các tree item hậu duệ, thì nó có vai trò `treeitem` và thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded); `aria-expanded="false"` được đặt khi node ở trạng thái đóng, `aria-expanded="true"` được đặt khi node ở trạng thái mở.

Các node `treeitem` có thể là con trực tiếp của node `tree` gốc, được lồng trong node `treeitem`, hoặc tùy chọn lồng trong một phần tử [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role), khi được lồng trong một `tree` thì đó là một tập hợp treeitem có thể mở rộng.

Không thêm `aria-expanded` vào các node cuối - những node không có con tree item - vì như vậy sẽ mô tả sai node đó như một node cha đối với công nghệ hỗ trợ.

### Vị trí và sự hiện diện trong DOM

Tất cả treeitem đều được chứa trong hoặc được sở hữu bởi một phần tử mang vai trò `tree`. Nếu có tree item nào không phải là hậu duệ trực tiếp của `tree` trong đánh dấu, hãy bao gồm [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) trên vùng chứa tree sở hữu để bao gồm các phần tử không phải con DOM của vùng chứa. Các phần tử được sở hữu không phải con này sẽ xuất hiện trong thứ tự đọc theo trình tự mà chúng được tham chiếu và sau mọi tree item là con DOM. Các script quản lý focus cần đảm bảo thứ tự focus trực quan khớp với thứ tự đọc của công nghệ hỗ trợ này.

Nếu tập đầy đủ các node có sẵn không có trong DOM do tải động khi người dùng di chuyển focus trong hoặc cuộn cây, mỗi node có [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level), [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), và [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset) được chỉ định.

### Tên truy cập được

`tree` phải được cung cấp một tên truy cập được. Hoặc tham chiếu tới một nhãn hiển thị bằng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby), hoặc chỉ định một nhãn bằng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

### Hướng menu

Các phần tử mang vai trò `tree` có giá trị [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) ngầm định là vertical. Nếu phần tử tree được định hướng ngang, hãy bao gồm `aria-orientation="horizontal"`.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`role="treeitem"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)
  - : Một mục trong tree.
- [`role="group"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Một tập hợp có thể mở rộng của các tree item.
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Xác định phần tử (hoặc các phần tử) gắn nhãn cho `tree`, cung cấp tên truy cập được bắt buộc khi có nhãn hiển thị. Nếu không, dùng `aria-label`.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Xác định một giá trị chuỗi gắn nhãn cho `tree` khi không có nhãn hiển thị.
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
  - : cho biết hướng của tree là ngang hay dọc; mặc định là `vertical` nếu bỏ qua.
- [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable)
  - : Khi đặt thành true, cho biết người dùng có thể chọn hơn một tree item từ các hậu duệ có thể chọn hiện tại của tree.

### Tương tác bàn phím

Đối với một `tree` có định hướng dọc, là hướng mặc định:

<table>
<tr>
<td><kbd>Right arrow</kbd></td>
<td>
<ul>
<li>Khi focus ở một node đang đóng, mở node đó; focus không di chuyển.
<li>Khi focus ở một node đang mở, chuyển focus đến node con đầu tiên.
<li>Khi focus ở một node cuối (một tree item không có con), không làm gì cả.
</td>
</tr>
<tr>
<td><kbd>Left arrow</kbd></td>
<td>
<ul>
<li>Khi focus ở một node đang mở, đóng node đó.
<li>Khi focus ở một node con mà đồng thời là node cuối hoặc node đang đóng, chuyển focus đến node cha của nó.
<li>Khi focus ở một cây đang đóng, không làm gì cả.
</td>
</tr>
<tr>
<td><kbd>Down Arrow</kbd></td>
<td> Chuyển focus đến node tiếp theo có thể focus mà không mở hoặc đóng node.
</td>
</tr>
<tr>
<td><kbd>Up Arrow</kbd></td>
<td> Chuyển focus đến node trước đó có thể focus mà không mở hoặc đóng node.
</td>
</tr>
<tr>
<td><kbd>Home</kbd></td>
<td> Chuyển focus đến node đầu tiên trong cây mà không mở hoặc đóng node.
</td>
</tr>
<tr>
<td><kbd>End</kbd></td>
<td> Chuyển focus đến node cuối cùng trong cây có thể focus mà không mở node.
</td>
</tr>
<tr>
<td><kbd>Enter</kbd></td>
<td>Thực hiện hành động mặc định của node đang được focus. Với node cha, nó mở hoặc đóng node. Trong cây single-select, nếu node không có con, chọn node hiện tại nếu chưa được chọn (đây là hành động mặc định).
</td>
</tr>
<tr>
<td>Type a character*</td>
<td>
<ul>
<li>Focus chuyển đến node tiếp theo có tên bắt đầu bằng ký tự đã gõ.
<li>Nếu nhiều ký tự được gõ liên tiếp nhanh, focus chuyển đến node tiếp theo có tên bắt đầu bằng chuỗi ký tự đã gõ.
</td>
</tr>
<tr>
<td>
<kbd>*</kbd> (Tùy chọn)</td>
<td> Mở rộng tất cả các node anh em ở cùng cấp với node hiện tại.
</td>
</tr>
</table>

\* Type-ahead được khuyến nghị cho mọi cây, đặc biệt là các cây có hơn 7 node gốc

### Tương tác bàn phím cho multi-select

Có hai mô hình tương tác cho cây multi-select: Mặc dù bạn có thể yêu cầu người dùng nhấn một phím bổ trợ, như <kbd>Shift</kbd> hoặc <kbd>Control</kbd> khi điều hướng danh sách để tránh mất trạng thái chọn, nhưng mô hình không yêu cầu người dùng giữ phím bổ trợ được khuyến nghị.

#### Mô hình multi user select được khuyến nghị

<table>
<tr>
<td><kbd>Space</kbd></td>
<td> Bật/tắt trạng thái chọn của node đang được focus.
</td>
</tr>
<tr>
<td><kbd>Shift + Down Arrow</kbd> (Tùy chọn)</td>
<td> Chuyển focus đến và bật/tắt trạng thái chọn của node kế tiếp.
</td>
</tr>
<tr>
<td><kbd>Shift + Up Arrow</kbd> (Tùy chọn)</td>
<td> Chuyển focus đến và bật/tắt trạng thái chọn của node trước đó.
</td>
</tr>
<tr>
<td><kbd>Shift + Space</kbd> (Tùy chọn)</td>
<td> Chọn các node liên tiếp từ node được chọn gần đây nhất đến node hiện tại.
</td>
</tr>
<tr>
<td><kbd>Control + Shift + Home</kbd> (Tùy chọn)</td>
<td> Chọn node đang có focus và tất cả node tới đầu tiên. Tùy chọn, chuyển focus đến node đầu tiên.
</td>
</tr>
<tr>
<td><kbd>Control + Shift + End</kbd> (Tùy chọn)</td>
<td> Chọn node đang có focus và tất cả node đến cuối cùng. Tùy chọn, chuyển focus đến node cuối cùng.
</td>
</tr>
<tr>
<td><kbd>Control + A</kbd> (Tùy chọn)</td>
<td> Chọn tất cả node trong cây. Tùy chọn, nếu tất cả node đã được chọn, nó cũng có thể bỏ chọn tất cả node.</td>
</tr>
</table>

#### Mô hình chọn nhiều thay thế

Mô hình chọn nhiều thay thế là mô hình phím bổ trợ trong đó việc di chuyển focus mà không giữ phím bổ trợ như <kbd>Shift</kbd> hoặc <kbd>Control</kbd> sẽ bỏ chọn tất cả node đã chọn ngoại trừ node đang có focus:

<table>
<tr>
<td><kbd>Shift + Down Arrow</kbd></td>
<td> Chuyển focus đến và bật/tắt trạng thái chọn của node kế tiếp.
</td>
</tr>
<tr>
<td><kbd>Shift + Up Arrow</kbd></td>
<td> Chuyển focus đến và bật/tắt trạng thái chọn của node trước đó.
</td>
</tr>
<tr>
<td><kbd>Control + Down Arrow</kbd></td>
<td> Không thay đổi trạng thái chọn, chuyển focus đến node kế tiếp.
</td>
</tr>
<tr>
<td><kbd>Control + Up Arrow</kbd></td>
<td> Không thay đổi trạng thái chọn, chuyển focus đến node trước đó.
</td>
</tr>
<tr>
<td><kbd>Control + Space</kbd></td>
<td> Bật/tắt trạng thái chọn của node đang có focus.
</td>
</tr>
<tr>
<td><kbd>Shift + Space</kbd> (Tùy chọn)</td>
<td> Chọn các node liên tiếp từ node được chọn gần đây nhất đến node hiện tại.
</td>
</tr>
<tr>
<td><kbd>Control + Shift + Home</kbd> (Tùy chọn)</td>
<td> Chọn node đang có focus và tất cả node tới đầu tiên. Tùy chọn, chuyển focus đến node đầu tiên.
</td>
</tr>
<tr>
<td><kbd>Control + Shift + End</kbd> (Tùy chọn)</td>
<td> Chọn node đang có focus và tất cả node đến cuối cùng. Tùy chọn, chuyển focus đến node cuối cùng.
</td>
</tr>
<tr>
<td><kbd>Control + A</kbd> (Tùy chọn)</td>
<td> Chọn tất cả node trong cây. Tùy chọn, nếu tất cả node đã được chọn, nó cũng có thể bỏ chọn tất cả node.
</td>
</tr>
</table>

## Thông số kỹ thuật

{{Specifications}}
