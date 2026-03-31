---
title: Xử lý các vấn đề HTML và CSS thông thường
short-title: Các vấn đề HTML và CSS thông thường
slug: Learn_web_development/Extensions/Testing/HTML_and_CSS
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/Testing_strategies","Learn_web_development/Extensions/Testing/Feature_detection", "Learn_web_development/Extensions/Testing")}}

Với bối cảnh đã được thiết lập, chúng ta sẽ xem xét cụ thể các vấn đề đa trình duyệt thông thường mà bạn sẽ gặp trong mã HTML và CSS, và những công cụ nào có thể được sử dụng để ngăn chặn sự cố xảy ra, hoặc sửa các sự cố xảy ra. Điều này bao gồm kiểm tra mã, xử lý tiền tố CSS, sử dụng các công cụ phát triển trình duyệt để theo dõi sự cố, sử dụng polyfill để thêm hỗ trợ vào trình duyệt, giải quyết các vấn đề thiết kế đáp ứng, và nhiều hơn nữa.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>; có ý tưởng về các nguyên tắc cấp cao
        <a
          href="/en-US/docs/Learn_web_development/Extensions/Testing/Introduction"
          >của kiểm thử đa trình duyệt</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Có khả năng chẩn đoán các vấn đề đa trình duyệt HTML và CSS phổ biến, và
        sử dụng các công cụ và kỹ thuật thích hợp để sửa chúng.
      </td>
    </tr>
  </tbody>
</table>

## Vấn đề với HTML và CSS

Một số vấn đề với HTML và CSS nằm ở thực tế là cả hai ngôn ngữ đều khá đơn giản, và các nhà phát triển thường không coi trọng chúng, về việc đảm bảo mã được soạn thảo tốt, hiệu quả và mô tả ngữ nghĩa mục đích của các tính năng trên trang. Trong trường hợp xấu nhất, JavaScript được sử dụng để tạo toàn bộ nội dung và kiểu trang web, điều này làm cho các trang của bạn không thể truy cập và kém hiệu suất hơn (tạo các phần tử DOM rất tốn kém). Trong các trường hợp khác, các tính năng mới không được hỗ trợ nhất quán trên các trình duyệt, điều này có thể làm cho một số tính năng và kiểu không hoạt động với một số người dùng. Các vấn đề thiết kế đáp ứng cũng phổ biến — một trang web trông đẹp trong trình duyệt máy tính để bàn có thể cung cấp trải nghiệm tồi tệ trên thiết bị di động, vì nội dung quá nhỏ để đọc, hoặc có thể trang web chậm vì hiệu ứng động tốn kém.

Hãy tiến hành xem xét cách chúng ta có thể giảm các lỗi đa trình duyệt xuất phát từ HTML/CSS.

## Đầu tiên: sửa các vấn đề chung

Chúng ta đã nói trong [bài viết đầu tiên của loạt bài này](/en-US/docs/Learn_web_development/Extensions/Testing/Introduction#testingdiscovery) rằng một chiến lược tốt để bắt đầu là kiểm thử trong một vài trình duyệt hiện đại trên máy tính để bàn/di động, để đảm bảo mã của bạn hoạt động chung, trước khi tiến hành tập trung vào các vấn đề đa trình duyệt.

Trong các bài viết [Gỡ lỗi HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Debugging_HTML) và [Gỡ lỗi CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Debugging_CSS), chúng ta đã cung cấp một số hướng dẫn cơ bản về gỡ lỗi HTML/CSS — nếu bạn không quen với những điều cơ bản, bạn chắc chắn nên học các bài viết này trước khi tiếp tục.

Về cơ bản, đây là vấn đề kiểm tra xem mã HTML và CSS của bạn có được định dạng tốt và không chứa bất kỳ lỗi cú pháp nào không.

> [!NOTE]
> Một vấn đề phổ biến với CSS và HTML phát sinh khi các quy tắc CSS khác nhau bắt đầu xung đột với nhau. Điều này có thể đặc biệt có vấn đề khi bạn đang sử dụng mã bên thứ ba. Ví dụ, bạn có thể sử dụng khung CSS và thấy rằng một trong các tên lớp mà nó sử dụng trùng với tên bạn đã sử dụng cho mục đích khác. Hoặc bạn có thể thấy rằng HTML được tạo bởi một số loại API bên thứ ba (tạo biểu ngữ quảng cáo, chẳng hạn) bao gồm tên lớp hoặc ID mà bạn đã sử dụng cho mục đích khác. Để đảm bảo điều này không xảy ra, bạn cần nghiên cứu các công cụ bạn đang sử dụng trước và thiết kế mã xung quanh chúng. Cũng đáng "đặt không gian tên" CSS, ví dụ: nếu bạn có một widget, hãy đảm bảo nó có một lớp riêng biệt, và sau đó bắt đầu các bộ chọn chọn các phần tử bên trong widget với lớp này, để xung đột ít có khả năng xảy ra hơn. Ví dụ `.audio-player ul a`.

### Kiểm tra hợp lệ

Đối với HTML, kiểm tra hợp lệ liên quan đến việc đảm bảo tất cả các thẻ được đóng và lồng vào đúng cách, bạn đang sử dụng doctype và bạn đang sử dụng thẻ cho mục đích đúng. Một chiến lược tốt là kiểm tra hợp lệ mã của bạn thường xuyên. Một dịch vụ có thể làm điều này là [Markup Validation Service](https://validator.w3.org/) của W3C, cho phép bạn trỏ đến mã của mình và trả về danh sách lỗi.

CSS có câu chuyện tương tự — bạn cần kiểm tra tên thuộc tính của bạn được viết đúng chính tả, các giá trị thuộc tính được viết đúng chính tả và hợp lệ cho các thuộc tính chúng được sử dụng, bạn không thiếu dấu ngoặc nhọn nào, v.v. W3C cũng có [CSS Validator](https://jigsaw.w3.org/css-validator/) để phục vụ mục đích này.

### Trình kiểm tra mã (Linters)

Một lựa chọn tốt khác là ứng dụng Linter (trình kiểm tra mã), không chỉ chỉ ra các lỗi mà còn có thể đánh dấu các cảnh báo về thực hành không tốt trong CSS của bạn và các điểm khác. Linter thường có thể được tùy chỉnh để nghiêm ngặt hoặc thoải mái hơn trong việc báo cáo lỗi/cảnh báo.

Có nhiều ứng dụng linter trực tuyến, chẳng hạn như [Dirty Markup](https://www.10bestdesign.com/dirtymarkup/) cho HTML, CSS và JavaScript. Chúng cho phép bạn dán mã của mình vào cửa sổ và sẽ đánh dấu bất kỳ lỗi nào bằng dấu X, sau đó có thể di chuột để nhận thông báo lỗi cho biết vấn đề là gì. Dirty Markup cũng cho phép bạn sửa đánh dấu bằng nút _Clean_.

Tuy nhiên, không tiện lắm khi phải sao chép và dán mã của bạn vào một trang web để kiểm tra tính hợp lệ nhiều lần. Điều bạn thực sự muốn là một linter tích hợp vào quy trình làm việc tiêu chuẩn của bạn với ít phức tạp nhất.

Nhiều trình soạn thảo mã có plugin linter. Ví dụ:

- [SublimeLinter](https://www.sublimelinter.com/) cho Sublime Text
- [Notepad++ linter](https://sourceforge.net/projects/notepad-linter/)
- [VS Code linters](https://marketplace.visualstudio.com/search?target=vscode&category=Linters&sortBy=Installs)

### Công cụ phát triển trình duyệt

Các công cụ phát triển tích hợp trong hầu hết các trình duyệt cũng có các công cụ hữu ích để tìm lỗi, chủ yếu cho CSS.

> [!NOTE]
> Lỗi HTML không có xu hướng hiển thị dễ dàng trong dev tools, vì trình duyệt sẽ cố gắng tự động sửa đánh dấu không được định dạng tốt; W3C validator là cách tốt nhất để tìm lỗi HTML — xem phần [Kiểm tra hợp lệ](#validation) ở trên.

Ví dụ, trong Firefox, trình kiểm tra CSS sẽ hiển thị các khai báo CSS không được áp dụng bị gạch chéo, với tam giác cảnh báo. Di chuột qua tam giác cảnh báo sẽ cung cấp thông báo lỗi mô tả.

Các devtools trình duyệt khác cũng có các tính năng tương tự.

## Các vấn đề đa trình duyệt phổ biến

Bây giờ hãy chuyển sang xem xét một số vấn đề đa trình duyệt HTML và CSS phổ biến nhất. Các khu vực chính chúng ta sẽ xem xét là thiếu hỗ trợ cho các tính năng hiện đại và các vấn đề bố cục.

### Trình duyệt không hỗ trợ các tính năng hiện đại

Đây là vấn đề phổ biến, đặc biệt khi bạn cần hỗ trợ các trình duyệt cũ hoặc bạn đang sử dụng các tính năng được triển khai trong một số trình duyệt nhưng chưa có trong tất cả. Nói chung, hầu hết chức năng HTML và CSS cốt lõi (như các phần tử HTML cơ bản, màu CSS cơ bản và tạo kiểu văn bản) hoạt động trên tất cả các trình duyệt bạn muốn hỗ trợ; nhiều vấn đề hơn được phát hiện khi bạn bắt đầu muốn sử dụng các HTML, CSS và API mới hơn. MDN hiển thị dữ liệu tương thích trình duyệt cho mỗi tính năng được ghi lại; ví dụ, xem [bảng hỗ trợ trình duyệt cho lớp giả `:has()`](/en-US/docs/Web/CSS/Reference/Selectors/:has#browser_compatibility).

Khi bạn đã xác định danh sách các công nghệ bạn sẽ sử dụng mà không được hỗ trợ phổ biến, bạn nên nghiên cứu các trình duyệt nào hỗ trợ chúng và các kỹ thuật liên quan nào hữu ích. Xem phần [Tìm kiếm sự trợ giúp](#finding_help) bên dưới.

### Hành vi dự phòng HTML

Một số vấn đề có thể được giải quyết chỉ bằng cách tận dụng cách HTML/CSS hoạt động tự nhiên.

Các phần tử HTML không được nhận dạng được xử lý bởi trình duyệt như các phần tử nội tuyến ẩn danh (thực sự là các phần tử nội tuyến không có giá trị ngữ nghĩa, tương tự như các phần tử {{htmlelement("span")}}). Bạn vẫn có thể tham chiếu đến chúng bằng tên và tạo kiểu chúng bằng CSS, ví dụ — bạn chỉ cần đảm bảo chúng hoạt động theo cách bạn muốn. Tạo kiểu chúng như bạn sẽ tạo kiểu cho bất kỳ phần tử nào khác, bao gồm đặt thuộc tính `display` thành thứ gì đó khác ngoài `inline` nếu cần.

Các phần tử phức tạp hơn như HTML [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video), [`<audio>`](/en-US/docs/Web/HTML/Reference/Elements/audio), [`<picture>`](/en-US/docs/Web/HTML/Reference/Elements/picture), [`<object>`](/en-US/docs/Web/HTML/Reference/Elements/object) và [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas) (và các tính năng khác) có các cơ chế tự nhiên để thêm các phương án dự phòng trong trường hợp tài nguyên được liên kết không được hỗ trợ. Bạn có thể thêm nội dung dự phòng giữa các thẻ mở và đóng, và các trình duyệt không hỗ trợ sẽ bỏ qua phần tử bên ngoài và chạy nội dung lồng nhau.

Ví dụ:

```html
<video id="video" controls preload="metadata" poster="img/poster.jpg">
  <source
    src="video/tears-of-steel-battle-clip-medium.webm"
    type="video/webm" />
  <!-- Offer download -->
  <p>
    Your browser does not support WebM video; here is a link to
    <a href="video/tears-of-steel-battle-clip-medium.mp4"
      >view the video directly</a
    >
  </p>
</video>
```

Ví dụ này bao gồm một liên kết đơn giản cho phép bạn tải video xuống ngay cả khi trình phát video HTML không hoạt động, vì vậy ít nhất người dùng vẫn có thể truy cập video.

Một ví dụ khác là các phần tử biểu mẫu. Khi các loại [`<input>`](/en-US/docs/Web/HTML/Reference/Elements/input) mới được giới thiệu để nhập thông tin cụ thể vào biểu mẫu, chẳng hạn như thời gian, ngày tháng, màu sắc, số, v.v., nếu trình duyệt không hỗ trợ tính năng mới, trình duyệt sử dụng giá trị mặc định `type="text"`. Các loại input được thêm vào rất hữu ích, đặc biệt trên các nền tảng di động, nơi cung cấp cách nhập dữ liệu không đau đớn rất quan trọng cho trải nghiệm người dùng.

Ví dụ sau hiển thị các input ngày và giờ:

```html live-sample___form-test
<form>
  <div>
    <label for="date">Enter a date:</label>
    <input id="date" type="date" />
  </div>
  <div>
    <label for="time">Enter a time:</label>
    <input id="time" type="time" />
  </div>
</form>
```

```css hidden live-sample___form-test
div {
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}

input {
  flex: 2;
}

label {
  flex: 1;
  text-align: right;
}

body {
  width: 400px;
  margin: 0 auto;
}
```

{{EmbedLiveSample("form-test", '100%', 100)}}

Nếu bạn xem ví dụ, bạn sẽ thấy các tính năng UI hoạt động khi bạn cố nhập dữ liệu. Trên các thiết bị có bàn phím động, các bàn phím số đặc thù theo loại sẽ được hiển thị. Trên trình duyệt không hỗ trợ, các input sẽ chỉ mặc định là các input văn bản bình thường, nghĩa là người dùng vẫn có thể nhập thông tin chính xác.

### Hành vi dự phòng CSS

CSS được lập luận là tốt hơn về dự phòng so với HTML. Nếu trình duyệt gặp một khai báo hoặc quy tắc mà nó không hiểu, nó chỉ bỏ qua hoàn toàn mà không áp dụng nó hoặc ném ra lỗi. Điều này có thể gây bực bội cho bạn và người dùng nếu một lỗi như vậy lọt vào mã sản xuất, nhưng ít nhất nó có nghĩa là toàn bộ trang web không sụp đổ vì một lỗi, và nếu được sử dụng thông minh bạn có thể sử dụng nó theo lợi thế của mình.

Hãy xem xét một ví dụ — một hộp đơn giản được tạo kiểu bằng CSS, có một số kiểu được cung cấp bởi các tính năng CSS khác nhau:

```html hidden live-sample___blingy-button
<button>Press me</button>
```

```css hidden live-sample___blingy-button
html {
  font-family: sans-serif;
  height: 100%;
}

button {
  width: 150px;
  margin: auto;
  line-height: 2;
  font-size: 1.1rem;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 1px black;
  border-radius: 20px / 15px;
  border: none;
  cursor: pointer;

  background-color: red;
  background-color: rgb(255 0 0 / 90%);
  box-shadow:
    inset 3px 3px 3px rgb(255 255 255 / 40%),
    inset -3px -3px 3px rgb(0 0 0 / 40%);
}

button:hover,
button:focus {
  background-color: rgb(255 0 0 / 50%);
}

button:active {
  box-shadow:
    inset 3px 3px 3px rgb(0 0 0 / 40%),
    inset -3px -3px 3px rgb(255 255 255 / 40%);
}

body {
  height: inherit;
  display: flex;
  align-items: center;
}
```

{{EmbedLiveSample("blingy-button", "100%", 60)}}

Nút có một số khai báo được áp dụng cho nó, nhưng những khai báo chúng ta quan tâm nhất là như sau:

```css
button {
  /* … */

  background-color: red;
  background-color: rgb(255 0 0 / 90%);
  box-shadow:
    inset 3px 3px 3px rgb(255 255 255 / 40%),
    inset -3px -3px 3px rgb(0 0 0 / 40%);
}

button:hover,
button:focus {
  background-color: rgb(255 0 0 / 50%);
}

button:active {
  box-shadow:
    inset 3px 3px 3px rgb(0 0 0 / 40%),
    inset -3px -3px 3px rgb(255 255 255 / 40%);
}
```

Ở đây chúng ta cung cấp {{cssxref("background-color")}} [RGB](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb) thay đổi độ mờ khi di chuột để cho người dùng biết nút có thể tương tác, và một số bóng {{cssxref("box-shadow")}} nội bộ bán trong suốt để cho nút một chút kết cấu và chiều sâu. Mặc dù bây giờ được hỗ trợ đầy đủ, màu RGB và box shadows không tồn tại mãi mãi; bắt đầu trong IE9. Các trình duyệt không hỗ trợ màu RGB sẽ bỏ qua khai báo, nghĩa là trong các trình duyệt cũ, nền sẽ không hiển thị chút nào, khiến văn bản không thể đọc được!

Để sắp xếp điều này, chúng ta đã thêm khai báo `background-color` thứ hai, chỉ định từ khóa màu `red` — điều này được hỗ trợ từ rất xa trong các trình duyệt thực sự cũ và hoạt động như dự phòng nếu các tính năng hiện đại sáng bóng không hoạt động. Điều xảy ra là trình duyệt truy cập trang này đầu tiên áp dụng giá trị `background-color` đầu tiên; khi nó đến khai báo `background-color` thứ hai, nó sẽ ghi đè giá trị ban đầu bằng giá trị này nếu nó hỗ trợ màu RGB. Nếu không, nó sẽ chỉ bỏ qua toàn bộ khai báo và tiếp tục.

> [!NOTE]
> Điều tương tự cũng đúng cho các tính năng CSS khác như [media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using), {{cssxref("@font-face")}} và {{cssxref("@supports")}} — nếu chúng không được hỗ trợ, trình duyệt chỉ bỏ qua chúng.

### Hỗ trợ bộ chọn

Tất nhiên, không có tính năng CSS nào sẽ áp dụng nếu bạn không sử dụng đúng [bộ chọn](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) để chọn phần tử bạn muốn tạo kiểu!

Trong danh sách bộ chọn được phân tách bằng dấu phẩy, nếu bạn chỉ viết một bộ chọn không đúng, nó có thể không khớp với bất kỳ phần tử nào. Tuy nhiên, nếu một bộ chọn không hợp lệ, **toàn bộ** danh sách bộ chọn bị bỏ qua, cùng với toàn bộ khối kiểu. Vì lý do này, chỉ bao gồm lớp giả hoặc phần tử giả có tiền tố `:-moz-` trong [danh sách bộ chọn tha thứ](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list), chẳng hạn như `:where(::-moz-thumb)`. Đừng bao gồm lớp giả hoặc phần tử giả có tiền tố `:-moz-` trong một nhóm bộ chọn được phân tách bằng dấu phẩy bên ngoài danh sách bộ chọn tha thứ {{cssxref(":is()")}} hoặc {{cssxref(":where()")}} vì tất cả các trình duyệt trừ Firefox sẽ bỏ qua toàn bộ khối.

Chúng ta thấy rằng việc kiểm tra phần tử bạn đang cố tạo kiểu bằng dev tools của trình duyệt, sau đó xem đường dẫn DOM tree mà trình kiểm tra DOM cung cấp để xem liệu bộ chọn của bạn có phù hợp với nó không là hữu ích.

### Xử lý tiền tố CSS

Một tập hợp vấn đề khác đến với các tiền tố CSS — đây là cơ chế ban đầu được sử dụng để cho phép các nhà cung cấp trình duyệt triển khai phiên bản của họ về tính năng CSS (hoặc JavaScript) trong khi công nghệ đang ở trạng thái thử nghiệm, để họ có thể thử nghiệm và làm đúng mà không xung đột với các triển khai của trình duyệt khác, hoặc các triển khai không có tiền tố cuối cùng.

Ví dụ: Firefox sử dụng `-moz-` và Chrome/Edge/Opera/Safari sử dụng `-webkit-`. Các tiền tố khác bạn có thể gặp trong mã cũ có thể xóa an toàn bao gồm `-ms-`, được sử dụng bởi Internet Explorer và các phiên bản đầu của Edge, và `-o` được sử dụng trong các phiên bản gốc của Opera.

Các tính năng có tiền tố không bao giờ được sử dụng trong các trang web sản xuất — chúng có thể bị thay đổi hoặc xóa mà không cần cảnh báo, có thể gây ra vấn đề hiệu suất trong các phiên bản trình duyệt cũ yêu cầu chúng, và đã là nguyên nhân của các vấn đề đa trình duyệt. Điều này đặc biệt là vấn đề, ví dụ, khi các nhà phát triển quyết định chỉ sử dụng phiên bản `-webkit-` của một thuộc tính, điều đó ngụ ý rằng trang web sẽ không hoạt động trong các trình duyệt khác.

Nếu sử dụng tiền tố, hãy đảm bảo rằng nó cần thiết. Bạn có thể tìm kiếm những trình duyệt nào yêu cầu tiền tố trên các trang tham chiếu MDN, và các trang như [caniuse.com](https://caniuse.com/). Bao gồm phiên bản không có tiền tố tiêu chuẩn sau khai báo kiểu có tiền tố; nó sẽ bị bỏ qua nếu không được hỗ trợ và được sử dụng khi được hỗ trợ.

```css
.masked {
  -webkit-mask-image: url("MDN.svg");
  mask-image: url("MDN.svg");
  -webkit-mask-size: 50%;
  mask-size: 50%;
}
```

Hãy thử ví dụ đơn giản này:

1. Sử dụng trang này, hoặc một trang khác có tiêu đề nổi bật hoặc phần tử cấp khối khác.
2. Nhấp chuột phải/Cmd vào phần tử đó và chọn Inspect/Inspect element — điều này sẽ mở dev tools trong trình duyệt của bạn, với phần tử được tô sáng trong trình kiểm tra DOM.
3. Tìm kiếm một tính năng bạn có thể sử dụng để chọn phần tử đó. Ví dụ, tại thời điểm viết bài, trang này trên MDN có logo với ID là `mdn-docs-logo`.
4. Lưu trữ tham chiếu đến phần tử này trong một biến, ví dụ:

   ```js
   const test = document.getElementById("mdn-docs-logo");
   ```

5. Bây giờ hãy thử đặt giá trị mới cho thuộc tính CSS bạn quan tâm trên phần tử đó; bạn có thể làm điều này bằng thuộc tính [style](/en-US/docs/Web/API/HTMLElement/style) của phần tử, ví dụ thử gõ những thứ này vào bảng điều khiển JavaScript:

   ```js
   test.style.transform = "rotate(90deg)";
   ```

Khi bạn bắt đầu gõ tên thuộc tính sau dấu chấm thứ hai (lưu ý rằng trong JavaScript, tên thuộc tính CSS được viết theo {{Glossary("camel_case", "lower camel case")}}, không phải {{Glossary("kebab_case", "kebab-case")}}), bảng điều khiển JavaScript sẽ bắt đầu tự động hoàn thành tên của các thuộc tính tồn tại trong trình duyệt và khớp với những gì bạn đã viết cho đến nay. Điều này hữu ích để tìm hiểu những thuộc tính nào được triển khai trong trình duyệt đó.

Nếu bạn cần bao gồm các tính năng hiện đại, hãy kiểm tra hỗ trợ tính năng bằng {{cssxref("@supports")}}, cho phép bạn triển khai các bài kiểm tra phát hiện tính năng gốc và lồng tính năng có tiền tố hoặc mới trong khối `@supports`.

### Vấn đề thiết kế đáp ứng

Thiết kế đáp ứng là thực hành tạo bố cục web thay đổi phù hợp với các dạng thiết bị khác nhau — ví dụ, chiều rộng màn hình khác nhau, hướng (dọc hoặc ngang), hoặc độ phân giải. Bố cục máy tính để bàn ví dụ sẽ trông tệ khi xem trên thiết bị di động, vì vậy bạn cần cung cấp bố cục di động phù hợp bằng cách sử dụng [media queries](/en-US/docs/Web/CSS/Guides/Media_queries) và đảm bảo nó được áp dụng đúng bằng cách sử dụng [viewport](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport). Bạn có thể tìm thấy hướng dẫn chi tiết về các thực hành như vậy trong [hướng dẫn thiết kế đáp ứng của chúng ta](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design).

Độ phân giải cũng là một vấn đề lớn — ví dụ, các thiết bị di động ít có khả năng cần hình ảnh lớn nặng hơn máy tính để bàn, và có nhiều khả năng có kết nối internet chậm hơn và thậm chí có thể có các gói dữ liệu đắt tiền làm cho băng thông lãng phí trở thành vấn đề lớn hơn. Ngoài ra, các thiết bị khác nhau có thể có nhiều độ phân giải khác nhau, nghĩa là hình ảnh nhỏ hơn có thể xuất hiện bị vỡ hạt. Có một số kỹ thuật cho phép bạn khắc phục các vấn đề như vậy, từ [media queries](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design#media_queries) đến [kỹ thuật hình ảnh đáp ứng phức tạp hơn](/en-US/docs/Web/HTML/Guides/Responsive_images#resolution_switching_different_sizes), bao gồm {{HTMLElement('picture')}} và các thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) và [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) của phần tử {{HTMLElement('img')}}.

## Tìm kiếm sự trợ giúp

Có nhiều vấn đề khác bạn sẽ gặp với HTML và CSS, làm cho kiến thức về cách tìm câu trả lời trực tuyến trở nên vô giá.

Trong số các nguồn hỗ trợ tốt nhất là Mozilla Developer Network (đó là nơi bạn đang ở!), [stackoverflow.com](https://stackoverflow.com/), và [caniuse.com](https://caniuse.com/).

Để sử dụng Mozilla Developer Network (MDN), hầu hết mọi người tìm kiếm công cụ tìm kiếm về công nghệ họ đang cố tìm thông tin, cộng với thuật ngữ "mdn", ví dụ: "mdn HTML video". MDN chứa một số loại nội dung hữu ích:

- Tài liệu tham khảo với thông tin hỗ trợ trình duyệt cho các công nghệ web phía máy khách, ví dụ: [trang tham chiếu \<video>](/en-US/docs/Web/HTML/Reference/Elements/video).
- Tài liệu tham khảo hỗ trợ khác, ví dụ: [Hướng dẫn về các định dạng và loại phương tiện trên web](/en-US/docs/Web/Media/Guides/Formats).
- Các hướng dẫn hữu ích giải quyết các vấn đề cụ thể, ví dụ: [Tạo trình phát video đa trình duyệt](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player).

[caniuse.com](https://caniuse.com/) cung cấp thông tin hỗ trợ, cùng với một số liên kết tài nguyên bên ngoài hữu ích. Ví dụ: xem <https://caniuse.com/#search=video> (bạn chỉ cần nhập tính năng bạn đang tìm kiếm vào hộp văn bản).

[stackoverflow.com](https://stackoverflow.com/) (SO) là trang diễn đàn nơi bạn có thể đặt câu hỏi và có các nhà phát triển đồng nghiệp chia sẻ giải pháp của họ, tra cứu các bài đăng trước đây, và giúp đỡ các nhà phát triển khác. Bạn được khuyên nên tìm và xem liệu đã có câu trả lời cho câu hỏi của bạn chưa, trước khi đăng câu hỏi mới.

Ngoài ra, hãy thử tìm kiếm bằng công cụ tìm kiếm yêu thích của bạn để tìm câu trả lời cho vấn đề. Thường hữu ích khi tìm kiếm các thông báo lỗi cụ thể nếu bạn có — các nhà phát triển khác có thể đã gặp phải các vấn đề tương tự như bạn.

## Tóm tắt

Bây giờ bạn nên quen thuộc với các loại vấn đề đa trình duyệt HTML và CSS chính mà bạn sẽ gặp trong phát triển web, và cách sửa chúng.

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/Testing_strategies","Learn_web_development/Extensions/Testing/Feature_detection", "Learn_web_development/Extensions/Testing")}}
