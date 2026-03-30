---
title: "Hướng dẫn Django Phần 5: Tạo trang chủ"
short-title: "5: Trang chủ"
slug: Learn_web_development/Extensions/Server-side/Django/Home_page
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Admin_site", "Learn_web_development/Extensions/Server-side/Django/Generic_views", "Learn_web_development/Extensions/Server-side/Django")}}

Bây giờ chúng tôi đã sẵn sàng thêm code hiển thị trang đầy đủ đầu tiên — trang chủ cho website [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website). Trang chủ sẽ hiển thị số lượng bản ghi chúng ta có cho mỗi loại mô hình và cung cấp các liên kết điều hướng thanh bên đến các trang khác của chúng ta. Theo đó, chúng ta sẽ có kinh nghiệm thực tế trong việc viết các bản đồ URL cơ bản và khung nhìn, lấy bản ghi từ cơ sở dữ liệu và sử dụng mẫu.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Đọc phần <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Introduction">Giới thiệu về Django</a>. Hoàn thành các chủ đề hướng dẫn trước (bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site">Hướng dẫn Django Phần 4: Trang quản trị Django</a>).
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Học cách tạo các bản đồ URL và khung nhìn đơn giản (không có dữ liệu được mã hóa trong URL), lấy dữ liệu từ mô hình và tạo mẫu.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Sau khi chúng ta định nghĩa các mô hình và tạo một số bản ghi thư viện ban đầu để làm việc, đã đến lúc viết code trình bày thông tin đó cho người dùng. Điều đầu tiên chúng ta cần làm là xác định thông tin nào chúng ta muốn hiển thị trong các trang, và xác định các URL để sử dụng để trả về các tài nguyên đó. Sau đó chúng ta sẽ tạo bộ ánh xạ URL, khung nhìn và mẫu để hiển thị các trang.

Sơ đồ sau mô tả luồng dữ liệu chính và các thành phần cần thiết khi xử lý các yêu cầu và phản hồi HTTP. Vì chúng ta đã triển khai mô hình, các thành phần chính chúng ta sẽ tạo là:

- Bộ ánh xạ URL để chuyển tiếp các URL được hỗ trợ (và bất kỳ thông tin nào được mã hóa trong URL) đến các hàm khung nhìn thích hợp.
- Hàm khung nhìn để lấy dữ liệu được yêu cầu từ các mô hình, tạo các trang HTML hiển thị dữ liệu và trả về các trang cho người dùng xem trong trình duyệt.
- Mẫu để sử dụng khi hiển thị dữ liệu trong các khung nhìn.

![Main data flow diagram: URL, Model, View & Template component required when handling HTTP requests and responses in a Django application. A HTTP request hits a Django server gets forwarded to the 'urls.py' file of the URLS component. The request is forwarded to the appropriate view. The view can read and write data from the Models 'models.py' file containing the code related to models. The view also accesses the HTML file template component. The view returns the response back to the user.](basic-django.png)

Như bạn sẽ thấy trong phần tiếp theo, chúng ta có 5 trang để hiển thị, đây là quá nhiều thông tin để ghi lại trong một bài viết duy nhất. Do đó, bài viết này sẽ tập trung vào cách triển khai trang chủ, và chúng ta sẽ đề cập đến các trang khác trong một bài viết tiếp theo. Điều này sẽ cho bạn một sự hiểu biết toàn diện tốt về cách bộ ánh xạ URL, khung nhìn và mô hình hoạt động trong thực tế.

## Định nghĩa URL tài nguyên

Vì phiên bản [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) này về cơ bản là chỉ đọc cho người dùng cuối, chúng ta chỉ cần cung cấp trang landing cho trang (trang chủ), và các trang _hiển thị_ các khung nhìn danh sách và chi tiết cho sách và tác giả.

Các URL mà chúng ta sẽ cần cho các trang của mình là:

- `catalog/` — Trang chủ (index).
- `catalog/books/` — Danh sách tất cả sách.
- `catalog/authors/` — Danh sách tất cả tác giả.
- `catalog/book/<id>` — Khung nhìn chi tiết cho một sách cụ thể, với khóa chính trường là `<id>` (mặc định). Ví dụ, URL cho cuốn sách thứ ba được thêm vào danh sách sẽ là `/catalog/book/3`.
- `catalog/author/<id>` — Khung nhìn chi tiết cho tác giả cụ thể với trường khóa chính là `<id>`. Ví dụ, URL cho tác giả thứ 11 được thêm vào danh sách sẽ là `/catalog/author/11`.

Ba URL đầu tiên sẽ trả về trang index, danh sách sách và danh sách tác giả. Các URL này không mã hóa bất kỳ thông tin bổ sung nào, và các truy vấn lấy dữ liệu từ cơ sở dữ liệu sẽ luôn như nhau. Tuy nhiên, kết quả mà các truy vấn trả về sẽ phụ thuộc vào nội dung của cơ sở dữ liệu.

Ngược lại, hai URL cuối cùng sẽ hiển thị thông tin chi tiết về một sách hoặc tác giả cụ thể. Các URL này mã hóa danh tính của mục cần hiển thị (được đại diện bởi `<id>` ở trên). Bộ ánh xạ URL sẽ trích xuất thông tin được mã hóa và truyền nó đến khung nhìn, và khung nhìn sẽ quyết định động về thông tin cần lấy từ cơ sở dữ liệu. Bằng cách mã hóa thông tin trong URL, chúng ta sẽ sử dụng một tập hợp duy nhất của ánh xạ URL, khung nhìn và mẫu để xử lý tất cả sách (hoặc tác giả).

> [!NOTE]
> Với Django, bạn có thể xây dựng URL theo bất kỳ cách nào bạn yêu cầu — bạn có thể mã hóa thông tin trong phần thân của URL như được hiển thị ở trên, hoặc bao gồm các tham số `GET` trong URL, ví dụ `/book/?id=6`. Dù cách tiếp cận nào bạn sử dụng, URL nên được giữ sạch, logic và có thể đọc được, như [W3C khuyến nghị](https://www.w3.org/Provider/Style/URI).
> Tài liệu Django khuyến nghị mã hóa thông tin trong phần thân của URL để đạt được thiết kế URL tốt hơn.

Như đã đề cập trong tổng quan, phần còn lại của bài viết này mô tả cách xây dựng trang index.

## Tạo trang index

Trang đầu tiên chúng ta sẽ tạo là trang index (`catalog/`). Trang index sẽ bao gồm một số HTML tĩnh, cùng với "số đếm" được tạo ra của các bản ghi khác nhau trong cơ sở dữ liệu. Để làm cho điều này hoạt động, chúng ta sẽ tạo ánh xạ URL, khung nhìn và mẫu.

> [!NOTE]
> Đáng để chú ý thêm một chút trong phần này. Hầu hết thông tin cũng áp dụng cho các trang khác chúng ta sẽ tạo.

### Ánh xạ URL

Khi chúng ta tạo [website khung sườn](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website), chúng ta đã cập nhật tệp **locallibrary/urls.py** để đảm bảo rằng bất cứ khi nào nhận được URL bắt đầu bằng `catalog/`, module _URLConf_ `catalog.urls` sẽ xử lý chuỗi còn lại.

Đoạn code sau từ **locallibrary/urls.py** bao gồm module `catalog.urls`:

```python
urlpatterns += [
    path('catalog/', include('catalog.urls')),
]
```

> [!NOTE]
> Bất cứ khi nào Django gặp hàm nhập [`django.urls.include()`](https://docs.djangoproject.com/en/5.0/ref/urls/#django.urls.include), nó chia chuỗi URL tại ký tự kết thúc được chỉ định và gửi chuỗi còn lại đến module _URLConf_ đã được bao gồm để xử lý thêm.

Chúng ta cũng tạo tệp placeholder cho module _URLConf_, có tên **/catalog/urls.py**.
Thêm các dòng sau vào tệp đó:

```python
urlpatterns = [
    path('', views.index, name='index'),
]
```

Hàm `path()` định nghĩa như sau:

- Mẫu URL, là chuỗi rỗng: `''`. Chúng ta sẽ thảo luận về các mẫu URL chi tiết khi làm việc với các khung nhìn khác.
- Hàm khung nhìn sẽ được gọi nếu mẫu URL được phát hiện: `views.index`, là hàm có tên `index()` trong tệp **views.py**.

Hàm `path()` cũng chỉ định tham số `name`, là mã định danh duy nhất cho _ánh xạ URL cụ thể_ này. Bạn có thể sử dụng tên để "đảo ngược" bộ ánh xạ, tức là để tạo động URL trỏ đến tài nguyên mà bộ ánh xạ được thiết kế để xử lý.
Ví dụ, chúng ta có thể sử dụng tham số name để liên kết đến trang chủ của mình từ bất kỳ trang nào khác bằng cách thêm liên kết sau trong mẫu:

```django
<a href="{% url 'index' %}">Home</a>.
```

> [!NOTE]
> Chúng ta có thể mã hóa cứng liên kết như trong `<a href="/catalog/">Home</a>`), nhưng nếu chúng ta thay đổi mẫu cho trang chủ của mình, ví dụ thành `/catalog/index`) các mẫu sẽ không còn liên kết chính xác nữa. Sử dụng ánh xạ URL đảo ngược mạnh mẽ hơn.

### Khung nhìn (dựa trên hàm)

Khung nhìn là hàm xử lý yêu cầu HTTP, lấy dữ liệu cần thiết từ cơ sở dữ liệu, hiển thị dữ liệu trong trang HTML bằng cách sử dụng mẫu HTML, và sau đó trả về HTML được tạo trong phản hồi HTTP để hiển thị trang cho người dùng. Khung nhìn index tuân theo mô hình này — nó lấy thông tin về số lượng bản ghi `Book`, `BookInstance`, `BookInstance` có sẵn và `Author` mà chúng ta có trong cơ sở dữ liệu, và truyền thông tin đó cho mẫu để hiển thị.

Mở **catalog/views.py** và lưu ý rằng tệp đã nhập hàm shortcut [render()](https://docs.djangoproject.com/en/5.0/topics/http/shortcuts/#django.shortcuts.render) để tạo tệp HTML bằng cách sử dụng mẫu và dữ liệu:

```python
from django.shortcuts import render

# Create your views here.
```

Dán các dòng sau vào cuối tệp:

```python
from .models import Book, Author, BookInstance, Genre

def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()

    # Available books (status = 'a')
    num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_authors = Author.objects.count()

    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)
```

Dòng đầu tiên nhập các lớp mô hình mà chúng ta sẽ sử dụng để truy cập dữ liệu trong tất cả các khung nhìn của mình.

Phần đầu của hàm khung nhìn lấy số lượng bản ghi bằng cách sử dụng thuộc tính `objects.all()` trên các lớp mô hình. Nó cũng lấy danh sách các đối tượng `BookInstance` có giá trị 'a' (Available) trong trường trạng thái. Bạn có thể tìm thêm thông tin về cách truy cập dữ liệu mô hình trong hướng dẫn trước của chúng ta [Hướng dẫn Django Phần 3: Sử dụng mô hình > Tìm kiếm bản ghi](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Models#searching_for_records).

Ở cuối hàm khung nhìn chúng ta gọi hàm `render()` để tạo trang HTML và trả về trang dưới dạng phản hồi. Hàm shortcut này bọc một số hàm khác để đơn giản hóa một trường hợp sử dụng rất phổ biến. Hàm `render()` chấp nhận các tham số sau:

- đối tượng `request` gốc, là `HttpRequest`.
- một mẫu HTML với các placeholder cho dữ liệu.
- biến `context`, là từ điển Python, chứa dữ liệu để chèn vào các placeholder.

Chúng ta sẽ nói thêm về các mẫu và biến `context` trong phần tiếp theo. Hãy bắt đầu tạo mẫu của chúng ta để chúng ta thực sự có thể hiển thị gì đó cho người dùng!

### Mẫu

Mẫu là tệp văn bản xác định cấu trúc hoặc bố cục của tệp (chẳng hạn như trang HTML), nó sử dụng các placeholder để đại diện cho nội dung thực tế.

Ứng dụng Django được tạo bằng **startapp** (như khung sườn của ví dụ này) sẽ tìm kiếm mẫu trong thư mục con có tên '**templates**' của các ứng dụng của bạn. Ví dụ, trong khung nhìn index mà chúng ta vừa thêm, hàm `render()` sẽ mong đợi tìm thấy tệp **_index.html_** trong **/django-locallibrary-tutorial/catalog/templates/** và sẽ gây ra lỗi nếu tệp không có mặt.

Bạn có thể kiểm tra điều này bằng cách lưu các thay đổi trước đó và truy cập `127.0.0.1:8000` trong trình duyệt của bạn - nó sẽ hiển thị thông báo lỗi khá trực quan: "TemplateDoesNotExist at /catalog/", và các chi tiết khác.

> [!NOTE]
> Dựa trên tệp cài đặt của dự án, Django sẽ tìm kiếm mẫu ở một số nơi, tìm kiếm trong các ứng dụng đã cài đặt của bạn theo mặc định. Bạn có thể tìm hiểu thêm về cách Django tìm kiếm mẫu và những định dạng mẫu nào nó hỗ trợ trong [phần Templates của tài liệu Django](https://docs.djangoproject.com/en/5.0/topics/templates/).

#### Mở rộng mẫu

Mẫu index sẽ cần đánh dấu HTML chuẩn cho đầu và thân, cùng với các phần điều hướng để liên kết đến các trang khác của trang (mà chúng ta chưa tạo), và đến các phần hiển thị văn bản giới thiệu và dữ liệu sách.

Phần lớn HTML và cấu trúc điều hướng sẽ giống nhau trong mỗi trang của trang chúng ta. Thay vì sao chép boilerplate code trên mỗi trang, bạn có thể sử dụng ngôn ngữ mẫu Django để khai báo mẫu cơ sở, và sau đó mở rộng nó để chỉ thay thế các phần khác nhau cho mỗi trang cụ thể.

Đoạn code sau là mẫu cơ sở mẫu từ tệp **base_generic.html**.
Chúng ta sẽ sớm tạo mẫu cho LocalLibrary.
Mẫu bên dưới bao gồm HTML phổ biến với các phần cho tiêu đề, thanh bên và nội dung chính được đánh dấu với các thẻ mẫu `block` và `endblock` được đặt tên.
Bạn có thể để các khối trống, hoặc bao gồm nội dung mặc định để sử dụng khi hiển thị các trang được dẫn xuất từ mẫu.

> [!NOTE]
> Thẻ mẫu* là các hàm bạn có thể sử dụng trong mẫu để lặp qua danh sách, thực hiện các hoạt động có điều kiện dựa trên giá trị của biến, v.v. Ngoài thẻ mẫu, cú pháp mẫu cho phép bạn tham chiếu đến các biến được truyền vào mẫu từ khung nhìn và sử dụng \_bộ lọc mẫu* để định dạng các biến (ví dụ: để chuyển đổi chuỗi thành chữ thường).

```django
<!doctype html>
<html lang="en">
  <head>
    {% block title %}
      <title>Local Library</title>
    {% endblock %}
  </head>
  <body>
    {% block sidebar %}
      <!-- insert default navigation text for every page -->
    {% endblock %}
    {% block content %}
      <!-- default content text (typically empty) -->
    {% endblock %}
  </body>
</html>
```

Khi định nghĩa mẫu cho một khung nhìn cụ thể, chúng ta đầu tiên chỉ định mẫu cơ sở bằng thẻ mẫu `extends` — xem mẫu code bên dưới. Sau đó chúng ta khai báo những phần nào từ mẫu chúng ta muốn thay thế (nếu có), sử dụng các phần `block`/`endblock` như trong mẫu cơ sở.

Ví dụ, đoạn code bên dưới chỉ cách sử dụng thẻ mẫu `extends` và ghi đè khối `content`. HTML được tạo sẽ bao gồm code và cấu trúc được định nghĩa trong mẫu cơ sở, bao gồm nội dung mặc định bạn đã định nghĩa trong khối `title`, nhưng khối `content` mới thay thế mặc định.

```django
{% extends "base_generic.html" %}

{% block content %}
  <h1>Local Library Home</h1>
  <p>
    Welcome to LocalLibrary, a website developed by
    <em>Mozilla Developer Network</em>!
  </p>
{% endblock %}
```

#### Mẫu cơ sở LocalLibrary

Chúng ta sẽ sử dụng đoạn code sau như mẫu cơ sở cho website _LocalLibrary_. Như bạn có thể thấy, nó chứa một số code HTML và định nghĩa các khối cho `title`, `sidebar` và `content`. Chúng ta có tiêu đề mặc định và thanh bên mặc định với các liên kết đến danh sách tất cả sách và tác giả, cả hai đều được đặt trong các khối để dễ dàng thay đổi trong tương lai.

> [!NOTE]
> Chúng tôi cũng giới thiệu hai thẻ mẫu bổ sung: `url` và `load static`. Những thẻ này sẽ được giải thích trong các phần sau.

Tạo tệp mới **base_generic.html** trong **/django-locallibrary-tutorial/catalog/templates/** và dán code sau vào tệp:

```django
<!doctype html>
<html lang="en">
  <head>
    {% block title %}
      <title>Local Library</title>
    {% endblock %}
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous">
    <!-- Add additional CSS in static file -->
    {% load static %}
    <link rel="stylesheet" href="{% static 'css/styles.css' %}" />
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-2">
          {% block sidebar %}
            <ul class="sidebar-nav">
              <li><a href="{% url 'index' %}">Home</a></li>
              <li><a href="">All books</a></li>
              <li><a href="">All authors</a></li>
            </ul>
          {% endblock %}
        </div>
        <div class="col-sm-10 ">{% block content %}{% endblock %}</div>
      </div>
    </div>
  </body>
</html>
```

Mẫu bao gồm CSS từ [Bootstrap](https://getbootstrap.com/) để cải thiện bố cục và trình bày của trang HTML. Sử dụng Bootstrap (hoặc framework web phía client khác) là cách nhanh để tạo trang hấp dẫn hiển thị tốt trên các kích thước màn hình khác nhau.

Mẫu cơ sở cũng tham chiếu đến tệp CSS cục bộ (**styles.css**) cung cấp styling bổ sung. Tạo tệp **styles.css** trong **/django-locallibrary-tutorial/catalog/static/css/** và dán code sau vào tệp:

```css
.sidebar-nav {
  margin-top: 20px;
  padding: 0;
  list-style: none;
}
```

#### Mẫu index

Tạo tệp HTML mới **index.html** trong **/django-locallibrary-tutorial/catalog/templates/** và dán code sau vào tệp.
Code này mở rộng mẫu cơ sở của chúng ta trên dòng đầu tiên, và sau đó thay thế khối `content` mặc định cho mẫu.

```django
{% extends "base_generic.html" %}

{% block content %}
  <h1>Local Library Home</h1>
  <p>
    Welcome to LocalLibrary, a website developed by
    <em>Mozilla Developer Network</em>!
  </p>
  <h2>Dynamic content</h2>
  <p>The library has the following record counts:</p>
  <ul>
    <li><strong>Books:</strong> \{{ num_books }}</li>
    <li><strong>Copies:</strong> \{{ num_instances }}</li>
    <li><strong>Copies available:</strong> \{{ num_instances_available }}</li>
    <li><strong>Authors:</strong> \{{ num_authors }}</li>
  </ul>
{% endblock %}
```

Trong phần _Dynamic content_ chúng ta khai báo các placeholder (_biến mẫu_) cho thông tin từ khung nhìn mà chúng ta muốn bao gồm.
Các biến được đặt trong dấu ngoặc nhọn kép (handlebars).

> [!NOTE]
> Bạn có thể dễ dàng nhận ra các biến mẫu và thẻ mẫu (hàm) - các biến được đặt trong dấu ngoặc nhọn kép (`\{{ num_books }}`), và các thẻ được đặt trong dấu ngoặc nhọn đơn với dấu phần trăm (`{% extends "base_generic.html" %}`).

Điều quan trọng cần lưu ý ở đây là các biến được đặt tên với _các khóa_ mà chúng ta truyền vào từ điển `context` trong hàm `render()` của khung nhìn (xem mẫu dưới đây).
Các biến sẽ được thay thế bằng _giá trị_ liên quan của chúng khi mẫu được hiển thị.

```python
context = {
    'num_books': num_books,
    'num_instances': num_instances,
    'num_instances_available': num_instances_available,
    'num_authors': num_authors,
}

return render(request, 'index.html', context=context)
```

#### Tham chiếu tệp tĩnh trong mẫu

Dự án của bạn có thể sử dụng các tài nguyên tĩnh, bao gồm JavaScript, CSS và hình ảnh. Vì vị trí của những tệp này có thể không được biết (hoặc có thể thay đổi), Django cho phép bạn chỉ định vị trí trong các mẫu của mình liên quan đến cài đặt toàn cục `STATIC_URL`. Website khung sườn mặc định đặt giá trị của `STATIC_URL` là `"/static/"`, nhưng bạn có thể chọn lưu trữ chúng trên mạng phân phối nội dung hoặc nơi khác.

Trong mẫu, trước tiên bạn gọi thẻ mẫu `load` chỉ định "static" để thêm thư viện mẫu, như được hiển thị trong mẫu code bên dưới. Sau đó bạn có thể sử dụng thẻ mẫu `static` và chỉ định URL tương đối đến tệp cần thiết.

```django
<!-- Add additional CSS in static file -->
{% load static %}
<link rel="stylesheet" href="{% static 'css/styles.css' %}" />
```

Bạn có thể thêm hình ảnh vào trang theo cách tương tự, ví dụ:

```django
{% load static %}
<img
  src="{% static 'images/local_library_model_uml.png' %}"
  alt="UML diagram"
  style="width:555px;height:540px;" />
```

> [!NOTE]
> Các mẫu trên chỉ định nơi các tệp được đặt, nhưng Django không phục vụ chúng theo mặc định. Chúng tôi đã cấu hình máy chủ web phát triển để phục vụ tệp bằng cách sửa đổi bộ ánh xạ URL toàn cục (**/django-locallibrary-tutorial/locallibrary/urls.py**) khi chúng tôi [tạo khung sườn website](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website), nhưng vẫn cần bật phục vụ tệp trong môi trường sản xuất. Chúng ta sẽ xem xét điều này sau.

Để biết thêm thông tin về làm việc với tệp tĩnh xem [Managing static files](https://docs.djangoproject.com/en/5.0/howto/static-files/) trong tài liệu Django.

#### Liên kết đến URL

Mẫu cơ sở ở trên đã giới thiệu thẻ mẫu `url`.

```django
<li><a href="{% url 'index' %}">Home</a></li>
```

Thẻ này chấp nhận tên hàm `path()` được gọi trong **urls.py** và các giá trị cho bất kỳ đối số nào mà khung nhìn liên quan sẽ nhận từ hàm đó, và trả về URL bạn có thể sử dụng để liên kết đến tài nguyên.

#### Cấu hình nơi tìm kiếm mẫu

Vị trí nơi Django tìm kiếm mẫu được chỉ định trong đối tượng `TEMPLATES` trong tệp **settings.py**.
Tệp **settings.py** mặc định (được tạo cho hướng dẫn này) trông giống như thế này:

```python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
```

Cài đặt `'APP_DIRS': True`, là quan trọng nhất, vì nó cho Django biết để tìm kiếm mẫu trong thư mục con của mỗi ứng dụng trong dự án, có tên "templates" (điều này giúp nhóm các mẫu với ứng dụng liên quan của chúng để dễ tái sử dụng).

Chúng ta cũng có thể chỉ định các vị trí cụ thể để Django tìm kiếm thư mục bằng cách sử dụng `'DIRS': []` (nhưng điều đó chưa cần thiết).

> [!NOTE]
> Bạn có thể tìm hiểu thêm về cách Django tìm kiếm mẫu và những định dạng mẫu nào nó hỗ trợ trong [phần Templates của tài liệu Django](https://docs.djangoproject.com/en/5.0/topics/templates/).

## Trông như thế nào?

Tại thời điểm này, chúng ta đã tạo tất cả tài nguyên cần thiết để hiển thị trang index. Chạy máy chủ (`python3 manage.py runserver`) và mở `http://127.0.0.1:8000/` trong trình duyệt của bạn. Nếu mọi thứ được cấu hình đúng, trang của bạn sẽ trông như ảnh chụp màn hình sau.

![Index page for LocalLibrary website](index_page_ok.png)

> [!NOTE]
> Các liên kết **All books** và **All authors** sẽ chưa hoạt động vì các đường dẫn, khung nhìn và mẫu cho những trang đó chưa được định nghĩa. Chúng ta chỉ chèn các placeholder cho những liên kết đó trong mẫu `base_generic.html`.

## Tự thách thức bản thân

Đây là một vài nhiệm vụ để kiểm tra sự quen thuộc của bạn với truy vấn mô hình, khung nhìn và mẫu.

1. Mẫu cơ sở [LocalLibrary](#the_locallibrary_base_template) bao gồm khối `title`. Ghi đè khối này trong [mẫu index](#the_index_template) và tạo tiêu đề mới cho trang.

   > [!NOTE]
   > Phần [Mở rộng mẫu](#extending_templates) giải thích cách tạo các khối và mở rộng khối trong một mẫu khác.

2. Sửa đổi [khung nhìn](#view_function-based) để tạo số đếm cho _các thể loại_ và _sách_ chứa một từ cụ thể (không phân biệt chữ hoa chữ thường), và truyền kết quả cho `context`. Bạn thực hiện điều này theo cách tương tự như tạo và sử dụng `num_books` và `num_instances_available`. Sau đó cập nhật [mẫu index](#the_index_template) để bao gồm các biến này.

## Tóm tắt

Chúng ta vừa tạo trang chủ cho trang của mình — một trang HTML hiển thị một số bản ghi từ cơ sở dữ liệu và liên kết đến các trang khác chưa được tạo. Theo đó, chúng ta đã học thông tin cơ bản về bộ ánh xạ URL, khung nhìn, truy vấn cơ sở dữ liệu với mô hình, truyền thông tin đến mẫu từ khung nhìn và tạo và mở rộng mẫu.

Trong bài viết tiếp theo, chúng tôi sẽ dựa trên kiến thức này để tạo bốn trang còn lại của website.

## Xem thêm

- [Writing your first Django app, part 3: Views and Templates](https://docs.djangoproject.com/en/5.0/intro/tutorial03/) (Django docs)
- [URL dispatcher](https://docs.djangoproject.com/en/5.0/topics/http/urls/) (Django docs)
- [View functions](https://docs.djangoproject.com/en/5.0/topics/http/views/) (Django docs)
- [Templates](https://docs.djangoproject.com/en/5.0/topics/templates/) (Django docs)
- [Managing static files](https://docs.djangoproject.com/en/5.0/howto/static-files/) (Django docs)
- [Django shortcut functions](https://docs.djangoproject.com/en/5.0/topics/http/shortcuts/#django.shortcuts.render) (Django docs)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Admin_site", "Learn_web_development/Extensions/Server-side/Django/Generic_views", "Learn_web_development/Extensions/Server-side/Django")}}
