---
title: "Hướng dẫn Django Phần 2: Tạo website khung sườn"
short-title: "2: Website khung sườn"
slug: Learn_web_development/Extensions/Server-side/Django/skeleton_website
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Django/Models", "Learn_web_development/Extensions/Server-side/Django")}}

Bài viết thứ hai trong [Hướng dẫn Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) của chúng tôi chỉ cách bạn có thể tạo dự án website "khung sườn" như là cơ sở, sau đó bạn có thể điền vào các cài đặt, đường dẫn, mô hình, khung nhìn và mẫu cụ thể cho trang.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment">Thiết lập môi trường phát triển Django</a>.
        Xem lại <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website">Hướng dẫn Django</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Có thể sử dụng các công cụ của Django để bắt đầu các dự án website mới của riêng bạn.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Bài viết này chỉ cách bạn có thể tạo website "khung sườn", sau đó bạn có thể điền vào các cài đặt, đường dẫn, mô hình, khung nhìn và mẫu cụ thể cho trang (chúng tôi thảo luận về những điều này trong các bài viết sau).

Để bắt đầu:

1. Sử dụng công cụ `django-admin` để tạo thư mục dự án, các mẫu tệp cơ bản và **manage.py**, phục vụ như script quản lý dự án của bạn.
2. Sử dụng **manage.py** để tạo một hoặc nhiều _ứng dụng_.

   > [!NOTE]
   > Một website có thể bao gồm một hoặc nhiều phần. Ví dụ, trang chính, blog, wiki, khu vực tải xuống, v.v. Django khuyến khích bạn phát triển các thành phần này như các _ứng dụng_ riêng biệt, có thể tái sử dụng trong các dự án khác nếu muốn.

3. Đăng ký các ứng dụng mới để đưa chúng vào dự án.
4. Kết nối bộ ánh xạ **url/path** cho mỗi ứng dụng.

Đối với [website Thư viện Cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website), thư mục website và dự án được đặt tên là _locallibrary_, và bao gồm một ứng dụng có tên _catalog_.
Do đó, cấu trúc thư mục cấp cao nhất sẽ như sau:

```bash
locallibrary/         # Website folder
    manage.py         # Script to run Django tools for this project (created using django-admin)
    locallibrary/     # Website/project folder (created using django-admin)
    catalog/          # Application folder (created using manage.py)
```

Các phần sau thảo luận chi tiết về các bước xử lý, và chỉ cách bạn có thể kiểm tra các thay đổi của mình.
Vào cuối bài viết này, chúng tôi thảo luận về một số cấu hình khác trên toàn trang bạn có thể muốn thực hiện ở giai đoạn này.

## Tạo dự án

Để tạo dự án:

1. Mở shell lệnh (hoặc cửa sổ terminal), và đảm bảo bạn đang ở trong [môi trường ảo](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#using_a_virtual_environment).
2. Điều hướng đến thư mục nơi bạn muốn tạo ứng dụng thư viện cục bộ của mình (sau đó chúng ta sẽ di chuyển nó đến "django_local_library" mà bạn [đã tạo như một kho lưu trữ GitHub cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#clone_the_repo_to_your_local_computer) khi thiết lập môi trường phát triển).
3. Tạo dự án mới bằng lệnh `django-admin startproject` như được hiển thị, và sau đó điều hướng vào thư mục dự án:

   ```bash
   django-admin startproject locallibrary
   cd locallibrary
   ```

   Công cụ `django-admin` tạo cấu trúc thư mục/tệp như sau:

   ```bash
   locallibrary/
       manage.py
       locallibrary/
           __init__.py
           settings.py
           urls.py
           wsgi.py
           asgi.py
   ```

Thư mục con dự án _locallibrary_ là điểm vào cho website:

- **\_\_init\_\_.py** là tệp trống hướng dẫn Python xử lý thư mục này như một gói Python.
- **settings.py** chứa tất cả cài đặt website, bao gồm đăng ký bất kỳ ứng dụng nào chúng ta tạo ra, vị trí tệp tĩnh của chúng ta, chi tiết cấu hình cơ sở dữ liệu, v.v.
- **urls.py** xác định ánh xạ URL-to-view của trang. Mặc dù có thể chứa _tất cả_ code ánh xạ URL, nhưng phổ biến hơn là ủy thác một số ánh xạ cho các ứng dụng cụ thể, như bạn sẽ thấy sau.
- **wsgi.py** được sử dụng để giúp ứng dụng Django của bạn giao tiếp với máy chủ web. Bạn có thể coi đây là boilerplate.
- **asgi.py** là chuẩn cho các ứng dụng và máy chủ web Python không đồng bộ để giao tiếp với nhau. Asynchronous Server Gateway Interface (ASGI) là người kế nhiệm không đồng bộ của Web Server Gateway Interface (WSGI). ASGI cung cấp chuẩn cho cả ứng dụng Python không đồng bộ và đồng bộ, trong khi WSGI chỉ cung cấp chuẩn cho ứng dụng đồng bộ. ASGI tương thích ngược với WSGI và hỗ trợ nhiều máy chủ và framework ứng dụng.

Script **manage.py** được sử dụng để tạo ứng dụng, làm việc với cơ sở dữ liệu và khởi động máy chủ web phát triển.

## Tạo ứng dụng catalog

Tiếp theo, chạy lệnh sau để tạo ứng dụng _catalog_ sẽ nằm bên trong dự án _locallibrary_ của chúng ta. Đảm bảo chạy lệnh này từ cùng thư mục với **manage.py** của dự án:

```bash
# Linux/macOS
python3 manage.py startapp catalog

# Windows
py manage.py startapp catalog
```

> [!NOTE]
> Phần còn lại của hướng dẫn sử dụng cú pháp Linux/macOS.
> Nếu bạn đang làm việc trên Windows, bất cứ khi nào bạn thấy lệnh bắt đầu bằng `python3`, bạn nên sử dụng `py` thay thế (hoặc `py -3`).

Công cụ tạo thư mục mới và điền vào đó các tệp cho các phần khác nhau của ứng dụng (hiển thị trong ví dụ sau).
Hầu hết các tệp được đặt tên theo mục đích của chúng (ví dụ: các khung nhìn nên được lưu trữ trong **views.py**, mô hình trong **models.py**, kiểm tra trong **tests.py**, cấu hình trang quản trị trong **admin.py**, đăng ký ứng dụng trong **apps.py**) và chứa một số code boilerplate tối thiểu để làm việc với các đối tượng liên quan.

Thư mục dự án đã cập nhật giờ đây trông như thế này:

```bash
locallibrary/
    manage.py
    locallibrary/
    catalog/
        admin.py
        apps.py
        models.py
        tests.py
        views.py
        __init__.py
        migrations/
```

Ngoài ra chúng ta cũng có:

- Thư mục _migrations_, được sử dụng để lưu trữ "migration" — các tệp cho phép bạn tự động cập nhật cơ sở dữ liệu khi bạn sửa đổi mô hình.
- **\_\_init\_\_.py** — tệp trống được tạo ở đây để Django/Python sẽ nhận ra thư mục là [Python Package](https://docs.python.org/3/tutorial/modules.html#packages) và cho phép bạn sử dụng các đối tượng của nó trong các phần khác của dự án.

> [!NOTE]
> Bạn có nhận thấy những gì còn thiếu trong danh sách tệp ở trên không? Mặc dù có nơi cho các khung nhìn và mô hình của bạn, nhưng không có nơi nào để bạn đặt các ánh xạ URL, mẫu và tệp tĩnh. Chúng tôi sẽ chỉ cách tạo chúng ở phần sau (những thứ này không cần thiết trong mọi website nhưng cần thiết trong ví dụ này).

## Đăng ký ứng dụng catalog

Bây giờ ứng dụng đã được tạo, chúng ta phải đăng ký nó với dự án để nó sẽ được bao gồm khi bất kỳ công cụ nào được chạy (như thêm mô hình vào cơ sở dữ liệu chẳng hạn). Ứng dụng được đăng ký bằng cách thêm chúng vào danh sách `INSTALLED_APPS` trong cài đặt dự án.

Mở tệp cài đặt dự án, **django-locallibrary-tutorial/locallibrary/settings.py**, và tìm định nghĩa cho danh sách `INSTALLED_APPS`. Sau đó thêm dòng mới vào cuối danh sách, như được hiển thị dưới đây:

```bash
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # Add our new application
    'catalog.apps.CatalogConfig', # This object was created for us in /catalog/apps.py
]
```

Dòng mới chỉ định đối tượng cấu hình ứng dụng (`CatalogConfig`) đã được tạo cho bạn trong **/django-locallibrary-tutorial/catalog/apps.py** khi bạn tạo ứng dụng.

> [!NOTE]
> Bạn sẽ thấy rằng đã có rất nhiều `INSTALLED_APPS` khác (và `MIDDLEWARE`, ở phần dưới trong tệp cài đặt). Chúng cho phép hỗ trợ [trang quản trị Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site) và chức năng mà nó sử dụng (bao gồm phiên làm việc, xác thực, v.v.).

## Chỉ định cơ sở dữ liệu

Đây cũng là điểm mà bạn thường sẽ chỉ định cơ sở dữ liệu sẽ được sử dụng cho dự án. Việc sử dụng cùng một cơ sở dữ liệu cho phát triển và sản xuất khi có thể là hợp lý, để tránh các khác biệt nhỏ trong hành vi. Bạn có thể tìm hiểu về các tùy chọn khác nhau trong [Databases](https://docs.djangoproject.com/en/5.0/ref/settings/#databases) (Django docs).

Chúng tôi sẽ sử dụng cơ sở dữ liệu SQLite mặc định cho hầu hết ví dụ này, vì chúng tôi không mong đợi yêu cầu nhiều truy cập đồng thời trên cơ sở dữ liệu minh họa, và nó không yêu cầu thêm công việc để thiết lập! Bạn có thể thấy cách cơ sở dữ liệu này được cấu hình trong **settings.py**:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
```

Sau này trong phần [Deploying Django to production](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Deployment#database_configuration) chúng tôi cũng sẽ chỉ cách cấu hình cơ sở dữ liệu Postgres, có thể phù hợp hơn cho các trang lớn hơn.

## Cài đặt dự án khác

Tệp **settings.py** cũng được sử dụng để cấu hình một số cài đặt khác, nhưng tại thời điểm này, bạn có thể chỉ muốn thay đổi [TIME_ZONE](https://docs.djangoproject.com/en/5.0/ref/settings/#std:setting-TIME_ZONE) — điều này nên bằng một chuỗi từ [Danh sách múi giờ cơ sở dữ liệu tz](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) tiêu chuẩn (cột TZ trong bảng chứa các giá trị bạn muốn). Thay đổi giá trị `TIME_ZONE` của bạn thành một trong những chuỗi phù hợp với múi giờ của bạn, ví dụ:

```python
TIME_ZONE = 'Europe/London'
```

Có hai cài đặt khác bạn sẽ không thay đổi ngay bây giờ, nhưng bạn nên biết:

- `SECRET_KEY`. Đây là khóa bí mật được sử dụng như một phần chiến lược bảo mật website của Django. Nếu bạn không bảo vệ code này trong quá trình phát triển, bạn sẽ cần sử dụng một code khác (có thể đọc từ biến môi trường hoặc tệp) khi đưa nó vào sản xuất.
- `DEBUG`. Điều này cho phép các nhật ký gỡ lỗi được hiển thị khi xảy ra lỗi, thay vì các phản hồi mã trạng thái HTTP. Điều này nên được đặt thành `False` trong sản xuất vì thông tin gỡ lỗi hữu ích cho kẻ tấn công, nhưng bây giờ chúng ta có thể giữ nó ở `True`.

## Kết nối bộ ánh xạ URL

Website được tạo với tệp bộ ánh xạ URL (**urls.py**) trong thư mục dự án. Mặc dù bạn có thể sử dụng tệp này để quản lý tất cả các ánh xạ URL của mình, nhưng thường hơn là ủy thác các ánh xạ cho ứng dụng liên quan.

Mở **django-locallibrary-tutorial/locallibrary/urls.py** và lưu ý văn bản hướng dẫn giải thích một số cách sử dụng bộ ánh xạ URL.

```python
"""
URL configuration for locallibrary project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLConf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Các ánh xạ URL được quản lý thông qua biến `urlpatterns`, là Python _list_ các hàm `path()`. Mỗi hàm `path()` hoặc liên kết mẫu URL với một _khung nhìn cụ thể_, sẽ được hiển thị khi mẫu được khớp, hoặc với một danh sách code kiểm tra mẫu URL khác (trong trường hợp thứ hai này, mẫu trở thành "URL cơ sở" cho các mẫu được định nghĩa trong module đích). Danh sách `urlpatterns` ban đầu xác định một hàm duy nhất ánh xạ tất cả các URL có mẫu _admin/_ đến module `admin.site.urls`, chứa các định nghĩa ánh xạ URL riêng của ứng dụng Quản trị.

> [!NOTE]
> Route trong `path()` là chuỗi định nghĩa mẫu URL để khớp. Chuỗi này có thể bao gồm một biến có tên (trong dấu ngoặc nhọn), ví dụ: `'catalog/<id>/'`. Mẫu này sẽ khớp với URL như **catalog/_any_chars_/** và truyền _`any_chars`_ đến khung nhìn dưới dạng chuỗi với tên tham số `id`. Chúng ta thảo luận về các phương thức path và mẫu route sâu hơn trong các chủ đề sau.

Để thêm mục danh sách mới vào danh sách `urlpatterns`, thêm các dòng sau vào cuối tệp. Mục mới này bao gồm `path()` chuyển tiếp các yêu cầu với mẫu `catalog/` đến module `catalog.urls` (tệp với URL tương đối **catalog/urls.py**).

```python
# Use include() to add paths from the catalog application
from django.urls import include

urlpatterns += [
    path('catalog/', include('catalog.urls')),
]
```

> [!NOTE]
> Lưu ý rằng chúng tôi đã bao gồm dòng import (`from django.urls import include`) với code sử dụng nó (để dễ thấy những gì chúng tôi đã thêm), nhưng phổ biến là bao gồm tất cả các dòng import ở đầu tệp Python.

Bây giờ hãy chuyển hướng URL gốc của trang (tức là `127.0.0.1:8000`) đến URL `127.0.0.1:8000/catalog/`. Đây là ứng dụng duy nhất chúng ta sẽ sử dụng trong dự án này. Để làm điều này, chúng ta sẽ sử dụng một hàm khung nhìn đặc biệt, `RedirectView`, nhận URL tương đối mới để chuyển hướng đến (`/catalog/`) như đối số đầu tiên của nó khi mẫu URL được chỉ định trong hàm `path()` được khớp (URL gốc, trong trường hợp này).

Thêm các dòng sau vào cuối tệp:

```python
# Add URL maps to redirect the base URL to our application
from django.views.generic import RedirectView
urlpatterns += [
    path('', RedirectView.as_view(url='catalog/', permanent=True)),
]
```

Để tham số đầu tiên của hàm path trống để ngụ ý '/'. Nếu bạn viết tham số đầu tiên là '/' Django sẽ đưa ra cảnh báo sau khi bạn khởi động máy chủ phát triển:

```python
System check identified some issues:

WARNINGS:
?: (urls.W002) Your URL pattern '/' has a route beginning with a '/'.
Remove this slash as it is unnecessary.
If this pattern is targeted in an include(), ensure the include() pattern has a trailing '/'.
```

Django không phục vụ tệp tĩnh như CSS, JavaScript và hình ảnh theo mặc định, nhưng có thể hữu ích khi máy chủ web phát triển làm như vậy trong khi bạn tạo trang. Là bổ sung cuối cùng cho bộ ánh xạ URL này, bạn có thể cho phép phục vụ tệp tĩnh trong quá trình phát triển bằng cách thêm các dòng sau.

Thêm khối cuối cùng sau vào cuối tệp ngay bây giờ:

```python
# Use static() to add URL mapping to serve static files during development (only)
from django.conf import settings
from django.conf.urls.static import static

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
```

> [!NOTE]
> Có một số cách để mở rộng danh sách `urlpatterns` (trước đây, chúng ta chỉ thêm mục danh sách mới bằng toán tử `+=` để phân tách rõ ràng code cũ và mới). Chúng ta có thể đã chỉ bao gồm bản đồ mẫu mới này trong định nghĩa danh sách gốc:
>
> ```python
> urlpatterns = [
>     path('admin/', admin.site.urls),
>     path('catalog/', include('catalog.urls')),
>     path('', RedirectView.as_view(url='catalog/')),
> ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
> ```

Là bước cuối cùng, tạo tệp trong thư mục _catalog_ của bạn có tên **urls.py**, và thêm văn bản sau để định nghĩa `urlpatterns` đã được nhập (trống). Đây là nơi chúng ta sẽ thêm các mẫu khi chúng ta xây dựng ứng dụng.

```python
from django.urls import path
from . import views

urlpatterns = [

]
```

## Kiểm tra framework website

Tại thời điểm này, chúng ta có một dự án khung sườn hoàn chỉnh. Website thực sự _chưa làm_ gì cả, nhưng đáng để chạy nó để đảm bảo rằng không có thay đổi nào của chúng ta đã phá vỡ bất cứ điều gì.

Trước khi làm điều đó, chúng ta nên đầu tiên chạy _di chuyển cơ sở dữ liệu_. Điều này cập nhật cơ sở dữ liệu của chúng ta (để bao gồm bất kỳ mô hình nào trong các ứng dụng đã cài đặt) và xóa một số cảnh báo xây dựng.

### Chạy di chuyển cơ sở dữ liệu

Django sử dụng Object-Relational-Mapper (ORM) để ánh xạ các định nghĩa mô hình trong code Django đến cấu trúc dữ liệu được sử dụng bởi cơ sở dữ liệu bên dưới. Khi chúng ta thay đổi các định nghĩa mô hình, Django theo dõi các thay đổi và có thể tạo các script di chuyển cơ sở dữ liệu (trong **/django-locallibrary-tutorial/catalog/migrations/**) để tự động di chuyển cấu trúc dữ liệu bên dưới trong cơ sở dữ liệu để khớp với mô hình.

Khi chúng ta tạo website, Django tự động thêm một số mô hình để sử dụng bởi phần quản trị của trang (chúng ta sẽ xem xét sau). Chạy các lệnh sau để định nghĩa bảng cho những mô hình đó trong cơ sở dữ liệu (đảm bảo bạn đang ở trong thư mục chứa **manage.py**):

```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

> [!WARNING]
> Bạn sẽ cần chạy các lệnh này mỗi khi mô hình của bạn thay đổi theo cách sẽ ảnh hưởng đến cấu trúc dữ liệu cần được lưu trữ (bao gồm cả việc thêm và xóa toàn bộ mô hình và các trường riêng lẻ).

Lệnh `makemigrations` _tạo_ (nhưng không áp dụng) các migration cho tất cả ứng dụng được cài đặt trong dự án của bạn. Bạn cũng có thể chỉ định tên ứng dụng để chỉ chạy migration cho một ứng dụng duy nhất. Điều này cho bạn cơ hội kiểm tra code cho các migration này trước khi chúng được áp dụng. Nếu bạn là chuyên gia Django, bạn có thể chọn điều chỉnh chúng một chút!

Lệnh `migrate` là lệnh áp dụng các migration vào cơ sở dữ liệu của bạn. Django theo dõi những migration nào đã được thêm vào cơ sở dữ liệu hiện tại.

> [!NOTE]
> Bạn nên chạy lại các migration và kiểm tra lại trang bất cứ khi nào bạn thực hiện các thay đổi đáng kể. Nó không mất nhiều thời gian!
>
> Xem [Migrations](https://docs.djangoproject.com/en/5.0/topics/migrations/) (Django docs) để biết thêm thông tin về các lệnh migration ít được sử dụng hơn.

### Chạy website

Trong quá trình phát triển, bạn có thể phục vụ website đầu tiên bằng _máy chủ web phát triển_, sau đó xem nó trên trình duyệt web cục bộ của bạn.

> [!NOTE]
> Máy chủ web phát triển không đủ mạnh mẽ hoặc đủ hiệu suất cho việc sử dụng trong môi trường sản xuất, nhưng nó là cách rất dễ để website Django của bạn hoạt động trong quá trình phát triển để kiểm tra nhanh tiện lợi. Theo mặc định, nó sẽ phục vụ trang web lên máy tính cục bộ của bạn (`http://127.0.0.1:8000/`), nhưng bạn cũng có thể chỉ định các máy tính khác trên mạng của bạn để phục vụ. Để biết thêm thông tin xem [django-admin and manage.py: runserver](https://docs.djangoproject.com/en/5.0/ref/django-admin/#runserver) (Django docs).

Chạy _máy chủ web phát triển_ bằng cách gọi lệnh `runserver` (trong cùng thư mục với **manage.py**):

```bash
python3 manage.py runserver
```

Khi máy chủ đang chạy, bạn có thể xem trang bằng cách điều hướng đến `http://127.0.0.1:8000/` trong trình duyệt web cục bộ của bạn. Bạn sẽ thấy trang lỗi trang trông như thế này:

![Django Debug page (Django 4.2)](django_404_debug_page.png)

Đừng lo lắng! Trang lỗi này được mong đợi vì chúng ta chưa có bất kỳ trang/url nào được định nghĩa trong module `catalog.urls` (mà chúng ta được chuyển hướng khi nhận URL đến gốc của trang).

Tại thời điểm này, chúng ta biết Django đang hoạt động!

> [!NOTE]
> Trang ví dụ minh họa một tính năng Django tuyệt vời — nhật ký gỡ lỗi tự động. Bất cứ khi nào không tìm thấy trang, Django hiển thị màn hình lỗi với thông tin hữu ích hoặc bất kỳ lỗi nào được tạo ra bởi code. Trong trường hợp này, chúng ta có thể thấy rằng URL chúng ta cung cấp không khớp với bất kỳ mẫu URL nào của chúng ta (như được liệt kê). Nhật ký được tắt trong môi trường sản xuất (đây là khi chúng ta đưa trang lên Web trực tiếp), trong trường hợp đó một trang ít thông tin hơn nhưng thân thiện với người dùng hơn sẽ được phục vụ.

## Đừng quên sao lưu lên GitHub

Chúng tôi vừa thực hiện một số công việc đáng kể, vì vậy đây là thời điểm tốt để sao lưu dự án bằng GitHub.

Đầu tiên di chuyển _nội dung_ của thư mục **locallibrary** cấp cao nhất vào thư mục **django_local_library** mà bạn [đã tạo như kho lưu trữ GitHub cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#clone_the_repo_to_your_local_computer) khi thiết lập môi trường phát triển.
Điều này sẽ bao gồm **manage.py**, thư mục con **locallibrary**, thư mục con **catalog**, và bất cứ điều gì khác bên trong thư mục cấp cao nhất.

Sau đó thêm và commit các thay đổi trong thư mục **django_local_library** và đẩy chúng lên GitHub.
Từ gốc của thư mục đó, bạn có thể sử dụng một bộ lệnh tương tự như trong phần [Modify and sync changes](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#modify_and_sync_changes) của chủ đề _Development environment_:

```bash
# Get the current source from GitHub on the main branch
git checkout main
git pull origin main

# Create a branch and add/commit your newly created app skeleton
git checkout -b skeleton_website # Create and activate a new branch "skeleton_website"
git add -A # Add all changed files to the staging area
git commit -m "Create Skeleton framework for LocalLibrary" # Commit the changed files

# Push the branch to GitHub
git push origin skeleton_website
```

Sau đó tạo và hợp nhất PR từ repo GitHub của bạn.
Sau khi hợp nhất, bạn có thể chuyển lại về nhánh `main` và kéo các thay đổi của bạn từ GitHub:

```bash
git checkout main
git pull origin main
```

> [!NOTE]
> Nếu bạn không xóa nhánh `skeleton_website`, bạn luôn có thể chuyển lại về nó vào một điểm sau.

Chúng tôi sẽ không nhất thiết đề cập đến điều này nữa trong tương lai, nhưng bạn có thể thấy hữu ích khi cập nhật GitHub với các thay đổi của bạn vào cuối mỗi phần trong hướng dẫn này.

## Tự thách thức bản thân

Thư mục **catalog/** chứa các tệp cho các khung nhìn, mô hình và các phần khác của ứng dụng. Mở các tệp này và kiểm tra boilerplate.

Như bạn đã thấy trước đó, một ánh xạ URL cho trang Quản trị đã được thêm vào **urls.py** của dự án. Điều hướng đến khu vực quản trị trong trình duyệt của bạn và xem điều gì xảy ra (bạn có thể suy ra URL đúng từ ánh xạ).

## Tóm tắt

Bây giờ bạn đã tạo một dự án website khung sườn hoàn chỉnh, bạn có thể tiếp tục điền vào các URL, mô hình, khung nhìn và mẫu.

Bây giờ khi khung sườn cho [website Thư viện Cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website) hoàn chỉnh và đang chạy, đã đến lúc bắt đầu viết code làm cho website này làm những gì nó cần làm.

## Xem thêm

- [Writing your first Django app - part 1](https://docs.djangoproject.com/en/5.0/intro/tutorial01/) (Django docs)
- [Applications](https://docs.djangoproject.com/en/5.0/ref/applications/#configuring-applications) (Django Docs).
  Chứa thông tin về cấu hình ứng dụng.

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website", "Learn_web_development/Extensions/Server-side/Django/Models", "Learn_web_development/Extensions/Server-side/Django")}}
