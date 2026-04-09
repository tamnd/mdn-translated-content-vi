---
title: "ARIA: thuộc tính aria-selected"
short-title: aria-selected
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-selected
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-selected
sidebar: accessibilitysidebar
---

Thuộc tính `aria-selected` cho biết trạng thái "được chọn" hiện tại của nhiều widget khác nhau.

## Mô tả

Thuộc tính `aria-selected` cho biết trạng thái "được chọn" hiện tại cho các vai trò [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role), [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) và [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role).

Thuộc tính này được dùng để cho biết những phần tử nào trong các composite widget có chế độ chọn một và chọn nhiều hiện đang được chọn. Nếu có thể chọn nhiều hơn một phần tử cùng lúc, hãy thêm `aria-multiselectable="true"` vào grid, listbox, tablist hoặc vai trò sở hữu khác, đồng thời chỉ thêm `aria-selected` vào các cell, option và tab có thể chọn.

Đối với các vai trò khác, trạng thái đang được chọn được đặt bằng [`aria-current`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-current), hoặc có thể là [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) hay [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed), tùy vai trò.

Các widget hỗ trợ cả `aria-selected` và `aria-current` cùng lúc có ý nghĩa khác nhau cho từng thuộc tính. Ví dụ, `aria-current="page"` có thể được dùng trong một cây điều hướng để cho biết trang nào đang được hiển thị, trong khi `aria-selected="true"` cho biết trang nào sẽ được hiển thị nếu người dùng kích hoạt `treeitem`.

### Grid

Đặt `aria-selected="false"` trên một gridcell có thể focus sẽ cho biết ô đó có thể chọn. Nếu grid cho phép chọn nhiều hơn một gridcell cùng lúc, hãy đặt `aria-multiselectable="true"` trên phần tử có vai trò [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role). Việc đặt `aria-selected` trên một gridcell tiêu đề cột hoặc hàng không làm trạng thái đó lan sang các ô khác trong cột hoặc hàng.

### Option

Cả `aria-selected` và `aria-checked` đều hợp lệ cho [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role). Một số giao diện người dùng biểu thị lựa chọn bằng `aria-selected` trong list box chọn một và bằng `aria-checked` trong list box chọn nhiều.

Không chỉ định cả `aria-selected` và `aria-checked` trên các phần tử `option` nằm trong cùng một `listbox` trừ khi ý nghĩa và mục đích của `aria-selected` khác với ý nghĩa và mục đích của `aria-checked` trong giao diện người dùng, ý nghĩa và mục đích của từng trạng thái đều rõ ràng, và giao diện cung cấp các cách riêng để điều khiển từng trạng thái.

### Row

Thuộc tính `aria-selected` được hỗ trợ trên `row` nhưng không phải trên `column`. Nếu grid hỗ trợ chọn, khi một cell hoặc row được chọn, phần tử đã chọn sẽ có `aria-selected="true"`.

Nếu grid hỗ trợ chọn cột và một cột được chọn, tất cả các ô trong cột đó sẽ có `aria-selected` được đặt thành `true`.

### Tab

Trong một tablist, `aria-selected` được dùng trên tab để cho biết [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role) nào đang được hiển thị.

Tab được chọn trong một [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role) nên có thuộc tính `aria-selected="true"`. Tất cả các tab không hoạt động trong tablist nên có `aria-selected="false"`. Việc đặt trạng thái này chỉ ảnh hưởng đến cây trợ năng: hãy bảo đảm tab đang hoạt động được tạo kiểu sao cho biểu thị trực quan rằng nó đang được chọn. Giá trị mặc định của `aria-selected` trên vai trò `tab` là `false`.

Nếu có thể chọn nhiều hơn một tab cùng lúc, hãy thêm `aria-multiselectable` vào `tablist`.

## Ví dụ

Trong ví dụ `tablist` này, tab đầu tiên được chọn:

```html
<div class="tab-interface">
  <div role="tablist" aria-label="Sample Tabs">
    <span
      role="tab"
      aria-selected="true"
      aria-controls="panel-1"
      id="tab-1"
      tabindex="0">
      First Tab
    </span>
    <span
      role="tab"
      aria-selected="false"
      aria-controls="panel-2"
      id="tab-2"
      tabindex="-1">
      Second Tab
    </span>
    <span
      role="tab"
      aria-selected="false"
      aria-controls="panel-3"
      id="tab-3"
      tabindex="-1">
      Third Tab
    </span>
  </div>
  <div id="panel-1" role="tabpanel" tabindex="0" aria-labelledby="tab-1">
    <p>Content for the first panel</p>
  </div>
  <div id="panel-2" role="tabpanel" tabindex="0" aria-labelledby="tab-2" hidden>
    <p>Content for the second panel</p>
  </div>
  <div id="panel-3" role="tabpanel" tabindex="0" aria-labelledby="tab-3" hidden>
    <p>Content for the third panel</p>
  </div>
</div>
```

> [!NOTE]
> ARIA chỉ sửa đổi cây trợ năng của một phần tử và cách công nghệ hỗ trợ trình bày nội dung cho người dùng. ARIA không thay đổi chức năng hay hành vi của phần tử.

## Giá trị

- `true`
  - : Phần tử có thể chọn đang được chọn.
- `false`
  - : Phần tử có thể chọn không được chọn. Giá trị mặc định ngầm định cho [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role).
- `undefined` (mặc định)
  - : Phần tử không thể chọn.

## Giao diện liên quan

- {{domxref("Element.ariaSelected")}}
  - : Thuộc tính [`ariaSelected`](/en-US/docs/Web/API/Element/ariaSelected), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-selected`.
- {{domxref("ElementInternals.ariaSelected")}}
  - : Thuộc tính [`ariaSelected`](/en-US/docs/Web/API/ElementInternals/ariaSelected), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-selected`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)

Kế thừa vào các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed)
- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
