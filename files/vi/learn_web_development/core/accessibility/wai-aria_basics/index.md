---
title: Kiến thức cơ bản về WAI-ARIA
short-title: WAI-ARIA
slug: Learn_web_development/Core/Accessibility/WAI-ARIA_basics
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Test_your_skills/CSS_and_JavaScript","Learn_web_development/Core/Accessibility/Test_your_skills/WAI-ARIA", "Learn_web_development/Core/Accessibility")}}

Tiếp nối bài viết trước, đôi khi việc tạo các điều khiển giao diện người dùng phức tạp liên quan đến HTML không có ngữ nghĩa và nội dung được cập nhật động bằng JavaScript có thể khó khăn. WAI-ARIA là công nghệ có thể giúp giải quyết các vấn đề như vậy bằng cách thêm ngữ nghĩa bổ sung mà trình duyệt và công nghệ hỗ trợ có thể nhận biết và sử dụng để cho người dùng biết điều gì đang xảy ra. Ở đây chúng ta sẽ chỉ ra cách sử dụng nó ở mức độ cơ bản để cải thiện khả năng tiếp cận.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và các thực hành tốt nhất về khả năng tiếp cận như đã học trong các bài học trước trong mô-đun</a>.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mục đích của WAI-ARIA — để cung cấp ngữ nghĩa cho HTML không có ngữ nghĩa, để người dùng AT có thể hiểu các giao diện đang được trình bày cho họ.</li>
          <li>Cú pháp cơ bản — vai trò, thuộc tính và trạng thái.</li>
          <li>Điểm mốc và biển chỉ dẫn.</li>
          <li>Tăng cường khả năng tiếp cận bàn phím.</li>
          <li>Thông báo cập nhật nội dung động với vùng trực tiếp.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## WAI-ARIA là gì?

Hãy bắt đầu bằng cách xem WAI-ARIA là gì, và những gì nó có thể làm cho chúng ta.

### Một bộ vấn đề hoàn toàn mới

Khi các ứng dụng web bắt đầu trở nên phức tạp và năng động hơn, một bộ tính năng và vấn đề khả năng tiếp cận mới bắt đầu xuất hiện.

Ví dụ, HTML đã giới thiệu một số phần tử ngữ nghĩa để định nghĩa các tính năng trang phổ biến ({{htmlelement("nav")}}, {{htmlelement("footer")}}, v.v.). Trước khi những phần tử này có sẵn, các nhà phát triển sẽ sử dụng {{htmlelement("div")}} với các ID hoặc lớp, ví dụ `<div class="nav">`, nhưng những cái này có vấn đề, vì không có cách dễ dàng để dễ dàng tìm thấy một tính năng trang cụ thể như điều hướng chính theo chương trình.

Giải pháp ban đầu là thêm một hoặc nhiều liên kết ẩn ở đầu trang để liên kết đến điều hướng (hoặc bất cứ thứ gì khác), ví dụ:

```html
<a href="#hidden" class="hidden">Bỏ qua đến điều hướng</a>
```

Nhưng điều này vẫn không chính xác lắm, và chỉ có thể được sử dụng khi trình đọc màn hình đang đọc từ đầu trang.

Ví dụ khác, các ứng dụng bắt đầu có các điều khiển phức tạp như bộ chọn ngày để chọn ngày, thanh trượt để chọn giá trị, v.v. HTML cung cấp các loại đầu vào đặc biệt để hiển thị các điều khiển như vậy:

```html
<input type="date" /> <input type="range" />
```

Những thứ này ban đầu không được hỗ trợ tốt và vẫn còn khó tạo kiểu đến mức nào đó, dẫn đến các nhà thiết kế và nhà phát triển chọn các giải pháp tùy chỉnh. Thay vì sử dụng các tính năng gốc này, một số nhà phát triển dựa vào các thư viện JavaScript tạo ra các điều khiển như vậy như một loạt các {{htmlelement("div")}} lồng nhau được tạo kiểu bằng CSS và điều khiển bằng JavaScript.

Vấn đề ở đây là về mặt trực quan chúng hoạt động, nhưng trình đọc màn hình không thể hiểu gì về chúng, và người dùng của chúng chỉ được nói rằng họ có thể thấy một mớ hỗn độn các phần tử mà không có ngữ nghĩa để mô tả chúng có nghĩa gì.

### Giới thiệu WAI-ARIA

[WAI-ARIA](https://w3c.github.io/aria/) (Sáng kiến Khả năng tiếp cận Web - Ứng dụng Internet phong phú có thể truy cập) là một đặc tả được viết bởi W3C, xác định một tập hợp các thuộc tính HTML bổ sung có thể được áp dụng cho các phần tử để cung cấp ngữ nghĩa bổ sung và cải thiện khả năng tiếp cận bất cứ khi nào nó còn thiếu. Có ba tính năng chính được định nghĩa trong đặc tả:

- [Vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
  - : Những cái này xác định phần tử là gì hoặc làm gì. Nhiều trong số này là cái gọi là vai trò điểm mốc, chủ yếu nhân đôi giá trị ngữ nghĩa của các phần tử cấu trúc, chẳng hạn như `role="navigation"` ({{htmlelement("nav")}}), `role="banner"` ({{htmlelement("header")}} tài liệu), `role="complementary"` ({{htmlelement("aside")}}) hoặc, `role="search"` ({{htmlelement("search")}}). Một số vai trò khác mô tả các cấu trúc trang khác nhau không có phần tử khớp với các vai trò đó, chẳng hạn như `role="tablist"`, và `role="tabpanel"`, thường được tìm thấy trong các UI.
- Thuộc tính
  - : Những cái này xác định thuộc tính của các phần tử, có thể được sử dụng để cung cấp cho chúng ý nghĩa hoặc ngữ nghĩa thêm. Ví dụ, `aria-required="true"` chỉ định rằng đầu vào biểu mẫu cần được điền vào để hợp lệ, trong khi `aria-labelledby="label"` cho phép bạn đặt một ID trên một phần tử, sau đó tham chiếu nó như là nhãn cho bất cứ thứ gì khác trên trang, bao gồm nhiều phần tử, điều không thể thực hiện bằng cách sử dụng `<label for="input">`. Ví dụ, bạn có thể sử dụng `aria-labelledby` để chỉ định rằng mô tả chính được chứa trong {{htmlelement("div")}} là nhãn cho nhiều ô bảng, hoặc bạn có thể sử dụng nó như là thay thế cho alt text hình ảnh — chỉ định thông tin hiện có trên trang là alt text của hình ảnh, thay vì phải lặp lại nó bên trong thuộc tính `alt`. Bạn có thể thấy ví dụ về điều này tại [Văn bản thay thế](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#text_alternatives).
- Trạng thái
  - : Các thuộc tính đặc biệt xác định điều kiện hiện tại của các phần tử, chẳng hạn như `aria-disabled="true"`, chỉ định cho trình đọc màn hình rằng đầu vào biểu mẫu hiện đang bị tắt. Trạng thái khác với thuộc tính ở chỗ thuộc tính không thay đổi trong suốt vòng đời của ứng dụng, trong khi trạng thái có thể thay đổi, thường là theo chương trình qua JavaScript.

Một điểm quan trọng về các thuộc tính WAI-ARIA là chúng không ảnh hưởng đến bất cứ điều gì về trang web, ngoại trừ thông tin được hiển thị bởi API khả năng tiếp cận của trình duyệt (nơi trình đọc màn hình lấy thông tin của họ). WAI-ARIA không ảnh hưởng đến cấu trúc trang web, DOM, v.v., mặc dù các thuộc tính có thể hữu ích để chọn các phần tử bằng CSS.

> [!NOTE]
> Bạn có thể tìm thấy danh sách hữu ích về tất cả các vai trò ARIA và cách sử dụng của chúng, với liên kết đến thông tin thêm, trong đặc tả WAI-ARIA — xem [Định nghĩa về vai trò](https://w3c.github.io/aria/#role_definitions) — trên trang này — xem [Vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles).
>
> Đặc tả cũng chứa danh sách tất cả các thuộc tính và trạng thái, với liên kết đến thông tin thêm — xem [Định nghĩa về Trạng thái và Thuộc tính (tất cả thuộc tính `aria-*`)](https://w3c.github.io/aria/#state_prop_def).

## WAI-ARIA được hỗ trợ ở đâu?

Đây không phải là câu hỏi dễ trả lời. Thật khó để tìm một tài nguyên xác định nêu rõ những tính năng nào của WAI-ARIA được hỗ trợ, và ở đâu, vì:

1. Có rất nhiều tính năng trong đặc tả WAI-ARIA.
2. Có nhiều kết hợp hệ điều hành, trình duyệt và trình đọc màn hình cần xem xét.

Điểm cuối cùng này là chìa khóa — Để sử dụng trình đọc màn hình ngay từ đầu, hệ điều hành của bạn cần chạy các trình duyệt có các API khả năng tiếp cận cần thiết để hiển thị thông tin mà trình đọc màn hình cần để thực hiện công việc của họ. Hầu hết các HĐH phổ biến đều có một hoặc hai trình duyệt mà trình đọc màn hình có thể hoạt động cùng.

Tiếp theo, bạn cần lo lắng xem liệu các trình duyệt trong câu hỏi có hỗ trợ các tính năng ARIA và hiển thị chúng qua các API của chúng không, nhưng cũng liệu trình đọc màn hình có nhận ra thông tin đó và trình bày nó cho người dùng của họ theo cách hữu ích không.

1. Hỗ trợ trình duyệt gần như phổ biến.
2. Hỗ trợ trình đọc màn hình cho các tính năng ARIA chưa ở mức này, nhưng các trình đọc màn hình phổ biến nhất đang đạt đến đó. Bạn có thể có ý tưởng về mức độ hỗ trợ bằng cách xem bài viết [Tương thích trình đọc màn hình WAI-ARIA](https://www.powermapper.com/tests/screen-readers/aria/) của Powermapper.

Trong bài viết này, chúng tôi sẽ không cố gắng bao gồm mọi tính năng WAI-ARIA, và chi tiết hỗ trợ chính xác của nó. Thay vào đó, chúng tôi sẽ bao gồm các tính năng WAI-ARIA quan trọng nhất để bạn biết; nếu chúng tôi không đề cập đến bất kỳ chi tiết hỗ trợ nào, bạn có thể giả định rằng tính năng đó được hỗ trợ tốt. Chúng tôi sẽ rõ ràng đề cập đến bất kỳ ngoại lệ nào đối với điều này.

> [!NOTE]
> Một số thư viện JavaScript hỗ trợ WAI-ARIA, có nghĩa là khi chúng tạo ra các tính năng UI như điều khiển biểu mẫu phức tạp, chúng thêm các thuộc tính ARIA để cải thiện khả năng tiếp cận của những tính năng đó. Nếu bạn đang tìm kiếm giải pháp JavaScript bên thứ ba cho phát triển UI nhanh, bạn chắc chắn nên xem xét khả năng tiếp cận của các widget UI của nó như một yếu tố quan trọng khi đưa ra lựa chọn. Ví dụ tốt là jQuery UI (xem [Về jQuery UI: Hỗ trợ khả năng tiếp cận sâu](https://jqueryui.com/about/#deep-accessibility-support)), [ExtJS](https://www.sencha.com/products/extjs/), và [Dojo/Dijit](https://dojotoolkit.org/reference-guide/1.10/dijit/a11y/statement.html).

## Khi nào bạn nên sử dụng WAI-ARIA?

Chúng ta đã nói về một số vấn đề thúc đẩy việc tạo ra WAI-ARIA trước đây, nhưng về cơ bản, có bốn lĩnh vực chính mà WAI-ARIA hữu ích:

- Biển chỉ dẫn/Điểm mốc
  - : Các giá trị thuộc tính [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) của ARIA có thể hoạt động như điểm mốc nhân đôi ngữ nghĩa của các phần tử HTML (ví dụ {{htmlelement("nav")}}), hoặc vượt ra ngoài ngữ nghĩa HTML để cung cấp biển chỉ dẫn cho các khu vực chức năng khác nhau, ví dụ `search`, `tablist`, `tab`, `listbox`, v.v.
- Cập nhật nội dung động
  - : Trình đọc màn hình có xu hướng gặp khó khăn khi báo cáo nội dung liên tục thay đổi; với ARIA chúng ta có thể sử dụng `aria-live` để thông báo cho người dùng trình đọc màn hình khi khu vực nội dung được cập nhật động: ví dụ bởi JavaScript trên trang [lấy nội dung mới từ máy chủ và cập nhật DOM](/en-US/docs/Learn_web_development/Core/Scripting/Network_requests).
- Tăng cường khả năng tiếp cận bàn phím
  - : Có các phần tử HTML tích hợp có khả năng tiếp cận bàn phím gốc; khi các phần tử khác được sử dụng cùng với JavaScript để mô phỏng các tương tác tương tự, khả năng tiếp cận bàn phím và báo cáo trình đọc màn hình bị ảnh hưởng. Khi điều này không thể tránh khỏi, WAI-ARIA cung cấp một phương tiện để cho phép các phần tử khác nhận tiêu điểm (sử dụng `tabindex`).
- Khả năng tiếp cận của điều khiển không ngữ nghĩa
  - : Khi một loạt `<div>` lồng nhau cùng với CSS/JavaScript được sử dụng để tạo tính năng UI phức tạp, hoặc một điều khiển gốc được cải thiện/thay đổi nhiều qua JavaScript, khả năng tiếp cận có thể bị ảnh hưởng — người dùng trình đọc màn hình sẽ gặp khó khăn khi tìm hiểu tính năng đó làm gì nếu không có ngữ nghĩa hoặc manh mối khác. Trong những tình huống này, ARIA có thể giúp cung cấp những gì còn thiếu với sự kết hợp các vai trò như `button`, `listbox`, hoặc `tablist`, và các thuộc tính như `aria-required` hoặc `aria-posinset` để cung cấp manh mối thêm về chức năng.

Trong phần tiếp theo, chúng ta sẽ xem xét bốn lĩnh vực chính được mô tả ở trên chi tiết hơn, cùng với các ví dụ. Trước khi bạn tiếp tục, bạn nên thiết lập trình đọc màn hình để kiểm tra, để bạn có thể kiểm tra một số ví dụ khi bạn đi qua chúng. Xem phần [kiểm tra trình đọc màn hình](/en-US/docs/Learn_web_development/Core/Accessibility/Tooling#screen_readers) của chúng tôi để biết thêm thông tin.

> [!CALLOUT]
>
> **Bạn chỉ nên sử dụng WAI-ARIA khi bạn cần!**
>
> Sử dụng các phần tử HTML đúng cách ngầm mang lại cho bạn các vai trò cần thiết và bạn _luôn_ nên sử dụng [các tính năng HTML gốc](/en-US/docs/Learn_web_development/Core/Accessibility/HTML) để cung cấp ngữ nghĩa mà trình đọc màn hình yêu cầu để nói với người dùng của họ điều gì đang xảy ra. Đôi khi điều này không thể, vì bạn có quyền kiểm soát hạn chế đối với mã, hoặc vì bạn đang tạo ra thứ gì đó phức tạp không có phần tử HTML dễ dàng để triển khai nó. Trong những trường hợp như vậy, WAI-ARIA có thể là công cụ tăng cường khả năng tiếp cận có giá trị.
>
> Nhưng một lần nữa, chỉ sử dụng nó khi cần thiết!
>
> Ngoài ra, hãy thử đảm bảo bạn kiểm tra trang web của mình với nhiều loại người dùng _thực_ — người không khuyết tật, người sử dụng trình đọc màn hình, người sử dụng điều hướng bằng bàn phím, v.v. Họ sẽ có cái nhìn sâu sắc hơn bạn về việc nó hoạt động tốt như thế nào.

## Biển chỉ dẫn/Điểm mốc

WAI-ARIA thêm [thuộc tính `role`](https://w3c.github.io/aria/#role_definitions) vào các trình duyệt, cho phép bạn thêm giá trị ngữ nghĩa bổ sung cho các phần tử trên trang của bạn bất cứ khi nào cần. Lĩnh vực đầu tiên quan trọng trong đó điều này hữu ích là cung cấp thông tin cho trình đọc màn hình để người dùng của chúng có thể tìm thấy các phần tử trang phổ biến. Ví dụ này có cấu trúc sau:

```html live-sample___aria-website-no-roles
<header>
  <h1>Tiêu đề</h1>

  <!-- Mặc dù không bắt buộc, nhưng thực tế phổ biến là đặt menu điều hướng chính trong tiêu đề chính -->

  <nav>
    <ul>
      <li><a href="#">Trang chủ</a></li>
      <li><a href="#">Nhóm</a></li>
      <li><a href="#">Dự án</a></li>
      <li><a href="#">Liên hệ</a></li>
    </ul>

    <!-- Biểu mẫu tìm kiếm là cách điều hướng phi tuyến tính phổ biến khác qua trang web. -->

    <form>
      <input type="search" name="q" placeholder="Từ khóa tìm kiếm" />
      <input type="submit" value="Tìm!" />
    </form>
  </nav>
</header>

<!-- Đây là nội dung chính của trang của chúng tôi -->
<main>
  <!-- Nó chứa một bài viết -->
  <article>
    <h2>Tiêu đề bài viết</h2>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Donec a diam
      lectus. Set sit amet ipsum mauris. Maecenas congue ligula as quam viverra
      nec consectetur ant hendrerit. Donec et mollis dolor. Praesent et diam
      eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue
      enim, ut porta lorem lacinia consectetur.
    </p>

    <h3>Tiểu mục</h3>

    <p>
      Donec ut librero sed accu vehicula ultricies a non tortor. Lorem ipsum
      dolor sit amet, consectetur adipisicing elit. Aenean ut gravida lorem. Ut
      turpis felis, pulvinar a semper sed, adipiscing id dolor.
    </p>
  </article>

  <!-- nội dung aside cũng có thể được lồng trong nội dung chính -->
  <aside>
    <h2>Liên quan</h2>

    <ul>
      <li><a href="#">Oh tôi thích ở bên bờ biển</a></li>
      <li><a href="#">Oh tôi thích ở bên biển</a></li>
      <li><a href="#">Mặc dù ở miền Bắc nước Anh</a></li>
      <li><a href="#">Không bao giờ ngừng mưa</a></li>
      <li><a href="#">Ồ thôi...</a></li>
    </ul>
  </aside>
</main>

<!-- Và đây là chân trang chính của chúng tôi được sử dụng trên tất cả các trang của trang web của chúng tôi -->

<footer>
  <p>©Bản quyền 2050 bởi không ai. Tất cả quyền được đảo ngược.</p>
</footer>
```

{{EmbedLiveSample("aria-website-no-roles", "100", "850")}}

Nếu bạn thử kiểm tra ví dụ với trình đọc màn hình trong trình duyệt hiện đại, bạn sẽ nhận được một số thông tin hữu ích. Ví dụ, VoiceOver cung cấp cho bạn những thông tin sau:

- Trên phần tử `<header>` — "banner, 2 mục" (nó chứa tiêu đề và `<nav>`).
- Trên phần tử `<nav>` — "điều hướng 2 mục" (nó chứa danh sách và biểu mẫu).
- Trên phần tử `<main>` — "chính 2 mục" (nó chứa bài viết và aside).
- Trên phần tử `<aside>` — "phụ trợ 2 mục" (nó chứa tiêu đề và danh sách).
- Trên đầu vào biểu mẫu tìm kiếm — "Từ khóa tìm kiếm, chèn ở đầu văn bản".
- Trên phần tử `<footer>` — "chân trang 1 mục".

Nếu bạn vào menu điểm mốc của VoiceOver (truy cập bằng phím VoiceOver + U và sau đó sử dụng các phím mũi tên để duyệt qua các lựa chọn menu), bạn sẽ thấy hầu hết các phần tử được liệt kê đẹp đẽ để chúng có thể truy cập nhanh chóng.

![Menu VoiceOver của Mac cho khả năng tiếp cận nhanh. Tiêu đề điểm mốc và danh sách điểm mốc bao gồm banner, điều hướng, chính và phụ trợ.](landmarks-list.png)

Tuy nhiên, chúng ta có thể làm tốt hơn ở đây. Biểu mẫu tìm kiếm là điểm mốc thực sự quan trọng mà mọi người muốn tìm, nhưng nó không được liệt kê trong menu điểm mốc hoặc được xử lý như một điểm mốc đáng chú ý ngoài đầu vào thực tế được gọi là đầu vào tìm kiếm (`<input type="search">`).

Để đánh dấu biểu mẫu như một điểm mốc, bạn có thể bọc nó bằng phần tử {{htmlelement("search")}} hoặc đặt ARIA `role="search"`. Theo nguyên tắc chung, hãy sử dụng ngữ nghĩa HTML khi có thể và chỉ sử dụng ARIA khi không có tương đương HTML.

```html live-sample___aria-website-roles
<header>
  <h1>Tiêu đề</h1>

  <!-- Mặc dù không bắt buộc, nhưng thực tế phổ biến là đặt menu điều hướng chính trong tiêu đề chính -->

  <nav>
    <ul>
      <li><a href="#">Trang chủ</a></li>
      <li><a href="#">Nhóm của chúng tôi</a></li>
      <li><a href="#">Dự án</a></li>
      <li><a href="#">Liên hệ</a></li>
    </ul>

    <!-- Biểu mẫu tìm kiếm là cách điều hướng phi tuyến tính phổ biến khác qua trang web. -->

    <search>
      <form>
        <input
          type="search"
          name="q"
          placeholder="Từ khóa tìm kiếm"
          aria-label="Tìm kiếm nội dung trang web" />
        <input type="submit" value="Tìm!" />
      </form>
    </search>
  </nav>
</header>

<!-- Đây là nội dung chính của trang của chúng tôi -->
<main>
  <!-- Nó chứa một bài viết -->
  <article>
    <h2>Tiêu đề bài viết</h2>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Donec a diam
      lectus. Set sit amet ipsum mauris. Maecenas congue ligula as quam viverra
      nec consectetur ant hendrerit. Donec et mollis dolor. Praesent et diam
      eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue
      enim, ut porta lorem lacinia consectetur.
    </p>

    <h3>Tiểu mục</h3>

    <p>
      Donec ut librero sed accu vehicula ultricies a non tortor. Lorem ipsum
      dolor sit amet, consectetur adipisicing elit. Aenean ut gravida lorem. Ut
      turpis felis, pulvinar a semper sed, adipiscing id dolor.
    </p>
  </article>

  <!-- nội dung aside cũng có thể được lồng trong nội dung chính -->
  <aside>
    <h2>Liên quan</h2>
    <ul>
      <li><a href="#">Oh tôi thích ở bên bờ biển</a></li>
      <li><a href="#">Oh tôi thích ở bên biển</a></li>
      <li><a href="#">Mặc dù ở miền Bắc nước Anh</a></li>
      <li><a href="#">Không bao giờ ngừng mưa</a></li>
      <li><a href="#">Ồ thôi...</a></li>
    </ul>
  </aside>
</main>

<!-- Và đây là chân trang chính của chúng tôi được sử dụng trên tất cả các trang của trang web của chúng tôi -->

<footer>
  <p>©Bản quyền 2050 bởi không ai. Tất cả quyền được đảo ngược.</p>
</footer>
```

{{EmbedLiveSample("aria-website-roles", "100", "850")}}

Quan trọng nhất, chúng tôi đã sử dụng HTML ngữ nghĩa cung cấp ý nghĩa và vai trò cho cấu trúc của trang mà không cần thêm các thuộc tính [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) không cần thiết vào cấu trúc HTML của chúng tôi, có cấu trúc như thế này:

```html
<header>
  <h1>…</h1>
  <nav>
    <ul>
      …
    </ul>
    <search>
      <form>
        <!-- biểu mẫu tìm kiếm -->
      </form>
    </search>
  </nav>
</header>

<main>
  <article>…</article>
  <aside>…</aside>
</main>

<footer>…</footer>
```

Chúng tôi cũng đã cung cấp cho bạn một tính năng bonus trong ví dụ này — phần tử {{htmlelement("input")}} đã được đặt thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), cung cấp cho nó nhãn mô tả để được đọc bởi trình đọc màn hình, mặc dù chúng tôi không bao gồm phần tử {{htmlelement("label")}}. Trong các trường hợp như thế này, điều này rất hữu ích — biểu mẫu tìm kiếm như thế này là tính năng rất phổ biến, dễ nhận biết, và thêm nhãn trực quan sẽ làm hỏng thiết kế trang.

```html
<input
  type="search"
  name="q"
  placeholder="Từ khóa tìm kiếm"
  aria-label="Tìm kiếm nội dung trang web" />
```

Bây giờ nếu chúng ta sử dụng VoiceOver để xem ví dụ này, chúng ta nhận được một số cải tiến:

- Biểu mẫu tìm kiếm được gọi ra như một mục riêng biệt, cả khi duyệt qua trang, và trong menu Điểm mốc.
- Văn bản nhãn được chứa trong thuộc tính `aria-label` được đọc ra khi đầu vào biểu mẫu được tô sáng.

Nếu bạn cần hỗ trợ các trình duyệt cũ hơn như IE8; đáng để bao gồm các vai trò ARIA cho mục đích đó. Và nếu vì lý do nào đó trang web của bạn được xây dựng chỉ sử dụng `<div>`, bạn chắc chắn nên bao gồm các vai trò ARIA để cung cấp những ngữ nghĩa rất cần thiết này!

Bạn sẽ thấy nhiều hơn về những ngữ nghĩa này và sức mạnh của các thuộc tính/thuộc tính ARIA bên dưới, đặc biệt trong phần [Khả năng tiếp cận của điều khiển không ngữ nghĩa](#accessibility_of_non-semantic_controls). Nhưng bây giờ, hãy xem cách ARIA có thể giúp ích với các cập nhật nội dung động.

## Cập nhật nội dung động

Nội dung được tải vào DOM có thể dễ dàng truy cập bằng trình đọc màn hình, từ nội dung văn bản đến alt text được đính kèm vào hình ảnh. Do đó, các trang web tĩnh truyền thống với nội dung văn bản chủ yếu dễ dàng làm dễ tiếp cận cho người khiếm thị.

Vấn đề là các ứng dụng web hiện đại thường không chỉ là văn bản tĩnh — chúng thường cập nhật các phần của trang bằng cách lấy nội dung mới từ máy chủ (trong ví dụ này chúng tôi đang sử dụng một mảng tĩnh các trích dẫn) và cập nhật DOM. Những cái này đôi khi được gọi là **vùng trực tiếp**.

Hãy xem ví dụ — một máy tạo trích dẫn ngẫu nhiên:

```html live-sample___aria-no-live
<section>
  <h1>Máy tạo trích dẫn ngẫu nhiên</h1>
  <button>Bắt đầu cho tôi trích dẫn</button>
  <blockquote>
    <p></p>
  </blockquote>
</section>
```

{{EmbedLiveSample("aria-no-live", "100", "220")}}

Điều này hoạt động OK, nhưng không tốt cho khả năng tiếp cận — cập nhật nội dung không được phát hiện bởi trình đọc màn hình, vì vậy người dùng của chúng sẽ không biết điều gì đang xảy ra. Đây là ví dụ khá tầm thường, nhưng hãy tưởng tượng nếu bạn đang tạo một UI phức tạp với nhiều nội dung liên tục cập nhật, như phòng chat, hoặc UI trò chơi chiến lược, hoặc màn hình giỏ hàng cập nhật trực tiếp — sẽ không thể sử dụng ứng dụng theo bất kỳ cách hiệu quả nào mà không có một số cách để cảnh báo người dùng về các cập nhật.

Thật may, WAI-ARIA cung cấp một cơ chế hữu ích để cung cấp các cảnh báo này — thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live). Áp dụng thuộc tính này cho một phần tử khiến trình đọc màn hình đọc ra nội dung được cập nhật. Mức độ khẩn cấp nội dung được đọc ra phụ thuộc vào giá trị thuộc tính:

- `off`
  - : Mặc định. Các cập nhật không nên được thông báo.
- `polite`
  - : Các cập nhật nên được thông báo chỉ khi người dùng đang ở trạng thái rảnh.
- `assertive`
  - : Các cập nhật nên được thông báo cho người dùng càng sớm càng tốt.

Ở đây chúng tôi cập nhật thẻ mở `<blockquote>` như sau:

```html
<blockquote aria-live="assertive">…</blockquote>
```

Điều này sẽ khiến trình đọc màn hình đọc nội dung khi nó được cập nhật: thử kiểm tra phiên bản trực tiếp được cập nhật:

```html hidden live-sample___aria-live
<section>
  <h1>Máy tạo trích dẫn ngẫu nhiên</h1>
  <button>Bắt đầu cho tôi trích dẫn</button>
  <blockquote aria-live="assertive">
    <p></p>
  </blockquote>
</section>
```

{{EmbedLiveSample("aria-live", "100", "220")}}

> [!NOTE]
> Có một số thuộc tính ARIA khác liên quan đến `aria-live` cũng đáng biết:
>
> - Thuộc tính [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic), khi được đặt thành `true`, nói với trình đọc màn hình đọc toàn bộ nội dung phần tử như một đơn vị nguyên tử, không chỉ các bit đã được cập nhật. Điều này hữu ích khi chỉ một phần nội dung đang được cập nhật, nhưng bạn cũng muốn tiêu đề được đọc ra mỗi khi có gì đó thay đổi, để nhắc nhở người dùng về nội dung của nó.
> - Thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant) hữu ích để kiểm soát những gì được đọc ra khi vùng trực tiếp được cập nhật. Ví dụ bạn có thể chỉ đọc ra các bổ sung hoặc xóa nội dung.

## Tăng cường khả năng tiếp cận bàn phím

Như đã thảo luận ở một vài nơi khác trong mô-đun, một trong những điểm mạnh chính của HTML đối với khả năng tiếp cận là tính năng tiếp cận bàn phím tích hợp của các tính năng như nút, điều khiển biểu mẫu và liên kết. Nói chung, bạn có thể sử dụng phím tab để di chuyển giữa các điều khiển, phím Enter/Return để chọn hoặc kích hoạt điều khiển, và thỉnh thoảng các điều khiển khác khi cần (ví dụ phím mũi tên lên và xuống để di chuyển giữa các tùy chọn trong hộp `<select>`).

Tuy nhiên, đôi khi bạn sẽ phải viết mã sử dụng các phần tử không ngữ nghĩa như nút (hoặc các loại điều khiển khác), hoặc sử dụng các điều khiển có thể tập trung không hoàn toàn đúng mục đích. Bạn có thể cố gắng sửa một số mã xấu bạn đã thừa hưởng, hoặc bạn có thể đang xây dựng một số loại widget phức tạp yêu cầu nó.

Về mặt làm cho mã không thể tập trung trở nên có thể tập trung, WAI-ARIA mở rộng thuộc tính `tabindex` với một số giá trị mới:

- `tabindex="0"` — như đã chỉ ra ở trên, giá trị này cho phép các phần tử thường không có thể tab trở thành có thể tab. Đây là giá trị hữu ích nhất của `tabindex`.
- `tabindex="-1"` — điều này cho phép các phần tử thường không có thể tab nhận tiêu điểm theo chương trình, ví dụ qua JavaScript, hoặc là đích của liên kết.

Chúng ta đã thảo luận điều này chi tiết hơn và cho thấy một triển khai điển hình trong bài viết khả năng tiếp cận HTML của chúng ta — xem [Xây dựng lại khả năng tiếp cận bàn phím](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#building_keyboard_accessibility_back_in).

## Khả năng tiếp cận của điều khiển không ngữ nghĩa

Điều này tiếp nối từ phần trước — khi một loạt `<div>` lồng nhau cùng với CSS/JavaScript được sử dụng để tạo tính năng UI phức tạp, hoặc một điều khiển gốc được cải thiện/thay đổi nhiều qua JavaScript, không chỉ khả năng tiếp cận bàn phím có thể bị ảnh hưởng, mà người dùng trình đọc màn hình cũng sẽ gặp khó khăn khi tìm hiểu tính năng đó làm gì nếu không có ngữ nghĩa hoặc manh mối khác. Trong những tình huống như vậy, ARIA có thể giúp cung cấp những ngữ nghĩa còn thiếu.

### Xác thực biểu mẫu và cảnh báo lỗi

Trước tiên, hãy xem lại ví dụ biểu mẫu chúng ta đã xem trong bài viết khả năng tiếp cận CSS và JavaScript của mình (đọc [Giữ nó không xâm phạm](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#keeping_it_unobtrusive) để tóm tắt đầy đủ). Ở cuối phần đó, chúng tôi đã chỉ ra rằng chúng tôi đã bao gồm một số thuộc tính ARIA trên hộp thông báo lỗi hiển thị bất kỳ lỗi xác thực nào khi bạn cố gắng gửi biểu mẫu:

```html
<div class="errors" role="alert" aria-relevant="all">
  <ul></ul>
</div>
```

- [`role="alert"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role) tự động biến phần tử mà nó được áp dụng thành vùng trực tiếp, vì vậy các thay đổi đối với nó được đọc ra; nó cũng xác định nó về mặt ngữ nghĩa là thông báo cảnh báo (thông tin quan trọng về thời gian/ngữ cảnh), và đại diện cho cách tốt hơn, dễ tiếp cận hơn để cung cấp cảnh báo cho người dùng (các hộp thoại modal như [`alert()`](/en-US/docs/Web/API/Window/alert) có một số vấn đề về khả năng tiếp cận; xem [Cửa sổ bật lên](https://webaim.org/techniques/javascript/other#popups) của WebAIM).
- Giá trị [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant) của `all` hướng dẫn trình đọc màn hình đọc nội dung của danh sách lỗi khi có bất kỳ thay đổi nào — tức là khi lỗi được thêm hoặc xóa. Điều này hữu ích vì người dùng sẽ muốn biết lỗi nào còn lại, không chỉ là những gì đã được thêm hoặc xóa khỏi danh sách.

Chúng ta có thể đi xa hơn với việc sử dụng ARIA và cung cấp thêm trợ giúp xác thực. Bạn có thể chỉ ra liệu các trường có bắt buộc ngay từ đầu không, và phạm vi tuổi nên là gì?

1. Lúc này, hãy lấy một bản sao của tệp [`form-validation.html`](https://github.com/mdn/learning-area/blob/main/accessibility/css/form-validation.html) và [`validation.js`](https://github.com/mdn/learning-area/blob/main/accessibility/css/validation.js) của chúng tôi, và lưu chúng vào thư mục cục bộ.
2. Mở cả hai trong trình soạn thảo văn bản và xem cách mã hoạt động.
3. Đầu tiên, thêm đoạn văn ngay phía trên thẻ `<form>` mở đầu, như đoạn dưới đây, và đánh dấu cả hai `<label>` biểu mẫu bằng dấu hoa thị. Đây thường là cách chúng ta đánh dấu các trường bắt buộc cho người dùng sáng mắt.

   ```html
   <p>Các trường được đánh dấu bằng dấu hoa thị (*) là bắt buộc.</p>
   ```

4. Điều này có ý nghĩa trực quan, nhưng không dễ hiểu cho người dùng trình đọc màn hình. May mắn thay, WAI-ARIA cung cấp thuộc tính [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required) để cung cấp gợi ý cho trình đọc màn hình rằng họ nên nói với người dùng rằng đầu vào biểu mẫu cần được điền vào. Cập nhật các phần tử `<input>` như sau:

   ```html
   <input type="text" name="name" id="name" aria-required="true" />

   <input type="number" name="age" id="age" aria-required="true" />
   ```

5. Nếu bạn lưu ví dụ ngay bây giờ và kiểm tra nó với trình đọc màn hình, bạn sẽ nghe điều gì đó như "Nhập tên của bạn ngôi sao, bắt buộc, chỉnh sửa văn bản".
6. Cũng có thể hữu ích nếu chúng ta cung cấp cho người dùng trình đọc màn hình và người dùng sáng mắt ý tưởng về giá trị tuổi nên là gì. Điều này thường được trình bày dưới dạng tooltip hoặc placeholder bên trong trường biểu mẫu. WAI-ARIA bao gồm thuộc tính [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) và [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax) để chỉ định giá trị min và max, và trình đọc màn hình hỗ trợ các thuộc tính gốc `min` và `max`. Một tính năng được hỗ trợ tốt khác là thuộc tính HTML `placeholder`, có thể chứa tin nhắn được hiển thị trong đầu vào khi không có giá trị nào được nhập và được đọc ra bởi một số trình đọc màn hình. Cập nhật đầu vào số của bạn như thế này:

   ```html
   <label for="age">Tuổi của bạn:</label>
   <input
     type="number"
     name="age"
     id="age"
     placeholder="Nhập từ 1 đến 150"
     required
     aria-required="true" />
   ```

Luôn bao gồm {{HTMLelement('label')}} cho mỗi đầu vào. Mặc dù một số trình đọc màn hình thông báo văn bản placeholder, hầu hết thì không. Các thay thế chấp nhận được để cung cấp tên có thể truy cập cho điều khiển biểu mẫu bao gồm [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) và [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Nhưng phần tử `<label>` với thuộc tính `for` là phương pháp ưa thích vì nó cung cấp khả năng sử dụng cho tất cả người dùng, bao gồm người dùng chuột.

> [!NOTE]
> Bạn có thể xem ví dụ hoàn chỉnh trực tiếp tại [`form-validation-updated.html`](https://mdn.github.io/learning-area/accessibility/aria/form-validation-updated.html).

WAI-ARIA cũng cho phép một số kỹ thuật gán nhãn biểu mẫu nâng cao, ngoài phần tử {{htmlelement("label")}} cổ điển. Chúng ta đã nói về việc sử dụng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) để cung cấp nhãn khi chúng ta không muốn nhãn hiển thị cho người dùng sáng mắt (xem phần [Biển chỉ dẫn/Điểm mốc](#signpostslandmarks), ở trên). Một số kỹ thuật gán nhãn khác sử dụng các thuộc tính khác như [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) nếu bạn muốn chỉ định một phần tử không phải `<label>` như nhãn hoặc gán nhãn nhiều đầu vào biểu mẫu bằng cùng nhãn, và [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby), nếu bạn muốn liên kết thông tin khác với đầu vào biểu mẫu và đọc nó ra cũng vậy. Xem [Bài viết gán nhãn biểu mẫu nâng cao của WebAIM](https://webaim.org/techniques/forms/advanced) để biết thêm chi tiết.

Cũng có nhiều thuộc tính và trạng thái hữu ích khác, để chỉ ra trạng thái của các phần tử biểu mẫu. Ví dụ, `aria-disabled="true"` có thể được sử dụng để chỉ ra rằng trường biểu mẫu bị tắt. Nhiều trình duyệt sẽ bỏ qua các trường biểu mẫu bị tắt dẫn đến chúng không được đọc ra bởi trình đọc màn hình. Trong một số trường hợp, một phần tử bị tắt sẽ được nhận thức, vì vậy đó là ý tưởng tốt khi bao gồm thuộc tính này để cho trình đọc màn hình biết rằng điều khiển biểu mẫu bị tắt thực sự là bị tắt.

Nếu trạng thái bị tắt của đầu vào có khả năng thay đổi, thì cũng là ý tưởng tốt khi chỉ ra khi nào nó xảy ra, và kết quả là gì. Ví dụ, trong bản demo [`form-validation-checkbox-disabled.html`](https://mdn.github.io/learning-area/accessibility/aria/form-validation-checkbox-disabled.html) của chúng tôi, có một hộp kiểm tra khi được chọn, cho phép một đầu vào biểu mẫu khác để nhập thêm thông tin. Chúng tôi đã thiết lập một vùng trực tiếp ẩn:

```html
<p class="hidden-alert" aria-live="assertive"></p>
```

được ẩn khỏi chế độ xem bằng cách sử dụng định vị tuyệt đối. Khi điều này được chọn/bỏ chọn, chúng tôi cập nhật văn bản bên trong vùng trực tiếp ẩn để nói với người dùng trình đọc màn hình kết quả của việc chọn hộp kiểm tra này là gì, cũng như cập nhật trạng thái `aria-disabled`, và một số chỉ báo trực quan cũng vậy:

```js
function toggleMusician(bool) {
  const instrument = formItems[formItems.length - 1];
  if (bool) {
    instrument.input.disabled = false;
    instrument.label.style.color = "black";
    instrument.input.setAttribute("aria-disabled", "false");
    hiddenAlert.textContent =
      "Trường nhạc cụ đã chơi hiện được bật; sử dụng nó để cho chúng tôi biết bạn chơi gì.";
  } else {
    instrument.input.disabled = true;
    instrument.label.style.color = "#999999";
    instrument.input.setAttribute("aria-disabled", "true");
    instrument.input.removeAttribute("aria-label");
    hiddenAlert.textContent = "Trường nhạc cụ đã chơi hiện bị tắt.";
  }
}
```

### Mô tả các nút không ngữ nghĩa là nút

Một vài lần trong khóa học này, chúng tôi đã đề cập đến khả năng tiếp cận gốc của (và các vấn đề khả năng tiếp cận đằng sau việc sử dụng các phần tử khác để giả mạo) nút, liên kết, hoặc phần tử biểu mẫu (xem [Sử dụng điều khiển UI ngữ nghĩa khi có thể](/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_semantic_ui_controls_where_possible) trong bài viết khả năng tiếp cận HTML, và [Tăng cường khả năng tiếp cận bàn phím](#enhancing_keyboard_accessibility), ở trên). Về cơ bản, bạn có thể thêm lại khả năng tiếp cận bàn phím mà không gặp quá nhiều khó khăn trong nhiều trường hợp, sử dụng `tabindex` và một chút JavaScript.

Nhưng còn về trình đọc màn hình thì sao? Chúng vẫn sẽ không thấy các phần tử là nút. Nếu chúng tôi kiểm tra ví dụ [`fake-div-buttons.html`](https://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/fake-div-buttons.html) của mình trong trình đọc màn hình, các nút giả của chúng tôi sẽ được báo cáo bằng các cụm từ như "Click me!, nhóm", điều này rõ ràng gây nhầm lẫn.

Chúng ta có thể sửa điều này bằng cách sử dụng vai trò WAI-ARIA. Tạo bản sao cục bộ của [`fake-div-buttons.html`](https://github.com/mdn/learning-area/blob/main/tools-testing/cross-browser-testing/accessibility/fake-div-buttons.html), và thêm [`role="button"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role) vào mỗi nút `<div>`, ví dụ:

```html
<div data-message="Đây là từ nút đầu tiên" tabindex="0" role="button">
  Nhấp vào tôi!
</div>
```

Bây giờ khi bạn thử điều này bằng trình đọc màn hình, bạn sẽ có các nút được báo cáo bằng các cụm từ như "Nhấp vào tôi!, nút". Mặc dù điều này tốt hơn nhiều, bạn vẫn phải thêm tất cả các tính năng nút gốc mà người dùng mong đợi, như xử lý sự kiện <kbd>enter</kbd> và click, như đã giải thích trong [tài liệu vai trò `button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role).

> [!NOTE]
> Đừng quên rằng việc sử dụng phần tử ngữ nghĩa đúng khi có thể luôn tốt hơn. Nếu bạn muốn tạo nút và có thể sử dụng phần tử {{htmlelement("button")}}, bạn nên sử dụng phần tử {{htmlelement("button")}}!

### Hướng dẫn người dùng qua các widget phức tạp

Có một loạt các [vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) khác có thể xác định các cấu trúc phần tử không ngữ nghĩa như các tính năng UI phổ biến vượt ra ngoài những gì có sẵn trong HTML tiêu chuẩn, ví dụ [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role), [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role), [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role), [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role). Bạn có thể thấy một số ví dụ hữu ích trong [thư viện mã của đại học Deque](https://dequeuniversity.com/library/) để cho bạn ý tưởng về cách các điều khiển như vậy có thể được làm dễ tiếp cận.

Bạn cũng có thể tìm thấy một số ví dụ trực tiếp trong tài liệu [Vai trò WAI-ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) của chúng tôi. Xem ví dụ [Ví dụ vai trò tab ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role#example), giải thích cách triển khai giao diện tab dễ tiếp cận.

## Tóm tắt

Bài viết này chắc chắn không bao gồm tất cả những gì có trong WAI-ARIA, nhưng nó nên đã cung cấp cho bạn đủ thông tin để hiểu cách sử dụng nó, và biết một số mẫu phổ biến nhất bạn sẽ gặp yêu cầu nó.

Trong bài viết tiếp theo, chúng tôi sẽ cung cấp cho bạn một số bài kiểm tra bạn có thể sử dụng để kiểm tra mức độ hiểu và giữ lại tất cả thông tin này.

## Xem thêm

- [Trạng thái và thuộc tính ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes): Tất cả thuộc tính `aria-*`
- [Vai trò WAI-ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles): Các danh mục vai trò ARIA và các vai trò được bao gồm trên MDN
- [ARIA trong HTML](https://w3c.github.io/html-aria/) trên W3C: Đặc tả xác định, cho mỗi tính năng HTML, ngữ nghĩa khả năng tiếp cận (ARIA) được áp dụng ngầm định bởi trình duyệt và các tính năng WAI-ARIA bạn có thể đặt trên nó nếu cần ngữ nghĩa bổ sung
- [Thư viện mã của đại học Deque](https://dequeuniversity.com/library/): Thư viện các ví dụ thực tế và hữu ích cho thấy các điều khiển UI phức tạp được làm dễ tiếp cận bằng cách sử dụng các tính năng WAI-ARIA
- [Thực hành tác giả WAI-ARIA](https://www.w3.org/WAI/ARIA/apg/) trên W3C: Một mẫu thiết kế rất chi tiết từ W3C, giải thích cách triển khai các loại điều khiển UI phức tạp khác nhau trong khi làm cho chúng dễ tiếp cận bằng cách sử dụng các tính năng WAI-ARIA

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Test_your_skills/CSS_and_JavaScript","Learn_web_development/Core/Accessibility/Test_your_skills/WAI-ARIA", "Learn_web_development/Core/Accessibility")}}
