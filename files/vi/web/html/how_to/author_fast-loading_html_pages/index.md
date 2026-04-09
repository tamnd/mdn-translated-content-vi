---
title: Author fast-loading HTML pages
slug: Web/HTML/How_to/Author_fast-loading_HTML_pages
page-type: how-to
sidebar: htmlsidebar
---

Một trang web được tối ưu hóa không chỉ cung cấp trang web phản hồi nhanh hơn cho khách truy cập mà còn giảm tải trên máy chủ web và kết nối internet của bạn. Điều này có thể rất quan trọng đối với các trang có lưu lượng truy cập cao hoặc các trang có sự tăng đột biến trong lưu lượng do các trường hợp bất thường như các tin tức nóng.
Bài viết này mô tả cách cải thiện thời gian tải trang dựa trên kiến thức chung và thực nghiệm.

Tối ưu hóa hiệu suất tải trang không chỉ dành cho nội dung sẽ được xem bởi các khách truy cập sử dụng dial-up băng thông hẹp hoặc thiết bị di động. Nó cũng quan trọng không kém đối với nội dung băng thông rộng và có thể dẫn đến những cải thiện đáng kể ngay cả cho các khách truy cập với kết nối nhanh nhất.

## Mẹo

### Giảm trọng lượng trang

Trọng lượng trang là yếu tố quan trọng nhất trong hiệu suất tải trang.

Giảm trọng lượng trang thông qua việc loại bỏ khoảng trắng và comment không cần thiết, thường được gọi là minimization, và bằng cách di chuyển script và CSS inline vào các tệp bên ngoài, có thể cải thiện hiệu suất tải xuống với ít cần thay đổi khác trong cấu trúc trang.

Các công cụ như [HTML Tidy](https://www.html-tidy.org/) có thể tự động xóa khoảng trắng đầu dòng và dòng trống thêm từ nguồn HTML hợp lệ. Các công cụ khác có thể "nén" JavaScript bằng cách định dạng lại nguồn hoặc bằng cách làm mờ nguồn và thay thế các định danh dài bằng các phiên bản ngắn hơn.

### Giảm thiểu số lượng tệp

Giảm số lượng tệp được tham chiếu trong một trang web làm giảm số lượng kết nối [HTTP](/en-US/docs/Web/HTTP) cần thiết để tải xuống một trang, do đó giảm thời gian gửi các yêu cầu này và nhận phản hồi của chúng.

Tùy thuộc vào cài đặt cache của trình duyệt, nó có thể gửi yêu cầu với header [`If-Modified-Since`](/en-US/docs/Web/HTTP/Reference/Headers/If-Modified-Since) cho mỗi tệp được tham chiếu, hỏi xem tệp có được sửa đổi kể từ lần tải xuống cuối cùng hay không. Quá nhiều thời gian truy vấn thời gian sửa đổi cuối cùng của các tệp được tham chiếu có thể trì hoãn việc hiển thị ban đầu của trang web, vì trình duyệt phải kiểm tra thời gian sửa đổi cho mỗi tệp này, trước khi render trang.

Nếu bạn sử dụng nhiều hình ảnh nền trong CSS của mình, bạn có thể giảm số lần tra cứu HTTP cần thiết bằng cách kết hợp các hình ảnh thành một, được gọi là image sprite. Sau đó bạn chỉ cần áp dụng cùng một hình ảnh mỗi khi bạn cần nó cho nền và điều chỉnh tọa độ x/y cho phù hợp. Kỹ thuật này hoạt động tốt nhất với các phần tử có kích thước giới hạn và sẽ không hoạt động cho mọi cách sử dụng hình ảnh nền. Tuy nhiên, ít yêu cầu HTTP hơn và cache hình ảnh đơn lẻ có thể giúp giảm thời gian tải trang.

### Sử dụng Content Delivery Network (CDN)

Đối với mục đích của bài viết này, CDN là phương tiện để giảm khoảng cách vật lý giữa máy chủ của bạn và khách truy cập. Khi khoảng cách giữa origin máy chủ và khách truy cập tăng lên, thời gian tải sẽ tăng theo. Giả sử máy chủ trang web của bạn nằm ở Hoa Kỳ và có khách truy cập từ Ấn Độ; thời gian tải trang sẽ cao hơn nhiều cho khách truy cập Ấn Độ so với khách truy cập từ Hoa Kỳ.

CDN là một mạng lưới máy chủ phân tán địa lý làm việc cùng nhau để rút ngắn khoảng cách giữa người dùng và trang web của bạn. CDN lưu trữ các phiên bản cached của trang web của bạn và phục vụ chúng cho khách truy cập qua node mạng gần nhất với người dùng, do đó giảm [latency](/en-US/docs/Web/Performance/Guides/Understanding_latency).

Đọc thêm:

- [Understanding CDNs](https://www.imperva.com/learn/performance/what-is-cdn-how-it-works/)

### Giảm tra cứu domain

Do mỗi domain riêng biệt tốn thời gian trong tra cứu DNS, thời gian tải trang sẽ tăng lên cùng với số lượng domain riêng biệt xuất hiện trong CSS link(s) và JavaScript và image src(es).

Điều này có thể không phải lúc nào cũng thực tế; tuy nhiên, bạn nên luôn cẩn thận chỉ sử dụng số lượng domain khác nhau tối thiểu cần thiết trong các trang của mình.

### Cache nội dung được tái sử dụng

Đảm bảo rằng bất kỳ nội dung nào có thể được cache, đều được cache, và với thời gian hết hạn phù hợp.

Đặc biệt, hãy chú ý đến header `Last-Modified`. Nó cho phép cache trang hiệu quả; bằng phương tiện header này, thông tin được truyền đến user agent về tệp mà nó muốn tải, chẳng hạn như khi nào nó được sửa đổi lần cuối. Hầu hết các máy chủ web tự động thêm header `Last-Modified` vào các trang tĩnh (ví dụ, `.html`, `.css`), dựa trên ngày sửa đổi cuối cùng được lưu trong hệ thống tệp. Với các trang động (ví dụ, `.php`, `.aspx`), điều này, tất nhiên, không thể được thực hiện, và header không được gửi.

Vì vậy, đặc biệt, đối với các trang được tạo động, một chút nghiên cứu về chủ đề này là có lợi. Nó có thể hơi phức tạp, nhưng nó sẽ tiết kiệm rất nhiều trong các yêu cầu trang trên các trang mà thông thường sẽ không thể cache được.

Thêm thông tin:

1. [HTTP Conditional Get for RSS Hackers](https://fishbowl.pastiche.org/2002/10/21/http_conditional_get_for_rss_hackers)
2. [HTTP 304: Not Modified](https://annevankesteren.nl/2005/05/http-304)
3. [HTTP ETag trên Wikipedia](https://en.wikipedia.org/wiki/HTTP_ETag)
4. [Caching trong HTTP](https://www.w3.org/Protocols/rfc2616/rfc2616-sec13.html)

### Sắp xếp tối ưu các thành phần của trang

Tải xuống nội dung trang trước tiên, cùng với bất kỳ CSS hoặc JavaScript nào có thể cần thiết cho việc hiển thị ban đầu của nó, để người dùng nhận được phản hồi nhanh nhất trong quá trình tải trang. Nội dung này thường là văn bản và do đó có thể hưởng lợi từ việc nén văn bản trong quá trình truyền, từ đó cung cấp phản hồi thậm chí nhanh hơn cho người dùng.

Bất kỳ tính năng động nào yêu cầu trang tải hoàn toàn trước khi được sử dụng, ban đầu nên bị vô hiệu hóa, và sau đó chỉ được bật sau khi trang đã tải. Điều này sẽ khiến JavaScript được tải sau nội dung trang, cải thiện giao diện tổng thể của quá trình tải trang.

### Giảm số lượng script inline

Script inline có thể tốn kém cho việc tải trang vì parser phải giả định rằng một script inline có thể sửa đổi cấu trúc trang trong khi quá trình phân tích cú pháp đang diễn ra. Giảm việc sử dụng script inline nói chung, và giảm việc sử dụng `document.write()` để xuất nội dung nói riêng, có thể cải thiện tổng thể việc tải trang. Sử dụng [các API DOM để thao tác nội dung trang](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting), thay vì `document.write()`.

### Sử dụng CSS hiện đại và đánh dấu hợp lệ

Việc sử dụng CSS hiện đại làm giảm lượng đánh dấu, có thể giảm nhu cầu về hình ảnh (spacer), về mặt layout, và thường có thể thay thế hình ảnh của văn bản có kiểu dáng — "tốn kém" hơn nhiều so với văn bản và CSS tương đương.

Việc sử dụng đánh dấu hợp lệ có những lợi thế khác. Đầu tiên, trình duyệt sẽ không cần thực hiện sửa lỗi khi phân tích cú pháp HTML (đây là ngoài vấn đề triết học về việc có nên cho phép biến thể định dạng trong đầu vào người dùng và sau đó "sửa chữa" hoặc chuẩn hóa nó theo chương trình; hay thay vào đó, có nên thực thi định dạng đầu vào nghiêm ngặt, không khoan nhượng).

Hơn nữa, đánh dấu hợp lệ cho phép sử dụng tự do các công cụ khác có thể _tiền xử lý_ các trang web của bạn. Ví dụ, [HTML Tidy](https://www.html-tidy.org/) có thể xóa khoảng trắng và các thẻ kết thúc tùy chọn; tuy nhiên, nó sẽ từ chối chạy trên một trang có lỗi đánh dấu nghiêm trọng.

### Phân chia nội dung của bạn

Bảng cho layout là phương pháp kế thừa không nên được sử dụng nữa. Các layout sử dụng [floats](/en-US/docs/Learn_web_development/Core/CSS_layout/Floats), [positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning), [flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox), hoặc [grids](/en-US/docs/Learn_web_development/Core/CSS_layout/Grids) nên được sử dụng thay thế.

Bảng vẫn được coi là đánh dấu hợp lệ nhưng nên được sử dụng để hiển thị dữ liệu dạng bảng. Để giúp trình duyệt render trang của bạn nhanh hơn, bạn nên sử dụng các phương pháp CSS như [flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) và [grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) thay vì lồng các bảng.

### Thu nhỏ và nén tài nguyên SVG

SVG được tạo ra bởi hầu hết các ứng dụng vẽ thường chứa metadata không cần thiết có thể được xóa. Cấu hình máy chủ của bạn, áp dụng nén gzip cho các tài nguyên SVG.

### Thu nhỏ và nén hình ảnh của bạn

Hình ảnh lớn khiến trang của bạn mất nhiều thời gian hơn để tải. Hãy xem xét nén hình ảnh của bạn trước khi thêm chúng vào trang, sử dụng các tính năng nén tích hợp trong các công cụ chỉnh sửa hình ảnh như Photoshop, hoặc sử dụng một công cụ chuyên dụng như [Compress JPEG](https://compressjpeg.com/) hoặc [Tiny PNG](https://tinypng.com/).

### Chỉ định kích thước cho hình ảnh và bảng

Nếu trình duyệt có thể ngay lập tức xác định chiều cao và/hoặc chiều rộng của hình ảnh và bảng, nó sẽ có thể hiển thị trang web mà không cần reflow nội dung. Điều này không chỉ tăng tốc độ hiển thị trang mà còn ngăn ngừa các thay đổi khó chịu trong layout của trang khi trang tải xong. Vì lý do này, `height` và `width` nên được chỉ định cho hình ảnh bất cứ khi nào có thể.

Bảng nên sử dụng kết hợp CSS selector: property:

```css
table-layout: fixed;
```

và nên chỉ định độ rộng của các cột bằng cách sử dụng các phần tử [`<col>`](/en-US/docs/Web/HTML/Reference/Elements/col) và [`<colgroup>`](/en-US/docs/Web/HTML/Reference/Elements/colgroup).

### Sử dụng lazy loading cho hình ảnh

Theo mặc định, hình ảnh được tải **eagerly** (tích cực); nghĩa là, hình ảnh được tải và render ngay khi nó được xử lý trong HTML. Tất cả các hình ảnh được tải eagerly đều được render trước khi sự kiện [`load`](/en-US/docs/Web/API/Window/load_event) của window được gửi. Chuyển sang lazy loading hình ảnh yêu cầu trình duyệt trì hoãn việc tải hình ảnh cho đến khi chúng sắp cần thiết để vẽ {{Glossary("visual viewport")}}.

Để đánh dấu một hình ảnh cho lazy loading, hãy chỉ định thuộc tính [`loading`](/en-US/docs/Web/HTML/Reference/Elements/img#loading) với giá trị `lazy`. Với cài đặt này, hình ảnh sẽ chỉ được tải khi cần thiết.

```html
<img src="./images/footerlogo.jpg" loading="lazy" alt="MDN logo" />
```

Lưu ý rằng hình ảnh được tải lazily có thể không có sẵn khi sự kiện `load` được kích hoạt. Bạn có thể xác định xem một hình ảnh cụ thể có được tải hay không bằng cách kiểm tra xem giá trị của thuộc tính Boolean {{domxref("HTMLImageElement.complete", "complete")}} có phải là `true` hay không.

### Chọn các yêu cầu user-agent một cách khôn ngoan

Để đạt được những cải thiện lớn nhất trong thiết kế trang, hãy đảm bảo rằng các yêu cầu user-agent hợp lý được chỉ định cho các dự án. Không yêu cầu nội dung của bạn trông hoàn hảo pixel trên tất cả các trình duyệt, đặc biệt không phải trong các trình duyệt phiên bản cũ hơn.

Lý tưởng nhất, các yêu cầu tối thiểu cơ bản của bạn nên dựa trên việc xem xét các trình duyệt hiện đại hỗ trợ các tiêu chuẩn liên quan. Điều này có thể bao gồm các phiên bản gần đây của Firefox, Google Chrome, Opera và Safari.

Tuy nhiên, lưu ý rằng nhiều mẹo được liệt kê trong bài viết này là các kỹ thuật thông thường áp dụng cho bất kỳ user agent nào, và có thể được áp dụng cho bất kỳ trang web nào, bất kể yêu cầu hỗ trợ trình duyệt là gì.

### Sử dụng async và defer nếu có thể

Làm cho các script JavaScript tương thích với cả thuộc tính [async](/en-US/docs/Web/HTML/Reference/Elements/script#attributes) và [defer](/en-US/docs/Web/HTML/Reference/Elements/script#attributes), và sử dụng [async](/en-US/docs/Web/HTML/Reference/Elements/script#attributes) bất cứ khi nào có thể, đặc biệt nếu bạn có nhiều phần tử script.

Với điều đó, trang có thể ngừng render trong khi JavaScript vẫn đang tải. Nếu không, trình duyệt sẽ không render bất cứ thứ gì sau các phần tử script không có các thuộc tính này.

Lưu ý: Mặc dù các thuộc tính này giúp ích rất nhiều lần đầu tiên trang được tải, bạn nên sử dụng chúng nhưng không nên giả định chúng sẽ hoạt động trong tất cả các trình duyệt. Nếu bạn đã tuân theo tất cả các phương pháp hay nhất JavaScript, không cần phải thay đổi mã của bạn.

## Cấu trúc trang ví dụ

- `{{htmlelement('html')}}`
  - `{{htmlelement('head')}}`
    - `{{htmlelement('link')}}`

      Các tệp CSS cần thiết cho giao diện trang. Giảm thiểu số lượng tệp để tăng hiệu suất trong khi giữ CSS không liên quan trong các tệp riêng biệt để bảo trì.

    - `{{htmlelement('script')}}`

      Các tệp JavaScript cho các hàm **cần thiết** trong quá trình tải trang, nhưng không phải bất kỳ JavaScript tương tác nào chỉ có thể chạy sau khi trang tải xong.

      Giảm thiểu số lượng tệp để tăng hiệu suất trong khi giữ JavaScript không liên quan trong các tệp riêng biệt để bảo trì.

  - `{{htmlelement('body')}}`

    Nội dung trang hiển thị cho người dùng theo các phần nhỏ (`{{htmlelement('header')}}`/ `{{htmlelement('main')}}/` `{{htmlelement('table')}}`) có thể được hiển thị mà không cần chờ toàn bộ trang tải xuống.
    - `{{htmlelement('script')}}`

      Bất kỳ script nào sẽ được sử dụng để thực hiện tương tác. Script tương tác thường chỉ có thể chạy sau khi trang đã tải hoàn toàn và tất cả các đối tượng cần thiết đã được khởi tạo. Không cần tải các script này trước nội dung trang. Điều đó chỉ làm chậm giao diện ban đầu của quá trình tải trang.

      Giảm thiểu số lượng tệp để tăng hiệu suất trong khi giữ JavaScript không liên quan trong các tệp riêng biệt để bảo trì.

## Xem thêm

- Book: ["Speed Up Your Site" by Andy King](https://www.websiteoptimization.com/)
- [Learn performance](https://web.dev/learn/performance) via web.dev (2023)
- Các công cụ phân tích và tối ưu hóa hiệu suất: [Google PageSpeed Tools](https://developers.google.com/speed) và [PageSpeed Insights](https://pagespeed.web.dev/)
