---
title: Cấu trúc tài liệu
slug: Learn_web_development/Core/Structuring_content/Structuring_documents
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Marking_up_a_letter", "Learn_web_development/Core/Structuring_content/Creating_links", "Learn_web_development/Core/Structuring_content")}}

Ngoài việc định nghĩa các phần riêng lẻ của trang (chẳng hạn như "một đoạn văn" hoặc "một hình ảnh"), {{glossary("HTML")}} còn có một số phần tử cấp khối được sử dụng để định nghĩa các khu vực của trang web như "phần header", "menu điều hướng" hoặc "cột nội dung chính". Bài viết này xem xét cách lên kế hoạch cấu trúc trang web cơ bản và viết HTML để biểu diễn cấu trúc này.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >. Ngữ nghĩa cấp văn bản như <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs"
          >tiêu đề và đoạn văn</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists"
          >danh sách</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các phần tử cấu trúc ngữ nghĩa HTML phổ biến, ví dụ <code>&lt;main&gt;</code>, <code>&lt;section&gt;</code>, <code>&lt;article&gt;</code>, <code>&lt;header&gt;</code>, <code>&lt;nav&gt;</code> và <code>&lt;footer&gt;</code>, và cách sử dụng chúng đúng cách.</li>
          <li>Sự cần thiết phải sử dụng các phần tử ngữ nghĩa ở những nơi thích hợp, thay vì chỉ sử dụng các phần tử <code>&lt;div&gt;</code> bất cứ khi nào cần vùng chứa cấp khối, và lợi ích của điều này (như cải thiện khả năng tiếp cận).</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các phần cơ bản của tài liệu

Các trang web có thể và sẽ trông khá khác nhau, nhưng tất cả đều có xu hướng chia sẻ các thành phần tiêu chuẩn tương tự nhau, trừ khi trang đang hiển thị video hoặc trò chơi toàn màn hình, là một phần của một số loại dự án nghệ thuật, hoặc chỉ là được cấu trúc kém:

- header:
  - : Thường là một dải lớn ở trên cùng với tiêu đề lớn, logo và có thể là tagline. Điều này thường giữ nguyên từ trang này sang trang khác của trang web.
- thanh điều hướng:
  - : Các liên kết đến các phần chính của trang; thường được biểu diễn bởi các nút menu, liên kết hoặc tab. Giống như header, nội dung này thường nhất quán từ trang web này sang trang web khác — có điều hướng không nhất quán trên trang web của bạn sẽ chỉ dẫn đến người dùng bối rối và thất vọng. Nhiều nhà thiết kế web coi thanh điều hướng là một phần của header thay vì là một thành phần riêng lẻ, nhưng đó không phải là yêu cầu; trên thực tế, một số cũng cho rằng việc có hai phần riêng biệt là tốt hơn cho [khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility), vì trình đọc màn hình có thể đọc hai tính năng tốt hơn nếu chúng riêng biệt.
- nội dung chính:
  - : Một khu vực lớn ở trung tâm chứa hầu hết nội dung độc đáo của một trang web nhất định, ví dụ: video bạn muốn xem, hoặc câu chuyện chính bạn đang đọc, hoặc bản đồ bạn muốn xem, hoặc tiêu đề tin tức, v.v. Đây là phần duy nhất của trang web chắc chắn sẽ thay đổi từ trang này sang trang khác!
- thanh bên:
  - : Một số thông tin ngoại vi, liên kết, trích dẫn, quảng cáo, v.v. Thường, đây là ngữ cảnh với những gì được chứa trong nội dung chính (ví dụ trên trang bài viết tin tức, thanh bên có thể chứa tiểu sử của tác giả, hoặc liên kết đến các bài viết liên quan) nhưng cũng có những trường hợp bạn sẽ tìm thấy một số phần tử lặp lại như hệ thống điều hướng phụ.
- footer:
  - : Một dải ở cuối trang thường chứa chú thích in nhỏ, thông báo bản quyền hoặc thông tin liên hệ. Đây là nơi để đặt thông tin chung (như header) nhưng thường, thông tin đó không quan trọng hoặc phụ so với trang web. Footer đôi khi cũng được sử dụng cho các mục đích {{Glossary("SEO")}}, bằng cách cung cấp liên kết để truy cập nhanh vào nội dung phổ biến.

Một "trang web điển hình" có thể được cấu trúc như sau:

![ví dụ cấu trúc trang web đơn giản với tiêu đề chính, menu điều hướng, nội dung chính, thanh bên và footer.](sample-website.png)

> [!NOTE]
> Hình ảnh trên minh họa các phần chính của tài liệu, mà bạn có thể định nghĩa bằng HTML. Tuy nhiên, _ngoại hình_ của trang được hiển thị ở đây — bao gồm bố cục, màu sắc và phông chữ — đạt được bằng cách áp dụng [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics) cho HTML.

## HTML để cấu trúc nội dung

Ví dụ được hiển thị ở trên không đẹp, nhưng hoàn toàn ổn để minh họa ví dụ bố cục trang web điển hình. Một số trang web có nhiều cột hơn, một số phức tạp hơn nhiều, nhưng bạn đã có ý tưởng. Với CSS phù hợp, bạn có thể sử dụng hầu hết bất kỳ phần tử nào để bao bọc xung quanh các phần khác nhau và làm cho nó trông theo cách bạn muốn, nhưng như đã thảo luận trước đó, chúng ta cần tôn trọng ngữ nghĩa và **sử dụng đúng phần tử cho đúng công việc**.

Điều này là vì hình ảnh không kể toàn bộ câu chuyện. Chúng ta sử dụng màu sắc và kích thước phông chữ để thu hút sự chú ý của người dùng nhìn thấy đến các phần hữu ích nhất của nội dung, như menu điều hướng và các liên kết liên quan, nhưng còn những người khiếm thị thì sao, những người có thể không thấy các khái niệm như "màu hồng" và "phông chữ lớn" hữu ích lắm?

> [!NOTE]
> [Khoảng 8% nam giới và 0.5% phụ nữ](https://www.color-blindness.com/) bị mù màu; hay nói cách khác, khoảng 1 trong mỗi 12 nam giới và 1 trong mỗi 200 phụ nữ. Người mù và người khiếm thị đại diện cho khoảng 4-5% dân số thế giới (vào năm 2015, có [940 triệu người bị mất thị lực ở một mức độ nào đó](https://en.wikipedia.org/wiki/Visual_impairment), trong khi tổng dân số là [khoảng 7.5 tỷ](https://en.wikipedia.org/wiki/World_human_population#/media/File:World_population_history.svg)).

Trong mã HTML của bạn, bạn có thể đánh dấu các phần nội dung dựa trên _chức năng_ của chúng — bạn có thể sử dụng các phần tử biểu diễn các phần nội dung được mô tả ở trên một cách rõ ràng, và các công nghệ hỗ trợ như trình đọc màn hình có thể nhận biết các phần tử đó và giúp với các nhiệm vụ như "tìm điều hướng chính", hoặc "tìm nội dung chính." Như chúng tôi đã đề cập trước đó trong khóa học, có một số [hậu quả của việc không sử dụng đúng cấu trúc phần tử và ngữ nghĩa cho đúng công việc](/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs#why_do_we_need_structure).

Để triển khai đánh dấu ngữ nghĩa như vậy, HTML cung cấp các thẻ chuyên dụng mà bạn có thể sử dụng để biểu diễn các phần như vậy, ví dụ:

- **header:** {{htmlelement("header")}}.
- **thanh điều hướng:** {{htmlelement("nav")}}.
- **nội dung chính:** {{htmlelement("main")}}, với các phần con nội dung khác nhau được biểu diễn bởi các phần tử {{HTMLElement("article")}}, {{htmlelement("section")}} và {{htmlelement("div")}}.
- **thanh bên:** {{htmlelement("aside")}}; thường được đặt bên trong {{htmlelement("main")}}.
- **footer:** {{htmlelement("footer")}}.

### Khám phá mã cho ví dụ của chúng ta

Ví dụ được hiển thị ở trên được biểu diễn bằng mã sau (bạn cũng có thể [tìm thấy ví dụ trong kho GitHub của chúng tôi](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/document_and_website_structure/index.html)). Chúng tôi muốn bạn xem danh sách bên dưới để xem các phần nào tạo nên từng phần của đầu ra trực quan.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />

    <title>My page title</title>
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Sonsie+One"
      rel="stylesheet" />
    <link rel="stylesheet" href="style.css" />
  </head>

  <body>
    <!-- The main header used across all the pages of our website -->

    <header>
      <h1>Header</h1>
    </header>

    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Our team</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>

      <!-- A Search form: another common non-linear
           way to navigate through a site. -->

      <form>
        <input type="search" name="q" placeholder="Search query" />
        <input type="submit" value="Go!" />
      </form>
    </nav>

    <!-- Our page's main content -->
    <main>
      <!-- An article -->
      <article>
        <h2>Article heading</h2>

        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Donec a diam
          lectus. Set sit amet ipsum mauris. Maecenas congue ligula as quam
          viverra nec consectetur ant hendrerit. Donec et mollis dolor. Praesent
          et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt
          congue enim, ut porta lorem lacinia consectetur.
        </p>

        <section>
          <h3>Subsection</h3>

          <p>
            Donec ut librero sed accu vehicula ultricies a non tortor. Lorem
            ipsum dolor sit amet, consectetur adipisicing elit. Aenean ut
            gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id
            dolor.
          </p>

          <p>
            Pelientesque auctor nisi id magna consequat sagittis. Curabitur
            dapibus, enim sit amet elit pharetra tincidunt feugiat nist
            imperdiet. Ut convallis libero in urna ultrices accumsan. Donec sed
            odio eros.
          </p>
        </section>

        <section>
          <h3>Another subsection</h3>

          <p>
            Donec viverra mi quis quam pulvinar at malesuada arcu rhoncus. Cum
            soclis natoque penatibus et manis dis parturient montes, nascetur
            ridiculus mus. In rutrum accumsan ultricies. Mauris vitae nisi at
            sem facilisis semper ac in est.
          </p>

          <p>
            Vivamus fermentum semper porta. Nunc diam velit, adipscing ut
            tristique vitae sagittis vel odio. Maecenas convallis ullamcorper
            ultricied. Curabitur ornare, ligula semper consectetur sagittis,
            nisi diam iaculis velit, is fringille sem nunc vet mi.
          </p>
        </section>
      </article>

      <!-- the aside content can also be nested within the main content -->
      <aside>
        <h2>Related</h2>

        <ul>
          <li><a href="#">Oh I do like to be beside the seaside</a></li>
          <li><a href="#">Oh I do like to be beside the sea</a></li>
          <li><a href="#">Although in the North of England</a></li>
          <li><a href="#">It never stops raining</a></li>
          <li><a href="#">Oh well…</a></li>
        </ul>
      </aside>
    </main>

    <!-- The footer that is used across all the pages of our website -->

    <footer>
      <p>©Copyright 2050 by nobody. All rights reversed.</p>
    </footer>
  </body>
</html>
```

Hãy dành thời gian xem xét mã và hiểu nó — các chú thích bên trong mã cũng sẽ giúp bạn hiểu nó. Chúng tôi không yêu cầu bạn làm nhiều hơn trong bài viết này, vì chìa khóa để hiểu bố cục tài liệu là viết cấu trúc HTML hợp lý, và sau đó bố cục nó với CSS. Chúng tôi sẽ đợi điều này cho đến khi bạn bắt đầu nghiên cứu bố cục CSS như một phần của chủ đề CSS.

## Các phần tử bố cục HTML chi tiết hơn

Điều tốt là hiểu ý nghĩa tổng thể của tất cả các phần tử phân đoạn HTML chi tiết — đây là điều bạn sẽ dần dần làm khi bắt đầu có thêm kinh nghiệm với phát triển web. Bạn có thể tìm thấy nhiều chi tiết bằng cách đọc [tham chiếu phần tử HTML](/en-US/docs/Web/HTML/Reference/Elements) của chúng tôi. Hiện tại, đây là các định nghĩa chính mà bạn nên cố gắng hiểu:

- {{HTMLElement('main')}} dành cho nội dung _độc đáo với trang này._ Sử dụng `<main>` chỉ _một lần_ mỗi trang, và đặt nó trực tiếp bên trong {{HTMLElement('body')}}. Lý tưởng nhất là nó không nên được lồng bên trong các phần tử khác.
- {{HTMLElement('article')}} bao bọc một khối nội dung liên quan có ý nghĩa khi đứng một mình mà không cần phần còn lại của trang (ví dụ, một bài đăng blog đơn lẻ).
- {{HTMLElement('section')}} tương tự như `<article>`, nhưng nó phù hợp hơn để nhóm lại một phần đơn lẻ của trang tạo thành một phần chức năng đơn lẻ (như bản đồ mini, hoặc tập hợp các tiêu đề bài viết và tóm tắt), hoặc một chủ đề. Thực hành tốt nhất là bắt đầu mỗi phần với [tiêu đề](/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs); cũng lưu ý rằng bạn có thể chia `<article>` thành các `<section>` khác nhau, hoặc `<section>` thành các `<article>` khác nhau, tùy thuộc vào ngữ cảnh.
- {{HTMLElement('aside')}} chứa nội dung không liên quan trực tiếp đến nội dung chính nhưng có thể cung cấp thông tin bổ sung gián tiếp liên quan đến nó (mục từ điển, tiểu sử tác giả, liên kết liên quan, v.v.).
- {{HTMLElement('header')}} biểu diễn một nhóm nội dung giới thiệu. Nếu nó là con của {{HTMLElement('body')}} thì nó định nghĩa header toàn cầu của trang web, nhưng nếu nó là con của {{HTMLElement('article')}} hoặc {{HTMLElement('section')}} thì nó định nghĩa header cụ thể cho phần đó (đừng nhầm lẫn với [tiêu đề và heading](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#adding_a_title)).
- {{HTMLElement('nav')}} chứa chức năng điều hướng chính cho trang. Các liên kết phụ, v.v., sẽ không đặt trong điều hướng.
- {{HTMLElement('footer')}} biểu diễn một nhóm nội dung cuối cho trang.

Mỗi phần tử được đề cập ở trên có thể được nhấp để đọc bài viết tương ứng trong phần "tham chiếu phần tử HTML", cung cấp thêm chi tiết về từng phần tử.

### Vùng bao bọc không ngữ nghĩa

Đôi khi bạn sẽ gặp phải tình huống không thể tìm thấy phần tử ngữ nghĩa lý tưởng để nhóm một số mục lại với nhau hoặc bao bọc một số nội dung. Đôi khi bạn chỉ muốn nhóm một tập hợp các phần tử lại với nhau để tác động đến tất cả chúng như một thực thể đơn lẻ với một số {{glossary("CSS")}} hoặc {{glossary("JavaScript")}}. Đối với những trường hợp như vậy, HTML cung cấp các phần tử {{HTMLElement("div")}} và {{HTMLElement("span")}}. Bạn nên sử dụng chúng tốt nhất là với thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) phù hợp, để cung cấp một số loại nhãn cho chúng để chúng có thể dễ dàng được nhắm mục tiêu.

{{HTMLElement("span")}} là phần tử nội tuyến không ngữ nghĩa, mà bạn chỉ nên sử dụng nếu bạn không thể nghĩ ra phần tử văn bản ngữ nghĩa tốt hơn để bao bọc nội dung của mình, hoặc không muốn thêm bất kỳ ý nghĩa cụ thể nào. Ví dụ:

```html
<p>
  The King walked drunkenly back to his room at 01:00, the beer doing nothing to
  aid him as he staggered through the door.
  <span class="editor-note">
    [Editor's note: At this point in the play, the lights should be down low].
  </span>
</p>
```

Trong trường hợp này, chú thích của biên tập viên được cho là chỉ cung cấp hướng dẫn bổ sung cho đạo diễn vở kịch; nó không có ý nghĩa ngữ nghĩa bổ sung. Đối với người dùng nhìn thấy, CSS có thể được sử dụng để tạo khoảng cách nhẹ cho chú thích khỏi văn bản chính.

{{HTMLElement("div")}} là phần tử cấp khối không ngữ nghĩa, mà bạn chỉ nên sử dụng nếu bạn không thể nghĩ ra phần tử khối ngữ nghĩa tốt hơn để sử dụng, hoặc không muốn thêm bất kỳ ý nghĩa cụ thể nào. Ví dụ, hãy tưởng tượng một widget giỏ hàng mà bạn có thể chọn kéo lên bất kỳ lúc nào trong thời gian bạn ở trên trang thương mại điện tử:

```html-nolint
<div class="shopping-cart">
  <h2>Shopping cart</h2>
  <ul>
    <li>
      <p>
        <a href=""><strong>Silver earrings</strong></a>: $99.95.
      </p>
      <img src="../products/3333-0985/thumb.png" alt="Silver earrings" />
    </li>
    <li>…</li>
  </ul>
  <p>Total cost: $237.89</p>
</div>
```

Đây không thực sự là `<aside>`, vì nó không nhất thiết liên quan đến nội dung chính của trang (bạn muốn nó có thể xem từ bất kỳ đâu). Nó thậm chí không đặc biệt hợp lý để sử dụng `<section>`, vì nó không phải là phần của nội dung chính của trang. Vì vậy, `<div>` là ổn trong trường hợp này. Chúng tôi đã bao gồm tiêu đề như bảng chỉ dẫn để hỗ trợ người dùng trình đọc màn hình tìm thấy nó.

> [!WARNING]
> Div rất tiện lợi để sử dụng đến mức dễ sử dụng quá nhiều. Vì chúng không mang giá trị ngữ nghĩa, chúng chỉ làm lộn xộn mã HTML của bạn. Hãy cẩn thận chỉ sử dụng chúng khi không có giải pháp ngữ nghĩa tốt hơn và cố gắng giảm thiểu việc sử dụng chúng, nếu không bạn sẽ gặp khó khăn khi cập nhật và duy trì tài liệu.

> [!NOTE]
> Hướng dẫn tương tác [Semantic HTML](https://scrimba.com/learn-accessible-web-design-c031/~0b?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> của Scrimba cung cấp tóm tắt hữu ích về đánh dấu ngữ nghĩa và lý do tại sao bạn nên sử dụng nó, cộng với một thử thách kiểm tra khả năng của bạn để cải thiện cơ sở mã HTML với các phần tử ngữ nghĩa.

### Ngắt dòng và quy tắc ngang

Hai phần tử mà bạn sẽ thỉnh thoảng sử dụng và muốn biết về chúng là {{htmlelement("br")}} và {{htmlelement("hr")}}.

#### \<br>: phần tử ngắt dòng

`<br>` tạo ra một dấu ngắt dòng trong đoạn văn; đây là cách duy nhất để ép buộc cấu trúc cứng trong tình huống bạn muốn có một loạt các dòng ngắn cố định, chẳng hạn như trong địa chỉ bưu chính hoặc bài thơ. Ví dụ:

```html
<p>
  There once was a man named O'Dell<br />
  Who loved to write HTML<br />
  But his structure was bad, his semantics were sad<br />
  and his markup didn't read very well.
</p>
```

Nếu không có các phần tử `<br>`, đoạn văn sẽ chỉ được hiển thị trong một dòng dài (như chúng tôi đã nói trước đó trong khóa học, [HTML bỏ qua hầu hết khoảng trắng](/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax#whitespace_in_html)); với các phần tử `<br>` trong mã, đánh dấu được hiển thị như thế này:

{{EmbedLiveSample('br_the_line_break_element', '100%', 150)}}

#### \<hr>: phần tử ngắt chủ đề

Các phần tử `<hr>` tạo ra một quy tắc ngang trong tài liệu biểu thị sự thay đổi chủ đề trong văn bản (chẳng hạn như sự thay đổi chủ đề hoặc cảnh). Về mặt trực quan, nó chỉ trông như một đường ngang. Ví dụ:

```html
<p>
  Ron was backed into a corner by the marauding netherbeasts. Scared, but
  determined to protect his friends, he raised his wand and prepared to do
  battle, hoping that his distress call had made it through.
</p>
<hr />
<p>
  Meanwhile, Harry was sitting at home, staring at his royalty statement and
  pondering when the next spin off series would come out, when an enchanted
  distress letter flew through his window and landed in his lap. He read it
  hazily and sighed; "better get back to work then", he mused.
</p>
```

Sẽ hiển thị như thế này:

{{EmbedLiveSample('hr_the_thematic_break_element', '100%', '185px')}}

## Cấu trúc trang web cơ bản

Giai đoạn tiếp theo sau khi lên kế hoạch cấu trúc của một trang web đơn lẻ là lên kế hoạch cấu trúc của toàn bộ trang web nhiều trang, bao gồm cách chúng nên được sắp xếp và liên kết với nhau để có trải nghiệm người dùng tốt nhất có thể. Điều này được gọi là {{glossary("Information architecture")}}.

Trong một trang web lớn, phức tạp, rất nhiều lên kế hoạch có thể được đưa vào quá trình này, nhưng đối với một trang web cơ bản với vài trang, đây có thể là một bài tập nhanh và thú vị.

Quá trình có thể trông như thế này:

1. Bạn sẽ có một vài phần tử chung cho hầu hết (nếu không phải tất cả) các trang — chẳng hạn như menu điều hướng và nội dung footer. Nếu trang web của bạn dành cho một doanh nghiệp, ví dụ, sẽ là ý tưởng tốt khi có thông tin liên hệ của bạn có sẵn trong footer trên mỗi trang. Ghi chú những gì bạn muốn có chung cho mọi trang. Ví dụ:
   - Header:
     - Tiêu đề và logo
     - Bộ chọn ngôn ngữ trang
   - Menu điều hướng
   - Footer:
     - Thông báo bản quyền
     - Liên kết đến điều khoản và điều kiện, thông tin liên hệ và chính sách khả năng tiếp cận

2. Tiếp theo, hãy vẽ một phác thảo thô về những gì bạn có thể muốn cấu trúc của mỗi trang trông như thế nào (nó có thể trông giống như trang web đơn giản của chúng ta ở trên). Ghi chú mỗi khối sẽ là gì.![Một sơ đồ đơn giản của cấu trúc trang web mẫu, với header, khu vực nội dung chính, hai thanh bên tùy chọn và footer](/shared-assets/images/diagrams/learn/structuring-documents/site-structure.svg)
3. Bây giờ, hãy động não về tất cả nội dung khác (không chung cho mọi trang) bạn muốn có trên trang web của mình. Ví dụ:
   - Chuyến bay
   - Chỗ ở
   - Giao thông
   - Những điều cần làm
   - Ưu đãi đặc biệt
   - Các gói du lịch phổ biến, ví dụ mùa đông nắng, trượt tuyết
   - Kết quả tìm kiếm
   - Đánh giá
   - Yêu cầu thị thực/nhập cảnh
   - Tiền tệ
   - Ngôn ngữ và văn hóa
   - Mua kỳ nghỉ

4. Tiếp theo, hãy cố gắng sắp xếp tất cả các mục nội dung này thành các nhóm, để cung cấp cho bạn ý tưởng về những phần nào có thể sống cùng nhau trên các trang khác nhau. Điều này rất tương tự như kỹ thuật được gọi là {{glossary("Card sorting")}}.
   - Tìm kiếm
     - Chuyến bay
     - Chỗ ở
     - Giao thông
     - Những điều cần làm
   - Ưu đãi đặc biệt
     - Kỳ nghỉ phổ biến
     - Mùa đông nắng
     - Trượt tuyết
   - Kết quả tìm kiếm
     - Đánh giá
     - Thông tin theo quốc gia
       - Yêu cầu thị thực/nhập cảnh
       - Tiền tệ
       - Ngôn ngữ và văn hóa
   - Mua kỳ nghỉ

5. Bây giờ hãy cố gắng phác thảo một sơ đồ trang web thô — có một hộp cho mỗi trang trên trang web của bạn và vẽ các đường để hiển thị quy trình làm việc thông thường giữa các trang. Trang chủ có thể nằm ở đầu hoặc ở trung tâm, và liên kết đến hầu hết nếu không phải tất cả những trang khác. Hầu hết các trang trong một trang nhỏ nên có thể truy cập từ điều hướng chính, mặc dù có những ngoại lệ. Bạn cũng có thể muốn bao gồm các ghi chú về cách mọi thứ có thể được trình bày.![Bản đồ trang web hiển thị trang chủ, trang quốc gia, kết quả tìm kiếm, trang đặc biệt và luồng thanh toán và mua hàng](/shared-assets/images/diagrams/learn/structuring-documents/site-map.svg)

Hãy thử thực hiện bài tập trên cho một trang web do bạn tự tạo. Bạn muốn tạo trang web về gì? Là mục tiêu mở rộng, hãy sử dụng kiến thức HTML bạn đã có được cho đến nay để tạo một vài trang trên trang web. Bạn có thể sử dụng [mẫu HTML cơ bản](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) của chúng tôi làm điểm bắt đầu.

## Tóm tắt

Tại thời điểm này, bạn nên có ý tưởng tốt hơn về cách cấu trúc trang web/trang. Trong bài viết tiếp theo của mô-đun này, chúng ta sẽ xem xét cách tạo siêu liên kết, một trong những tính năng cơ bản của web.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Marking_up_a_letter", "Learn_web_development/Core/Structuring_content/Creating_links", "Learn_web_development/Core/Structuring_content")}}
