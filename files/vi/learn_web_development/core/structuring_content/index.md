---
title: Cấu trúc nội dung với HTML
short-title: HTML
slug: Learn_web_development/Core/Structuring_content
page-type: landing-page
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Structuring_content/Basic_HTML_syntax", "Learn_web_development/Core")}}

HTML là công nghệ định nghĩa nội dung và cấu trúc của bất kỳ trang web nào. Khi được viết đúng cách, nó cũng nên định nghĩa ngữ nghĩa (ý nghĩa) của nội dung theo cách có thể đọc được bằng máy, điều này rất quan trọng đối với khả năng tiếp cận, tối ưu hóa công cụ tìm kiếm, và tận dụng các tính năng tích hợp sẵn mà trình duyệt cung cấp để nội dung hoạt động tối ưu. Mô-đun này bao gồm những kiến thức cơ bản về ngôn ngữ, trước khi xem xét các lĩnh vực quan trọng như cấu trúc tài liệu, liên kết, danh sách, hình ảnh, biểu mẫu và nhiều hơn nữa.

## Điều kiện tiên quyết

Trước khi bắt đầu mô-đun này, bạn không cần có kiến thức HTML nào trước đó, nhưng bạn nên có ít nhất sự quen thuộc cơ bản với việc sử dụng máy tính và sử dụng web một cách thụ động (tức là chỉ xem và tiêu thụ nội dung). Bạn nên có môi trường làm việc cơ bản được thiết lập (như được trình bày chi tiết trong [Cài đặt phần mềm cơ bản](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software)), và hiểu cách tạo và quản lý tệp (như được trình bày chi tiết trong [Làm việc với tệp](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files)). Cả hai đều là phần trong mô-đun hoàn chỉnh dành cho người mới bắt đầu [Bắt đầu với web](/en-US/docs/Learn_web_development/Getting_started/Your_first_website) của chúng tôi.

> [!NOTE]
> Nếu bạn đang làm việc trên máy tính, máy tính bảng hoặc thiết bị khác mà bạn không thể tạo tệp, bạn có thể thử chạy mã trong trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

## Hướng dẫn và thử thách

- [Cú pháp HTML cơ bản](/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax)
  - : Bao gồm những kiến thức tuyệt đối cơ bản của {{glossary("HTML")}}, để giúp bạn bắt đầu — chúng tôi định nghĩa các phần tử, thuộc tính và các thuật ngữ quan trọng khác, đồng thời chỉ ra vị trí của chúng trong ngôn ngữ. Chúng tôi cũng chỉ ra cách một trang HTML điển hình được cấu trúc và cách một phần tử HTML được cấu trúc, đồng thời giải thích các tính năng cơ bản quan trọng khác của ngôn ngữ. Trong quá trình đó, chúng tôi sẽ thực hành một số HTML để kích thích sự hứng thú của bạn!
- [Có gì trong phần head? Siêu dữ liệu trang web](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata)
  - : Phần {{Glossary("Head","head")}} của một tài liệu HTML là phần **không** được hiển thị trong trình duyệt web khi trang được tải. Nó chứa thông tin siêu dữ liệu như {{htmlelement("title")}} của trang, liên kết đến {{glossary("CSS")}} (nếu bạn muốn tạo kiểu cho nội dung HTML với CSS), liên kết đến favicon tùy chỉnh và siêu dữ liệu (dữ liệu về HTML, chẳng hạn như ai đã viết nó, và các từ khóa quan trọng mô tả tài liệu).
- [Tiêu đề và đoạn văn](/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs)
  - : Một trong những nhiệm vụ chính của HTML là cung cấp cấu trúc văn bản để trình duyệt có thể hiển thị tài liệu HTML theo cách mà nhà phát triển mong muốn. Bài viết này giải thích cách HTML có thể được sử dụng để cung cấp cấu trúc trang cơ bản bằng cách định nghĩa các tiêu đề và đoạn văn.
- [Nhấn mạnh và tầm quan trọng](/en-US/docs/Learn_web_development/Core/Structuring_content/Emphasis_and_importance)
  - : Bài viết trước đã xem xét lý do tại sao ngữ nghĩa quan trọng trong HTML, và tập trung vào các tiêu đề và đoạn văn. Bài viết này tiếp tục chủ đề về ngữ nghĩa, xem xét các phần tử HTML áp dụng sự nhấn mạnh và tầm quan trọng cho văn bản (tương đương với chữ nghiêng và chữ đậm trong phương tiện in).
- [Danh sách](/en-US/docs/Learn_web_development/Core/Structuring_content/Lists)
  - : Danh sách xuất hiện khắp nơi trong cuộc sống — từ danh sách mua sắm đến danh sách chỉ đường mà bạn theo dõi một cách vô thức để đến nhà mỗi ngày, đến danh sách hướng dẫn mà bạn đang theo dõi trong các hướng dẫn này! Có thể không có gì đáng ngạc nhiên khi HTML có một bộ phần tử tiện lợi cho phép chúng ta định nghĩa các loại danh sách khác nhau. Trên web, chúng ta có ba loại danh sách: không có thứ tự, có thứ tự và danh sách mô tả. Bài học này cho bạn thấy cách sử dụng các loại khác nhau.
- [Tính năng văn bản nâng cao](/en-US/docs/Learn_web_development/Core/Structuring_content/Advanced_text_features)
  - : Có nhiều phần tử khác trong HTML để định nghĩa ngữ nghĩa văn bản, mà chúng tôi chưa đề cập trong bài viết [Nhấn mạnh và tầm quan trọng](/en-US/docs/Learn_web_development/Core/Structuring_content/Emphasis_and_importance). Các phần tử được mô tả trong bài viết này ít được biết đến hơn, nhưng vẫn hữu ích để biết (và đây vẫn không phải là danh sách đầy đủ dưới bất kỳ hình thức nào). Tại đây bạn sẽ tìm hiểu về cách đánh dấu trích dẫn, mã máy tính và văn bản liên quan khác, chỉ số dưới và chỉ số trên, thông tin liên hệ và nhiều hơn nữa.

- [Đánh dấu một bức thư](/en-US/docs/Learn_web_development/Core/Structuring_content/Marking_up_a_letter) <sup>Thử thách</sup>
  - : Tất cả chúng ta đều học viết thư sớm hay muộn; đây cũng là một ví dụ hữu ích để kiểm tra các kỹ năng định dạng văn bản của chúng ta. Trong thử thách này, bạn sẽ có một bức thư để đánh dấu như một bài kiểm tra các kỹ năng định dạng văn bản HTML, cũng như siêu liên kết và cách sử dụng đúng phần tử `<head>` của HTML.

- [Cấu trúc tài liệu](/en-US/docs/Learn_web_development/Core/Structuring_content/Structuring_documents)
  - : Ngoài việc định nghĩa các phần riêng lẻ của trang (chẳng hạn như "một đoạn văn" hoặc "một hình ảnh"), HTML còn có một số phần tử cấp khối được sử dụng để định nghĩa các khu vực của trang web (chẳng hạn như "phần header", "menu điều hướng", "cột nội dung chính"). Bài viết này xem xét cách lên kế hoạch cấu trúc trang web cơ bản và viết HTML để biểu diễn cấu trúc này.

- [Tạo liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links)
  - : Liên kết (còn được gọi là siêu liên kết) thực sự quan trọng — chúng là điều tạo nên Web _là một web_. Bài viết này cho thấy cú pháp cần thiết để tạo liên kết và thảo luận về các thực hành tốt nhất về liên kết.

- [Cấu trúc một trang nội dung](/en-US/docs/Learn_web_development/Core/Structuring_content/Structuring_a_page_of_content) <sup>Thử thách</sup>
  - : Cấu trúc một trang nội dung sẵn sàng để bố cục sử dụng CSS là một kỹ năng rất quan trọng cần thành thạo, vì vậy trong thử thách này bạn sẽ được kiểm tra khả năng suy nghĩ về cách một trang có thể trông như thế nào, và chọn ngữ nghĩa cấu trúc phù hợp để xây dựng bố cục trên đó.
- [Hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images)
  - : Thuở ban đầu, web chỉ là văn bản, và thực sự khá nhàm chán. May mắn thay, không lâu sau đó khả năng nhúng hình ảnh (và các loại nội dung thú vị hơn khác) vào trong các trang web đã được thêm vào. Trong bài viết này, chúng tôi sẽ xem xét cách sử dụng phần tử {{htmlelement("img")}} một cách chuyên sâu, bao gồm những kiến thức cơ bản, chú thích hình ảnh bằng phụ đề sử dụng {{htmlelement("figure")}}, và trình bày chi tiết về mối quan hệ của nó với {{glossary("CSS")}} background images.
- [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
  - : Bây giờ khi chúng ta đã thoải mái với việc thêm hình ảnh đơn giản vào trang web, bước tiếp theo là bắt đầu thêm trình phát video và âm thanh vào các tài liệu HTML của bạn! Trong bài viết này, chúng tôi sẽ xem xét cách làm điều đó với các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}}; sau đó chúng tôi sẽ kết thúc bằng cách xem xét cách thêm chú thích/phụ đề vào video của bạn.
- [Trang splash về sinh vật bò trườn](/en-US/docs/Learn_web_development/Core/Structuring_content/Splash_page) <sup>Thử thách</sup>
  - : Trong thử thách này, chúng tôi sẽ kiểm tra kiến thức của bạn về một số kỹ thuật được thảo luận trong những bài học vừa qua, yêu cầu bạn thêm một số hình ảnh và video vào trang splash về côn trùng và các sinh vật bò trườn khác.
- [Kiến thức cơ bản về bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_table_basics)
  - : Bài viết này giúp bạn bắt đầu với bảng HTML, bao gồm những kiến thức rất cơ bản như hàng, ô, tiêu đề, làm cho các ô kéo dài nhiều cột và hàng, và cách nhóm tất cả các ô trong một cột cho mục đích tạo kiểu.
- [Khả năng tiếp cận bảng HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Table_accessibility)
  - : Trong bài viết này, chúng tôi xem xét thêm các tính năng khả năng tiếp cận bảng HTML như chú thích/tóm tắt, nhóm các hàng thành phần đầu, phần thân và phần chân bảng, và xác định phạm vi cột và hàng.
- [Cấu trúc bảng dữ liệu hành tinh](/en-US/docs/Learn_web_development/Core/Structuring_content/Planet_data_table) <sup>Thử thách</sup>
  - : Trong thử thách này, chúng tôi cung cấp cho bạn một số dữ liệu về các hành tinh trong hệ mặt trời của chúng ta. Công việc của bạn là cấu trúc nó thành một bảng HTML có khả năng tiếp cận.
- [Biểu mẫu và nút trong HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_forms)
  - : Biểu mẫu và nút HTML là những công cụ mạnh mẽ để tương tác với người dùng — thường được sử dụng nhất để thu thập dữ liệu từ người dùng hoặc cho phép họ kiểm soát giao diện người dùng. Trong bài viết này, chúng tôi giới thiệu những kiến thức cơ bản về biểu mẫu và nút.
- [Gỡ lỗi HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Debugging_HTML)
  - : Viết HTML thì ổn, nhưng nếu có gì đó không đúng và bạn không thể tìm ra lỗi trong mã ở đâu? Bài viết này sẽ giới thiệu cho bạn một số công cụ có thể giúp bạn tìm và sửa lỗi trong HTML.

## Kiểm tra kiến thức của bạn

Bạn sẽ tìm thấy các bài viết "Kiểm tra kiến thức" được đặt giữa các bài viết hướng dẫn để kiểm tra xem bạn có giữ lại thông tin quan trọng nhất trước khi tiếp tục không. Nếu bạn muốn khám phá tất cả những điều này cùng nhau, bạn có thể tìm thấy chúng được liệt kê tại [Kiểm tra kiến thức: HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Test_your_skills).

## Hướng dẫn bổ sung

Những hướng dẫn này không phải là một phần của lộ trình học tập, nhưng chúng vẫn thú vị — bạn nên coi đây là mục tiêu mở rộng, để nghiên cứu tùy chọn khi bạn hoàn thành các bài viết Core chính.

- [Đưa đồ họa vector vào HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Including_vector_graphics_in_HTML)
  - : Đồ họa vector rất hữu ích trong nhiều trường hợp — chúng có kích thước tệp nhỏ và có khả năng mở rộng cao, do đó chúng không bị vỡ khi được phóng to hoặc kéo lớn. Trong bài viết này, chúng tôi sẽ cho bạn thấy cách đưa một cái vào trang web của bạn.
- [Từ object đến iframe — các công nghệ nhúng chung](/en-US/docs/Learn_web_development/Core/Structuring_content/General_embedding_technologies)
  - : Các nhà phát triển thường nghĩ đến việc nhúng phương tiện như hình ảnh, video và âm thanh vào các trang web. Trong bài viết này, chúng tôi thực hiện một bước đi ngang, xem xét một số phần tử cho phép bạn nhúng nhiều loại nội dung khác nhau vào trang web của bạn: các phần tử {{htmlelement("iframe")}}, {{htmlelement("embed")}} và {{htmlelement("object")}}. `<iframe>` dùng để nhúng các trang web khác, và hai cái còn lại cho phép bạn nhúng các tài nguyên bên ngoài như tệp PDF.

## Xem thêm

- [Học HTML và CSS](https://scrimba.com/learn-html-and-css-c0p?via=mdn), Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Học HTML và CSS_ của [Scrimba](https://scrimba.com?via=mdn) dạy bạn HTML và CSS thông qua việc xây dựng và triển khai năm dự án tuyệt vời, với các bài học và thử thách tương tác thú vị được dạy bởi các giáo viên có kiến thức.
- [Học HTML](https://www.codecademy.com/learn/learn-html), Codecademy
  - : Một nguồn tài nguyên hữu ích khác để học những kiến thức cơ bản về HTML.
- [Những kiến thức cơ bản về HTML ngữ nghĩa](https://scrimba.com/the-frontend-developer-career-path-c0j/~0xid?via=mdn), Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Bài học tương tác này cung cấp một mô tả hữu ích về HTML, với sự nhấn mạnh đặc biệt về lý do tại sao khía cạnh _ngữ nghĩa_ của nó lại quan trọng.

{{NextMenu("Learn_web_development/Core/Structuring_content/Basic_HTML_syntax", "Learn_web_development/Core")}}
