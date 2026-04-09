---
title: "ARIA: vai trò treeitem"
short-title: treeitem
slug: Web/Accessibility/ARIA/Reference/Roles/treeitem_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#treeitem
  - https://www.w3.org/WAI/ARIA/apg/patterns/treeview/examples/treeview-navigation/
sidebar: accessibilitysidebar
---

`treeitem` là một mục trong một `tree`.

## Mô tả

Một [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role) là một danh sách phân cấp với các nút cha và con có thể mở rộng và thu gọn. `treeitem` là một node trong `tree`. Gốc của cây là `tree`, nhưng tất cả các node của cây đều là các phần tử `treeitem`, ngay cả khi bản thân chúng có các node `treeitem` lồng nhau.

Một ví dụ về `tree` là giao diện người dùng chọn hệ thống tệp: dạng cây hiển thị thư mục và tệp. Mỗi thư mục và tệp là một `treeitem`. Các mục thư mục, vốn là các phần tử `treeitem`, có thể được mở rộng để lộ nội dung của thư mục - có thể là tệp, thư mục, hoặc cả hai, và tất cả đều là `treeitem` - và thu gọn để ẩn nội dung của nó.

Trong một hệ thống phân cấp cây, _node gốc_ có vai trò `tree`. Tất cả các node khác, ngoài node gốc, đều có vai trò `treeitem`, cho dù chúng có con hay không. Một `treeitem` là cha là một **node cha**. Một `treeitem` không phải là cha là một _node cuối_.

Các tree item có con có thể được mở rộng hoặc thu gọn, hiển thị và ẩn các con của chúng. Một node cha được mở rộng để các node con của nó hiển thị là một **node mở**. Một node cha được thu gọn để các node con của nó không hiển thị là một **node đóng**.

Mỗi node cha chứa hoặc sở hữu một phần tử mang vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role). Một node cha là một tập hợp có thể mở rộng của các phần tử `treeitem`. Các node con này không phải là hậu duệ trực tiếp của node cha: thay vào đó, chúng nên được bao bọc trong một phần tử mang vai trò `group`.

Mỗi node cha nên bao gồm thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded). Nó được đặt thành `false` khi đóng và `true` khi mở. Các node cuối không nên có thuộc tính `aria-expanded` vì sự hiện diện của thuộc tính này báo cho công nghệ hỗ trợ rằng node là một node cha.

> [!NOTE]
> Tree view ARIA dùng cách điều hướng gần giống ứng dụng gốc hơn là ứng dụng web và chủ yếu được điều hướng bằng các phím mũi tên trên bàn phím thay vì phím <kbd>Tab</kbd>. Kiểu điều hướng này không phổ biến với hầu hết nội dung trình duyệt, mặc dù là bình thường và quen thuộc trong ứng dụng gốc. Vì lý do này, hãy cân nhắc các tùy chọn thay thế để đáp ứng chức năng bạn cần trước khi tạo tree view.

Bất kỳ phần tử nào có vai trò `treeitem` đều phải được lồng trong, hoặc được sở hữu bởi, một phần tử mang vai trò `tree`. Tree item có thể là con của `tree`, `treeitem`, hoặc một phần tử mang vai trò `group` được chứa trong, hoặc được sở hữu bởi, một phần tử mang vai trò `tree` hoặc `treeitem`. Nếu một `treeitem` không được lồng trong một `tree`, hoặc được lồng trong một `group` được sở hữu bởi một `tree`, hãy bao gồm [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của `treeitem` trong giá trị thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) trên phần tử `tree`, `treeitem` hoặc `group` sở hữu.

Cây có thể là "single-select", cho phép người dùng chỉ chọn một `treeitem` cho một hành động, hoặc "multi-select", nơi người dùng có thể chọn nhiều node `treeitem` cho một hành động. Trong cả hai trường hợp, để có thể truy cập bằng bàn phím, focus phải được quản lý cho tất cả các hậu duệ của cây.

Trong cây single-select, chỉ một treeitem có thể có [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) (hoặc [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)) đặt thành `true`. Khi một cây single-select nhận focus, nếu chưa có `treeitem` nào được chọn trước khi cây nhận focus, focus được đặt vào `treeitem` đầu tiên. Nếu một `treeitem` đã được chọn trước khi cây nhận focus, focus được đặt vào `treeitem` duy nhất có `aria-selected="true"`.

Tất cả các node có thể chọn nhưng chưa được chọn có `aria-selected` hoặc `aria-checked` đặt thành `false`. Nếu cây chứa các node không thể chọn, đừng thêm `aria-selected` hay `aria-checked`, vì sự hiện diện của một trong hai thuộc tính này báo cho công nghệ hỗ trợ rằng node có thể chọn.

Không có nhiều hơn một node có thể được chọn tại một thời điểm trừ khi node `tree` có [`aria-multiselectable="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable) được đặt.

Khi một cây multi-select nhận focus, nếu chưa có tree item nào được chọn trước khi cây nhận focus, focus được đặt vào `treeitem` đầu tiên. Nếu có một hoặc nhiều tree item đã được chọn trước khi cây nhận focus, focus được đặt vào `treeitem` đã chọn đầu tiên.

Trong cây multi-select, tất cả tree item đã chọn đều có `aria-selected="true"` (hoặc `aria-checked="true"`) được đặt. Tất cả các node tree item có thể chọn nhưng hiện chưa được chọn nên có `aria-selected="false"` (hoặc `aria-checked="false"`) được đặt.

Có thể dùng `aria-selected` hoặc `aria-checked` để chỉ trạng thái chọn cho các phần tử `treeitem`. Một số giao diện người dùng biểu thị lựa chọn bằng `aria-selected` trong cây single-select và bằng `aria-checked` trong cây multi-select.

Việc dùng cả `aria-selected` và `aria-checked` trong cùng một `tree` bị khuyến cáo mạnh mẽ là không nên. Đừng dùng cả `aria-selected` và `aria-checked` trên treeitem trong cùng một cây trừ khi ý nghĩa và mục đích của `aria-selected` khác với ý nghĩa và mục đích của `aria-checked`, ý nghĩa và mục đích của mỗi trạng thái là rõ ràng, và giao diện người dùng cung cấp một cách riêng để điều khiển từng trạng thái.

Trong cây multi-select, trạng thái đã chọn nên độc lập với focus. Ví dụ, trong một trình điều hướng hệ thống tệp thông thường, người dùng có thể di chuyển focus để chọn bất kỳ số lượng tệp nào cho một hành động như sao chép hoặc di chuyển. Thiết kế trực quan nên làm rõ mục nào được chọn và mục nào đang có focus.

Nếu tập đầy đủ các treeitem khả dụng không có trong DOM do tải động khi người dùng di chuyển focus trong hoặc cuộn cây, mỗi `treeitem` nên có [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level), [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize), và [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset) được chỉ định.

`treeitem` bắt buộc phải có tên truy cập được. Thông thường, tên đó đến từ nội dung của `treeitem`. Tên truy cập được cũng có thể được đặt qua [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role) role
  - : Node gốc cho danh sách phân cấp các node cha và con `treeitem` có thể mở rộng và thu gọn
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role) role
  - : Xác định một tập hợp các node con `treeitem`.
- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Được đặt trên `tree` gốc và trên các node `group` là cha của các node `treeitem`, để cho biết tree view đang được mở rộng (`true`) hay thu gọn (`false`).
- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
  - : Đặt thành `true` hoặc `false`, cho biết một `treeitem` có thể chọn hay không, và hiện nó có đang được chọn hay không.
- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
  - : Đặt thành `true` hoặc `false`, cho biết `treeitem` có thể được kiểm chọn hay không, và hiện nó có đang được kiểm chọn hay không.

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

## Ví dụ

Cách sau đây là một ví dụ về cách đánh dấu một danh sách thư mục các khóa học phát triển web dưới dạng tree view:

```html
<div>
  <h3 id="treeLabel">Developer Learning Path</h3>
  <ul role="tree" aria-labelledby="treeLabel">
    <li role="treeitem" aria-expanded="true">
      <span>Web</span>
      <ul role="group">
        <li role="treeitem" aria-expanded="false">
          <span>Languages</span>
          <ul role="group">
            <li role="treeitem" aria-expanded="false">
              <span>HTML</span>
              <ul role="group">
                <li role="treeitem">Document structure</li>
                <li role="treeitem">Head elements</li>
                <li role="treeitem">Semantic elements</li>
                <li role="treeitem">Attributes</li>
                <li role="treeitem">Web forms</li>
              </ul>
            </li>
            <li role="treeitem">CSS</li>
            <li role="treeitem">JavaScript</li>
          </ul>
        </li>
        <li role="treeitem" aria-expanded="false">
          <span>Accessibility</span>
          <ul role="group">
            <li role="treeitem" aria-label="accessibility object model">AOM</li>
            <li role="treeitem">WCAG</li>
            <li role="treeitem">ARIA</li>
          </ul>
        </li>
        <li role="treeitem" aria-expanded="false">
          <span>Web Performance</span>
          <ul role="group">
            <li role="treeitem">Load time</li>
          </ul>
        </li>
        <li role="treeitem">APIs</li>
      </ul>
    </li>
  </ul>
</div>
```

Phần trên cung cấp ngữ nghĩa cho một tree view, nhưng không cung cấp bất kỳ tính tương tác nào. Điều đó phải được thêm bằng JavaScript.

Nếu các tree item không mặc định có thể focus, JavaScript có thể được dùng [`tabIndex="-1"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) cho tất cả treeitem trừ phần tử sẽ nhận focus khi người dùng tab vào tree, phần tử đó nên được đặt `tabIndex="0"`.

Tất cả chức năng bàn phím trong Tương tác bàn phím và mọi sự kiện con trỏ cần được lập trình, bao gồm quản lý focus, đi lên và đi xuống cây, mở rộng và thu gọn các node cha, và quản lý lựa chọn.

Nếu tree có hơn 7 tree item, việc bao gồm chức năng type ahead được khuyến nghị.

## Thông số kỹ thuật

{{Specifications}}
