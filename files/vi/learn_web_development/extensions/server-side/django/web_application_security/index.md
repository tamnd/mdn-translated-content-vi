---
title: Bảo mật ứng dụng web Django
short-title: Bảo mật Django
slug: Learn_web_development/Extensions/Server-side/Django/web_application_security
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Deployment", "Learn_web_development/Extensions/Server-side/Django/django_assessment_blog", "Learn_web_development/Extensions/Server-side/Django")}}

Bảo vệ dữ liệu người dùng là một phần thiết yếu trong bất kỳ thiết kế trang web nào. Trước đây chúng ta đã giải thích một số mối đe dọa bảo mật phổ biến hơn trong bài viết [Web security](/en-US/docs/Web/Security) — bài viết này cung cấp minh họa thực tế về cách các tính năng bảo vệ tích hợp của Django xử lý các mối đe dọa như vậy.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Đọc chủ đề "<a href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security">Website security</a>" trong lập trình phía máy chủ.
        Hoàn thành các chủ đề hướng dẫn Django đến (và bao gồm) ít nhất <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Forms">Django Tutorial Part 9: Working with forms</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu những điều chính bạn cần làm (hoặc không làm) để bảo mật ứng dụng web Django của mình.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Chủ đề [Website security](/en-US/docs/Web/Security) cung cấp tổng quan về ý nghĩa của bảo mật trang web đối với thiết kế phía máy chủ, và một số mối đe dọa phổ biến hơn mà bạn nên bảo vệ khỏi. Một trong những thông điệp chính trong bài viết đó là hầu hết tất cả các cuộc tấn công thành công khi ứng dụng web tin tưởng dữ liệu từ trình duyệt.

> [!WARNING]
> Bài học quan trọng nhất bạn có thể học về bảo mật trang web là **không bao giờ tin tưởng dữ liệu từ trình duyệt**. Điều này bao gồm dữ liệu yêu cầu `GET` trong tham số URL, dữ liệu `POST`, headers HTTP và cookie, tệp do người dùng tải lên, v.v. Luôn kiểm tra và làm sạch tất cả dữ liệu đến. Luôn giả định điều tồi tệ nhất.

Tin tốt cho người dùng Django là nhiều mối đe dọa phổ biến hơn được xử lý bởi framework! Bài viết [Security in Django](https://docs.djangoproject.com/en/5.0/topics/security/) (Tài liệu Django) giải thích các tính năng bảo mật của Django và cách bảo mật trang web được cung cấp bởi Django.

## Các mối đe dọa/biện pháp bảo vệ phổ biến

Thay vì trùng lặp tài liệu Django ở đây, trong bài viết này chúng ta sẽ chỉ trình bày một vài tính năng bảo mật trong bối cảnh hướng dẫn Django [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) của chúng ta.

### Cross site scripting (XSS)

XSS là thuật ngữ dùng để mô tả một loại tấn công cho phép kẻ tấn công tiêm các script phía máy khách _thông qua_ trang web vào trình duyệt của người dùng khác. Điều này thường đạt được bằng cách lưu trữ các script độc hại trong cơ sở dữ liệu nơi chúng có thể được truy xuất và hiển thị cho người dùng khác, hoặc bằng cách khiến người dùng nhấp vào liên kết sẽ khiến JavaScript của kẻ tấn công được thực thi bởi trình duyệt của người dùng.

Hệ thống mẫu của Django bảo vệ bạn khỏi phần lớn các cuộc tấn công XSS bằng cách [thoát các ký tự cụ thể](https://docs.djangoproject.com/en/5.0/ref/templates/language/#automatic-html-escaping) "nguy hiểm" trong HTML. Chúng ta có thể chứng minh điều này bằng cách cố gắng tiêm một số JavaScript vào trang web LocalLibrary của chúng ta bằng biểu mẫu Create-author mà chúng ta đã thiết lập trong [Django Tutorial Part 9: Working with forms](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Forms).

1. Khởi động trang web bằng máy chủ phát triển (`python3 manage.py runserver`).
2. Mở trang web trong trình duyệt cục bộ và đăng nhập vào tài khoản superuser của bạn.
3. Điều hướng đến trang tạo tác giả (nên có URL: `http://127.0.0.1:8000/catalog/author/create/`).
4. Nhập tên và thông tin ngày tháng cho người dùng mới, sau đó thêm văn bản sau vào trường Last Name:
   `<script>alert('Test alert');</script>`.
   ![Author Form XSS test](author_create_form_alert_xss.png)

   > [!NOTE]
   > Đây là script vô hại mà nếu được thực thi, sẽ hiển thị hộp cảnh báo trong trình duyệt của bạn. Nếu cảnh báo được hiển thị khi bạn gửi bản ghi thì trang web dễ bị tổn thương trước các mối đe dọa XSS.

5. Nhấn **Submit** để lưu bản ghi.
6. Khi bạn lưu tác giả, nó sẽ được hiển thị như được trình bày bên dưới. Do các tính năng bảo vệ XSS, `alert()` không nên được chạy. Thay vào đó script được hiển thị dưới dạng văn bản thuần túy.
   ![Author detail view XSS test](author_detail_alert_xss.png)

Nếu bạn xem mã nguồn HTML của trang, bạn có thể thấy rằng các ký tự nguy hiểm cho các thẻ script đã được chuyển đổi thành các mã thoát vô hại tương đương (ví dụ: `>` bây giờ là `&gt;`)

```html
<h1>
  Author: Boon&lt;script&gt;alert(&#39;Test alert&#39;);&lt;/script&gt;, David
  (Boonie)
</h1>
```

Sử dụng các mẫu Django bảo vệ bạn khỏi phần lớn các cuộc tấn công XSS. Tuy nhiên, có thể tắt tính năng bảo vệ này, và tính năng bảo vệ không được áp dụng tự động cho tất cả các thẻ sẽ không thường được điền bởi người dùng nhập vào (ví dụ: `help_text` trong trường biểu mẫu thường không do người dùng cung cấp, vì vậy Django không thoát các giá trị đó).

Cũng có thể các cuộc tấn công XSS bắt nguồn từ các nguồn dữ liệu không đáng tin cậy khác, chẳng hạn như cookie, dịch vụ Web hoặc các tệp được tải lên (bất cứ khi nào dữ liệu không được làm sạch đủ trước khi được đưa vào trang). Nếu bạn đang hiển thị dữ liệu từ các nguồn này, thì bạn có thể cần thêm mã làm sạch của riêng bạn.

### Bảo vệ Cross site request forgery (CSRF)

Các cuộc tấn công CSRF cho phép người dùng độc hại thực thi các hành động sử dụng thông tin đăng nhập của người dùng khác mà không có sự hiểu biết hoặc đồng ý của người dùng đó. Ví dụ: hãy xem xét trường hợp chúng ta có một hacker muốn tạo thêm tác giả cho LocalLibrary của chúng ta.

> [!NOTE]
> Rõ ràng hacker của chúng ta không làm điều này vì tiền! Một hacker tham vọng hơn có thể sử dụng cách tiếp cận tương tự trên các trang web khác để thực hiện các nhiệm vụ gây hại nhiều hơn (chẳng hạn như chuyển tiền vào tài khoản của riêng họ, v.v.)

Để làm điều này, họ có thể tạo một tệp HTML như tệp bên dưới, chứa biểu mẫu tạo tác giả (giống như tệp chúng ta đã sử dụng trong phần trước) được gửi ngay khi tệp được tải.
Họ sẽ gửi tệp cho tất cả các Thủ thư và gợi ý rằng họ mở tệp (nó chứa một số thông tin vô hại, thật sự!). Nếu tệp được mở bởi bất kỳ thủ thư nào đã đăng nhập, biểu mẫu sẽ được gửi với thông tin đăng nhập của họ và một tác giả mới sẽ được tạo.

```html
<html lang="en">
  <body onload="document.EvilForm.submit()">
    <form
      action="http://127.0.0.1:8000/catalog/author/create/"
      method="post"
      name="EvilForm">
      <label for="id_first_name">First name:</label>
      <input
        id="id_first_name"
        maxlength="100"
        name="first_name"
        type="text"
        value="Mad"
        required />
      <label for="id_last_name">Last name:</label>
      <input
        id="id_last_name"
        maxlength="100"
        name="last_name"
        type="text"
        value="Man"
        required />
      <label for="id_date_of_birth">Date of birth:</label>
      <input id="id_date_of_birth" name="date_of_birth" type="text" />
      <label for="id_date_of_death">Died:</label>
      <input
        id="id_date_of_death"
        name="date_of_death"
        type="text"
        value="12/10/2016" />
      <input type="submit" value="Submit" />
    </form>
  </body>
</html>
```

Chạy máy chủ web phát triển và đăng nhập bằng tài khoản superuser của bạn. Sao chép văn bản ở trên vào một tệp và sau đó mở nó trong trình duyệt. Bạn sẽ nhận được lỗi CSRF vì Django có tính năng bảo vệ chống lại loại vấn đề này!

Cách bảo vệ được kích hoạt là bạn bao gồm thẻ mẫu `{% csrf_token %}` trong định nghĩa biểu mẫu của bạn. Token này sau đó được hiển thị trong HTML của bạn như được trình bày bên dưới, với giá trị dành riêng cho người dùng trên trình duyệt hiện tại.

```html
<input
  type="hidden"
  name="csrfmiddlewaretoken"
  value="0QRWHnYVg776y2l66mcvZqp8alrv4lb8S8lZ4ZJUWGZFA5VHrVfL2mpH29YZ39PW" />
```

Django tạo ra khóa dành riêng cho người dùng/trình duyệt và sẽ từ chối các biểu mẫu không chứa trường, hoặc chứa giá trị trường không chính xác cho người dùng/trình duyệt.

Để sử dụng loại tấn công này, hacker bây giờ phải khám phá và bao gồm khóa CSRF cho người dùng mục tiêu cụ thể. Họ cũng không thể sử dụng phương pháp "shotgun" là gửi tệp độc hại cho tất cả các thủ thư và hy vọng một trong số họ sẽ mở nó, vì khóa CSRF dành riêng cho trình duyệt.

Tính năng bảo vệ CSRF của Django được bật theo mặc định. Bạn luôn nên sử dụng thẻ mẫu `{% csrf_token %}` trong biểu mẫu của mình và sử dụng `POST` cho các yêu cầu có thể thay đổi hoặc thêm dữ liệu vào cơ sở dữ liệu.

### Các tính năng bảo vệ khác

Django cũng cung cấp các hình thức bảo vệ khác (hầu hết sẽ khó hoặc không đặc biệt hữu ích để trình bày):

- Bảo vệ SQL injection
  - : Các lỗ hổng SQL injection cho phép người dùng độc hại thực thi mã SQL tùy ý trên cơ sở dữ liệu, cho phép dữ liệu được truy cập, sửa đổi hoặc xóa bất kể quyền của người dùng. Trong hầu hết mọi trường hợp bạn sẽ truy cập cơ sở dữ liệu bằng cách sử dụng queryset/model của Django, vì vậy SQL kết quả sẽ được thoát đúng cách bởi trình điều khiển cơ sở dữ liệu cơ bản. Nếu bạn cần viết các truy vấn thô hoặc SQL tùy chỉnh, bạn sẽ cần nghĩ rõ ràng về việc ngăn chặn SQL injection.
- Bảo vệ Clickjacking
  - : Trong cuộc tấn công này, người dùng độc hại chiếm đoạt các click dành cho một trang web cấp cao nhất hiển thị và định tuyến chúng đến một trang ẩn bên dưới. Kỹ thuật này có thể được sử dụng, ví dụ: để hiển thị một trang web ngân hàng hợp lệ nhưng thu thập thông tin đăng nhập trong một [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe) vô hình do kẻ tấn công kiểm soát. Django chứa tính năng bảo vệ [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) dưới dạng [`X-Frame-Options` middleware](https://docs.djangoproject.com/en/4.0/ref/middleware/#django.middleware.clickjacking.XFrameOptionsMiddleware) mà trong trình duyệt hỗ trợ, có thể ngăn trang web được hiển thị bên trong một frame.
- Thực thi TLS/HTTPS
  - : TLS/HTTPS có thể được bật trên máy chủ web để mã hóa tất cả lưu lượng giữa trang web và trình duyệt, bao gồm thông tin xác thực sẽ được gửi ở dạng văn bản thuần túy (bật HTTPS được khuyến nghị cao). Nếu HTTPS được bật, Django cung cấp một số tính năng bảo vệ khác mà bạn có thể sử dụng:
    - [`SECURE_PROXY_SSL_HEADER`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-SECURE_PROXY_SSL_HEADER) có thể được sử dụng để kiểm tra xem nội dung có an toàn không, ngay cả khi nó đến từ proxy không phải HTTP.
    - [`SECURE_SSL_REDIRECT`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-SECURE_SSL_REDIRECT) được sử dụng để chuyển hướng tất cả các yêu cầu HTTP sang HTTPS.
    - Sử dụng [HTTP Strict Transport Security](https://docs.djangoproject.com/en/5.0/ref/middleware/#http-strict-transport-security) (HSTS). Đây là HTTP header thông báo cho trình duyệt biết rằng tất cả các kết nối trong tương lai đến một trang web cụ thể phải luôn sử dụng HTTPS. Kết hợp với việc chuyển hướng các yêu cầu HTTP sang HTTPS, cài đặt này đảm bảo rằng HTTPS luôn được sử dụng sau khi kết nối thành công đã xảy ra. HSTS có thể được cấu hình với [`SECURE_HSTS_SECONDS`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-SECURE_HSTS_SECONDS) và [`SECURE_HSTS_INCLUDE_SUBDOMAINS`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-SECURE_HSTS_INCLUDE_SUBDOMAINS) hoặc trên máy chủ Web.
    - Sử dụng cookie 'an toàn' bằng cách đặt [`SESSION_COOKIE_SECURE`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-SESSION_COOKIE_SECURE) và [`CSRF_COOKIE_SECURE`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-CSRF_COOKIE_SECURE) thành `True`. Điều này sẽ đảm bảo rằng cookie chỉ được gửi qua HTTPS.
- Xác thực header Host
  - : Sử dụng [`ALLOWED_HOSTS`](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-ALLOWED_HOSTS) để chỉ chấp nhận các yêu cầu từ các máy chủ đáng tin cậy.

Có nhiều tính năng bảo vệ khác và lưu ý về việc sử dụng các cơ chế trên. Mặc dù chúng ta hy vọng điều này đã cung cấp cho bạn tổng quan về những gì Django cung cấp, bạn vẫn nên đọc tài liệu bảo mật Django.

## Tóm tắt

Django có các tính năng bảo vệ hiệu quả chống lại một số mối đe dọa phổ biến, bao gồm các cuộc tấn công XSS và CSRF. Trong bài viết này chúng ta đã trình bày cách những mối đe dọa cụ thể đó được Django xử lý trong trang web _LocalLibrary_ của chúng ta. Chúng ta cũng đã cung cấp tổng quan ngắn gọn về một số tính năng bảo vệ khác.

Đây là chuyến đi rất ngắn gọn vào bảo mật web. Chúng ta khuyến nghị mạnh mẽ bạn đọc [Security in Django](https://docs.djangoproject.com/en/5.0/topics/security/) để có hiểu biết sâu hơn.

Bước tiếp theo và cuối cùng trong mô-đun về Django này là hoàn thành [bài đánh giá](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/django_assessment_blog).

## Xem thêm

- [Security on the web](/en-US/docs/Web/Security)
- [Practical security implementation guides](/en-US/docs/Web/Security/Practical_implementation_guides)
- [Security in Django](https://docs.djangoproject.com/en/5.0/topics/security/) (Tài liệu Django)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Deployment", "Learn_web_development/Extensions/Server-side/Django/django_assessment_blog", "Learn_web_development/Extensions/Server-side/Django")}}
