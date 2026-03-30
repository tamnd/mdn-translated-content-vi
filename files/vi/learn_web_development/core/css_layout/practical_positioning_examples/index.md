---
title: Ví dụ định vị thực tế
slug: Learn_web_development/Core/CSS_layout/Practical_positioning_examples
page-type: guide
sidebar: learnsidebar
---

Bài viết này cho thấy cách xây dựng một số ví dụ thực tế để minh họa những loại thứ gì bạn có thể làm với định vị.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (nghiên cứu
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >), và hiểu biết về cách CSS hoạt động (nghiên cứu
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Hiểu được tính thực tế của định vị</td>
    </tr>
  </tbody>
</table>

## Hộp thông tin có tab

Ví dụ đầu tiên chúng ta sẽ xem là hộp thông tin có tab kinh điển — một tính năng rất phổ biến được sử dụng khi bạn muốn đóng gói nhiều thông tin vào một khu vực nhỏ. Điều này bao gồm các ứng dụng nặng về thông tin như game chiến lược/chiến tranh, phiên bản di động của các trang web nơi màn hình hẹp và không gian hạn chế, và các hộp thông tin nhỏ gọn nơi bạn có thể muốn cung cấp nhiều thông tin mà không cần nó lấp đầy toàn bộ UI. Ví dụ đơn giản của chúng ta sẽ trông như thế này khi hoàn thành:

![Tab 1 được chọn. 'Tab 2' và 'Tab 3' là hai tab còn lại. Chỉ nội dung của tab đã chọn mới hiển thị. Khi một tab được chọn, màu văn bản của nó thay đổi từ đen sang trắng và màu nền thay đổi từ đỏ cam sang nâu yên ngựa.](tabbed-info-box.png)

> [!NOTE]
> Bạn có thể thấy ví dụ hoàn chỉnh chạy trực tiếp tại [tabbed-info-box.html](https://mdn.github.io/learning-area/css/css-layout/practical-positioning-examples/tabbed-info-box.html) ([mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/tabbed-info-box.html)). Hãy xem qua để hiểu những gì bạn sẽ xây dựng trong phần này của bài viết.

Bạn có thể đang nghĩ "Tại sao không tạo các tab riêng biệt dưới dạng các trang web riêng biệt, và chỉ cho các tab click qua các trang riêng biệt để tạo hiệu ứng?" Mã này sẽ đơn giản hơn, đúng, nhưng mỗi chế độ xem "trang" riêng biệt sẽ thực sự là một trang web được tải mới, điều đó khiến việc lưu thông tin qua các chế độ xem và tích hợp tính năng này vào thiết kế UI lớn hơn khó hơn.

Để bắt đầu, chúng tôi muốn bạn tạo bản sao cục bộ của các tệp bắt đầu — [tabbed-info-box-start.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/tabbed-info-box-start.html) và [tabs-manual.js](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/tabs-manual.js). Lưu chúng ở nơi hợp lý trên máy tính và mở `tabbed-info-box-start.html` trong trình soạn thảo văn bản. Hãy xem HTML chứa trong body:

```html
<section class="info-box">
  <div role="tablist" class="manual">
    <button
      id="tab-1"
      type="button"
      role="tab"
      aria-selected="true"
      aria-controls="tabpanel-1">
      <span>Tab 1</span>
    </button>

    <button
      id="tab-2"
      type="button"
      role="tab"
      aria-selected="false"
      aria-controls="tabpanel-2">
      <span>Tab 2</span>
    </button>
    <button
      id="tab-3"
      type="button"
      role="tab"
      aria-selected="false"
      aria-controls="tabpanel-3">
      <span>Tab 3</span>
    </button>
  </div>

  <div class="panels">
    <article id="tabpanel-1" role="tabpanel" aria-labelledby="tab-1">
      <h2>The first tab</h2>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
        turpis nibh, porttitor nec venenatis eu, pulvinar in augue. Vestibulum
        et orci scelerisque, vulputate tellus quis, lobortis dui. Vivamus varius
        libero at ipsum mattis efficitur ut nec nisl. Nullam eget tincidunt
        metus. Donec ultrices, urna maximus consequat aliquet, dui neque
        eleifend lorem, a auctor libero turpis at sem. Aliquam ut porttitor
        urna. Nulla facilisi.
      </p>
    </article>

    <article id="tabpanel-2" role="tabpanel" aria-labelledby="tab-2">
      <h2>The second tab</h2>
      <p>
        This tab hasn't got any Lorem Ipsum in it. But the content isn't very
        exciting all the same.
      </p>
    </article>

    <article id="tabpanel-3" role="tabpanel" aria-labelledby="tab-3">
      <h2>The third tab</h2>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
        turpis nibh, porttitor nec venenatis eu, pulvinar in augue. And now an
        ordered list: how exciting!
      </p>
      <ol>
        <li>dui neque eleifend lorem, a auctor libero turpis at sem.</li>
        <li>Aliquam ut porttitor urna.</li>
        <li>Nulla facilisi</li>
      </ol>
    </article>
  </div>
</section>
```

Vì vậy ở đây chúng ta có một phần tử {{htmlelement("section")}} với `class` là `info-box`, chứa hai {{htmlelement("div")}}. Div đầu tiên chứa ba nút, sẽ trở thành các tab thực tế để nhấp để hiển thị các bảng điều khiển nội dung. Div thứ hai chứa ba phần tử {{htmlelement("article")}}, sẽ tạo nên các bảng điều khiển nội dung tương ứng với mỗi tab. Mỗi bảng điều khiển chứa một số nội dung mẫu.

Ý tưởng ở đây là chúng ta sẽ tạo kiểu cho các tab để trông giống như menu điều hướng ngang tiêu chuẩn và tạo kiểu cho các bảng điều khiển để ngồi lên nhau bằng định vị tuyệt đối. Chúng ta cũng sẽ cung cấp cho bạn một chút JavaScript để bao gồm trên trang của bạn để hiển thị bảng điều khiển tương ứng khi một tab được nhấn, và tạo kiểu chính cho tab đó. Bạn sẽ không cần hiểu mã JavaScript tại giai đoạn này, nhưng bạn nên nghĩ đến việc học một số [JavaScript](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Adding_interactivity) cơ bản càng sớm càng tốt — các tính năng UI phức tạp hơn trở nên, càng có khả năng bạn sẽ cần JavaScript để triển khai chức năng mong muốn.

### Thiết lập chung

Để bắt đầu, thêm phần sau giữa các thẻ {{HTMLElement("style")}} mở và đóng:

```css
html {
  font-family: sans-serif;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
}
```

Đây chỉ là một số thiết lập chung để đặt phông chữ sans-serif trên trang, sử dụng mô hình {{cssxref("box-sizing")}} `border-box`, và loại bỏ lề {{htmlelement("body")}} mặc định.

Tiếp theo, thêm phần sau ngay dưới CSS trước đó:

```css
.info-box {
  width: 452px;
  height: 400px;
  margin: 1.25rem auto 0;
}
```

Điều này đặt chiều rộng và chiều cao cụ thể cho nội dung và căn giữa nó trên màn hình bằng cách sử dụng `margin: 1.25rem auto 0` cũ. Trước đây trong khóa học, chúng ta đã khuyên không nên đặt chiều cao cố định trên các vùng chứa nội dung nếu có thể; điều này ổn trong trường hợp này vì chúng ta có nội dung cố định trong các tab.

### Tạo kiểu cho các tab

Bây giờ chúng ta muốn tạo kiểu cho các tab để trông giống như tab — về cơ bản, đây là menu điều hướng ngang, nhưng thay vì tải các trang web khác nhau khi chúng được nhấp vào như chúng ta đã thấy trước đây trong khóa học, chúng khiến các bảng điều khiển khác nhau được hiển thị trên cùng một trang. Trước tiên, thêm quy tắc sau ở cuối CSS để làm cho `tablist` trở thành vùng chứa {{cssxref("flex")}} và có chiều rộng 100%:

```css
.info-box [role="tablist"] {
  min-width: 100%;
  display: flex;
}
```

> [!NOTE]
> Chúng ta đang sử dụng các selector con với `.info-box` ở đầu chuỗi trong suốt ví dụ này — điều này là để chúng ta có thể chèn tính năng này vào một trang có nội dung khác đã có trên đó, mà không lo ngại về việc can thiệp vào các kiểu áp dụng cho các phần khác của trang.

Tiếp theo, chúng ta sẽ tạo kiểu cho các nút để trông giống như tab. Thêm CSS sau:

```css
.info-box [role="tab"] {
  padding: 0 1rem;
  line-height: 3rem;
  background: white;
  color: #b60000;
  font-weight: bold;
  border: none;
  outline: none;
}
```

Tiếp theo, chúng ta sẽ đặt các trạng thái `:focus` và `:hover` của các tab để trông khác nhau khi chúng được focus/hover, cung cấp cho người dùng một số phản hồi trực quan.

```css
.info-box [role="tab"]:focus span,
.info-box [role="tab"]:hover span {
  outline: 1px solid blue;
  outline-offset: 6px;
  border-radius: 4px;
}
```

Sau đó chúng ta sẽ đặt một quy tắc làm nổi bật một trong các tab khi thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) được đặt thành `true` trên nó. Chúng ta sẽ đặt điều này bằng JavaScript khi một tab được nhấp. Đặt CSS sau bên dưới các kiểu khác:

```css
.info-box [role="tab"][aria-selected="true"] {
  background-color: #b60000;
  color: white;
}
```

### Tạo kiểu cho các bảng điều khiển

Công việc tiếp theo là tạo kiểu cho các bảng điều khiển. Hãy bắt đầu!

Trước tiên, thêm quy tắc sau để tạo kiểu cho vùng chứa `.panels` {{htmlelement("div")}}. Ở đây chúng ta đặt {{cssxref("height")}} cố định để đảm bảo các bảng điều khiển vừa khít bên trong hộp thông tin, {{cssxref("position")}} `relative` để đặt {{htmlelement("div")}} làm ngữ cảnh định vị, để bạn có thể đặt các phần tử con được định vị so với nó và không phải khung nhìn ban đầu, và cuối cùng chúng ta {{cssxref("clear")}} float được đặt trong CSS ở trên để nó không can thiệp vào phần còn lại của bố cục.

```css
.info-box .panels {
  height: 352px;
  clear: both;
  position: relative;
}
```

Cuối cùng cho phần này, chúng ta sẽ tạo kiểu cho các phần tử {{htmlelement("article")}} riêng lẻ tạo nên các bảng điều khiển. Quy tắc đầu tiên chúng ta sẽ thêm sẽ {{cssxref("position")}} tuyệt đối các bảng điều khiển, và làm cho chúng tất cả nằm sát với {{cssxref("top")}} và {{cssxref("left")}} của vùng chứa {{htmlelement("div")}} của chúng — phần này là chìa khóa cho toàn bộ tính năng bố cục này, vì nó khiến các bảng điều khiển ngồi lên nhau. Quy tắc cũng cho các bảng điều khiển cùng chiều cao đặt như vùng chứa, và cung cấp cho nội dung một số đệm, {{cssxref("color")}} văn bản và {{cssxref("background-color")}}.

```css
.info-box [role="tabpanel"] {
  background-color: #b60000;
  color: white;
  position: absolute;
  padding: 0.8rem 1.2rem;
  height: 352px;
  top: 0;
  left: 0;
}
```

Quy tắc thứ hai chúng ta sẽ thêm ở đây khiến một bảng điều khiển có class `is-hidden` được đặt trên nó sẽ bị ẩn. Một lần nữa, chúng ta sẽ thêm/xóa class này bằng JavaScript tại thời điểm thích hợp. Khi một tab được chọn, bảng điều khiển tương ứng sẽ có class `is-hidden` bị xóa và tất cả các bảng điều khiển khác sẽ có class `is-hidden` được đặt, do đó chỉ một bảng điều khiển hiển thị tại một thời điểm.

```css
.info-box [role="tabpanel"].is-hidden {
  display: none;
}
```

### JavaScript

Phần cuối cùng khiến tính năng này hoạt động là mã JavaScript. Tệp `tabs-manual.js` đã được bao gồm bằng thẻ [`<script>`](/en-US/docs/Web/HTML/Reference/Elements/script):

```html
<script src="tabs-manual.js"></script>
```

Mã này thực hiện các việc sau:

- Khi [sự kiện tải cửa sổ](/en-US/docs/Web/API/Window/load_event) nó khởi tạo `TabsManual` [class](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript) cho tất cả các phần tử `tablist`.
- Khi một đối tượng `TabsManual` được tạo, trong constructor tất cả các tham chiếu tab và bảng điều khiển được thu thập trong các biến `tabs` và `tabpanels`, để chúng ta có thể dễ dàng thực hiện các thứ với chúng sau này.
- Constructor cũng đăng ký các trình xử lý sự kiện [`click`](/en-US/docs/Web/API/Element/click_event) và [`keydown`](/en-US/docs/Web/API/Element/keydown_event) trên tất cả các tab. Các trình xử lý sự kiện bao gồm logic về những gì nên xảy ra khi một tab được chọn bằng cách nhấp hoặc nhấn phím.
- Trong hàm `setSelectedTab(currentTab)`, những điều sau xảy ra:
  - Vòng lặp `for` được sử dụng để lặp qua tất cả các tab và bỏ chọn chúng bằng cách đặt thuộc tính `aria-selected` thành `false` và bằng cách đặt class `is-hidden` trên các bảng điều khiển tương ứng.
  - Trên tab được chọn (`currentTab`) `aria-selected` được đặt thành `true` và class `is-hidden` bị xóa khỏi bảng điều khiển tương ứng.

- Mã cũng có logic để hỗ trợ điều hướng bàn phím sử dụng các phím `Mũi tên trái`, `Mũi tên phải`, `Home` và `End`.

## Hộp thông tin có tab với vị trí cố định

Trong ví dụ thứ hai, chúng ta sẽ lấy ví dụ đầu tiên — hộp thông tin của chúng ta — và thêm nó vào ngữ cảnh của một trang web đầy đủ. Nhưng không chỉ vậy — chúng ta sẽ cho nó vị trí cố định để nó ở lại cùng vị trí trong cửa sổ trình duyệt. Khi nội dung chính cuộn, hộp thông tin sẽ ở cùng vị trí trên màn hình. Ví dụ hoàn chỉnh của chúng ta sẽ trông như thế này:

![Hộp thông tin là vùng chứa với 3 tab với tab đầu tiên được chọn và chỉ nội dung của tab đầu tiên được hiển thị. Nó được cho vị trí cố định. Hộp thông tin được định vị ở góc trên cùng bên trái của cửa sổ với chiều rộng 452 pixel. Vùng chứa nội dung giả chiếm phần nửa phải còn lại của cửa sổ; vùng chứa nội dung giả cao hơn cửa sổ và có thể cuộn. Khi trang được cuộn, vùng chứa bên phải di chuyển trong khi hộp thông tin ở cố định tại cùng vị trí trên màn hình.](fixed-info-box.png)

> [!NOTE]
> Bạn có thể thấy ví dụ hoàn chỉnh chạy trực tiếp tại [fixed-info-box.html](https://mdn.github.io/learning-area/css/css-layout/practical-positioning-examples/fixed-info-box.html) ([mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/fixed-info-box.html)). Hãy xem qua để hiểu những gì bạn sẽ xây dựng trong phần này của bài viết.

Làm điểm bắt đầu, bạn có thể sử dụng ví dụ hoàn chỉnh từ phần đầu tiên của bài viết, hoặc tạo bản sao cục bộ của [tabbed-info-box.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/tabbed-info-box.html) từ repo GitHub.

### Bổ sung HTML

Trước tiên, chúng ta cần một số HTML bổ sung để đại diện cho nội dung chính của trang web. Thêm {{htmlelement("section")}} sau ngay dưới thẻ {{htmlelement("body")}} mở, ngay trước section hiện có:

```html
<section class="fake-content">
  <h1>Fake content</h1>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
  <p>
    This is fake content. Your main web page contents would probably go here.
  </p>
</section>
```

> [!NOTE]
> Bạn có thể thay đổi nội dung giả thành nội dung thực nếu muốn.

### Thay đổi CSS hiện có

Tiếp theo chúng ta cần thực hiện một số thay đổi nhỏ cho CSS hiện có, để hộp thông tin được đặt và định vị. Thay đổi quy tắc `.info-box` để loại bỏ `margin: 0 auto;` (chúng ta không còn muốn hộp thông tin căn giữa nữa), thêm {{cssxref("position", "position: fixed;")}}, và gắn nó vào {{cssxref("top")}} của khung nhìn trình duyệt.

Nó bây giờ sẽ trông như thế này:

```css
.info-box {
  width: 452px;
  height: 400px;
  margin: 0 auto;
  position: fixed;
  top: 0;
}
```

### Tạo kiểu cho nội dung chính

Điều duy nhất còn lại cho ví dụ này là cung cấp cho nội dung chính một số kiểu. Thêm quy tắc sau bên dưới phần còn lại của CSS:

```css
.fake-content {
  background-color: #a60000;
  color: white;
  padding: 10px;
  height: 2000px;
  margin-left: 470px;
}

.fake-content p {
  margin-bottom: 200px;
}
```

Để bắt đầu, chúng ta cung cấp cho nội dung cùng {{cssxref("background-color")}}, {{cssxref("color")}}, và {{cssxref("padding")}} như các bảng điều khiển hộp thông tin. Sau đó chúng ta cho nó {{cssxref("margin-left")}} lớn để di chuyển nó sang phải, tạo không gian cho hộp thông tin ngồi vào, để nó không chồng lên bất cứ thứ gì khác.

Điều này đánh dấu kết thúc của ví dụ thứ hai; chúng ta hy vọng bạn sẽ thấy ví dụ thứ ba cũng thú vị không kém.

## Bảng điều khiển ẩn trượt

Ví dụ cuối cùng chúng ta sẽ trình bày ở đây là một bảng điều khiển trượt vào và ra khỏi màn hình khi nhấn một biểu tượng — như đã đề cập trước đó, điều này phổ biến cho các tình huống như bố cục di động, nơi không gian màn hình có sẵn nhỏ, vì vậy bạn không muốn sử dụng hầu hết nó bằng cách hiển thị menu hoặc bảng thông tin thay vì nội dung hữu ích.

Ví dụ hoàn chỉnh của chúng ta sẽ trông như thế này:

![Màn hình trống ở bên trái 60% màn hình với bảng điều khiển rộng 40% hiển thị thông tin ở bên phải. Biểu tượng 'dấu hỏi' ở góc trên cùng bên phải. Bảng điều khiển trượt vào và ra khỏi màn hình khi nhấn biểu tượng 'dấu hỏi' này.](hidden-sliding-panel.png)

> [!NOTE]
> Bạn có thể thấy ví dụ hoàn chỉnh chạy trực tiếp tại [hidden-info-panel.html](https://mdn.github.io/learning-area/css/css-layout/practical-positioning-examples/hidden-info-panel.html) ([mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/hidden-info-panel.html)). Hãy xem qua để hiểu những gì bạn sẽ xây dựng trong phần này của bài viết.

Làm điểm bắt đầu, tạo bản sao cục bộ của [hidden-info-panel-start.html](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/hidden-info-panel-start.html) từ repo GitHub của chúng ta. Điều này không tiếp tục từ ví dụ trước, vì vậy cần tệp bắt đầu mới. Hãy xem HTML trong tệp:

```html-nolint
<button
  type="button"
  id="menu-button"
  aria-haspopup="true"
  aria-controls="info-panel"
  aria-expanded="false">
      ❔
</button>

<aside id="info-panel" aria-labelledby="menu-button">
  …
</aside>
```

Để bắt đầu ở đây chúng ta có phần tử {{htmlelement("button")}} với ký tự dấu hỏi đặc biệt làm văn bản nút. Nút sẽ được nhấn để hiển thị/ẩn bảng thông tin [`aside`](/en-US/docs/Web/HTML/Reference/Elements/aside). Trong các phần dưới đây chúng ta sẽ giải thích cách tất cả điều này hoạt động.

### Tạo kiểu cho nút

Trước tiên hãy xử lý nút — thêm CSS sau giữa các thẻ {{htmlelement("style")}}:

```css
#menu-button {
  position: absolute;
  top: 0.5rem;
  right: 0.5rem;
  z-index: 1;

  font-size: 3rem;
  cursor: pointer;
  border: none;
  background-color: transparent;
}
```

Quy tắc đầu tiên tạo kiểu cho `<button>`; ở đây chúng ta đã:

- Đặt {{cssxref("font-size")}} lớn để làm cho biểu tượng đẹp và lớn.
- Xóa viền và làm cho nền trong suốt để thay vì nút chỉ biểu tượng `?` sẽ hiển thị.
- Đặt {{cssxref("position")}} `absolute` trên nó, và sử dụng {{cssxref("top")}} và {{cssxref("right")}} để định vị nó đẹp ở góc trên cùng bên phải.
- Đặt {{cssxref("z-index")}} là 1 trên nó — điều này là để khi bảng thông tin được tạo kiểu và hiển thị, nó không che biểu tượng; thay vào đó biểu tượng sẽ ngồi lên trên nó để nó có thể được nhấn lại để ẩn bảng thông tin.
- Đã sử dụng thuộc tính {{cssxref("cursor")}} để thay đổi con trỏ chuột khi di chuột qua biểu tượng thành con trỏ tay (như cái bạn thấy khi các liên kết được di chuột qua), như một dấu hiệu trực quan thêm cho người dùng rằng biểu tượng làm điều gì đó thú vị.

### Tạo kiểu cho bảng điều khiển

Bây giờ là lúc tạo kiểu cho bảng điều khiển trượt thực tế. Thêm quy tắc sau vào cuối CSS:

```css
#info-panel {
  background-color: #a60000;
  color: white;

  width: 340px;
  height: 100%;
  padding: 0 20px;

  position: fixed;
  top: 0;
  right: -370px;

  transition: 0.6s right ease-out;
}
```

Nhiều thứ đang xảy ra ở đây — hãy thảo luận từng phần một:

- Trước tiên, chúng ta đặt một số {{cssxref("background-color")}} và {{cssxref("color")}} đơn giản trên hộp thông tin.
- Tiếp theo, chúng ta đặt {{cssxref("width")}} cố định trên bảng điều khiển, và làm cho {{cssxref("height")}} của nó là toàn bộ chiều cao của khung nhìn trình duyệt.
- Chúng ta cũng bao gồm một số {{cssxref("padding")}} ngang để tạo khoảng cách một chút.
- Tiếp theo chúng ta đặt {{cssxref("position", "position: fixed;")}} trên bảng điều khiển để nó sẽ luôn xuất hiện ở cùng vị trí, ngay cả khi trang có nội dung để cuộn. Chúng ta gắn nó vào {{cssxref("top")}} của khung nhìn, và đặt nó để theo mặc định nó nằm ngoài màn hình ở {{cssxref("right")}}.
- Cuối cùng, chúng ta đặt {{cssxref("transition")}} trên phần tử. Transition là tính năng thú vị cho phép bạn làm cho các thay đổi giữa các trạng thái xảy ra mượt mà, thay vì chỉ "bật" hoặc "tắt" đột ngột. Trong trường hợp này, chúng ta có ý định làm cho bảng điều khiển trượt mượt mà lên màn hình khi hộp kiểm được chọn. (Hoặc nói cách khác, khi biểu tượng dấu hỏi được nhấp.)

### Đặt trạng thái đã chọn

Có một phần cuối cùng của CSS để thêm — đặt phần sau ở cuối CSS:

```css
#info-panel.open {
  right: 0px;
}
```

Quy tắc nói rằng khi info-panel có class `.open` được đặt trên nó, đặt thuộc tính {{cssxref("right")}} của `<aside>` thành `0px`, khiến bảng điều khiển xuất hiện trên màn hình trở lại (mượt mà nhờ transition). Xóa class `.open` ẩn bảng điều khiển một lần nữa.

Để thêm/xóa class `.open` khỏi info-panel bằng cách nhấp nút, chúng ta cần sử dụng JavaScript. Thêm mã sau giữa các thẻ {{htmlelement("script")}}:

```js
const button = document.querySelector("#menu-button");
const panel = document.querySelector("#info-panel");

button.addEventListener("click", () => {
  panel.classList.toggle("open");
  button.setAttribute("aria-expanded", panel.classList.contains("open"));
});
```

Mã thêm trình xử lý sự kiện click vào nút. Trình xử lý click chuyển đổi class `open` trên bảng điều khiển hộp thông tin, trượt bảng điều khiển vào hoặc ra khỏi chế độ xem.
Trình xử lý sự kiện cũng đặt thuộc tính [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) trên nút để cải thiện khả năng tiếp cận.

Vì vậy đây là — cách dễ nhất để tạo hiệu ứng bảng thông tin chuyển đổi.

## Tóm tắt

Vậy là kết thúc việc xem xét về định vị — bây giờ, bạn nên có ý tưởng về cách các cơ chế cơ bản hoạt động, cũng như hiểu cách bắt đầu áp dụng những thứ này để xây dựng một số tính năng UI thú vị. Đừng lo lắng nếu bạn không hiểu tất cả ngay lập tức — định vị là một chủ đề khá nâng cao, và bạn luôn có thể xem lại các bài viết để hỗ trợ hiểu biết.
