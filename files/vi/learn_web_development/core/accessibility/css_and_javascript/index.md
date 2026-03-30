---
title: Thực hành tốt nhất về khả năng tiếp cận với CSS và JavaScript
short-title: CSS và JS dễ tiếp cận
slug: Learn_web_development/Core/Accessibility/CSS_and_JavaScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Test_your_skills/HTML","Learn_web_development/Core/Accessibility/Test_your_skills/CSS_and_JavaScript", "Learn_web_development/Core/Accessibility")}}

CSS và JavaScript, khi được sử dụng đúng cách, cũng có tiềm năng cho phép trải nghiệm web dễ tiếp cận, hoặc chúng có thể gây hại đáng kể cho khả năng tiếp cận nếu bị lạm dụng. Bài viết này phác thảo một số thực hành tốt nhất về CSS và JavaScript cần được xem xét để đảm bảo ngay cả nội dung phức tạp cũng dễ tiếp cận nhất có thể.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, <a href="/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility">hiểu biết cơ bản về các khái niệm khả năng tiếp cận</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Kích thước văn bản và bố cục dễ tiếp cận.</li>
          <li>Độ tương phản màu sắc.</li>
          <li>Tầm quan trọng của kiểu dáng <code>:focus</code> và <code>:hover</code>.</li>
          <li>Sử dụng hoạt ảnh hợp lý — sử dụng hoạt ảnh tinh tế và cung cấp điều khiển để tắt nó.</li>
          <li>Thực hành tốt nhất để ẩn nội dung sao cho nó không trở nên không thể truy cập.</li>
          <li>Có thứ như quá nhiều JavaScript và giá trị của JavaScript không xâm phạm.</li>
          <li>Sử dụng sự kiện hợp lý để bạn không khóa các loại điều khiển cụ thể.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## CSS và JavaScript có thể tiếp cận được không?

CSS và JavaScript không có tầm quan trọng ngay lập tức giống như HTML đối với khả năng tiếp cận, nhưng chúng vẫn có thể giúp hoặc làm hỏng khả năng tiếp cận, tùy thuộc vào cách chúng được sử dụng. Nói cách khác, điều quan trọng là bạn cần xem xét một số lời khuyên thực hành tốt nhất để đảm bảo rằng việc sử dụng CSS và JavaScript không làm hỏng khả năng tiếp cận của tài liệu của bạn.

## CSS

Hãy bắt đầu bằng cách xem CSS.

### Ngữ nghĩa đúng và kỳ vọng người dùng

Có thể sử dụng CSS để làm cho bất kỳ phần tử HTML nào trông giống _bất cứ thứ gì_, nhưng điều này không có nghĩa là bạn nên làm vậy. Như chúng ta thường đề cập trong bài viết [HTML: Nền tảng tốt cho khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/HTML), bạn nên sử dụng phần tử ngữ nghĩa phù hợp cho công việc, bất cứ khi nào có thể. Nếu bạn không làm vậy, nó có thể gây nhầm lẫn và vấn đề khả năng sử dụng cho mọi người, nhưng đặc biệt là người dùng khuyết tật. Sử dụng ngữ nghĩa đúng có liên quan nhiều đến kỳ vọng người dùng — các phần tử trông và hoạt động theo những cách nhất định, theo chức năng của chúng, và những quy ước phổ biến này được mong đợi bởi người dùng.

Ví dụ, người dùng trình đọc màn hình không thể điều hướng trang qua các phần tử tiêu đề nếu nhà phát triển không sử dụng các phần tử tiêu đề phù hợp để đánh dấu nội dung. Theo cùng cách đó, tiêu đề mất mục đích trực quan của nó nếu bạn tạo kiểu cho nó sao cho nó không trông giống như tiêu đề.

Điểm mấu chốt là bạn có thể cập nhật kiểu dáng của tính năng trang để phù hợp với thiết kế của bạn, nhưng đừng thay đổi nó đến mức nó không còn trông hoặc hoạt động như mong đợi nữa. Các phần sau đây tóm tắt các tính năng HTML chính cần xem xét.

#### Cấu trúc nội dung văn bản "tiêu chuẩn"

Tiêu đề, đoạn văn, danh sách — nội dung văn bản cốt lõi của trang của bạn:

```html
<h1>Tiêu đề</h1>

<p>Đoạn văn</p>

<ul>
  <li>Danh sách của tôi</li>
  <li>có hai mục.</li>
</ul>
```

Một số CSS điển hình có thể trông như thế này:

```css
h1 {
  font-size: 5rem;
}

p,
li {
  line-height: 1.5;
  font-size: 1.6rem;
}
```

Bạn nên:

- Chọn kích thước phông chữ, chiều cao dòng, khoảng cách chữ, v.v. hợp lý để làm cho văn bản của bạn hợp lý, dễ đọc và thoải mái để đọc.
- Đảm bảo tiêu đề của bạn nổi bật từ văn bản nội dung, thường là to và đậm như kiểu dáng mặc định. Danh sách của bạn nên trông như danh sách.
- Màu văn bản của bạn nên tương phản tốt với màu nền của bạn.

Xem [Tiêu đề và đoạn văn trong HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs) và [Kiểu dáng văn bản CSS](/en-US/docs/Learn_web_development/Core/Text_styling) để biết thêm thông tin.

#### Văn bản được nhấn mạnh

Đánh dấu nội tuyến truyền tải sự nhấn mạnh cụ thể cho văn bản mà nó bao bọc:

```html
<p>Nước rất <em>nóng</em>.</p>

<p>Các giọt nước tích tụ trên bề mặt được gọi là <strong>ngưng tụ</strong>.</p>
```

Bạn có thể muốn thêm một số màu đơn giản cho văn bản được nhấn mạnh:

```css
strong,
em {
  color: #a60000;
}
```

Tuy nhiên, bạn sẽ hiếm khi cần tạo kiểu cho các phần tử nhấn mạnh theo bất kỳ cách đáng kể nào. Các quy ước tiêu chuẩn của văn bản in đậm và in nghiêng rất dễ nhận biết và thay đổi kiểu dáng có thể gây nhầm lẫn. Để biết thêm về nhấn mạnh, xem [Nhấn mạnh và tầm quan trọng](/en-US/docs/Learn_web_development/Core/Structuring_content/Emphasis_and_importance).

#### Từ viết tắt

Một phần tử cho phép từ viết tắt, từ viết tắt, hoặc từ viết tắt khởi tạo được liên kết với phần mở rộng của nó:

```html
<p>
  Nội dung web được đánh dấu bằng Ngôn ngữ đánh dấu siêu văn bản, hay
  <abbr>HTML</abbr>.
</p>
```

Một lần nữa, bạn có thể muốn tạo kiểu cho nó theo cách đơn giản:

```css
abbr {
  color: #a60000;
}
```

Quy ước kiểu dáng được công nhận cho từ viết tắt là gạch chân chấm, và không khôn ngoan khi lệch đáng kể so với điều này. Để biết thêm về từ viết tắt, xem [Từ viết tắt](/en-US/docs/Learn_web_development/Core/Structuring_content/Advanced_text_features#abbreviations).

#### Liên kết

Siêu liên kết — cách bạn đến những nơi mới trên web:

```html
<p>Truy cập <a href="https://www.mozilla.org">Trang chủ Mozilla</a>.</p>
```

Một số kiểu dáng liên kết rất đơn giản được hiển thị bên dưới:

```css
a {
  color: red;
}

a:hover,
a:visited,
a:focus {
  color: #a60000;
  text-decoration: none;
}

a:active {
  color: black;
  background-color: #a60000;
}
```

Các quy ước liên kết tiêu chuẩn là gạch chân và màu khác (mặc định: màu xanh lam) ở trạng thái bình thường, một biến thể màu khác khi liên kết đã được truy cập trước đó (mặc định: màu tím), và một màu khác khi liên kết được kích hoạt (mặc định: màu đỏ). Ngoài ra, con trỏ chuột thay đổi thành biểu tượng con trỏ khi di chuột qua liên kết, và liên kết nhận được điểm sáng khi được tập trung (ví dụ qua tabbing) hoặc được kích hoạt. Hình ảnh sau đây hiển thị điểm sáng trong cả Firefox (đường viền chấm) và Chrome (đường viền màu xanh lam):

![Ảnh chụp màn hình danh sách liên kết trong trình duyệt Firefox. Danh sách chứa 4 mục. Mục danh sách thứ hai được tô sáng bằng đường viền chấm màu xanh lam khi nó được tập trung qua tabbing.](focus-highlight-firefox.png)

![Ảnh chụp màn hình danh sách liên kết trong trình duyệt Chrome. Danh sách chứa 4 mục. Mục danh sách thứ ba được tô sáng bằng đường viền màu xanh lam khi nó được tập trung qua tabbing.](focus-highlight-chrome.png)

Bạn có thể sáng tạo với kiểu dáng liên kết, miễn là bạn tiếp tục cung cấp phản hồi cho người dùng khi họ tương tác với liên kết. Điều gì đó chắc chắn nên xảy ra khi trạng thái thay đổi, và bạn không nên loại bỏ con trỏ hoặc đường viền — cả hai đều là hỗ trợ khả năng tiếp cận rất quan trọng cho những người sử dụng điều khiển bàn phím.

#### Phần tử biểu mẫu

Các phần tử cho phép người dùng nhập dữ liệu vào trang web:

```html
<div>
  <label for="name">Nhập tên của bạn</label>
  <input type="text" id="name" name="name" />
</div>
```

Bạn có thể thấy một số ví dụ CSS tốt trong ví dụ [form-css.html](https://github.com/mdn/learning-area/blob/main/accessibility/css/form-css.html) của chúng tôi ([xem trực tiếp](https://mdn.github.io/learning-area/accessibility/css/form-css.html) cũng).

Phần lớn CSS bạn viết cho biểu mẫu sẽ dành cho kích thước các phần tử, căn chỉnh nhãn và đầu vào, và làm cho chúng trông gọn gàng và ngăn nắp.

Tuy nhiên, bạn không nên lệch quá nhiều so với phản hồi trực quan mong đợi mà các phần tử biểu mẫu nhận khi chúng được tập trung, về cơ bản giống như liên kết (xem ở trên). Bạn có thể tạo kiểu cho trạng thái tiêu điểm/di chuột của biểu mẫu để làm cho hành vi này nhất quán hơn giữa các trình duyệt hoặc phù hợp hơn với thiết kế trang của bạn, nhưng đừng loại bỏ nó hoàn toàn — một lần nữa, mọi người phụ thuộc vào những manh mối này để giúp họ biết điều gì đang xảy ra.

#### Bảng

Bảng để trình bày dữ liệu bảng.

Bạn có thể thấy một ví dụ tốt, đơn giản về HTML và CSS bảng trong ví dụ [table-css.html](https://github.com/mdn/learning-area/blob/main/accessibility/css/table-css.html) của chúng tôi ([xem trực tiếp cũng](https://mdn.github.io/learning-area/accessibility/css/table-css.html)).

CSS bảng nói chung phục vụ để làm cho bảng phù hợp hơn với thiết kế của bạn và trông ít xấu hơn. Thật tốt khi đảm bảo tiêu đề bảng nổi bật (thường sử dụng in đậm), và sử dụng dải zebra để làm cho các hàng khác nhau dễ phân tích hơn.

### Màu sắc và độ tương phản màu sắc

Khi chọn bảng màu cho trang web của bạn, hãy đảm bảo rằng màu văn bản (nền trước) tương phản tốt với màu nền. Thiết kế của bạn có thể trông đẹp, nhưng nó không tốt nếu người bị suy giảm thị giác như mù màu không thể đọc nội dung của bạn.

Có một cách dễ dàng để kiểm tra xem độ tương phản của bạn có đủ lớn để không gây vấn đề không. Có một số công cụ kiểm tra độ tương phản trực tuyến mà bạn có thể nhập màu nền trước và màu nền của mình, để kiểm tra chúng. Ví dụ [Công cụ kiểm tra độ tương phản màu sắc](https://webaim.org/resources/contrastchecker/) của WebAIM dễ sử dụng và cung cấp giải thích về những gì bạn cần để tuân thủ tiêu chí WCAG về độ tương phản màu sắc.

> [!NOTE]
> Tỷ lệ tương phản cao cũng sẽ cho phép bất kỳ ai sử dụng điện thoại thông minh hoặc máy tính bảng với màn hình bóng đọc trang tốt hơn khi ở môi trường sáng, chẳng hạn như ánh sáng mặt trời.

Một mẹo khác là không chỉ dựa vào màu sắc cho biển chỉ dẫn/thông tin, vì điều này sẽ không tốt cho những người không thể nhìn thấy màu sắc. Thay vì đánh dấu các trường biểu mẫu bắt buộc bằng màu đỏ, hãy đánh dấu chúng bằng dấu hoa thị và màu đỏ.

### Ẩn mọi thứ

Có nhiều trường hợp thiết kế trực quan sẽ yêu cầu không phải tất cả nội dung được hiển thị cùng một lúc. Ví dụ, trong [ví dụ hộp thông tin có tab](https://mdn.github.io/learning-area/css/css-layout/practical-positioning-examples/tabbed-info-box.html) của chúng tôi (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/css/css-layout/practical-positioning-examples/tabbed-info-box.html)) chúng tôi có ba bảng thông tin, nhưng chúng tôi đang [định vị](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning) chúng lên nhau và cung cấp các tab có thể nhấp để hiển thị từng cái (nó cũng có thể truy cập bằng bàn phím — bạn có thể sử dụng Tab và Enter/Return để chọn chúng).

![Giao diện ba tab với Tab 1 được chọn và chỉ hiển thị nội dung của nó. Nội dung của các tab khác bị ẩn. Nếu tab được chọn, màu văn bản của nó thay đổi từ đen thành trắng và màu nền thay đổi từ cam-đỏ thành nâu yên.](tabbed-info-box.png)

Người dùng trình đọc màn hình không quan tâm đến điều này — họ vui với nội dung miễn là thứ tự nguồn có ý nghĩa, và họ có thể truy cập tất cả. Định vị tuyệt đối (như được sử dụng trong ví dụ này) thường được coi là một trong những cơ chế tốt nhất để ẩn nội dung cho hiệu ứng trực quan vì nó không ngăn trình đọc màn hình truy cập nó.

Mặt khác, bạn không nên sử dụng {{cssxref("visibility", "visibility: hidden")}} hoặc {{cssxref("display", "display: none")}}, vì chúng ẩn nội dung khỏi trình đọc màn hình. Trừ khi, tất nhiên, có lý do chính đáng tại sao bạn muốn nội dung này bị ẩn khỏi trình đọc màn hình.

> [!NOTE]
> [Nội dung vô hình chỉ dành cho người dùng trình đọc màn hình](https://webaim.org/techniques/css/invisiblecontent/) có nhiều chi tiết hữu ích xung quanh chủ đề này.

### Chấp nhận rằng người dùng có thể ghi đè kiểu dáng

Người dùng có thể ghi đè kiểu dáng của bạn bằng kiểu dáng tùy chỉnh của riêng họ, ví dụ:

- Xem [Cách sử dụng bảng kiểu tùy chỉnh (CSS) với Firefox](https://www.itsupportguides.com/knowledge-base/computer-accessibility/how-to-use-a-custom-style-sheet-css-with-firefox/) của Sarah Maddox để biết hướng dẫn hữu ích về cách thực hiện thủ công trong Firefox.
- Có lẽ dễ dàng hơn khi sử dụng tiện ích mở rộng. Ví dụ, tiện ích mở rộng Stylus có sẵn cho [Firefox](https://addons.mozilla.org/en-US/firefox/addon/styl-us/), với Stylish là tương đương [Chrome](https://chromewebstore.google.com/detail/stylish-custom-themes-for/fjnbnpbmkenffdnngjfgmeleoegfcffe).

Người dùng có thể làm điều này vì nhiều lý do. Người dùng khiếm thị có thể muốn làm cho văn bản lớn hơn trên tất cả các trang web họ truy cập, hoặc người dùng bị thiếu màu nghiêm trọng có thể muốn đặt tất cả trang web ở màu tương phản cao mà họ dễ nhìn. Bất kể nhu cầu là gì, bạn nên thoải mái với điều này và làm cho thiết kế của bạn đủ linh hoạt sao cho những thay đổi như vậy sẽ hoạt động trong thiết kế của bạn. Ví dụ, bạn có thể muốn đảm bảo khu vực nội dung chính của bạn có thể xử lý văn bản lớn hơn (có lẽ nó sẽ bắt đầu cuộn để cho phép tất cả được nhìn thấy), và sẽ không chỉ ẩn nó hoặc phá vỡ hoàn toàn.

## JavaScript

JavaScript cũng có thể làm hỏng khả năng tiếp cận, tùy thuộc vào cách nó được sử dụng.

JavaScript hiện đại là một ngôn ngữ mạnh mẽ, và chúng ta có thể làm rất nhiều với nó những ngày này, từ cập nhật nội dung và UI đơn giản đến trò chơi 2D và 3D đầy đủ tính năng. Không có quy tắc nào nói rằng tất cả nội dung phải 100% dễ tiếp cận với tất cả mọi người — bạn chỉ cần làm những gì bạn có thể và làm cho ứng dụng của mình dễ tiếp cận nhất có thể.

Nội dung và chức năng đơn giản được lập luận là dễ dàng để làm cho dễ tiếp cận — ví dụ văn bản, hình ảnh, bảng, biểu mẫu và nút nhấn kích hoạt các chức năng. Như chúng ta đã xem trong bài viết [HTML: Nền tảng tốt cho khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/HTML) của mình, những cân nhắc chính là:

- Ngữ nghĩa tốt: Sử dụng phần tử đúng cho công việc đúng. Ví dụ, đảm bảo bạn sử dụng tiêu đề và đoạn văn, và các phần tử {{htmlelement("button")}} và {{htmlelement("a")}}
- Đảm bảo nội dung có sẵn dưới dạng văn bản, hoặc trực tiếp dưới dạng nội dung văn bản, nhãn văn bản tốt cho các phần tử biểu mẫu, hoặc [văn bản thay thế](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives), ví dụ alt text cho hình ảnh.

Chúng ta cũng đã xem ví dụ về cách sử dụng JavaScript để xây dựng chức năng khi nó còn thiếu — xem [Xây dựng lại khả năng tiếp cận bàn phím](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#building_keyboard_accessibility_back_in). Đây không phải là lý tưởng — thực sự bạn nên chỉ sử dụng phần tử đúng cho công việc đúng — nhưng nó cho thấy rằng điều đó có thể trong các tình huống mà vì lý do nào đó bạn không thể kiểm soát đánh dấu được sử dụng. Một cách khác để cải thiện khả năng tiếp cận cho các widget JavaScript không ngữ nghĩa là sử dụng WAI-ARIA để cung cấp ngữ nghĩa bổ sung cho người dùng trình đọc màn hình. Bài viết tiếp theo cũng sẽ đề cập đến điều này chi tiết.

Các chức năng phức tạp như trò chơi 3D không dễ dàng để làm dễ tiếp cận — một trò chơi 3D phức tạp được tạo bằng [WebGL](/en-US/docs/Web/API/WebGL_API) sẽ được hiển thị trên phần tử {{htmlelement("canvas")}}, hiện tại không có cơ sở để cung cấp alt text hoặc thông tin khác cho người dùng khiếm thị nặng để sử dụng. Có thể lập luận rằng trò chơi như vậy không thực sự có nhóm người này là một phần của đối tượng mục tiêu chính của nó, và sẽ không hợp lý khi mong đợi bạn làm cho nó 100% dễ tiếp cận với người mù. Tuy nhiên, bạn có thể triển khai [điều khiển bàn phím](/en-US/docs/Games/Techniques/Control_mechanisms/Desktop_with_mouse_and_keyboard) để nó có thể sử dụng được bởi người không dùng chuột, và làm cho sơ đồ màu đủ tương phản để có thể sử dụng bởi những người bị thiếu màu.

### Vấn đề với quá nhiều JavaScript

Vấn đề thường nảy sinh khi mọi người dựa vào JavaScript quá nhiều. Đôi khi bạn sẽ thấy trang web mà mọi thứ đều được thực hiện với JavaScript — HTML được tạo bởi JavaScript, CSS được tạo bởi JavaScript, v.v. Điều này có tất cả các loại vấn đề về khả năng tiếp cận và các vấn đề khác liên quan đến nó, vì vậy nó không được khuyến nghị.

Cũng như sử dụng phần tử đúng cho công việc đúng, bạn cũng nên đảm bảo bạn đang sử dụng công nghệ đúng cho công việc đúng! Hãy suy nghĩ cẩn thận về việc bạn có cần hộp thông tin 3D bóng bẩy được hỗ trợ bởi JavaScript đó không, hay liệu văn bản cũ đơn giản sẽ làm được không. Hãy suy nghĩ cẩn thận về việc bạn có cần widget biểu mẫu phi tiêu chuẩn phức tạp không, hay liệu đầu vào văn bản sẽ làm được không. Và đừng tạo tất cả nội dung HTML của bạn bằng JavaScript nếu có thể.

### Giữ nó không xâm phạm

Bạn nên giữ **JavaScript không xâm phạm** trong đầu khi tạo nội dung. Ý tưởng của JavaScript không xâm phạm là nó nên được sử dụng bất cứ khi nào có thể để nâng cao chức năng, không phải xây dựng nó hoàn toàn — các chức năng cơ bản nên lý tưởng là hoạt động mà không cần JavaScript, mặc dù đánh giá rằng điều này không phải lúc nào cũng là một lựa chọn. Nhưng một lần nữa, một phần lớn của nó là sử dụng chức năng trình duyệt tích hợp sẵn khi có thể.

Ví dụ sử dụng JavaScript không xâm phạm tốt bao gồm:

- Cung cấp xác thực biểu mẫu phía máy khách, cảnh báo người dùng về các vấn đề với mục nhập biểu mẫu của họ nhanh chóng, mà không cần đợi máy chủ kiểm tra dữ liệu. Nếu không có, biểu mẫu vẫn sẽ hoạt động, nhưng xác thực có thể chậm hơn.
- Cung cấp điều khiển tùy chỉnh cho HTML `<video>` có thể truy cập được bởi người dùng chỉ dùng bàn phím, cùng với liên kết trực tiếp đến video có thể được sử dụng để truy cập nó nếu JavaScript không có sẵn (điều khiển trình duyệt `<video>` mặc định không thể truy cập bằng bàn phím trong hầu hết các trình duyệt).

Ví dụ, chúng tôi đã viết một ví dụ xác thực biểu mẫu phía máy khách nhanh chóng — xem [form-validation.html](https://github.com/mdn/learning-area/blob/main/accessibility/css/form-validation.html) (cũng [xem bản demo trực tiếp](https://mdn.github.io/learning-area/accessibility/css/form-validation.html)). Ở đây bạn sẽ thấy một biểu mẫu đơn giản; khi bạn cố gắng gửi biểu mẫu với một hoặc cả hai trường để trống, việc gửi thất bại và hộp thông báo lỗi xuất hiện để cho bạn biết điều gì sai.

Loại xác thực biểu mẫu này là không xâm phạm — bạn vẫn có thể sử dụng biểu mẫu hoàn toàn tốt mà không cần JavaScript có sẵn, và bất kỳ triển khai biểu mẫu hợp lý nào cũng sẽ có xác thực phía máy chủ hoạt động, vì quá dễ để người dùng độc hại bỏ qua xác thực phía máy khách (ví dụ bằng cách tắt JavaScript trong trình duyệt). Xác thực phía máy khách vẫn thực sự hữu ích để báo cáo lỗi — người dùng có thể biết về lỗi họ mắc ngay lập tức, thay vì phải đợi một chuyến đi vòng đến máy chủ và tải lại trang. Đây là lợi thế khả năng sử dụng rõ ràng.

> [!NOTE]
> Xác thực phía máy chủ chưa được triển khai trong bản demo đơn giản này.

Chúng tôi cũng đã làm cho xác thực biểu mẫu này khá dễ tiếp cận. Chúng tôi đã sử dụng các phần tử {{htmlelement("label")}} để đảm bảo nhãn biểu mẫu được liên kết rõ ràng với đầu vào của chúng, để trình đọc màn hình có thể đọc chúng cùng nhau:

```html
<label for="name">Nhập tên của bạn:</label>
<input type="text" name="name" id="name" />
```

Chúng tôi chỉ thực hiện xác thực khi biểu mẫu được gửi — điều này là để chúng tôi không cập nhật UI quá thường xuyên và có thể gây nhầm lẫn cho người dùng trình đọc màn hình (và có thể người dùng khác):

```js
form.onsubmit = validate;

function validate(e) {
  errorList.textContent = "";
  for (const testItem of formItems) {
    if (testItem.input.value === "") {
      errorField.style.left = "360px";
      createLink(testItem);
    }
  }

  if (errorList.hasChildNodes()) {
    e.preventDefault();
  }
}
```

> [!NOTE]
> Trong ví dụ này, chúng tôi đang ẩn và hiển thị hộp thông báo lỗi bằng cách sử dụng định vị tuyệt đối thay vì phương pháp khác như visibility hoặc display, vì nó không can thiệp vào trình đọc màn hình có thể đọc nội dung từ nó.

Xác thực biểu mẫu thực sẽ phức tạp hơn điều này — bạn sẽ muốn kiểm tra rằng tên được nhập thực sự trông giống như tên, tuổi được nhập thực sự là số và thực tế (ví dụ không âm và ít hơn 4 chữ số). Ở đây chúng tôi chỉ triển khai kiểm tra đơn giản rằng giá trị đã được điền vào mỗi trường đầu vào (`if (testItem.input.value === '')`).

Khi xác thực đã được thực hiện, nếu các bài kiểm tra vượt qua thì biểu mẫu được gửi. Nếu có lỗi (`if (errorList.hasChildNodes())`) thì chúng tôi dừng gửi biểu mẫu (sử dụng [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault)), và hiển thị bất kỳ thông báo lỗi nào đã được tạo (xem bên dưới). Cơ chế này có nghĩa là lỗi chỉ được hiển thị nếu có lỗi, điều này tốt hơn cho khả năng sử dụng.

Đối với mỗi đầu vào không có giá trị điền vào khi biểu mẫu được gửi, chúng tôi tạo một mục danh sách với liên kết và chèn nó vào `errorList`.

```js
function createLink(testItem) {
  const listItem = document.createElement("li");
  const anchor = document.createElement("a");

  const name = testItem.input.name;
  anchor.textContent = `Trường ${name} trống: điền ${name} của bạn vào.`;
  anchor.href = `#${name}`;
  listItem.appendChild(anchor);
  errorList.appendChild(listItem);
}
```

Mỗi liên kết phục vụ mục đích kép — nó cho bạn biết lỗi là gì, cộng với bạn có thể nhấp vào nó/kích hoạt nó để nhảy thẳng đến phần tử đầu vào trong câu hỏi và sửa mục nhập của bạn.

Ngoài ra, `errorField` được đặt ở đầu thứ tự nguồn (mặc dù nó được định vị khác nhau trong UI bằng CSS), có nghĩa là người dùng có thể tìm hiểu chính xác điều gì sai với việc gửi biểu mẫu của họ và đến các phần tử đầu vào trong câu hỏi bằng cách quay lên đầu trang.

Như ghi chú cuối cùng, chúng tôi đã sử dụng một số thuộc tính WAI-ARIA trong bản demo của mình để giúp giải quyết các vấn đề khả năng tiếp cận gây ra bởi các vùng nội dung liên tục cập nhật mà không tải lại trang (trình đọc màn hình sẽ không phát hiện điều này hoặc cảnh báo người dùng về nó theo mặc định):

```html
<div class="errors" role="alert" aria-relevant="all">
  <ul></ul>
</div>
```

Chúng tôi sẽ giải thích các thuộc tính này trong bài viết tiếp theo, bao gồm [WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics) chi tiết hơn nhiều.

> [!NOTE]
> Một số bạn có thể đang nghĩ về thực tế là biểu mẫu HTML có cơ chế xác thực tích hợp như thuộc tính `required`, `min`/`minlength`, và `max`/`maxlength` (xem tài liệu tham khảo phần tử {{htmlelement("input")}} để biết thêm thông tin). Chúng tôi không sử dụng những thứ này trong bản demo vì hỗ trợ trình duyệt chéo cho chúng không đồng đều (ví dụ IE10 và trên chỉ).

> [!NOTE]
> [Xác thực biểu mẫu có thể sử dụng và dễ tiếp cận và Khôi phục lỗi](https://webaim.org/techniques/formvalidation/) của WebAIM cung cấp thêm thông tin hữu ích về xác thực biểu mẫu dễ tiếp cận.

### Các mối lo ngại về khả năng tiếp cận JavaScript khác

Có những thứ khác cần lưu ý khi triển khai JavaScript và suy nghĩ về khả năng tiếp cận. Chúng tôi sẽ thêm nhiều hơn khi chúng tôi tìm thấy chúng.

#### Sự kiện dành riêng cho chuột

Như bạn biết, hầu hết các tương tác người dùng được triển khai trong JavaScript phía máy khách bằng cách sử dụng các trình xử lý sự kiện, cho phép chúng tôi chạy các chức năng để đáp lại các sự kiện nhất định xảy ra. Một số sự kiện có thể có vấn đề về khả năng tiếp cận. Ví dụ chính bạn sẽ gặp là các sự kiện dành riêng cho chuột như [mouseover](/en-US/docs/Web/API/Element/mouseover_event), [mouseout](/en-US/docs/Web/API/Element/mouseout_event), [dblclick](/en-US/docs/Web/API/Element/dblclick_event), v.v. Chức năng chạy để đáp lại các sự kiện này sẽ không thể truy cập bằng các cơ chế khác, như điều khiển bàn phím.

Để giảm thiểu các vấn đề như vậy, bạn nên nhân đôi các sự kiện này với các sự kiện tương tự có thể được kích hoạt bằng các phương tiện khác (cái gọi là trình xử lý sự kiện độc lập thiết bị) — [focus](/en-US/docs/Web/API/Element/focus_event) và [blur](/en-US/docs/Web/API/Element/blur_event) sẽ cung cấp khả năng tiếp cận cho người dùng bàn phím.

Hãy xem ví dụ làm nổi bật khi điều này có thể hữu ích. Có lẽ chúng tôi muốn cung cấp hình ảnh thumbnail hiển thị phiên bản lớn hơn của hình ảnh khi nó được di chuột qua hoặc được tập trung (như bạn thấy trong catalog sản phẩm thương mại điện tử).

Chúng tôi đã tạo một ví dụ rất đơn giản, bạn có thể tìm thấy tại [mouse-and-keyboard-events.html](https://mdn.github.io/learning-area/accessibility/css/mouse-and-keyboard-events.html) (xem cũng [mã nguồn](https://github.com/mdn/learning-area/blob/main/accessibility/css/mouse-and-keyboard-events.html)). Mã có hai chức năng hiển thị và ẩn hình ảnh được phóng to; chúng được chạy bởi các dòng sau đặt chúng làm trình xử lý sự kiện:

```js
imgThumb.onmouseover = showImg;
imgThumb.onmouseout = hideImg;

imgThumb.onfocus = showImg;
imgThumb.onblur = hideImg;
```

Hai dòng đầu tiên chạy các chức năng khi con trỏ chuột di chuyển qua và dừng di chuyển qua thumbnail, tương ứng. Điều này sẽ không cho phép chúng tôi truy cập chế độ xem phóng to bằng bàn phím — để cho phép điều đó, chúng tôi đã bao gồm hai dòng cuối cùng, chạy các chức năng khi hình ảnh được tập trung và làm mờ (khi tiêu điểm dừng). Điều này có thể được thực hiện bằng cách tab qua hình ảnh, vì chúng tôi đã bao gồm `tabindex="0"` trên nó.

Sự kiện [click](/en-US/docs/Web/API/Element/click_event) thú vị — nó nghe có vẻ phụ thuộc vào chuột, nhưng hầu hết các trình duyệt sẽ kích hoạt trình xử lý sự kiện [onclick](/en-US/docs/Web/API/Element/click_event) sau khi Enter/Return được nhấn trên liên kết hoặc phần tử biểu mẫu có tiêu điểm, hoặc khi phần tử đó được chạm vào trên thiết bị cảm ứng. Tuy nhiên, điều này không hoạt động theo mặc định khi bạn cho phép sự kiện không tập trung theo mặc định có tiêu điểm bằng tabindex — trong các trường hợp như vậy bạn cần phát hiện cụ thể khi chính xác phím đó được nhấn (xem [Xây dựng lại khả năng tiếp cận bàn phím](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#building_keyboard_accessibility_back_in)).

## Tóm tắt

Chúng tôi hy vọng bài viết này đã cung cấp cho bạn một lượng chi tiết và hiểu biết tốt về các vấn đề khả năng tiếp cận xung quanh việc sử dụng CSS và JavaScript trên trang web.

Trong bài viết tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra bạn có thể sử dụng để kiểm tra mức độ hiểu và giữ lại tất cả thông tin này.

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Test_your_skills/HTML","Learn_web_development/Core/Accessibility/Test_your_skills/CSS_and_JavaScript", "Learn_web_development/Core/Accessibility")}}
