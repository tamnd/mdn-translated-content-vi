---
title: Mô hình tiêu chuẩn web
slug: Learn_web_development/Getting_started/Web_standards/The_web_standards_model
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Web_standards/How_the_web_works", "Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites", "Learn_web_development/Getting_started/Web_standards")}}

Bài viết này cung cấp một số kiến thức nền hữu ích về web và tiêu chuẩn web (web standards) — cách chúng ra đời, các công nghệ tiêu chuẩn web là gì, và chúng phối hợp với nhau như thế nào.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính, trình duyệt web và các công nghệ web.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Tiêu chuẩn web và các nguyên tắc cốt lõi mà chúng được xây dựng trên.</li>
          <li>Cách các tổ chức tiêu chuẩn (standards bodies) hoạt động — ví dụ <a href="https://www.w3.org/">W3C</a>, <a href="https://whatwg.org/">WHATWG</a>, <a href="https://tc39.es/">TC39</a> và <a href="https://www.khronos.org/">Khronos Group</a>; quy trình tạo ra tiêu chuẩn.</li>
          <li>Các công nghệ tiêu chuẩn web chính và cách chúng phối hợp với nhau.</li>
          <li>Tệp tin phía máy chủ (động) so với tệp tin phía máy khách (tĩnh).</li>
          <li>Các thực hành tốt nhất trên web.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Lịch sử tóm tắt về web

Vào cuối những năm 1960, quân đội Mỹ đã phát triển một mạng truyền thông gọi là [ARPANET](/en-US/docs/Glossary/Arpanet). Đây có thể được coi là tiền thân của **internet**, vì nó hoạt động dựa trên [chuyển mạch gói](https://en.wikipedia.org/wiki/Packet_switching) và là triển khai đầu tiên của bộ giao thức [TCP/IP](https://en.wikipedia.org/wiki/Internet_protocol_suite). Hai công nghệ này tạo thành nền tảng cơ sở hạ tầng mà internet được xây dựng trên.

Năm 1980, [Tim Berners-Lee](https://en.wikipedia.org/wiki/Tim_Berners-Lee) (thường được gọi là TimBL) đã viết một chương trình máy tính gọi là ENQUIRE, có khái niệm về các liên kết giữa các nút khác nhau. Nghe quen không?

Chuyển đến năm 1989, TimBL đã viết [Information Management: A Proposal](https://www.w3.org/History/1989/proposal.html) và HyperText tại CERN; hai ấn phẩm này cùng nhau cung cấp nền tảng cho cách web sẽ hoạt động. Chúng nhận được sự quan tâm đáng kể, đủ để thuyết phục sếp của TimBL cho phép ông tiến hành tạo ra một hệ thống siêu văn bản toàn cầu.

Đến năm 1990–1991, TimBL đã tạo ra tất cả những thứ cần thiết để chạy phiên bản đầu tiên của **World Wide Web** (thường được gọi là **web**) — [HTTP](/en-US/docs/Web/HTTP), [HTML](/en-US/docs/Web/HTML), trình duyệt web đầu tiên có tên [WorldWideWeb](https://en.wikipedia.org/wiki/WorldWideWeb), một máy chủ web và một số trang web để xem.

> [!NOTE]
> Đôi khi mọi người dùng "web" và "internet" thay thế cho nhau, nhưng chúng là những thứ khác nhau. Internet là cơ sở hạ tầng cho phép thông tin được vận chuyển khắp thế giới giữa các máy chủ và máy khách khác nhau, trong khi web là một hệ thống được xây dựng trên nền tảng internet. Web xác định các loại thông tin (nội dung và mã nguồn) được vận chuyển qua internet và các giao thức truyền thông để quản lý việc vận chuyển đó.

Năm 1994, TimBL thành lập [World Wide Web Consortium](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium) (W3C), một tổ chức tập hợp các đại diện từ nhiều công ty khác nhau để cùng làm việc về việc tạo ra các công nghệ web. W3C đã làm việc để chuẩn hóa và cải thiện các công nghệ web hiện có như HTML và HTTP, và tạo ra các công nghệ mới như [CSS](/en-US/docs/Web/CSS) và [JavaScript](/en-US/docs/Web/JavaScript). Đặc biệt, CSS và JavaScript rất quan trọng để mang lại phong cách và khả năng tương tác cho web, khiến nó trông giống như web mà chúng ta biết ngày nay.

Trong vài năm tiếp theo, web bùng nổ, nhiều trình duyệt được phát hành, hàng nghìn máy chủ web được thiết lập và hàng triệu trang web được tạo ra. Các tổ chức tiêu chuẩn khác cũng xuất hiện để giúp chuẩn hóa các khía cạnh khác nhau của công nghệ web.

> [!NOTE]
> Nếu bạn quan tâm đến việc đọc một tài khoản chi tiết hơn về lịch sử web, hãy thử tìm kiếm "lịch sử web" trong [công cụ tìm kiếm](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Browsing_the_web#search_engine) yêu thích của bạn và xem những gì bạn có thể tìm thấy.

## Tiêu chuẩn web

**Tiêu chuẩn web** (web standards) là các công nghệ chúng ta sử dụng để xây dựng trang web. Các tiêu chuẩn này tồn tại dưới dạng các tài liệu kỹ thuật dài gọi là đặc tả kỹ thuật (specifications), mô tả chính xác công nghệ nên hoạt động như thế nào. Các tài liệu này không hữu ích lắm cho việc học cách sử dụng công nghệ mà chúng mô tả (đó là lý do tại sao chúng ta có các trang như MDN Web Docs). Thay vào đó, chúng được thiết kế để được sử dụng bởi các kỹ sư phần mềm để triển khai các công nghệ này (thường là trong trình duyệt web).

### Các tổ chức tiêu chuẩn và quy trình

Tiêu chuẩn web được tạo ra bởi các tổ chức tiêu chuẩn web (web standards bodies) — các tổ chức mời các nhóm người từ các công ty công nghệ khác nhau đến cùng nhau và đồng ý về cách các công nghệ nên hoạt động theo cách tốt nhất để đáp ứng tất cả các trường hợp sử dụng của chúng.

W3C là tổ chức tiêu chuẩn web được biết đến nhiều nhất, nhưng cũng có nhiều tổ chức khác. Ví dụ:

- [WHATWG](https://whatwg.org/) duy trì [HTML Living Standard](https://html.spec.whatwg.org/multipage/), mô tả chính xác cách HTML (tất cả các phần tử HTML và các API liên quan, cùng các công nghệ xung quanh khác) nên được triển khai.
- [TC39](https://tc39.es/) và [ECMA](https://ecma-international.org/) xác định và công bố tiêu chuẩn cho ECMAScript, mà JavaScript hiện đại được dựa trên đó.
- [Khronos](https://www.khronos.org/) công bố các công nghệ cho đồ họa 3D, chẳng hạn như WebGL.

Các quy trình đầy đủ để tạo ra tiêu chuẩn có thể trở nên sâu và phức tạp. Tuy nhiên, trừ khi bạn muốn tạo ra các tính năng công nghệ web của riêng mình, bạn không cần hiểu hầu hết các quy trình đó. Nếu bạn muốn đóng góp vào cuộc thảo luận về các công nghệ mới và cung cấp phản hồi, thường bạn chỉ cần tham gia danh sách thư liên quan hoặc cơ chế thảo luận khác. Các cuộc thảo luận về tiêu chuẩn được thực hiện công khai, do đó có thuật ngữ ["Tiêu chuẩn mở" (Open standards)](#open_standards).

Hiện tại, chúng ta sẽ cung cấp cho bạn hiểu biết tổng quát, cấp cao về cách các quy trình tiêu chuẩn hoạt động:

1. Ai đó nhận thấy sự cần thiết của một tính năng tiêu chuẩn web mới sẽ làm cho cuộc sống của các nhà phát triển dễ dàng hơn. Ví dụ, có thể có một mẫu phổ biến thường được sử dụng trong giao diện người dùng web, nhưng việc triển khai khá phức tạp. Một tính năng CSS chuyên dụng sẽ làm cho nó dễ dàng hơn nhiều. Người đó có thể là bất kỳ ai — một nhà phát triển cá nhân, hoặc một kỹ sư làm việc cho một công ty công nghệ lớn.
2. Người đó thảo luận về tính năng này với các nhà phát triển khác, kỹ sư trình duyệt, v.v., và bắt đầu tạo ra sự quan tâm đến việc triển khai tính năng. Thường họ viết một tài liệu giải thích mô tả sự cần thiết của tính năng và cách nó sẽ hoạt động, cùng một bản demo mã cho thấy tính năng sẽ trông như thế nào trong thực tế.
3. Nếu có đủ sự quan tâm đến tính năng, nó sẽ được thảo luận chính thức bên trong nhóm làm việc của tổ chức tiêu chuẩn liên quan. Ví dụ, các tính năng CSS thường được thảo luận bởi [CSS Working Group](https://www.w3.org/groups/wg/css/) (WG) (xem thêm [trang Wikipedia về CSS Working Group](https://en.wikipedia.org/wiki/CSS_Working_Group) để biết thêm mô tả và lịch sử). Trước khi một công nghệ web mới được chấp nhận, nó phải được đánh giá chặt chẽ để đảm bảo rằng nó tốt cho web — ví dụ, nó không gây ra bất kỳ vấn đề bảo mật nào, nó [có thể tiếp cận và tương thích](#accessible_and_interoperable) với các công nghệ web khác, và nó không phụ thuộc vào bằng sáng chế.
4. Để kiểm chứng tính năng, một số việc xảy ra. Các điểm này đều có thể xảy ra cùng lúc với Điểm 3, hoặc thậm chí trước đó (các nhà cung cấp trình duyệt đôi khi triển khai các tính năng độc quyền/không tiêu chuẩn và sau đó cố gắng chuẩn hóa chúng sau):
   1. Một hoặc nhiều nhà cung cấp trình duyệt sẽ triển khai phiên bản thử nghiệm của tính năng mới, thường bị tắt theo mặc định, nhưng có thể được bật bởi những người muốn kiểm tra và cung cấp phản hồi.
   2. Một thành viên nhóm làm việc cũng sẽ thêm nó vào đặc tả kỹ thuật để các nhà cung cấp trình duyệt có thể triển khai nó một cách nhất quán.
   3. Họ cũng sẽ tìm kiếm phản hồi từ các nhà cung cấp trình duyệt khác để xem họ có vấn đề gì với đề xuất, và khả năng họ sẽ triển khai nó như thế nào. Đây được gọi là Lập trường tiêu chuẩn (Standards positions). Xem ví dụ [Mozilla Standards Positions](https://mozilla.github.io/standards-positions/).
   4. Các cá nhân liên quan cũng sẽ viết một bộ kiểm tra mở rộng để chứng minh rằng tính năng hoạt động như được mô tả.

5. Cuối cùng, nếu mọi thứ ổn, tính năng sẽ được triển khai trên tất cả các trình duyệt và có thể bắt đầu được sử dụng khi tạo trang web.

> [!NOTE]
> Hoàn toàn có thể rằng những người đề xuất tính năng, triển khai nó trong trình duyệt, tạo đặc tả kỹ thuật, viết kiểm tra và thu thập phản hồi về nó, là cùng một người/những người.

Bạn có thể tìm thêm thông tin về các quy trình của tổ chức tiêu chuẩn cụ thể. Xem ví dụ:

- [Tài liệu Quy trình W3C](https://www.w3.org/policies/process/)
- [WHATWG — Chế độ Làm việc](https://whatwg.org/working-mode)
- [Quy trình TC39](https://tc39.es/process-document/)

## Các nguyên tắc cốt lõi của tiêu chuẩn web

Các nguyên tắc cốt lõi của web, làm cho web trở thành một ngành độc đáo và thú vị để tham gia, như sau:

- Mở để đóng góp và sử dụng, do đó không bị ràng buộc bởi bằng sáng chế hoặc kiểm soát bởi một thực thể tư nhân duy nhất.
- Có thể tiếp cận (accessible) và có khả năng tương tác (interoperable).
- Chúng không phá vỡ web.

Hãy xem xét từng điều trong số này chi tiết hơn một chút.

### Tiêu chuẩn "Mở"

Một trong những khía cạnh chính của tiêu chuẩn web, mà TimBL và W3C đã đồng ý ngay từ đầu, là web (và công nghệ web) phải **mở**. Điều này có nghĩa là chúng miễn phí để cả đóng góp và sử dụng, và không bị ràng buộc bởi bằng sáng chế/giấy phép. Điều này quan trọng — nếu một công nghệ web phụ thuộc vào công nghệ được cấp bằng sáng chế/giấy phép để hoạt động, chủ sở hữu bằng sáng chế/giấy phép có thể tính phí các nhà cung cấp trình duyệt triển khai những khoản tiền lớn, và chi phí đó sẽ được chuyển sang cho người dùng trình duyệt.

Ngoài ra, vì các công nghệ web được tạo ra một cách công khai, trong sự hợp tác giữa nhiều công ty khác nhau, điều đó có nghĩa là không có công ty nào có thể kiểm soát chúng, đây là điều thực sự tốt. Bạn sẽ không muốn một công ty duy nhất đột nhiên quyết định đặt toàn bộ web sau một bức tường thanh toán, hoặc phát hành phiên bản HTML mới mà mọi người phải mua để tiếp tục tạo trang web, hoặc tệ hơn nữa, quyết định họ không còn quan tâm nữa và tắt nó đi.

Tiêu chuẩn mở (open standards) cho phép web vẫn là một tài nguyên công cộng miễn phí, nơi bất kỳ ai cũng có thể viết mã để xây dựng một trang web miễn phí, và bất kỳ ai cũng có thể đóng góp vào quy trình tạo tiêu chuẩn.

### Có thể tiếp cận và có khả năng tương tác

Web và trình duyệt web về cơ bản được thiết kế để nội dung web có thể **tiếp cận** được với người khuyết tật. Ban đầu nó được hình dung như một công cụ bình đẳng hóa vĩ đại, cho phép mọi người truy cập thông tin bất kể hoàn cảnh. Điều này có nghĩa là, ví dụ:

- Những người không thể sử dụng chuột hoặc thiết bị trỏ có thể sử dụng bàn phím để điều hướng web.
- Những người bị suy giảm thị lực có thể phóng to nội dung, hoặc sử dụng một chương trình gọi là **trình đọc màn hình** (screen reader) để đọc nội dung cho họ nghe và mô tả các điều khiển theo cách có ý nghĩa.

> [!NOTE]
> Bạn sẽ tìm hiểu thêm về [Khả năng tiếp cận (Accessibility)](/en-US/docs/Learn_web_development/Core/Accessibility) sau này trong lộ trình học.

Ngoài ra, các công nghệ web được thiết kế để **có khả năng tương tác** (interoperable). Vì các công nghệ web được triển khai theo các tiêu chuẩn đã được công bố, các trình duyệt phải cung cấp cùng một đầu ra kết xuất cho một đầu vào nhất định (ví dụ, mã HTML, CSS hoặc JS) — nói cách khác, một trang web phải hoạt động nhất quán trên nhiều trình duyệt.

### Đừng phá vỡ web

Một cụm từ khác bạn sẽ nghe về tiêu chuẩn web mở là "đừng phá vỡ web". Ý tưởng đằng sau điều này là bất kỳ công nghệ web mới nào cũng phải tương thích ngược với những gì đã có trước đó, để các trang web hiện có sẽ tiếp tục hoạt động theo cách giống như trước.

Các nhà cung cấp trình duyệt web phải có thể triển khai các công nghệ web mới mà không gây ra sự khác biệt về kết xuất hoặc chức năng khiến người dùng nghĩ rằng một trang web bị hỏng và thử trình duyệt khác.

## Tổng quan về các công nghệ web hiện đại

Có một số công nghệ cần học nếu bạn muốn trở thành nhà phát triển web front-end. Trong phần này chúng ta sẽ mô tả ngắn gọn về chúng.

### HTML, CSS và JavaScript

[HTML](/en-US/docs/Web/HTML), [CSS](/en-US/docs/Web/CSS) và [JavaScript](/en-US/docs/Web/JavaScript) là ba công nghệ chính bạn sẽ dùng để xây dựng một trang web. Bạn đã gặp chúng trong [mô-đun trước](/en-US/docs/Learn_web_development/Getting_started/Your_first_website), nhưng để ôn lại:

- Ngôn ngữ đánh dấu siêu văn bản, hay **HTML**, là một ngôn ngữ đánh dấu bao gồm các phần tử khác nhau mà bạn có thể bao bọc (đánh dấu) nội dung để mang lại ý nghĩa (ngữ nghĩa) và cấu trúc. Nếu chúng ta sử dụng phép ẩn dụ xây nhà, HTML giống như nền móng và tường của ngôi nhà, tạo cấu trúc và giữ nó lại với nhau.
- Cascading Style Sheets (**CSS**) là một ngôn ngữ dựa trên quy tắc được dùng để áp dụng kiểu dáng cho HTML của bạn — ví dụ, thiết lập màu chữ và màu nền, thêm đường viền, tạo hiệu ứng chuyển động, hoặc bố cục trang theo một cách nhất định. Trong phép ẩn dụ về ngôi nhà, CSS giống như sơn, giấy dán tường, thảm và tranh mà bạn dùng để làm cho ngôi nhà trông đẹp.
- **JavaScript** là ngôn ngữ lập trình chúng ta sử dụng để thêm khả năng tương tác vào trang web, từ chuyển đổi kiểu dáng động, đến lấy các bản cập nhật từ máy chủ, cho đến đồ họa 3D phức tạp.
  - Bạn cũng sẽ nghe thuật ngữ **API** cùng với JavaScript, viết tắt của **Giao diện lập trình ứng dụng** (Application Programming Interface). API JavaScript là chức năng được xây dựng trên nền tảng JavaScript cho phép bạn kiểm soát các đoạn mã phức tạp hơn hoặc chức năng khác trên máy tính của bạn (chẳng hạn như các thiết bị phần cứng như webcam hoặc micro) theo cách có thể quản lý được.
  - Trong phép ẩn dụ về ngôi nhà, JavaScript giống như bếp nấu ăn, TV, lò vi sóng hoặc máy sấy tóc — những thứ mang lại chức năng hữu ích cho ngôi nhà của bạn.

### Các công nghệ web khác

Có các công nghệ khác được sử dụng trên web, ví dụ:

- [HTTP](/en-US/docs/Web/HTTP) để giao tiếp giữa máy khách và máy chủ, như đã đề cập trước đó.
- [SVG](/en-US/docs/Web/SVG) để tạo và thao tác đồ họa vector.
- [MathML](/en-US/docs/Web/MathML) để mô tả các công thức toán học.

Tuy nhiên, HTML, CSS và JavaScript là các công nghệ quan trọng nhất cần học, vì vậy chúng ta sẽ tập trung chủ yếu vào những điều đó trong lộ trình học của mình.

## Công cụ

Sau khi bạn đã học về các công nghệ nền tảng tiêu chuẩn được dùng để xây dựng trang web (như HTML, CSS và JavaScript), bạn sẽ sớm bắt đầu gặp các công cụ khác nhau có thể được sử dụng để làm cho công việc của bạn dễ dàng hơn hoặc hiệu quả hơn. Ví dụ:

- [Công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) bên trong các trình duyệt hiện đại có thể được dùng để gỡ lỗi mã của bạn.
- [Công cụ kiểm tra](/en-US/docs/Learn_web_development/Extensions/Testing) có thể được dùng để chạy các bài kiểm tra cho thấy mã của bạn có hoạt động như bạn muốn không.
- [Các framework và thư viện](/en-US/docs/Learn_web_development/Core/Frameworks_libraries) được xây dựng trên nền tảng JavaScript cho phép bạn xây dựng một số loại trang web nhanh hơn và hiệu quả hơn nhiều.
- Cái gọi là **Linters** và **formatters** (công cụ định dạng mã), nhận một bộ quy tắc về phong cách mã hóa, xem xét mã của bạn và cập nhật mã của bạn để tuân theo các quy tắc đó. Prettier, mà bạn [đã gặp trước đó trong khóa học](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Code_editors#enhancing_your_code_editor_with_extensions), là một ví dụ về trình định dạng mã.

## Ngôn ngữ và framework phía máy chủ

HTML, CSS và JavaScript là các ngôn ngữ front-end (hay phía máy khách), nghĩa là chúng được chạy bởi trình duyệt để tạo ra giao diện người dùng của trang web mà người dùng của bạn có thể sử dụng.

Có một lớp ngôn ngữ khác gọi là ngôn ngữ back-end (hay phía máy chủ), nghĩa là chúng được chạy trên máy chủ trước khi kết quả được gửi đến trình duyệt để hiển thị. Một trường hợp sử dụng điển hình của ngôn ngữ phía máy chủ là lấy dữ liệu từ cơ sở dữ liệu, tạo ra HTML để chứa dữ liệu, sau đó gửi HTML đó đến trình duyệt để hiển thị cho người dùng.

Các framework và ngôn ngữ phía máy chủ ví dụ bao gồm ASP.NET (C#), Django (Python), Laravel (PHP) và Next.js (JavaScript).

Các công nghệ này không được coi là "tiêu chuẩn web" — chúng được phát triển bởi các tổ chức bên ngoài các quy trình tiêu chuẩn web của các tổ chức như W3C và WHATWG — mặc dù một số trong số chúng sẽ có các quy trình tương tự mở.

### Tĩnh so với động

Một cách khác mà các ngôn ngữ phía máy khách và phía máy chủ thường được mô tả là **tĩnh** (static) và **động** (dynamic):

- Một tệp HTML thuần túy được lưu trữ trên máy chủ. Khi được yêu cầu, nó được gửi đến máy khách, không thay đổi, và được trình duyệt kết xuất. Vì nó không thay đổi, nó được gọi là "tĩnh".
- Khi mã phía máy chủ (ví dụ, một kịch bản Python hoặc một trang ASP.NET) tạo ra một số HTML chứa dữ liệu và trả lại HTML đó cho máy khách, nội dung của HTML thay đổi tùy thuộc vào những gì mã phía máy chủ làm. Do đó nó được gọi là "động".

Thường có một số sự chồng chéo giữa các khái niệm về mã tĩnh và động. Các ngôn ngữ phía máy chủ thường định nghĩa các cấu trúc HTML bên trong một tệp mẫu, thường là HTML tĩnh phần lớn với một số phần động đặc biệt được bao gồm, thay đổi tùy thuộc vào dữ liệu nào cần được chèn vào.

## Các thực hành tốt nhất trên web

Chúng ta đã nói ngắn gọn về các công nghệ mà bạn sẽ sử dụng để xây dựng trang web. Bây giờ hãy thảo luận về các thực hành tốt nhất mà các nhà phát triển web thường áp dụng để đảm bảo rằng trang web của họ có thể sử dụng được bởi càng nhiều người càng tốt.

Khi phát triển web, nguyên nhân chính của sự không chắc chắn đến từ thực tế là bạn không biết sự kết hợp công nghệ nào mà mỗi người dùng sẽ sử dụng để xem trang web của bạn:

- Người dùng 1 có thể đang xem nó trên iPhone, với màn hình nhỏ, hẹp.
- Người dùng 2 có thể đang xem nó trên laptop Windows với màn hình rộng được kết nối.
- Người dùng 3 có thể bị suy giảm thị lực và đang sử dụng trình đọc màn hình để đọc và tương tác với trang web.
- Người dùng 4 có thể đang sử dụng một máy tính để bàn cũ không thể chạy các trình duyệt hiện đại.

Vì bạn không biết chính xác người dùng của mình sẽ sử dụng gì, bạn cần thiết kế một cách phòng thủ — làm cho trang web của bạn linh hoạt nhất có thể, để tất cả những người dùng trên đều có thể sử dụng nó, ngay cả khi họ có thể không đều có cùng trải nghiệm.

Bạn sẽ gặp các khái niệm dưới đây tại một điểm nào đó trong quá trình học, đại diện cho các thực hành tốt nhất mà trang web của bạn lý tưởng nhất nên tuân theo. Đừng lo lắng quá nhiều về những điều này ngay bây giờ. Trong suốt phần lớn khóa học, chúng ta cố gắng dạy những điều này một cách ngầm định, nghĩa là khi chúng ta dạy bạn HTML, CSS và JavaScript, các ví dụ của chúng ta sẽ tuân theo các thực hành tốt nhất nơi có thể. Sau này trong hành trình học của bạn, bạn có thể sẽ khám phá các bài giảng rõ ràng hơn trong những lĩnh vực này.

- **Cải tiến dần dần** (Progressive enhancement)
  - : Tạo ra một trải nghiệm tối thiểu cung cấp chức năng thiết yếu cho tất cả người dùng, và xếp chồng một trải nghiệm tốt hơn và các cải tiến khác trong các trình duyệt có thể hỗ trợ chúng. Cải tiến dần dần thường được coi là không quan trọng, vì các trình duyệt có xu hướng hỗ trợ các tính năng mới nhất quán hơn ngày nay, và mọi người có xu hướng có kết nối internet nhanh hơn với giới hạn sử dụng dữ liệu cao hơn. Tuy nhiên, hãy xem xét các ví dụ như cắt giảm trang trí để làm cho trải nghiệm di động mượt mà hơn và tiết kiệm dữ liệu hoặc cung cấp trải nghiệm nhẹ, băng thông thấp cho người dùng thanh toán theo megabyte hoặc có kết nối đo lường.
- **Tương thích đa trình duyệt** (Cross-browser compatibility)
  - : Cố gắng đảm bảo trang web của bạn hoạt động trên càng nhiều thiết bị càng tốt. Điều này bao gồm sử dụng các công nghệ mà tất cả các trình duyệt hỗ trợ, cung cấp trải nghiệm tốt hơn cho các trình duyệt có thể xử lý chúng (cải tiến dần dần), và/hoặc viết mã để nó trở về một trải nghiệm đơn giản hơn nhưng vẫn có thể sử dụng được trong các trình duyệt cũ hơn (được gọi là **giảm dần nhẹ nhàng** — graceful degradation). Nó cũng yêu cầu kiểm tra để xem liệu có điều gì không hoạt động trong một số trình duyệt nhất định không, và sau đó làm thêm để sửa những lỗi đó.
- **Tách các lớp** (Separating the layers)
  - : Đặt nội dung (HTML), kiểu dáng (CSS) và hành vi (JavaScript) của bạn trong các tệp mã khác nhau, thay vì gộp tất cả chúng vào cùng một chỗ. Đây là ý kiến hay vì nhiều lý do, bao gồm quản lý và hiểu mã cùng với làm việc nhóm/phân tách vai trò. Trong thực tế, sự tách biệt không phải lúc nào cũng rõ ràng. Đây là một lý tưởng cần hướng tới nơi có thể, thay vì một điều tuyệt đối.
- **Thiết kế web thích ứng** (Responsive web design)
  - : Làm cho chức năng và bố cục của bạn linh hoạt để chúng có thể tự động thích ứng với các trình duyệt khác nhau. Một ví dụ rõ ràng là một trang web được bố cục theo một cách trong trình duyệt màn hình rộng trên máy tính, nhưng hiển thị dưới dạng bố cục cột đơn gọn hơn trên trình duyệt điện thoại di động. Hãy thử điều chỉnh chiều rộng cửa sổ trình duyệt ngay bây giờ và xem điều gì xảy ra với bố cục trang.
- **Hiệu năng** (Performance)
  - : Tải trang web nhanh nhất có thể, nhưng cũng làm cho chúng trực quan và dễ sử dụng để người dùng không nản lòng và đi chỗ khác.
- **Quốc tế hóa** (Internationalization)
  - : Làm cho trang web có thể sử dụng được bởi người từ các nền văn hóa khác nhau, nói các ngôn ngữ khác nhau so với bạn. Có những cân nhắc kỹ thuật ở đây (chẳng hạn như thay đổi bố cục của bạn để nó vẫn hoạt động tốt cho các ngôn ngữ từ phải sang trái hoặc từ trên xuống dưới), và những cân nhắc về con người (chẳng hạn như sử dụng ngôn ngữ đơn giản, không có tiếng lóng để các nền văn hóa khác nhau có nhiều khả năng hiểu văn bản của bạn hơn).
- **Quyền riêng tư** & **Bảo mật** (Privacy & Security)
  - : Hai khái niệm này có liên quan nhưng khác nhau. Quyền riêng tư đề cập đến việc cho phép mọi người thực hiện công việc của họ một cách riêng tư và không theo dõi họ hoặc thu thập nhiều dữ liệu hơn mức bạn thực sự cần. Bảo mật đề cập đến việc xây dựng trang web của bạn theo cách an toàn để người dùng độc hại không thể đánh cắp thông tin có trên đó từ bạn hoặc người dùng của bạn.

{{PreviousMenuNext("Learn_web_development/Getting_started/Web_standards/How_the_web_works", "Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites", "Learn_web_development/Getting_started/Web_standards")}}
