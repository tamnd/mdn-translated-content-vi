---
title: How do you make sure your website works properly?
slug: Learn_web_development/Howto/Tools_and_setup/Checking_that_your_web_site_is_working_properly
page-type: learn-faq
sidebar: learn-how-to
---

Trong bài viết này, chúng tôi trình bày các bước khắc phục sự cố khác nhau cho một trang web và một số hành động cơ bản cần thực hiện để giải quyết các vấn đề này.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn cần biết cách
        <a
          href="/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server"
          >tải tệp lên máy chủ web</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Bạn sẽ học cách chẩn đoán và giải quyết một số vấn đề cơ bản có thể gặp phải với trang web của mình.
      </td>
    </tr>
  </tbody>
</table>

Vậy bạn đã xuất bản trang web của mình trực tuyến? Rất tốt! Nhưng bạn có chắc rằng nó hoạt động đúng không?

Một máy chủ web ở xa thường hoạt động khá khác so với máy chủ cục bộ, vì vậy tốt nhất là kiểm tra trang web của bạn khi nó đã trực tuyến. Bạn có thể ngạc nhiên vì có bao nhiêu vấn đề xuất hiện: hình ảnh không hiển thị, trang không tải hoặc tải chậm, v.v. Phần lớn thời gian không phải là vấn đề lớn, chỉ là lỗi đơn giản hoặc vấn đề với cấu hình lưu trữ web của bạn.

Hãy xem cách chẩn đoán và giải quyết các vấn đề đó.

## Tìm hiểu sâu hơn

### Kiểm tra trong trình duyệt

Nếu bạn muốn biết trang web của mình có hoạt động đúng không, điều đầu tiên cần làm là mở trình duyệt và đi đến trang bạn muốn kiểm tra.

#### Ồ không, hình ảnh ở đâu?

Hãy xem trang web cá nhân của chúng ta, `http://demozilla.examplehostingprovider.net/`. Nó không hiển thị hình ảnh mà chúng ta mong đợi!

![Ối, hình ảnh 'unicorn' bị mất](image-missing.png)

Mở công cụ Network của Firefox (**Tools ➤ Web Developer ➤ Network**) và tải lại trang:

![Hình ảnh có lỗi 404](error404.png)

Đây rồi, lỗi "404" ở dưới cùng. "404" có nghĩa là "không tìm thấy tài nguyên", và đó là lý do tại sao chúng ta không thấy hình ảnh.

#### Các mã trạng thái HTTP

Máy chủ phản hồi bằng một thông báo trạng thái mỗi khi nhận được yêu cầu. Dưới đây là các trạng thái phổ biến nhất:

- **200: OK**
  - : Tài nguyên bạn yêu cầu đã được gửi.
- **301: Đã chuyển vĩnh viễn**
  - : Tài nguyên đã chuyển đến một vị trí mới. Bạn sẽ không thấy điều này nhiều trong trình duyệt của mình, nhưng tốt khi biết về "301" vì các công cụ tìm kiếm sử dụng thông tin này rất nhiều để cập nhật chỉ mục của họ.
- **304: Không thay đổi**
  - : Tệp chưa thay đổi kể từ lần cuối bạn yêu cầu nó, vì vậy trình duyệt của bạn có thể hiển thị phiên bản từ bộ nhớ cache, dẫn đến thời gian phản hồi nhanh hơn và sử dụng băng thông hiệu quả hơn.
- **403: Bị cấm**
  - : Bạn không được phép hiển thị tài nguyên. Thường liên quan đến lỗi cấu hình (ví dụ: nhà cung cấp dịch vụ lưu trữ quên cấp quyền truy cập vào thư mục cho bạn).
- **404: Không tìm thấy**
  - : Đã rõ nghĩa. Chúng ta sẽ thảo luận cách giải quyết điều này bên dưới.
- **500: Lỗi máy chủ nội bộ**
  - : Có gì đó sai trên máy chủ. Ví dụ: có thể ngôn ngữ phía máy chủ ({{Glossary("PHP")}}, .Net, v.v.) đã ngừng hoạt động, hoặc bản thân máy chủ web có vấn đề cấu hình. Thường tốt nhất là liên hệ với nhóm hỗ trợ của nhà cung cấp dịch vụ lưu trữ.
- **503: Dịch vụ không khả dụng**
  - : Thường do hệ thống bị quá tải trong thời gian ngắn. Máy chủ gặp một số vấn đề. Hãy thử lại sau một lúc.

Là người mới kiểm tra trang web (đơn giản) của chúng ta, chúng ta thường gặp nhất là 200, 304, 403 và 404.

#### Sửa lỗi 404

Vậy có gì sai?

![Danh sách hình ảnh trong dự án của chúng ta](demozilla-images-list.png)

Thoạt nhìn, hình ảnh chúng ta yêu cầu có vẻ đúng vị trí nhưng công cụ Network báo "404". Hóa ra chúng ta đã gõ nhầm trong code HTML: `unicorn_pics.png` thay vì `unicorn_pic.png`. Vì vậy hãy sửa lỗi đánh máy trong trình soạn thảo code của bạn bằng cách thay đổi thuộc tính `src` của hình ảnh:

![Xóa chữ 's'](code-correct.png)

Lưu, [đẩy lên máy chủ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server) và tải lại trang trong trình duyệt của bạn:

![Hình ảnh tải đúng trong trình duyệt](image-corrected.png)

Xong rồi! Hãy xem lại các mã trạng thái {{Glossary("HTTP")}}:

- **200** cho `/` và cho `unicorn_pic.png` có nghĩa là chúng ta đã tải lại trang và hình ảnh thành công.
- **304** cho `basic.css` có nghĩa là tệp này chưa thay đổi kể từ yêu cầu cuối cùng, vì vậy trình duyệt có thể sử dụng tệp trong bộ nhớ cache thay vì nhận bản sao mới.

Vậy là chúng ta đã sửa lỗi và học được một vài mã trạng thái HTTP trên đường đi!

### Các lỗi thường gặp

Các lỗi thường gặp nhất mà chúng ta thấy là:

#### Lỗi đánh máy trong địa chỉ

Chúng ta muốn gõ `http://demozilla.examplehostingprovider.net/` nhưng gõ quá nhanh và quên mất một chữ "l":

![Địa chỉ không thể truy cập](cannot-find-server.png)

Địa chỉ không tìm thấy. Đúng vậy.

#### Lỗi 404

Nhiều lần lỗi chỉ do lỗi đánh máy, nhưng đôi khi có thể bạn đã quên tải lên một tài nguyên hoặc bạn mất kết nối mạng khi đang tải lên tài nguyên. Trước tiên hãy kiểm tra chính tả và độ chính xác của đường dẫn tệp, và nếu vẫn còn vấn đề, hãy tải lại tệp của bạn. Điều đó có thể sẽ sửa được vấn đề.

#### Lỗi JavaScript

Ai đó (có thể là bạn) đã thêm một đoạn script vào trang và mắc lỗi. Điều này sẽ không ngăn trang tải, nhưng bạn sẽ cảm thấy có gì đó không ổn.

Mở bảng điều khiển (**Tools ➤ Web developer ➤ Web Console**) và tải lại trang:

![Một lỗi JavaScript được hiển thị trong Console](js-error.png)

Trong ví dụ này, chúng ta biết (khá rõ ràng) lỗi là gì, và chúng ta có thể đi sửa nó (chúng ta sẽ đề cập đến JavaScript trong [một loạt bài viết khác](/en-US/docs/Learn_web_development/Core/Scripting)).

### Nhiều điều hơn để kiểm tra

Chúng tôi đã liệt kê một số cách đơn giản để kiểm tra trang web của bạn hoạt động đúng không, cũng như các lỗi phổ biến nhất bạn có thể gặp và cách sửa chúng. Bạn cũng có thể kiểm tra xem trang của mình có đáp ứng các tiêu chí này không:

#### Hiệu suất như thế nào?

Trang có tải đủ nhanh không? Các tài nguyên như [WebPageTest.org](https://www.webpagetest.org/) hoặc tiện ích mở rộng trình duyệt như [YSlow](https://github.com/marcelduran/yslow) có thể cho bạn biết một số điều thú vị:

![Chẩn đoán Yslow](yslow-diagnostics.png)

Điểm đi từ A đến F. Trang của chúng ta khá nhỏ và đáp ứng hầu hết các tiêu chí. Nhưng chúng ta đã có thể lưu ý rằng sẽ tốt hơn nếu sử dụng {{Glossary("CDN")}}. Điều đó không quan trọng lắm khi chúng ta chỉ phục vụ một hình ảnh, nhưng sẽ rất quan trọng với một trang web băng thông cao phục vụ hàng nghìn hình ảnh.

#### Máy chủ có đủ khả năng phản hồi không?

`ping` là một công cụ shell hữu ích kiểm tra tên miền bạn cung cấp và cho bạn biết máy chủ có đang phản hồi không:

```plain
$ ping mozilla.org
PING mozilla.org (63.245.215.20): 56 data bytes
64 bytes from 63.245.215.20: icmp_seq=0 ttl=44 time=148.741 ms
64 bytes from 63.245.215.20: icmp_seq=1 ttl=44 time=148.541 ms
64 bytes from 63.245.215.20: icmp_seq=2 ttl=44 time=148.734 ms
64 bytes from 63.245.215.20: icmp_seq=3 ttl=44 time=147.857 ms
^C
--- mozilla.org ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 147.857/148.468/148.741/0.362 ms
```

Hãy nhớ một phím tắt hữu ích: **Ctrl+C**. Ctrl+C gửi tín hiệu "ngắt" đến thời gian chạy và yêu cầu nó dừng lại. Nếu bạn không dừng thời gian chạy, `ping` sẽ ping máy chủ vô tận.

### Danh sách kiểm tra đơn giản

- Kiểm tra lỗi 404
- Đảm bảo tất cả các trang web hoạt động như mong đợi
- Kiểm tra trang web của bạn trên nhiều trình duyệt để đảm bảo hiển thị nhất quán

## Các bước tiếp theo

Xin chúc mừng, trang web của bạn đã hoạt động và bất kỳ ai cũng có thể truy cập. Đó là thành tựu lớn. Bây giờ, bạn có thể bắt đầu tìm hiểu sâu hơn về nhiều chủ đề.

- Vì mọi người có thể đến trang web của bạn từ khắp nơi trên thế giới, bạn nên xem xét làm cho nó [có thể tiếp cận với mọi người](/en-US/docs/Learn_web_development/Howto/Design_and_accessibility/What_is_accessibility).
- Thiết kế trang web của bạn có hơi thô không? Đã đến lúc [tìm hiểu thêm về CSS](/en-US/docs/Learn_web_development/Core/Styling_basics).
