---
title: "<a>: The Anchor element"
slug: Web/HTML/Reference/Elements/a
page-type: html-element
browser-compat: html.elements.a
sidebar: htmlsidebar
---

Phần tử **`<a>`** trong [HTML](/en-US/docs/Web/HTML) (hay còn gọi là phần tử _neo_), khi có [thuộc tính `href`](#href), sẽ tạo một siêu liên kết đến các trang web, tệp tin, địa chỉ email, vị trí trong cùng trang, hoặc bất kỳ thứ gì mà URL có thể trỏ đến.

Nội dung bên trong mỗi `<a>` _nên_ chỉ rõ đích đến của liên kết. Nếu thuộc tính `href` có mặt, nhấn phím Enter khi đang tập trung vào phần tử `<a>` sẽ kích hoạt nó.

{{InteractiveExample("HTML Demo: &lt;a&gt;", "tabbed-shorter")}}

```html interactive-example
<p>You can reach Michael at:</p>

<ul>
  <li><a href="https://example.com">Website</a></li>
  <li><a href="mailto:m.bluth@example.com">Email</a></li>
  <li><a href="tel:+123456789">Phone</a></li>
</ul>
```

```css interactive-example
li {
  margin-bottom: 0.5rem;
}
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `attributionsrc` {{deprecated_inline}}
  - : Chỉ định rằng bạn muốn trình duyệt gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}}. Phía máy chủ sẽ sử dụng điều này để kích hoạt việc gửi tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} trong phản hồi, nhằm đăng ký một [nguồn phân bổ dựa trên điều hướng](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#navigation-based_attribution_sources).

    Trình duyệt lưu dữ liệu nguồn liên quan đến nguồn phân bổ dựa trên điều hướng (như được cung cấp trong tiêu đề phản hồi {{httpheader("Attribution-Reporting-Register-Source")}}) khi người dùng nhấp vào liên kết. Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

    Có hai phiên bản của thuộc tính này bạn có thể đặt:
    - Boolean, tức là chỉ có tên `attributionsrc`. Điều này chỉ định rằng bạn muốn tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} được gửi đến cùng máy chủ mà thuộc tính `href` trỏ đến. Điều này ổn khi bạn xử lý việc đăng ký nguồn phân bổ trên cùng một máy chủ.
    - Giá trị chứa một hoặc nhiều URL, ví dụ:

      ```html
      attributionsrc="https://a.example/register-source
      https://b.example/register-source"
      ```

      Điều này hữu ích trong trường hợp tài nguyên được yêu cầu không nằm trên máy chủ bạn kiểm soát, hoặc bạn chỉ muốn xử lý việc đăng ký nguồn phân bổ trên một máy chủ khác. Trong trường hợp này, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionsrc`. Khi yêu cầu tài nguyên xảy ra, tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi đến (các) URL được chỉ định trong `attributionsrc` ngoài nguồn gốc tài nguyên. Các URL này sau đó có thể phản hồi với {{httpheader("Attribution-Reporting-Register-Source")}} để hoàn tất việc đăng ký.

      > [!NOTE]
      > Chỉ định nhiều URL có nghĩa là nhiều nguồn phân bổ có thể được đăng ký trên cùng một tính năng. Bạn có thể ví dụ có các chiến dịch khác nhau mà bạn đang cố gắng đo lường mức độ thành công, liên quan đến việc tạo báo cáo khác nhau trên các dữ liệu khác nhau.

    Các phần tử `<a>` không thể được sử dụng làm bộ kích hoạt phân bổ, chỉ là nguồn.

- `download`
  - : Khiến trình duyệt xử lý URL được liên kết như một tệp tải xuống. Có thể sử dụng có hoặc không có giá trị `filename`:
    - Không có giá trị, trình duyệt sẽ đề xuất tên tệp/phần mở rộng, được tạo từ nhiều nguồn:
      - Tiêu đề HTTP {{HTTPHeader("Content-Disposition")}}
      - Đoạn cuối trong [đường dẫn](/en-US/docs/Web/API/URL/pathname) URL
      - {{Glossary("MIME_type", "Kiểu media")}} (từ tiêu đề {{HTTPHeader("Content-Type")}}, phần đầu của [URL `data:`](/en-US/docs/Web/URI/Reference/Schemes/data), hoặc {{domxref("Blob.type")}} cho [URL `blob:`](/en-US/docs/Web/URI/Reference/Schemes/blob))

    - `filename`: định nghĩa giá trị đề xuất làm tên tệp. Các ký tự `/` và `\` được chuyển đổi thành dấu gạch dưới (`_`). Hệ thống tệp có thể cấm các ký tự khác trong tên tệp, vì vậy trình duyệt sẽ điều chỉnh tên đề xuất nếu cần.

    > [!NOTE]
    >
    > - `download` chỉ hoạt động với [URL cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy), hoặc các lược đồ `blob:` và `data:`.
    > - Cách trình duyệt xử lý tải xuống khác nhau tùy trình duyệt, cài đặt người dùng và các yếu tố khác. Người dùng có thể được nhắc trước khi tải xuống bắt đầu, hoặc tệp có thể được lưu tự động, hoặc có thể mở tự động, trong ứng dụng bên ngoài hoặc trong trình duyệt.
    > - Nếu tiêu đề `Content-Disposition` có thông tin khác với thuộc tính `download`, hành vi kết quả có thể khác nhau:
    >   - Nếu tiêu đề chỉ định `filename`, nó sẽ ưu tiên hơn tên tệp được chỉ định trong thuộc tính `download`.
    >   - Nếu tiêu đề chỉ định một sắp xếp `inline`, Chrome và Firefox ưu tiên thuộc tính và xử lý nó như một tải xuống. Các phiên bản Firefox cũ (trước 82) ưu tiên tiêu đề và sẽ hiển thị nội dung inline.

- `href`
  - : URL mà siêu liên kết trỏ đến. Các liên kết không bị giới hạn ở URL dựa trên HTTP — chúng có thể sử dụng bất kỳ lược đồ URL nào được trình duyệt hỗ trợ:
    - Số điện thoại với URL `tel:`
    - Địa chỉ email với URL `mailto:`
    - Tin nhắn SMS với URL `sms:`
    - Mã thực thi với [URL `javascript:`](/en-US/docs/Web/URI/Reference/Schemes/javascript)
    - Trong khi trình duyệt web có thể không hỗ trợ các lược đồ URL khác, các trang web có thể với [`registerProtocolHandler()`](/en-US/docs/Web/API/Navigator/registerProtocolHandler)

    Ngoài ra, các tính năng URL khác có thể định vị các phần cụ thể của tài nguyên, bao gồm:
    - Các phần của trang với các đoạn tài liệu
    - Các phần văn bản cụ thể với [đoạn văn bản](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments)
    - Các đoạn của tệp phương tiện với các đoạn phương tiện

- `hreflang`
  - : Gợi ý ngôn ngữ của con người về URL được liên kết. Không có chức năng tích hợp. Các giá trị được phép giống với [thuộc tính toàn cục `lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang).
- `interestfor` {{experimental_inline}} {{non-standard_inline}}
  - : Xác định phần tử `<a>` như là **invoker quan tâm**. Giá trị của nó là `id` của phần tử đích, sẽ bị ảnh hưởng theo một cách nào đó (thường là hiển thị hoặc ẩn) khi sự quan tâm được thể hiện hoặc mất đi trên phần tử invoker (ví dụ, bằng cách di chuột vào/ra hoặc tập trung/mất tập trung vào nó). Xem [Sử dụng interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) để biết thêm chi tiết và ví dụ.
- `ping`
  - : Danh sách URL phân tách bằng dấu cách. Khi liên kết được theo dõi, trình duyệt sẽ gửi các yêu cầu {{HTTPMethod("POST")}} với nội dung `PING` đến các URL. Thường dùng để theo dõi.
- `referrerpolicy`
  - : Bao nhiêu [referrer](/en-US/docs/Web/HTTP/Reference/Headers/Referer) cần gửi khi theo dõi liên kết.
    - `no-referrer`: Tiêu đề {{HTTPHeader("Referer")}} sẽ không được gửi.
    - `no-referrer-when-downgrade`: Tiêu đề {{HTTPHeader("Referer")}} sẽ không được gửi đến các {{Glossary("origin")}} không có {{Glossary("TLS")}} ({{Glossary("HTTPS")}}).
    - `origin`: Referrer được gửi sẽ bị giới hạn ở nguồn gốc của trang đang tham chiếu: [lược đồ](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL), {{Glossary("host")}}, và {{Glossary("port")}} của nó.
    - `origin-when-cross-origin`: Referrer được gửi đến các nguồn gốc khác sẽ bị giới hạn ở lược đồ, host và port. Điều hướng trên cùng nguồn gốc vẫn bao gồm đường dẫn.
    - `same-origin`: Một referrer sẽ được gửi cho {{Glossary("Same-origin policy", "cùng nguồn gốc")}}, nhưng các yêu cầu cross-origin sẽ không chứa thông tin referrer.
    - `strict-origin`: Chỉ gửi nguồn gốc của tài liệu như là referrer khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), nhưng không gửi đến đích kém an toàn hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin` (mặc định): Gửi URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, chỉ gửi nguồn gốc khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), và không gửi tiêu đề đến đích kém an toàn hơn (HTTPS→HTTP).
    - `unsafe-url`: Referrer sẽ bao gồm nguồn gốc _và_ đường dẫn (nhưng không có [đoạn](/en-US/docs/Web/API/HTMLAnchorElement/hash), [mật khẩu](/en-US/docs/Web/API/HTMLAnchorElement/password), hoặc [tên người dùng](/en-US/docs/Web/API/HTMLAnchorElement/username)). **Giá trị này không an toàn**, vì nó rò rỉ nguồn gốc và đường dẫn từ các tài nguyên được bảo vệ TLS đến các nguồn gốc không an toàn.

- [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel)
  - : Mối quan hệ của URL được liên kết dưới dạng các loại liên kết phân tách bằng dấu cách.
- `target`
  - : Nơi hiển thị URL được liên kết, là tên cho một _ngữ cảnh duyệt_ (tab, cửa sổ, hoặc {{HTMLElement("iframe")}}). Các từ khóa sau có ý nghĩa đặc biệt về nơi tải URL:
    - `_self`: Ngữ cảnh duyệt hiện tại. (Mặc định)
    - `_blank`: Thường là tab mới, nhưng người dùng có thể cấu hình trình duyệt để mở cửa sổ mới thay thế.
    - `_parent`: Ngữ cảnh duyệt cha của ngữ cảnh hiện tại. Nếu không có cha, hành xử như `_self`.
    - `_top`: Ngữ cảnh duyệt trên cùng. Cụ thể, điều này có nghĩa là ngữ cảnh "cao nhất" là tổ tiên của ngữ cảnh hiện tại. Nếu không có tổ tiên, hành xử như `_self`.
    - `_unfencedTop`: Cho phép các [fenced frames](/en-US/docs/Web/API/Fenced_frame_API) nhúng điều hướng khung cấp cao nhất (tức là, đi qua root của fenced frame, không giống các đích được dành riêng khác). Lưu ý rằng điều hướng vẫn sẽ thành công nếu điều này được sử dụng bên ngoài ngữ cảnh fenced frame, nhưng nó sẽ không hoạt động như một từ khóa được dành riêng.

    > [!NOTE]
    > Đặt `target="_blank"` trên các phần tử `<a>` ngầm cung cấp cùng hành vi `rel` như đặt [`rel="noopener"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) không đặt `window.opener`.

- `type`
  - : Gợi ý về định dạng của URL được liên kết với {{Glossary("MIME type")}}. Không có chức năng tích hợp.

### Thuộc tính đã lỗi thời

- `charset` {{Deprecated_Inline}}
  - : Gợi ý về {{Glossary("character encoding", "mã hóa ký tự")}} của URL được liên kết.

    > [!NOTE]
    > Thuộc tính này đã lỗi thời và **không nên được sử dụng bởi tác giả**. Sử dụng tiêu đề HTTP {{HTTPHeader("Content-Type")}} trên URL được liên kết.

- `coords` {{Deprecated_Inline}}
  - : Được sử dụng với [thuộc tính `shape`](#shape). Danh sách tọa độ phân tách bằng dấu phẩy.
- `name` {{Deprecated_Inline}}
  - : Cần thiết để xác định vị trí đích có thể trong một trang. Trong HTML 4.01, `id` và `name` đều có thể được sử dụng trên `<a>`, miễn là chúng có các giá trị giống nhau.

    > [!NOTE]
    > Sử dụng thuộc tính toàn cục [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) thay thế.

- `rev` {{Deprecated_Inline}}
  - : Chỉ định liên kết ngược; đối lập với [thuộc tính `rel`](#rel). Đã lỗi thời vì rất khó hiểu.
- `shape` {{Deprecated_Inline}}
  - : Hình dạng của vùng siêu liên kết trong bản đồ ảnh.

    > [!NOTE]
    > Sử dụng phần tử {{HTMLElement("area")}} cho bản đồ ảnh thay thế.

## Khả năng tiếp cận

### Văn bản liên kết mạnh

**Nội dung bên trong một liên kết phải cho biết liên kết dẫn đến đâu**, kể cả ngoài ngữ cảnh.

#### Văn bản liên kết không thể tiếp cận, yếu

Một lỗi thường gặp đáng buồn là chỉ liên kết các từ "click here" hoặc "here":

```html example-bad
<p>Learn more about our products <a href="/products">here</a>.</p>
```

##### Kết quả

{{EmbedLiveSample('Inaccessible, weak link text', '100%', '50')}}

#### Văn bản liên kết có thể tiếp cận, mạnh

May mắn thay, đây là một sửa chữa dễ dàng, và thực ra còn ngắn hơn phiên bản không thể tiếp cận!

```html example-good
<p>Learn more <a href="/products">about our products</a>.</p>
```

##### Kết quả

{{EmbedLiveSample('Accessible, strong link text', '100%', '50')}}

Phần mềm hỗ trợ có phím tắt để liệt kê tất cả các liên kết trên một trang. Tuy nhiên, văn bản liên kết mạnh có lợi cho tất cả người dùng — phím tắt "liệt kê tất cả liên kết" mô phỏng cách người dùng có thị giác nhanh chóng quét qua các trang.

### Sự kiện onclick

Các phần tử neo thường bị lạm dụng như là các nút giả bằng cách đặt `href` của chúng thành `#` hoặc [`javascript:void(0)`](/en-US/docs/Web/URI/Reference/Schemes/javascript) để ngăn trang tải lại, sau đó lắng nghe sự kiện `click` của chúng.

Các giá trị `href` giả mạo này gây ra hành vi không mong đợi khi sao chép/kéo các liên kết, mở liên kết trong tab/cửa sổ mới, đánh dấu trang, hoặc khi JavaScript đang tải, gặp lỗi, hoặc bị tắt. Chúng cũng truyền đạt ngữ nghĩa không chính xác đến các công nghệ hỗ trợ, như trình đọc màn hình.

Sử dụng một {{HTMLElement("button")}} thay thế. Nói chung, **bạn chỉ nên sử dụng siêu liên kết để điều hướng đến URL thực**.

### Liên kết ngoài và liên kết đến tài nguyên không phải HTML

Các liên kết mở trong tab/cửa sổ mới qua `target="_blank"`, hoặc các liên kết trỏ đến tệp tải xuống nên chỉ ra điều gì sẽ xảy ra khi liên kết được theo dõi.

Những người có tầm nhìn thấp, điều hướng bằng công nghệ đọc màn hình, hoặc có mối quan tâm nhận thức có thể bị nhầm lẫn khi một tab, cửa sổ, hoặc ứng dụng mở ra bất ngờ. Phần mềm đọc màn hình cũ hơn thậm chí có thể không thông báo hành vi.

#### Liên kết mở tab/cửa sổ mới

```html
<a target="_blank" href="https://www.wikipedia.org">
  Wikipedia (opens in new tab)
</a>
```

##### Kết quả

{{EmbedLiveSample('Link that opens a new tab/window')}}

#### Liên kết đến tài nguyên không phải HTML

Nếu một biểu tượng được sử dụng để chỉ ra hành vi liên kết, đảm bảo nó có [thuộc tính `alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) để mô tả mục đích của nó. Trong trường hợp biểu tượng bị thiếu, nội dung của thuộc tính `alt` vẫn truyền đạt hành vi của liên kết.

```html
<p>
  <a href="https://www.wikipedia.org/" target="_blank">
    Wikipedia
    <img src="new-tab.svg" width="14" alt="(Opens in new tab)" />
  </a>
  <br />
  <a href="2017-annual-report.ppt">
    2017 annual report
    <img src="powerpoint.svg" width="14" alt="(PowerPoint file)" />
  </a>
</p>
<p>
  <a href="https://www.wikipedia.org/" target="_blank">
    Wikipedia
    <img src="missing-icon.svg" width="14" alt="(Opens in new tab)" />
  </a>
  <br />
  <a href="2017-annual-report.ppt">
    2017 annual report
    <img src="missing-icon.svg" width="14" alt="(PowerPoint file)" />
  </a>
</p>
```

##### Kết quả

{{EmbedLiveSample('Link to a non-HTML resource')}}

- [WebAIM: Links and Hypertext - Hypertext Links](https://webaim.org/techniques/hypertext/hypertext_links)
- [MDN / Understanding WCAG, Guideline 3.2](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.2_—_predictable_make_web_pages_appear_and_operate_in_predictable_ways)
- [G200: Opening new windows and tabs from a link only when necessary](https://www.w3.org/TR/WCAG20-TECHS/G200.html)
- [G201: Giving users advanced warning when opening a new window](https://www.w3.org/TR/WCAG20-TECHS/G201.html)

### Liên kết bỏ qua

Một **liên kết bỏ qua** là một liên kết được đặt càng sớm càng tốt trong nội dung {{HTMLElement("body")}} trỏ đến đầu nội dung chính của trang. Thông thường, CSS ẩn liên kết bỏ qua ngoài màn hình cho đến khi được tập trung.

```html
<body>
  <a href="#content" class="skip-link">Skip to main content</a>

  <header>…</header>

  <!-- The skip link jumps to here -->
  <main id="content"></main>
</body>
```

```css
.skip-link {
  position: absolute;
  top: -3em;
  background: white;
}
.skip-link:focus {
  top: 0;
}
```

#### Kết quả

{{EmbedLiveSample('Skip links')}}

Các liên kết bỏ qua cho phép người dùng bàn phím bỏ qua nội dung lặp lại trên nhiều trang, chẳng hạn như điều hướng tiêu đề.

Liên kết bỏ qua đặc biệt hữu ích cho những người điều hướng với sự trợ giúp của công nghệ hỗ trợ như điều khiển chuyển đổi, lệnh giọng nói, hoặc que miệng/gậy đầu, nơi hành động di chuyển qua các liên kết lặp lại có thể tốn nhiều công sức.

- [WebAIM: "Skip Navigation" Links](https://webaim.org/techniques/skipnav/)
- [How-to: Use Skip Navigation links](https://www.a11yproject.com/posts/skip-nav-links/)
- [MDN / Understanding WCAG, Guideline 2.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.4_%e2%80%94_navigable_provide_ways_to_help_users_navigate_find_content_and_determine_where_they_are)
- [Understanding Success Criterion 2.4.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/navigation-mechanisms-skip.html)

### Kích thước và vị trí gần nhau

#### Kích thước

Các phần tử tương tác, như liên kết, nên cung cấp một vùng đủ lớn để dễ dàng kích hoạt chúng. Điều này giúp nhiều người khác nhau, bao gồm những người có vấn đề kiểm soát vận động và những người sử dụng các đầu vào không chính xác như màn hình cảm ứng. Kích thước tối thiểu 44×44 [CSS pixels](https://w3c.github.io/wcag/guidelines/22/#dfn-css-pixels) được khuyến nghị.

Các liên kết chỉ có văn bản trong nội dung văn xuôi được miễn yêu cầu này, nhưng vẫn là ý kiến hay để đảm bảo đủ văn bản được siêu liên kết để dễ dàng kích hoạt.

- [Understanding Success Criterion 2.5.5: Target Size](https://www.w3.org/WAI/WCAG21/Understanding/target-size.html)
- [Target Size and 2.5.5](https://adrianroselli.com/2019/06/target-size-and-2-5-5.html)
- [Quick test: Large touch targets](https://www.a11yproject.com/posts/large-touch-targets/)

#### Khoảng cách gần nhau

Các phần tử tương tác, như liên kết, được đặt gần nhau về mặt trực quan nên có khoảng cách phân tách chúng. Khoảng cách giúp những người có vấn đề kiểm soát vận động, những người có thể vô tình kích hoạt nội dung tương tác sai.

Khoảng cách có thể được tạo bằng cách sử dụng các thuộc tính CSS như {{CSSxRef("margin")}}.

- [Hand tremors and the giant-button-problem](https://axesslab.com/hand-tremors/)

## Ví dụ

### Liên kết đến URL tuyệt đối

#### HTML

```html
<a href="https://www.mozilla.com">Mozilla</a>
```

#### Kết quả

{{EmbedLiveSample('Linking_to_an_absolute_URL')}}

### Liên kết đến URL tương đối

#### HTML

```html
<a href="//example.com">Scheme-relative URL</a>
<a href="/en-US/docs/Web/HTML">Origin-relative URL</a>
<a href="p">Directory-relative URL</a>
<a href="./p">Directory-relative URL</a>
<a href="../p">Parent-directory-relative URL</a>
```

```css hidden
a {
  display: block;
  margin-bottom: 0.5em;
}
```

#### Kết quả

{{EmbedLiveSample('Linking_to_relative_URLs')}}

### Liên kết đến một phần tử trong cùng trang

```html
<!-- <a> element links to the section below -->
<p><a href="#Section_further_down">Jump to the heading below</a></p>

<!-- Heading to link to -->
<h2 id="Section_further_down">Section further down</h2>
```

#### Kết quả

{{EmbedLiveSample('Linking to an element on the same page')}}

> [!NOTE]
> Bạn có thể sử dụng `href="#top"` hoặc đoạn trống (`href="#"`) để liên kết đến đầu trang hiện tại, [như được định nghĩa trong đặc tả HTML](https://html.spec.whatwg.org/multipage/browsing-the-web.html#scroll-to-the-fragment-identifier).

### Liên kết đến địa chỉ email

Để tạo liên kết mở trong chương trình email của người dùng để cho phép họ gửi tin nhắn mới, sử dụng lược đồ `mailto:`:

```html
<a href="mailto:nowhere@mozilla.org">Send email to nowhere</a>
```

#### Kết quả

{{EmbedLiveSample('Linking to an email address')}}

Để biết chi tiết về URL `mailto:`, chẳng hạn như bao gồm tiêu đề hoặc nội dung, xem [Liên kết email](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links#email_links) hoặc {{RFC(6068)}}.

### Liên kết đến số điện thoại

```html
<a href="tel:+49.157.0156">+49 157 0156</a>
<a href="tel:+1(800)555-0123">(800) 555-0123</a>
```

#### Kết quả

{{EmbedLiveSample('Linking to telephone numbers')}}

Hành vi liên kết `tel:` thay đổi theo khả năng của thiết bị:

- Thiết bị di động tự quay số.
- Hầu hết hệ điều hành có chương trình có thể thực hiện cuộc gọi, như Skype hoặc FaceTime.
- Các trang web có thể thực hiện cuộc gọi điện thoại với {{domxref("Navigator/registerProtocolHandler", "registerProtocolHandler")}}, chẳng hạn như `web.skype.com`.
- Các hành vi khác bao gồm lưu số vào danh bạ, hoặc gửi số đến thiết bị khác.

Xem {{RFC(3966)}} để biết cú pháp, các tính năng bổ sung và các chi tiết khác về lược đồ URL `tel:`.

### Sử dụng thuộc tính download để lưu \<canvas> dưới dạng PNG

Để lưu nội dung của phần tử {{HTMLElement("canvas")}} dưới dạng hình ảnh, bạn có thể tạo một liên kết trong đó `href` là dữ liệu canvas dưới dạng URL `data:` được tạo bằng JavaScript và thuộc tính `download` cung cấp tên tệp cho tệp PNG được tải xuống:

#### Ứng dụng vẽ mẫu với liên kết lưu

##### HTML

```html
<p>
  Paint by holding down the mouse button and moving it.
  <a href="" download="my_painting.png">Download my painting</a>
</p>

<canvas width="300" height="300"></canvas>
```

##### CSS

```css
html {
  font-family: sans-serif;
}
canvas {
  background: white;
  border: 1px dashed;
}
a {
  display: inline-block;
  background: #6699cc;
  color: white;
  padding: 5px 10px;
}
```

##### JavaScript

```js
const canvas = document.querySelector("canvas");
const c = canvas.getContext("2d");
c.fillStyle = "hotpink";
let isDrawing;

function draw(x, y) {
  if (isDrawing) {
    c.beginPath();
    c.arc(x, y, 10, 0, Math.PI * 2);
    c.closePath();
    c.fill();
  }
}

canvas.addEventListener("mousemove", (event) =>
  draw(event.offsetX, event.offsetY),
);
canvas.addEventListener("mousedown", () => (isDrawing = true));
canvas.addEventListener("mouseup", () => (isDrawing = false));

document
  .querySelector("a")
  .addEventListener(
    "click",
    (event) => (event.target.href = canvas.toDataURL()),
  );
```

##### Kết quả

{{EmbedLiveSample('Example_painting_app_with_save_link', '100%', '400')}}

## Bảo mật và quyền riêng tư

Các phần tử `<a>` có thể gây ra hậu quả cho bảo mật và quyền riêng tư của người dùng. Xem [`Referer` header: privacy and security concerns](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns) để biết thông tin.

Sử dụng `target="_blank"` mà không có [`rel="noreferrer"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noreferrer) và [`rel="noopener"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noopener) khiến trang web dễ bị tấn công khai thác API {{domxref("window.opener")}}, mặc dù lưu ý rằng, trong các phiên bản trình duyệt mới hơn, đặt `target="_blank"` ngầm cung cấp cùng sự bảo vệ như đặt `rel="noopener"`. Xem [khả năng tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >nội dung tương tác</a
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#transparent_content_model"
          >Trong suốt</a
        >, ngoại trừ không có phần tử con nào có thể là
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >nội dung tương tác</a
        > hoặc phần tử
        <code>&lt;a&gt;</code>, và không có phần tử con nào có thể có thuộc tính
        <a
          href="/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex"
          >tabindex</a
        > được chỉ định.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >, nhưng không phải các phần tử <code>&lt;a&gt;</code> khác.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role"><code>link</code></a> khi thuộc tính <code>href</code> có mặt, nếu không thì
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"><code>generic</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
      <td>
        <p>Khi thuộc tính <code>href</code> có mặt:</p>
        <ul>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"><code>button</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role"><code>checkbox</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role"><code>menuitem</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role"><code>menuitemcheckbox</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role"><code>menuitemradio</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role"><code>option</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role"><code>radio</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role"><code>switch</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role"><code>tab</code></a></li>
          <li><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role"><code>treeitem</code></a></li>
        </ul>
        <p>Khi thuộc tính <code>href</code> không có mặt:</p>
        <ul>
          <li>bất kỳ</li>
        </ul>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{DOMxRef("HTMLAnchorElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("link")}} tương tự `<a>`, nhưng dành cho các siêu liên kết metadata ẩn với người dùng.
- {{CSSxRef(":link")}} là lớp giả CSS sẽ khớp với các phần tử `<a>` có URL trong thuộc tính `href` mà người dùng chưa truy cập.
- {{CSSxRef(":visited")}} là lớp giả CSS sẽ khớp với các phần tử `<a>` có URL trong thuộc tính `href` mà người dùng đã truy cập trước đây.
- {{CSSxRef(":any-link")}} là lớp giả CSS sẽ khớp với các phần tử `<a>` có thuộc tính `href`.
- [Đoạn văn bản](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments) là hướng dẫn của user-agent được thêm vào URL cho phép tác giả nội dung liên kết đến văn bản cụ thể trên một trang, mà không cần ID.
