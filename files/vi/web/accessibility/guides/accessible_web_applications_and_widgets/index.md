---
title: Tổng quan về ứng dụng web và widget có thể truy cập
short-title: Accessible web applications and widgets
slug: Web/Accessibility/Guides/Accessible_web_applications_and_widgets
page-type: guide
sidebar: accessibilitysidebar
---

Phần lớn các thư viện JavaScript đều cung cấp một bộ widget phía máy khách mô phỏng hành vi của các giao diện máy tính để bàn quen thuộc. Thanh trượt, thanh menu, chế độ xem danh sách tệp, và nhiều thứ khác có thể được xây dựng bằng cách kết hợp JavaScript, CSS và HTML. Vì đặc tả HTML4 không cung cấp các thẻ tích hợp để mô tả ngữ nghĩa các loại widget này, các nhà phát triển thường phải dùng các phần tử tổng quát như {{HTMLElement('div')}} và {{HTMLElement('span')}}. Điều này tạo ra một widget trông giống đối tác trên máy tính để bàn của nó, nhưng thường không có đủ thông tin ngữ nghĩa trong markup để công nghệ hỗ trợ sử dụng được.

## Vấn đề

Nội dung động trên một trang web có thể đặc biệt gây khó khăn cho những người không thể nhìn thấy màn hình vì bất kỳ lý do gì. Các bảng giá cổ phiếu, cập nhật nguồn cấp Twitter trực tiếp, chỉ báo tiến trình, và nội dung tương tự sẽ sửa đổi DOM theo cách mà công nghệ hỗ trợ (AT) có thể không biết đến. Đó là nơi [ARIA](/en-US/docs/Web/Accessibility/ARIA) phát huy tác dụng.

_Ví dụ 1: Markup cho một widget tab được xây dựng mà không có nhãn ARIA. Không có thông tin nào trong markup để mô tả hình thức và chức năng của widget._

```html
<!-- Đây là một widget tab. Làm sao bạn biết được điều đó chỉ bằng cách nhìn markup? -->
<ol>
  <li id="ch1Tab">
    <a href="#ch1Panel">Chương 1</a>
  </li>
  <li id="ch2Tab">
    <a href="#ch2Panel">Chương 2</a>
  </li>
  <li id="quizTab">
    <a href="#quizPanel">Bài kiểm tra</a>
  </li>
</ol>

<div>
  <div id="ch1Panel">Nội dung chương 1 ở đây</div>
  <div id="ch2Panel">Nội dung chương 2 ở đây</div>
  <div id="quizPanel">Nội dung bài kiểm tra ở đây</div>
</div>
```

_Ví dụ 2: Cách widget tab có thể được tạo kiểu trực quan. Người dùng có thể nhận ra bằng mắt, nhưng không có ngữ nghĩa nào mà công nghệ hỗ trợ có thể đọc được._ ![Ảnh chụp widget tab](tabs_widget.png)

## ARIA

**ARIA** cho phép nhà phát triển mô tả widget của họ chi tiết hơn bằng cách thêm các thuộc tính đặc biệt vào markup. Được thiết kế để lấp khoảng trống giữa các thẻ HTML chuẩn và các điều khiển kiểu máy tính để bàn trong ứng dụng web động, ARIA cung cấp các vai trò và trạng thái mô tả hành vi của hầu hết widget giao diện người dùng quen thuộc.

> [!WARNING]
> Nhiều thứ trong số này sau đó mới được thêm vào khi trình duyệt chưa hỗ trợ đầy đủ các tính năng HTML hiện đại. **Nhà phát triển luôn nên ưu tiên dùng phần tử HTML ngữ nghĩa đúng thay vì dùng ARIA**.

Đặc tả ARIA được chia thành ba loại thuộc tính khác nhau: vai trò, trạng thái, và thuộc tính. Vai trò mô tả các widget không có sẵn trong HTML 4, chẳng hạn thanh trượt, thanh menu, tab, và hộp thoại. Thuộc tính mô tả đặc tính của các widget này, chẳng hạn chúng có thể kéo thả, có một phần tử bắt buộc, hay có một popup đi kèm. Trạng thái mô tả trạng thái tương tác hiện tại của một phần tử, cho công nghệ hỗ trợ biết nó đang bận, bị vô hiệu hóa, đã chọn, hay bị ẩn.

Các thuộc tính ARIA được trình duyệt diễn giải tự động và chuyển thành các API trợ năng gốc của hệ điều hành. Vì vậy, một phần tử có role="slider" sẽ được điều khiển theo cùng cách như một thanh trượt gốc trên hệ điều hành.

Điều này tạo ra trải nghiệm người dùng nhất quán hơn nhiều so với thế hệ ứng dụng web trước đây, vì người dùng công nghệ hỗ trợ có thể áp dụng toàn bộ hiểu biết của họ về cách các ứng dụng máy tính để bàn hoạt động khi họ dùng ứng dụng web.

_Ví dụ 3: Markup cho widget tab với các thuộc tính ARIA đã được thêm vào._

```html
<!-- Bây giờ *đây* mới là Tabs! -->
<!-- Chúng ta đã thêm các thuộc tính role để mô tả danh sách tab và từng tab. -->
<ol role="tablist">
  <li id="ch1Tab" role="tab">
    <a href="#ch1Panel">Chương 1</a>
  </li>
  <li id="ch2Tab" role="tab">
    <a href="#ch2Panel">Chương 2</a>
  </li>
  <li id="quizTab" role="tab">
    <a href="#quizPanel">Bài kiểm tra</a>
  </li>
</ol>

<div>
  <!-- Lưu ý các thuộc tính role và aria-labelledby chúng ta đã thêm để mô tả các panel này. -->
  <div id="ch1Panel" role="tabpanel" aria-labelledby="ch1Tab">
    Nội dung chương 1 ở đây
  </div>
  <div id="ch2Panel" role="tabpanel" aria-labelledby="ch2Tab">
    Nội dung chương 2 ở đây
  </div>
  <div id="quizPanel" role="tabpanel" aria-labelledby="quizTab">
    Nội dung bài kiểm tra ở đây
  </div>
</div>
```

ARIA được [hỗ trợ tốt](https://caniuse.com/#feat=wai-aria) bởi tất cả trình duyệt lớn và nhiều công nghệ hỗ trợ.

### Thay đổi trình bày

Các thay đổi trình bày động bao gồm việc dùng CSS để thay đổi hình thức của nội dung (chẳng hạn viền đỏ quanh dữ liệu không hợp lệ, hoặc đổi màu nền của checkbox đã chọn), cũng như hiển thị hoặc ẩn nội dung.

#### Thay đổi trạng thái

ARIA cung cấp các thuộc tính để khai báo trạng thái hiện tại của một widget giao diện người dùng. Ví dụ gồm có (nhưng không giới hạn ở):

- `aria-checked`
  - : Cho biết trạng thái của checkbox hoặc nút radio.
- `aria-disabled`
  - : Cho biết một phần tử đang hiển thị nhưng không thể chỉnh sửa hoặc không thể vận hành.
- `aria-grabbed`
  - : Cho biết trạng thái "được nắm giữ" của một đối tượng trong thao tác kéo-thả.

(Để xem danh sách đầy đủ các trạng thái ARIA, hãy tham khảo [danh sách trạng thái và thuộc tính ARIA](https://w3c.github.io/aria/#introstates).)

Nhà phát triển nên dùng các trạng thái ARIA để chỉ ra trạng thái của các phần tử widget giao diện người dùng và dùng bộ chọn thuộc tính CSS để thay đổi diện mạo trực quan dựa trên các thay đổi trạng thái đó (thay vì dùng script để đổi tên lớp trên phần tử).

#### Thay đổi khả năng hiển thị

Khi khả năng hiển thị của nội dung thay đổi (tức là một phần tử bị ẩn hoặc được hiện ra), nhà phát triển nên thay đổi giá trị thuộc tính **`aria-hidden`**. Các kỹ thuật mô tả ở trên nên được dùng để khai báo CSS ẩn một phần tử về mặt trực quan bằng `display:none`.

Sau đây là ví dụ về một tooltip dùng **`aria-hidden`** để kiểm soát khả năng hiển thị của tooltip. Ví dụ cho thấy một biểu mẫu web với các tooltip chứa hướng dẫn gắn với các trường nhập.

```html
<div class="text">
  <label id="tp1-label" for="first">Tên:</label>
  <input
    type="text"
    id="first"
    name="first"
    size="20"
    aria-labelledby="tp1-label"
    aria-describedby="tp1"
    aria-required="false" />
  <div id="tp1" class="tooltip" role="tooltip" aria-hidden="true">
    Tên của bạn là không bắt buộc
  </div>
</div>
```

CSS cho markup này được hiển thị trong đoạn mã sau. Lưu ý rằng không có tên lớp tùy chỉnh nào được dùng, chỉ có trạng thái của thuộc tính **`aria-hidden`**.

```css
div.tooltip[aria-hidden="true"] {
  display: none;
}
```

JavaScript để cập nhật thuộc tính **`aria-hidden`** có dạng như đoạn mã sau. Lưu ý rằng script chỉ cập nhật thuộc tính **`aria-hidden`**; nó không cần thêm hoặc xóa tên lớp tùy chỉnh.

```js
function showTip(el) {
  el.setAttribute("aria-hidden", "false");
}
```

### Thay đổi vai trò

ARIA cho phép nhà phát triển khai báo vai trò ngữ nghĩa cho một phần tử vốn chỉ cung cấp ngữ nghĩa không chính xác hoặc không có ngữ nghĩa. **`role`** của một phần tử không nên thay đổi. Thay vào đó, hãy xóa phần tử ban đầu và thay thế nó bằng một phần tử có **`role`** mới.

Ví dụ, hãy xét widget "inline edit": một thành phần cho phép người dùng chỉnh sửa một đoạn văn bản ngay tại chỗ, không cần chuyển ngữ cảnh. Thành phần này có chế độ "xem", trong đó văn bản không thể chỉnh sửa nhưng có thể kích hoạt, và chế độ "chỉnh sửa", trong đó văn bản có thể được sửa. Một nhà phát triển có thể bị cám dỗ triển khai chế độ "xem" bằng một phần tử {{ HTMLElement("input") }} văn bản chỉ đọc và đặt **`role`** ARIA của nó thành `button`, rồi chuyển sang chế độ "chỉnh sửa" bằng cách làm cho phần tử có thể ghi và xóa thuộc tính **`role`** trong chế độ "chỉnh sửa" (vì các phần tử {{ HTMLElement("input") }} đã có ngữ nghĩa vai trò riêng).

Đừng làm vậy. Thay vào đó, hãy triển khai chế độ "xem" bằng một phần tử khác hẳn, chẳng hạn {{ HTMLElement("div") }} hoặc {{ HTMLElement("span") }} với **`role`** là `button`, và chế độ "chỉnh sửa" bằng phần tử văn bản {{ HTMLElement("input") }}.

### Thay đổi nội dung không đồng bộ

> [!NOTE]
> Đang xây dựng. Xem thêm [Vùng trực tiếp](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)

## Điều hướng bằng bàn phím

Nhiều khi nhà phát triển bỏ qua hỗ trợ bàn phím khi họ tạo widget tùy chỉnh. Để có thể truy cập cho nhiều loại người dùng, mọi tính năng của một ứng dụng web hoặc widget cũng nên có thể được điều khiển bằng bàn phím, không cần chuột. Trên thực tế, điều này thường bao gồm việc đi theo các quy ước được hỗ trợ bởi các widget tương tự trên máy tính để bàn, tận dụng đầy đủ các phím Tab, Enter, Spacebar, và phím mũi tên.

Theo truyền thống, điều hướng bằng bàn phím trên web bị giới hạn ở phím Tab. Người dùng nhấn Tab để lần lượt đưa tiêu điểm vào từng liên kết, nút hoặc biểu mẫu trên trang theo thứ tự tuyến tính, dùng Shift-Tab để đi lùi. Đó là một dạng điều hướng một chiều - tiến và lùi, từng phần tử một. Trên các trang khá dày đặc, người dùng chỉ dùng bàn phím thường phải nhấn phím Tab hàng chục lần trước khi tới được phần cần thiết. Việc triển khai các quy ước bàn phím kiểu máy tính để bàn trên web có thể tăng tốc điều hướng đáng kể cho nhiều người dùng.

Sau đây là tóm tắt cách điều hướng bằng bàn phím nên hoạt động trong một ứng dụng web có ARIA:

- Phím Tab nên đưa tiêu điểm vào widget như một tổng thể. Ví dụ, tab tới thanh menu **KHÔNG NÊN** đặt tiêu điểm vào phần tử đầu tiên của menu.
- Các phím mũi tên nên cho phép chọn hoặc điều hướng bên trong widget. Ví dụ, dùng các phím mũi tên trái và phải nên di chuyển tiêu điểm tới mục menu trước đó và tiếp theo.
- Khi widget không nằm trong biểu mẫu, cả phím Enter và Spacebar đều nên chọn hoặc kích hoạt điều khiển.
- Bên trong biểu mẫu, phím Spacebar nên chọn hoặc kích hoạt điều khiển, còn phím Enter nên gửi hành động mặc định của biểu mẫu.
- Nếu không chắc, hãy mô phỏng hành vi tiêu chuẩn trên máy tính để bàn của điều khiển bạn đang tạo.

Vì vậy, với ví dụ widget Tabs ở trên, người dùng nên có thể điều hướng vào và ra khỏi vùng chứa của widget ({{HTMLElement('ol')}} trong markup của chúng ta) bằng các phím Tab và Shift-Tab. Khi tiêu điểm bàn phím đã ở trong vùng chứa, các phím mũi tên nên cho phép người dùng điều hướng giữa từng tab (các phần tử {{HTMLElement('li')}}). Từ đây, quy ước khác nhau tùy theo nền tảng. Trên Windows, tab tiếp theo nên được kích hoạt tự động khi người dùng nhấn các phím mũi tên. Trên macOS, người dùng có thể nhấn Enter hoặc Spacebar để kích hoạt tab tiếp theo. Một hướng dẫn chuyên sâu để tạo [widget JavaScript có thể điều hướng bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets) mô tả cách triển khai hành vi này bằng JavaScript.

## Xem thêm

- [ARIA](/en-US/docs/Web/Accessibility/ARIA)
- [Viết widget JavaScript có thể điều hướng bằng bàn phím](/en-US/docs/Web/Accessibility/Guides/Keyboard-navigable_JavaScript_widgets)
- [Đặc tả WAI-ARIA](https://w3c.github.io/aria/)
- [WAI-ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
