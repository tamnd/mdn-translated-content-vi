---
title: What are hyperlinks?
slug: Learn_web_development/Howto/Web_mechanics/What_are_hyperlinks
page-type: learn-faq
sidebar: learn-how-to
---

Trong bài viết này, chúng ta sẽ tìm hiểu siêu liên kết là gì và tại sao chúng quan trọng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn nên biết
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work"
          >Internet hoạt động như thế nào</a
        >
        và quen thuộc với <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Browsing_the_web"
        >
          sự khác biệt giữa trang web, website, máy chủ web và
          công cụ tìm kiếm</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu về các liên kết trên web và tại sao chúng quan trọng.</td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Siêu liên kết, thường gọi là liên kết, là một khái niệm nền tảng đằng sau Web. Để giải thích liên kết là gì, chúng ta cần quay lại những khái niệm cơ bản nhất của kiến trúc Web.

Vào năm 1989, Tim Berners-Lee, người phát minh ra Web, đã nói về ba trụ cột mà Web đứng vững:

1. {{Glossary("URL")}}, một hệ thống địa chỉ theo dõi các tài liệu Web
2. {{Glossary("HTTP")}}, một giao thức truyền tải để tìm tài liệu khi biết URL của chúng
3. {{Glossary("HTML")}}, một định dạng tài liệu cho phép nhúng _siêu liên kết_

Như bạn có thể thấy trong ba trụ cột, mọi thứ trên Web đều xoay quanh tài liệu và cách truy cập chúng. Mục đích ban đầu của Web là cung cấp cách dễ dàng để tiếp cận, đọc và điều hướng qua các tài liệu văn bản. Kể từ đó, Web đã phát triển để cung cấp quyền truy cập vào hình ảnh, video và dữ liệu nhị phân, nhưng những cải tiến này gần như không thay đổi ba trụ cột.

Trước Web, việc truy cập tài liệu và di chuyển từ tài liệu này sang tài liệu khác khá khó khăn. Vì dễ đọc, URL đã làm mọi thứ dễ dàng hơn, nhưng thật khó khi phải gõ một URL dài mỗi khi bạn muốn truy cập một tài liệu. Đây là nơi siêu liên kết đã cách mạng hóa mọi thứ. Liên kết có thể tương quan bất kỳ chuỗi văn bản nào với một URL, để người dùng có thể ngay lập tức đến tài liệu đích bằng cách kích hoạt liên kết.

Các liên kết nổi bật so với văn bản xung quanh bằng cách gạch chân và văn bản màu xanh. Nhấn hoặc nhấp vào liên kết để kích hoạt nó, hoặc nếu bạn dùng bàn phím, nhấn Tab cho đến khi liên kết được lấy tiêu điểm và nhấn Enter hoặc Spacebar.

![Ví dụ về hiển thị cơ bản và hiệu ứng của liên kết trong trang web](link-1.png)

Các liên kết là bước đột phá đã làm cho Web trở nên hữu ích và thành công. Trong phần còn lại của bài viết này, chúng ta thảo luận về các loại liên kết khác nhau và tầm quan trọng của chúng đối với thiết kế Web hiện đại.

## Tìm hiểu sâu hơn

Như chúng ta đã nói, liên kết là một chuỗi văn bản gắn với một URL, và chúng ta dùng liên kết để cho phép dễ dàng nhảy từ tài liệu này sang tài liệu khác. Tuy nhiên, có một số sắc thái đáng chú ý:

### Các loại liên kết

- Liên kết nội bộ
  - : Liên kết giữa hai trang web, trong đó cả hai trang web thuộc cùng một website, được gọi là liên kết nội bộ. Không có liên kết nội bộ, sẽ không có thứ gọi là website (trừ khi đó là website một trang).
- Liên kết ngoại bộ
  - : Liên kết từ trang web của bạn đến trang web của người khác. Không có liên kết ngoại bộ, sẽ không có Web, vì Web là mạng lưới các trang web. Dùng liên kết ngoại bộ để cung cấp thông tin ngoài nội dung có sẵn qua trang web của bạn.
- Liên kết đến
  - : Liên kết từ trang web của người khác đến site của bạn. Đây là ngược lại của liên kết ngoại bộ. Lưu ý rằng bạn không cần phải liên kết lại khi ai đó liên kết đến site của bạn.

Khi bạn đang xây dựng một website, hãy tập trung vào các liên kết nội bộ, vì chúng làm cho site của bạn có thể sử dụng được. Tìm sự cân bằng tốt giữa việc có quá nhiều liên kết và quá ít. Chúng ta sẽ nói về thiết kế điều hướng website trong một bài viết khác, nhưng theo quy tắc, bất cứ khi nào bạn thêm một trang web mới, hãy đảm bảo ít nhất một trong các trang khác của bạn liên kết đến trang mới đó. Mặt khác, nếu site của bạn có hơn khoảng mười trang, việc liên kết đến mọi trang từ mọi trang khác sẽ phản tác dụng.

Khi bạn mới bắt đầu, bạn không cần lo lắng nhiều về liên kết ngoại bộ và liên kết đến, nhưng chúng rất quan trọng nếu bạn muốn công cụ tìm kiếm tìm thấy site của bạn (xem bên dưới để biết thêm chi tiết).

### Các mỏ neo

Hầu hết các liên kết kết nối hai trang web với nhau. **Mỏ neo** kết nối hai phần của một tài liệu với nhau. Khi bạn theo một liên kết trỏ đến một mỏ neo, trình duyệt của bạn nhảy đến phần khác của tài liệu hiện tại thay vì tải tài liệu mới. Tuy nhiên, bạn tạo và sử dụng mỏ neo theo cùng cách như các liên kết khác.

![Ví dụ về hiển thị cơ bản và hiệu ứng của mỏ neo trong trang web](link-2.png)

### Liên kết và Công cụ Tìm kiếm

Liên kết quan trọng đối với cả người dùng và công cụ tìm kiếm. Mỗi khi công cụ tìm kiếm thu thập dữ liệu trên một trang web, chúng lập chỉ mục website bằng cách theo các liên kết có sẵn trên trang web đó. Công cụ tìm kiếm không chỉ theo liên kết để khám phá các trang khác nhau của website, mà còn sử dụng văn bản hiển thị của liên kết để xác định truy vấn tìm kiếm nào phù hợp để đến trang web đích.

Liên kết ảnh hưởng đến mức độ sẵn sàng của công cụ tìm kiếm khi liên kết đến site của bạn. Vấn đề là rất khó đo lường hoạt động của công cụ tìm kiếm. Các công ty tự nhiên muốn site của họ xếp hạng cao trong kết quả tìm kiếm. Chúng ta biết điều sau đây về cách công cụ tìm kiếm xác định thứ hạng của site:

- _Văn bản hiển thị_ của liên kết ảnh hưởng đến truy vấn tìm kiếm nào sẽ tìm thấy một URL nhất định.
- Càng nhiều _liên kết đến_ mà một trang web có, nó xếp hạng càng cao trong kết quả tìm kiếm.
- _Liên kết ngoại bộ_ ảnh hưởng đến thứ hạng tìm kiếm của cả trang web nguồn và đích, nhưng mức độ ảnh hưởng chưa rõ ràng.

[SEO](https://en.wikipedia.org/wiki/Search_engine_optimization) (tối ưu hóa công cụ tìm kiếm) là nghiên cứu về cách làm cho website xếp hạng cao trong kết quả tìm kiếm. Cải thiện cách sử dụng liên kết của website là một kỹ thuật SEO hữu ích.

## Các bước tiếp theo

Bây giờ bạn sẽ muốn thiết lập một số trang web với các liên kết.

- Để có thêm nền tảng lý thuyết, hãy tìm hiểu về [URL và cấu trúc của chúng](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL), vì mọi liên kết đều trỏ đến một URL.
- Muốn thực hành hơn một chút? Hướng dẫn [Tạo liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links) của chúng tôi giải thích chi tiết cách triển khai liên kết.
