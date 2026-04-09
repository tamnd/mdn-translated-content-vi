---
title: Widget JavaScript có thể điều hướng bằng bàn phím
slug: Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets
page-type: guide
sidebar: accessibilitysidebar
---

Ứng dụng web thường dùng JavaScript để mô phỏng các widget trên máy tính để bàn như menu, cây phân cấp, trường văn bản phong phú, và các panel tab. Những widget này thường được cấu thành từ các phần tử {{HTMLElement("div")}} và {{HTMLElement("span")}} vốn tự bản chất không cung cấp chức năng bàn phím giống như các đối tác trên máy tính để bàn. Tài liệu này mô tả các kỹ thuật để làm cho widget JavaScript có thể truy cập bằng bàn phím.

## Dùng tabindex

Theo mặc định, khi người dùng dùng phím tab để duyệt một trang web, chỉ những phần tử tương tác (như liên kết, điều khiển biểu mẫu) mới được nhận tiêu điểm. Với thuộc tính [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) `tabindex`, tác giả có thể làm cho các phần tử khác cũng có thể nhận tiêu điểm. Khi đặt `0`, phần tử có thể được nhận tiêu điểm bằng bàn phím và script. Khi đặt `-1`, phần tử có thể được nhận tiêu điểm bằng script, nhưng nó không trở thành một phần của thứ tự tiêu điểm bằng bàn phím.

Thứ tự mà các phần tử nhận tiêu điểm khi dùng bàn phím, theo mặc định, là thứ tự xuất hiện trong nguồn. Trong những trường hợp đặc biệt, tác giả có thể muốn định nghĩa lại thứ tự này. Để làm vậy, có thể đặt `tabindex` thành bất kỳ số dương nào.

> [!WARNING]
> Tránh dùng giá trị dương cho `tabindex`. Các phần tử có `tabindex` dương sẽ được đặt trước các phần tử tương tác mặc định trên trang, nghĩa là tác giả trang sẽ phải thiết lập và duy trì giá trị `tabindex` cho tất cả phần tử có thể nhận tiêu điểm trên trang mỗi khi họ dùng một hay nhiều giá trị dương cho `tabindex`.

Bảng sau mô tả hành vi của `tabindex` trong các trình duyệt hiện đại:

<table>
  <thead>
    <tr>
      <th><code>tabindex</code> attribute</th>
      <th>Focusable with mouse or JavaScript via <code>element.focus()</code></th>
      <th>Tab navigable</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>not present</td>
      <td>Follows the platform convention of the element (yes for form controls, links, etc.).</td>
      <td>Follows the platform convention of the element.</td>
    </tr>
    <tr>
      <td>Negative (i.e., <code>tabindex="-1"</code>)</td>
      <td>Yes</td>
      <td>No; author must focus the element with <a href="/en-US/docs/Web/API/HTMLElement/focus"><code>focus()</code></a> in response to arrow or other key presses.</td>
    </tr>
    <tr>
      <td>Zero (i.e., <code>tabindex="0"</code>)</td>
      <td>Yes</td>
      <td>In tab order relative to element's position in document (note that interactive elements like {{HTMLElement('a')}} have this behavior by default, they don't need the attribute).</td>
    </tr>
    <tr>
      <td>Positive (e.g., <code>tabindex="33"</code>)</td>
      <td>Yes</td>
      <td><code>tabindex</code> value determines where this element is positioned in the tab order: smaller values will position elements earlier in the tab order than larger values (for example, <code>tabindex="7"</code> will be positioned before <code>tabindex="11"</code>).</td>
    </tr>
  </tbody>
</table>

### Điều khiển không nguyên gốc

Các phần tử HTML nguyên gốc có tính tương tác, như {{HTMLElement("a")}}, {{HTMLElement("input")}} và {{HTMLElement("select")}}, đã có thể dùng bằng bàn phím, vì vậy dùng một trong số chúng là con đường nhanh nhất để làm các thành phần hoạt động với bàn phím.

Tác giả cũng có thể làm một {{HTMLElement("div")}} hoặc {{HTMLElement("span")}} có thể truy cập bằng bàn phím bằng cách thêm `tabindex` bằng `0`. Điều này đặc biệt hữu ích cho các thành phần dùng các phần tử tương tác không tồn tại trong HTML.

### Nhóm các điều khiển

Với các widget nhóm như menu, tablist, grid, hoặc tree view, phần tử cha nên nằm trong thứ tự tab (`tabindex="0"`), và mỗi lựa chọn/tab/ô/hàng con nên được loại khỏi thứ tự tab (`tabindex="-1"`). Người dùng nên có thể điều hướng các phần tử con bằng các phím mũi tên. (Để xem mô tả đầy đủ về hỗ trợ bàn phím thường được mong đợi cho các widget điển hình, hãy xem [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/).)

Ví dụ dưới đây cho thấy kỹ thuật này được dùng với một điều khiển menu lồng nhau. Khi tiêu điểm bàn phím rơi vào phần tử {{HTMLElement("ul")}} chứa, nhà phát triển JavaScript phải quản lý tiêu điểm bằng lập trình và phản hồi các phím mũi tên. Để biết các kỹ thuật quản lý tiêu điểm bên trong widget, xem phần "Managing focus inside groups" bên dưới.

```html
<ul id="mb1" tabindex="0">
  <li id="mb1_menu1" tabindex="-1">
    Phông chữ
    <ul id="fontMenu" title="Phông chữ" tabindex="-1">
      <li id="sans-serif" tabindex="-1">Sans-serif</li>
      <li id="serif" tabindex="-1">Serif</li>
      <li id="monospace" tabindex="-1">Monospace</li>
      <li id="fantasy" tabindex="-1">Fantasy</li>
    </ul>
  </li>
  <li id="mb1_menu2" tabindex="-1">
    Kiểu chữ
    <ul id="styleMenu" title="Kiểu chữ" tabindex="-1">
      <li id="italic" tabindex="-1">Nghiêng</li>
      <li id="bold" tabindex="-1">Đậm</li>
      <li id="underline" tabindex="-1">Gạch chân</li>
    </ul>
  </li>
  <li id="mb1_menu3" tabindex="-1">
    Căn chỉnh
    <ul id="justificationMenu" title="Căn chỉnh" tabindex="-1">
      <li id="left" tabindex="-1">Trái</li>
      <li id="center" tabindex="-1">Giữa</li>
      <li id="right" tabindex="-1">Phải</li>
      <li id="justify" tabindex="-1">Căn đều</li>
    </ul>
  </li>
</ul>
```

#### Điều khiển bị vô hiệu hóa

Khi một điều khiển tùy chỉnh bị vô hiệu hóa, hãy loại nó khỏi thứ tự tab bằng cách đặt `tabindex="-1"`. Lưu ý rằng các mục bị vô hiệu hóa trong một widget nhóm (chẳng hạn các menu item trong menu) vẫn nên có thể điều hướng bằng các phím mũi tên.

## Quản lý tiêu điểm bên trong nhóm

Khi người dùng tab ra khỏi widget rồi quay lại, tiêu điểm nên quay về phần tử cụ thể trước đó có tiêu điểm, ví dụ như một tree item hoặc grid cell. Có hai kỹ thuật để làm việc này:

1. `tabindex` luân phiên: di chuyển tiêu điểm bằng lập trình
2. `aria-activedescendant`: quản lý tiêu điểm "ảo"

### Kỹ thuật 1: tabindex luân phiên

Đặt `tabindex` của phần tử đang có tiêu điểm thành "0" bảo đảm rằng nếu người dùng tab ra khỏi widget rồi quay lại, mục đã chọn trong nhóm vẫn giữ tiêu điểm. Lưu ý rằng khi cập nhật `tabindex` thành "0" thì cũng phải cập nhật mục đã chọn trước đó thành `tabindex="-1"`. Kỹ thuật này liên quan đến việc di chuyển tiêu điểm bằng lập trình theo phản hồi của sự kiện phím và cập nhật `tabindex` để phản ánh mục hiện đang có tiêu điểm. Để làm điều này:

Gắn một trình xử lý key down cho từng phần tử trong nhóm, và khi một phím mũi tên được dùng để di chuyển sang phần tử khác:

1. áp dụng tiêu điểm cho phần tử mới bằng lập trình,
2. cập nhật `tabindex` của phần tử đang có tiêu điểm thành "0", và
3. cập nhật `tabindex` của phần tử trước đó đang có tiêu điểm thành "-1".

### Kỹ thuật 2: `aria-activedescendant`

Kỹ thuật này liên quan đến việc gắn một trình xử lý sự kiện duy nhất cho widget chứa và dùng `aria-activedescendant` để theo dõi tiêu điểm "ảo". (Để biết thêm về ARIA, xem [tổng quan về ứng dụng web và widget có thể truy cập](/en-US/docs/Web/Accessibility/Guides/Accessible_web_applications_and_widgets).)

Thuộc tính `aria-activedescendant` xác định ID của phần tử con hiện đang có tiêu điểm ảo. Trình xử lý sự kiện trên vùng chứa phải phản hồi các sự kiện bàn phím và chuột bằng cách cập nhật giá trị của `aria-activedescendant` và bảo đảm mục hiện tại được tạo kiểu phù hợp (ví dụ, bằng viền hoặc màu nền).

## Hướng dẫn chung

### Sử dụng các sự kiện focus

- Không phát sự kiện [`focus`](/en-US/docs/Web/API/Element/focus_event) để gửi tiêu điểm tới một phần tử. Các sự kiện focus của DOM chỉ mang tính thông tin: hệ thống tạo ra chúng sau khi một thứ gì đó đã được nhận tiêu điểm, chứ không phải để đặt tiêu điểm. Hãy dùng `element.focus()` thay thế.
- Có nghe các sự kiện [`focus`](/en-US/docs/Web/API/Element/focus_event) và [`blur`](/en-US/docs/Web/API/Element/blur_event) để theo dõi thay đổi tiêu điểm. Đừng giả định rằng mọi thay đổi tiêu điểm đều đến từ sự kiện bàn phím và chuột: các công nghệ hỗ trợ như trình đọc màn hình có thể đặt tiêu điểm vào bất kỳ phần tử nào có thể nhận tiêu điểm. Nếu bạn muốn theo dõi trạng thái tiêu điểm cho toàn bộ tài liệu, bạn có thể dùng [`document.activeElement`](/en-US/docs/Web/API/Document/activeElement) để lấy phần tử đang hoạt động, hoặc [`document.hasFocus`](/en-US/docs/Web/API/Document/hasFocus) để xác định liệu tài liệu hiện tại có đang có tiêu điểm hay không.

### Bảo đảm bàn phím và chuột tạo ra cùng một trải nghiệm

Để bảo đảm trải nghiệm người dùng nhất quán bất kể thiết bị nhập nào, các trình xử lý sự kiện bàn phím và chuột nên dùng chung mã ở những chỗ phù hợp. Ví dụ, mã cập nhật `tabindex` hoặc kiểu hiển thị khi người dùng điều hướng bằng các phím mũi tên cũng nên được dùng cho trình xử lý nhấp chuột để tạo ra cùng các thay đổi đó.

### Bảo đảm bàn phím có thể dùng để kích hoạt phần tử

Để bảo đảm bàn phím có thể dùng để kích hoạt các phần tử, mọi trình xử lý gắn với sự kiện chuột cũng nên được gắn với sự kiện bàn phím. Ví dụ, để bảo đảm phím Enter có thể kích hoạt một phần tử, nếu bạn có `onclick="doSomething()"`, bạn cũng nên gắn `doSomething()` với sự kiện key down: `onkeydown="event.code === "Enter" && doSomething();"`.

### Luôn vẽ trạng thái focus cho các mục tabindex="-1" và các phần tử nhận tiêu điểm bằng lập trình

Đảm bảo các phần tử có tiêu điểm có vòng focus. Điều này có thể được thực hiện bằng thuộc tính CSS {{cssxref("outline")}}, và thuộc tính này không nên bị đặt vô điều kiện thành `none` - nếu bạn muốn ngăn các vòng focus không cần thiết xuất hiện, hãy dùng pseudo-class {{cssxref(":focus-visible")}}.

### Ngăn các sự kiện phím đã dùng thực hiện chức năng của trình duyệt

Nếu widget của bạn xử lý một sự kiện phím, hãy ngăn trình duyệt cũng xử lý nó (ví dụ, cuộn trang khi nhấn phím mũi tên) bằng cách dùng giá trị trả về của trình xử lý sự kiện. Nếu trình xử lý của bạn trả về `false`, sự kiện sẽ không được truyền ra ngoài trình xử lý đó.

Ví dụ:

```html
<span tabindex="-1">…</span>
```

```js
span.onkeydown = handleKeyDown;
```

Nếu `handleKeyDown()` trả về `false`, sự kiện sẽ bị tiêu thụ, ngăn trình duyệt thực hiện bất kỳ hành động nào dựa trên lần nhấn phím đó.

### Đừng trông chờ hành vi nhất quán cho việc lặp phím ở thời điểm này

Rất tiếc là `onkeydown` có thể hoặc không thể lặp lại tùy theo trình duyệt và hệ điều hành bạn đang dùng.
