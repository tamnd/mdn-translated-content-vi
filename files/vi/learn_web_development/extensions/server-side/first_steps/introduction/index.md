---
title: Giới thiệu về phía máy chủ
short-title: Giới thiệu
slug: Learn_web_development/Extensions/Server-side/First_steps/Introduction
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview", "Learn_web_development/Extensions/Server-side/First_steps")}}

Chào mừng đến với khóa học lập trình phía máy chủ dành cho người mới bắt đầu của MDN! Trong bài viết đầu tiên này, chúng ta nhìn vào lập trình phía máy chủ từ cấp độ cao, trả lời các câu hỏi như "nó là gì?", "nó khác như thế nào với lập trình phía máy khách?", và "tại sao nó lại hữu ích?". Sau khi đọc bài viết này, bạn sẽ hiểu sức mạnh bổ sung có sẵn cho các trang web thông qua lập trình phía máy chủ.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về máy chủ web là gì.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để làm quen với lập trình phía máy chủ là gì, nó có thể
        làm gì, và nó khác với lập trình phía máy khách như thế nào.
      </td>
    </tr>
  </tbody>
</table>

Hầu hết các trang web quy mô lớn sử dụng mã phía máy chủ để hiển thị động các dữ liệu khác nhau khi cần thiết, thường được lấy từ cơ sở dữ liệu được lưu trữ trên máy chủ và được gửi đến máy khách để hiển thị thông qua một số mã (ví dụ: HTML và JavaScript).

Có lẽ lợi ích quan trọng nhất của mã phía máy chủ là nó cho phép bạn điều chỉnh nội dung trang web cho từng người dùng. Các trang web động có thể làm nổi bật nội dung phù hợp hơn dựa trên sở thích và thói quen của người dùng. Nó cũng có thể làm cho các trang web dễ sử dụng hơn bằng cách lưu trữ các tùy chọn và thông tin cá nhân — ví dụ, tái sử dụng thông tin thẻ tín dụng đã lưu để đơn giản hóa các thanh toán tiếp theo.

Nó thậm chí có thể cho phép tương tác với người dùng của trang web, gửi thông báo và cập nhật qua email hoặc qua các kênh khác. Tất cả những khả năng này cho phép tương tác sâu hơn nhiều với người dùng.

Trong thế giới phát triển web hiện đại, việc học về phát triển phía máy chủ được khuyến khích cao.

## Lập trình trang web phía máy chủ là gì?

Trình duyệt web giao tiếp với [máy chủ web](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server) bằng cách sử dụng Giao thức truyền siêu văn bản **H**yper**T**ext **T**ransfer **P**rotocol ({{glossary("HTTP")}}). Khi bạn nhấp vào một liên kết trên trang web, gửi biểu mẫu, hoặc chạy tìm kiếm, một **yêu cầu HTTP** được gửi từ trình duyệt của bạn đến máy chủ đích.

Yêu cầu bao gồm một URL xác định tài nguyên bị ảnh hưởng, một phương thức xác định hành động cần thiết (ví dụ: để GET, xóa, hoặc đăng tài nguyên), và có thể bao gồm thông tin bổ sung được mã hóa trong các tham số URL (các cặp field-value được gửi qua [chuỗi truy vấn](https://en.wikipedia.org/wiki/Query_string)), dưới dạng dữ liệu POST (dữ liệu được gửi bởi [phương thức HTTP POST](/en-US/docs/Web/HTTP/Reference/Methods/POST)), hoặc trong {{glossary("Cookie", "cookie")}} liên quan.

Máy chủ web chờ các thông điệp yêu cầu từ máy khách, xử lý chúng khi chúng đến, và trả lời trình duyệt web với một thông điệp **phản hồi HTTP**. Phản hồi chứa một dòng trạng thái cho biết yêu cầu có thành công hay không (ví dụ: "HTTP/1.1 200 OK" cho thành công).

Phần thân của phản hồi thành công cho một yêu cầu sẽ chứa tài nguyên được yêu cầu (ví dụ: một trang HTML mới, hoặc một hình ảnh), sau đó có thể được hiển thị bởi trình duyệt web.

### Trang web tĩnh

Sơ đồ dưới đây cho thấy kiến trúc máy chủ web cơ bản cho _trang web tĩnh_ (trang web tĩnh là trang luôn trả về cùng nội dung cố định từ máy chủ bất cứ khi nào một tài nguyên cụ thể được yêu cầu). Khi người dùng muốn điều hướng đến một trang, trình duyệt gửi yêu cầu HTTP "GET" chỉ định URL của nó.

Máy chủ lấy tài liệu được yêu cầu từ hệ thống tệp của nó và trả về phản hồi HTTP chứa tài liệu và [trạng thái thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) (thường là 200 OK). Nếu tệp không thể được lấy vì một lý do nào đó, trạng thái lỗi được trả về (xem [phản hồi lỗi máy khách](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) và [phản hồi lỗi máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses)).

![Sơ đồ đơn giản hóa của máy chủ web tĩnh.](basic_static_app_server.png)

### Trang web động

Trang web động là trang mà một số nội dung phản hồi được tạo ra _động_, chỉ khi cần thiết. Trên trang web động, các trang HTML thường được tạo bằng cách chèn dữ liệu từ cơ sở dữ liệu vào các trình giữ chỗ trong các mẫu HTML (đây là cách lưu trữ lượng lớn nội dung hiệu quả hơn nhiều so với việc sử dụng các trang web tĩnh).

Trang web động có thể trả về dữ liệu khác nhau cho một URL dựa trên thông tin được cung cấp bởi người dùng hoặc các tùy chọn đã lưu và có thể thực hiện các thao tác khác như một phần của việc trả về phản hồi (ví dụ: gửi thông báo).

Hầu hết mã để hỗ trợ trang web động phải chạy trên máy chủ. Việc tạo mã này được gọi là "**lập trình phía máy chủ**" (hoặc đôi khi là "**back-end scripting**").

Sơ đồ dưới đây cho thấy kiến trúc cho _trang web động_. Như trong sơ đồ trước, trình duyệt gửi các yêu cầu HTTP đến máy chủ, sau đó máy chủ xử lý các yêu cầu và trả về các phản hồi HTTP thích hợp.

Các yêu cầu cho tài nguyên _tĩnh_ được xử lý theo cùng cách như đối với các trang tĩnh (tài nguyên tĩnh là bất kỳ tệp nào không thay đổi — thường là: CSS, JavaScript, Hình ảnh, tệp PDF được tạo trước, v.v.).

![Sơ đồ đơn giản hóa của máy chủ web sử dụng lập trình phía máy chủ để lấy thông tin từ cơ sở dữ liệu và xây dựng HTML từ các mẫu. Đây là cùng sơ đồ như trong tổng quan Client-Server.](web_application_with_html_and_steps.png)

Các yêu cầu cho tài nguyên động thay vào đó được chuyển tiếp (2) đến mã phía máy chủ (hiển thị trong sơ đồ là _Ứng dụng Web_). Đối với "yêu cầu động" máy chủ diễn giải yêu cầu, đọc thông tin cần thiết từ cơ sở dữ liệu (3), kết hợp dữ liệu đã lấy với các mẫu HTML (4), và gửi lại phản hồi chứa HTML được tạo ra (5,6).

## Lập trình phía máy chủ và phía máy khách có giống nhau không?

Bây giờ hãy chú ý đến mã liên quan trong lập trình phía máy chủ và phía máy khách. Trong mỗi trường hợp, mã khác biệt đáng kể:

- Chúng có mục đích và mối quan tâm khác nhau.
- Chúng thường không sử dụng cùng ngôn ngữ lập trình (ngoại lệ là JavaScript, có thể được sử dụng ở cả phía máy chủ và máy khách).
- Chúng chạy trong các môi trường hệ điều hành khác nhau.

Mã chạy trong trình duyệt được gọi là **mã phía máy khách** và chủ yếu liên quan đến việc cải thiện giao diện và hành vi của trang web được hiển thị. Điều này bao gồm việc chọn và tạo kiểu các thành phần UI, tạo bố cục, điều hướng, xác thực biểu mẫu, v.v. Ngược lại, lập trình trang web phía máy chủ chủ yếu liên quan đến việc chọn _nội dung nào_ được trả về cho trình duyệt để đáp ứng các yêu cầu. Mã phía máy chủ xử lý các tác vụ như xác thực dữ liệu và yêu cầu được gửi, sử dụng cơ sở dữ liệu để lưu trữ và lấy dữ liệu và gửi đúng dữ liệu đến máy khách theo yêu cầu.

Mã phía máy khách được viết bằng [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), và [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) — nó được chạy trong trình duyệt web và có ít hoặc không có quyền truy cập vào hệ điều hành bên dưới (bao gồm quyền truy cập hạn chế vào hệ thống tệp).

Các nhà phát triển web không thể kiểm soát trình duyệt mà mọi người dùng có thể sử dụng để xem trang web — các trình duyệt cung cấp các mức độ tương thích khác nhau với các tính năng mã phía máy khách, và một phần của thách thức của lập trình phía máy khách là xử lý sự khác biệt về hỗ trợ trình duyệt một cách uyển chuyển.

Mã phía máy chủ có thể được viết bằng bất kỳ số lượng ngôn ngữ lập trình nào — ví dụ về các ngôn ngữ web phía máy chủ phổ biến bao gồm PHP, Python, Ruby, C#, và JavaScript (NodeJS). Mã phía máy chủ có toàn quyền truy cập vào hệ điều hành máy chủ và nhà phát triển có thể chọn ngôn ngữ lập trình nào (và phiên bản cụ thể) họ muốn sử dụng.

Các nhà phát triển thường viết mã của họ bằng cách sử dụng **framework web**. Các framework web là các bộ sưu tập hàm, đối tượng, quy tắc và các cấu trúc mã khác được thiết kế để giải quyết các vấn đề phổ biến, tăng tốc phát triển, và đơn giản hóa các loại tác vụ khác nhau trong một lĩnh vực cụ thể.

Một lần nữa, mặc dù cả mã phía máy khách và phía máy chủ đều sử dụng framework, các lĩnh vực rất khác nhau, và do đó các framework cũng vậy. Các framework web phía máy khách đơn giản hóa các tác vụ bố cục và trình bày trong khi các framework web phía máy chủ cung cấp rất nhiều chức năng máy chủ web "phổ biến" mà bạn có thể phải tự triển khai (ví dụ: hỗ trợ cho phiên làm việc, hỗ trợ người dùng và xác thực, truy cập cơ sở dữ liệu dễ dàng, thư viện mẫu, v.v.).

> [!NOTE]
> Các framework phía máy khách thường được sử dụng để giúp tăng tốc phát triển mã phía máy khách, nhưng bạn cũng có thể chọn viết tất cả mã bằng tay; trên thực tế, viết mã bằng tay có thể nhanh hơn và hiệu quả hơn nếu bạn chỉ cần một giao diện người dùng trang web nhỏ, đơn giản.
>
> Ngược lại, bạn거의 sẽ không bao giờ cân nhắc viết thành phần phía máy chủ của ứng dụng web mà không có framework — việc triển khai một tính năng quan trọng như máy chủ HTTP thực sự rất khó từ đầu trong Python, nhưng các framework web Python như Django cung cấp điều đó ngay từ đầu, cùng với các công cụ rất hữu ích khác.

## Bạn có thể làm gì ở phía máy chủ?

Lập trình phía máy chủ rất hữu ích vì nó cho phép chúng ta _hiệu quả_ cung cấp thông tin được điều chỉnh cho từng người dùng và do đó tạo ra trải nghiệm người dùng tốt hơn nhiều.

Các công ty như Amazon sử dụng lập trình phía máy chủ để xây dựng kết quả tìm kiếm cho sản phẩm, đưa ra gợi ý sản phẩm mục tiêu dựa trên sở thích và thói quen mua hàng trước đây của khách hàng, đơn giản hóa việc mua hàng, v.v.

Các ngân hàng sử dụng lập trình phía máy chủ để lưu trữ thông tin tài khoản và chỉ cho phép người dùng được phép xem và thực hiện giao dịch. Các dịch vụ khác như Facebook, Twitter, Instagram, và Wikipedia sử dụng lập trình phía máy chủ để làm nổi bật, chia sẻ và kiểm soát quyền truy cập vào nội dung thú vị.

Một số cách sử dụng phổ biến và lợi ích của lập trình phía máy chủ được liệt kê dưới đây. Bạn sẽ lưu ý rằng có một số chồng chéo!

### Lưu trữ và phân phối thông tin hiệu quả

Hãy tưởng tượng có bao nhiêu sản phẩm được bán trên Amazon, và hãy tưởng tượng có bao nhiêu bài đăng đã được viết trên Facebook? Tạo một trang tĩnh riêng biệt cho mỗi sản phẩm hoặc bài đăng sẽ hoàn toàn không thực tế.

Lập trình phía máy chủ cho phép chúng ta thay vào đó lưu trữ thông tin trong cơ sở dữ liệu và xây dựng và trả về HTML và các loại tệp khác (ví dụ: PDF, hình ảnh, v.v.) một cách động. Cũng có thể trả về dữ liệu ({{glossary("JSON")}}, {{glossary("XML")}}, v.v.) để hiển thị bởi các framework web phía máy khách thích hợp (điều này giảm tải xử lý trên máy chủ và lượng dữ liệu cần gửi).

Máy chủ không bị giới hạn trong việc gửi thông tin từ cơ sở dữ liệu, và thay vào đó có thể trả về kết quả của các công cụ phần mềm, hoặc dữ liệu từ các dịch vụ truyền thông. Nội dung thậm chí có thể được nhắm mục tiêu cho loại thiết bị khách đang nhận nó.

Vì thông tin trong cơ sở dữ liệu, nó cũng có thể dễ dàng được chia sẻ và cập nhật với các hệ thống kinh doanh khác (ví dụ: khi sản phẩm được bán trực tuyến hoặc trong cửa hàng, cửa hàng có thể cập nhật cơ sở dữ liệu tồn kho của mình).

> [!NOTE]
> Trí tưởng tượng của bạn không cần phải làm việc nhiều để thấy lợi ích của mã phía máy chủ cho việc lưu trữ và phân phối thông tin hiệu quả:
>
> 1. Đến [Amazon](https://www.amazon.com/) hoặc một trang web thương mại điện tử khác.
> 2. Tìm kiếm một số từ khóa và lưu ý cách cấu trúc trang không thay đổi, ngay cả khi kết quả thay đổi.
> 3. Mở hai hoặc ba sản phẩm khác nhau. Lưu ý lần nữa cách chúng có cùng cấu trúc và bố cục, nhưng nội dung cho các sản phẩm khác nhau đã được lấy từ cơ sở dữ liệu.
>
> Đối với một thuật ngữ tìm kiếm phổ biến ("cá", chẳng hạn) bạn có thể thấy hàng triệu giá trị được trả về. Sử dụng cơ sở dữ liệu cho phép những thứ này được lưu trữ và chia sẻ hiệu quả, và nó cho phép trình bày thông tin được kiểm soát ở chỉ một nơi.

### Trải nghiệm người dùng tùy chỉnh

Máy chủ có thể lưu trữ và sử dụng thông tin về khách hàng để cung cấp trải nghiệm người dùng thuận tiện và phù hợp. Ví dụ, nhiều trang web lưu trữ thẻ tín dụng để thông tin không phải nhập lại. Các trang web như Google Maps có thể sử dụng vị trí đã lưu hoặc hiện tại để cung cấp thông tin định tuyến, và lịch sử tìm kiếm hoặc du lịch để làm nổi bật các doanh nghiệp địa phương trong kết quả tìm kiếm.

Một phân tích sâu hơn về thói quen của người dùng có thể được sử dụng để dự đoán sở thích của họ và cá nhân hóa thêm các phản hồi và thông báo, ví dụ: cung cấp danh sách các địa điểm đã truy cập trước đây hoặc phổ biến mà bạn có thể muốn xem trên bản đồ.

> [!NOTE]
> [Google Maps](https://www.google.com/maps) lưu lịch sử tìm kiếm và ghé thăm của bạn. Các địa điểm được ghé thăm thường xuyên hoặc được tìm kiếm thường xuyên được làm nổi bật hơn các địa điểm khác.
>
> Kết quả tìm kiếm của Google được tối ưu hóa dựa trên các tìm kiếm trước đây.
>
> 1. Đến [Tìm kiếm Google](https://www.google.com/).
> 2. Tìm kiếm "bóng đá".
> 3. Bây giờ thử gõ "yêu thích" vào hộp tìm kiếm và quan sát các dự đoán tìm kiếm tự động hoàn thành.
>
> Trùng hợp? Không!

### Kiểm soát quyền truy cập vào nội dung

Lập trình phía máy chủ cho phép các trang web hạn chế quyền truy cập cho người dùng được phép và chỉ phục vụ thông tin mà người dùng được phép xem.

Các ví dụ thực tế bao gồm các trang mạng xã hội cho phép người dùng xác định ai có thể xem nội dung họ đăng lên trang, và nội dung nào xuất hiện trong feed của họ.

> [!NOTE]
> Hãy xem xét các ví dụ thực tế khác nơi quyền truy cập vào nội dung được kiểm soát. Ví dụ, bạn có thể thấy gì nếu bạn vào trang trực tuyến của ngân hàng của bạn? Đăng nhập vào tài khoản của bạn — bạn có thể xem và sửa đổi thêm thông tin gì? Bạn có thể xem thông tin gì mà chỉ ngân hàng có thể thay đổi?

### Lưu trữ thông tin phiên/trạng thái

Lập trình phía máy chủ cho phép các nhà phát triển tận dụng **phiên làm việc** — về cơ bản là cơ chế cho phép máy chủ lưu trữ thông tin liên quan đến người dùng hiện tại của trang web và gửi các phản hồi khác nhau dựa trên thông tin đó.

Điều này cho phép, ví dụ, một trang web biết rằng người dùng đã đăng nhập trước đó và hiển thị liên kết đến email hoặc lịch sử đơn hàng của họ, hoặc có thể lưu trạng thái của một trò chơi đơn giản để người dùng có thể quay lại trang web và tiếp tục từ nơi họ dừng lại.

> [!NOTE]
> Truy cập trang web báo có mô hình đăng ký và mở một loạt tab (ví dụ: [The Age](https://www.theage.com.au/)). Tiếp tục truy cập trang web trong vài giờ/ngày. Cuối cùng, bạn sẽ bắt đầu được chuyển hướng đến các trang giải thích cách đăng ký, và bạn sẽ không thể truy cập bài viết. Thông tin này là ví dụ về thông tin phiên được lưu trong cookie.

### Thông báo và giao tiếp

Máy chủ có thể gửi thông báo chung hoặc dành cho người dùng cụ thể thông qua trang web, qua email, SMS, tin nhắn tức thì, cuộc trò chuyện video, hoặc các dịch vụ truyền thông khác.

Một số ví dụ bao gồm:

- Facebook và Twitter gửi email và tin nhắn SMS để thông báo cho bạn về các thông tin liên lạc mới.
- Amazon thường xuyên gửi email sản phẩm đề xuất các sản phẩm tương tự với những gì đã mua hoặc xem mà bạn có thể quan tâm.
- Máy chủ web có thể gửi thông điệp cảnh báo cho quản trị viên trang web thông báo cho họ về bộ nhớ thấp trên máy chủ, hoặc hoạt động người dùng đáng ngờ.

> [!NOTE]
> Loại thông báo phổ biến nhất là "xác nhận đăng ký". Chọn hầu hết bất kỳ trang web lớn mà bạn quan tâm (Google, Amazon, Instagram, v.v.) và tạo tài khoản mới bằng địa chỉ email của bạn. Bạn sẽ sớm nhận được email xác nhận đăng ký của bạn, hoặc yêu cầu xác nhận để kích hoạt tài khoản của bạn.

### Phân tích dữ liệu

Trang web có thể thu thập nhiều dữ liệu về người dùng: những gì họ tìm kiếm, những gì họ mua, những gì họ đề xuất, thời gian họ ở trên mỗi trang. Lập trình phía máy chủ có thể được sử dụng để cải thiện các phản hồi dựa trên phân tích dữ liệu này.

Ví dụ, cả Amazon và Google đều quảng cáo sản phẩm dựa trên các tìm kiếm trước đây (và mua hàng).

> [!NOTE]
> Nếu bạn là người dùng Facebook, hãy truy cập feed chính của bạn và nhìn vào luồng bài đăng. Lưu ý cách một số bài đăng không theo thứ tự số - đặc biệt, các bài đăng có nhiều "like" thường cao hơn trong danh sách hơn các bài đăng gần đây hơn.
>
> Cũng xem loại quảng cáo nào bạn đang được hiển thị — bạn có thể thấy quảng cáo cho những thứ bạn đã xem trên các trang web khác. Thuật toán của Facebook để làm nổi bật nội dung và quảng cáo có thể là một bí ẩn, nhưng rõ ràng nó phụ thuộc vào likes và thói quen xem của bạn!

## Tóm tắt

Xin chúc mừng, bạn đã đến cuối bài viết đầu tiên về lập trình phía máy chủ.

Bây giờ bạn đã học được rằng mã phía máy chủ được chạy trên máy chủ web và vai trò chính của nó là kiểm soát _thông tin nào_ được gửi đến người dùng (trong khi mã phía máy khách chủ yếu xử lý cấu trúc và trình bày dữ liệu đó cho người dùng).

Bạn cũng nên hiểu rằng nó hữu ích vì nó cho phép chúng ta tạo ra các trang web _hiệu quả_ cung cấp thông tin được điều chỉnh cho từng người dùng và có ý tưởng tốt về một số điều bạn có thể có thể làm khi bạn là lập trình viên phía máy chủ.

Cuối cùng, bạn nên hiểu rằng mã phía máy chủ có thể được viết bằng một số ngôn ngữ lập trình và rằng bạn nên sử dụng framework web để làm cho toàn bộ quá trình dễ dàng hơn.

Trong một bài viết tương lai, chúng ta sẽ giúp bạn chọn framework web tốt nhất cho trang đầu tiên của bạn. Ở đây chúng ta sẽ đưa bạn qua các tương tác client-server chính với chi tiết hơn một chút.

{{NextMenu("Learn_web_development/Extensions/Server-side/First_steps/Client-Server_overview", "Learn_web_development/Extensions/Server-side/First_steps")}}
