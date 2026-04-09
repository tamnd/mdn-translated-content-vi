---
title: "HTML: HyperText Markup Language"
short-title: HTML
slug: Web/HTML
page-type: landing-page
sidebar: htmlsidebar
---

**HTML** (HyperText Markup Language) là khối xây dựng cơ bản nhất của Web. Nó định nghĩa ý nghĩa và cấu trúc của nội dung web. Các công nghệ khác ngoài HTML thường được sử dụng để mô tả giao diện/trình bày của trang web ([CSS](/en-US/docs/Web/CSS)) hoặc chức năng/hành vi ([JavaScript](/en-US/docs/Web/JavaScript)).

"Hypertext" đề cập đến các liên kết kết nối các trang web với nhau, có thể trong cùng một trang web hoặc giữa các trang web khác nhau. Liên kết là một khía cạnh cơ bản của Web. Bằng cách tải nội dung lên Internet và liên kết nó với các trang do người khác tạo ra, bạn trở thành một thành viên tích cực của World Wide Web.

HTML sử dụng "đánh dấu" (markup) để chú thích văn bản, hình ảnh và các nội dung khác để hiển thị trong trình duyệt Web. Đánh dấu HTML bao gồm các "phần tử" đặc biệt như {{HTMLElement("head")}}, {{HTMLElement("title")}}, {{HTMLElement("body")}}, {{HTMLElement("header")}}, {{HTMLElement("footer")}}, {{HTMLElement("article")}}, {{HTMLElement("section")}}, {{HTMLElement("p")}}, {{HTMLElement("div")}}, {{HTMLElement("span")}}, {{HTMLElement("img")}}, {{HTMLElement("aside")}}, {{HTMLElement("audio")}}, {{HTMLElement("canvas")}}, {{HTMLElement("datalist")}}, {{HTMLElement("details")}}, {{HTMLElement("embed")}}, {{HTMLElement("nav")}}, {{HTMLElement("search")}}, {{HTMLElement("output")}}, {{HTMLElement("progress")}}, {{HTMLElement("video")}}, {{HTMLElement("ul")}}, {{HTMLElement("ol")}}, {{HTMLElement("li")}} và nhiều phần tử khác.

Một phần tử HTML được phân biệt với văn bản khác trong tài liệu bằng các "thẻ" (tags), bao gồm tên phần tử được bao quanh bởi `<` và `>`. Tên của phần tử bên trong thẻ không phân biệt chữ hoa/thường. Nghĩa là, nó có thể được viết bằng chữ hoa, chữ thường hoặc kết hợp. Ví dụ, thẻ `<title>` có thể được viết là `<Title>`, `<TITLE>` hoặc bất kỳ cách nào khác. Tuy nhiên, quy ước và thực hành được khuyến nghị là viết thẻ bằng chữ thường.

Các bài viết dưới đây có thể giúp bạn tìm hiểu thêm về HTML.

## Hướng dẫn cho người mới bắt đầu

[Các mô-đun cốt lõi học phát triển web](/en-US/docs/Learn_web_development/Core) của chúng tôi chứa các hướng dẫn hiện đại, cập nhật về các kiến thức cơ bản của HTML.

- [Trang web đầu tiên của bạn: Tạo nội dung](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Creating_the_content)
  - : Bài viết này cung cấp một cái nhìn tổng quan ngắn gọn về HTML là gì và cách sử dụng, dành cho những người hoàn toàn mới với phát triển web.
- [Cấu trúc nội dung với HTML](/en-US/docs/Learn_web_development/Core/Structuring_content)
  - : Mô-đun này đề cập đến những kiến thức cơ bản về ngôn ngữ HTML, trước khi xem xét các lĩnh vực chính như cấu trúc tài liệu, liên kết, danh sách, hình ảnh, biểu mẫu, và nhiều hơn nữa.
- [HTML forms](/en-US/docs/Learn_web_development/Extensions/Forms)
  - : Biểu mẫu là một phần rất quan trọng của Web — chúng cung cấp phần lớn chức năng bạn cần để tương tác với các trang web, ví dụ như đăng ký và đăng nhập, gửi phản hồi, mua sản phẩm, và nhiều hơn nữa. Mô-đun này giúp bạn bắt đầu tạo các phần client-side/front-end của biểu mẫu.

## Hướng dẫn

[Các hướng dẫn HTML](/en-US/docs/Web/HTML/Guides) giúp bạn xây dựng với HTML trên web. Chúng bao gồm các chủ đề như biểu mẫu, CORS, tải trước nội dung, và hình ảnh responsive.

- [HTML cheatsheet về cú pháp và các tác vụ thông dụng](/en-US/docs/Web/HTML/Guides/Cheatsheet)
  - : Tài liệu tham khảo nhanh về cú pháp và tác vụ HTML thông dụng.
- [Sử dụng comment HTML `<!-- … -->`](/en-US/docs/Web/HTML/Guides/Comments)
  - : Comment HTML được sử dụng để thêm chú thích giải thích vào đánh dấu hoặc để ngăn trình duyệt diễn giải các phần cụ thể của tài liệu.
- [Sử dụng xác thực biểu mẫu HTML và Constraint Validation API](/en-US/docs/Web/HTML/Guides/Constraint_validation)
  - : HTML5 đã giới thiệu constraint validation để dễ dàng xác thực biểu mẫu ở phía client. Các ràng buộc cơ bản có thể được kiểm tra mà không cần JavaScript bằng cách đặt các thuộc tính trên các phần tử biểu mẫu.
- [Danh mục nội dung](/en-US/docs/Web/HTML/Guides/Content_categories)
  - : HTML bao gồm một số loại nội dung, mỗi loại được phép sử dụng trong một số ngữ cảnh nhất định và bị cấm trong các ngữ cảnh khác. Tương tự, mỗi ngữ cảnh có một tập hợp các danh mục nội dung khác mà nó có thể chứa và các phần tử có thể hoặc không thể được sử dụng trong chúng. Đây là hướng dẫn về các danh mục này.
- [Sử dụng định dạng ngày và giờ trong HTML](/en-US/docs/Web/HTML/Guides/Date_and_time_formats)
  - : Một số phần tử HTML sử dụng giá trị ngày và/hoặc giờ. Hướng dẫn này mô tả định dạng của các chuỗi xác định các giá trị này.
- [Sử dụng microdata trong HTML](/en-US/docs/Web/HTML/Guides/Microdata)
  - : Microdata được sử dụng để lồng metadata vào nội dung hiện có trên các trang web. Các công cụ tìm kiếm và web crawler có thể trích xuất và xử lý microdata để cung cấp trải nghiệm duyệt web phong phú hơn.
- [Sử dụng microformats trong HTML](/en-US/docs/Web/HTML/Guides/Microformats)
  - : Microformats là các tiêu chuẩn được sử dụng để nhúng ngữ nghĩa và dữ liệu có cấu trúc vào HTML để sử dụng cho các ứng dụng web xã hội, công cụ tìm kiếm, bộ tổng hợp và các công cụ khác.
- [Hiểu về quirks mode và standards mode](/en-US/docs/Web/HTML/Guides/Quirks_mode_and_standards_mode)
  - : Thông tin lịch sử về quirks mode và standards mode.
- [Sử dụng hình ảnh responsive trong HTML](/en-US/docs/Web/HTML/Guides/Responsive_images)
  - : Tìm hiểu về hình ảnh responsive hoạt động tốt trên các thiết bị có kích thước màn hình, độ phân giải và tính năng khác nhau, cải thiện hiệu suất trên nhiều thiết bị.
- [Loại media và định dạng trên web](/en-US/docs/Web/Media/Guides/Formats)
  - : Các phần tử {{HTMLElement("audio")}} và {{HTMLElement("video")}} cho phép bạn phát media âm thanh và video trực tiếp trong nội dung mà không cần hỗ trợ phần mềm bên ngoài.

## Hướng dẫn thực hành

- [Định nghĩa thuật ngữ với HTML](/en-US/docs/Web/HTML/How_to/Define_terms_with_HTML)
  - : HTML cung cấp một số cách để truyền đạt ngữ nghĩa mô tả, dù là inline hay dưới dạng bảng chú giải có cấu trúc. Bài viết này chỉ ra cách đánh dấu từ khóa đúng cách khi định nghĩa chúng.
- [Sử dụng thuộc tính data](/en-US/docs/Web/HTML/How_to/Use_data_attributes)
  - : HTML5 được thiết kế với tính mở rộng dành cho dữ liệu cần liên kết với một phần tử cụ thể nhưng không cần có bất kỳ ý nghĩa được xác định nào. Các thuộc tính `data-*` cho phép chúng ta lưu trữ thông tin bổ sung trên các phần tử HTML ngữ nghĩa, tiêu chuẩn.
- [Sử dụng hình ảnh cross-origin trong canvas](/en-US/docs/Web/HTML/How_to/CORS_enabled_image)
  - : Một số phần tử HTML hỗ trợ [CORS](/en-US/docs/Web/HTTP/Guides/CORS), như {{HTMLElement("img")}} hoặc {{HTMLElement("video")}}, có thuộc tính `crossorigin` (thuộc tính `crossOrigin`), cho phép bạn cấu hình các yêu cầu CORS cho dữ liệu được tải của phần tử.
- [Thêm hitmap lên trên hình ảnh](/en-US/docs/Web/HTML/How_to/Add_a_hit_map_on_top_of_an_image)
  - : Image map cho phép các siêu liên kết được liên kết với các phần khác nhau của hình ảnh. Bài viết này chỉ ra cách tạo và triển khai chúng.
- [Tạo trang HTML tải nhanh](/en-US/docs/Web/HTML/How_to/Author_fast-loading_HTML_pages)
  - : Các mẹo này dựa trên kiến thức chung và thực nghiệm. Một trang web được tối ưu hóa không chỉ cung cấp trang web phản hồi nhanh hơn cho khách truy cập mà còn giảm tải trên máy chủ web và kết nối internet của bạn.
- [Thêm JavaScript vào trang web của bạn](/en-US/docs/Web/HTML/How_to/Add_JavaScript_to_your_web_page)
  - : Bài viết này giải thích cách thêm mã JavaScript vào tệp HTML.

## Tài liệu tham khảo

HTML bao gồm các **phần tử** (elements), mỗi phần tử có thể được sửa đổi bởi một số **thuộc tính** (attributes). Các tài liệu HTML được kết nối với nhau thông qua **liên kết** (links). Duyệt tài liệu [tham khảo HTML đầy đủ](/en-US/docs/Web/HTML/Reference).

- [Các phần tử HTML](/en-US/docs/Web/HTML/Reference/Elements)
  - : Tài liệu tham khảo cho tất cả {{glossary("Element", "phần tử")}} HTML.
- [Các thuộc tính HTML](/en-US/docs/Web/HTML/Reference/Attributes)
  - : Tài liệu tham khảo cho tất cả thuộc tính HTML. Thuộc tính là các giá trị bổ sung cấu hình phần tử hoặc điều chỉnh hành vi của chúng theo nhiều cách khác nhau.
- [Thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
  - : Tài liệu tham khảo cho các thuộc tính toàn cục có thể được chỉ định trên tất cả các phần tử HTML, _kể cả những phần tử không được chỉ định trong tiêu chuẩn_. Điều này có nghĩa là bất kỳ phần tử không tiêu chuẩn nào cũng phải cho phép các thuộc tính này, mặc dù các phần tử đó làm cho tài liệu không tuân thủ HTML5.

### Thuộc tính theo phần tử

- [Các loại input](/en-US/docs/Web/HTML/Reference/Elements/input)
  - : Được sử dụng để tạo các điều khiển tương tác cho các biểu mẫu dựa trên web.
- [Các loại script](/en-US/docs/Web/HTML/Reference/Elements/script/type)
  - : Chỉ ra loại script được biểu diễn bởi phần tử.
- [meta name](/en-US/docs/Web/HTML/Reference/Elements/meta/name)
  - : Cung cấp metadata theo cặp tên-giá trị cho toàn bộ trang.

### Giá trị thuộc tính

- [Từ khóa rel](/en-US/docs/Web/HTML/Reference/Attributes/rel)
  - : Xác định mối quan hệ giữa tài nguyên được liên kết và tài liệu hiện tại.

## Chủ đề liên quan

- [Áp dụng màu cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
  - : Bài viết này đề cập đến hầu hết các cách bạn sử dụng CSS để thêm màu vào nội dung HTML, liệt kê những phần nào của tài liệu HTML có thể được tô màu và những thuộc tính CSS nào cần sử dụng khi làm điều đó.
