---
title: What is a web server?
slug: Learn_web_development/Howto/Web_mechanics/What_is_a_web_server
page-type: learn-faq
sidebar: learn-how-to
---

Trong bài viết này, chúng ta giải thích máy chủ web là gì, cách máy chủ web hoạt động và tại sao chúng quan trọng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn nên đã biết
        <a href="/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work"
          >Internet hoạt động như thế nào</a
        >, và
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Browsing_the_web"
          >hiểu sự khác biệt giữa trang web, website, máy chủ web
          và công cụ tìm kiếm</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Bạn sẽ tìm hiểu máy chủ web là gì và có hiểu biết chung về
        cách nó hoạt động.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt

Thuật ngữ _máy chủ web_ có thể chỉ phần cứng hoặc phần mềm, hoặc cả hai làm việc cùng nhau.

1. Về phần cứng, máy chủ web là một máy tính lưu trữ phần mềm máy chủ web và các file thành phần của website (ví dụ: các tài liệu HTML, hình ảnh, bảng định kiểu CSS và các file JavaScript). Máy chủ web kết nối với Internet và hỗ trợ trao đổi dữ liệu vật lý với các thiết bị khác kết nối vào web.
2. Về phần mềm, máy chủ web bao gồm một số phần kiểm soát cách người dùng web truy cập các file được lưu trữ. Ở mức tối thiểu, đây là một _máy chủ HTTP_. Máy chủ HTTP là phần mềm hiểu {{Glossary("URL","URL")}} (địa chỉ web) và {{Glossary("HTTP")}} (giao thức mà trình duyệt của bạn sử dụng để xem các trang web). Máy chủ HTTP có thể được truy cập thông qua tên miền của các website mà nó lưu trữ, và nó cung cấp nội dung của các website được lưu trữ này đến thiết bị của người dùng cuối.

Ở mức cơ bản nhất, bất cứ khi nào trình duyệt cần một file được lưu trữ trên máy chủ web, trình duyệt yêu cầu file thông qua HTTP. Khi yêu cầu đến đúng máy chủ web (phần cứng), _máy chủ HTTP_ (phần mềm) chấp nhận yêu cầu, tìm tài liệu được yêu cầu, và gửi lại cho trình duyệt, cũng thông qua HTTP. (Nếu máy chủ không tìm thấy tài liệu được yêu cầu, nó trả về phản hồi [404](/en-US/docs/Web/HTTP/Reference/Status/404) thay thế.)

![Biểu diễn cơ bản về kết nối client/server qua HTTP](web-server.svg)

Để xuất bản một website, bạn cần máy chủ web tĩnh hoặc động.

**Máy chủ web tĩnh**, hay ngăn xếp, bao gồm một máy tính (phần cứng) với máy chủ HTTP (phần mềm). Chúng ta gọi nó là "tĩnh" vì máy chủ gửi các file được lưu trữ của nó như nguyên bản đến trình duyệt của bạn.

**Máy chủ web động** bao gồm máy chủ web tĩnh cộng thêm phần mềm bổ sung, phổ biến nhất là _máy chủ ứng dụng_ và _cơ sở dữ liệu_. Chúng ta gọi nó là "động" vì máy chủ ứng dụng cập nhật các file được lưu trữ trước khi gửi nội dung đến trình duyệt của bạn qua máy chủ HTTP.

Ví dụ, để tạo ra các trang web cuối cùng bạn thấy trong trình duyệt, máy chủ ứng dụng có thể điền vào mẫu HTML với nội dung từ cơ sở dữ liệu. Các site như MDN hay Wikipedia có hàng nghìn trang web. Thông thường, các loại site này được tạo thành từ chỉ một vài mẫu HTML và một cơ sở dữ liệu lớn, thay vì hàng nghìn tài liệu HTML tĩnh. Thiết lập này giúp duy trì và phân phối nội dung dễ dàng hơn.

## Tìm hiểu sâu hơn

Để ôn lại: để tìm nạp một trang web, trình duyệt của bạn gửi yêu cầu đến máy chủ web, tìm kiếm file được yêu cầu trong không gian lưu trữ riêng của nó. Khi tìm thấy file, máy chủ đọc nó, xử lý khi cần, và gửi nó đến trình duyệt. Hãy xem xét các bước đó chi tiết hơn.

### Lưu trữ file

Đầu tiên, máy chủ web phải lưu trữ các file của website, cụ thể là tất cả các tài liệu HTML và các tài sản liên quan, bao gồm hình ảnh, bảng định kiểu CSS, file JavaScript, phông chữ và video.

Về mặt kỹ thuật, bạn có thể lưu trữ tất cả những file đó trên máy tính của riêng mình, nhưng việc lưu trữ file trên một máy chủ web chuyên dụng thuận tiện hơn nhiều vì:

- Máy chủ web chuyên dụng thường khả dụng hơn (hoạt động và chạy).
- Ngoại trừ thời gian chết và sự cố hệ thống, máy chủ web chuyên dụng luôn kết nối với Internet.
- Máy chủ web chuyên dụng có thể có cùng địa chỉ IP mọi lúc. Điều này được gọi là _địa chỉ IP chuyên dụng_. (Không phải tất cả {{Glossary("ISP", "ISPs")}} đều cung cấp địa chỉ IP cố định cho các đường dây gia đình.)
- Máy chủ web chuyên dụng thường được duy trì bởi bên thứ ba.

Vì tất cả những lý do này, việc tìm nhà cung cấp dịch vụ lưu trữ tốt là một phần quan trọng trong việc xây dựng website của bạn. Hãy xem xét các dịch vụ khác nhau mà các công ty cung cấp. Chọn một cái phù hợp với nhu cầu và ngân sách của bạn. (Các dịch vụ dao động từ miễn phí đến hàng nghìn đô la mỗi tháng.) Bạn có thể tìm thêm chi tiết [trong bài viết này](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/How_much_does_it_cost#hosting).

Khi bạn có dịch vụ lưu trữ web, bạn phải [tải lên các file của mình lên máy chủ web](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server).

### Giao tiếp qua HTTP

Thứ hai, máy chủ web cung cấp hỗ trợ cho {{Glossary("HTTP")}} (Giao thức Truyền Siêu Văn bản). Như tên gọi cho thấy, HTTP chỉ định cách truyền siêu văn bản (tài liệu web có liên kết) giữa hai máy tính.

{{Glossary("Protocol")}} là một tập hợp các quy tắc giao tiếp giữa hai máy tính. HTTP là giao thức văn bản, không có trạng thái.

- Văn bản
  - : Tất cả các lệnh đều là văn bản thuần túy và có thể đọc được.
- Không có trạng thái
  - : Cả máy chủ lẫn máy khách đều không nhớ các giao tiếp trước đó. Ví dụ, chỉ dựa vào HTTP, máy chủ không thể nhớ mật khẩu bạn đã nhập hay nhớ tiến trình của bạn trong một giao dịch chưa hoàn thành. Bạn cần máy chủ ứng dụng cho các tác vụ như vậy. (Chúng ta sẽ đề cập đến loại công nghệ đó trong các bài viết khác.)

HTTP cung cấp các quy tắc rõ ràng về cách máy khách và máy chủ giao tiếp.
Nếu bạn muốn tìm hiểu thêm, bạn có thể đọc [tài liệu HTTP](/en-US/docs/Web/HTTP).
Hiện tại, có một vài điều cần lưu ý:

- _Máy khách_ thực hiện các yêu cầu HTTP đến _máy chủ_. Máy chủ _phản hồi_ yêu cầu HTTP của _máy khách_.
- Khi yêu cầu file qua HTTP, máy khách phải cung cấp {{Glossary("URL")}} của file.
- Máy chủ web _phải trả lời_ mọi yêu cầu HTTP, ít nhất là với thông báo lỗi.

Trên một máy chủ web, máy chủ HTTP chịu trách nhiệm xử lý và trả lời các yêu cầu đến.

1. Khi nhận được yêu cầu, máy chủ HTTP kiểm tra xem URL được yêu cầu có khớp với file hiện có không.
2. Nếu có, máy chủ web gửi nội dung file trở lại trình duyệt. Nếu không, máy chủ sẽ kiểm tra xem có nên tạo file động cho yêu cầu không (xem [Nội dung tĩnh so với động](#static_vs._dynamic_content)).
3. Nếu không có lựa chọn nào khả thi, máy chủ web trả về thông báo lỗi cho trình duyệt, thường nhất là {{HTTPStatus("404", "404 Not Found")}}.
   Lỗi 404 rất phổ biến đến mức một số nhà thiết kế web dành khá nhiều thời gian và công sức để thiết kế các trang lỗi 404.
   ![Trang 404 của MDN như ví dụ về trang lỗi như vậy](mdn-404.jpg)

### Nội dung tĩnh so với nội dung động

Nói một cách tổng quan, máy chủ có thể phục vụ nội dung tĩnh hoặc động. Nhớ rằng thuật ngữ _tĩnh_ có nghĩa là "được phục vụ như nguyên bản". Các website tĩnh dễ thiết lập nhất, vì vậy chúng tôi đề xuất bạn làm site đầu tiên của mình là site tĩnh.

Thuật ngữ _động_ có nghĩa là máy chủ xử lý nội dung hoặc thậm chí tạo nó ngay lập tức từ cơ sở dữ liệu. Cách tiếp cận này cung cấp linh hoạt hơn, nhưng ngăn xếp kỹ thuật phức tạp hơn, làm cho việc xây dựng website trở nên khó khăn hơn đáng kể.

Không thể đề xuất một ứng dụng máy chủ duy nhất sẽ là giải pháp phù hợp cho mọi trường hợp sử dụng có thể. Một số máy chủ ứng dụng được thiết kế để lưu trữ và quản lý các blog, wiki hoặc giải pháp thương mại điện tử, trong khi những cái khác tổng quát hơn. Nếu bạn đang xây dựng website động, hãy dành thời gian nghiên cứu các yêu cầu của mình và tìm công nghệ phù hợp nhất với nhu cầu của bạn.

Hầu hết các nhà phát triển website sẽ không cần tạo máy chủ ứng dụng từ đầu, vì có rất nhiều giải pháp sẵn có, nhiều giải pháp trong số đó có thể cấu hình cao.
Nhưng nếu bạn cần tạo máy chủ của riêng mình, thì có thể bạn sẽ muốn sử dụng framework máy chủ, tận dụng mã và thư viện hiện có của nó, và chỉ mở rộng các phần bạn cần để đáp ứng trường hợp sử dụng của mình.
Chỉ một số lượng tương đối nhỏ các nhà phát triển nên cần phát triển máy chủ hoàn toàn từ đầu: ví dụ, để đáp ứng các ràng buộc tài nguyên chặt chẽ trên hệ thống nhúng.
Nếu bạn muốn thử nghiệm xây dựng máy chủ, hãy xem qua các tài nguyên trong lộ trình học [Lập trình website phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side).

## Các bước tiếp theo

Bây giờ bạn đã quen với máy chủ web, bạn có thể:

- đọc về [chi phí để làm gì đó trên web](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/How_much_does_it_cost)
- tìm hiểu thêm về [các phần mềm khác nhau bạn cần để tạo website](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_software_do_I_need)
- chuyển sang thứ gì đó thực tế hơn như [cách tải lên file trên máy chủ web](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server).
