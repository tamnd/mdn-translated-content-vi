---
title: "HTML: Nền tảng tốt cho khả năng tiếp cận"
short-title: HTML dễ tiếp cận
slug: Learn_web_development/Core/Accessibility/HTML
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Tooling","Learn_web_development/Core/Accessibility/Test_your_skills/HTML", "Learn_web_development/Core/Accessibility")}}

Phần lớn nội dung web có thể được làm dễ tiếp cận chỉ bằng cách đảm bảo các phần tử Ngôn ngữ đánh dấu siêu văn bản đúng được sử dụng cho đúng mục đích mọi lúc. Bài viết này xem xét chi tiết cách HTML có thể được sử dụng để đảm bảo khả năng tiếp cận tối đa.

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
          <li>Sử dụng HTML ngữ nghĩa, hay còn gọi là "phần tử đúng cho công việc đúng", vì trình duyệt cung cấp rất nhiều móc khả năng tiếp cận tích hợp.</li>
          <li>Các thực hành tốt nhất về khả năng tiếp cận như alt text, văn bản liên kết tốt, nhãn biểu mẫu, và tiêu đề hàng và cột bảng cùng phạm vi.</li>
          <li>Sử dụng ngôn ngữ đơn giản, tránh tiếng lóng và từ viết tắt khi có thể, và cung cấp định nghĩa khi không thể tránh.</li>
          <li>Khái niệm và thực hành điều hướng bằng bàn phím.</li>
          <li>Tầm quan trọng của thứ tự nguồn.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## HTML và khả năng tiếp cận

Khi bạn học thêm về HTML — đọc thêm tài nguyên, xem thêm ví dụ, v.v. — bạn sẽ tiếp tục thấy một chủ đề chung: tầm quan trọng của việc sử dụng HTML ngữ nghĩa (đôi khi được gọi là POSH, hay HTML ngữ nghĩa đơn giản cũ). Điều này có nghĩa là sử dụng các phần tử HTML đúng cho mục đích dự định của chúng nhiều nhất có thể.

Bạn có thể tự hỏi tại sao điều này lại quan trọng. Suy cho cùng, bạn có thể sử dụng kết hợp CSS và JavaScript để làm cho hầu hết mọi phần tử HTML hoạt động theo bất kỳ cách nào bạn muốn. Ví dụ, một nút điều khiển để phát video trên trang web của bạn có thể được đánh dấu như thế này:

```html
<div>Phát video</div>
```

Nhưng như bạn sẽ thấy chi tiết hơn sau, sẽ có ý nghĩa hơn khi sử dụng phần tử đúng cho công việc:

```html
<button>Phát video</button>
```

Không chỉ HTML `<button>` có một số kiểu dáng phù hợp được áp dụng theo mặc định (mà bạn có thể muốn ghi đè), chúng còn có tính năng điều hướng bằng bàn phím tích hợp — người dùng có thể điều hướng giữa các nút bằng phím <kbd>Tab</kbd> và kích hoạt lựa chọn của họ bằng <kbd>Space</kbd>, <kbd>Return</kbd> hoặc <kbd>Enter</kbd>.

HTML ngữ nghĩa không mất nhiều thời gian hơn để viết so với đánh dấu không ngữ nghĩa (xấu) nếu bạn thực hiện nó nhất quán từ đầu dự án. Thậm chí tốt hơn, đánh dấu ngữ nghĩa có các lợi ích khác ngoài khả năng tiếp cận:

1. **Dễ phát triển hơn** — như đã đề cập ở trên, bạn có được một số chức năng miễn phí, và có thể nói là dễ hiểu hơn.
2. **Tốt hơn trên thiết bị di động** — HTML ngữ nghĩa được lập luận là nhẹ hơn về kích thước tệp so với mã spaghetti không ngữ nghĩa, và dễ đáp ứng hơn.
3. **Tốt cho SEO** — các công cụ tìm kiếm đặt tầm quan trọng hơn vào các từ khóa bên trong tiêu đề, liên kết, v.v. so với các từ khóa được bao gồm trong `<div>` không ngữ nghĩa, v.v., vì vậy tài liệu của bạn sẽ dễ tìm thấy hơn bởi khách hàng.

Hãy bắt đầu và xem HTML dễ tiếp cận chi tiết hơn.

## Ngữ nghĩa tốt

Chúng ta đã nói về tầm quan trọng của ngữ nghĩa đúng đắn, và tại sao chúng ta nên sử dụng phần tử HTML đúng cho công việc. Điều này không thể bỏ qua, vì đây là một trong những nơi chính mà khả năng tiếp cận bị phá vỡ nghiêm trọng nếu không được xử lý đúng cách.

Trên web, sự thật là mọi người làm một số thứ rất kỳ lạ với đánh dấu HTML. Thường thì, việc sử dụng sai HTML là do các thực hành cũ chưa biến mất, nhưng đôi khi xảy ra vì tác giả không biết tốt hơn. Dù trong trường hợp nào, bạn nên thay thế mã xấu bằng đánh dấu ngữ nghĩa tốt bất cứ khi nào có thể, trong cả trang HTML tĩnh và HTML được tạo động từ mã [phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side) hoặc [khung JavaScript phía máy khách](/en-US/docs/Learn_web_development/Core/Frameworks_libraries) như React.

Đôi khi bạn không ở vị trí loại bỏ đánh dấu tệ — trang của bạn có thể phụ thuộc vào mã phía máy chủ hoặc các thành phần web/khung mà bạn không kiểm soát, hoặc bạn có thể có nội dung bên thứ ba trên trang của mình (chẳng hạn như biểu ngữ quảng cáo).

Mục tiêu không phải là "tất cả hoặc không có gì"; mọi cải tiến bạn có thể thực hiện sẽ giúp ích cho khả năng tiếp cận.

### Sử dụng cấu trúc nội dung văn bản tốt

Một trong những hỗ trợ khả năng tiếp cận tốt nhất mà người dùng trình đọc màn hình có thể có là một cấu trúc văn bản xuất sắc với tiêu đề, đoạn văn, danh sách, v.v. Một ví dụ ngữ nghĩa tốt có thể trông giống như sau:

```html example-good
<h1>Tiêu đề của tôi</h1>

<p>Đây là phần đầu tiên của tài liệu của tôi.</p>

<p>Tôi cũng sẽ thêm đoạn văn khác ở đây.</p>

<ol>
  <li>Đây là</li>
  <li>một danh sách để</li>
  <li>bạn đọc</li>
</ol>

<h2>Tiêu đề phụ của tôi</h2>

<p>
  Đây là tiểu mục đầu tiên của tài liệu của tôi. Tôi muốn mọi người có thể tìm
  thấy nội dung này!
</p>

<h2>Tiêu đề phụ thứ 2 của tôi</h2>

<p>
  Đây là tiểu mục thứ hai của nội dung của tôi, mà tôi nghĩ thú vị hơn tiểu mục
  trước.
</p>
```

Chúng tôi đã chuẩn bị một phiên bản với văn bản dài hơn để bạn thử với trình đọc màn hình (xem [good-semantics.html](https://mdn.github.io/learning-area/accessibility/html/good-semantics.html)). Nếu bạn thử điều hướng qua đây, bạn sẽ thấy rằng việc điều hướng khá dễ dàng:

1. Trình đọc màn hình đọc từng tiêu đề khi bạn tiến qua nội dung, thông báo cho bạn biết tiêu đề là gì, đoạn văn là gì, v.v.
2. Nó dừng lại sau mỗi phần tử, để bạn đi với tốc độ thoải mái.
3. Bạn có thể nhảy đến tiêu đề tiếp theo/trước đó trong nhiều trình đọc màn hình.
4. Bạn cũng có thể hiển thị danh sách tất cả các tiêu đề trong nhiều trình đọc màn hình, cho phép bạn sử dụng chúng như bảng mục lục thuận tiện để tìm nội dung cụ thể.

Mọi người đôi khi viết tiêu đề, đoạn văn, v.v. bằng cách sử dụng dấu ngắt dòng và thêm các phần tử HTML thuần túy để tạo kiểu, kiểu như sau:

```html example-bad
<span style="font-size: 3em">Tiêu đề của tôi</span> <br /><br />
Đây là phần đầu tiên của tài liệu của tôi.
<br /><br />
Tôi cũng sẽ thêm đoạn văn khác ở đây.
<br /><br />
1. Đây là
<br /><br />
2. một danh sách để
<br /><br />
3. bạn đọc
<br /><br />
<span style="font-size: 2.5em">Tiêu đề phụ của tôi</span>
<br /><br />
Đây là tiểu mục đầu tiên của tài liệu của tôi. Tôi muốn mọi người có thể tìm
thấy nội dung này!
<br /><br />
<span style="font-size: 2.5em">Tiêu đề phụ thứ 2 của tôi</span>
<br /><br />
Đây là tiểu mục thứ hai của nội dung của tôi. Tôi nghĩ nó thú vị hơn tiểu mục
trước.
```

Nếu bạn thử phiên bản dài hơn của chúng tôi với trình đọc màn hình (xem [bad-semantics.html](https://mdn.github.io/learning-area/accessibility/html/bad-semantics.html)), bạn sẽ không có trải nghiệm tốt — trình đọc màn hình không có gì để sử dụng làm biển chỉ dẫn, vì vậy bạn không thể lấy bảng mục lục hữu ích và toàn bộ trang được xem như một khối lớn duy nhất, vì vậy nó chỉ được đọc ra cùng một lúc.

Cũng có các vấn đề khác ngoài khả năng tiếp cận — việc tạo kiểu cho nội dung bằng CSS hoặc thao tác bằng JavaScript khó hơn, ví dụ, vì không có phần tử nào để sử dụng làm bộ chọn.

### Sử dụng ngôn ngữ rõ ràng

Ngôn ngữ bạn sử dụng cũng có thể ảnh hưởng đến khả năng tiếp cận. Nói chung, bạn nên sử dụng ngôn ngữ rõ ràng không quá phức tạp và không sử dụng tiếng lóng hoặc thuật ngữ không cần thiết. Điều này không chỉ mang lại lợi ích cho người bị suy giảm nhận thức hoặc khuyết tật khác; nó mang lại lợi ích cho những người đọc mà văn bản không được viết bằng ngôn ngữ đầu tiên của họ, người trẻ tuổi…, mọi người, thực ra! Ngoài ra, bạn nên cố gắng tránh sử dụng ngôn ngữ và ký tự không được trình đọc màn hình đọc rõ ràng. Ví dụ:

- Đừng sử dụng gạch ngang nếu bạn có thể tránh. Thay vì viết 5–7, hãy viết 5 đến 7.
- Mở rộng từ viết tắt — thay vì viết Jan, hãy viết January.
- Mở rộng từ viết tắt, ít nhất một hoặc hai lần, sau đó sử dụng thẻ [`<abbr>`](/en-US/docs/Web/HTML/Reference/Elements/abbr) để mô tả chúng.

### Cấu trúc các phần trang một cách hợp lý

Bạn nên sử dụng các [phần tử phần](/en-US/docs/Web/HTML/Reference/Elements#content_sectioning) thích hợp để cấu trúc trang web của mình, ví dụ điều hướng ({{htmlelement("nav")}}), chân trang ({{htmlelement("footer")}}), và các đơn vị nội dung lặp lại ({{htmlelement("article")}}). Chúng cung cấp ngữ nghĩa bổ sung cho trình đọc màn hình (và các công cụ khác) để cung cấp cho người dùng thêm manh mối về nội dung họ đang điều hướng.

Ví dụ, một cấu trúc nội dung hiện đại có thể trông giống như thế này:

```html
<header>
  <h1>Tiêu đề</h1>
</header>

<nav>
  <!-- điều hướng chính ở đây -->
</nav>

<!-- Đây là nội dung chính của trang của chúng tôi -->
<main>
  <!-- Nó chứa một bài viết -->
  <article>
    <h2>Tiêu đề bài viết</h2>

    <!-- nội dung bài viết ở đây -->
  </article>

  <aside>
    <h2>Liên quan</h2>

    <!-- nội dung phụ ở đây -->
  </aside>
</main>

<!-- Và đây là chân trang chính của chúng tôi được sử dụng trên tất cả các trang của trang web của chúng tôi -->

<footer>
  <!-- nội dung chân trang ở đây -->
</footer>
```

Bạn có thể tìm thấy [ví dụ đầy đủ ở đây](https://mdn.github.io/learning-area/html/introduction-to-html/document_and_website_structure/).

Ngoài việc có ngữ nghĩa tốt và bố cục hấp dẫn, nội dung của bạn phải có ý nghĩa hợp lý theo thứ tự nguồn — bạn luôn có thể đặt nó ở bất cứ đâu bạn muốn sau này bằng CSS, nhưng bạn nên đúng thứ tự nguồn để bắt đầu, vì vậy những gì người dùng trình đọc màn hình được đọc cho họ sẽ có ý nghĩa.

### Sử dụng điều khiển UI ngữ nghĩa khi có thể

Theo điều khiển UI, chúng tôi muốn nói đến các phần chính của tài liệu web mà người dùng tương tác — thường xuyên nhất là nút, liên kết và điều khiển biểu mẫu. Trong phần này, chúng ta sẽ xem xét những mối quan tâm về khả năng tiếp cận cơ bản cần biết khi tạo các điều khiển như vậy. Các bài viết sau về WAI-ARIA và đa phương tiện sẽ xem xét các khía cạnh khác về khả năng tiếp cận UI.

Một khía cạnh chính của khả năng tiếp cận của các điều khiển UI là theo mặc định, trình duyệt cho phép chúng được thao tác bằng bàn phím. Bạn có thể thử điều này bằng ví dụ [native-keyboard-accessibility.html](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html) của chúng tôi (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html)). Mở trong một tab mới và thử nhấn phím tab; sau vài lần nhấn, bạn sẽ thấy tiêu điểm tab bắt đầu di chuyển qua các phần tử có thể tập trung khác nhau. Các phần tử được tập trung được đặt một kiểu mặc định được tô sáng trong mọi trình duyệt (nó hơi khác nhau giữa các trình duyệt khác nhau) để bạn có thể biết phần tử nào đang được tập trung.

![Ba nút với văn bản "Click me!", "Click me too!" và "And me!" bên trong chúng tương ứng. Nút thứ ba có đường viền màu xanh lam xung quanh để chỉ ra tiêu điểm tab hiện tại.](button-focused-unfocused.png)

> [!NOTE]
> Bạn có thể kích hoạt lớp phủ hiển thị thứ tự tab của trang trong công cụ phát triển. Để biết thêm thông tin xem: [Trình kiểm tra khả năng tiếp cận > Hiển thị thứ tự tab trang web](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/index.html#show-web-page-tabbing-order).

Bạn có thể nhấn Enter/Return để theo liên kết được tập trung hoặc nhấn nút (chúng tôi đã bao gồm một số JavaScript để các nút cảnh báo một tin nhắn), hoặc bắt đầu gõ để nhập văn bản vào một đầu vào văn bản. Các phần tử biểu mẫu khác có các điều khiển khác nhau; ví dụ, phần tử {{htmlelement("select")}} có thể hiển thị các tùy chọn và chuyển đổi giữa chúng bằng cách sử dụng các phím mũi tên lên và xuống.

Về cơ bản bạn có được hành vi này miễn phí, chỉ bằng cách sử dụng các phần tử phù hợp, ví dụ:

```html example-good
<h1>Liên kết</h1>

<p>Đây là liên kết đến <a href="https://www.mozilla.org">Mozilla</a>.</p>

<p>
  Một liên kết khác, đến
  <a href="https://developer.mozilla.org">Mozilla Developer Network</a>.
</p>

<h2>Nút</h2>

<p>
  <button data-message="Đây là từ nút đầu tiên">Nhấp vào tôi!</button>
  <button data-message="Đây là từ nút thứ hai">Nhấp vào tôi cũng!</button>
  <button data-message="Đây là từ nút thứ ba">Và tôi!</button>
</p>

<h2>Biểu mẫu</h2>

<form>
  <div>
    <label for="name">Điền tên của bạn:</label>
    <input type="text" id="name" name="name" />
  </div>
  <div>
    <label for="age">Nhập tuổi của bạn:</label>
    <input type="text" id="age" name="age" />
  </div>
  <div>
    <label for="mood">Chọn tâm trạng của bạn:</label>
    <select id="mood" name="mood">
      <option>Vui vẻ</option>
      <option>Buồn</option>
      <option>Tức giận</option>
      <option>Lo lắng</option>
    </select>
  </div>
</form>
```

Điều này có nghĩa là sử dụng liên kết, nút, phần tử biểu mẫu và nhãn một cách thích hợp (bao gồm phần tử {{htmlelement("label")}} cho các điều khiển biểu mẫu).

Tuy nhiên, đây là trường hợp khác mà đôi khi mọi người làm những thứ kỳ lạ với HTML. Ví dụ, đôi khi bạn thấy các nút được đánh dấu bằng {{htmlelement("div")}}, ví dụ:

```html example-bad
<div data-message="Đây là từ nút đầu tiên">Nhấp vào tôi!</div>
<div data-message="Đây là từ nút thứ hai">Nhấp vào tôi cũng!</div>
<div data-message="Đây là từ nút thứ ba">Và tôi!</div>
```

Nhưng sử dụng mã như vậy không được khuyến nghị — bạn ngay lập tức mất khả năng tiếp cận bàn phím gốc mà bạn sẽ có nếu chỉ sử dụng các phần tử {{htmlelement("button")}}, cộng với bạn không nhận được bất kỳ kiểu CSS mặc định nào mà các nút có. Trong trường hợp hiếm gặp hoặc không tồn tại khi bạn cần sử dụng phần tử không phải nút cho nút, hãy sử dụng [vai trò `button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role) và triển khai tất cả các hành vi nút mặc định, bao gồm hỗ trợ bàn phím và chuột.

#### Xây dựng lại khả năng tiếp cận bàn phím

Thêm lại các lợi thế như vậy đòi hỏi một chút công việc (bạn có thể thấy ví dụ trong ví dụ [fake-div-buttons.html](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/fake-div-buttons.html) của chúng tôi — cũng xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/accessibility/fake-div-buttons.html)). Ở đây chúng tôi đã cho các nút `<div>` giả mạo của mình khả năng được tập trung (bao gồm qua tab) bằng cách cho mỗi cái thuộc tính `tabindex="0"`. Chúng tôi cũng bao gồm `role="button"` để người dùng trình đọc màn hình biết họ có thể tập trung và tương tác với phần tử:

```html
<div data-message="Đây là từ nút đầu tiên" tabindex="0" role="button">
  Nhấp vào tôi!
</div>
<div data-message="Đây là từ nút thứ hai" tabindex="0" role="button">
  Nhấp vào tôi cũng!
</div>
<div data-message="Đây là từ nút thứ ba" tabindex="0" role="button">
  Và tôi!
</div>
```

Về cơ bản, thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) chủ yếu được dùng để cho phép các phần tử có thể tab có thứ tự tab tùy chỉnh (được chỉ định theo thứ tự số dương), thay vì chỉ được tab qua theo thứ tự nguồn mặc định của chúng. Đây hầu như luôn là ý tưởng tồi, vì nó có thể gây ra nhầm lẫn lớn. Chỉ sử dụng nó nếu bạn thực sự cần, ví dụ, nếu bố cục hiển thị mọi thứ theo thứ tự trực quan rất khác với mã nguồn, và bạn muốn làm cho mọi thứ hoạt động hợp lý hơn. Có hai tùy chọn khác cho `tabindex`:

- `tabindex="0"` — như đã chỉ ra ở trên, giá trị này cho phép các phần tử thường không có thể tab trở thành có thể tab. Đây là giá trị hữu ích nhất của `tabindex`.
- `tabindex="-1"` — điều này cho phép các phần tử thường không có thể tab nhận tiêu điểm theo chương trình, ví dụ qua JavaScript, hoặc là đích của liên kết.

Trong khi phần bổ sung ở trên cho phép chúng tôi tab đến các nút, nó không cho phép chúng tôi kích hoạt chúng qua phím <kbd>Enter</kbd>/<kbd>Return</kbd>. Để làm điều đó, chúng tôi phải thêm đoạn JavaScript sau:

```js
document.onkeydown = (e) => {
  // Phím Enter/Return
  if (e.key === "Enter") {
    document.activeElement.click();
  }
};
```

Ở đây chúng tôi thêm một người nghe vào đối tượng `document` để phát hiện khi một nút đã được nhấn trên bàn phím. Chúng tôi kiểm tra nút nào được nhấn thông qua thuộc tính [`key`](/en-US/docs/Web/API/KeyboardEvent/key) của đối tượng sự kiện; nếu nút được nhấn là <kbd>Enter</kbd>/<kbd>Return</kbd>, chúng tôi chạy hàm được lưu trữ trong trình xử lý `onclick` của nút bằng cách sử dụng `document.activeElement.click()`. [`activeElement`](/en-US/docs/Web/API/Document/activeElement) cho chúng tôi phần tử hiện đang được tập trung trên trang.

Đây là rất nhiều rắc rối thêm để xây dựng lại chức năng. Và chắc chắn sẽ có các vấn đề khác với nó. **Tốt hơn là chỉ sử dụng phần tử đúng cho công việc đúng ngay từ đầu.**

#### Sử dụng nhãn văn bản có ý nghĩa

Nhãn văn bản điều khiển UI rất hữu ích cho tất cả người dùng, nhưng làm cho chúng đúng đặc biệt quan trọng đối với người dùng khuyết tật.

Bạn nên đảm bảo rằng nhãn văn bản nút và liên kết của bạn có thể hiểu được và rõ ràng. Đừng chỉ sử dụng "Nhấp vào đây" cho nhãn của bạn, vì người dùng trình đọc màn hình đôi khi hiển thị danh sách các nút và điều khiển biểu mẫu. Ảnh chụp màn hình sau đây hiển thị các điều khiển của chúng tôi được liệt kê bởi VoiceOver trên Mac.

![Danh sách nhãn đầu vào biểu mẫu được liệt kê bởi phần mềm VoiceOver trên Mac. Danh sách này chứa các nhãn vô nghĩa như 'happy menu button' được đặt cho các điều khiển biểu mẫu khác nhau như nút, trường văn bản và liên kết](voiceover-formcontrols.png)

Hãy đảm bảo nhãn của bạn có ý nghĩa ngoài ngữ cảnh, được đọc riêng lẻ, cũng như trong ngữ cảnh của đoạn văn chúng đang ở trong. Ví dụ, đoạn sau đây cho thấy ví dụ về văn bản liên kết tốt:

```html example-good
<p>
  Cá voi là những sinh vật thực sự tuyệt vời.
  <a href="whales.html">Tìm hiểu thêm về cá voi</a>.
</p>
```

nhưng đây là văn bản liên kết xấu:

```html example-bad
<p>
  Cá voi là những sinh vật thực sự tuyệt vời. Để tìm hiểu thêm về cá voi,
  <a href="whales.html">nhấp vào đây</a>.
</p>
```

> [!NOTE]
> Bạn có thể tìm thêm về triển khai liên kết và thực hành tốt nhất trong bài viết [Tạo liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links) của chúng tôi. Bạn cũng có thể thấy một số ví dụ tốt và xấu tại [good-links.html](https://mdn.github.io/learning-area/accessibility/html/good-links.html) và [bad-links.html](https://mdn.github.io/learning-area/accessibility/html/bad-links.html).

Nhãn biểu mẫu cũng quan trọng để cung cấp cho bạn gợi ý về những gì bạn cần nhập vào mỗi đầu vào biểu mẫu. Điều sau đây có vẻ như là ví dụ khá hợp lý:

```html example-bad
Điền tên của bạn: <input type="text" id="name" name="name" />
```

Tuy nhiên, điều này không hữu ích lắm cho người dùng khuyết tật. Không có gì trong ví dụ trên để kết hợp nhãn rõ ràng với đầu vào biểu mẫu và làm rõ cách điền vào nếu bạn không thể nhìn thấy nó. Nếu bạn truy cập điều này với một số trình đọc màn hình, bạn chỉ có thể được mô tả theo kiểu "chỉnh sửa văn bản."

Ví dụ sau đây tốt hơn nhiều:

```html example-good
<div>
  <label for="name">Điền tên của bạn:</label>
  <input type="text" id="name" name="name" />
</div>
```

Với mã như thế này, nhãn sẽ được liên kết rõ ràng với đầu vào; mô tả sẽ giống hơn "Điền tên của bạn: chỉnh sửa văn bản."

![Nhãn biểu mẫu tốt đọc 'Fill in your name' được đặt cho điều khiển biểu mẫu đầu vào văn bản.](voiceover-good-form-label.png)

Như một phần thưởng thêm, trong hầu hết các trình duyệt, việc liên kết nhãn với đầu vào biểu mẫu có nghĩa là bạn có thể nhấp vào nhãn để chọn hoặc kích hoạt phần tử biểu mẫu. Điều này cho đầu vào một vùng nhấn lớn hơn, giúp dễ chọn hơn.

> [!NOTE]
> Bạn có thể thấy một số ví dụ biểu mẫu tốt và xấu trong [good-form.html](https://mdn.github.io/learning-area/accessibility/html/good-form.html) và [bad-form.html](https://mdn.github.io/learning-area/accessibility/html/bad-form.html).

Bạn có thể tìm thấy giải thích hay về tầm quan trọng của nhãn văn bản đúng đắn, và cách điều tra các vấn đề nhãn văn bản bằng cách sử dụng [Trình kiểm tra khả năng tiếp cận Firefox](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/index.html), trong video sau:

{{EmbedYouTube("YhlAVlfH0rQ")}}

## Bảng dữ liệu dễ tiếp cận

Một bảng dữ liệu cơ bản có thể được viết với đánh dấu rất đơn giản, ví dụ:

```html
<table>
  <tr>
    <td>Tên</td>
    <td>Tuổi</td>
    <td>Đại từ</td>
  </tr>
  <tr>
    <td>Gabriel</td>
    <td>13</td>
    <td>anh/anh ấy</td>
  </tr>
  <tr>
    <td>Elva</td>
    <td>8</td>
    <td>cô/cô ấy</td>
  </tr>
  <tr>
    <td>Freida</td>
    <td>5</td>
    <td>cô/cô ấy</td>
  </tr>
</table>
```

Nhưng điều này có vấn đề — người dùng trình đọc màn hình không có cách nào để liên kết các hàng hoặc cột cùng nhau như nhóm dữ liệu. Để làm điều này, bạn cần biết các hàng tiêu đề là gì và nếu chúng đang đứng đầu các hàng, cột, v.v. Điều này chỉ có thể thực hiện trực quan cho bảng ở trên (xem [bad-table.html](https://mdn.github.io/learning-area/accessibility/html/bad-table.html) và thử ví dụ tự mình).

Bây giờ hãy xem [ví dụ bảng ban nhạc punk](https://github.com/mdn/learning-area/blob/main/css/styling-boxes/styling-tables/punk-bands-complete.html) của chúng tôi — bạn có thể thấy một vài hỗ trợ khả năng tiếp cận đang hoạt động ở đây:

- Tiêu đề bảng được định nghĩa bằng các phần tử {{htmlelement("th")}} — bạn cũng có thể chỉ định nếu chúng là tiêu đề cho hàng hoặc cột bằng cách sử dụng thuộc tính `scope`. Điều này cung cấp cho bạn các nhóm dữ liệu hoàn chỉnh có thể được trình đọc màn hình sử dụng như các đơn vị đơn.
- Phần tử {{htmlelement("caption")}} và thuộc tính `summary` của phần tử `<table>` đều thực hiện công việc tương tự — chúng hoạt động như alt text cho bảng, cung cấp cho người dùng trình đọc màn hình một bản tóm tắt nhanh hữu ích về nội dung của bảng. Phần tử `<caption>` thường được ưu tiên hơn vì nó làm cho nội dung của nó có thể truy cập được cho cả người dùng sáng mắt, những người cũng có thể thấy nó hữu ích. Bạn không thực sự cần cả hai.

> [!NOTE]
> Xem bài viết [Khả năng tiếp cận bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility) của chúng tôi để biết thêm chi tiết về bảng dữ liệu dễ tiếp cận.

## Văn bản thay thế

Trong khi nội dung văn bản vốn có khả năng tiếp cận, điều này không nhất thiết đúng với nội dung đa phương tiện — nội dung hình ảnh và video không thể nhìn thấy được bởi người khiếm thị, và nội dung âm thanh không thể nghe được bởi người khiếm thính. Chúng ta đề cập đến nội dung video và âm thanh chi tiết trong [Đa phương tiện dễ tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia), nhưng trong bài viết này chúng ta sẽ xem xét khả năng tiếp cận cho phần tử {{htmlelement("img")}} khiêm tốn.

Chúng ta có một ví dụ đơn giản được viết, [accessible-image.html](https://mdn.github.io/learning-area/accessibility/html/accessible-image.html), có bốn bản sao của cùng một hình ảnh:

```html
<img src="dinosaur.png" />

<img
  src="dinosaur.png"
  alt="Một khủng long Tyrannosaurus Rex màu đỏ: Một khủng long hai chân đứng thẳng như người, với cánh tay nhỏ, và cái đầu lớn với nhiều răng sắc." />

<img
  src="dinosaur.png"
  alt="Một khủng long Tyrannosaurus Rex màu đỏ: Một khủng long hai chân đứng thẳng như người, với cánh tay nhỏ, và cái đầu lớn với nhiều răng sắc."
  title="Khủng long đỏ Mozilla" />

<img src="dinosaur.png" aria-labelledby="dino-label" />

<p id="dino-label">
  Khủng long Tyrannosaurus Rex đỏ của Mozilla: Một khủng long hai chân đứng
  thẳng như người, với cánh tay nhỏ, và cái đầu lớn với nhiều răng sắc.
</p>
```

Hình ảnh đầu tiên, khi được xem bởi trình đọc màn hình, không thực sự cung cấp nhiều trợ giúp cho người dùng — VoiceOver chẳng hạn đọc "/dinosaur.png, hình ảnh". Nó đọc tên tệp để cố gắng cung cấp một số trợ giúp. Trong ví dụ này, người dùng ít nhất sẽ biết đó là khủng long nào đó, nhưng thường các tệp có thể được tải lên với tên tệp do máy tạo ra (ví dụ từ máy ảnh kỹ thuật số) và những tên tệp này có thể không cung cấp bất kỳ ngữ cảnh nào về nội dung của hình ảnh.

> [!NOTE]
> Đây là lý do tại sao bạn không bao giờ nên bao gồm nội dung văn bản bên trong hình ảnh — trình đọc màn hình không thể truy cập nó. Cũng có những bất lợi khác — bạn không thể chọn nó và sao chép/dán nó. Đừng làm vậy!

Khi trình đọc màn hình gặp hình ảnh thứ hai, nó đọc toàn bộ thuộc tính alt — "Một khủng long Tyrannosaurus Rex màu đỏ: Một khủng long hai chân đứng thẳng như người, với cánh tay nhỏ, và cái đầu lớn với nhiều răng sắc.".

Điều này làm nổi bật tầm quan trọng của việc không chỉ sử dụng tên tệp có ý nghĩa trong trường hợp **alt text** không có sẵn, mà còn đảm bảo rằng alt text được cung cấp trong các thuộc tính `alt` bất cứ khi nào có thể.

Lưu ý rằng nội dung của thuộc tính `alt` phải luôn cung cấp biểu diễn trực tiếp của hình ảnh và những gì nó truyền đạt trực quan. Alt text phải ngắn gọn và bao gồm tất cả thông tin được truyền đạt trong hình ảnh không được nhân đôi trong văn bản xung quanh.

Nội dung của thuộc tính `alt` cho một hình ảnh đơn khác nhau dựa trên ngữ cảnh. Ví dụ, nếu ảnh của Fluffy là avatar bên cạnh đánh giá về thức ăn chó Yuckymeat, `alt="Fluffy"` là phù hợp. Nếu ảnh là một phần của trang nhận nuôi của Fluffy cho tổ chức cứu trợ động vật, thông tin được truyền đạt trong hình ảnh có liên quan cho cha mẹ nuôi tiềm năng không được nhân đôi trong văn bản xung quanh nên được bao gồm. Một mô tả dài hơn, chẳng hạn như `alt="Fluffy, một con chó cỡ ba màu với tóc rất ngắn, có bóng tennis trong miệng."` là phù hợp. Vì văn bản xung quanh có thể đã có kích thước và giống chó của Fluffy, điều đó không được bao gồm trong `alt`. Tuy nhiên, vì tiểu sử của con chó có thể không bao gồm độ dài tóc, màu sắc hoặc sở thích đồ chơi, điều đó được bao gồm. Hình ảnh ở ngoài trời, hay Fluffy có dây da đỏ với vòng cổ xanh không? Không quan trọng trong việc nhận nuôi thú cưng và do đó không được bao gồm. Tất cả thông tin mà hình ảnh truyền đạt mà người dùng sáng mắt có thể truy cập và có liên quan đến ngữ cảnh là những gì cần được truyền đạt; không hơn. Giữ nó ngắn gọn, chính xác và hữu ích.

Bất kỳ kiến ​​thức cá nhân hoặc mô tả thêm nào không nên được bao gồm ở đây, vì nó không hữu ích cho những người chưa nhìn thấy hình ảnh trước đây.

Một điều cần xem xét là liệu hình ảnh của bạn có ý nghĩa bên trong nội dung của bạn, hay chúng thuần túy để trang trí trực quan và do đó không có ý nghĩa. Nếu chúng trang trí, tốt hơn là viết một văn bản trống như giá trị cho thuộc tính `alt` (xem [Thuộc tính alt trống](#empty_alt_attributes)) hoặc chỉ bao gồm chúng trong trang như hình nền CSS.

> [!NOTE]
> Đọc [Hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images) và [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images) để biết thêm nhiều thông tin về triển khai hình ảnh và thực hành tốt nhất.
> Bạn cũng có thể kiểm tra [Cây quyết định alt](https://www.w3.org/WAI/tutorials/images/decision-tree/) để tìm hiểu cách sử dụng thuộc tính alt cho hình ảnh trong các tình huống khác nhau.

Nếu bạn muốn cung cấp thêm thông tin ngữ cảnh, bạn nên đặt nó trong văn bản xung quanh hình ảnh, hoặc bên trong thuộc tính `title`, như đã hiển thị ở trên. Trong trường hợp này, hầu hết trình đọc màn hình sẽ đọc alt text, thuộc tính title, và tên tệp. Ngoài ra, trình duyệt hiển thị văn bản title như tooltip khi di chuyển chuột qua.

![Ảnh chụp màn hình của Tyrannosaurus Rex màu đỏ với văn bản "The mozilla red dinosaur" được hiển thị như tooltip khi di chuyển chuột qua.](title-attribute.png)

Hãy xem nhanh phương pháp thứ tư:

```html
<img src="dinosaur.png" aria-labelledby="dino-label" />

<p id="dino-label">Khủng long Tyrannosaurus Rex đỏ của Mozilla…</p>
```

Trong trường hợp này, chúng ta không sử dụng thuộc tính `alt` gì cả — thay vào đó, chúng ta đã trình bày mô tả của hình ảnh như một đoạn văn bản thông thường, đặt cho nó một `id`, và sau đó sử dụng thuộc tính `aria-labelledby` để tham chiếu đến `id` đó, điều này khiến trình đọc màn hình sử dụng đoạn văn đó như alt text/nhãn cho hình ảnh đó. Điều này đặc biệt hữu ích nếu bạn muốn sử dụng cùng một văn bản như nhãn cho nhiều hình ảnh — điều không thể thực hiện với `alt`.

> [!NOTE]
> [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) là một phần của đặc tả [WAI-ARIA](https://w3c.github.io/aria/), cho phép các nhà phát triển thêm ngữ nghĩa bổ sung vào đánh dấu của họ để cải thiện khả năng tiếp cận trình đọc màn hình khi cần.

### Hình và chú thích hình

HTML bao gồm hai phần tử — {{htmlelement("figure")}} và {{htmlelement("figcaption")}} — kết hợp một hình ảnh nào đó (có thể là bất cứ thứ gì, không nhất thiết là hình ảnh) với chú thích hình ảnh:

```html
<figure>
  <img
    src="dinosaur.png"
    alt="Khủng long Tyrannosaurus Mozilla"
    aria-describedby="dinodescr" />
  <figcaption id="dinodescr">
    Một khủng long Tyrannosaurus Rex màu đỏ: Một khủng long hai chân đứng thẳng
    như người, với cánh tay nhỏ, và cái đầu lớn với nhiều răng sắc.
  </figcaption>
</figure>
```

Mặc dù có hỗ trợ trình đọc màn hình hỗn hợp về việc kết hợp chú thích hình ảnh với hình ảnh của chúng, nhưng việc bao gồm [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) tạo ra sự liên kết nếu không có sự liên kết nào. Ngoài ra, cấu trúc phần tử hữu ích cho kiểu dáng CSS, và nó cung cấp một cách để đặt mô tả hình ảnh bên cạnh nó trong nguồn.

### Thuộc tính alt trống

```html
<h3>
  <img src="article-icon.png" alt="" />
  Tyrannosaurus Rex: vua của khủng long
</h3>
```

Có thể có những lúc một hình ảnh được bao gồm trong thiết kế của trang, nhưng mục đích chính của nó là để trang trí trực quan. Bạn sẽ nhận thấy trong ví dụ mã ở trên rằng thuộc tính `alt` của hình ảnh là trống — điều này là để làm cho trình đọc màn hình nhận ra hình ảnh, nhưng không cố gắng mô tả hình ảnh (thay vào đó chúng chỉ nói "hình ảnh", hoặc tương tự).

Lý do sử dụng `alt` trống thay vì không bao gồm nó là vì nhiều trình đọc màn hình thông báo toàn bộ URL hình ảnh nếu không có `alt` nào được cung cấp. Trong ví dụ trên, hình ảnh đang hoạt động như trang trí trực quan cho tiêu đề mà nó được liên kết. Trong các trường hợp như thế này, và trong các trường hợp mà hình ảnh chỉ là trang trí và không có giá trị nội dung, bạn nên bao gồm `alt` trống trong các phần tử `img` của bạn. Một lựa chọn khác là sử dụng thuộc tính aria [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) [`role="presentation"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) vì điều này cũng ngăn trình đọc màn hình đọc alt text.

> [!NOTE]
> Nếu có thể, bạn nên sử dụng CSS để hiển thị hình ảnh chỉ để trang trí.

## Thêm về liên kết

Liên kết (phần tử [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a) với thuộc tính `href`), tùy thuộc vào cách chúng được sử dụng, có thể giúp hoặc gây hại cho khả năng tiếp cận. Theo mặc định, liên kết có thể truy cập về mặt ngoại hình. Chúng có thể cải thiện khả năng tiếp cận bằng cách giúp người dùng nhanh chóng điều hướng đến các phần khác nhau của tài liệu. Chúng cũng có thể gây hại cho khả năng tiếp cận nếu kiểu dáng dễ tiếp cận của chúng bị xóa hoặc nếu JavaScript khiến chúng hoạt động theo những cách không mong đợi.

### Kiểu dáng liên kết

Theo mặc định, liên kết nhìn khác về mặt trực quan so với văn bản khác cả về màu sắc và [trang trí văn bản](/en-US/docs/Web/CSS/Reference/Properties/text-decoration), với liên kết màu xanh lam và có gạch chân theo mặc định, màu tím và có gạch chân nếu đã truy cập, và với [vòng tiêu điểm](/en-US/docs/Web/CSS/Reference/Selectors/:focus) khi chúng nhận được tiêu điểm bàn phím.

Màu sắc không nên được sử dụng như phương pháp duy nhất để phân biệt liên kết với nội dung không liên kết. Màu văn bản liên kết, như tất cả văn bản, phải khác đáng kể so với màu nền ([tương phản 4.5:1](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)). Ngoài ra, liên kết nên nhìn thấy khác biệt đáng kể so với văn bản không liên kết, với yêu cầu tương phản tối thiểu 3:1 giữa văn bản liên kết và văn bản xung quanh và giữa trạng thái mặc định, đã truy cập và tiêu điểm/hoạt động và tương phản 4.5:1 giữa tất cả các màu trạng thái đó và màu nền.

### Sự kiện `onclick`

Thẻ anchor thường bị lạm dụng với sự kiện `onclick` để tạo nút giả bằng cách đặt **href** thành `"#"` hoặc `"javascript:void(0)"` để ngăn trang làm mới.

Các giá trị này gây ra hành vi không mong đợi khi sao chép hoặc kéo liên kết, mở liên kết trong tab hoặc cửa sổ mới, đánh dấu trang, và khi JavaScript vẫn đang tải xuống, xuất lỗi hoặc bị tắt. Điều này cũng truyền đạt ngữ nghĩa không chính xác đến các công nghệ hỗ trợ (ví dụ: trình đọc màn hình). Trong các trường hợp này, nên sử dụng {{HTMLElement("button")}} thay thế. Nói chung bạn chỉ nên sử dụng anchor để điều hướng bằng URL đúng.

### Liên kết bên ngoài và liên kết đến tài nguyên không phải HTML

Các liên kết mở trong tab hoặc cửa sổ mới thông qua khai báo `target="_blank"` và các liên kết có giá trị `href` trỏ đến tài nguyên tệp nên bao gồm chỉ báo về hành vi sẽ xảy ra khi liên kết được kích hoạt.

Người có thị lực thấp, điều hướng với sự hỗ trợ của công nghệ đọc màn hình, hoặc có mối lo ngại về nhận thức có thể bị nhầm lẫn khi tab, cửa sổ hoặc ứng dụng mới được mở ra bất ngờ. Các phiên bản cũ hơn của phần mềm đọc màn hình có thể thậm chí không thông báo hành vi này.

#### Liên kết mở tab hoặc cửa sổ mới

```html
<a target="_blank" href="https://www.wikipedia.org/"
  >Wikipedia (mở trong cửa sổ mới)</a
>
```

#### Liên kết đến tài nguyên không phải HTML

```html
<a target="_blank" href="2017-annual-report.ppt"
  >Báo cáo thường niên 2017 (PowerPoint)</a
>
```

Nếu một biểu tượng được sử dụng thay cho văn bản để biểu thị loại hành vi liên kết này, hãy đảm bảo nó bao gồm [mô tả thay thế](/en-US/docs/Web/HTML/Reference/Elements/img#alt).

- [WebAIM: Liên kết và siêu văn bản - Liên kết siêu văn bản](https://webaim.org/techniques/hypertext/hypertext_links)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 3.2](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.2_—_predictable_make_web_pages_appear_and_operate_in_predictable_ways)
- [G200: Mở cửa sổ và tab mới từ liên kết chỉ khi cần thiết | Kỹ thuật W3C cho WCAG 2.0](https://www.w3.org/TR/WCAG20-TECHS/G200.html)
- [G201: Cảnh báo người dùng trước khi mở cửa sổ mới | Kỹ thuật W3C cho WCAG 2.0](https://www.w3.org/TR/WCAG20-TECHS/G201.html)

### Liên kết bỏ qua

Liên kết bỏ qua, còn được gọi là skipnav, là một phần tử `a` được đặt càng gần phần tử {{HTMLElement("body")}} mở đầu càng tốt và liên kết đến đầu nội dung chính của trang. Liên kết này cho phép mọi người bỏ qua nội dung được lặp lại trên nhiều trang của trang web, chẳng hạn như tiêu đề và điều hướng chính của trang web.

Liên kết bỏ qua đặc biệt hữu ích cho những người điều hướng với sự hỗ trợ của công nghệ hỗ trợ như điều khiển công tắc, lệnh giọng nói hoặc gậy miệng/gậy đầu, trong đó hành động di chuyển qua các liên kết lặp lại có thể là công việc vất vả.

- [WebAIM: Liên kết "Bỏ qua điều hướng"](https://webaim.org/techniques/skipnav/)
- [Cách thực hiện: Sử dụng liên kết điều hướng bỏ qua - Dự án A11Y](https://www.a11yproject.com/posts/skip-nav-links/)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 2.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.4_%e2%80%94_navigable_provide_ways_to_help_users_navigate_find_content_and_determine_where_they_are)
- [Hiểu Tiêu chí thành công 2.4.1 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-skip.html)

### Khoảng cách gần nhau

Lượng lớn nội dung tương tác — bao gồm các anchor — được đặt gần nhau về mặt trực quan nên có khoảng cách được chèn vào để phân tách chúng. Khoảng cách này có lợi cho những người bị các vấn đề kiểm soát vận động tinh tế và có thể vô tình kích hoạt nội dung tương tác sai khi điều hướng.

Khoảng cách có thể được tạo ra bằng các thuộc tính CSS như {{CSSxRef("margin")}}.

- [Run (cơn run) tay và vấn đề nút khổng lồ - Axess Lab](https://axesslab.com/hand-tremors/)

## Tóm tắt

Bây giờ bạn nên thành thạo trong việc viết HTML dễ tiếp cận cho hầu hết các trường hợp. Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra bạn có thể sử dụng để kiểm tra mức độ hiểu và giữ lại tất cả thông tin này.

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Tooling","Learn_web_development/Core/Accessibility/Test_your_skills/HTML", "Learn_web_development/Core/Accessibility")}}
