---
title: Gửi dữ liệu biểu mẫu
slug: Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Forms/Form_validation", "Learn_web_development/Extensions/Forms")}}

Sau khi dữ liệu biểu mẫu đã được kiểm tra hợp lệ ở phía máy khách, bạn có thể gửi biểu mẫu. Và, vì chúng ta đã đề cập đến kiểm tra hợp lệ trong bài viết trước, chúng ta đã sẵn sàng để gửi! Bài viết này xem xét điều gì xảy ra khi người dùng gửi biểu mẫu — dữ liệu đi đâu, và chúng ta xử lý nó như thế nào khi nó đến? Chúng ta cũng xem xét một số mối lo ngại về bảo mật liên quan đến việc gửi dữ liệu biểu mẫu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >HTML</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Web/HTTP">HTTP</a> và
        <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps"
          >lập trình phía máy chủ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu điều gì xảy ra khi dữ liệu biểu mẫu được gửi, bao gồm
        có ý tưởng cơ bản về cách dữ liệu được xử lý trên máy chủ.
      </td>
    </tr>
  </tbody>
</table>

Trước tiên, chúng ta sẽ thảo luận về điều gì xảy ra với dữ liệu khi biểu mẫu được gửi.

## Kiến trúc máy khách/máy chủ

Ở mức cơ bản nhất, web sử dụng kiến trúc máy khách/máy chủ có thể được tóm tắt như sau: một máy khách (thường là trình duyệt web) gửi yêu cầu đến máy chủ (hầu hết thời gian là máy chủ web như [Apache](https://httpd.apache.org/), [Nginx](https://nginx.org/), [IIS](https://www.iis.net/), [Tomcat](https://tomcat.apache.org/), v.v.), sử dụng [giao thức HTTP](/en-US/docs/Web/HTTP). Máy chủ trả lời yêu cầu sử dụng cùng giao thức.

![A basic schema of the Web client/server architecture](client-server.png)

Một biểu mẫu HTML trên một trang web không gì khác hơn là một cách thuận tiện và thân thiện với người dùng để cấu hình yêu cầu HTTP để gửi dữ liệu đến máy chủ. Điều này cho phép người dùng cung cấp thông tin để được gửi trong yêu cầu HTTP.

> [!NOTE]
> Để có ý tưởng tốt hơn về cách kiến trúc máy khách-máy chủ hoạt động, hãy đọc mô-đun [Các bước đầu tiên về lập trình web phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps) của chúng ta.

## Phía máy khách: xác định cách gửi dữ liệu

Phần tử {{HTMLElement("form")}} xác định cách dữ liệu sẽ được gửi. Tất cả các thuộc tính của nó được thiết kế để cho phép bạn cấu hình yêu cầu được gửi khi người dùng nhấn {{Glossary("submit button")}}. Hai thuộc tính quan trọng nhất là [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) và [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method).

### Thuộc tính action

Thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) xác định nơi dữ liệu được gửi. Giá trị của nó phải là một [URL](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL) tương đối hoặc tuyệt đối hợp lệ. Nếu thuộc tính này không được cung cấp, dữ liệu sẽ được gửi đến URL của trang chứa biểu mẫu — trang hiện tại.

Trong ví dụ này, dữ liệu được gửi đến URL tuyệt đối — `https://www.example.com`:

```html
<form action="https://www.example.com">…</form>
```

Ở đây, chúng ta sử dụng URL tương đối — dữ liệu được gửi đến URL khác trên cùng nguồn gốc:

```html
<form action="/somewhere_else">…</form>
```

Khi được chỉ định không có thuộc tính, như bên dưới, dữ liệu {{HTMLElement("form")}} được gửi đến trang tương tự mà biểu mẫu đang có mặt trên:

```html
<form>…</form>
```

> [!NOTE]
> Có thể chỉ định URL sử dụng giao thức HTTPS (HTTP bảo mật). Khi bạn làm điều này, dữ liệu được mã hóa cùng với phần còn lại của yêu cầu, ngay cả khi chính biểu mẫu được lưu trữ trên trang không bảo mật được truy cập bằng HTTP. Mặt khác, nếu biểu mẫu được lưu trữ trên trang bảo mật nhưng bạn chỉ định URL HTTP không bảo mật với thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action), tất cả các trình duyệt hiển thị cảnh báo bảo mật cho người dùng mỗi lần họ cố gắng gửi dữ liệu vì dữ liệu sẽ không được mã hóa.

Tên và giá trị của các điều khiển biểu mẫu không phải tệp được gửi đến máy chủ dưới dạng các cặp `name=value` được nối với dấu và (&). Giá trị `action` phải là tệp trên máy chủ có thể xử lý dữ liệu đến, bao gồm đảm bảo kiểm tra hợp lệ phía máy chủ. Sau đó máy chủ phản hồi, thường xử lý dữ liệu và tải URL được xác định bởi thuộc tính `action`, gây ra tải trang mới (hoặc làm mới trang hiện tại, nếu `action` trỏ đến cùng trang).

Cách dữ liệu được gửi phụ thuộc vào thuộc tính `method`.

### Thuộc tính method

Thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) xác định cách dữ liệu được gửi. [Giao thức HTTP](/en-US/docs/Web/HTTP) cung cấp một số cách để thực hiện yêu cầu; dữ liệu biểu mẫu HTML có thể được truyền qua một số phương thức khác nhau, phổ biến nhất là phương thức `GET` và phương thức `POST`

Để hiểu sự khác biệt giữa hai phương thức đó, hãy lùi lại và xem xét [cách HTTP hoạt động](/en-US/docs/Web/HTTP/Guides/Overview). Mỗi lần bạn muốn truy cập tài nguyên trên Web, trình duyệt gửi yêu cầu đến URL. Yêu cầu HTTP bao gồm hai phần: [tiêu đề](/en-US/docs/Web/HTTP/Reference/Headers) chứa một tập hợp siêu dữ liệu toàn cầu về khả năng của trình duyệt, và phần thân có thể chứa thông tin cần thiết cho máy chủ để xử lý yêu cầu cụ thể.

#### Phương thức GET

[Phương thức `GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) là phương thức được trình duyệt sử dụng để yêu cầu máy chủ gửi lại tài nguyên đã cho: "Này máy chủ, tôi muốn lấy tài nguyên này." Trong trường hợp này, trình duyệt gửi phần thân trống. Vì phần thân trống, nếu biểu mẫu được gửi sử dụng phương thức này, dữ liệu gửi đến máy chủ được thêm vào URL.

Xem xét biểu mẫu sau:

```html
<form action="https://www.example.com/greet" method="GET">
  <div>
    <label for="say">What greeting do you want to say?</label>
    <input name="say" id="say" value="Hi" />
  </div>
  <div>
    <label for="to">Who do you want to say it to?</label>
    <input name="to" id="to" value="Mom" />
  </div>
  <div>
    <button>Send my greetings</button>
  </div>
</form>
```

Vì phương thức `GET` đã được sử dụng, bạn sẽ thấy URL `https://www.example.com/greet?say=Hi&to=Mom` xuất hiện trong thanh địa chỉ trình duyệt khi bạn gửi biểu mẫu.

![The changed url with query parameters after submitting the form with GET method with a "server not found" browser error page](url-parameters.png)

Dữ liệu được thêm vào URL dưới dạng một loạt các cặp tên/giá trị. Sau khi địa chỉ web URL đã kết thúc, chúng ta bao gồm dấu hỏi (`?`) theo sau là các cặp tên/giá trị, mỗi cặp được phân cách bằng dấu và (`&`). Trong trường hợp này, chúng ta đang truyền hai phần dữ liệu đến máy chủ:

- `say`, có giá trị là `Hi`
- `to`, có giá trị là `Mom`

Yêu cầu HTTP trông như thế này:

```http
GET /?say=Hi&to=Mom HTTP/2.0
Host: example.com
```

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub — xem [get-method.html](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/get-method.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/sending-form-data/get-method.html)).

> [!NOTE]
> Dữ liệu sẽ không được thêm vào nếu lược đồ URL `action` không thể xử lý các truy vấn, ví dụ: `file:`.

#### Phương thức POST

Phương thức [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) hơi khác một chút. Đó là phương thức mà trình duyệt sử dụng để nói chuyện với máy chủ khi yêu cầu phản hồi có tính đến dữ liệu được cung cấp trong phần thân yêu cầu HTTP: "Này máy chủ, hãy xem dữ liệu này và gửi lại kết quả thích hợp." Nếu biểu mẫu được gửi sử dụng phương thức này, dữ liệu được thêm vào phần thân của yêu cầu HTTP.

Hãy xem xét một ví dụ — đây là biểu mẫu tương tự mà chúng ta đã xem trong phần `GET` ở trên, nhưng với thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) được đặt thành `POST`.

```html
<form action="https://www.example.com/greet" method="POST">
  <div>
    <label for="say">What greeting do you want to say?</label>
    <input name="say" id="say" value="Hi" />
  </div>
  <div>
    <label for="to">Who do you want to say it to?</label>
    <input name="to" id="to" value="Mom" />
  </div>
  <div>
    <button>Send my greetings</button>
  </div>
</form>
```

Khi biểu mẫu được gửi sử dụng phương thức `POST`, bạn không nhận được dữ liệu nào được thêm vào URL, và yêu cầu HTTP trông như vậy, với dữ liệu được bao gồm trong phần thân yêu cầu thay thế:

```http
POST / HTTP/2.0
Host: example.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 13

say=Hi&to=Mom
```

Tiêu đề `Content-Length` cho biết kích thước của phần thân, và tiêu đề `Content-Type` cho biết loại tài nguyên được gửi đến máy chủ. Chúng ta sẽ thảo luận về các tiêu đề này sau.

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub — xem [post-method.html](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/post-method.html) ([xem trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/sending-form-data/post-method.html)).

> [!NOTE]
> Phương thức `GET` sẽ được sử dụng thay thế nếu lược đồ URL `action` không thể xử lý phần thân yêu cầu, ví dụ: `data:`.

### Xem các yêu cầu HTTP

Các yêu cầu HTTP không bao giờ được hiển thị cho người dùng (nếu bạn muốn xem chúng, bạn cần sử dụng các công cụ như [Firefox Network Monitor](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) hoặc [Chrome Developer Tools](https://developer.chrome.com/docs/devtools/)). Ví dụ, dữ liệu biểu mẫu của bạn sẽ được hiển thị như sau trong tab Network của Chrome. Sau khi gửi biểu mẫu:

1. Mở công cụ phát triển.
2. Chọn "Network"
3. Chọn "All"
4. Chọn "example.com" trong tab "Name"
5. Chọn "Request" (Firefox) hoặc "Payload" (Chrome/Edge)

Sau đó bạn có thể lấy dữ liệu biểu mẫu, như được hiển thị trong hình ảnh bên dưới.

![HTTP requests and response data in network monitoring tab in browser's developer tools](network-monitor.png)

Điều duy nhất được hiển thị cho người dùng là URL được gọi. Như chúng ta đã đề cập ở trên, với yêu cầu `GET` người dùng sẽ thấy dữ liệu trong thanh URL của họ, nhưng với yêu cầu `POST` họ sẽ không thấy. Điều này có thể rất quan trọng vì hai lý do:

1. Nếu bạn cần gửi mật khẩu (hoặc bất kỳ phần dữ liệu nhạy cảm nào khác), không bao giờ sử dụng phương thức `GET` hoặc bạn có nguy cơ hiển thị nó trong thanh URL, điều này sẽ rất không an toàn.
2. Nếu bạn cần gửi lượng lớn dữ liệu, phương thức `POST` được ưa thích vì một số trình duyệt giới hạn kích thước URL. Ngoài ra, nhiều máy chủ giới hạn độ dài URL họ chấp nhận.

## Phía máy chủ: truy xuất dữ liệu

Bất kể phương thức HTTP nào bạn chọn, máy chủ nhận một chuỗi sẽ được phân tích để lấy dữ liệu dưới dạng danh sách các cặp khóa/giá trị. Cách bạn truy cập danh sách này phụ thuộc vào nền tảng phát triển bạn sử dụng và trên bất kỳ framework cụ thể nào bạn có thể đang sử dụng với nó.

### Ví dụ: PHP thô

[PHP](https://www.php.net/) cung cấp một số đối tượng toàn cục để truy cập dữ liệu. Giả sử bạn đã sử dụng phương thức `POST`, ví dụ sau chỉ lấy dữ liệu và hiển thị nó cho người dùng. Tất nhiên, những gì bạn làm với dữ liệu tùy thuộc vào bạn. Bạn có thể hiển thị nó, lưu trữ nó trong cơ sở dữ liệu, gửi bằng email, hoặc xử lý theo cách nào khác.

```php
<?php
  // The global $_POST variable allows you to access the data sent with the POST method by name
  // To access the data sent with the GET method, you can use $_GET
  $say = htmlspecialchars($_POST["say"]);
  $to  = htmlspecialchars($_POST["to"]);

  echo  $say, " ", $to;
?>
```

Ví dụ này hiển thị một trang với dữ liệu chúng ta đã gửi. Bạn có thể thấy điều này trong thực tế trong tệp ví dụ [php-example.html](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/php-example.html) của chúng ta — chứa biểu mẫu ví dụ tương tự như chúng ta đã thấy trước đó, với `method` là `POST` và `action` là `php-example.php`. Khi nó được gửi, nó gửi dữ liệu biểu mẫu đến [php-example.php](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/php-example.php), chứa mã PHP được thấy trong khối trên. Khi mã này được thực thi, đầu ra trong trình duyệt là `Hi Mom`.

![Otherwise blank web page with "hi mom", the data received in response after submitting form data to a php file with POST method](php-result.png)

> [!NOTE]
> Ví dụ này sẽ không hoạt động khi bạn tải nó vào trình duyệt cục bộ — các trình duyệt không thể diễn giải mã PHP, vì vậy khi biểu mẫu được gửi, trình duyệt sẽ chỉ cung cấp tải xuống tệp PHP cho bạn. Để làm cho nó hoạt động, bạn cần chạy ví dụ qua máy chủ PHP nào đó. Các tùy chọn tốt để kiểm tra PHP cục bộ là [MAMP](https://www.mamp.info/en/downloads/) (Mac và Windows) và [XAMPP](https://www.apachefriends.org/download.html) (Mac, Windows, Linux).
>
> Lưu ý rằng nếu bạn đang sử dụng MAMP nhưng không có MAMP Pro được cài đặt (hoặc nếu thời gian dùng thử demo MAMP Pro đã hết hạn), bạn có thể gặp sự cố khi khiến nó hoạt động. Để làm cho nó hoạt động trở lại, chúng ta đã thấy rằng bạn có thể tải ứng dụng MAMP lên, sau đó chọn các tùy chọn menu _MAMP_ > _Preferences_ > _PHP_, và đặt "Standard Version:" thành "7.2.x" (x sẽ khác nhau tùy thuộc vào phiên bản bạn đã cài đặt).

### Ví dụ: Python

Ví dụ này cho thấy cách bạn sẽ sử dụng Python để làm điều tương tự — hiển thị dữ liệu đã gửi trên một trang web. Điều này sử dụng [framework Flask](https://flask.palletsprojects.com/) để hiển thị các template, xử lý gửi dữ liệu biểu mẫu, v.v. (xem [python-example.py](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/python-example.py)).

```python
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def form():
    return render_template('form.html')

@app.route('/hello', methods=['GET', 'POST'])
def hello():
    return render_template('greeting.html', say=request.form['say'], to=request.form['to'])

if __name__ == "__main__":
    app.run()
```

Hai template được tham chiếu trong mã trên như sau (chúng cần ở trong thư mục con gọi là `templates` trong cùng thư mục với tệp `python-example.py`, nếu bạn cố gắng tự chạy ví dụ):

- [form.html](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/templates/form.html): Biểu mẫu tương tự như chúng ta đã thấy ở trên trong phần [Phương thức POST](#the_post_method) nhưng với `action` được đặt thành `\{{ url_for('hello') }}`. Đây là template [Jinja](https://jinja.palletsprojects.com/), về cơ bản là HTML nhưng có thể chứa các lệnh gọi đến mã Python đang chạy máy chủ web được chứa trong dấu ngoặc nhọn. `url_for('hello')` về cơ bản nói "chuyển hướng đến `/hello` khi biểu mẫu được gửi".
- [greeting.html](https://github.com/mdn/learning-area/blob/main/html/forms/sending-form-data/templates/greeting.html): Template này chỉ chứa một dòng hiển thị hai phần dữ liệu được truyền cho nó khi nó được hiển thị. Điều này được thực hiện qua hàm `hello()` được thấy ở trên, chạy khi URL `/hello` được điều hướng đến.

> [!NOTE]
> Một lần nữa, mã này sẽ không hoạt động nếu bạn chỉ cố gắng tải nó trực tiếp vào trình duyệt. Python hoạt động hơi khác so với PHP — để chạy mã này cục bộ bạn sẽ cần [cài đặt Python/PIP](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#installing_python_3), sau đó cài đặt Flask sử dụng `pip3 install flask`. Tại thời điểm này, bạn sẽ có thể chạy ví dụ sử dụng `python3 python-example.py`, sau đó điều hướng đến `localhost:5042` trong trình duyệt của bạn.

### Các ngôn ngữ và framework khác

Có nhiều công nghệ phía máy chủ khác bạn có thể sử dụng để xử lý biểu mẫu, bao gồm Perl, Java, .Net, Ruby, v.v. Chỉ chọn cái bạn thích nhất. Điều đó nói rằng, đáng chú ý là việc sử dụng các công nghệ này trực tiếp không phổ biến vì điều này có thể phức tạp. Phổ biến hơn là sử dụng một trong nhiều framework chất lượng cao giúp xử lý biểu mẫu dễ dàng hơn, chẳng hạn như:

- Python
  - [Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django)
  - [Flask](https://flask.palletsprojects.com/)
  - [web2py](https://github.com/web2py/web2py) (dễ bắt đầu nhất)
  - [py4web](https://py4web.com/) (được viết bởi các nhà phát triển tương tự như web2py, có cài đặt giống Django hơn)
- Node.js
  - [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs)
  - [Next.js](https://nextjs.org/) (cho ứng dụng React)
  - [Nuxt](https://nuxt.com/) (cho ứng dụng Vue)
  - [Remix](https://remix.run/)
- PHP
  - [Laravel](https://laravel.com/)
  - [Laminas](https://getlaminas.org/) (trước đây là Zend Framework)
  - [Symfony](https://symfony.com/)
- Ruby
  - [Ruby On Rails](https://rubyonrails.org/)
- Java
  - [Spring Boot](https://spring.io/guides/gs/handling-form-submission/)

Đáng chú ý là ngay cả khi sử dụng các framework này, việc làm việc với biểu mẫu không nhất thiết là _dễ dàng_. Nhưng nó dễ dàng hơn nhiều so với việc tự viết tất cả chức năng từ đầu, và sẽ tiết kiệm cho bạn rất nhiều thời gian.

> [!NOTE]
> Việc dạy bạn bất kỳ ngôn ngữ hoặc framework phía máy chủ nào nằm ngoài phạm vi của bài viết này. Các liên kết trên sẽ giúp bạn một số, nếu bạn muốn học chúng.

## Trường hợp đặc biệt: gửi tệp

Gửi tệp với biểu mẫu HTML là trường hợp đặc biệt. Các tệp là dữ liệu nhị phân — hoặc được coi là như vậy — trong khi tất cả dữ liệu khác là dữ liệu văn bản. Vì HTTP là giao thức văn bản, có các yêu cầu đặc biệt để xử lý dữ liệu nhị phân.

### Thuộc tính enctype

Thuộc tính này cho phép bạn chỉ định giá trị của tiêu đề HTTP `Content-Type` được bao gồm trong yêu cầu được tạo khi biểu mẫu được gửi. Tiêu đề này rất quan trọng vì nó cho máy chủ biết loại dữ liệu nào đang được gửi. Theo mặc định, giá trị của nó là `application/x-www-form-urlencoded`. Theo nghĩa thông thường, điều này có nghĩa là: "Đây là dữ liệu biểu mẫu đã được mã hóa thành các tham số URL."

Nếu bạn muốn gửi tệp, bạn cần thực hiện ba bước bổ sung:

- Đặt thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) thành `POST` vì nội dung tệp không thể được đặt bên trong tham số URL.
- Đặt giá trị của [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) thành `multipart/form-data` vì dữ liệu sẽ được chia thành nhiều phần, một cho mỗi tệp cộng với một cho dữ liệu văn bản được bao gồm trong phần thân biểu mẫu (nếu văn bản cũng được nhập vào biểu mẫu).
- Bao gồm một hoặc nhiều điều khiển [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file) để cho phép người dùng chọn (các) tệp sẽ được tải lên.

Ví dụ:

```html
<form
  method="post"
  action="https://example.com/upload"
  enctype="multipart/form-data">
  <div>
    <label for="file">Choose a file</label>
    <input type="file" id="file" name="myFile" />
  </div>
  <div>
    <button>Send the file</button>
  </div>
</form>
```

> [!NOTE]
> Các máy chủ có thể được cấu hình với giới hạn kích thước cho các tệp và yêu cầu HTTP để ngăn chặn lạm dụng.

## Vấn đề bảo mật

Mỗi lần bạn gửi dữ liệu đến máy chủ, bạn cần xem xét bảo mật. Biểu mẫu HTML cho đến nay là vectơ tấn công máy chủ phổ biến nhất (nơi có thể xảy ra tấn công). Các vấn đề không bao giờ đến từ chính biểu mẫu HTML — chúng đến từ cách máy chủ xử lý dữ liệu.

Bài viết [Bảo mật trang web](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps/Website_security) của chủ đề học [phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side) của chúng ta thảo luận về một số cuộc tấn công phổ biến và các biện pháp phòng thủ tiềm năng chống lại chúng một cách chi tiết. Bạn nên đến và kiểm tra bài viết đó, để có ý tưởng về những gì có thể xảy ra.

### Hãy cẩn thận: Không bao giờ tin tưởng người dùng

Vậy, làm thế nào để bạn chống lại các mối đe dọa này? Đây là chủ đề vượt xa hướng dẫn này, nhưng có một vài quy tắc cần ghi nhớ. Quy tắc quan trọng nhất là: không bao giờ tin tưởng người dùng, kể cả chính bạn; ngay cả người dùng đáng tin cậy cũng có thể đã bị chiếm đoạt.

Tất cả dữ liệu đến máy chủ của bạn phải được kiểm tra và làm sạch. Luôn luôn. Không có ngoại lệ.

- **Thoát các ký tự có khả năng nguy hiểm**. Các ký tự cụ thể mà bạn nên cẩn thận phụ thuộc vào bối cảnh mà dữ liệu được sử dụng và nền tảng máy chủ bạn sử dụng, nhưng tất cả các ngôn ngữ phía máy chủ đều có hàm cho việc này. Những thứ cần chú ý là các chuỗi ký tự trông giống như mã có thể thực thi (chẳng hạn như các lệnh [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) hoặc [SQL](https://en.wikipedia.org/wiki/SQL)).
- **Giới hạn lượng dữ liệu đến để chỉ cho phép những gì cần thiết**.
- **Sandboxing các tệp đã tải lên**. Lưu trữ chúng trên máy chủ khác và chỉ cho phép truy cập vào tệp thông qua tên miền phụ khác hoặc thậm chí tốt hơn là thông qua một tên miền hoàn toàn khác.

Bạn sẽ có thể tránh được nhiều/hầu hết các vấn đề nếu bạn tuân theo ba quy tắc này, nhưng luôn luôn là ý tưởng tốt để kiểm tra bảo mật được thực hiện bởi bên thứ ba có năng lực. Đừng giả định rằng bạn đã thấy tất cả các vấn đề có thể xảy ra.

## Tóm tắt

Như chúng ta đã ám chỉ ở trên, gửi dữ liệu biểu mẫu thì dễ, nhưng bảo mật một ứng dụng có thể phức tạp. Chỉ cần nhớ rằng nhà phát triển front-end không phải là người nên xác định mô hình bảo mật của dữ liệu. Có thể thực hiện [kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation), nhưng máy chủ không thể tin tưởng việc kiểm tra hợp lệ này vì nó không có cách nào thực sự biết những gì đã thực sự xảy ra ở phía máy khách.

Nếu bạn đã làm việc qua các hướng dẫn này theo thứ tự, bây giờ bạn biết cách đánh dấu và tạo kiểu cho biểu mẫu, thực hiện kiểm tra hợp lệ phía máy khách, và có một số ý tưởng về cách gửi biểu mẫu.

## Xem thêm

Nếu bạn muốn tìm hiểu thêm về cách bảo mật ứng dụng web, bạn có thể đào sâu vào các tài nguyên này:

- [Các bước đầu tiên về lập trình web phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps)
- [Dự án Bảo mật Ứng dụng Web Mở (OWASP)](https://owasp.org/)
- [Web Security by Mozilla](https://infosec.mozilla.org/guidelines/web_security)

{{PreviousMenu("Learn_web_development/Extensions/Forms/Form_validation", "Learn_web_development/Extensions/Forms")}}
