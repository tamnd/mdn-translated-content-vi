---
title: "ARIA: vai trò group"
short-title: group
slug: Web/Accessibility/ARIA/Reference/Roles/group_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#group
sidebar: accessibilitysidebar
---

Vai trò `group` xác định một tập hợp các đối tượng giao diện người dùng không nhằm được đưa vào phần tóm tắt của trang hoặc mục lục bởi công nghệ hỗ trợ.

## Mô tả

Gần nhất với phần tử {{HTMLElement('fieldset')}} của HTML, vai trò cấu trúc tài liệu `group` được dùng để xác định một tập hợp các đối tượng giao diện người dùng mà, so với [`region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role), không nhằm được đưa vào phần tóm tắt của trang hoặc mục lục.

Vai trò `group` nên được dùng để tạo một tập hợp logic các mục có chức năng liên quan, chẳng hạn các phần tử con trong một widget [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role) tạo thành một tập hợp các phần tử cùng cấp trong một hệ thống phân cấp, hoặc một tập hợp các mục có cùng vùng chứa trong [`directory`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/directory_role).

Khi dùng `group` trong ngữ cảnh [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role), hãy giới hạn các phần tử con của `group` ở các phần tử [`listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role). Trong trường hợp này, nên dùng nhiều danh sách có thứ tự hoặc không thứ tự, {{HTMLElement('ol')}} hoặc {{HTMLElement('ul')}}, với các phần tử con {{HTMLElement('li')}} lồng bên trong.

Khi dùng trong ngữ cảnh [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), các phần tử con duy nhất được phép là các phần tử {{HTMLElement('option')}}. Trong trường hợp này, nên dùng {{HTMLElement('select')}}, {{HTMLElement('option')}} và {{HTMLElement('optgroup')}} thay thế.

Phần tử `Group` có thể được lồng vào nhau.

Vai trò `group` không nên dùng cho các phần chính có thể nhận biết của trang. Nếu một phần đủ quan trọng để được đưa vào mục lục của trang, hãy dùng vai trò `region` hoặc một [vai trò landmark](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) chuẩn.

Khi vai trò này được thêm vào một phần tử, trình duyệt sẽ gửi ra một sự kiện group có thể truy cập tới các sản phẩm công nghệ hỗ trợ, từ đó có thể thông báo cho người dùng về nó.

## Ví dụ

Đoạn mã HTML dưới đây dùng vai trò `group` với chế độ xem `tree`:

```html
<div id="tree1" role="tree" tabindex="-1">
  <div
    id="animals"
    class="groupHeader"
    role="presentation"
    aria-owns="animalGroup"
    aria-expanded="true">
    <img
      role="presentation"
      tabindex="-1"
      src="images/treeExpanded.gif"
      alt="" />
    <span role="treeitem" tabindex="0">Động vật</span>
  </div>
  <div id="animalGroup" role="group">
    <div id="birds" role="treeitem">
      <span tabindex="-1">Chim</span>
    </div>
    <div
      id="cats"
      class="groupHeader"
      role="presentation"
      aria-owns="catGroup"
      aria-expanded="false">
      <img
        role="presentation"
        tabindex="-1"
        src="images/treeContracted.gif"
        alt="" />
      <span role="treeitem" tabindex="0">Mèo</span>
    </div>
    <div id="catGroup" role="group">
      <div id="siamese" role="treeitem">
        <span tabindex="-1">Mèo Xiêm</span>
      </div>
      <div id="tabby" role="treeitem">
        <span tabindex="-1">Mèo mướp</span>
      </div>
    </div>
  </div>
</div>
```

Ví dụ sau dùng vai trò `group` với một menu thả xuống [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role) chứa các [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role):

```html
<div role="menu">
  <ul role="group">
    <li role="menuitem">Hộp thư đến</li>
    <li role="menuitem">Lưu trữ</li>
    <li role="menuitem">Thùng rác</li>
  </ul>
  <ul role="group">
    <li role="menuitem">Thư mục tùy chỉnh 1</li>
    <li role="menuitem">Thư mục tùy chỉnh 2</li>
    <li role="menuitem">Thư mục tùy chỉnh 3</li>
  </ul>
  <ul role="group">
    <li role="menuitem">Thư mục mới</li>
  </ul>
</div>
```

Menu này có thể được xây dựng bằng các phần tử {{HTMLElement('select')}} và {{HTMLElement('option')}}. Trong trường hợp này, vai trò `group` sẽ gần nhất với phần tử {{HTMLElement('optgroup')}}.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('fieldset')}} của HTML
- [vai trò `section`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/section_role)
- [vai trò `row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [vai trò `select`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/select_role)
- [vai trò `toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)
