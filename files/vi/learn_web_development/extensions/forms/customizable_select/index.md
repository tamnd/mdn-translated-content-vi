---
title: Phần tử select có thể tùy chỉnh
short-title: Customizable selects
slug: Learn_web_development/Extensions/Forms/Customizable_select
page-type: learn-module-chapter
browser-compat: css.properties.appearance.base-select
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Advanced_form_styling", "Learn_web_development/Extensions/Forms/Customizable_select_listboxes", "Learn_web_development/Extensions/Forms")}}

Bài viết này giải thích cách tạo các phần tử {{htmlelement("select")}} được tùy chỉnh hoàn toàn bằng cách sử dụng các tính năng thử nghiệm của trình duyệt. Điều này bao gồm việc kiểm soát hoàn toàn việc tạo kiểu cho nút select, trình chọn thả xuống, biểu tượng mũi tên, dấu kiểm tra lựa chọn hiện tại và mỗi phần tử {{htmlelement("option")}} riêng lẻ.

> [!WARNING]
> Các tính năng CSS và HTML được trình bày trong bài viết này hiện có hỗ trợ trình duyệt hạn chế; hãy kiểm tra các bảng tương thích trình duyệt trên các trang tham chiếu tính năng riêng lẻ để biết thêm chi tiết. Một số framework JavaScript chặn các tính năng này; trong các framework khác, chúng gây ra lỗi hydration khi Server-Side Rendering (SSR) được bật.

## Bối cảnh

Theo truyền thống, rất khó để tùy chỉnh giao diện và cảm giác của các phần tử `<select>` vì chúng chứa các phần tử nội bộ được tạo kiểu ở cấp độ hệ điều hành, không thể được nhắm mục tiêu bằng CSS. Điều này bao gồm trình chọn thả xuống, biểu tượng mũi tên, v.v.

Trước đây, lựa chọn tốt nhất có sẵn — ngoài việc sử dụng thư viện JavaScript tùy chỉnh — là đặt giá trị {{cssxref("appearance")}} là `none` trên phần tử `<select>` để loại bỏ một số tạo kiểu ở cấp độ hệ điều hành, sau đó sử dụng CSS để tùy chỉnh các phần có thể tạo kiểu. Kỹ thuật này được giải thích trong [Tạo kiểu biểu mẫu nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling).

Các phần tử `<select>` có thể tùy chỉnh cung cấp giải pháp cho những vấn đề này. Chúng cho phép bạn xây dựng các ví dụ như sau, chỉ sử dụng HTML và CSS, được tùy chỉnh hoàn toàn trong [các trình duyệt hỗ trợ](#browser_compatibility). Điều này bao gồm bố cục `<select>` và trình chọn thả xuống, bảng màu, biểu tượng, phông chữ, chuyển tiếp, vị trí, điểm đánh dấu để chỉ ra biểu tượng được chọn, v.v.

{{EmbedLiveSample("full-render", "100%", "410px")}}

Ngoài ra, chúng cung cấp cải tiến dần dần trên đầu chức năng hiện có, dự phòng về các select "cổ điển" trong các trình duyệt không hỗ trợ.

Bạn sẽ tìm hiểu cách xây dựng ví dụ này trong các phần bên dưới.

> [!NOTE]
> Bài viết này đề cập đến nền tảng đằng sau các select có thể tùy chỉnh và cho thấy cách xây dựng các select "dropdown đơn" tận dụng các tính năng này — đó là, các menu thả xuống hiển thị một tùy chọn tại một thời điểm và cho phép chọn một tùy chọn.
>
> Để biết thông tin về việc tạo các select "listbox" — các menu hiển thị nhiều tùy chọn cùng một lúc và cho phép chọn một hoặc nhiều tùy chọn — hãy xem [Hộp danh sách select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select_listboxes).

## Những tính năng nào tạo nên select có thể tùy chỉnh?

Bạn có thể xây dựng các phần tử `<select>` có thể tùy chỉnh bằng cách sử dụng các tính năng HTML và CSS sau:

- Các phần tử {{htmlelement("select")}}, {{htmlelement("option")}} và {{htmlelement("optgroup")}} cũ thuần túy. Chúng hoạt động giống hệt như trong các select "cổ điển", ngoại trừ chúng có các loại nội dung được phép bổ sung.
- Phần tử {{htmlelement("button")}} được bao gồm là con đầu tiên bên trong phần tử `<select>`, điều này trước đây không được phép trong các select "cổ điển". Khi điều này được bao gồm, nó thay thế hiển thị "nút" mặc định của phần tử `<select>` đã đóng. Điều này thường được gọi là **nút select** (vì đó là nút bạn cần nhấn để mở trình chọn thả xuống).
  > [!NOTE]
  > Nút select là [bất hoạt](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) theo mặc định để nếu các con tương tác (ví dụ, liên kết hoặc nút) được bao gồm bên trong nó, nó vẫn sẽ được coi như một nút đơn cho mục đích tương tác — ví dụ, các mục con sẽ không thể được tập trung hoặc nhấp vào.
- Phần tử {{htmlelement("selectedcontent")}} có thể tùy chọn được bao gồm bên trong phần tử `<button>` con đầu tiên của phần tử `<select>` để hiển thị giá trị hiện đang được chọn bên trong phần tử `<select>` _đã đóng_.
  Điều này chứa một bản sao của nội dung phần tử `<option>` hiện đang được chọn (được tạo bằng {{domxref("Node.cloneNode", "cloneNode()")}} bên dưới).
- Phần tử giả {{cssxref("::picker()", "::picker(select)")}}, nhắm mục tiêu toàn bộ nội dung của trình chọn. Điều này bao gồm tất cả các phần tử bên trong phần tử `<select>`, ngoại trừ `<button>` con đầu tiên.
- Giá trị thuộc tính {{cssxref("appearance")}} `base-select`, chọn phần tử `<select>` và phần tử giả `::picker(select)` vào các kiểu mặc định và hành vi do trình duyệt xác định cho select có thể tùy chỉnh.
- Lớp giả {{cssxref(":open")}}, nhắm mục tiêu nút select khi trình chọn (`::picker(select)`) đang mở.
- Phần tử giả {{cssxref("::picker-icon")}}, nhắm mục tiêu biểu tượng bên trong nút select — mũi tên trỏ xuống khi select đang đóng.
- Lớp giả {{cssxref(":checked")}}, nhắm mục tiêu phần tử `<option>` hiện đang được chọn.
- Phần tử giả {{cssxref("::checkmark")}}, nhắm mục tiêu dấu kiểm tra được đặt bên trong phần tử `<option>` hiện đang được chọn để cung cấp dấu hiệu trực quan về cái nào được chọn.

Ngoài ra, phần tử `<select>` và trình chọn thả xuống của nó có tham chiếu anchor ngầm định, có nghĩa là trình chọn được tự động liên kết với phần tử `<select>` thông qua [định vị anchor CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning). Các kiểu mặc định của trình duyệt định vị trình chọn tương đối với nút (anchor) và bạn có thể tùy chỉnh vị trí này như được giải thích trong [Định vị phần tử tương đối với anchor của chúng](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#positioning_elements_relative_to_their_anchor). Các kiểu mặc định của trình duyệt cũng xác định một số dự phòng thử vị trí để định vị lại trình chọn nếu nó có nguy cơ tràn ra khỏi viewport. Dự phòng thử vị trí được giải thích trong [Xử lý tràn: dự phòng thử và ẩn có điều kiện](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding).

> [!NOTE]
> Bạn có thể kiểm tra hỗ trợ trình duyệt cho `<select>` có thể tùy chỉnh bằng cách xem các bảng tương thích trình duyệt trên các trang tham chiếu cho các tính năng liên quan như {{htmlelement("selectedcontent")}}, {{cssxref("::picker()", "::picker(select)")}} và {{cssxref("::checkmark")}}.

Hãy xem tất cả các tính năng trên trong thực tế, bằng cách đi qua ví dụ hiển thị ở đầu trang.

## Đánh dấu select có thể tùy chỉnh

Ví dụ của chúng ta là một menu {{htmlelement("select")}} điển hình cho phép bạn chọn thú cưng. Đánh dấu như sau:

```html live-sample___plain-render live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render
<form>
  <p>
    <label for="pet-select">Select pet:</label>
    <select id="pet-select">
      <button>
        <selectedcontent></selectedcontent>
      </button>

      <option value="">Please select a pet</option>
      <option value="cat">
        <span class="icon" aria-hidden="true">🐱</span
        ><span class="option-label">Cat</span>
      </option>
      <option value="dog">
        <span class="icon" aria-hidden="true">🐶</span
        ><span class="option-label">Dog</span>
      </option>
      <option value="hamster">
        <span class="icon" aria-hidden="true">🐹</span
        ><span class="option-label">Hamster</span>
      </option>
      <option value="chicken">
        <span class="icon" aria-hidden="true">🐔</span
        ><span class="option-label">Chicken</span>
      </option>
      <option value="fish">
        <span class="icon" aria-hidden="true">🐟</span
        ><span class="option-label">Fish</span>
      </option>
      <option value="snake">
        <span class="icon" aria-hidden="true">🐍</span
        ><span class="option-label">Snake</span>
      </option>
    </select>
  </p>
</form>
```

> [!NOTE]
> Thuộc tính [`aria-hidden="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden) được bao gồm trên các biểu tượng để chúng sẽ bị ẩn khỏi các công nghệ hỗ trợ, tránh việc các giá trị tùy chọn được thông báo hai lần (ví dụ: "cat cat").

Đánh dấu ví dụ gần giống với đánh dấu `<select>` "cổ điển", với những khác biệt sau:

- Cấu trúc `<button><selectedcontent></selectedcontent></button>` đại diện cho {{htmlelement("button")}} select.
  Việc thêm phần tử {{htmlelement("selectedcontent")}} khiến trình duyệt sao chép {{htmlelement("option")}} hiện đang được chọn bên trong nút, sau đó bạn có thể [cung cấp kiểu tùy chỉnh cho](#điều_chỉnh_kiểu_dáng_của_nội_dung_tùy_chọn_được_chọn_bên_trong_nút_select). Nếu cấu trúc này không được bao gồm trong đánh dấu của bạn, trình duyệt sẽ dự phòng để hiển thị văn bản của tùy chọn được chọn bên trong nút mặc định, và bạn sẽ không thể tạo kiểu cho nó dễ dàng như vậy.
  > [!NOTE]
  > Bạn _có thể_ bao gồm nội dung tùy ý bên trong `<button>` để hiển thị bất cứ điều gì bạn muốn bên trong `<select>` đã đóng, nhưng hãy cẩn thận khi làm điều này. Những gì bạn bao gồm có thể thay đổi giá trị có thể truy cập được tiết lộ cho công nghệ hỗ trợ cho phần tử `<select>`.
- Phần còn lại của nội dung `<select>` đại diện cho trình chọn thả xuống, thường bị giới hạn ở các phần tử `<option>` đại diện cho các lựa chọn khác nhau trong trình chọn. Bạn có thể bao gồm nội dung khác trong trình chọn, nhưng không được khuyến nghị.
- Theo truyền thống, các phần tử `<option>` chỉ có thể chứa văn bản, nhưng trong select có thể tùy chỉnh, bạn có thể bao gồm các cấu trúc đánh dấu khác như hình ảnh, các phần tử ngữ nghĩa cấp văn bản không tương tác khác, v.v. Bạn thậm chí có thể sử dụng các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}} để bao gồm nội dung khác, mặc dù hãy nhớ rằng điều này sẽ không được bao gồm trong giá trị có thể gửi. Trong ví dụ của chúng ta, mỗi `<option>` chứa hai phần tử {{htmlelement("span")}} chứa biểu tượng và nhãn văn bản tương ứng, cho phép mỗi phần tử được tạo kiểu và định vị độc lập.

  > [!NOTE]
  > Vì nội dung `<option>` có thể chứa các cây con DOM nhiều cấp, không chỉ là các nút văn bản, có các quy tắc liên quan đến cách trình duyệt nên trích xuất [giá trị `<select>` hiện tại](/en-US/docs/Web/API/HTMLSelectElement/value) thông qua JavaScript. Giá trị thuộc tính {{domxref("Node.textContent", "textContent")}} của phần tử `<option>` được chọn được lấy, {{jsxref("String.prototype.trim", "trim()")}} được chạy trên đó, và kết quả được đặt là giá trị `<select>`.

Thiết kế này cho phép các trình duyệt không hỗ trợ dự phòng về trải nghiệm `<select>` cổ điển. Cấu trúc `<button><selectedcontent></selectedcontent></button>` sẽ bị bỏ qua hoàn toàn, và nội dung `<option>` không phải văn bản sẽ bị loại bỏ để chỉ còn lại nội dung nút văn bản, nhưng kết quả vẫn sẽ hoạt động.

## Chọn kết xuất select tùy chỉnh

Để chọn tham gia chức năng select tùy chỉnh và kiểu cơ sở tối thiểu của trình duyệt (và xóa tạo kiểu được cung cấp bởi hệ điều hành), cả phần tử `<select>` và trình chọn thả xuống của nó (được đại diện bởi phần tử giả `::picker(select)`) đều cần có giá trị {{cssxref("appearance")}} là `base-select` được đặt trên chúng:

```css live-sample___plain-render live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render
select,
::picker(select) {
  appearance: base-select;
}
```

```css hidden live-sample___plain-render live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render
* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  width: 100%;
  padding: 0 10px;
  max-width: 480px;
  margin: 0 auto;
}

h2 {
  font-size: 1.2rem;
}

p {
  display: flex;
  gap: 10px;
}

label {
  width: fit-content;
  align-self: center;
}

select {
  flex: 1;
}
```

Bạn có thể chọn chỉ tham gia phần tử `<select>` vào chức năng mới, để lại trình chọn với tạo kiểu hệ điều hành mặc định, nhưng trong hầu hết các trường hợp, bạn sẽ muốn chọn tham gia cả hai. Bạn không thể chọn tham gia trình chọn mà không chọn tham gia phần tử `<select>`.

Sau khi hoàn thành, kết quả là một hiển thị rất đơn giản của phần tử `<select>`:

{{EmbedLiveSample("plain-render", "100%", "240px")}}

Bây giờ bạn có thể tự do tạo kiểu theo bất kỳ cách nào bạn muốn. Để bắt đầu, phần tử `<select>` có giá trị {{cssxref("border")}}, {{cssxref("background")}} (thay đổi khi {{cssxref(":hover")}} hoặc {{cssxref(":focus")}}), và {{cssxref("padding")}} tùy chỉnh được đặt, cộng với {{cssxref("transition")}} để thay đổi nền hoạt hình mượt mà:

```css live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render
select {
  border: 2px solid #dddddd;
  background: #eeeeee;
  padding: 10px;
  transition: 0.4s;
}

select:hover,
select:focus {
  background: #dddddd;
}
```

## Tạo kiểu biểu tượng trình chọn

Để tạo kiểu biểu tượng bên trong nút select — mũi tên trỏ xuống khi select đang đóng — bạn có thể nhắm mục tiêu nó bằng phần tử giả {{cssxref("::picker-icon")}}. Đoạn mã sau cung cấp cho biểu tượng một {{cssxref("color")}} tùy chỉnh và một `transition` để thay đổi thuộc tính {{cssxref("rotate")}} của nó được hoạt hình mượt mà:

```css live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render
select::picker-icon {
  color: #999999;
  transition: 0.4s rotate;
}
```

Tiếp theo, `::picker-icon` được kết hợp với lớp giả {{cssxref(":open")}} — nhắm mục tiêu nút select chỉ khi trình chọn thả xuống đang mở — để cung cấp cho biểu tượng giá trị `rotate` là `180deg` khi `<select>` được mở.

```css live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render
select:open::picker-icon {
  rotate: 180deg;
}
```

Hãy xem công việc cho đến nay — lưu ý cách mũi tên trình chọn xoay mượt mà 180 độ khi `<select>` mở và đóng:

{{EmbedLiveSample("second-render", "100%", "250px")}}

## Tạo kiểu trình chọn thả xuống

Trình chọn thả xuống có thể được nhắm mục tiêu bằng phần tử giả {{cssxref("::picker()", "::picker(select)")}}. Như đã đề cập trước đó, trình chọn chứa mọi thứ bên trong phần tử `<select>` không phải là nút và `<selectedcontent>`. Trong ví dụ của chúng ta, điều này có nghĩa là tất cả các phần tử `<option>` và nội dung của chúng.

Đầu tiên, {{cssxref("border")}} đen mặc định của trình chọn được xóa:

```css live-sample___third-render live-sample___fourth-render live-sample___full-render
::picker(select) {
  border: none;
}
```

> [!NOTE]
> Đối số được truyền cho phần tử giả `::picker()` đại diện cho loại phần tử mà trình chọn bạn muốn nhắm mục tiêu — trong trường hợp này, các phần tử `<select>`. Nếu bạn muốn chọn trình chọn của một phần tử `<select>` cụ thể thay vì tất cả chúng, bạn có thể kết hợp phần tử giả `::picker()` với bộ chọn khác. Ví dụ, `<select>` của chúng ta có ID là `pet-select`, vì vậy trình chọn của nó có thể được nhắm mục tiêu độc quyền với `#pet-select::picker(select) { ... }`.

Bây giờ các phần tử `<option>` được tạo kiểu. Chúng được bố cục bằng [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), căn chỉnh tất cả chúng về đầu container flex và bao gồm một {{cssxref("gap")}} là `20px` giữa mỗi cái. Mỗi `<option>` cũng được cung cấp cùng {{cssxref("border")}}, {{cssxref("background")}}, {{cssxref("padding")}} và {{cssxref("transition")}} như `<select>`, để cung cấp giao diện và cảm giác nhất quán:

```css live-sample___third-render live-sample___fourth-render live-sample___full-render
option {
  display: flex;
  justify-content: flex-start;
  gap: 20px;

  border: 2px solid #dddddd;
  background: #eeeeee;
  padding: 10px;
  transition: 0.4s;
}
```

> [!NOTE]
> Các phần tử `<option>` của `<select>` có thể tùy chỉnh có `display: flex` được đặt trên chúng theo mặc định, nhưng nó được bao gồm trong bảng kiểu của chúng ta để làm rõ những gì đang xảy ra.

Tiếp theo, tổ hợp của các lớp giả {{cssxref(":first-of-type")}}, {{cssxref(":last-of-type")}} và {{cssxref(":not()")}} được sử dụng để đặt {{cssxref("border-radius")}} thích hợp trên các phần tử `<option>` trên và dưới cùng, và xóa {{cssxref("border-bottom")}} khỏi tất cả các phần tử `<option>` — ngoại trừ phần tử cuối cùng để các đường viền trông không lộn xộn và bị nhân đôi. Chúng ta cũng đặt cùng `border-radius` trên container `::picker(select)` bên ngoài để chúng ta không kết thúc với một hộp trắng hình vuông xấu xí xung quanh các tùy chọn nếu chúng ta quyết định đặt màu nền khác trên trang.

```css live-sample___third-render live-sample___fourth-render live-sample___full-render
option:first-of-type {
  border-radius: 8px 8px 0 0;
}

option:last-of-type {
  border-radius: 0 0 8px 8px;
}

::picker(select) {
  border-radius: 8px;
}

option:not(option:last-of-type) {
  border-bottom: none;
}
```

Tiếp theo, màu `background` khác được đặt trên các phần tử `<option>` số lẻ bằng cách sử dụng {{cssxref(":nth-of-type()", ":nth-of-type(odd)")}} để thực hiện kẻ sọc zebra, và màu `background` khác được đặt trên các phần tử `<option>` khi focus và hover, để cung cấp nổi bật thị giác hữu ích trong quá trình chọn:

```css live-sample___third-render live-sample___fourth-render live-sample___full-render
option:nth-of-type(odd) {
  background: white;
}

option:hover,
option:focus {
  background: plum;
}
```

Cuối cùng cho phần này, {{cssxref("font-size")}} lớn hơn được đặt trên các biểu tượng `<option>` (chứa trong các phần tử `<span>` với lớp `icon`) để làm cho chúng lớn hơn, và thuộc tính {{cssxref("text-box")}} được sử dụng để xóa một số khoảng cách khó chịu ở các cạnh block-start và block-end của emoji biểu tượng, làm cho chúng căn chỉnh tốt hơn với nhãn văn bản:

```css live-sample___third-render live-sample___fourth-render live-sample___full-render
option .icon {
  font-size: 1.6rem;
  text-box: trim-both cap alphabetic;
}
```

Ví dụ của chúng ta bây giờ hiển thị như sau:

{{EmbedLiveSample("third-render", "100%", "370px")}}

## Điều chỉnh kiểu dáng của nội dung tùy chọn được chọn bên trong nút select

Nếu bạn chọn bất kỳ tùy chọn thú cưng nào từ một vài ví dụ trực tiếp cuối cùng, bạn sẽ nhận thấy một vấn đề — các biểu tượng thú cưng khiến nút select tăng chiều cao, cũng thay đổi vị trí của biểu tượng trình chọn, và không có khoảng cách giữa biểu tượng tùy chọn và nhãn.

Điều này có thể được sửa bằng cách ẩn biểu tượng khi nó được chứa trong `<selectedcontent>`, đại diện cho nội dung của `<option>` được chọn khi chúng xuất hiện bên trong nút select. Trong ví dụ của chúng ta, nó được ẩn bằng cách sử dụng {{cssxref("display", "display: none")}}:

```css live-sample___fourth-render live-sample___full-render
selectedcontent .icon {
  display: none;
}
```

Điều này không ảnh hưởng đến tạo kiểu của nội dung `<option>` khi chúng xuất hiện bên trong trình chọn thả xuống.

## Tạo kiểu tùy chọn hiện đang được chọn

Để tạo kiểu cho `<option>` hiện đang được chọn khi nó xuất hiện bên trong trình chọn thả xuống, bạn có thể nhắm mục tiêu nó bằng lớp giả {{cssxref(":checked")}}. Điều này được sử dụng để đặt {{cssxref("font-weight")}} của phần tử `<option>` được chọn thành `bold`:

```css live-sample___fourth-render live-sample___full-render
option:checked {
  font-weight: bold;
}
```

## Tạo kiểu dấu kiểm tra lựa chọn hiện tại

Bạn có thể đã nhận thấy rằng khi bạn mở trình chọn để thực hiện lựa chọn, `<option>` hiện đang được chọn có dấu kiểm tra ở đầu nội tuyến của nó. Dấu kiểm tra này có thể được nhắm mục tiêu bằng phần tử giả {{cssxref("::checkmark")}}. Ví dụ, bạn có thể muốn ẩn dấu kiểm tra này (ví dụ, thông qua `display: none`).

Bạn cũng có thể chọn làm điều gì đó thú vị hơn với nó — trước đó các phần tử `<option>` được bố cục ngang bằng flexbox, với các flex item được căn chỉnh về đầu hàng. Trong quy tắc bên dưới, dấu kiểm tra được di chuyển từ đầu hàng đến cuối bằng cách đặt giá trị {{cssxref("order")}} lớn hơn `0` trên nó, và căn chỉnh nó về cuối hàng bằng cách sử dụng giá trị `auto` cho {{cssxref("margin-left")}} (xem [Căn chỉnh và lề tự động](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox#alignment_and_auto_margins)).

Cuối cùng, giá trị của thuộc tính {{cssxref("content")}} được đặt thành emoji khác, để đặt biểu tượng khác để hiển thị.

```css live-sample___fourth-render live-sample___full-render
option::checkmark {
  order: 1;
  margin-left: auto;
  content: "☑️";
}
```

> [!NOTE]
> Các phần tử giả `::checkmark` và `::picker-icon` không được bao gồm trong cây khả năng truy cập, vì vậy bất kỳ {{cssxref("content")}} được tạo nào được đặt trên chúng sẽ không được thông báo bởi các công nghệ hỗ trợ. Bạn vẫn nên đảm bảo rằng bất kỳ biểu tượng mới nào bạn đặt về mặt thị giác có ý nghĩa cho mục đích dự định của nó.

Hãy kiểm tra lại xem ví dụ đang hiển thị như thế nào. Trạng thái cập nhật sau ba phần cuối như sau:

{{EmbedLiveSample("fourth-render", "100%", "410px")}}

## Hoạt hình trình chọn sử dụng trạng thái popover

Phần tử `<select>` có thể tùy chỉnh của select `button` và trình chọn thả xuống được tự động cung cấp mối quan hệ invoker/popover, như được mô tả trong [Sử dụng API Popover](/en-US/docs/Web/API/Popover_API/Using). Có nhiều lợi thế mà điều này mang lại cho các phần tử `<select>`; ví dụ của chúng ta tận dụng khả năng hoạt hình giữa các trạng thái popover ẩn và hiện bằng cách sử dụng transitions. Lớp giả {{cssxref(":open")}} đại diện cho các phần tử select ở trạng thái mở.

Kỹ thuật này được đề cập nhanh trong phần này — hãy đọc [Hoạt hình popover](/en-US/docs/Web/API/Popover_API/Using#animating_popovers) để biết mô tả chi tiết hơn.

Đầu tiên, trình chọn được chọn bằng `::picker(select)`, và được cung cấp giá trị {{cssxref("opacity")}} là `0` và giá trị `transition` là `all 0.4s allow-discrete`. Điều này khiến tất cả các thuộc tính thay đổi giá trị khi trạng thái popover thay đổi từ ẩn sang hiện sẽ được hoạt hình.

```css live-sample___full-render
::picker(select) {
  opacity: 0;
  transition: all 0.4s allow-discrete;
}
```

Danh sách các thuộc tính được chuyển tiếp có `opacity`, tuy nhiên nó cũng bao gồm hai thuộc tính rời rạc mà giá trị của chúng được đặt bởi các kiểu mặc định của trình duyệt:

- {{cssxref("display")}}
  - : Giá trị `display` thay đổi từ `none` sang `block` khi popover thay đổi trạng thái từ ẩn sang hiện. Điều này cần được hoạt hình để đảm bảo rằng các chuyển tiếp khác có thể nhìn thấy.
- {{cssxref("overlay")}}
  - : Giá trị `overlay` thay đổi từ `none` sang `auto` khi popover thay đổi trạng thái từ ẩn sang hiện, để đưa nó lên {{glossary("top layer")}}, sau đó quay lại khi nó bị ẩn để xóa nó. Điều này cần được hoạt hình để đảm bảo rằng việc xóa popover khỏi top layer bị trì hoãn cho đến khi chuyển tiếp hoàn thành, đảm bảo chuyển tiếp có thể nhìn thấy.

> [!NOTE]
> Giá trị [`allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior#allow-discrete) cần thiết để bật hoạt hình thuộc tính rời rạc.

Tiếp theo, trình chọn được chọn ở trạng thái hiện bằng cách sử dụng `:open::picker(select)` và được cung cấp giá trị `opacity` là `1` — đây là trạng thái cuối của chuyển tiếp:

```css live-sample___full-render
:open::picker(select) {
  opacity: 1;
}
```

Cuối cùng, vì trình chọn đang được chuyển tiếp trong khi nó đang chuyển từ `display: none` sang giá trị `display` làm cho nó hiển thị, trạng thái bắt đầu của chuyển tiếp phải được chỉ định bên trong một khối {{cssxref("@starting-style")}}:

```css live-sample___full-render
@starting-style {
  :open::picker(select) {
    opacity: 0;
  }
}
```

Các quy tắc này hoạt động cùng nhau để làm cho trình chọn mờ dần vào và ra khi `<select>` được mở và đóng.

## Định vị trình chọn sử dụng định vị anchor

Phần tử `<select>` có thể tùy chỉnh của nút select và trình chọn thả xuống có tham chiếu anchor ngầm định, và trình chọn được tự động liên kết với nút select thông qua [định vị anchor CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning). Điều này có nghĩa là một mối quan hệ rõ ràng không cần được tạo bằng cách sử dụng các thuộc tính {{cssxref("anchor-name")}} và {{cssxref("position-anchor")}}.

Ngoài ra, [các kiểu mặc định của trình duyệt cung cấp vị trí mặc định](/en-US/docs/Web/CSS/Reference/Selectors/::picker#picker_anchor_positioning), mà bạn có thể tùy chỉnh như được giải thích trong [Định vị phần tử tương đối với anchor của chúng](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#positioning_elements_relative_to_their_anchor).

Trong demo của chúng ta, vị trí của trình chọn được đặt tương đối với anchor của nó bằng cách sử dụng hàm {{cssxref("anchor()")}} bên trong các giá trị thuộc tính {{cssxref("top")}} và {{cssxref("left")}}:

```css live-sample___full-render
::picker(select) {
  top: calc(anchor(bottom) + 1px);
  left: anchor(10%);
}
```

Điều này dẫn đến cạnh trên của trình chọn luôn được định vị 1 pixel bên dưới cạnh dưới của nút select, và cạnh trái của trình chọn luôn được định vị `10%` của chiều rộng nút select từ cạnh trái của nó.

> [!NOTE]
> Nếu bạn muốn xóa tham chiếu anchor ngầm định để ngăn trình chọn được anchored vào phần tử `<select>`, bạn có thể làm điều đó bằng cách đặt thuộc tính `position-anchor` của trình chọn thành tên anchor không tồn tại trong tài liệu hiện tại, chẳng hạn như `--not-an-anchor-name`. Xem thêm [xóa mối quan hệ anchor](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#removing_an_anchor_association).

## Kết quả cuối cùng của ví dụ chính

Sau hai phần cuối, trạng thái cập nhật cuối cùng của `<select>` của chúng ta được hiển thị như sau:

{{EmbedLiveSample("full-render", "100%", "410px")}}

## Tạo kiểu các phần tử optgroup

Tạo kiểu mặc định của các phần tử {{htmlelement("optgroup")}} trong các select có thể tùy chỉnh giống như trong các phần tử `<select>` cổ điển — in đậm và thụt lề ít hơn các tùy chọn chứa. Tuy nhiên, trong các select có thể tùy chỉnh, các nhóm tùy chọn hoạt động giống như bất kỳ container cấp khối nào khác, và có thể được tạo kiểu như vậy. Ngoài ra, phần tử {{htmlelement("legend")}} được phép là con của `<optgroup>`, để cung cấp nhãn dễ nhắm mục tiêu và tạo kiểu. Điều này thay thế bất kỳ văn bản nào được đặt trong thuộc tính `label` của phần tử `<optgroup>`, và nó có cùng ngữ nghĩa.

Hãy xem một ví dụ cơ bản. HTML của chúng ta trông như thế này:

```html live-sample___optgroup-example
<label for="animal-select">Select animal:</label><br />
<select id="animal-select">
  <optgroup>
    <legend>Domestic</legend>
    <option value="cat">Cat</option>
    <option value="dog">Dog</option>
    <option value="guinea">Guinea pig</option>
  </optgroup>
  <optgroup>
    <legend>Farm</legend>
    <option value="chicken">Chicken</option>
    <option value="cow">Cow</option>
    <option value="pig">Pig</option>
  </optgroup>
</select>
```

Chúng ta bắt đầu CSS bằng cách tạo kiểu cho các phần tử `<optgroup>` chính. Đây là các kiểu cơ bản để làm cho các phần tử optgroup trông giống như các container cho các phần tử `<option>` con của chúng. Chúng ta đã cung cấp cho chúng một số `margin-top` để đặt khoảng cách giữa mỗi optgroup, và giữa optgroup trên cùng và nút select.

```css hidden live-sample___optgroup-example
* {
  box-sizing: border-box;
}

html {
  font-family: Arial, Helvetica, sans-serif;
}

select,
::picker(select) {
  appearance: base-select;
  width: 200px;
}

select {
  border: 2px solid #ddd;
  background: #eee;
  padding: 10px;
}

::picker(select) {
  border: none;
}
```

```css live-sample___optgroup-example
optgroup {
  border: 2px solid #ddd;
  border-radius: 8px;
  background: #eee;
  padding: 10px 0 0 0;
  margin-top: 5px;
}
```

Tiếp theo, chúng ta tạo kiểu cho các phần tử `<legend>`, căn chỉnh văn bản ở giữa và bao gồm một số lề để tách chúng khỏi các tùy chọn.

```css live-sample___optgroup-example
optgroup legend {
  text-align: center;
  margin-bottom: 10px;
}
```

Cuối cùng, chúng ta tạo kiểu cho các phần tử `<option>`, cung cấp màu {{cssxref("background")}} và một số {{cssxref("padding")}} và tạo kiểu cho {{cssxref("border-radius")}} dưới cùng của `<option>` cuối cùng trong mỗi trường hợp để nó phù hợp với các góc bo tròn của `<optgroup>` cha mẹ. Chúng ta cũng thực hiện kẻ sọc zebra bằng cách cung cấp cho các phần tử `<option>` số lẻ màu nền khác nhau, và cung cấp trạng thái hover và focus tùy chọn riêng biệt.

```css live-sample___optgroup-example
option {
  background: #eee;
  padding: 10px;
}

option:last-of-type {
  border-radius: 0 0 8px 8px;
}

option:nth-of-type(odd) {
  background: #fff;
}

option:hover,
option:focus {
  background: plum;
}
```

Chúng ta đã ẩn phần còn lại của các kiểu để ngắn gọn.

Ví dụ hiển thị như thế này:

{{EmbedLiveSample("optgroup-example", "100%", "410px")}}

```css hidden live-sample___plain-render live-sample___second-render live-sample___third-render live-sample___fourth-render live-sample___full-render live-sample___optgroup-example
@supports not (appearance: base-select) {
  body::before {
    content: "Your browser does not support `appearance: base-select`.";
    color: black;
    background-color: wheat;
    position: fixed;
    left: 0;
    right: 0;
    top: 40%;
    text-align: center;
    padding: 1rem 0;
    z-index: 1;
  }
}
```

## Tương thích trình duyệt

{{Compat}}

## Tiếp theo

Trong bài viết tiếp theo của mô-đun này, chúng ta sẽ cho bạn thấy cách tạo kiểu [Hộp danh sách select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select_listboxes).

## Xem thêm

- {{htmlelement("select")}}, {{htmlelement("option")}}, {{htmlelement("optgroup")}}, {{htmlelement("label")}}, {{htmlelement("button")}}, {{htmlelement("selectedcontent")}}
- {{cssxref("appearance")}}
- {{cssxref("::picker()", "::picker(select)")}}, {{cssxref("::picker-icon")}}, {{cssxref("::checkmark")}}
- {{cssxref(":open")}}, {{cssxref(":checked")}}

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Advanced_form_styling", "Learn_web_development/Extensions/Forms/Customizable_select_listboxes", "Learn_web_development/Extensions/Forms")}}
