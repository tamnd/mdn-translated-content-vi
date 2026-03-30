---
title: Bố cục CSS
slug: Learn_web_development/Core/CSS_layout
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/CSS_layout/Introduction", "Learn_web_development/Core")}}

Trong các mô-đun trước, chúng ta đã tìm hiểu cách tạo kiểu và thao tác với các hộp chứa nội dung. Bây giờ là lúc tìm hiểu cách sắp xếp các hộp đó một cách chính xác trong mối quan hệ với nhau và với khung nhìn trình duyệt. Mô-đun này bao gồm floats, định vị, các công cụ bố cục hiện đại khác, và cách xây dựng thiết kế responsive sẽ thích ứng với các thiết bị, kích thước màn hình và độ phân giải khác nhau.

## Điều kiện tiên quyết

Trước khi bắt đầu mô-đun này, bạn nên quen thuộc với [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), [các kiến thức cơ bản về CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), và [tạo kiểu văn bản CSS](/en-US/docs/Learn_web_development/Core/Text_styling).

> [!NOTE]
> Nếu bạn đang làm việc trên máy tính, máy tính bảng hoặc thiết bị khác không thể tạo tệp, bạn có thể thử chạy mã trong trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

## Hướng dẫn và thử thách

- [Giới thiệu về bố cục CSS](/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction)
  - : Bài học này tóm tắt lại một số tính năng bố cục CSS mà chúng ta đã đề cập trong các mô-đun trước, như các giá trị {{cssxref("display")}} khác nhau, đồng thời giới thiệu một số khái niệm chúng ta sẽ đề cập trong mô-đun này. Bài học cũng bao gồm khái niệm luồng thông thường một cách chi tiết.
- [Floats (Thả nổi)](/en-US/docs/Learn_web_development/Core/CSS_layout/Floats)
  - : Ban đầu được dùng để thả nổi hình ảnh bên trong các khối văn bản, thuộc tính {{cssxref("float")}} đã trở thành một trong những công cụ được sử dụng phổ biến nhất để tạo bố cục nhiều cột trên trang web. Với sự xuất hiện của flexbox và lưới, nó đã quay về mục đích ban đầu, như bài viết này giải thích.
- [Định vị (Positioning)](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
  - : Định vị cho phép bạn đưa các phần tử ra khỏi luồng tài liệu thông thường và làm cho chúng hoạt động khác đi, ví dụ: nằm chồng lên nhau hoặc luôn ở cùng một vị trí bên trong khung nhìn trình duyệt. Bài viết này giải thích các giá trị {{cssxref("position")}} khác nhau và cách sử dụng chúng.
- [Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox)
  - : [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Use_cases) là phương pháp bố cục một chiều để sắp xếp các mục theo hàng hoặc cột. Các mục flex để lấp đầy không gian bổ sung và co lại để vừa với các không gian nhỏ hơn. Bài viết này giải thích tất cả các kiến thức cơ bản.
- [Bố cục lưới CSS](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids)
  - : Bố cục lưới CSS là hệ thống bố cục hai chiều cho web. Nó cho phép bạn tổ chức nội dung thành các hàng và cột và cung cấp nhiều tính năng để đơn giản hóa việc tạo các bố cục phức tạp. Bài viết này sẽ giải thích tất cả những gì bạn cần biết để bắt đầu với bố cục lưới.
- [Thử thách hiểu bố cục cơ bản](/en-US/docs/Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension) <sup>Thử thách</sup>
  - : Thử thách này sẽ kiểm tra kiến thức của bạn về các tính năng bố cục chúng ta đã đề cập cho đến nay trong mô-đun, cụ thể là flexbox, floats, lưới và định vị. Khi hoàn thành, bạn sẽ đã phát triển một bố cục trang web sử dụng nhiều kỹ thuật khác nhau.
- [Thiết kế responsive](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design)
  - : Khi ngày càng có nhiều kích thước màn hình đa dạng xuất hiện trên các thiết bị kết nối web, khái niệm thiết kế web responsive (RWD) đã ra đời: một tập hợp các thực hành cho phép các trang web thay đổi bố cục và giao diện của chúng để phù hợp với chiều rộng màn hình, độ phân giải khác nhau, v.v. Đây là ý tưởng đã thay đổi cách chúng ta thiết kế cho web đa thiết bị, và trong bài viết này, chúng ta sẽ giúp bạn hiểu các kỹ thuật chính cần biết để nắm vững nó.
- [Kiến thức cơ bản về truy vấn phương tiện](/en-US/docs/Learn_web_development/Core/CSS_layout/Media_queries)
  - : **Truy vấn phương tiện CSS** cung cấp cho bạn một cách để áp dụng CSS chỉ khi môi trường trình duyệt và thiết bị khớp với các quy tắc mà bạn chỉ định. Truy vấn phương tiện là một phần quan trọng của thiết kế web responsive vì chúng cho phép bạn tạo các bố cục khác nhau tùy thuộc vào kích thước của khung nhìn. Trong bài học này, bạn sẽ học về cú pháp được sử dụng trong các truy vấn phương tiện, sau đó sử dụng chúng trong một ví dụ tương tác cho thấy cách một thiết kế đơn giản có thể được làm cho responsive.

## Kiểm tra kỹ năng

Bạn sẽ tìm thấy các bài viết "Kiểm tra kỹ năng" được đặt giữa các bài viết hướng dẫn để kiểm tra xem bạn có ghi nhớ thông tin quan trọng nhất trước khi tiếp tục hay không. Nếu bạn muốn khám phá tất cả chúng cùng nhau, bạn có thể tìm thấy danh sách tại [Kiểm tra kỹ năng: Bố cục CSS](/en-US/docs/Learn_web_development/Core/CSS_layout/Test_your_skills).

## Hướng dẫn bổ sung

Các hướng dẫn này không phải là một phần của lộ trình học, nhưng chúng vẫn rất thú vị — bạn nên coi đây là các mục tiêu mở rộng, để tùy chọn nghiên cứu khi bạn hoàn thành các bài viết Core chính.

- [Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
  - : Đặc tả bố cục nhiều cột cung cấp cho bạn một phương pháp để trình bày nội dung theo cột, như bạn có thể thấy trong tờ báo. Bài viết này giải thích cách sử dụng tính năng này.
- [Ví dụ định vị thực tế](/en-US/docs/Learn_web_development/Core/CSS_layout/Practical_positioning_examples)
  - : Bài viết này cho thấy cách xây dựng một số ví dụ thực tế để minh họa những loại thứ gì bạn có thể làm với định vị.
- [Các phương pháp bố cục cũ](/en-US/docs/Learn_web_development/Core/CSS_layout/Legacy_Layout_Methods)
  - : Hệ thống lưới là một tính năng rất phổ biến được sử dụng trong bố cục CSS, và trước bố cục lưới CSS, chúng thường được triển khai bằng floats hoặc các tính năng bố cục khác. Bạn hình dung bố cục của mình là một số cột được đặt sẵn (ví dụ: 4, 6 hoặc 12), sau đó đặt nội dung vào các cột ảo này. Trong bài viết này, chúng ta sẽ khám phá cách các phương pháp cũ này hoạt động, để bạn hiểu cách chúng được sử dụng nếu bạn làm việc trên một dự án cũ.
- [Hỗ trợ các trình duyệt cũ](/en-US/docs/Learn_web_development/Core/CSS_layout/Supporting_Older_Browsers)
  - : Những người truy cập trang web của bạn có thể bao gồm người dùng sử dụng các trình duyệt cũ hơn hoặc sử dụng các trình duyệt không hỗ trợ các tính năng CSS mà bạn đã triển khai. Đây là tình huống phổ biến trên web, nơi các tính năng mới liên tục được thêm vào CSS. Các trình duyệt khác nhau ở chỗ hỗ trợ các tính năng này vì các trình duyệt khác nhau có xu hướng ưu tiên triển khai các tính năng khác nhau. Bài viết này giải thích cách bạn với tư cách là nhà phát triển web có thể sử dụng các kỹ thuật web hiện đại để đảm bảo trang web của bạn vẫn có thể truy cập được với người dùng sử dụng công nghệ cũ hơn.

## Xem thêm

- [Sách nấu ăn bố cục CSS](/en-US/docs/Web/CSS/How_to/Layout_cookbook)
  - : Sách nấu ăn bố cục CSS nhằm mục đích tổng hợp các công thức cho các mẫu bố cục phổ biến, những thứ bạn có thể cần triển khai trong các trang web của mình. Ngoài việc cung cấp mã bạn có thể sử dụng làm điểm khởi đầu trong các dự án của mình, các công thức này còn nêu bật các cách khác nhau mà các đặc tả bố cục có thể được sử dụng và các lựa chọn bạn có thể thực hiện với tư cách là nhà phát triển.
- [Học Flexbox](https://scrimba.com/learn-flexbox-c0k?via=mdn) và [Học CSS Grid](https://scrimba.com/learn-css-grid-c02k?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Các khóa học này từ Scrimba cung cấp các bài học tương tác dạy bạn tất cả những gì bạn cần biết về Flexbox và Grid.

{{NextMenu("Learn_web_development/Core/CSS_layout/Introduction", "Learn_web_development/Core")}}
