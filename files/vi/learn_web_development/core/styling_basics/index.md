---
title: Kiến thức cơ bản về CSS
slug: Learn_web_development/Core/Styling_basics
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Styling_basics/What_is_CSS", "Learn_web_development/Core")}}

CSS (Cascading Style Sheets) được dùng để tạo kiểu và bố cục cho các trang web — ví dụ, để thay đổi phông chữ, màu sắc, kích thước và khoảng cách của nội dung, chia nội dung thành nhiều cột, hoặc thêm hiệu ứng động và các tính năng trang trí khác. Mô-đun này cung cấp tất cả những kiến thức CSS cơ bản mà bạn cần hiện tại, bao gồm cú pháp, tính năng và kỹ thuật.

## Điều kiện tiên quyết

Trước khi bắt đầu mô-đun này, bạn cần có môi trường làm việc cơ bản đã được thiết lập (như đã trình bày trong [Cài đặt phần mềm cơ bản](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software)), và hiểu cách tạo và quản lý tệp (như đã trình bày trong [Làm việc với tệp](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files)). Bạn cũng nên quen thuộc với HTML (hãy xem qua mô-đun [Cấu trúc nội dung với HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) nếu chưa).

> [!NOTE]
> Nếu bạn đang làm việc trên máy tính, máy tính bảng hoặc thiết bị khác mà không thể tạo tệp, bạn có thể thử chạy mã trong trình chỉnh sửa trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

## Hướng dẫn và thử thách

- [CSS là gì?](/en-US/docs/Learn_web_development/Core/Styling_basics/What_is_CSS)
  - : CSS cho phép bạn tạo các trang web trông tuyệt vời, nhưng nó hoạt động như thế nào bên trong? Bài viết này giải thích CSS là gì, cú pháp cơ bản trông như thế nào, và cách trình duyệt áp dụng CSS vào HTML để tạo kiểu cho nó.
- [Bắt đầu với CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Getting_started)
  - : Trong bài viết này, chúng ta sẽ lấy một tài liệu HTML đơn giản và áp dụng CSS vào đó, học một số chi tiết thực tế của ngôn ngữ trong quá trình thực hành. Chúng ta cũng sẽ xem lại các tính năng cú pháp CSS mà bạn chưa từng xem qua.
- [Tạo kiểu cho trang tiểu sử](/en-US/docs/Learn_web_development/Core/Styling_basics/Styling_a_bio_page) <sup>Thử thách</sup>
  - : Trong thử thách này, bạn sẽ tạo kiểu cho một trang tiểu sử đơn giản, kiểm tra một số kỹ năng bạn đã học trong các bài học vừa qua bao gồm viết bộ chọn, tô màu nền và tạo kiểu văn bản. Chúng tôi cũng sẽ mời bạn tra cứu một số tính năng CSS cơ bản mà chúng tôi chưa đề cập, để kiểm tra kỹ năng nghiên cứu của bạn.
- [Bộ chọn CSS cơ bản](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)
  - : Trong bài viết này, chúng ta sẽ ôn lại một số kiến thức cơ bản về bộ chọn, bao gồm bộ chọn theo loại, lớp và ID cơ bản.
- [Bộ chọn thuộc tính](/en-US/docs/Learn_web_development/Core/Styling_basics/Attribute_selectors)
  - : Như bạn biết từ nghiên cứu HTML, các phần tử có thể có các thuộc tính cung cấp thêm thông tin chi tiết về phần tử đang được đánh dấu. Trong CSS, bạn có thể sử dụng bộ chọn thuộc tính để nhắm mục tiêu các phần tử có các thuộc tính nhất định. Bài học này sẽ chỉ cho bạn cách sử dụng những bộ chọn rất hữu ích này.
- [Lớp giả và phần tử giả](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
  - : Tập hợp bộ chọn tiếp theo chúng ta sẽ xem xét được gọi là **lớp giả** và **phần tử giả**. Có rất nhiều loại, và chúng thường phục vụ các mục đích khá cụ thể. Khi bạn đã biết cách sử dụng chúng, bạn có thể xem qua các loại khác nhau để xem liệu có loại nào phù hợp với tác vụ bạn đang cố gắng thực hiện không.
- [Bộ kết hợp](/en-US/docs/Learn_web_development/Core/Styling_basics/Combinators)
  - : Các bộ chọn cuối cùng chúng ta sẽ xem xét được gọi là bộ kết hợp. Bộ kết hợp được dùng để kết hợp các bộ chọn khác theo cách cho phép chúng ta chọn các phần tử dựa trên vị trí của chúng trong DOM so với các phần tử khác (ví dụ, phần tử con hoặc phần tử anh chị em).
- [Mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model)
  - : Mọi thứ trong CSS đều có một hộp xung quanh, và việc hiểu các hộp này là chìa khóa để có thể tạo bố cục phức tạp hơn với CSS hoặc căn chỉnh các mục với các mục khác. Trong bài học này, chúng ta sẽ xem xét _mô hình hộp_ CSS. Bạn sẽ hiểu cách nó hoạt động và các thuật ngữ liên quan.
- [Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
  - : Mục tiêu của bài học này là phát triển hiểu biết của bạn về một số khái niệm cơ bản nhất của CSS — tầng, độ đặc hiệu và kế thừa — kiểm soát cách CSS được áp dụng vào HTML và cách giải quyết xung đột giữa các khai báo kiểu.
- [Sửa kiểu trang blog](/en-US/docs/Learn_web_development/Core/Styling_basics/Fixing_blog_styles) <sup>Thử thách</sup>
  - : Trong thử thách này, chúng tôi cung cấp cho bạn một ví dụ trang blog cơ bản được tạo kiểu một phần. Chúng tôi cần bạn sửa một số vấn đề với CSS hiện tại và thêm một số kiểu để hoàn thiện nó. Trong quá trình đó, chúng tôi sẽ kiểm tra kiến thức của bạn về bộ chọn, mô hình hộp và xung đột/tầng.
- [Giá trị và đơn vị](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
  - : Các quy tắc CSS chứa [các khai báo](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_declarations), vốn được tạo thành từ các thuộc tính và giá trị. Mỗi thuộc tính được sử dụng trong CSS có một **kiểu giá trị** mô tả loại giá trị mà nó được phép có. Trong bài học này, chúng ta sẽ xem xét một số kiểu giá trị được sử dụng phổ biến nhất, chúng là gì và cách chúng hoạt động.
- [Kích thước các mục trong CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing)
  - : Hiểu các tính năng khác nhau trong thiết kế của bạn sẽ có kích thước như thế nào là quan trọng. Trong bài học này, chúng ta sẽ tóm tắt các cách khác nhau mà các phần tử nhận được kích thước qua CSS và định nghĩa một số thuật ngữ về kích thước sẽ giúp bạn trong tương lai.
- [Nền và đường viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
  - : Trong bài học này, chúng ta sẽ xem xét một số điều sáng tạo mà bạn có thể làm với nền và đường viền CSS. Từ việc thêm gradient, hình ảnh nền và các góc bo tròn, nền và đường viền là câu trả lời cho nhiều câu hỏi tạo kiểu trong CSS.
- [Thử thách: Kích thước và trang trí bảng nội dung](/en-US/docs/Learn_web_development/Core/Styling_basics/Size_decorate_content_panel) <sup>Thử thách</sup>
  - : Trong thử thách này, bạn được cung cấp một cấu trúc trang được tạo kiểu nhẹ, hiển thị bảng nội dung với tiêu đề ở trên cùng và thanh nút ở dưới cùng. Chúng tôi muốn bạn thực hiện theo hướng dẫn để kích thước và trang trí nó, tạo ra bố cục thú vị. Trong quá trình đó, chúng tôi sẽ kiểm tra kiến thức của bạn về giá trị và đơn vị CSS, kích thước và nền với đường viền.
- [Nội dung tràn](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow)
  - : Tràn là điều xảy ra khi có quá nhiều nội dung để vừa vào trong một hộp phần tử. Trong bài học này, bạn sẽ học cách quản lý tràn bằng CSS.
- [Hình ảnh, phương tiện và các phần tử biểu mẫu](/en-US/docs/Learn_web_development/Core/Styling_basics/Images_media_forms)
  - : Trong bài học này, chúng ta sẽ xem xét cách một số phần tử đặc biệt được xử lý trong CSS. Hình ảnh, phương tiện khác và các phần tử biểu mẫu hoạt động hơi khác so với các hộp thông thường về khả năng tạo kiểu bằng CSS. Hiểu những gì có thể và không thể làm có thể tiết kiệm một số sự thất vọng, và bài học này sẽ làm nổi bật một số điều chính mà bạn cần biết.
- [Tạo kiểu bảng](/en-US/docs/Learn_web_development/Core/Styling_basics/Tables)
  - : Tạo kiểu cho bảng HTML không phải là công việc hào hứng nhất trên thế giới, nhưng đôi khi tất cả chúng ta đều phải làm. Bài viết này giải thích cách làm cho bảng HTML trông đẹp, với một số kỹ thuật tạo kiểu bảng cụ thể được làm nổi bật.
- [Gỡ lỗi CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Debugging_CSS)
  - : Bài viết này sẽ cung cấp cho bạn hướng dẫn về cách gỡ lỗi một vấn đề CSS và chỉ cho bạn cách DevTools được bao gồm trong tất cả các trình duyệt hiện đại có thể giúp bạn tìm ra những gì đang xảy ra.

## Kiểm tra kỹ năng của bạn

Bạn sẽ tìm thấy các bài "Kiểm tra kỹ năng" được đặt xen kẽ giữa các bài hướng dẫn để kiểm tra xem bạn có ghi nhớ thông tin quan trọng nhất trước khi tiếp tục không. Nếu bạn muốn khám phá tất cả chúng cùng nhau, bạn có thể tìm thấy chúng được liệt kê tại [Kiểm tra kỹ năng: Kiến thức cơ bản về CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Test_your_skills).

## Hướng dẫn bổ sung

Những hướng dẫn này không phải là một phần của lộ trình học tập, nhưng chúng vẫn thú vị — bạn nên coi đây là những mục tiêu mở rộng, để tùy chọn nghiên cứu khi bạn đã hoàn thành các bài viết Core chính.

- [Các hiệu ứng tạo kiểu nâng cao](/en-US/docs/Learn_web_development/Core/Styling_basics/Advanced_styling_effects)
  - : Bài viết này đóng vai trò như một hộp thủ thuật, cung cấp giới thiệu về một số tính năng tạo kiểu nâng cao thú vị như bóng hộp, chế độ hòa trộn và bộ lọc.
- [Các tầng tầng tầng](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
  - : Bài học này nhằm giới thiệu cho bạn về [các tầng tầng](/en-US/docs/Web/CSS/Reference/At-rules/@layer), một tính năng nâng cao hơn xây dựng trên các khái niệm cơ bản của [tầng CSS](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) và [độ đặc hiệu CSS](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).
- [Xử lý các hướng văn bản khác nhau](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions)
  - : Trong những năm gần đây, CSS đã phát triển để hỗ trợ tốt hơn các hướng nội dung khác nhau, bao gồm từ phải sang trái nhưng cũng cả nội dung từ trên xuống dưới (như tiếng Nhật) — các hướng khác nhau này được gọi là chế độ viết. Khi bạn tiến bộ trong việc học và bắt đầu làm việc với bố cục, việc hiểu về chế độ viết sẽ rất hữu ích cho bạn, vì vậy chúng tôi sẽ giới thiệu chúng trong bài viết này.
- [Tổ chức CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Organizing)
  - : Khi bạn bắt đầu làm việc với các bảng kiểu lớn hơn và các dự án lớn hơn, bạn sẽ thấy rằng việc duy trì một tệp CSS lớn có thể là thách thức. Trong bài viết này, chúng ta sẽ xem qua một số phương pháp hay nhất để viết CSS sao cho dễ duy trì và một số giải pháp bạn sẽ thấy được người khác sử dụng để giúp cải thiện khả năng bảo trì.

## Xem thêm

- [Học HTML và CSS](https://scrimba.com/learn-html-and-css-c0p?via=mdn), Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Học HTML và CSS_ của [Scrimba](https://scrimba.com/?via=mdn) dạy bạn HTML và CSS thông qua việc xây dựng và triển khai năm dự án tuyệt vời, với các bài học và thử thách tương tác thú vị được dạy bởi các giáo viên có kiến thức.
- [Viết những dòng CSS đầu tiên của bạn!](https://scrimba.com/the-frontend-developer-career-path-c0j/~015?via=mdn), Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Bài học tương tác này cung cấp một giới thiệu hữu ích về cú pháp CSS.

{{NextMenu("Learn_web_development/Core/Styling_basics/What_is_CSS", "Learn_web_development/Core")}}
