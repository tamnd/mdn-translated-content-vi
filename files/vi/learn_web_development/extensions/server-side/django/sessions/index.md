---
title: "Hướng dẫn Django Phần 7: Framework phiên làm việc"
short-title: "7: Framework phiên làm việc"
slug: Learn_web_development/Extensions/Server-side/Django/Sessions
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Generic_views", "Learn_web_development/Extensions/Server-side/Django/Authentication", "Learn_web_development/Extensions/Server-side/Django")}}

Hướng dẫn này mở rộng trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) của chúng ta, thêm một bộ đếm lượt truy cập dựa trên phiên làm việc vào trang chủ.
Đây là một ví dụ tương đối đơn giản, nhưng nó cho thấy cách bạn có thể sử dụng framework phiên làm việc để cung cấp hành vi liên tục cho người dùng ẩn danh trong các trang web của riêng bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Generic_views">Django Tutorial Part 6: Generic list and detail views</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Hiểu cách sử dụng các phiên làm việc.</td>
    </tr>
  </tbody>
</table>

## Tổng quan

Trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) mà chúng ta đã tạo trong các hướng dẫn trước cho phép người dùng duyệt sách và tác giả trong danh mục. Trong khi nội dung được tạo động từ cơ sở dữ liệu, mỗi người dùng về cơ bản sẽ có quyền truy cập vào các trang và loại thông tin giống nhau khi họ sử dụng trang web.

Trong một thư viện "thực", bạn có thể muốn cung cấp cho từng người dùng một trải nghiệm tùy chỉnh, dựa trên việc sử dụng trang web trước đây của họ, sở thích, v.v.
Ví dụ: bạn có thể ẩn các thông báo cảnh báo mà người dùng đã xác nhận trước đó vào lần tiếp theo họ truy cập trang web, hoặc lưu trữ và tôn trọng sở thích của họ (chẳng hạn như số lượng kết quả tìm kiếm họ muốn hiển thị trên mỗi trang).

Framework phiên làm việc cho phép bạn triển khai loại hành vi này, cho phép bạn lưu trữ và truy xuất dữ liệu tùy ý trên cơ sở mỗi khách truy cập trang web.

## Các phiên làm việc là gì?

Tất cả các giao tiếp giữa trình duyệt web và máy chủ đều thông qua {{Glossary("HTTP")}}, là _không có trạng thái_. Thực tế là giao thức không có trạng thái có nghĩa là các thông điệp giữa máy khách và máy chủ hoàn toàn độc lập với nhau — không có khái niệm "chuỗi" hoặc hành vi dựa trên các thông điệp trước. Kết quả là, nếu bạn muốn có một trang web theo dõi các mối quan hệ đang diễn ra với một máy khách, bạn cần phải tự triển khai điều đó.

Các phiên làm việc là cơ chế được Django (và hầu hết Internet) sử dụng để theo dõi "trạng thái" giữa trang web và một trình duyệt cụ thể. Các phiên làm việc cho phép bạn lưu trữ dữ liệu tùy ý cho mỗi trình duyệt, và có dữ liệu này có sẵn cho trang web bất cứ khi nào trình duyệt kết nối. Các mục dữ liệu riêng lẻ liên kết với phiên làm việc sau đó được tham chiếu bằng "khóa", được sử dụng để lưu trữ và truy xuất dữ liệu.

Django sử dụng một cookie chứa _session id_ đặc biệt để xác định từng trình duyệt và phiên làm việc liên quan của nó với trang web. _Dữ liệu_ phiên làm việc thực tế được lưu trữ trong cơ sở dữ liệu trang web theo mặc định (điều này an toàn hơn so với lưu trữ dữ liệu trong một cookie, nơi chúng dễ bị tổn thương hơn bởi người dùng độc hại). Bạn có thể cấu hình Django để lưu trữ dữ liệu phiên làm việc ở các nơi khác (bộ nhớ đệm, tệp, cookie "an toàn"), nhưng vị trí mặc định là một lựa chọn tốt và tương đối an toàn.

## Bật phiên làm việc

Các phiên làm việc đã được bật tự động khi chúng ta [tạo trang web khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website) (trong hướng dẫn 2).

Cấu hình được thiết lập trong các phần `INSTALLED_APPS` và `MIDDLEWARE` của tệp dự án (**django-locallibrary-tutorial/locallibrary/settings.py**), như được hiển thị bên dưới:

```python
INSTALLED_APPS = [
    # …
    'django.contrib.sessions',
    # …

MIDDLEWARE = [
    # …
    'django.contrib.sessions.middleware.SessionMiddleware',
    # …
```

## Sử dụng phiên làm việc

Bạn có thể truy cập thuộc tính `session` trong một khung nhìn từ tham số `request` (một `HttpRequest` được truyền vào làm đối số đầu tiên cho khung nhìn).
Thuộc tính phiên làm việc này đại diện cho kết nối cụ thể đến người dùng hiện tại (hay nói chính xác hơn, kết nối đến _trình duyệt_ hiện tại, được xác định bởi session id trong cookie của trình duyệt cho trang web này).

Thuộc tính `session` là một đối tượng giống từ điển mà bạn có thể đọc và ghi bao nhiêu lần tùy thích trong khung nhìn, sửa đổi nó theo ý muốn. Bạn có thể thực hiện tất cả các thao tác từ điển thông thường, bao gồm xóa tất cả dữ liệu, kiểm tra xem một khóa có tồn tại không, lặp qua dữ liệu, v.v. Tuy nhiên hầu hết thời gian, bạn sẽ chỉ sử dụng API "từ điển" tiêu chuẩn để lấy và đặt các giá trị.

Các đoạn code bên dưới cho thấy cách bạn có thể lấy, đặt và xóa một số dữ liệu với khóa `my_car`, liên kết với phiên làm việc hiện tại (trình duyệt).

> [!NOTE]
> Một trong những điều tuyệt vời về Django là bạn không cần phải nghĩ về các cơ chế liên kết phiên làm việc với yêu cầu hiện tại của bạn trong khung nhìn. Nếu chúng ta sử dụng các đoạn code bên dưới trong khung nhìn của mình, chúng ta sẽ biết rằng thông tin về `my_car` chỉ liên kết với trình duyệt đã gửi yêu cầu hiện tại.

```python
# Get a session value by its key (e.g. 'my_car'), raising a KeyError if the key is not present
my_car = request.session['my_car']

# Get a session value, setting a default if it is not present ('mini')
my_car = request.session.get('my_car', 'mini')

# Set a session value
request.session['my_car'] = 'mini'

# Delete a session value
del request.session['my_car']
```

API cũng cung cấp một số phương thức khác chủ yếu được sử dụng để quản lý cookie phiên làm việc liên quan. Ví dụ, có các phương thức để kiểm tra xem cookie có được hỗ trợ trong trình duyệt máy khách, để đặt và kiểm tra ngày hết hạn cookie, và để xóa các phiên làm việc đã hết hạn khỏi kho dữ liệu. Bạn có thể tìm hiểu về toàn bộ API trong [How to use sessions](https://docs.djangoproject.com/en/5.0/topics/http/sessions/) (Tài liệu Django).

## Lưu dữ liệu phiên làm việc

Theo mặc định, Django chỉ lưu vào cơ sở dữ liệu phiên làm việc và gửi cookie phiên làm việc đến máy khách khi phiên làm việc đã _được sửa đổi_ (được gán) hoặc _bị xóa_. Nếu bạn đang cập nhật một số dữ liệu bằng cách sử dụng khóa phiên làm việc của nó như được hiển thị trong phần trước, thì bạn không cần lo lắng về điều này! Ví dụ:

```python
# This is detected as an update to the session, so session data is saved.
request.session['my_car'] = 'mini'
```

Nếu bạn đang cập nhật một số thông tin _bên trong_ dữ liệu phiên làm việc, thì Django sẽ không nhận ra rằng bạn đã thực hiện thay đổi đối với phiên làm việc và lưu dữ liệu (ví dụ: nếu bạn thay đổi dữ liệu `wheels` bên trong dữ liệu `my_car` của mình, như được hiển thị bên dưới). Trong trường hợp này, bạn sẽ cần đánh dấu rõ ràng phiên làm việc là đã được sửa đổi.

```python
# Session object not directly modified, only data within the session. Session changes not saved!
request.session['my_car']['wheels'] = 'alloy'

# Set session as modified to force data updates/cookie to be saved.
request.session.modified = True
```

> [!NOTE]
> Bạn có thể thay đổi hành vi để trang web sẽ cập nhật cơ sở dữ liệu/gửi cookie trên mỗi yêu cầu bằng cách thêm `SESSION_SAVE_EVERY_REQUEST = True` vào cài đặt dự án của bạn (**django-locallibrary-tutorial/locallibrary/settings.py**).

## Ví dụ đơn giản — lấy số lượt truy cập

Là một ví dụ thực tế đơn giản, chúng ta sẽ cập nhật thư viện của mình để cho người dùng hiện tại biết họ đã truy cập trang chủ _LocalLibrary_ bao nhiêu lần.

Mở **/django-locallibrary-tutorial/catalog/views.py**, và thêm các dòng chứa `num_visits` vào `index()` (như được hiển thị bên dưới).

```python
def index(request):
    # …

    num_authors = Author.objects.count()  # The 'all()' is implied by default.

    # Number of visits to this view, as counted in the session variable.
    num_visits = request.session.get('num_visits', 0)
    num_visits += 1
    request.session['num_visits'] = num_visits

    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        'num_visits': num_visits,
    }

    # Render the HTML template index.html with the data in the context variable.
    return render(request, 'index.html', context=context)
```

Ở đây, trước tiên chúng ta lấy giá trị của khóa phiên làm việc `'num_visits'`, đặt giá trị thành 0 nếu nó chưa được đặt trước đó. Mỗi khi nhận được yêu cầu, chúng ta tăng giá trị lên và lưu nó lại trong phiên làm việc (cho lần tiếp theo người dùng truy cập trang). Biến `num_visits` sau đó được truyền đến mẫu trong biến ngữ cảnh của chúng ta.

> [!NOTE]
> Chúng ta cũng có thể kiểm tra xem cookie có được hỗ trợ trong trình duyệt ở đây hay không (xem [How to use sessions](https://docs.djangoproject.com/en/5.0/topics/http/sessions/) để biết các ví dụ) hoặc thiết kế giao diện người dùng của chúng ta để không quan trọng cookie có được hỗ trợ hay không.

Thêm dòng được hiển thị ở dưới cùng của khối sau vào mẫu HTML chính của bạn (**/django-locallibrary-tutorial/catalog/templates/index.html**) ở cuối phần "Dynamic content" để hiển thị biến ngữ cảnh `num_visits`.

```django
<h2>Dynamic content</h2>

<p>The library has the following record counts:</p>
<ul>
  <li><strong>Books:</strong> \{{ num_books }}</li>
  <li><strong>Copies:</strong> \{{ num_instances }}</li>
  <li><strong>Copies available:</strong> \{{ num_instances_available }}</li>
  <li><strong>Authors:</strong> \{{ num_authors }}</li>
</ul>

<p>
  You have visited this page \{{ num_visits }} time\{{ num_visits|pluralize }}.
</p>
```

Lưu ý rằng chúng ta sử dụng thẻ mẫu tích hợp Django [pluralize](https://docs.djangoproject.com/en/5.0/ref/templates/builtins/#pluralize) để thêm "s" khi trang đã được truy cập nhiều lần.

Lưu các thay đổi của bạn và khởi động lại máy chủ kiểm thử. Mỗi lần bạn làm mới trang, con số sẽ cập nhật.

## Tóm tắt

Bây giờ bạn đã biết cách dễ dàng sử dụng các phiên làm việc để cải thiện tương tác của bạn với người dùng _ẩn danh_.

Trong các bài viết tiếp theo, chúng ta sẽ giải thích framework xác thực và ủy quyền (quyền), và trình bày cách hỗ trợ tài khoản người dùng.

## Xem thêm

- [How to use sessions](https://docs.djangoproject.com/en/5.0/topics/http/sessions/) (Tài liệu Django)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Generic_views", "Learn_web_development/Extensions/Server-side/Django/Authentication", "Learn_web_development/Extensions/Server-side/Django")}}
