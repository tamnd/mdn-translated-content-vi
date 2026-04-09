---
title: "ARIA: thuộc tính aria-multiselectable"
short-title: aria-multiselectable
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-multiselectable
sidebar: accessibilitysidebar
---

Thuộc tính `aria-multiselectable` cho biết người dùng có thể chọn nhiều hơn một mục trong các phần tử con có thể chọn hiện tại.

## Mô tả

Hành vi mặc định của các danh sách chọn, chẳng hạn như {{HTMLElement('select')}}, là chỉ cho phép chọn một mục hoặc một tùy chọn. Theo mặc định hoặc theo quy ước, khi người dùng được đưa ra một danh sách mà họ phải chọn một mục, họ sẽ mặc định rằng chỉ có thể chọn một mục trừ khi được thông báo khác. Thuộc tính `aria-multiselectable` là cách để thông báo cho người dùng công nghệ hỗ trợ rằng họ có thể chọn nhiều hơn một mục trong các mục có thể chọn hiện tại nếu muốn. Các danh sách và cây là những ví dụ về các vai trò có thể cho phép chọn nhiều hơn một mục cùng lúc.

> [!NOTE]
> Khi cho phép chọn nhiều, hãy thông báo cho người dùng rằng có thể chọn nhiều giá trị và cung cấp hướng dẫn cách nhập nhiều giá trị, chẳng hạn "để chọn nhiều hơn một giá trị, hãy giữ phím Control trong khi chọn."

### Dùng với `aria-selected`

Khi người dùng chọn một hoặc nhiều mục, hãy nhớ đặt các phần tử con đã chọn thành đã chọn bằng [`aria-selected="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected), còn các phần tử con có thể chọn nhưng chưa được chọn thì đặt `aria-selected="false"`. Nếu một phần tử không thể chọn, hãy bỏ hẳn thuộc tính `aria-selected` vì sự hiện diện của nó sẽ cho người dùng biết rằng mục đó có thể chọn.

Nếu một tree, grid, tab list hoặc list box hỗ trợ chọn nhiều hơn một nút, phần tử có vai trò [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role) hoặc [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role) phải có `aria-multiselectable` được đặt thành `true`. Nếu không, `aria-multiselectable` được đặt thành `false` hoặc giá trị mặc định `false` được ngầm định.

## Ví dụ

```html
<p id="colorOptions">Choose the colors for your flag.</p>
<ul
  tabindex="0"
  role="listbox"
  aria-labelledby="colorOptions"
  aria-multiselectable="true">
  <li id="red" role="option" aria-selected="false">Red</li>
  <li id="orange" role="option" aria-selected="false">Orange</li>
  <li id="yellow" role="option" aria-selected="false">Yellow</li>
  <li id="green" role="option" aria-selected="false">Green</li>
  <li id="blue" role="option" aria-selected="false">Blue</li>
  <li id="purple" role="option" aria-selected="false">Purple</li>
  <li id="magenta" role="option" aria-selected="false">Hot pink</li>
  <li id="lightpink" role="option" aria-selected="true">Light pink</li>
  <li id="white" role="option" aria-selected="true">White</li>
  <li id="lightblue" role="option" aria-selected="true">Light blue</li>
  <li id="black" role="option" aria-selected="false">Black</li>
  <li id="brown" role="option" aria-selected="false">Brown</li>
</ul>
```

Listbox này hỗ trợ chọn nhiều mục nên chúng ta đặt `aria-multiselectable="true"` cho phần tử có vai trò `listbox`. Tất cả các tùy chọn đã chọn đều có `aria-selected` đặt thành `true`. Tất cả các tùy chọn chưa được chọn nhưng có thể chọn đều có `aria-selected` đặt thành `false`. Nếu có các tùy chọn bị vô hiệu hóa hoặc không thể chọn, chúng ta sẽ bỏ hẳn thuộc tính `aria-selected`. Việc bao gồm thuộc tính này, dù không có giá trị hoặc được đặt rõ thành `false`, sẽ cho người dùng công nghệ hỗ trợ biết rằng mục đó có thể chọn.

Quy tắc đầu tiên khi dùng ARIA là: "nếu bạn có thể dùng một tính năng gốc đã có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy." Thay vì tạo một danh sách không thứ tự cần [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex), ARIA và JavaScript để biến văn bản thành các tùy chọn có thể chọn, chúng ta có thể dùng một multiselect gốc: phần tử {{htmlelement('select')}} có thuộc tính boolean [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/select#multiple). Nếu được thêm vào, người dùng có thể chọn nhiều tùy chọn. Nếu không, chỉ một tùy chọn có thể được chọn.

```html
<label for="flagcolors"> Choose the colors for your flag. </label>
<select multiple id="flagcolors">
  <option value="red">Red</option>
  <option value="orange">Orange</option>
  <option value="yellow">Yellow</option>
  <option value="green">Green</option>
  <option value="blue">Blue</option>
  <option value="purple">Purple</option>
  <option value="magenta">Hot pink</option>
  <option value="lightpink" selected>Light pink</option>
  <option value="white" selected>White</option>
  <option value="lightblue" selected>Light blue</option>
  <option value="black">Black</option>
  <option value="brown">Brown</option>
</select>
```

Phiên bản HTML `<select>` này có thể truy cập và tương tác được, và không cần ARIA hay JavaScript để hoạt động.

Nếu cách trên không dễ tạo kiểu như bạn mong muốn, bạn cũng có thể tạo một danh sách các tùy chọn có thể chọn bằng các checkbox HTML, vốn cũng có ngữ nghĩa, có thể focus và có thể tạo kiểu linh hoạt bằng CSS:

```html
<fieldset>
  <legend>Choose the colors for your flag.</legend>
  <ul>
    <li>
      <label><input type="checkbox" name="fc" value="red" />Red</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="orange" />Orange</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="yellow" />Yellow</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="green" />Green</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="blue" />Blue</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="purple" />Purple</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="magenta" />Hot pink</label>
    </li>
    <li>
      <label
        ><input type="checkbox" name="fc" value="lightpink" checked />Light
        pink</label
      >
    </li>
    <li>
      <label
        ><input type="checkbox" name="fc" value="white" checked />White</label
      >
    </li>
    <li>
      <label
        ><input type="checkbox" name="fc" value="lightblue" checked />Light
        blue</label
      >
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="black" />Black</label>
    </li>
    <li>
      <label><input type="checkbox" name="fc" value="brown" />Brown</label>
    </li>
  </ul>
</fieldset>
```

Thay vì `aria-selected="true"`, hãy dùng thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#checked). Trình duyệt sẽ làm phần còn lại.

## Giá trị

- `true`
  - : Trong widget có thể chọn, có thể chọn nhiều hơn một mục cùng lúc
- `false`
  - : Chỉ có thể chọn một mục

## Giao diện liên quan

- {{domxref("Element.ariaMultiSelectable")}}
  - : Thuộc tính [`ariaMultiSelectable`](/en-US/docs/Web/API/Element/ariaMultiSelectable), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-multiselectable`.
- {{domxref("ElementInternals.ariaMultiSelectable")}}
  - : Thuộc tính [`ariaMultiSelectable`](/en-US/docs/Web/API/ElementInternals/ariaMultiSelectable), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-multiselectable`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)

Kế thừa vào các vai trò:

- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('select')}}
- Phần tử HTML {{HTMLElement('option')}}
- Phần tử HTML {{HTMLElement('input')}}
- Thuộc tính [multiple](/en-US/docs/Web/HTML/Reference/Attributes/multiple)
- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
