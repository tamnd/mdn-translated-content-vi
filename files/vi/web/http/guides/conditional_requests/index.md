---
title: Yêu cầu có điều kiện HTTP
short-title: Yêu cầu có điều kiện
slug: Web/HTTP/Guides/Conditional_requests
page-type: guide
sidebar: http
---

HTTP có khái niệm _yêu cầu có điều kiện_, trong đó kết quả, và thậm chí cả sự thành công của yêu cầu, có thể được kiểm soát bằng cách so sánh các tài nguyên bị ảnh hưởng với một _trình xác nhận_.
Những yêu cầu này hữu ích để xác nhận nội dung đã lưu vào bộ nhớ đệm, đảm bảo rằng nó chỉ được tải về nếu nó khác với bản sao đã có sẵn cho trình duyệt.
Yêu cầu có điều kiện cũng hữu ích để đảm bảo tính toàn vẹn của tài liệu khi tiếp tục tải xuống, hoặc ngăn chặn mất cập nhật khi tải lên hoặc sửa đổi tài liệu trên máy chủ.

## Nguyên tắc

Các yêu cầu có điều kiện HTTP là các yêu cầu được thực thi khác nhau, tùy thuộc vào giá trị của các tiêu đề cụ thể. Các tiêu đề này định nghĩa một điều kiện tiên quyết, và kết quả của yêu cầu sẽ khác nhau nếu điều kiện tiên quyết được khớp hay không.

Các hành vi khác nhau được định nghĩa bởi phương thức của yêu cầu được sử dụng, và bởi tập hợp tiêu đề được sử dụng cho điều kiện tiên quyết:

- đối với các phương thức {{glossary("Safe/HTTP", "an toàn")}}, như {{HTTPMethod("GET")}}, thường cố gắng tải một tài liệu, yêu cầu có điều kiện có thể được sử dụng để gửi lại tài liệu, nếu phù hợp. Do đó, điều này tiết kiệm băng thông.
- đối với các phương thức {{glossary("Safe/HTTP", "không an toàn")}}, như {{HTTPMethod("PUT")}}, thường tải lên tài liệu, yêu cầu có điều kiện có thể được sử dụng để tải lên tài liệu, chỉ khi tài liệu gốc nó dựa vào giống với tài liệu được lưu trữ trên máy chủ.

## Trình xác nhận

Tất cả tiêu đề có điều kiện cố gắng kiểm tra xem tài nguyên được lưu trữ trên máy chủ có khớp với một phiên bản cụ thể hay không. Để đạt được điều này, các yêu cầu có điều kiện cần chỉ định phiên bản của tài nguyên. Vì so sánh toàn bộ tài nguyên byte theo byte là không thực tế, và không phải lúc nào cũng là điều mong muốn, yêu cầu truyền tải một giá trị mô tả phiên bản. Những giá trị như vậy được gọi là _trình xác nhận_, và có hai loại:

- ngày sửa đổi cuối cùng của tài liệu, ngày _last-modified_.
- một chuỗi mờ, xác định duy nhất mỗi phiên bản, được gọi là _entity tag_, hay _ETag_.

So sánh các phiên bản của cùng một tài nguyên hơi phức tạp: tùy thuộc vào ngữ cảnh, có hai loại _kiểm tra tính bằng nhau_:

- _Xác nhận mạnh_ được sử dụng khi byte theo byte được mong đợi, ví dụ khi tiếp tục tải xuống.
- _Xác nhận yếu_ được sử dụng khi user-agent chỉ cần xác định nếu hai tài nguyên có cùng nội dung. Các tài nguyên có thể được coi là giống nhau ngay cả khi có sự khác biệt nhỏ, chẳng hạn như quảng cáo khác nhau hoặc chân trang với ngày khác nhau.

Loại xác nhận độc lập với trình xác nhận được sử dụng. Cả {{HTTPHeader("Last-Modified")}} và {{HTTPHeader("ETag")}} đều cho phép cả hai loại xác nhận, mặc dù độ phức tạp để triển khai nó ở phía máy chủ có thể thay đổi. HTTP sử dụng xác nhận mạnh theo mặc định, và chỉ định khi nào có thể sử dụng xác nhận yếu.

### Xác nhận mạnh

Xác nhận mạnh bao gồm việc đảm bảo rằng tài nguyên, byte theo byte, giống hệt với tài nguyên nó được so sánh. Điều này là bắt buộc đối với một số tiêu đề có điều kiện, và là mặc định cho các tiêu đề khác. Xác nhận mạnh rất nghiêm ngặt và có thể khó đảm bảo ở cấp máy chủ, nhưng nó đảm bảo không mất dữ liệu bất kỳ lúc nào, đôi khi với cái giá là hiệu suất.

Rất khó để có định danh duy nhất cho xác nhận mạnh với {{HTTPHeader("Last-Modified")}}. Thường điều này được thực hiện bằng cách sử dụng {{HTTPHeader("ETag")}} với băm MD5 của tài nguyên (hoặc một dẫn xuất).

> [!NOTE]
> Vì thay đổi mã hóa nội dung yêu cầu thay đổi ETag, một số máy chủ sửa đổi ETag khi nén các phản hồi từ máy chủ nguồn (reverse proxy, chẳng hạn).
> Máy chủ Apache thêm tên phương thức nén (`-gzip`) vào ETag theo mặc định, nhưng điều này [có thể cấu hình bằng chỉ thị `DeflateAlterETag`](https://httpd.apache.org/docs/2.4/mod/mod_deflate.html).

### Xác nhận yếu

Xác nhận yếu khác với xác nhận mạnh, vì nó coi hai phiên bản của tài liệu là giống nhau nếu nội dung tương đương. Ví dụ, một trang sẽ khác với trang khác chỉ bởi ngày khác nhau trong chân trang của nó, hoặc quảng cáo khác nhau, sẽ được coi là _giống hệt_ với trang kia với xác nhận yếu. Hai phiên bản giống nhau này được coi là _khác nhau_ khi sử dụng xác nhận mạnh. Xây dựng hệ thống ETag sử dụng xác nhận yếu rất hữu ích để tối ưu hóa hiệu suất bộ nhớ đệm, nhưng có thể phức tạp, vì nó đòi hỏi biết tầm quan trọng của các phần tử khác nhau của trang.

## Tiêu đề có điều kiện

Một số tiêu đề HTTP, được gọi là tiêu đề có điều kiện, dẫn đến các yêu cầu có điều kiện. Đây là:

- {{HTTPHeader("If-Match")}}
  - : Thành công nếu {{HTTPHeader("ETag")}} của tài nguyên từ xa bằng một trong những ETag được liệt kê trong tiêu đề này. Nó thực hiện xác nhận mạnh.
- {{HTTPHeader("If-None-Match")}}
  - : Thành công nếu {{HTTPHeader("ETag")}} của tài nguyên từ xa khác với mỗi ETag được liệt kê trong tiêu đề này. Nó thực hiện xác nhận yếu.
- {{HTTPHeader("If-Modified-Since")}}
  - : Thành công nếu ngày {{HTTPHeader("Last-Modified")}} của tài nguyên từ xa gần đây hơn ngày được cho trong tiêu đề này.
- {{HTTPHeader("If-Unmodified-Since")}}
  - : Thành công nếu ngày {{HTTPHeader("Last-Modified")}} của tài nguyên từ xa cũ hơn hoặc bằng ngày được cho trong tiêu đề này.
- {{HTTPHeader("If-Range")}}
  - : Tương tự như {{HTTPHeader("If-Match")}}, hoặc {{HTTPHeader("If-Unmodified-Since")}}, nhưng chỉ có thể có một ETag duy nhất hoặc một ngày. Nếu thất bại, yêu cầu phạm vi thất bại, và thay vì phản hồi {{HTTPStatus("206", "206 Partial Content")}}, một {{HTTPStatus("200", "200 OK")}} được gửi với tài nguyên hoàn chỉnh.

## Các trường hợp sử dụng

### Cập nhật bộ nhớ đệm

Trường hợp sử dụng phổ biến nhất cho các yêu cầu có điều kiện là cập nhật bộ nhớ đệm. Với bộ nhớ đệm trống, hoặc không có bộ nhớ đệm, tài nguyên được yêu cầu được gửi lại với trạng thái {{HTTPStatus("200")}} `OK`.

![Yêu cầu được đưa ra khi bộ nhớ đệm trống kích hoạt việc tải xuống tài nguyên, với cả hai giá trị trình xác nhận được gửi dưới dạng tiêu đề. Bộ nhớ đệm sau đó được điền.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/cache-sequence-1.svg)

Cùng với tài nguyên, các trình xác nhận được gửi trong tiêu đề. Trong ví dụ này, cả {{HTTPHeader("Last-Modified")}} và {{HTTPHeader("ETag")}} đều được gửi, nhưng cũng có thể chỉ một trong số chúng. Các trình xác nhận này được lưu vào bộ nhớ đệm với tài nguyên (như tất cả tiêu đề) và sẽ được sử dụng để tạo các yêu cầu có điều kiện, khi bộ nhớ đệm trở nên cũ.

Miễn là bộ nhớ đệm không cũ, không có yêu cầu nào được đưa ra cả. Nhưng một khi nó đã trở nên cũ, điều này chủ yếu được kiểm soát bởi tiêu đề {{HTTPHeader("Cache-Control")}}, client không sử dụng giá trị được lưu vào bộ nhớ đệm trực tiếp mà đưa ra _yêu cầu có điều kiện_. Giá trị của trình xác nhận được sử dụng như tham số của các tiêu đề {{HTTPHeader("If-Modified-Since")}} và {{HTTPHeader("If-None-Match")}}.

Nếu tài nguyên không thay đổi, máy chủ gửi lại phản hồi {{HTTPStatus("304")}} `Not Modified`. Điều này làm cho bộ nhớ đệm mới lại, và client sử dụng tài nguyên đã lưu vào bộ nhớ đệm. Mặc dù có vòng lặp yêu cầu/phản hồi tiêu thụ một số tài nguyên, điều này hiệu quả hơn so với truyền lại toàn bộ tài nguyên qua mạng.

![Với bộ nhớ đệm cũ, yêu cầu có điều kiện được gửi. Máy chủ có thể xác định xem tài nguyên có thay đổi không, và, như trong trường hợp này, quyết định không gửi lại vì nó giống nhau.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/cache-sequence-2.svg)

Nếu tài nguyên đã thay đổi, máy chủ chỉ gửi lại phản hồi {{HTTPStatus("200", "200 OK")}}, với phiên bản mới của tài nguyên (như thể yêu cầu không có điều kiện).
Client sử dụng tài nguyên mới này (và lưu nó vào bộ nhớ đệm).

![Trong trường hợp tài nguyên đã thay đổi, nó được gửi lại như thể yêu cầu không có điều kiện.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/cache-sequence-3.svg)

Ngoài việc đặt các trình xác nhận ở phía máy chủ, cơ chế này trong suốt: tất cả các trình duyệt quản lý bộ nhớ đệm và gửi các yêu cầu có điều kiện như vậy mà không cần bất kỳ công việc đặc biệt nào từ các nhà phát triển Web.

### Tính toàn vẹn của việc tải xuống một phần

Tải xuống một phần tệp là một chức năng của HTTP cho phép tiếp tục các hoạt động trước đó, tiết kiệm băng thông và thời gian, bằng cách giữ thông tin đã lấy được:

![Việc tải xuống đã bị dừng và chỉ nội dung một phần đã được truy xuất.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/resume-download-1.svg)

Máy chủ hỗ trợ tải xuống một phần thông báo điều này bằng cách gửi tiêu đề {{HTTPHeader("Accept-Ranges")}}. Một khi điều này xảy ra, client có thể tiếp tục tải xuống bằng cách gửi tiêu đề {{HTTPHeader("Range")}} với các phạm vi còn thiếu:

![Client tiếp tục các yêu cầu bằng cách chỉ ra phạm vi cần và điều kiện tiên quyết kiểm tra các trình xác nhận của yêu cầu được lấy một phần.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/resume-download-2.svg)

Nguyên tắc đơn giản, nhưng có một vấn đề tiềm ẩn: nếu tài nguyên được tải xuống đã bị sửa đổi giữa cả hai lần tải xuống, các phạm vi thu được sẽ tương ứng với hai phiên bản khác nhau của tài nguyên, và tài liệu cuối cùng sẽ bị hỏng.

Để ngăn chặn điều này, các yêu cầu có điều kiện được sử dụng. Đối với các phạm vi, có hai cách để làm điều này. Cách linh hoạt hơn sử dụng {{HTTPHeader("If-Unmodified-Since")}} và {{HTTPHeader("If-Match")}} và máy chủ trả về lỗi nếu điều kiện tiên quyết thất bại; client sau đó khởi động lại việc tải xuống từ đầu:

![Khi tài nguyên được tải xuống một phần đã bị sửa đổi, các điều kiện tiên quyết sẽ thất bại và tài nguyên sẽ phải được tải xuống lại hoàn toàn.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/resume-download-3.svg)

Mặc dù phương pháp này hoạt động, nó thêm một trao đổi phản hồi/yêu cầu bổ sung khi tài liệu đã thay đổi. Điều này làm giảm hiệu suất, và HTTP có tiêu đề cụ thể để tránh tình huống này: {{HTTPHeader("If-Range")}}:

![Tiêu đề If-Range cho phép máy chủ trực tiếp gửi lại tài nguyên hoàn chỉnh nếu nó đã bị sửa đổi, không cần gửi lỗi 412 và chờ client khởi tạo lại tải xuống.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/resume-download-4.svg)

Giải pháp này hiệu quả hơn, nhưng kém linh hoạt hơn một chút, vì chỉ có thể sử dụng một ETag trong điều kiện. Hiếm khi cần thêm sự linh hoạt như vậy.

### Tránh vấn đề mất cập nhật với khóa lạc quan

Một hoạt động phổ biến trong các ứng dụng Web là _cập nhật_ tài liệu từ xa. Điều này rất phổ biến trong bất kỳ hệ thống tệp hoặc ứng dụng kiểm soát nguồn nào, nhưng bất kỳ ứng dụng nào cho phép lưu trữ tài nguyên từ xa đều cần cơ chế như vậy. Các trang web phổ biến, như wiki và CMS khác, có nhu cầu như vậy.

Với phương thức {{HTTPMethod("PUT")}}, bạn có thể triển khai điều này. Client đầu tiên đọc các tệp gốc, sửa đổi chúng, và cuối cùng đẩy chúng lên máy chủ:

![Cập nhật tệp bằng PUT khi không có sự đồng thời.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/optimistic-locking-1.svg)

Thật không may, mọi thứ trở nên không chính xác một chút khi chúng ta tính đến sự đồng thời. Trong khi client đang sửa đổi cục bộ bản sao mới của tài nguyên, client thứ hai có thể tải tài nguyên giống nhau và làm điều tương tự trên bản sao của nó. Điều xảy ra tiếp theo rất đáng tiếc: khi họ commit lại lên máy chủ, các sửa đổi từ client đầu tiên bị loại bỏ bởi lần đẩy của client tiếp theo, vì client thứ hai không biết về các thay đổi của client đầu tiên đối với tài nguyên. Quyết định ai thắng không được truyền đạt cho bên kia. Các thay đổi của client nào sẽ được giữ, sẽ thay đổi theo tốc độ họ commit; điều này phụ thuộc vào hiệu suất của client, máy chủ, và thậm chí cả con người chỉnh sửa tài liệu tại client. Người thắng sẽ thay đổi từ lần này sang lần khác. Đây là _race condition_ và dẫn đến các hành vi có vấn đề, khó phát hiện và gỡ lỗi:

![Khi nhiều client cập nhật cùng một tài nguyên song song, chúng ta đang đối mặt với race condition: cái chậm nhất thắng, và những cái khác thậm chí không biết rằng họ đã thua. Có vấn đề!](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/optimistic-locking-2.svg)

Không có cách nào để giải quyết vấn đề này mà không làm phiền một trong hai client. Tuy nhiên, mất cập nhật và race condition cần được tránh. Chúng ta muốn kết quả có thể dự đoán, và mong đợi rằng các client được thông báo khi các thay đổi của họ bị từ chối.

Các yêu cầu có điều kiện cho phép triển khai _thuật toán khóa lạc quan_ (được sử dụng bởi hầu hết wiki hoặc hệ thống kiểm soát nguồn). Khái niệm là cho phép tất cả client nhận bản sao của tài nguyên, sau đó để họ sửa đổi cục bộ, kiểm soát sự đồng thời bằng cách cho phép thành công client đầu tiên gửi cập nhật. Tất cả các cập nhật tiếp theo, dựa trên phiên bản đã lỗi thời của tài nguyên, bị từ chối:

![Các yêu cầu có điều kiện cho phép triển khai khóa lạc quan: bây giờ cái nhanh nhất thắng, và những cái khác nhận được lỗi.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/optimistic-locking-3.svg)

Điều này được triển khai bằng cách sử dụng các tiêu đề {{HTTPHeader("If-Match")}} hoặc {{HTTPHeader("If-Unmodified-Since")}}. Nếu ETag không khớp với tệp gốc, hoặc nếu tệp đã bị sửa đổi kể từ khi được lấy, thay đổi bị từ chối với lỗi {{HTTPStatus("412", "412 Precondition Failed")}}. Khi đó, tùy thuộc vào client để giải quyết lỗi: thông báo cho người dùng bắt đầu lại (lần này trên phiên bản mới nhất), hoặc hiển thị cho người dùng _diff_ của cả hai phiên bản, giúp họ quyết định các thay đổi nào họ muốn giữ.

### Xử lý việc tải lên đầu tiên của tài nguyên

Lần tải lên đầu tiên của tài nguyên là trường hợp đặc biệt của phần trước. Giống như bất kỳ cập nhật nào của tài nguyên, nó phải chịu race condition nếu hai client cố gắng thực hiện vào thời điểm tương tự. Để ngăn chặn điều này, các yêu cầu có điều kiện có thể được sử dụng: bằng cách thêm {{HTTPHeader("If-None-Match")}} với giá trị đặc biệt là `*`, đại diện cho bất kỳ ETag nào. Yêu cầu sẽ thành công, chỉ khi tài nguyên không tồn tại trước:

![Giống như để tải lên thông thường, việc tải lên đầu tiên của tài nguyên phải chịu race condition: If-None-Match có thể ngăn chặn nó.](https://mdn.github.io/shared-assets/images/diagrams/http/conditional-requests/first-upload.svg)

`If-None-Match` sẽ chỉ hoạt động với các máy chủ tuân thủ HTTP/1.1 (và sau này). Nếu không chắc chắn liệu máy chủ có tuân thủ hay không, bạn cần đầu tiên đưa ra yêu cầu {{HTTPMethod("HEAD")}} đến tài nguyên để kiểm tra điều này.

## Kết luận

Các yêu cầu có điều kiện là tính năng chính của HTTP, và cho phép xây dựng các ứng dụng hiệu quả và phức tạp. Để lưu vào bộ nhớ đệm hoặc tiếp tục tải xuống, công việc duy nhất cần thiết cho các quản trị viên web là cấu hình máy chủ đúng cách; đặt ETag chính xác trong một số môi trường có thể phức tạp. Một khi đạt được, trình duyệt sẽ phục vụ các yêu cầu có điều kiện mong đợi.

Đối với cơ chế khóa, điều ngược lại: các nhà phát triển web cần đưa ra yêu cầu với các tiêu đề phù hợp, trong khi quản trị viên web có thể phần lớn dựa vào ứng dụng để thực hiện kiểm tra cho họ.

Trong cả hai trường hợp đều rõ ràng, các yêu cầu có điều kiện là tính năng cơ bản đằng sau Web.

## Xem thêm

- {{HTTPStatus("304", "304 Not Modified")}}
- {{HTTPHeader("If-None-Match")}}
- [Apache Server `mod_deflate.c`](https://github.com/apache/httpd/blob/4348e8cb7d8c41b1c8019ceb0a1612bb4a3384f7/modules/filters/mod_deflate.c#L495-L500) biến đổi ETag trong quá trình nén
