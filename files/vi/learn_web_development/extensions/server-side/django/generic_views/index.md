---
title: "Django Tutorial Part 6: Generic list and detail views"
short-title: "6: Generic list and detail views"
slug: Learn_web_development/Extensions/Server-side/Django/Generic_views
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Home_page", "Learn_web_development/Extensions/Server-side/Django/Sessions", "Learn_web_development/Extensions/Server-side/Django")}}

Hướng dẫn này mở rộng trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) của chúng ta, thêm các trang danh sách và chi tiết cho sách và tác giả. Ở đây chúng ta sẽ tìm hiểu về các khung nhìn tổng quát dựa trên lớp, và trình bày cách chúng có thể giảm lượng code cần viết cho các trường hợp sử dụng phổ biến. Chúng ta cũng sẽ đi sâu hơn vào việc xử lý URL, trình bày cách thực hiện khớp mẫu cơ bản.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Home_page">Django Tutorial Part 5: Creating our home page</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu được nơi và cách sử dụng các khung nhìn tổng quát dựa trên lớp, và cách trích xuất các mẫu từ URL và truyền thông tin đến các khung nhìn.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Trong hướng dẫn này chúng ta sẽ hoàn thành phiên bản đầu tiên của trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) bằng cách thêm các trang danh sách và chi tiết cho sách và tác giả (hay nói chính xác hơn, chúng ta sẽ trình bày cách triển khai các trang sách, và để bạn tự tạo các trang tác giả!)

Quy trình tương tự như tạo trang chủ, mà chúng ta đã trình bày trong hướng dẫn trước. Chúng ta vẫn cần tạo bản đồ URL, khung nhìn và mẫu. Sự khác biệt chính là đối với các trang chi tiết, chúng ta sẽ có thêm thách thức là trích xuất thông tin từ các mẫu trong URL và truyền nó đến khung nhìn. Đối với các trang này, chúng ta sẽ trình bày một loại khung nhìn hoàn toàn khác: khung nhìn tổng quát dựa trên lớp cho danh sách và chi tiết. Các khung nhìn này có thể giảm đáng kể lượng code khung nhìn cần thiết, giúp chúng dễ viết và bảo trì hơn.

Phần cuối của hướng dẫn sẽ trình bày cách phân trang dữ liệu của bạn khi sử dụng các khung nhìn tổng quát dựa trên lớp.

## Trang danh sách sách

Trang danh sách sách sẽ hiển thị danh sách tất cả các bản ghi sách có sẵn trong trang, được truy cập qua URL: `catalog/books/`. Trang sẽ hiển thị tiêu đề và tác giả cho mỗi bản ghi, với tiêu đề là một liên kết đến trang chi tiết sách tương ứng. Trang sẽ có cùng cấu trúc và điều hướng như tất cả các trang khác trong trang web, và do đó chúng ta có thể mở rộng mẫu cơ sở (**base_generic.html**) mà chúng ta đã tạo trong hướng dẫn trước.

### Ánh xạ URL

Mở **/catalog/urls.py** và sao chép dòng thiết lập đường dẫn cho `'books/'`, như được hiển thị bên dưới.
Giống như trang chủ, hàm `path()` này định nghĩa một mẫu để khớp với URL (**'books/'**), một hàm khung nhìn sẽ được gọi nếu URL khớp (`views.BookListView.as_view()`), và một tên cho ánh xạ cụ thể này.

```python
urlpatterns = [
    path('', views.index, name='index'),
    path('books/', views.BookListView.as_view(), name='books'),
]
```

Như đã thảo luận trong hướng dẫn trước, URL phải đã khớp với `/catalog`, vì vậy khung nhìn thực sự sẽ được gọi cho URL: `/catalog/books/`.

Hàm khung nhìn có định dạng khác với trước — đó là vì khung nhìn này thực sự sẽ được triển khai như một lớp. Chúng ta sẽ kế thừa từ một hàm khung nhìn tổng quát hiện có mà đã thực hiện hầu hết những gì chúng ta muốn hàm khung nhìn này làm, thay vì viết lại từ đầu.

Đối với các khung nhìn dựa trên lớp trong Django, chúng ta truy cập một hàm khung nhìn thích hợp bằng cách gọi phương thức lớp `as_view()`. Phương thức này thực hiện tất cả các công việc tạo một thể hiện của lớp và đảm bảo rằng các phương thức xử lý đúng được gọi cho các yêu cầu HTTP đến.

### Khung nhìn (dựa trên lớp)

Chúng ta có thể dễ dàng viết khung nhìn danh sách sách như một hàm thông thường (giống như khung nhìn chỉ mục trước đây của chúng ta), nơi sẽ truy vấn cơ sở dữ liệu cho tất cả sách, và sau đó gọi `render()` để truyền danh sách đến một mẫu đã chỉ định. Thay vào đó, chúng ta sẽ sử dụng một khung nhìn danh sách tổng quát dựa trên lớp (`ListView`) — một lớp kế thừa từ một khung nhìn hiện có. Vì khung nhìn tổng quát đã triển khai hầu hết các chức năng chúng ta cần và tuân theo các thực hành tốt nhất của Django, chúng ta có thể tạo một khung nhìn danh sách mạnh mẽ hơn với ít code hơn, ít lặp lại hơn, và cuối cùng là ít bảo trì hơn.

Mở **catalog/views.py**, và sao chép code sau vào cuối tệp:

```python
from django.views import generic

class BookListView(generic.ListView):
    model = Book
```

Chỉ vậy thôi! Khung nhìn tổng quát sẽ truy vấn cơ sở dữ liệu để lấy tất cả các bản ghi cho mô hình đã chỉ định (`Book`), sau đó hiển thị một mẫu đặt tại **/django-locallibrary-tutorial/catalog/templates/catalog/book_list.html** (mà chúng ta sẽ tạo bên dưới). Trong mẫu, bạn có thể truy cập danh sách sách bằng biến mẫu có tên `object_list` HOẶC `book_list` (tức là, tổng quát `<the model name>_list`).

> [!NOTE]
> Đường dẫn khó hiểu này cho vị trí mẫu không phải là lỗi đánh máy — các khung nhìn tổng quát tìm kiếm mẫu trong `/application_name/the_model_name_list.html` (`catalog/book_list.html` trong trường hợp này) bên trong thư mục `/application_name/templates/` của ứng dụng (`/catalog/templates/)`).

Bạn có thể thêm các thuộc tính để thay đổi hành vi mặc định ở trên. Ví dụ, bạn có thể chỉ định tệp mẫu khác nếu bạn cần có nhiều khung nhìn sử dụng cùng một mô hình, hoặc bạn có thể muốn sử dụng tên biến mẫu khác nếu `book_list` không trực quan cho trường hợp sử dụng mẫu cụ thể của bạn. Có thể biến thể hữu ích nhất là thay đổi/lọc tập hợp con kết quả được trả về — vì vậy thay vì liệt kê tất cả sách, bạn có thể liệt kê 5 cuốn sách hàng đầu được người dùng khác đọc.

```python
class BookListView(generic.ListView):
    model = Book
    context_object_name = 'book_list'   # your own name for the list as a template variable
    queryset = Book.objects.filter(title__icontains='war')[:5] # Get 5 books containing the title war
    template_name = 'books/my_arbitrary_template_name_list.html'  # Specify your own template name/location
```

#### Ghi đè các phương thức trong các khung nhìn dựa trên lớp

Mặc dù chúng ta không cần làm như vậy ở đây, bạn cũng có thể ghi đè một số phương thức của lớp.

Ví dụ, chúng ta có thể ghi đè phương thức `get_queryset()` để thay đổi danh sách các bản ghi được trả về. Điều này linh hoạt hơn so với chỉ thiết lập thuộc tính `queryset` như chúng ta đã làm trong đoạn code trước đó (mặc dù không có lợi ích thực sự trong trường hợp này):

```python
class BookListView(generic.ListView):
    model = Book

    def get_queryset(self):
        return Book.objects.filter(title__icontains='war')[:5] # Get 5 books containing the title war
```

Chúng ta cũng có thể ghi đè `get_context_data()` để truyền thêm các biến ngữ cảnh đến mẫu (ví dụ: danh sách sách được truyền theo mặc định). Đoạn code bên dưới cho thấy cách thêm một biến có tên `some_data` vào ngữ cảnh (sau đó nó sẽ có sẵn như một biến mẫu).

```python
class BookListView(generic.ListView):
    model = Book

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get the context
        context = super(BookListView, self).get_context_data(**kwargs)
        # Create any data and add it to the context
        context['some_data'] = 'This is just some data'
        return context
```

Khi làm điều này, điều quan trọng là phải tuân theo mẫu được sử dụng ở trên:

- Đầu tiên lấy ngữ cảnh hiện có từ lớp cha.
- Sau đó thêm thông tin ngữ cảnh mới của bạn.
- Sau đó trả về ngữ cảnh mới (đã cập nhật).

> [!NOTE]
> Xem [Built-in class-based generic views](https://docs.djangoproject.com/en/5.0/topics/class-based-views/generic-display/) (tài liệu Django) để biết thêm nhiều ví dụ về những gì bạn có thể làm.

### Tạo mẫu Khung nhìn Danh sách

Tạo tệp HTML **/django-locallibrary-tutorial/catalog/templates/catalog/book_list.html** và sao chép văn bản bên dưới. Như đã thảo luận ở trên, đây là tệp mẫu mặc định được mong đợi bởi khung nhìn danh sách tổng quát dựa trên lớp (cho một mô hình có tên `Book` trong một ứng dụng có tên `catalog`).

Các mẫu cho các khung nhìn tổng quát giống như bất kỳ mẫu nào khác (mặc dù tất nhiên ngữ cảnh/thông tin được truyền đến mẫu có thể khác nhau).
Giống như mẫu _index_ của chúng ta, chúng ta mở rộng mẫu cơ sở trong dòng đầu tiên và sau đó thay thế khối có tên `content`.

```django
{% extends "base_generic.html" %}

{% block content %}
  <h1>Book List</h1>
  {% if book_list %}
    <ul>
      {% for book in book_list %}
      <li>
        <a href="\{{ book.get_absolute_url }}">\{{ book.title }}</a>
        (\{{book.author}})
      </li>
      {% endfor %}
    </ul>
  {% else %}
    <p>There are no books in the library.</p>
  {% endif %}
{% endblock %}
```

Khung nhìn truyền ngữ cảnh (danh sách sách) theo mặc định như các bí danh `object_list` và `book_list`; cả hai đều hoạt động.

#### Thực thi có điều kiện

Chúng ta sử dụng các thẻ mẫu [`if`](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/#if), `else`, và `endif` để kiểm tra xem `book_list` đã được định nghĩa và không trống hay chưa.
Nếu `book_list` trống, thì mệnh đề `else` hiển thị văn bản giải thích rằng không có sách nào để liệt kê.
Nếu `book_list` không trống, thì chúng ta lặp qua danh sách sách.

```django
{% if book_list %}
  <!-- code here to list the books -->
{% else %}
  <p>There are no books in the library.</p>
{% endif %}
```

Điều kiện trên chỉ kiểm tra một trường hợp, nhưng bạn có thể kiểm tra các điều kiện bổ sung bằng cách sử dụng thẻ mẫu `elif` (ví dụ: `{% elif var2 %}`).
Để biết thêm thông tin về các toán tử điều kiện, hãy xem: [if](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/#if), [ifequal/ifnotequal](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/#ifequal-and-ifnotequal), và [ifchanged](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/#ifchanged) trong [Built-in template tags and filters](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/) (Tài liệu Django).

#### Vòng lặp For

Mẫu sử dụng các thẻ mẫu [for](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/#for) và `endfor` để lặp qua danh sách sách, như được hiển thị bên dưới.
Mỗi lần lặp điền vào biến mẫu `book` với thông tin cho mục danh sách hiện tại.

```django
{% for book in book_list %}
  <li><!-- code here get information from each book item --></li>
{% endfor %}
```

Bạn cũng có thể sử dụng thẻ mẫu `{% empty %}` để định nghĩa những gì xảy ra nếu danh sách sách trống (mặc dù mẫu của chúng ta chọn sử dụng điều kiện thay thế):

```django
<ul>
  {% for book in book_list %}
    <li><!-- code here get information from each book item --></li>
  {% empty %}
    <p>There are no books in the library.</p>
  {% endfor %}
</ul>
```

Mặc dù không được sử dụng ở đây, trong vòng lặp Django cũng sẽ tạo ra các biến khác mà bạn có thể sử dụng để theo dõi việc lặp.
Ví dụ, bạn có thể kiểm tra biến `forloop.last` để thực hiện xử lý có điều kiện trong lần chạy vòng lặp cuối cùng.

#### Truy cập các biến

Code bên trong vòng lặp tạo ra một mục danh sách cho mỗi cuốn sách cho thấy cả tiêu đề (như một liên kết đến khung nhìn chi tiết chưa được tạo) và tác giả.

```django
<a href="\{{ book.get_absolute_url }}">\{{ book.title }}</a> (\{{book.author}})
```

Chúng ta truy cập các _trường_ của bản ghi sách liên quan bằng cách sử dụng "ký hiệu dấu chấm" (ví dụ: `book.title` và `book.author`), trong đó văn bản theo sau mục `book` là tên trường (như được định nghĩa trong mô hình).

Chúng ta cũng có thể gọi _hàm_ trong mô hình từ bên trong mẫu của chúng ta — trong trường hợp này chúng ta gọi `Book.get_absolute_url()` để lấy URL bạn có thể sử dụng để hiển thị bản ghi chi tiết liên quan. Điều này hoạt động miễn là hàm không có bất kỳ đối số nào (không có cách nào để truyền đối số!)

> [!NOTE]
> Chúng ta phải cẩn thận một chút về "tác dụng phụ" khi gọi các hàm trong mẫu. Ở đây chúng ta chỉ lấy URL để hiển thị, nhưng một hàm có thể làm hầu hết mọi thứ — chúng ta sẽ không muốn xóa cơ sở dữ liệu của mình (ví dụ) chỉ bằng cách hiển thị mẫu!

#### Cập nhật mẫu cơ sở

Mở mẫu cơ sở (**/django-locallibrary-tutorial/catalog/templates/_base_generic.html_**) và chèn **{% url 'books' %}** vào liên kết URL cho **All books**, như được hiển thị bên dưới. Điều này sẽ kích hoạt liên kết trong tất cả các trang (chúng ta có thể đặt thành công điều này ngay bây giờ vì chúng ta đã tạo bộ ánh xạ URL "books").

```django
<li><a href="{% url 'index' %}">Home</a></li>
<li><a href="{% url 'books' %}">All books</a></li>
<li><a href="">All authors</a></li>
```

### Nó trông như thế nào?

Bạn chưa thể xây dựng trang danh sách sách, vì chúng ta vẫn còn thiếu một phụ thuộc — bản đồ URL cho các trang chi tiết sách, cần thiết để tạo các siêu liên kết đến từng cuốn sách. Chúng ta sẽ hiển thị cả khung nhìn danh sách và chi tiết sau phần tiếp theo.

## Trang chi tiết sách

Trang chi tiết sách sẽ hiển thị thông tin về một cuốn sách cụ thể, được truy cập qua URL `catalog/book/<id>` (trong đó `<id>` là khóa chính cho cuốn sách). Ngoài các trường trong mô hình `Book` (tác giả, tóm tắt, ISBN, ngôn ngữ và thể loại), chúng ta cũng sẽ liệt kê các chi tiết của các bản sao có sẵn (`BookInstances`) bao gồm trạng thái, ngày trả hạn dự kiến, bản in và id. Điều này sẽ cho phép độc giả của chúng ta không chỉ tìm hiểu về cuốn sách, mà còn xác nhận xem/khi nào nó có sẵn.

### Ánh xạ URL

Mở **/catalog/urls.py** và thêm đường dẫn có tên '**book-detail**' như được hiển thị bên dưới.
Hàm `path()` này định nghĩa một mẫu, khung nhìn chi tiết tổng quát dựa trên lớp liên quan, và một tên.

```python
urlpatterns = [
    path('', views.index, name='index'),
    path('books/', views.BookListView.as_view(), name='books'),
    path('book/<int:pk>', views.BookDetailView.as_view(), name='book-detail'),
]
```

Đối với đường dẫn _book-detail_, mẫu URL sử dụng cú pháp đặc biệt để nắm bắt id cụ thể của cuốn sách mà chúng ta muốn xem.
Cú pháp rất đơn giản: dấu ngoặc nhọn định nghĩa phần của URL sẽ được nắm bắt, bao quanh tên biến mà khung nhìn có thể sử dụng để truy cập dữ liệu đã nắm bắt.
Ví dụ, **\<something>**, sẽ nắm bắt mẫu được đánh dấu và truyền giá trị đến khung nhìn như một biến "something". Bạn có thể tùy chọn đặt trước tên biến một [đặc tả bộ chuyển đổi](https://docs.djangoproject.com/en/5.0/topics/http/urls/#path-converters) xác định loại dữ liệu (int, str, slug, uuid, path).

Trong trường hợp này chúng ta sử dụng `'<int:pk>'` để nắm bắt id sách, phải là một chuỗi được định dạng đặc biệt và truyền nó đến khung nhìn như một tham số có tên `pk` (viết tắt của khóa chính). Đây là id đang được sử dụng để lưu trữ cuốn sách duy nhất trong cơ sở dữ liệu, như được định nghĩa trong Mô hình Sách.

> [!NOTE]
> Như đã thảo luận trước đây, URL khớp của chúng ta thực sự là `catalog/book/<digits>` (vì chúng ta đang ở trong ứng dụng **catalog**, `/catalog/` được giả định).

> [!WARNING]
> Khung nhìn chi tiết tổng quát dựa trên lớp _mong đợi_ được truyền một tham số có tên **pk**. Nếu bạn đang viết khung nhìn hàm của riêng mình, bạn có thể sử dụng bất kỳ tên tham số nào bạn muốn, hoặc thực sự truyền thông tin trong một đối số không có tên.

#### Khớp đường dẫn nâng cao/Giới thiệu biểu thức chính quy

> [!NOTE]
> Bạn sẽ không cần phần này để hoàn thành hướng dẫn! Chúng tôi cung cấp nó vì biết tùy chọn này có thể hữu ích trong tương lai Django của bạn.

Khớp mẫu được cung cấp bởi `path()` đơn giản và hữu ích cho các trường hợp (rất phổ biến) khi bạn chỉ muốn nắm bắt _bất kỳ_ chuỗi hoặc số nguyên nào. Nếu bạn cần lọc tinh tế hơn (ví dụ: để lọc chỉ các chuỗi có một số lượng ký tự nhất định), thì bạn có thể sử dụng phương thức [re_path()](https://docs.djangoproject.com/en/5.0/ref/urls/#django.urls.re_path).

Phương thức này được sử dụng giống như `path()` ngoại trừ nó cho phép bạn chỉ định một mẫu bằng cách sử dụng [Biểu thức chính quy](https://docs.python.org/3/library/re.html). Ví dụ, đường dẫn trước có thể đã được viết như được hiển thị bên dưới:

```python
re_path(r'^book/(?P<pk>\d+)$', views.BookDetailView.as_view(), name='book-detail'),
```

_Biểu thức chính quy_ là một công cụ ánh xạ mẫu cực kỳ mạnh mẽ. Chúng, thành thật mà nói, khá không trực quan và có thể gây sợ hãi cho người mới bắt đầu. Dưới đây là một giới thiệu rất ngắn!

Điều đầu tiên cần biết là biểu thức chính quy thường nên được khai báo bằng cú pháp chuỗi ký tự thô (tức là, chúng được đặt trong dấu ngoặc như được hiển thị: **r'\<your regular expression text goes here>'**).

Các phần chính của cú pháp mà bạn cần biết để khai báo các khớp mẫu là:

<table class="standard-table no-markdown">
  <thead>
    <tr>
      <th scope="col">Ký hiệu</th>
      <th scope="col">Ý nghĩa</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>^</td>
      <td>Khớp với phần đầu của văn bản</td>
    </tr>
    <tr>
      <td>$</td>
      <td>Khớp với phần cuối của văn bản</td>
    </tr>
    <tr>
      <td>\d</td>
      <td>Khớp với một chữ số (0, 1, 2, … 9)</td>
    </tr>
    <tr>
      <td>\w</td>
      <td>
        Khớp với một ký tự từ, ví dụ: bất kỳ ký tự viết hoa hoặc viết thường nào trong
        bảng chữ cái, chữ số hoặc ký tự gạch dưới (_)
      </td>
    </tr>
    <tr>
      <td>+</td>
      <td>
        Khớp với một hoặc nhiều ký tự trước đó. Ví dụ, để khớp một
        hoặc nhiều chữ số bạn sẽ sử dụng <code>\d+</code>. Để khớp một hoặc nhiều ký tự "a"
        bạn có thể sử dụng <code>a+</code>
      </td>
    </tr>
    <tr>
      <td>*</td>
      <td>
        Khớp với không hoặc nhiều ký tự trước đó. Ví dụ, để khớp
        không có gì hoặc một từ bạn có thể sử dụng <code>\w*</code>
      </td>
    </tr>
    <tr>
      <td>( )</td>
      <td>
        Nắm bắt phần của mẫu bên trong dấu ngoặc đơn. Bất kỳ giá trị nào được nắm bắt
        sẽ được truyền đến khung nhìn như các tham số không có tên (nếu nhiều mẫu
        được nắm bắt, các tham số liên quan sẽ được cung cấp theo thứ tự
        mà các lần nắm bắt được khai báo).
      </td>
    </tr>
    <tr>
      <td>(?P&#x3C;<em>name</em>>...)</td>
      <td>
        Nắm bắt mẫu (được chỉ ra bởi ...) như một biến có tên (trong trường hợp này
        là "name"). Các giá trị được nắm bắt được truyền đến khung nhìn với tên
        đã chỉ định. Khung nhìn của bạn do đó phải khai báo một tham số với cùng
        tên!
      </td>
    </tr>
    <tr>
      <td>[ ]</td>
      <td>
        Khớp với một ký tự trong tập hợp. Ví dụ, [abc] sẽ khớp trên
        'a' hoặc 'b' hoặc 'c'. [-\w] sẽ khớp trên ký tự '-' hoặc bất kỳ ký tự từ nào.
      </td>
    </tr>
  </tbody>
</table>

Hầu hết các ký tự khác có thể được hiểu theo nghĩa đen!

Hãy xem xét một vài ví dụ thực tế về các mẫu:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Mẫu</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>r'^book/(?P&#x3C;pk>\d+)$'</strong></td>
      <td>
        <p>
          Đây là RE được sử dụng trong bộ ánh xạ URL của chúng ta. Nó khớp với một chuỗi có
          <code>book/</code> ở đầu dòng (<strong>^book/</strong>),
          sau đó có một hoặc nhiều chữ số (<code>\d+</code>), và sau đó kết thúc (không có
          ký tự không phải chữ số nào trước dấu kết thúc dòng).
        </p>
        <p>
          Nó cũng nắm bắt tất cả các chữ số <strong>(?P&#x3C;pk>\d+)</strong> và
          truyền chúng đến khung nhìn trong một tham số có tên 'pk'.
          <strong>Các giá trị được nắm bắt luôn được truyền như một chuỗi!</strong>
        </p>
        <p>
          Ví dụ, đây sẽ khớp <code>book/1234</code>, và gửi một
          biến <code>pk='1234'</code> đến khung nhìn.
        </p>
      </td>
    </tr>
    <tr>
      <td><strong>r'^book/(\d+)$'</strong></td>
      <td>
        Điều này khớp với cùng URL như trường hợp trước. Thông tin được nắm bắt
        sẽ được gửi như một đối số không có tên đến khung nhìn.
      </td>
    </tr>
    <tr>
      <td><strong>r'^book/(?P&#x3C;stub>[-\w]+)$'</strong></td>
      <td>
        <p>
          Điều này khớp với một chuỗi có <code>book/</code> ở đầu
          dòng (<strong>^book/</strong>), sau đó có một hoặc nhiều ký tự là
          <em>either</em> một '-' hoặc một ký tự từ
          (<strong>[-\w]+</strong>), và sau đó kết thúc. Nó cũng nắm bắt tập hợp
          ký tự này và truyền chúng đến khung nhìn trong một tham số có tên 'stub'.
        </p>
        <p>
          Đây là một mẫu khá điển hình cho một "stub". Stub là các khóa chính
          dựa trên từ thân thiện với URL cho dữ liệu. Bạn có thể sử dụng một stub nếu bạn muốn
          URL sách của bạn có nhiều thông tin hơn. Ví dụ
          <code>/catalog/book/the-secret-garden</code> thay vì
          <code>/catalog/book/33</code>.
        </p>
      </td>
    </tr>
  </tbody>
</table>

Bạn có thể nắm bắt nhiều mẫu trong một khớp, và do đó mã hóa nhiều thông tin khác nhau trong một URL.

> [!NOTE]
> Như một thách thức, hãy xem xét cách bạn có thể mã hóa một URL để liệt kê tất cả sách được phát hành trong một năm, tháng, ngày cụ thể, và RE có thể được sử dụng để khớp với nó.

#### Truyền các tùy chọn bổ sung trong bản đồ URL của bạn

Một tính năng mà chúng ta chưa sử dụng ở đây, nhưng có thể thấy có giá trị, là bạn có thể truyền một [từ điển chứa các tùy chọn bổ sung](https://docs.djangoproject.com/en/5.0/topics/http/urls/#views-extra-options) đến khung nhìn (sử dụng đối số thứ ba không có tên của hàm `path()`). Cách tiếp cận này có thể hữu ích nếu bạn muốn sử dụng cùng một khung nhìn cho nhiều tài nguyên, và truyền dữ liệu để cấu hình hành vi của nó trong mỗi trường hợp.

Ví dụ, cho đường dẫn được hiển thị bên dưới, đối với yêu cầu đến `/my-url/halibut/` Django sẽ gọi `views.my_view(request, fish='halibut', my_template_name='some_path')`.

```python
path('my-url/<fish>', views.my_view, {'my_template_name': 'some_path'}, name='aurl'),
```

> [!NOTE]
> Cả các mẫu được nắm bắt được đặt tên và các tùy chọn từ điển đều được truyền đến khung nhìn như _đối số được đặt tên_. Nếu bạn sử dụng **cùng tên** cho cả mẫu nắm bắt và khóa từ điển, thì tùy chọn từ điển sẽ được sử dụng.

### Khung nhìn (dựa trên lớp)

Mở **catalog/views.py**, và sao chép code sau vào cuối tệp:

```python
class BookDetailView(generic.DetailView):
    model = Book
```

Chỉ vậy thôi! Tất cả những gì bạn cần làm bây giờ là tạo một mẫu có tên **/django-locallibrary-tutorial/catalog/templates/catalog/book_detail.html**, và khung nhìn sẽ truyền cho nó thông tin cơ sở dữ liệu cho bản ghi `Book` cụ thể được trích xuất bởi bộ ánh xạ URL. Trong mẫu, bạn có thể truy cập các chi tiết của cuốn sách với biến mẫu có tên `object` HOẶC `book` (tức là, tổng quát `the_model_name`).

Nếu cần, bạn có thể thay đổi mẫu được sử dụng và tên của đối tượng ngữ cảnh được sử dụng để tham chiếu cuốn sách trong mẫu. Bạn cũng có thể ghi đè các phương thức để, ví dụ, thêm thông tin bổ sung vào ngữ cảnh.

#### Điều gì xảy ra nếu bản ghi không tồn tại?

Nếu một bản ghi được yêu cầu không tồn tại thì khung nhìn chi tiết tổng quát dựa trên lớp sẽ tự động tạo ra một ngoại lệ `Http404` cho bạn — trong môi trường sản xuất, điều này sẽ tự động hiển thị một trang "không tìm thấy tài nguyên" thích hợp, mà bạn có thể tùy chỉnh nếu muốn.

Chỉ để cho bạn thấy một ý tưởng về cách này hoạt động, đoạn code bên dưới minh họa cách bạn sẽ triển khai khung nhìn dựa trên lớp như một hàm nếu bạn **không** sử dụng khung nhìn chi tiết tổng quát dựa trên lớp.

```python
def book_detail_view(request, primary_key):
    try:
        book = Book.objects.get(pk=primary_key)
    except Book.DoesNotExist:
        raise Http404('Book does not exist')

    return render(request, 'catalog/book_detail.html', context={'book': book})
```

Khung nhìn đầu tiên cố gắng lấy bản ghi sách cụ thể từ mô hình. Nếu điều này thất bại, khung nhìn sẽ tạo ra một ngoại lệ `Http404` để chỉ ra rằng cuốn sách "không được tìm thấy". Bước cuối cùng sau đó là, như thường lệ, gọi `render()` với tên mẫu và dữ liệu sách trong tham số `context` (như một từ điển).

Một cách khác bạn có thể làm điều này nếu bạn không sử dụng một khung nhìn tổng quát là gọi hàm `get_object_or_404()`.
Đây là một phím tắt để tạo ra một ngoại lệ `Http404` nếu bản ghi không được tìm thấy.

```python
from django.shortcuts import get_object_or_404

def book_detail_view(request, primary_key):
    book = get_object_or_404(Book, pk=primary_key)
    return render(request, 'catalog/book_detail.html', context={'book': book})
```

### Tạo mẫu Khung nhìn Chi tiết

Tạo tệp HTML **/django-locallibrary-tutorial/catalog/templates/catalog/book_detail.html** và cho nó nội dung bên dưới. Như đã thảo luận ở trên, đây là tên tệp mẫu mặc định được mong đợi bởi khung nhìn _chi tiết_ tổng quát dựa trên lớp (cho một mô hình có tên `Book` trong một ứng dụng có tên `catalog`).

```django
{% extends "base_generic.html" %}

{% block content %}
  <h1>Title: \{{ book.title }}</h1>

  <p><strong>Author:</strong> <a href="">\{{ book.author }}</a></p>
  <!-- author detail link not yet defined -->
  <p><strong>Summary:</strong> \{{ book.summary }}</p>
  <p><strong>ISBN:</strong> \{{ book.isbn }}</p>
  <p><strong>Language:</strong> \{{ book.language }}</p>
  <p><strong>Genre:</strong> \{{ book.genre.all|join:", " }}</p>

  <div style="margin-left:20px;margin-top:20px">
    <h4>Copies</h4>

    {% for copy in book.bookinstance_set.all %}
      <hr />
      <p
        class="{% if copy.status == 'a' %}text-success{% elif copy.status == 'm' %}text-danger{% else %}text-warning{% endif %}">
        \{{ copy.get_status_display }}
      </p>
      {% if copy.status != 'a' %}
        <p><strong>Due to be returned:</strong> \{{ copy.due_back }}</p>
      {% endif %}
      <p><strong>Imprint:</strong> \{{ copy.imprint }}</p>
      <p class="text-muted"><strong>Id:</strong> \{{ copy.id }}</p>
    {% endfor %}
  </div>
{% endblock %}
```

> [!NOTE]
> Liên kết tác giả trong mẫu trên có URL trống vì chúng ta chưa tạo trang chi tiết tác giả để liên kết đến.
> Một khi trang chi tiết tồn tại, chúng ta có thể lấy URL của nó với một trong hai cách tiếp cận sau:
>
> - Sử dụng thẻ mẫu `url` để đảo ngược URL 'author-detail' (được định nghĩa trong bộ ánh xạ URL), truyền nó cho thể hiện tác giả cho cuốn sách:
>
>   ```django
>   <a href="{% url 'author-detail' book.author.pk %}">\{{ book.author }}</a>
>   ```
>
> - Gọi phương thức `get_absolute_url()` của mô hình tác giả (phương thức này thực hiện cùng thao tác đảo ngược):
>
>   ```django
>   <a href="\{{ book.author.get_absolute_url }}">\{{ book.author }}</a>
>   ```
>
> Mặc dù cả hai phương pháp đều thực hiện cùng một điều, `get_absolute_url()` được ưu tiên vì nó giúp bạn viết code nhất quán và dễ bảo trì hơn (bất kỳ thay đổi nào chỉ cần được thực hiện ở một nơi: mô hình tác giả).

Mặc dù lớn hơn một chút, hầu hết mọi thứ trong mẫu này đã được mô tả trước đây:

- Chúng ta mở rộng mẫu cơ sở và ghi đè khối "content".
- Chúng ta sử dụng xử lý có điều kiện để xác định xem có hiển thị nội dung cụ thể hay không.
- Chúng ta sử dụng vòng lặp `for` để lặp qua danh sách đối tượng.
- Chúng ta truy cập các trường ngữ cảnh bằng cách sử dụng ký hiệu dấu chấm (vì chúng ta đã sử dụng khung nhìn tổng quát chi tiết, ngữ cảnh được đặt tên là `book`; chúng ta cũng có thể sử dụng `object`)

Điều thú vị đầu tiên mà chúng ta chưa thấy trước đây là hàm `book.bookinstance_set.all()`. Phương thức này được Django "tự động" xây dựng để trả về tập hợp các bản ghi `BookInstance` liên kết với một `Book` cụ thể.

```django
{% for copy in book.bookinstance_set.all %}
  <!-- code to iterate across each copy/instance of a book -->
{% endfor %}
```

Phương thức này cần thiết vì bạn khai báo một trường `ForeignKey` (một-đến-nhiều) chỉ ở phía "nhiều" của mối quan hệ (trong `BookInstance`). Vì bạn không làm gì để khai báo mối quan hệ trong mô hình ("một") kia, nó (trong `Book`) không có bất kỳ trường nào để lấy tập hợp các bản ghi liên quan. Để khắc phục vấn đề này, Django xây dựng một hàm "tra cứu ngược" được đặt tên phù hợp mà bạn có thể sử dụng. Tên của hàm được xây dựng bằng cách viết thường tên mô hình nơi `ForeignKey` được khai báo, tiếp theo là `_set` (tức là, hàm được tạo ra trong `Book` là `bookinstance_set()`).

> [!NOTE]
> Ở đây chúng ta sử dụng `all()` để lấy tất cả các bản ghi (mặc định). Trong khi bạn có thể sử dụng phương thức `filter()` để lấy một tập hợp con các bản ghi trong code, bạn không thể làm điều này trực tiếp trong các mẫu vì bạn không thể chỉ định đối số cho các hàm.
>
> Hãy cẩn thận cũng vì nếu bạn không định nghĩa một thứ tự (trên khung nhìn dựa trên lớp hoặc mô hình của bạn), bạn cũng sẽ thấy lỗi từ máy chủ phát triển như thế này:
>
> ```plain
> [29/May/2017 18:37:53] "GET /catalog/books/?page=1 HTTP/1.1" 200 1637
> /foo/local_library/venv/lib/python3.5/site-packages/django/views/generic/list.py:99: UnorderedObjectListWarning: Pagination may yield inconsistent results with an unordered object_list: <QuerySet [<Author: Ortiz, David>, <Author: H. McRaven, William>, <Author: Leigh, Melinda>]>
>   allow_empty_first_page=allow_empty_first_page, **kwargs)
> ```
>
> Điều đó xảy ra vì [đối tượng phân trang](https://docs.djangoproject.com/en/5.0/topics/pagination/#paginator-objects) mong đợi thấy một số ORDER BY đang được thực thi trên cơ sở dữ liệu cơ bản của bạn. Nếu không có nó, nó không thể chắc chắn rằng các bản ghi được trả về thực sự theo đúng thứ tự!
>
> Hướng dẫn này chưa đề cập đến **Phân trang** (chưa!), nhưng vì bạn không thể sử dụng `sort_by()` và truyền một tham số (giống như `filter()` được mô tả ở trên), bạn sẽ phải chọn giữa ba lựa chọn:
>
> 1. Thêm một `ordering` bên trong khai báo `class Meta` trên mô hình của bạn.
> 2. Thêm một thuộc tính `queryset` trong khung nhìn dựa trên lớp tùy chỉnh của bạn, chỉ định một `order_by()`.
> 3. Thêm một phương thức `get_queryset` vào khung nhìn dựa trên lớp tùy chỉnh của bạn và cũng chỉ định `order_by()`.
>
> Nếu bạn quyết định sử dụng `class Meta` cho mô hình `Author` (có thể không linh hoạt bằng việc tùy chỉnh khung nhìn dựa trên lớp, nhưng đủ dễ dàng), bạn sẽ kết thúc với điều gì đó như thế này:
>
> ```python
> class Author(models.Model):
>     first_name = models.CharField(max_length=100)
>     last_name = models.CharField(max_length=100)
>     date_of_birth = models.DateField(null=True, blank=True)
>     date_of_death = models.DateField('Died', null=True, blank=True)
>
>     def get_absolute_url(self):
>         return reverse('author-detail', args=[str(self.id)])
>
>     def __str__(self):
>         return f'{self.last_name}, {self.first_name}'
>
>     class Meta:
>         ordering = ['last_name']
> ```
>
> Tất nhiên, trường không cần phải là `last_name`: nó có thể là bất kỳ trường nào khác.
>
> Cuối cùng nhưng không kém phần quan trọng, bạn nên sắp xếp theo một thuộc tính/cột thực sự có chỉ mục (duy nhất hay không) trên cơ sở dữ liệu của bạn để tránh các vấn đề hiệu suất. Tất nhiên, điều này sẽ không cần thiết ở đây (chúng ta có thể đang tiến quá nhanh với rất ít sách và người dùng), nhưng đó là điều đáng ghi nhớ cho các dự án tương lai.

Điều thú vị thứ hai (và không rõ ràng) trong mẫu là nơi chúng ta hiển thị văn bản trạng thái cho mỗi thể hiện sách ("available", "maintenance", v.v.).
Những người đọc tinh tế sẽ chú ý rằng phương thức `BookInstance.get_status_display()` mà chúng ta sử dụng để lấy văn bản trạng thái không xuất hiện ở nơi khác trong code.

```django
 <p class="{% if copy.status == 'a' %}text-success{% elif copy.status == 'm' %}text-danger{% else %}text-warning{% endif %}">
 \{{ copy.get_status_display }} </p>
```

Hàm này được tạo tự động vì `BookInstance.status` là một [trường lựa chọn](https://docs.djangoproject.com/en/5.0/ref/models/fields/#choices).
Django tự động tạo một phương thức `get_foo_display()` cho mỗi trường lựa chọn `foo` trong một mô hình, có thể được sử dụng để lấy giá trị hiện tại của trường.

## Nó trông như thế nào?

Tại thời điểm này, chúng ta đã tạo ra mọi thứ cần thiết để hiển thị cả trang danh sách sách và trang chi tiết sách. Chạy máy chủ (`python3 manage.py runserver`) và mở trình duyệt của bạn tới `http://127.0.0.1:8000/`.

> [!WARNING]
> Đừng nhấp vào bất kỳ liên kết tác giả hoặc chi tiết tác giả nào — bạn sẽ tạo những trang đó trong thách thức!

Nhấp vào liên kết **All books** để hiển thị danh sách sách.

![Book List Page](book_list_page_no_pagination.png)

Sau đó nhấp vào liên kết đến một trong các cuốn sách của bạn. Nếu mọi thứ được thiết lập đúng, bạn sẽ thấy điều gì đó giống như ảnh chụp màn hình sau đây.

![Book Detail Page](book_detail_page_no_pagination.png)

## Phân trang

Nếu bạn chỉ có một vài bản ghi, trang danh sách sách của chúng ta sẽ trông ổn. Tuy nhiên, khi bạn có hàng chục hoặc hàng trăm bản ghi, trang sẽ mất ngày càng nhiều thời gian hơn để tải (và có quá nhiều nội dung để duyệt một cách hợp lý). Giải pháp cho vấn đề này là thêm phân trang vào các khung nhìn danh sách của bạn, giảm số lượng mục được hiển thị trên mỗi trang.

Django có hỗ trợ tích hợp tuyệt vời cho phân trang. Thậm chí tốt hơn, điều này được tích hợp vào các khung nhìn danh sách tổng quát dựa trên lớp nên bạn không cần làm nhiều để bật nó!

### Khung nhìn

Mở **catalog/views.py**, và thêm dòng `paginate_by` như được hiển thị bên dưới.

```python
class BookListView(generic.ListView):
    model = Book
    paginate_by = 10
```

Với bổ sung này, ngay khi bạn có nhiều hơn 10 bản ghi, khung nhìn sẽ bắt đầu phân trang dữ liệu mà nó gửi đến mẫu.
Các trang khác nhau được truy cập bằng cách sử dụng các tham số GET — để truy cập trang 2, bạn sẽ sử dụng URL `/catalog/books/?page=2`.

### Mẫu

Bây giờ dữ liệu đã được phân trang, chúng ta cần thêm hỗ trợ cho mẫu để cuộn qua tập kết quả. Vì chúng ta có thể muốn phân trang tất cả các khung nhìn danh sách, chúng ta sẽ thêm điều này vào mẫu cơ sở.

Mở **/django-locallibrary-tutorial/catalog/templates/_base_generic.html_** và tìm "content block" (như được hiển thị bên dưới).

```django
{% block content %}{% endblock %}
```

Sao chép vào khối phân trang sau ngay sau `{% endblock %}`. Code đầu tiên kiểm tra xem phân trang có được bật trên trang hiện tại hay không. Nếu có, nó thêm các liên kết _tiếp theo_ và _trước đó_ khi thích hợp (và số trang hiện tại).

```django
{% block pagination %}
    {% if is_paginated %}
        <div class="pagination">
            <span class="page-links">
                {% if page_obj.has_previous %}
                    <a href="\{{ request.path }}?page=\{{ page_obj.previous_page_number }}">previous</a>
                {% endif %}
                <span class="page-current">
                    Page \{{ page_obj.number }} of \{{ page_obj.paginator.num_pages }}.
                </span>
                {% if page_obj.has_next %}
                    <a href="\{{ request.path }}?page=\{{ page_obj.next_page_number }}">next</a>
                {% endif %}
            </span>
        </div>
    {% endif %}
  {% endblock %}
```

`page_obj` là một đối tượng [Paginator](https://docs.djangoproject.com/en/5.0/topics/pagination/#paginator-objects) sẽ tồn tại nếu phân trang đang được sử dụng trên trang hiện tại. Nó cho phép bạn lấy tất cả thông tin về trang hiện tại, các trang trước, có bao nhiêu trang, v.v.

Chúng ta sử dụng `\{{ request.path }}` để lấy URL trang hiện tại cho việc tạo các liên kết phân trang. Điều này hữu ích vì nó độc lập với đối tượng mà chúng ta đang phân trang.

Vậy là xong!

### Nó trông như thế nào?

Ảnh chụp màn hình bên dưới cho thấy phân trang trông như thế nào — nếu bạn chưa nhập nhiều hơn 10 tiêu đề vào cơ sở dữ liệu của mình, thì bạn có thể kiểm tra nó dễ dàng hơn bằng cách giảm con số được chỉ định trong dòng `paginate_by` trong tệp **catalog/views.py** của bạn. Để có kết quả bên dưới, chúng tôi đã thay đổi nó thành `paginate_by = 2`.

Các liên kết phân trang được hiển thị ở dưới cùng, với các liên kết tiếp theo/trước được hiển thị tùy thuộc vào trang bạn đang ở.

![Book List Page - paginated](book_list_paginated.png)

## Thách thức bản thân

Thách thức trong bài viết này là tạo các khung nhìn chi tiết và danh sách tác giả cần thiết để hoàn thành dự án. Các khung nhìn này nên được làm có sẵn tại các URL sau:

- `catalog/authors/` — Danh sách tất cả tác giả.
- `catalog/author/<id>` — Khung nhìn chi tiết cho tác giả cụ thể có trường khóa chính được đặt tên là `<id>`

Code cần thiết cho bộ ánh xạ URL và các khung nhìn phải gần như giống hệt với các khung nhìn danh sách và chi tiết `Book` mà chúng ta đã tạo ở trên. Các mẫu sẽ khác nhau nhưng sẽ có hành vi tương tự.

> [!NOTE]
>
> - Một khi bạn đã tạo bộ ánh xạ URL cho trang danh sách tác giả, bạn cũng sẽ cần cập nhật liên kết **All authors** trong mẫu cơ sở.
>   Làm theo [cùng quy trình](#update_the_base_template) như chúng ta đã làm khi cập nhật liên kết **All books**.
> - Một khi bạn đã tạo bộ ánh xạ URL cho trang chi tiết tác giả, bạn cũng nên cập nhật [mẫu khung nhìn chi tiết sách](#creating_the_detail_view_template) (**/django-locallibrary-tutorial/catalog/templates/catalog/book_detail.html**) để liên kết tác giả trỏ đến trang chi tiết tác giả mới của bạn (thay vì là một URL trống).
>   Cách được khuyến nghị để làm điều này là gọi `get_absolute_url()` trên mô hình tác giả như được hiển thị bên dưới.
>
>   ```django
>   <p>
>     <strong>Author:</strong>
>     <a href="\{{ book.author.get_absolute_url }}">\{{ book.author }}</a>
>   </p>
>   ```

Khi bạn hoàn thành, các trang của bạn sẽ trông giống như các ảnh chụp màn hình bên dưới.

![Author List Page](author_list_page_no_pagination.png)

![Author Detail Page](author_detail_page_no_pagination.png)

## Tóm tắt

Xin chúc mừng, chức năng thư viện cơ bản của chúng ta đã hoàn tất!

Trong bài viết này, chúng ta đã học cách sử dụng các khung nhìn danh sách và chi tiết tổng quát dựa trên lớp và sử dụng chúng để tạo các trang xem sách và tác giả. Trong quá trình đó, chúng ta đã tìm hiểu về khớp mẫu với biểu thức chính quy, và cách bạn có thể truyền dữ liệu từ URL đến các khung nhìn. Chúng ta cũng đã học thêm một vài thủ thuật để sử dụng mẫu. Cuối cùng, chúng ta đã trình bày cách phân trang các khung nhìn danh sách để danh sách của chúng ta có thể quản lý được ngay cả khi chúng ta có nhiều bản ghi.

Trong các bài viết tiếp theo, chúng ta sẽ mở rộng thư viện này để hỗ trợ tài khoản người dùng, và từ đó trình bày xác thực người dùng, quyền, phiên làm việc và biểu mẫu.

## Xem thêm

- [Built-in class-based generic views](https://docs.djangoproject.com/en/5.0/topics/class-based-views/generic-display/) (Tài liệu Django)
- [Generic display views](https://docs.djangoproject.com/en/5.0/ref/class-based-views/generic-display/) (Tài liệu Django)
- [Introduction to class-based views](https://docs.djangoproject.com/en/5.0/topics/class-based-views/intro/) (Tài liệu Django)
- [Built-in template tags and filters](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/) (Tài liệu Django)
- [Pagination](https://docs.djangoproject.com/en/5.0/topics/pagination/) (Tài liệu Django)
- [Making queries > Related objects](https://docs.djangoproject.com/en/5.0/topics/db/queries/#related-objects) (Tài liệu Django)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Home_page", "Learn_web_development/Extensions/Server-side/Django/Sessions", "Learn_web_development/Extensions/Server-side/Django")}}
