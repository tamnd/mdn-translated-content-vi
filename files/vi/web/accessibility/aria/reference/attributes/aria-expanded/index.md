---
title: "ARIA: thuộc tính aria-expanded"
short-title: aria-expanded
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-expanded
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-expanded
sidebar: accessibilitysidebar
---

Thuộc tính `aria-expanded` được đặt trên một phần tử để cho biết một control đang được mở rộng hay thu gọn, và liệu các phần tử được điều khiển có đang hiển thị hay bị ẩn hay không.

## Mô tả

Có nhiều widget có thể được mở rộng và thu gọn, bao gồm menu, dialog và accordion panel. Mỗi đối tượng này đều có một phần tử tương tác kiểm soát việc mở và đóng của nó. Thuộc tính `aria-expanded` được áp dụng cho control tương tác có thể nhận tiêu điểm này, vốn bật tắt khả năng hiển thị của đối tượng.

Ví dụ, `aria-expanded` được áp dụng cho mục cha trong cây DOM để cho biết nhánh con của nó có đang được hiển thị hay không. Mục cha cũng kiểm soát khả năng hiển thị của nhánh con liên quan.

Có hai khai báo có thể được áp dụng cho các đối tượng điều khiển khả năng hiển thị của một đối tượng khác: [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls), hoặc [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) kết hợp với `aria-expanded`. `aria-controls` và `aria-owns` chỉ ra mối quan hệ giữa phần tử điều khiển và phần tử được điều khiển. `aria-expanded` cho công nghệ hỗ trợ biết phần tử được điều khiển đang được mở rộng hay thu gọn.

Hãy dùng thuộc tính `aria-owns` trên các phần tử sở hữu các container nhóm có thể mở rộng. Nếu container nhóm có thể mở rộng và thu gọn không thuộc quyền sở hữu của phần tử có thuộc tính `aria-expanded`, hãy dùng thuộc tính `aria-controls` để tham chiếu container nhóm đó.

### Buttons

Một nút bật tắt widget nên có `aria-controls` được đặt thành [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của widget được bật tắt và `aria-expanded` được đặt thành trạng thái hiện tại của widget.

```html
<button aria-expanded="false" aria-controls="widget1">Bật tắt widget</button>
```

Khi widget hiển thị, đối tượng điều khiển truyền đạt thông tin đó bằng cách có `aria-expanded="true"` được đặt trên nó. Tên khả năng tiếp cận của đối tượng điều khiển nên phản ánh thay đổi này.

```html
<button aria-expanded="true" aria-controls="widget1">Bật tắt widget</button>
```

### Menu

Khi một [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role) được hiển thị, đối tượng nút bật tắt khả năng hiển thị của menu đó sẽ có `aria-expanded="true"` được đặt. Khi menu bị ẩn, có thể bỏ `aria-expanded`. Nếu được chỉ định khi menu bị ẩn, nó nên được đặt thành `aria-expanded="false"`. Khi một menu con không hiển thị, `menuitem` cha của nó có `aria-expanded`. Nó nên được đặt thành `true` khi menu con hiển thị.

### Combobox

Theo mặc định, một số vai trò được ẩn hoặc thu gọn và các vai trò khác được mở hoặc mở rộng theo mặc định. Các phần tử có vai trò [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role) có giá trị mặc định cho `aria-expanded` là `false`. Khi popup của combobox không hiển thị, phần tử có vai trò `combobox` có `aria-expanded` được đặt thành `false`. Đây là trạng thái mặc định. Khi popup hiển thị, `aria-expanded` nên được đặt thành `true`.

```html
<label for="username">Tên người dùng</label>
<input id="username" name="username" aria-describedby="username-desc" />
<button
  aria-expanded="false"
  aria-controls="username-desc"
  aria-label="Trợ giúp về tên người dùng"
  type="button">
  <span aria-hidden="true">?</span>
</button>
<p id="username-desc" hidden>
  Tên người dùng của bạn là tên bạn dùng để đăng nhập vào dịch vụ này.
</p>
```

> [!NOTE]
> Sự hiện diện của thuộc tính `aria-expanded` cho biết có control. Tránh đưa nó lên các phần tử không điều khiển trạng thái mở rộng của phần tử khác.

### Treeitems

Mỗi phần tử có vai trò [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role) đóng vai trò là nút cha sẽ có `aria-expanded="false"` khi nút ở trạng thái đóng và `aria-expanded="true"` khi nút ở trạng thái mở. Các nút cuối, tức các nút không có nút con, không nên có thuộc tính `aria-expanded` vì nếu có, chúng sẽ bị mô tả sai cho công nghệ hỗ trợ như là các nút cha.

### Rows

Một hàng cha trong [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role) là một hàng có thể được mở rộng hoặc thu gọn để hiển thị hay ẩn một tập các hàng con trong bảng hoặc grid. Mỗi hàng cha có trạng thái `aria-expanded` được đặt trên phần tử hàng hoặc trên một ô nằm trong hàng. Khi hàng con bị ẩn, `aria-expanded="false"` được đặt. `aria-expanded="true"` được đặt khi hàng con được hiển thị. Các hàng không điều khiển việc hiển thị hàng con thì không nên bao gồm thuộc tính `aria-expanded` vì việc bao gồm thuộc tính này sẽ định nghĩa các hàng đó là hàng cha.

## Giá trị

- `false`
  - : Phần tử nhóm mà phần tử này sở hữu hoặc điều khiển đang bị thu gọn.

- `true`
  - : Phần tử nhóm mà phần tử này sở hữu hoặc điều khiển đang được mở rộng.

- `undefined` (mặc định)
  - : Phần tử không sở hữu hoặc điều khiển một phần tử nhóm có thể mở rộng.

## Giao diện liên quan

- {{domxref("Element.ariaExpanded")}}
  - : Thuộc tính [`ariaExpanded`](/en-US/docs/Web/API/Element/ariaExpanded), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-expanded`.
- {{domxref("ElementInternals.ariaExpanded")}}
  - : Thuộc tính [`ariaExpanded`](/en-US/docs/Web/API/Element/ariaExpanded), là một phần của giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-expanded`.

## Vai trò liên quan

Được dùng trong vai trò:

- [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role)
- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- [`input`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/input_role)
- [`link`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role)
- [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
- [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
