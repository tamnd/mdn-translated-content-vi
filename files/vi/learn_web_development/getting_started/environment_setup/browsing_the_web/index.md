---
title: Duyệt web
slug: Learn_web_development/Getting_started/Environment_setup/Browsing_the_web
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Installing_software", "Learn_web_development/Getting_started/Environment_setup/Code_editors", "Learn_web_development/Getting_started/Environment_setup")}}

Đến thời điểm này trong mô-đun, bạn đã có một số trình duyệt web (web browser) hiện đại được cài đặt trên máy tính hoặc các thiết bị sẵn có khác. Bài này đi sâu hơn vào việc sử dụng trình duyệt, xem xét cách hoạt động của trình duyệt web, sự khác biệt giữa các mục thông thường bạn sẽ tương tác, và cách tìm kiếm thông tin.

> [!NOTE]
> Nếu bạn chưa cài đặt trình duyệt nào ngoài những trình duyệt mặc định có sẵn trên thiết bị, hãy cài thêm một vài trình duyệt khác. Xem [Trình duyệt web hiện đại](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software#modern_web_browsers) để biết thêm thông tin.

Cũng như bất kỳ lĩnh vực kiến thức nào, web đi kèm với rất nhiều thuật ngữ và ngôn ngữ kỹ thuật. Đừng lo: Chúng tôi sẽ không làm bạn choáng ngợp với tất cả những điều đó ngay từ đầu (bạn có thể xem [bảng thuật ngữ](/en-US/docs/Glossary) nếu tò mò). Tuy nhiên, có một số thuật ngữ cơ bản bạn cần hiểu ngay từ đầu vì bạn sẽ nghe thấy những biểu thức này thường xuyên. Chúng tôi sẽ giới thiệu một số thuật ngữ quan trọng bên dưới.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Làm quen cơ bản với hệ điều hành máy tính của bạn.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Sự khác biệt giữa trình duyệt web, trang web và công cụ tìm kiếm.</li>
          <li>Cách hoạt động cơ bản của trình duyệt web.</li>
          <li>Tìm kiếm thông tin.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Sự khác biệt giữa trang web, website, máy chủ web và công cụ tìm kiếm

Chúng ta sẽ bắt đầu bằng cách mô tả các khái niệm liên quan đến web: trang web, website, máy chủ web (web server) và công cụ tìm kiếm (search engine). Những thuật ngữ này thường bị nhầm lẫn bởi những người mới tiếp cận web, hoặc được sử dụng không chính xác. Hãy đảm bảo bạn hiểu rõ ý nghĩa của từng thuật ngữ! Hãy bắt đầu với một số định nghĩa:

- **Trang web (Web page)**
  - : Một tài liệu có thể được hiển thị trong {{Glossary("browser", "trình duyệt")}} web. Những tài liệu này thường được gọi đơn giản là "trang". Các tài liệu như vậy được viết bằng ngôn ngữ {{Glossary("HTML")}} (mà chúng ta sẽ tìm hiểu chi tiết hơn ở phần sau).
- **Website**
  - : Tập hợp các trang web được nhóm lại thành một tài nguyên duy nhất, với các liên kết kết nối chúng lại với nhau. Thường được gọi tắt là "site".
- **Máy chủ web (Web server)**
  - : Một máy tính lưu trữ (host) một website trên Internet.
- **Dịch vụ web (Web service)**
  - : Phần mềm phản hồi các yêu cầu qua Internet để thực hiện một chức năng hoặc cung cấp dữ liệu. Một dịch vụ web thường được hỗ trợ bởi máy chủ web và có thể cung cấp các trang web để người dùng tương tác. Nhiều website cũng là dịch vụ web, mặc dù một số website (như MDN) chỉ bao gồm nội dung tĩnh. Ví dụ về dịch vụ web là những dịch vụ thay đổi kích thước hình ảnh, cung cấp dự báo thời tiết, hoặc xử lý đăng nhập người dùng.
- **Công cụ tìm kiếm (Search engine)**
  - : Một dịch vụ web giúp bạn tìm kiếm các trang web khác, chẳng hạn như Google, Bing, Yahoo, hoặc DuckDuckGo. Công cụ tìm kiếm thường được truy cập qua trình duyệt web (ví dụ: bạn có thể tìm kiếm trực tiếp trong thanh địa chỉ (address bar) của Firefox, Chrome, v.v.) hoặc qua một trang web (ví dụ: [bing.com](https://www.bing.com/) hoặc [duckduckgo.com](https://duckduckgo.com/)).

Hãy xem một ví dụ tương tự — một thư viện công cộng. Đây là những gì bạn thường làm khi đến thư viện:

1. Tìm mục lục tìm kiếm và tra tên cuốn sách bạn muốn.
2. Ghi chú số danh mục của cuốn sách.
3. Đến khu vực cụ thể chứa cuốn sách, tìm đúng số danh mục và lấy cuốn sách.

Hãy so sánh thư viện công cộng với web:

- Thư viện giống như máy chủ web. Nó có nhiều khu vực, tương tự như một máy chủ web lưu trữ nhiều website.
- Các khu vực khác nhau (khoa học, toán học, lịch sử, v.v.) trong thư viện giống như các website. Mỗi khu vực giống như một website duy nhất (hai khu vực không chứa cùng một cuốn sách).
- Các cuốn sách trong mỗi khu vực giống như các trang web. Một website có thể có nhiều trang web, ví dụ: khu khoa học (website) sẽ có sách về nhiệt học, âm học, nhiệt động lực học, sinh học người, v.v.
- Mục lục tìm kiếm giống như công cụ tìm kiếm. Mỗi cuốn sách có vị trí duy nhất trong thư viện (hai cuốn sách không thể ở cùng một chỗ) được xác định bởi số danh mục.

Bây giờ hãy dành thêm thời gian để xem xét từng thuật ngữ một cách chi tiết hơn.

### Trang web

Một **trang web** là một tài liệu đơn giản có thể hiển thị trong trình duyệt. Trang web có thể nhúng nhiều loại tài nguyên khác nhau như:

- _Thông tin về kiểu dáng_ — kiểm soát giao diện và cảm nhận của trang.
- _Script_ — thêm tính tương tác cho trang.
- _Phương tiện_ — hình ảnh, âm thanh và video.

> [!NOTE]
> Trình duyệt cũng có thể hiển thị các tài liệu khác như tệp {{Glossary("PDF")}} và các tài nguyên như hình ảnh hoặc video, nhưng thuật ngữ **trang web** đặc biệt chỉ các tài liệu HTML.

Mỗi trang web đều có thể tìm thấy tại một địa chỉ duy nhất (địa chỉ web, còn được gọi là [URL](/en-US/docs/Glossary/URL)). Để truy cập một trang, chỉ cần gõ địa chỉ của nó vào thanh địa chỉ trình duyệt:

![Ví dụ về địa chỉ trang web trong thanh địa chỉ trình duyệt](web-page.jpg)

Hãy thử tải một trong những website yêu thích của bạn trong trình duyệt ngay bây giờ, lưu ý đến những gì chúng ta đã nói ở trên. Bạn tự gõ địa chỉ web hay tìm thấy nó qua công cụ tìm kiếm?

### Website

Một _website_ là tập hợp các trang web có liên kết với nhau (cùng các tài nguyên liên quan) chia sẻ một [tên miền](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_domain_name) duy nhất. Mỗi trang web của một website nhất định cung cấp các liên kết rõ ràng — thường ở dạng các đoạn văn bản có thể nhấp — cho phép người dùng di chuyển từ trang này sang trang khác trong website.

Khi bạn tải website yêu thích trong trình duyệt, trình duyệt thường hiển thị trước tiên trang web chính của website, hay còn gọi là _trang chủ_ (homepage), thường được gọi tắt là "home":

![Ví dụ về tên miền của website trong thanh địa chỉ trình duyệt](web-site.jpg)

Hãy thử nhấp vào một số mục menu hoặc liên kết để xem một vài trang khác nhau trên website yêu thích của bạn. Lưu ý cách địa chỉ web hiển thị thay đổi khi bạn di chuyển giữa các trang.

> [!NOTE]
> Cũng có thể có [_ứng dụng trang đơn_](/en-US/docs/Glossary/SPA): một website bao gồm một trang web duy nhất được cập nhật động với nội dung mới khi cần. Trong trường hợp này, địa chỉ web có thể không thay đổi khi xem các trang khác nhau.

### Máy chủ web

Một _máy chủ web_ là một máy tính lưu trữ một hoặc nhiều _website_. "Lưu trữ" (hosting) có nghĩa là tất cả các _trang web_ và các tệp liên quan đều có sẵn trên máy tính đó. _Máy chủ web_ sẽ gửi các tệp trang web mà nó lưu trữ đến trình duyệt của người dùng khi họ cố gắng tải những trang đó.

Đừng nhầm lẫn _website_ và _máy chủ web_. Ví dụ: nếu bạn nghe ai đó nói "Website của tôi không phản hồi", có thể có nghĩa là _máy chủ web_ không phản hồi và do đó _website_ không khả dụng.

Quan trọng hơn, vì một máy chủ web có thể lưu trữ nhiều website, thuật ngữ _máy chủ web_ không còn được dùng để chỉ một website, vì điều đó có thể gây nhầm lẫn. Nếu ai đó nói "Máy chủ web của tôi không phản hồi", có thể có nghĩa là nhiều website hoặc ứng dụng được lưu trữ trên máy chủ web đó đều không khả dụng.

### Công cụ tìm kiếm

Nhiều người thường nhầm lẫn công cụ tìm kiếm với website. Công cụ tìm kiếm là một loại dịch vụ web đặc biệt giúp người dùng tìm kiếm các trang web họ quan tâm, cũng như các loại nội dung cụ thể như hình ảnh, video, hoặc bài báo tin tức.

Các công cụ tìm kiếm thường có website riêng có thể dùng để truy cập dịch vụ web nền tảng. Có rất nhiều công cụ tìm kiếm: [Google](https://www.google.com/), [Bing](https://www.bing.com/), [Yandex](https://yandex.com/), [DuckDuckGo](https://duckduckgo.com/), và nhiều công cụ khác. Một số là công cụ tổng hợp, một số chuyên về các chủ đề nhất định.

Nhiều người mới dùng web hay nhầm lẫn công cụ tìm kiếm với trình duyệt. Hãy làm rõ điều này:

- _Trình duyệt_ là một phần mềm truy xuất và hiển thị các trang web.
- _Công cụ tìm kiếm_ là một dịch vụ web (và thường là một website) giúp người tìm kiếm các trang web có trên các website khác.

Sự nhầm lẫn phát sinh vì lần đầu tiên ai đó khởi động trình duyệt, trình duyệt thường hiển thị trang chủ của một website công cụ tìm kiếm hoặc một hộp tìm kiếm cho phép tìm kiếm bằng công cụ đó. Hầu hết các trình duyệt cũng cho phép người dùng sử dụng công cụ tìm kiếm bằng cách gõ các từ khóa tìm kiếm trực tiếp vào thanh địa chỉ.

Điều này hoàn toàn có lý vì việc đầu tiên mọi người thường muốn làm với trình duyệt là tìm một trang web để hiển thị. Đừng nhầm lẫn phần mềm (trình duyệt) với dịch vụ (công cụ tìm kiếm).

Dưới đây là ví dụ về Firefox hiển thị hộp tìm kiếm Google làm trang khởi động mặc định:

![Ví dụ về Firefox Nightly hiển thị trang Google tùy chỉnh làm trang mặc định](search-engine.jpg)

Hãy thử sử dụng công cụ tìm kiếm để tìm thông tin về chủ đề bạn quan tâm bằng cách:

1. Truy cập trang chủ của công cụ tìm kiếm và nhập từ khóa tìm kiếm.
2. Nhập từ khóa tìm kiếm vào thanh địa chỉ trình duyệt.

## Web hoạt động như thế nào: kiến thức cơ bản

Ở nhiều nơi trên thế giới, web đã trở thành một công cụ thiết yếu trong cuộc sống hàng ngày của chúng ta, giống như dao nĩa, xe đạp và ô tô, hay bàn chải đánh răng. Nếu điều đó có vẻ không thực tế với bạn, hãy nghĩ xem bạn sử dụng website hoặc ứng dụng điện thoại bao nhiêu lần mỗi ngày! Dù bạn không gõ địa chỉ web vào trình duyệt để truy cập nội dung hay dịch vụ, thì ứng dụng bạn đang dùng cũng có thể đang sử dụng công nghệ web ở phía sau để lấy dữ liệu hiển thị cho bạn.

Khi bạn truy cập web, nhiều thứ xảy ra giữa tương tác đầu tiên của bạn (ví dụ: gõ địa chỉ web (URL) vào trình duyệt và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>) và kết quả hành động được hiển thị cho bạn (ví dụ: website xuất hiện trong trình duyệt):

1. Trình duyệt web yêu cầu tài nguyên (ví dụ: trang web, dữ liệu, hoặc hình ảnh hay video) mà bạn muốn truy cập từ máy chủ web nơi nó được lưu trữ. Các yêu cầu (và phản hồi kết quả) được thực hiện bằng một công nghệ gọi là [HTTP](/en-US/docs/Glossary/HTTP) (Giao thức Truyền tải Siêu văn bản), sử dụng ngôn ngữ của các động từ (như **GET**) để mô tả những gì cần xảy ra.
2. Nếu yêu cầu thành công, máy chủ web gửi phản hồi HTTP trở lại trình duyệt chứa tài nguyên được yêu cầu.
3. Trong một số trường hợp, tài nguyên được yêu cầu sẽ kích hoạt thêm các yêu cầu HTTP khác, dẫn đến thêm các phản hồi. Ví dụ:
   1. Khi một website được tải, ban đầu tệp HTML chính của trang chủ được yêu cầu.
   2. Khi tệp đó được trình duyệt nhận, trình duyệt bắt đầu phân tích cú pháp (parse) nó, và có thể tìm thấy các hướng dẫn để thực hiện thêm yêu cầu. Như đã thảo luận ở trên, những yêu cầu này có thể dành cho các tệp cần nhúng như hình ảnh, thông tin kiểu dáng, script, v.v.
4. Khi tất cả tài nguyên đã được yêu cầu, trình duyệt web phân tích và hiển thị chúng theo yêu cầu, trước khi trình bày kết quả cho người dùng.

Mô tả về cách hoạt động của web này được đơn giản hóa nhiều, nhưng đó là tất cả những gì bạn thực sự cần biết ở thời điểm này. Bạn sẽ tìm thấy mô tả chi tiết hơn về cách các trang web được yêu cầu và hiển thị bởi trình duyệt web trong mô-đun [Các tiêu chuẩn web](/en-US/docs/Learn_web_development/Getting_started/Web_standards) của chúng tôi, ở phần sau.

## Tìm kiếm thông tin

Là một lập trình viên web, bạn sẽ dành nhiều thời gian tìm kiếm thông tin, từ cú pháp bạn không nhớ đến giải pháp cho các vấn đề cụ thể. Vì vậy, học cách tìm kiếm trên web một cách hiệu quả là điều rất quan trọng.

Nếu bạn biết một website chuyên về chủ đề bạn đang học, thường thì đó là nơi tốt nhất để bắt đầu.

Ví dụ: nếu bạn đang tìm kiếm thông tin tổng quát về một tính năng công nghệ web cụ thể, hãy gõ tên tính năng đó vào hộp tìm kiếm MDN. Ví dụ, hãy thử gõ `box model`, `fetch()`, hoặc `video element` vào hộp tìm kiếm và xem những gì hiện ra. Nếu bạn không tìm thấy thông tin cần thiết, hãy mở rộng tìm kiếm — thử từ khóa trong công cụ tìm kiếm.

Nếu bạn đang tìm kiếm giải pháp cho một vấn đề cụ thể, chẳng hạn như `cách in chuỗi Fibonacci bằng JavaScript` hoặc `cách kiểm tra xem một số có phải là số nguyên tố bằng JavaScript`, thì nên tìm kiếm trên website như [Stack Overflow](https://stackoverflow.com/), là cộng đồng dành riêng cho việc trả lời các câu hỏi lập trình. Một lần nữa, hãy thử sử dụng công cụ tìm kiếm tổng hợp nếu một trang cụ thể không cung cấp câu trả lời hữu ích.

Trước khi tiếp tục, hãy thử tìm kiếm một vài chủ đề bạn muốn tìm hiểu. Thử tìm kiếm cụ thể hơn và ít cụ thể hơn, với các thuật ngữ liên quan khác nhau để xem cái nào hiệu quả nhất. Xem [Mẹo tìm kiếm](#search_tips) của chúng tôi để biết thêm.

### Sử dụng AI

Kết quả tìm kiếm được tạo bởi AI (trí tuệ nhân tạo) là một cách rất phổ biến để nhận thông tin. Về cơ bản chúng cung cấp một công cụ tìm kiếm siêu mạnh: chúng thực hiện nhiều tìm kiếm ở phía sau, trước khi tổng hợp kết quả thành một câu trả lời dễ tiếp thu. Các lựa chọn phổ biến là [ChatGPT](https://chatgpt.com/), [Google Gemini](https://gemini.google.com/app), và [Microsoft Copilot](https://copilot.microsoft.com/), được truy cập trực tiếp ở định dạng trò chuyện, hoặc thông qua hệ thống trợ giúp hoặc tự động hóa được hỗ trợ bởi AI trong ứng dụng.

Khi học lập trình, các câu hỏi nhắc AI có thể hữu ích theo nhiều cách:

- Thực hiện các tìm kiếm thông thường, như các ví dụ ở trên.
- Tìm lỗi trong một đoạn mã. Nếu bạn thất vọng vì mã của mình không hoạt động, bạn có thể dán mã vào câu hỏi nhắc AI, đi kèm với câu hỏi như `Lỗi trong đoạn mã này ở đâu?`
- Tạo phiên bản tối ưu hóa của một đoạn mã cụ thể. Điều này hữu ích khi bạn đã viết một đoạn mã hoạt động, nhưng muốn tìm hiểu cách làm hiệu quả hơn, hoặc theo cách mạnh mẽ hơn xử lý nhiều trường hợp sử dụng hơn.
- Nhận lời khuyên về cách làm gì đó. Ví dụ: nếu bạn không chỉ muốn biết lỗi trong đoạn mã là gì, mà còn muốn có lời khuyên về chiến lược gỡ lỗi.

Hãy thử sử dụng một vài công cụ AI để tìm kiếm.

### Cảnh báo quan trọng

AI có thể làm được rất nhiều thứ đến mức bạn có thể bắt đầu tự hỏi tại sao mình cần học lập trình.

Nhưng hãy khoan! Điều sau đây rất quan trọng: **Bạn vẫn cần hiểu mình đang cố gắng làm gì ở cấp độ tổng quan, mã đang làm gì, và mỗi đoạn mã cần được sử dụng ở đâu**. Nếu không, bạn sẽ không có ích nhiều khi cố giải quyết các vấn đề thực tế. Điều này có nghĩa là bạn vẫn cần học lập trình. AI có thể là công cụ thực sự hữu ích giúp bạn tìm câu trả lời nhanh hơn, nhưng nếu bạn chỉ gõ mọi câu hỏi vào AI, bạn sẽ không hiểu bất cứ điều gì hoạt động như thế nào.

Ngoài ra:

- Các công cụ AI trình bày câu trả lời của họ với giọng điệu tự tin, có thẩm quyền, nhưng chúng thường có thể gây hiểu nhầm hoặc đơn giản là sai. Một số lỗi chúng mắc có thể rất tinh tế. Chúng không có trí tuệ thực sự của riêng mình — về cơ bản chúng là các công cụ so khớp mẫu nâng cao. Các công cụ AI tổng hợp câu trả lời từ các nguồn khác, vì vậy sẽ hút cả thông tin sai lẫn thông tin đúng. Thậm chí hai nguồn đúng khi kết hợp cũng có thể tạo ra câu trả lời không chính xác.
- Thông tin mới hơn có thể không có sẵn, hoặc câu trả lời có thể bị lệch về tài liệu cũ hơn và phổ biến hơn, vì vậy "cách làm X trong JS" có thể cho bạn hướng dẫn lỗi thời.

Do đó, bạn cần cẩn thận kiểm tra các câu trả lời mà chúng cung cấp và không chỉ tin tưởng mọi thứ một cách vô điều kiện.

**Khi học, hãy dành thời gian tự cố gắng giải quyết vấn đề trước khi tìm kiếm câu trả lời, dù bạn sử dụng AI hay công cụ tìm kiếm thông thường. Điều đó sẽ làm bạn trở thành lập trình viên giỏi hơn.**

### Mẹo tìm kiếm {#search_tips}

- Bạn nên bao gồm ngôn ngữ bạn đang sử dụng trong từ khóa tìm kiếm, như trong các ví dụ ở trên. Nếu bạn chỉ gõ `cách in chuỗi Fibonacci`, bạn có thể sẽ nhận được nhiều giải pháp bằng Python, C++, Java, Ruby, hoặc các ngôn ngữ khác — không hữu ích lắm khi bạn đang cố học JavaScript!
- Khi bạn tìm thấy câu trả lời hữu ích, hãy đánh dấu trang hoặc sao chép nó ở đâu đó để bạn có thể tìm lại sau. Bạn sẽ ngạc nhiên khi thấy bao nhiêu lần bạn gặp lại cùng một vấn đề.
- Nếu mã của bạn trả về một thông báo lỗi cụ thể, hãy thử nhập thông báo lỗi vào công cụ tìm kiếm hoặc câu hỏi nhắc AI. Người khác có thể đã gặp lỗi tương tự và đã ghi lại giải pháp công khai ở đâu đó.
- Nếu có thể, hãy gắn bó với các trang web được khuyến nghị như MDN và [Stack Overflow](https://stackoverflow.com/).
- Có nhiều kỹ thuật tìm kiếm nâng cao mà bạn có thể sử dụng trong các công cụ tìm kiếm để có kết quả tốt hơn so với việc chỉ gõ một từ khóa tìm kiếm đơn giản. Gõ từ khóa đơn giản như `ant fish cheese` sẽ trả về kết quả chứa bất kỳ tổ hợp nào của những từ đó. Tuy nhiên, hầu hết các công cụ tìm kiếm hỗ trợ các biến thể của các mẫu cú pháp sau:
  - Gõ `"ant fish cheese"` (với dấu ngoặc kép) sẽ chỉ trả về kết quả chứa chính xác cụm từ đó.
  - `ant cheese -fish` sẽ trả về kết quả chứa `ant` và/hoặc `cheese` nhưng không có `fish`.
  - `ant OR cheese` sẽ chỉ trả về kết quả với một trong hai từ, không phải cả hai. Theo thử nghiệm của chúng tôi, cái này chỉ hoạt động hiệu quả trên Google.
  - `intitle:cheese` sẽ chỉ trả về kết quả có "cheese" trong tiêu đề chính của trang.

  > [!NOTE]
  > Có nhiều kỹ thuật khác mà bạn có thể sử dụng trong các công cụ tìm kiếm khác nhau. Hãy thử xem những kỹ thuật nào khác bạn có thể tìm thấy — một số tài nguyên hữu ích là [Tinh chỉnh tìm kiếm Google](https://support.google.com/websearch/answer/2466433?hl=en), [Cách sử dụng cú pháp nâng cao trên DuckDuckGo](https://duckduckgo.com/duckduckgo-help-pages/results/syntax), và [Microsoft: Tùy chọn tìm kiếm nâng cao](https://support.microsoft.com/en-us/topic/advanced-search-options-b92e25f1-0085-4271-bdf9-14aaea720930).

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Installing_software", "Learn_web_development/Getting_started/Environment_setup/Code_editors", "Learn_web_development/Getting_started/Environment_setup")}}
