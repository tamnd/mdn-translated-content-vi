---
title: "ARIA: vai trò searchbox"
short-title: searchbox
slug: Web/Accessibility/ARIA/Reference/Roles/searchbox_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#searchbox
sidebar: accessibilitysidebar
---

Vai trò `searchbox` cho biết phần tử là một kiểu `textbox` dùng để chỉ định tiêu chí tìm kiếm.

## Mô tả

`searchbox` có thể được dùng thay cho vai trò [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role) khi hộp văn bản nằm trong một phần tử có vai trò [`search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role). `searchbox` là phần tương đương ngữ nghĩa với {{HTMLElement('input')}} HTML kiểu `search`, [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search), và nếu có thể thì nên dùng phần tử đó thay thế.

`searchbox` phải có một tên khả năng tiếp cận. Nếu vai trò `searchbox` được áp dụng cho một phần tử HTML {{HTMLElement('input')}}, nên dùng một {{HTMLElement('label')}} liên kết.
Nếu không, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu có nhãn hiển thị, hoặc [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) nếu không có nhãn hiển thị.

Trình đọc màn hình sẽ thông báo "search box", "search edit", hoặc "search field" cùng với tên khả năng tiếp cận. Điều này có thể lặp thừa nếu từ "search" đã có trong nhãn.

## Ví dụ

```html
<div tabindex="0" aria-label="search" role="searchbox" contenteditable></div>
```

Mặc dù đoạn trên hợp lệ, sẽ đơn giản hơn, ngắn gọn hơn và ít thừa hơn với người dùng trình đọc màn hình nếu viết:

```html
<input type="search" />
```

Đoạn sau là một biểu mẫu tìm kiếm với searchbox và nút, live region ARIA, và vùng chứa cho kết quả tìm kiếm.

```html
<form role="search">
  <input
    type="search"
    role="searchbox"
    aria-description="search results will appear below"
    id="search"
    value="" />
  <label for="search">Search this site</label>
  <button>Submit search</button>
</form>
<div aria-live="polite" role="region" aria-atomic="true">
  <div class="sr-only"></div>
</div>
<div id="search-results"></div>
```

Việc bao gồm `role="searchbox"` khi form là một `search` và nhãn cho biết phần tử là tìm kiếm có thể khiến công nghệ hỗ trợ thông báo theo kiểu "search search this site search box", vốn là thừa. Không cần thêm `role="searchbox"`:

```html
<input
  type="search"
  aria-description="search results will appear below"
  id="search"
  value="" />
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search)
- [ARIA: vai trò `search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)
- [ARIA: vai trò `textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
