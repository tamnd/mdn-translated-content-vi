---
title: "ARIA: vai trò tab"
short-title: tab
slug: Web/Accessibility/ARIA/Reference/Roles/tab_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#tab
  - https://www.w3.org/WAI/ARIA/apg/patterns/tabs/examples/tabs-manual/
sidebar: accessibilitysidebar
---

Vai trò ARIA `tab` cho biết một phần tử tương tác bên trong `tablist` mà khi được kích hoạt sẽ hiển thị `tabpanel` liên quan của nó.

```html
<button role="tab" aria-selected="true" aria-controls="tabpanel-id" id="tab-id">
  Tab label
</button>
```

## Mô tả

Một phần tử với vai trò `tab` điều khiển khả năng hiển thị của một phần tử liên kết mang vai trò [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role). Mẫu trải nghiệm người dùng thông thường là một nhóm các tab trực quan ở phía trên, hoặc bên cạnh, một vùng nội dung, và việc chọn một tab khác sẽ thay đổi nội dung đồng thời làm tab được chọn nổi bật hơn các tab còn lại.

Các phần tử mang vai trò `tab` _phải_ hoặc là con của một phần tử mang vai trò `tablist`, hoặc có `id` của chúng nằm trong thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) của một `tablist`. Sự kết hợp này cho công nghệ hỗ trợ biết rằng phần tử là một phần của một nhóm phần tử liên quan. Một số công nghệ hỗ trợ sẽ cung cấp số lượng phần tử vai trò `tab` bên trong một `tablist`, và thông báo cho người dùng biết họ hiện đang tập trung vào `tab` nào. Ngoài ra, một phần tử mang vai trò `tab` _nên_ chứa thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) xác định `tabpanel` tương ứng (có vai trò `tabpanel`) bằng `id` của phần tử đó. Khi một phần tử mang vai trò `tabpanel` có focus, hoặc một phần tử con của nó có focus, điều đó cho biết phần tử liên kết mang vai trò `tab` là tab đang hoạt động trong `tablist`.

Khi các phần tử mang vai trò `tab` được chọn hoặc hoạt động, thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) của chúng phải được đặt thành `true`. Nếu không, thuộc tính `aria-selected` của chúng phải được đặt thành `false`. Khi một `tablist` chỉ chọn một mục được chọn hoặc hoạt động, thuộc tính `hidden` của các tabpanel khác phải được đặt thành true cho đến khi người dùng chọn tab liên kết với tabpanel đó. Khi một `tablist` cho phép chọn nhiều mục được chọn hoặc hoạt động, `tabpanel` được điều khiển tương ứng phải có thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) đặt thành `true` và thuộc tính `hidden` đặt thành `false`, nếu không thì ngược lại.

### Mọi hậu duệ đều mang tính trình bày

Có một số kiểu thành phần giao diện người dùng khi được biểu diễn trong API truy cập của nền tảng thì chỉ có thể chứa văn bản. API truy cập không có cách biểu diễn các phần tử ngữ nghĩa nằm bên trong `tab`. Để xử lý hạn chế này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử hậu duệ của bất kỳ phần tử `tab` nào, vì đây là một vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, xét phần tử `tab` sau, chứa một tiêu đề.

```html
<div role="tab"><h3>Title of my tab</h3></div>
```

Vì các hậu duệ của `tab` mang tính trình bày, đoạn mã sau là tương đương:

```html
<div role="tab"><h3 role="presentation">Title of my tab</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với nội dung sau trong [cây truy cập](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="tab">Title of my tab</div>
```

### Các vai trò và thuộc tính liên quan

- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
  - : boolean
- [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
  - : `id` của phần tử có vai trò `tabpanel`
- [id](/en-US/docs/Web/HTML/Reference/Global_attributes/id)
  - : nội dung

### Tương tác bàn phím

| Phím                              | Hành động                                                                                                                                                                                                                       |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <kbd>Tab</kbd>                    | Khi focus nằm ngoài `tablist`, chuyển focus đến tab đang hoạt động. Nếu focus đang ở tab đang hoạt động, chuyển focus đến phần tử kế tiếp trong thứ tự focus bàn phím, lý tưởng là `tabpanel` liên quan của tab đang hoạt động. |
| <kbd>→</kbd>                      | Tập trung và tùy chọn kích hoạt tab tiếp theo trong danh sách tab. Nếu tab hiện tại là tab cuối cùng trong danh sách tab, nó sẽ kích hoạt tab đầu tiên.                                                                         |
| <kbd>←</kbd>                      | Tập trung và tùy chọn kích hoạt tab trước đó trong danh sách tab. Nếu tab hiện tại là tab đầu tiên trong danh sách tab, nó sẽ kích hoạt tab cuối cùng.                                                                          |
| <kbd>Enter</kbd>/<kbd>Space</kbd> | Khi một tab có focus, nó kích hoạt tab, làm cho panel liên quan của nó được hiển thị.                                                                                                                                           |
| <kbd>Home</kbd>                   | Tập trung và tùy chọn kích hoạt tab đầu tiên trong danh sách tab.                                                                                                                                                               |
| <kbd>End</kbd>                    | Tập trung và tùy chọn kích hoạt tab cuối cùng trong danh sách tab.                                                                                                                                                              |
| <kbd>Delete</kbd>                 | Khi được phép, xóa tab hiện được chọn khỏi danh sách tab.                                                                                                                                                                       |

### Tính năng JavaScript bắt buộc

> [!NOTE]
> Mặc dù có những cách tạo chức năng giống tab mà không cần JavaScript, nhưng không có tổ hợp thay thế nào chỉ dùng HTML và CSS mà vẫn cung cấp cùng bộ chức năng được yêu cầu ở trên cho các tab có nội dung có thể truy cập.

## Ví dụ

Ví dụ này kết hợp vai trò `tab` với `tablist` và các phần tử mang `tabpanel` để tạo một nhóm nội dung theo tab tương tác. Ở đây chúng ta bao bọc nhóm nội dung của mình trong một `div`, với `tablist` có `aria-label` để gắn nhãn cho công nghệ hỗ trợ. Mỗi `tab` là một `button` với các thuộc tính đã nêu trước đó. Tab đầu tiên có cả `tabindex="0"` và `aria-selected="true"` được áp dụng. Hai thuộc tính này luôn phải được phối hợp như vậy - vì vậy khi một tab khác được chọn, nó sẽ có `tabindex="0"` và `aria-selected="true"` được áp dụng. Tất cả các tab chưa được chọn phải có `aria-selected="false"` và `tabindex="-1"`.

Tất cả các phần tử `tabpanel` đều có `tabindex="0"` để có thể được đưa vào bằng phím tab, và tất cả trừ phần tử đang hoạt động hiện tại đều có thuộc tính `hidden`. Thuộc tính `hidden` sẽ được gỡ bỏ khi `tabpanel` trở nên hiển thị bằng JavaScript.

> [!NOTE]
> Đặt `tabindex` trên tab panel là không cần thiết nếu phần tử đầu tiên trong tab panel có thể focus (chẳng hạn như liên kết), vì việc tab đến liên kết cũng sẽ bắt đầu đọc nội dung của panel. Tuy nhiên, nếu có bất kỳ panel nào trong tập mà phần tử nội dung đầu tiên không thể focus, thì tất cả phần tử tabpanel trong một tập tab nên có thể focus, để người dùng trình đọc màn hình có thể điều hướng tới nội dung panel một cách nhất quán.

```html
<div class="tabs">
  <div role="tablist" aria-label="Select your operating system">
    <button
      role="tab"
      aria-selected="true"
      aria-controls="panel-1"
      id="tab-1"
      tabindex="0">
      Windows
    </button>
    <button
      role="tab"
      aria-selected="false"
      aria-controls="panel-2"
      id="tab-2"
      tabindex="-1">
      macOS
    </button>
    <button
      role="tab"
      aria-selected="false"
      aria-controls="panel-3"
      id="tab-3"
      tabindex="-1">
      Linux
    </button>
  </div>
  <div class="tab-panels">
    <div id="panel-1" role="tabpanel" tabindex="0" aria-labelledby="tab-1">
      <p>How to run this application on Windows</p>
    </div>
    <div
      id="panel-2"
      role="tabpanel"
      tabindex="0"
      aria-labelledby="tab-2"
      hidden>
      <p>How to run this application on macOS</p>
    </div>
    <div
      id="panel-3"
      role="tabpanel"
      tabindex="0"
      aria-labelledby="tab-3"
      hidden>
      <p>How to run this application on Linux</p>
    </div>
  </div>
</div>
```

Có một số kiểu dáng cơ bản được áp dụng để tạo lại kiểu của các nút và thay đổi {{cssxref("z-index")}} của các phần tử `tab` nhằm tạo ảo giác chúng kết nối với `tabpanel` đối với phần tử đang hoạt động, và ảo giác rằng các phần tử không hoạt động nằm phía sau `tabpanel` đang hoạt động. Bạn cần phân biệt rõ tab đang hoạt động với các tab không hoạt động, chẳng hạn bằng viền dày hơn hoặc kích thước lớn hơn.

```css hidden
.tabs {
  padding: 1em;
}

[role="tablist"] {
  margin-bottom: -1px;
}

[role="tab"] {
  position: relative;
  z-index: 1;
  background: white;
  border-radius: 5px 5px 0 0;
  border: 1px solid grey;
  border-bottom: 0;
  padding: 0.2em;
}

[role="tab"][aria-selected="true"] {
  z-index: 3;
  border-top-width: 4px;
}

[role="tabpanel"] {
  position: relative;
  padding: 0 0.5em 0.5em 0.7em;
  border: 1px solid grey;
  border-radius: 0 0 5px 5px;
  background: white;
  z-index: 2;
}

[role="tabpanel"]:focus {
  border-color: #356fb3;
  outline: 1px solid #356fb3;
}
```

Tương tác người dùng được xử lý bằng JavaScript. Trước tiên, chúng ta lấy tham chiếu đến `tablist`, tất cả phần tử `tab` bên trong nó, vùng chứa các phần tử `tabpanel`, và tất cả phần tử `tabpanel` bên trong vùng chứa đó. Điều này dựa trên một số giả định về cấu trúc HTML của chúng ta, vì vậy nếu bạn thay đổi cấu trúc, bạn sẽ cần thay đổi mã này. Nếu bạn có nhiều giao diện tab trên một trang, bạn có thể bọc mã này trong một hàm và truyền `tabsContainer` làm đối số.

```js
const tabsContainer = document.querySelector(".tabs");
const tabList = tabsContainer.querySelector(':scope > [role="tablist"]');
const tabs = Array.from(tabList.querySelectorAll(':scope > [role="tab"]'));
const tabPanelsContainer = tabsContainer.querySelector(":scope > .tab-panels");
const tabPanels = Array.from(
  tabPanelsContainer.querySelectorAll(':scope > [role="tabpanel"]'),
);
```

Đối với tương tác bàn phím, chúng ta lắng nghe sự kiện [`keydown`](/en-US/docs/Web/API/Element/keydown_event) trên `tablist`. Trong bản demo này, chúng ta chọn không kích hoạt `tab` khi người dùng điều hướng bằng các phím mũi tên, mà chỉ di chuyển focus. Nếu bạn muốn hiển thị `tab` khi nó nhận focus, bạn có thể gọi hàm `showTab()` (được định nghĩa sau) thay vì chỉ gọi `focus()` trên tab mới.

```js
tabList.addEventListener("keydown", (e) => {
  const currentTab = e.target;
  const currentIndex = tabs.indexOf(currentTab);
  if (currentIndex === -1) return; // Exit if the focused element is not a tab
  let newIndex = 0;

  switch (e.key) {
    case "ArrowRight":
      newIndex = (currentIndex + 1) % tabs.length;
      break;
    case "ArrowLeft":
      newIndex = (currentIndex - 1 + tabs.length) % tabs.length;
      break;
    case "Home":
      newIndex = 0;
      break;
    case "End":
      newIndex = tabs.length - 1;
      break;
    default:
      return; // Exit if the key is not recognized
  }

  e.preventDefault();
  e.stopPropagation();
  tabs[newIndex].focus();
});
```
