---
title: "Hướng dẫn Django Phần 8: Xác thực người dùng và quyền hạn"
short-title: "8: Xác thực và quyền hạn"
slug: Learn_web_development/Extensions/Server-side/Django/Authentication
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Sessions", "Learn_web_development/Extensions/Server-side/Django/Forms", "Learn_web_development/Extensions/Server-side/Django")}}

Trong hướng dẫn này, chúng ta sẽ trình bày cách cho phép người dùng đăng nhập vào trang web của bạn bằng tài khoản của họ, và cách kiểm soát những gì họ có thể làm và xem dựa trên việc họ có đăng nhập hay không và _quyền_ của họ. Là một phần của bài trình diễn này, chúng ta sẽ mở rộng trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website), thêm các trang đăng nhập và đăng xuất, và các trang dành riêng cho người dùng và nhân viên để xem sách đã được mượn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Sessions">Django Tutorial Part 7: Sessions framework</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu cách thiết lập và sử dụng xác thực người dùng và quyền.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

Django cung cấp một hệ thống xác thực và ủy quyền ("quyền"), được xây dựng trên nền tảng framework phiên làm việc được thảo luận trong [hướng dẫn trước](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Sessions), cho phép bạn xác minh thông tin xác thực người dùng và định nghĩa các hành động mà mỗi người dùng được phép thực hiện. Framework bao gồm các mô hình tích hợp cho `Users` và `Groups` (một cách chung để áp dụng quyền cho nhiều người dùng cùng một lúc), quyền/cờ chỉ định liệu người dùng có thể thực hiện một tác vụ hay không, biểu mẫu và khung nhìn để đăng nhập người dùng, và các công cụ khung nhìn để hạn chế nội dung.

> [!NOTE]
> Theo Django, hệ thống xác thực nhằm mục đích rất tổng quát, và do đó không cung cấp một số tính năng được cung cấp trong các hệ thống xác thực web khác. Các giải pháp cho một số vấn đề phổ biến có sẵn như các gói bên thứ ba. Ví dụ: {{glossary("throttle", "throttling")}} của các lần thử đăng nhập và xác thực đối với bên thứ ba (ví dụ: OAuth).

Trong hướng dẫn này, chúng ta sẽ trình bày cách bật xác thực người dùng trong trang web [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website), tạo các trang đăng nhập và đăng xuất của riêng bạn, thêm quyền vào các mô hình của bạn, và kiểm soát quyền truy cập vào các trang. Chúng ta sẽ sử dụng xác thực/quyền để hiển thị danh sách các sách đã được mượn cho cả người dùng và thủ thư.

Hệ thống xác thực rất linh hoạt, và bạn có thể xây dựng URL, biểu mẫu, khung nhìn và mẫu của mình từ đầu nếu bạn muốn, chỉ cần gọi API được cung cấp để đăng nhập người dùng. Tuy nhiên, trong bài viết này, chúng ta sẽ sử dụng các khung nhìn và biểu mẫu xác thực "tiêu chuẩn" của Django cho các trang đăng nhập và đăng xuất. Chúng ta vẫn cần tạo một số mẫu, nhưng điều đó khá dễ dàng.

Chúng ta cũng sẽ trình bày cách tạo quyền, và kiểm tra trạng thái đăng nhập và quyền trong cả khung nhìn và mẫu.

## Bật xác thực

Xác thực đã được bật tự động khi chúng ta [tạo trang web khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website) (trong hướng dẫn 2), vì vậy bạn không cần làm gì thêm ở thời điểm này.

> [!NOTE]
> Cấu hình cần thiết đã được thực hiện cho chúng ta khi chúng ta tạo ứng dụng bằng lệnh `django-admin startproject`. Các bảng cơ sở dữ liệu cho người dùng và quyền mô hình được tạo khi chúng ta lần đầu gọi `python manage.py migrate`.

Cấu hình được thiết lập trong các phần `INSTALLED_APPS` và `MIDDLEWARE` của tệp dự án (**django-locallibrary-tutorial/locallibrary/settings.py**), như được hiển thị bên dưới:

```python
INSTALLED_APPS = [
    # …
    'django.contrib.auth',  # Core authentication framework and its default models.
    'django.contrib.contenttypes',  # Django content type system (allows permissions to be associated with models).
    # …

MIDDLEWARE = [
    # …
    'django.contrib.sessions.middleware.SessionMiddleware',  # Manages sessions across requests
    # …
    'django.contrib.auth.middleware.AuthenticationMiddleware',  # Associates users with requests using sessions.
    # …
```

## Tạo người dùng và nhóm

Bạn đã tạo người dùng đầu tiên của mình khi chúng ta xem xét [trang admin Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site) trong hướng dẫn 4 (đây là người dùng siêu cấp, được tạo bằng lệnh `python manage.py createsuperuser`).
Người dùng siêu cấp của chúng ta đã được xác thực và có tất cả các quyền, vì vậy chúng ta sẽ cần tạo người dùng kiểm thử để đại diện cho người dùng trang web thông thường. Chúng ta sẽ sử dụng trang admin để tạo các nhóm và đăng nhập trang web _locallibrary_, vì đây là một trong những cách nhanh nhất để làm như vậy.

> [!NOTE]
> Bạn cũng có thể tạo người dùng theo lập trình như được hiển thị bên dưới.
> Bạn sẽ phải làm điều này, ví dụ, nếu phát triển một giao diện để cho phép người dùng "thông thường" tạo thông tin đăng nhập của riêng họ (bạn không nên cấp cho hầu hết người dùng quyền truy cập vào trang admin).
>
> ```python
> from django.contrib.auth.models import User
>
> # Create user and save to the database
> user = User.objects.create_user('myusername', 'myemail@crazymail.com', 'mypassword')
>
> # Update fields and then save again
> user.first_name = 'Tyrone'
> user.last_name = 'Citizen'
> user.save()
> ```
>
> Tuy nhiên, lưu ý rằng rất khuyến nghị thiết lập _mô hình người dùng tùy chỉnh_ khi bắt đầu một dự án, vì bạn sẽ có thể dễ dàng tùy chỉnh nó trong tương lai nếu cần.
> Nếu sử dụng mô hình người dùng tùy chỉnh, code để tạo cùng một người dùng sẽ trông như thế này:
>
> ```python
> # Get current user model from settings
> from django.contrib.auth import get_user_model
> User = get_user_model()
>
> # Create user from model and save to the database
> user = User.objects.create_user('myusername', 'myemail@crazymail.com', 'mypassword')
>
> # Update fields and then save again
> user.first_name = 'Tyrone'
> user.last_name = 'Citizen'
> user.save()
> ```
>
> Để biết thêm thông tin, xem [Using a custom user model when starting a project](https://docs.djangoproject.com/en/5.0/topics/auth/customizing/#using-a-custom-user-model-when-starting-a-project) (Tài liệu Django).

Bên dưới chúng ta sẽ đầu tiên tạo một nhóm và sau đó là một người dùng. Mặc dù chúng ta chưa có bất kỳ quyền nào để thêm cho các thành viên thư viện của mình, nếu chúng ta cần sau này, sẽ dễ dàng hơn nhiều khi thêm chúng một lần vào nhóm thay vì thêm riêng lẻ cho từng thành viên.

Khởi động máy chủ phát triển và điều hướng đến trang admin trong trình duyệt web cục bộ của bạn (`http://127.0.0.1:8000/admin/`). Đăng nhập vào trang web bằng thông tin xác thực cho tài khoản người dùng siêu cấp của bạn. Cấp độ cao nhất của trang Admin hiển thị tất cả các mô hình của bạn, được sắp xếp theo "Ứng dụng Django". Từ phần **Authentication and Authorization**, bạn có thể nhấp vào liên kết **Users** hoặc **Groups** để xem các bản ghi hiện có của chúng.

![Admin site - add groups or users](admin_authentication_add.png)

Đầu tiên hãy tạo một nhóm mới cho các thành viên thư viện của chúng ta.

1. Nhấp vào nút **Add** (bên cạnh Group) để tạo một _Group_ mới; nhập **Name** "Library Members" cho nhóm.
   ![Admin site - add group](admin_authentication_add_group.png)
2. Chúng ta không cần bất kỳ quyền nào cho nhóm, vì vậy chỉ cần nhấn **SAVE** (bạn sẽ được đưa đến danh sách các nhóm).

Bây giờ hãy tạo một người dùng:

1. Điều hướng trở lại trang chủ của trang admin
2. Nhấp vào nút **Add** bên cạnh _Users_ để mở hộp thoại _Add user_.
   ![Admin site - add user pt1](admin_authentication_add_user_prt1.png)
3. Nhập **Username** và **Password**/**Password confirmation** phù hợp cho người dùng kiểm thử của bạn
4. Nhấn **SAVE** để tạo người dùng.

   Trang admin sẽ tạo người dùng mới và ngay lập tức đưa bạn đến màn hình _Change user_ nơi bạn có thể thay đổi **username** của mình và thêm thông tin cho các trường tùy chọn của mô hình User. Những trường này bao gồm tên, họ, địa chỉ email và trạng thái và quyền của người dùng (chỉ nên đặt cờ **Active**). Xa hơn, bạn có thể chỉ định các nhóm và quyền của người dùng, và xem các ngày quan trọng liên quan đến người dùng (ví dụ: ngày tham gia và ngày đăng nhập cuối cùng của họ).
   ![Admin site - add user pt2](admin_authentication_add_user_prt2.png)

5. Trong phần _Groups_, chọn nhóm **Library Member** từ danh sách _Available groups_, rồi nhấn **mũi tên phải** giữa các ô để chuyển nó vào ô _Chosen groups_.
   ![Admin site - add user to group](admin_authentication_user_add_group.png)
6. Chúng ta không cần làm gì khác ở đây, vì vậy chỉ cần chọn **SAVE** lần nữa, để đến danh sách người dùng.

Vậy là xong! Bây giờ bạn có tài khoản "thành viên thư viện thông thường" mà bạn có thể sử dụng để kiểm thử (một khi chúng ta đã triển khai các trang để cho phép họ đăng nhập).

> [!NOTE]
> Bạn nên thử tạo một người dùng thành viên thư viện khác. Ngoài ra, hãy tạo một nhóm cho Thủ thư, và thêm một người dùng vào đó nữa!

## Thiết lập các khung nhìn xác thực của bạn

Django cung cấp gần như mọi thứ bạn cần để tạo các trang xác thực để xử lý đăng nhập, đăng xuất và quản lý mật khẩu "ngay khi mở hộp". Điều này bao gồm bộ ánh xạ URL, khung nhìn và biểu mẫu, nhưng không bao gồm các mẫu — chúng ta phải tạo của riêng mình!

Trong phần này, chúng ta trình bày cách tích hợp hệ thống mặc định vào trang web _LocalLibrary_ và tạo các mẫu.

> [!NOTE]
> Django không bao gồm khung nhìn xác thực tích hợp cho đăng ký người dùng ban đầu ("đăng ký").
> Bạn có thể tự tạo một cái nếu cần, nhưng cho hướng dẫn này, chúng ta giả định rằng chỉ thủ thư được phép đăng ký người dùng, và rằng họ sẽ làm như vậy bằng cách sử dụng giao diện admin Django.

> [!NOTE]
> Bạn không cần phải sử dụng bất kỳ code nào trong số này, nhưng có thể bạn sẽ muốn vì nó làm cho mọi thứ dễ dàng hơn rất nhiều.
> Hầu như chắc chắn bạn sẽ cần thay đổi code xử lý biểu mẫu nếu bạn thay đổi mô hình người dùng của mình, nhưng ngay cả vậy, bạn vẫn sẽ có thể sử dụng các hàm khung nhìn tiêu chuẩn.

> [!NOTE]
> Trong trường hợp này, chúng ta có thể hợp lý đặt các trang xác thực, bao gồm URL và mẫu, bên trong ứng dụng catalog của chúng ta.
> Tuy nhiên, nếu chúng ta có nhiều ứng dụng, sẽ tốt hơn nếu tách ra hành vi đăng nhập chia sẻ này và làm cho nó có sẵn trên toàn bộ trang web, vì vậy đó là những gì chúng ta đã trình bày ở đây!

### URL dự án

Thêm vào cuối tệp urls.py dự án (**django-locallibrary-tutorial/locallibrary/urls.py**) những thứ sau:

```python
# Add Django site authentication urls (for login, logout, password management)

urlpatterns += [
    path('accounts/', include('django.contrib.auth.urls')),
]
```

Điều hướng đến URL `http://127.0.0.1:8000/accounts/` (lưu ý dấu gạch chéo sau!).
Django sẽ hiển thị lỗi rằng nó không thể tìm thấy ánh xạ cho URL này, và liệt kê tất cả URL mà nó đã thử.
Từ đây bạn có thể thấy các URL sẽ hoạt động khi chúng ta tạo mẫu.

> [!NOTE]
> Thêm đường dẫn `accounts/` như được hiển thị ở trên sẽ thêm các URL sau, cùng với tên (được cho trong ngoặc vuông) có thể được sử dụng để đảo ngược ánh xạ URL. Bạn không cần phải triển khai bất cứ điều gì khác — ánh xạ URL ở trên tự động ánh xạ các URL được đề cập dưới đây.
>
> ```python
> accounts/ login/ [name='login']
> accounts/ logout/ [name='logout']
> accounts/ password_change/ [name='password_change']
> accounts/ password_change/done/ [name='password_change_done']
> accounts/ password_reset/ [name='password_reset']
> accounts/ password_reset/done/ [name='password_reset_done']
> accounts/ reset/<uidb64>/<token>/ [name='password_reset_confirm']
> accounts/ reset/done/ [name='password_reset_complete']
> ```

Bây giờ hãy thử điều hướng đến URL đăng nhập (`http://127.0.0.1:8000/accounts/login/`). Điều này sẽ thất bại lần nữa, nhưng với lỗi cho bạn biết rằng chúng ta thiếu mẫu bắt buộc (**registration/login.html**) trong đường dẫn tìm kiếm mẫu.
Bạn sẽ thấy các dòng sau được liệt kê trong phần màu vàng ở trên cùng:

```python
Exception Type:    TemplateDoesNotExist
Exception Value:    registration/login.html
```

Bước tiếp theo là tạo một thư mục cho các mẫu có tên "registration" và sau đó thêm tệp **login.html**.

### Thư mục mẫu

Các URL (và ngầm định, các khung nhìn) mà chúng ta vừa thêm mong đợi tìm thấy các mẫu liên quan của chúng trong một thư mục **/registration/** đâu đó trong đường dẫn tìm kiếm mẫu.

Đối với trang web này, chúng ta sẽ đặt các trang HTML của mình trong thư mục **templates/registration/**. Thư mục này nên ở trong thư mục gốc dự án của bạn, tức là cùng thư mục với các thư mục **catalog** và **locallibrary**. Hãy tạo các thư mục này ngay bây giờ.

> [!NOTE]
> Cấu trúc thư mục của bạn bây giờ nên trông như thế này:
>
> ```plain
> django-locallibrary-tutorial/   # Django top level project folder
>   catalog/
>   locallibrary/
>   templates/
>     registration/
> ```

Để làm cho thư mục **templates** hiển thị với bộ tải mẫu, chúng ta cần thêm nó vào đường dẫn tìm kiếm mẫu.
Mở cài đặt dự án (**/django-locallibrary-tutorial/locallibrary/settings.py**).

Sau đó import mô-đun `os` (thêm dòng sau gần đầu tệp nếu nó chưa có).

```python
import os # needed by code below
```

Cập nhật dòng `'DIRS'` của phần `TEMPLATES` như được hiển thị:

```python
    # …
    TEMPLATES = [
      {
       # …
       'DIRS': [os.path.join(BASE_DIR, 'templates')],
       'APP_DIRS': True,
       # …
```

### Mẫu đăng nhập

> [!WARNING]
> Các mẫu xác thực được cung cấp trong bài viết này là phiên bản rất cơ bản/được sửa đổi nhẹ của các mẫu đăng nhập minh họa Django. Bạn có thể cần tùy chỉnh chúng cho mục đích sử dụng của riêng mình!

Tạo một tệp HTML mới có tên /**django-locallibrary-tutorial/templates/registration/login.html** và cho nó nội dung sau:

```django
{% extends "base_generic.html" %}

{% block content %}

  {% if form.errors %}
    <p>Your username and password didn't match. Please try again.</p>
  {% endif %}

  {% if next %}
    {% if user.is_authenticated %}
      <p>Your account doesn't have access to this page. To proceed,
      please login with an account that has access.</p>
    {% else %}
      <p>Please login to see this page.</p>
    {% endif %}
  {% endif %}

  <form method="post" action="{% url 'login' %}">
    {% csrf_token %}
    <table>
      <tr>
        <td>\{{ form.username.label_tag }}</td>
        <td>\{{ form.username }}</td>
      </tr>
      <tr>
        <td>\{{ form.password.label_tag }}</td>
        <td>\{{ form.password }}</td>
      </tr>
    </table>
    <input type="submit" value="login">
    <input type="hidden" name="next" value="\{{ next }}">
  </form>

  {# Assumes you set up the password_reset view in your URLConf #}
  <p><a href="{% url 'password_reset' %}">Lost password?</a></p>

{% endblock %}
```

Mẫu này có một số điểm tương đồng với những gì chúng ta đã thấy trước đây — nó mở rộng mẫu cơ sở và ghi đè khối `content`. Phần còn lại của code là code xử lý biểu mẫu khá tiêu chuẩn, mà chúng ta sẽ thảo luận trong một hướng dẫn sau. Tất cả những gì bạn cần biết bây giờ là điều này sẽ hiển thị một biểu mẫu trong đó bạn có thể nhập tên người dùng và mật khẩu của mình, và nếu bạn nhập các giá trị không hợp lệ, bạn sẽ được nhắc nhập các giá trị đúng khi trang làm mới.

Điều hướng trở lại trang đăng nhập (`http://127.0.0.1:8000/accounts/login/`) sau khi bạn đã lưu mẫu của mình, và bạn sẽ thấy một cái gì đó như thế này:

![Library login page v1](library_login.png)

Nếu bạn đăng nhập bằng thông tin xác thực hợp lệ, bạn sẽ được chuyển hướng đến một trang khác (theo mặc định điều này sẽ là `http://127.0.0.1:8000/accounts/profile/`). Vấn đề là, theo mặc định, Django mong đợi rằng khi đăng nhập bạn sẽ muốn được đưa đến một trang hồ sơ, điều này có thể xảy ra hoặc không. Vì bạn chưa định nghĩa trang này, bạn sẽ nhận được một lỗi khác!

Mở cài đặt dự án (**/django-locallibrary-tutorial/locallibrary/settings.py**) và thêm văn bản bên dưới vào cuối. Bây giờ khi bạn đăng nhập, bạn sẽ được chuyển hướng đến trang chủ trang web theo mặc định.

```python
# Redirect to home URL after login (Default redirects to /accounts/profile/)
LOGIN_REDIRECT_URL = '/'
```

### Mẫu đăng xuất

Nếu bạn điều hướng đến URL đăng xuất (`http://127.0.0.1:8000/accounts/logout/`) thì bạn sẽ nhận được lỗi vì Django 5 không cho phép đăng xuất bằng `GET`, chỉ `POST`.
Chúng ta sẽ thêm một biểu mẫu bạn có thể sử dụng để đăng xuất sau một phút, nhưng trước tiên chúng ta sẽ tạo trang mà người dùng được đưa đến sau khi đăng xuất.

Tạo và mở **/django-locallibrary-tutorial/templates/registration/logged_out.html**. Sao chép vào văn bản bên dưới:

```django
{% extends "base_generic.html" %}

{% block content %}
  <p>Logged out!</p>
  <a href="{% url 'login'%}">Click here to login again.</a>
{% endblock %}
```

Mẫu này rất đơn giản. Nó chỉ hiển thị một thông báo thông báo cho bạn rằng bạn đã đăng xuất, và cung cấp một liên kết mà bạn có thể nhấn để quay lại màn hình đăng nhập. Màn hình hiển thị như thế này (sau khi đăng xuất):

![Library logout page v1](library_logout.png)

### Các mẫu đặt lại mật khẩu

Hệ thống đặt lại mật khẩu mặc định sử dụng email để gửi cho người dùng một liên kết đặt lại. Bạn cần tạo các biểu mẫu để lấy địa chỉ email của người dùng, gửi email, cho phép họ nhập mật khẩu mới, và lưu ý khi toàn bộ quá trình hoàn tất.

Các mẫu sau có thể được sử dụng làm điểm khởi đầu.

#### Biểu mẫu đặt lại mật khẩu

Đây là biểu mẫu được sử dụng để lấy địa chỉ email của người dùng (để gửi email đặt lại mật khẩu). Tạo **/django-locallibrary-tutorial/templates/registration/password_reset_form.html**, và cho nó nội dung sau:

```django
{% extends "base_generic.html" %}

{% block content %}
  <form action="" method="post">
  {% csrf_token %}
  {% if form.email.errors %}
    \{{ form.email.errors }}
  {% endif %}
      <p>\{{ form.email }}</p>
    <input type="submit" class="btn btn-default btn-lg" value="Reset password">
  </form>
{% endblock %}
```

#### Đặt lại mật khẩu thành công

Biểu mẫu này được hiển thị sau khi địa chỉ email của bạn đã được thu thập. Tạo **/django-locallibrary-tutorial/templates/registration/password_reset_done.html**, và cho nó nội dung sau:

```django
{% extends "base_generic.html" %}

{% block content %}
  <p>We've emailed you instructions for setting your password. If they haven't arrived in a few minutes, check your spam folder.</p>
{% endblock %}
```

#### Email đặt lại mật khẩu

Mẫu này cung cấp văn bản của email HTML chứa liên kết đặt lại mà chúng ta sẽ gửi đến người dùng. Tạo **/django-locallibrary-tutorial/templates/registration/password_reset_email.html**, và cho nó nội dung sau:

```django
Someone asked for password reset for email \{{ email }}. Follow the link below:
\{{ protocol }}://\{{ domain }}{% url 'password_reset_confirm' uidb64=uid token=token %}
```

#### Xác nhận đặt lại mật khẩu

Đây là trang bạn nhập mật khẩu mới sau khi nhấp vào liên kết trong email đặt lại mật khẩu. Tạo **/django-locallibrary-tutorial/templates/registration/password_reset_confirm.html**, và cho nó nội dung sau:

```django
{% extends "base_generic.html" %}

{% block content %}
    {% if validlink %}
        <p>Please enter (and confirm) your new password.</p>
        <form action="" method="post">
        {% csrf_token %}
            <table>
                <tr>
                    <td>\{{ form.new_password1.errors }}
                        <label for="id_new_password1">New password:</label></td>
                    <td>\{{ form.new_password1 }}</td>
                </tr>
                <tr>
                    <td>\{{ form.new_password2.errors }}
                        <label for="id_new_password2">Confirm password:</label></td>
                    <td>\{{ form.new_password2 }}</td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Change my password"></td>
                </tr>
            </table>
        </form>
    {% else %}
        <h1>Password reset failed</h1>
        <p>The password reset link was invalid, possibly because it has already been used. Please request a new password reset.</p>
    {% endif %}
{% endblock %}
```

#### Hoàn thành đặt lại mật khẩu

Đây là mẫu đặt lại mật khẩu cuối cùng, được hiển thị để thông báo cho bạn khi đặt lại mật khẩu đã thành công. Tạo **/django-locallibrary-tutorial/templates/registration/password_reset_complete.html**, và cho nó nội dung sau:

```django
{% extends "base_generic.html" %}

{% block content %}
  <h1>The password has been changed!</h1>
  <p><a href="{% url 'login' %}">log in again?</a></p>
{% endblock %}
```

### Kiểm thử các trang xác thực mới

Bây giờ bạn đã thêm cấu hình URL và tạo tất cả các mẫu này, các trang xác thực (ngoại trừ đăng xuất) giờ đây sẽ chỉ hoạt động!

Bạn có thể kiểm thử các trang xác thực mới bằng cách đầu tiên thử đăng nhập vào tài khoản người dùng siêu cấp của bạn bằng URL `http://127.0.0.1:8000/accounts/login/`.
Bạn sẽ có thể kiểm thử chức năng đặt lại mật khẩu từ liên kết trong trang đăng nhập. **Lưu ý rằng Django sẽ chỉ gửi email đặt lại đến các địa chỉ (người dùng) đã được lưu trong cơ sở dữ liệu của nó!**

Lưu ý rằng bạn chưa có thể kiểm thử đăng xuất tài khoản, vì các yêu cầu đăng xuất phải được gửi dưới dạng yêu cầu `POST` thay vì `GET`.

> [!NOTE]
> Hệ thống đặt lại mật khẩu yêu cầu trang web của bạn hỗ trợ email, nằm ngoài phạm vi của bài viết này, vì vậy phần này **chưa hoạt động**. Để cho phép kiểm thử, đặt dòng sau ở cuối tệp settings.py của bạn. Điều này ghi lại bất kỳ email nào được gửi đến bảng điều khiển (để bạn có thể sao chép liên kết đặt lại mật khẩu từ bảng điều khiển).
>
> ```python
> EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
> ```
>
> Để biết thêm thông tin, xem [Sending email](https://docs.djangoproject.com/en/5.0/topics/email/) (Tài liệu Django).

## Kiểm thử với người dùng đã xác thực

Phần này xem xét những gì chúng ta có thể làm để chọn lọc kiểm soát nội dung người dùng thấy dựa trên việc họ đã đăng nhập hay chưa.

### Kiểm thử trong mẫu

Bạn có thể lấy thông tin về người dùng hiện đang đăng nhập trong các mẫu với biến mẫu `\{{ user }}` (điều này được thêm vào ngữ cảnh mẫu theo mặc định khi bạn thiết lập dự án như chúng ta đã làm trong khung của mình).

Thông thường bạn sẽ đầu tiên kiểm thử với biến mẫu `\{{ user.is_authenticated }}` để xác định xem người dùng có đủ điều kiện để xem nội dung cụ thể hay không. Để minh họa điều này, tiếp theo chúng ta sẽ cập nhật thanh bên để hiển thị liên kết "Login" nếu người dùng đã đăng xuất, và liên kết "Logout" nếu họ đã đăng nhập.

Mở mẫu cơ sở (**/django-locallibrary-tutorial/catalog/templates/base_generic.html**) và sao chép văn bản sau vào khối `sidebar`, ngay trước thẻ mẫu `endblock`.

```django
  <ul class="sidebar-nav">
    …
   {% if user.is_authenticated %}
     <li>User: \{{ user.get_username }}</li>
     <li>
       <form id="logout-form" method="post" action="{% url 'logout' %}">
         {% csrf_token %}
         <button type="submit" class="btn btn-link">Logout</button>
       </form>
     </li>
   {% else %}
     <li><a href="{% url 'login' %}?next=\{{ request.path }}">Login</a></li>
   {% endif %}
    …
  </ul>
```

Như bạn có thể thấy, chúng ta sử dụng các thẻ mẫu `if` / `else` / `endif` để hiển thị văn bản có điều kiện dựa trên `\{{ user.is_authenticated }}` có đúng không. Nếu người dùng đã được xác thực thì chúng ta biết rằng chúng ta có người dùng hợp lệ, vì vậy chúng ta gọi `\{{ user.get_username }}` để hiển thị tên của họ.

Chúng ta tạo URL liên kết đăng nhập bằng cách sử dụng thẻ mẫu `url` và tên của cấu hình URL `login`. Lưu ý cũng cách chúng ta đã thêm `?next=\{{ request.path }}` vào cuối URL. Điều này làm gì là thêm một tham số URL `next` chứa địa chỉ (URL) của trang _hiện tại_, vào cuối URL được liên kết. Sau khi người dùng đã đăng nhập thành công, khung nhìn sẽ sử dụng giá trị `next` này để chuyển hướng người dùng trở lại trang nơi họ lần đầu nhấp vào liên kết đăng nhập.

Code mẫu đăng xuất khác, vì từ Django 5 để đăng xuất bạn phải `POST` đến URL `admin:logout`, sử dụng biểu mẫu với nút.
Theo mặc định điều này sẽ hiển thị như một nút, nhưng bạn có thể tạo kiểu cho nút để hiển thị như một liên kết.
Cho ví dụ này chúng ta đang sử dụng _Bootstrap_, vì vậy chúng ta làm cho nút trông giống như một liên kết bằng cách áp dụng `class="btn btn-link"`.
Bạn cũng cần thêm các kiểu sau vào **/django-locallibrary-tutorial/catalog/static/css/styles.css** để định vị đúng liên kết đăng xuất bên cạnh tất cả các liên kết thanh bên khác:

```css
#logout-form {
  display: inline;
}
#logout-form button {
  padding: 0;
  margin: 0;
}
```

Hãy thử bằng cách nhấp vào liên kết Đăng nhập/Đăng xuất trong thanh bên.
Bạn sẽ được đưa đến các trang đăng xuất/đăng nhập mà bạn đã định nghĩa trong phần [Thư mục mẫu](#template_directory) ở trên.

### Kiểm thử trong khung nhìn

Nếu bạn đang sử dụng các khung nhìn dựa trên hàm, cách dễ nhất để hạn chế quyền truy cập vào các hàm của bạn là áp dụng decorator `login_required` cho hàm khung nhìn của bạn, như được hiển thị bên dưới. Nếu người dùng đã đăng nhập thì code khung nhìn của bạn sẽ thực thi như bình thường. Nếu người dùng chưa đăng nhập, điều này sẽ chuyển hướng đến URL đăng nhập được định nghĩa trong cài đặt dự án (`settings.LOGIN_URL`), truyền đường dẫn tuyệt đối hiện tại như tham số URL `next`. Nếu người dùng thành công đăng nhập thì họ sẽ được trả về trang này, nhưng lần này đã được xác thực.

```python
from django.contrib.auth.decorators import login_required

@login_required
def my_view(request):
    # …
```

> [!NOTE]
> Bạn có thể làm tương tự theo cách thủ công bằng cách kiểm thử trên `request.user.is_authenticated`, nhưng decorator thuận tiện hơn nhiều!

Tương tự, cách dễ nhất để hạn chế quyền truy cập đến người dùng đã đăng nhập trong các khung nhìn dựa trên lớp của bạn là kế thừa từ `LoginRequiredMixin`. Bạn cần khai báo mixin này đầu tiên trong danh sách lớp cha, trước lớp khung nhìn chính.

```python
from django.contrib.auth.mixins import LoginRequiredMixin

class MyView(LoginRequiredMixin, View):
    # …
```

Điều này có chính xác cùng hành vi chuyển hướng như decorator `login_required`. Bạn cũng có thể chỉ định một vị trí thay thế để chuyển hướng người dùng đến nếu họ chưa được xác thực (`login_url`), và một tên tham số URL thay vì `next` để chèn đường dẫn tuyệt đối hiện tại (`redirect_field_name`).

```python
class MyView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'redirect_to'
```

Để biết thêm chi tiết, hãy xem [tài liệu Django ở đây](https://docs.djangoproject.com/en/5.0/topics/auth/default/#limiting-access-to-logged-in-users).

## Ví dụ — liệt kê sách của người dùng hiện tại

Bây giờ chúng ta biết cách hạn chế một trang cho một người dùng cụ thể, hãy tạo một khung nhìn về những cuốn sách mà người dùng hiện tại đã mượn.

Thật không may, chúng ta chưa có cách nào để người dùng mượn sách! Vì vậy, trước khi chúng ta có thể tạo danh sách sách, trước tiên chúng ta sẽ mở rộng mô hình `BookInstance` để hỗ trợ khái niệm mượn và sử dụng ứng dụng Django Admin để cho mượn một số sách đến người dùng kiểm thử của chúng ta.

### Mô hình

Đầu tiên, chúng ta sẽ cần làm cho có thể cho người dùng có `BookInstance` đang cho mượn (chúng ta đã có `status` và ngày `due_back`, nhưng chúng ta chưa có bất kỳ liên kết nào giữa mô hình này và một người dùng cụ thể. Chúng ta sẽ tạo một liên kết bằng cách sử dụng trường `ForeignKey` (một-đến-nhiều). Chúng ta cũng cần một cơ chế dễ dàng để kiểm thử xem một cuốn sách đã cho mượn có quá hạn không.

Mở **catalog/models.py**, và import `settings` từ `django.conf` (thêm điều này ngay bên dưới dòng import trước đó ở đầu tệp, để cài đặt có sẵn cho code tiếp theo sử dụng chúng):

```python
from django.conf import settings
```

Tiếp theo, thêm trường `borrower` vào mô hình `BookInstance`, đặt mô hình người dùng cho khóa làm giá trị của cài đặt `AUTH_USER_MODEL`.
Vì chúng ta chưa ghi đè cài đặt với [mô hình người dùng tùy chỉnh](https://docs.djangoproject.com/en/5.0/topics/auth/customizing/), điều này ánh xạ đến mô hình `User` mặc định từ `django.contrib.auth.models`.

```python
borrower = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)
```

> [!NOTE]
> Import mô hình theo cách này giảm công việc cần thiết nếu sau này bạn phát hiện ra rằng bạn cần một mô hình người dùng tùy chỉnh.
> Hướng dẫn này sử dụng mô hình mặc định, vì vậy bạn có thể thay thế import mô hình `User` trực tiếp với các dòng sau:
>
> ```python
> from django.contrib.auth.models import User
> ```
>
> ```python
> borrower = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
> ```

Trong khi ở đây, hãy thêm một thuộc tính mà chúng ta có thể gọi từ các mẫu để biết liệu một thể hiện sách cụ thể có quá hạn không.
Trong khi chúng ta có thể tính toán điều này trong chính mẫu, việc sử dụng một [thuộc tính](https://docs.python.org/3/library/functions.html#property) như được hiển thị bên dưới sẽ hiệu quả hơn nhiều.

Thêm điều này ở đâu đó gần đầu tệp:

```python
from datetime import date
```

Bây giờ thêm định nghĩa thuộc tính sau vào lớp `BookInstance`:

> [!NOTE]
> Code sau đây sử dụng hàm `bool()` của Python, đánh giá một đối tượng hoặc đối tượng kết quả của một biểu thức, và trả về `True` trừ khi kết quả là "falsy", trong trường hợp đó nó trả về `False`.
> Trong Python một đối tượng là _falsy_ (đánh giá là `False`) nếu nó là: trống (như `[]`, `()`, `{}`), `0`, `None` hoặc nếu nó là `False`.

```python
@property
def is_overdue(self):
    """Determines if the book is overdue based on due date and current date."""
    return bool(self.due_back and date.today() > self.due_back)
```

> [!NOTE]
> Trước tiên chúng ta xác minh xem `due_back` có trống hay không trước khi thực hiện so sánh. Một trường `due_back` trống sẽ khiến Django ném lỗi thay vì hiển thị trang: các giá trị trống không thể so sánh. Đây không phải là điều chúng ta muốn người dùng của mình trải nghiệm!

Bây giờ chúng ta đã cập nhật các mô hình của mình, chúng ta sẽ cần thực hiện các migration mới trên dự án và sau đó áp dụng các migration đó:

```bash
python3 manage.py makemigrations
python3 manage.py migrate
```

### Admin

Bây giờ mở **catalog/admin.py**, và thêm trường `borrower` vào lớp `BookInstanceAdmin` trong cả `list_display` và `fieldsets` như được hiển thị bên dưới.
Điều này sẽ làm cho trường hiển thị trong phần Admin, cho phép chúng ta gán một `User` cho một `BookInstance` khi cần.

```python
@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    list_display = ('book', 'status', 'borrower', 'due_back', 'id')
    list_filter = ('status', 'due_back')

    fieldsets = (
        (None, {
            'fields': ('book', 'imprint', 'id')
        }),
        ('Availability', {
            'fields': ('status', 'due_back', 'borrower')
        }),
    )
```

### Cho mượn một vài cuốn sách

Bây giờ khi có thể cho mượn sách cho một người dùng cụ thể, hãy cho mượn một số bản ghi `BookInstance`. Đặt trường `borrowed` của chúng thành người dùng kiểm thử của bạn, đặt `status` là "On loan", và đặt ngày đến hạn cả trong tương lai và quá khứ.

> [!NOTE]
> Chúng ta sẽ không giải thích chi tiết quá trình này, vì bạn đã biết cách sử dụng trang Admin!

### Khung nhìn sách đang cho mượn

Bây giờ chúng ta sẽ thêm một khung nhìn để lấy danh sách tất cả sách đã được cho mượn cho người dùng hiện tại. Chúng ta sẽ sử dụng cùng khung nhìn danh sách tổng quát dựa trên lớp mà chúng ta quen thuộc, nhưng lần này chúng ta cũng sẽ import và kế thừa từ `LoginRequiredMixin`, để chỉ người dùng đã đăng nhập mới có thể gọi khung nhìn này. Chúng ta cũng sẽ chọn khai báo một `template_name`, thay vì sử dụng mặc định, vì chúng ta có thể có một vài danh sách bản ghi BookInstance khác nhau, với các khung nhìn và mẫu khác nhau.

Thêm vào **catalog/views.py** như sau:

```python
from django.contrib.auth.mixins import LoginRequiredMixin

class LoanedBooksByUserListView(LoginRequiredMixin,generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = BookInstance
    template_name = 'catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        return (
            BookInstance.objects.filter(borrower=self.request.user)
            .filter(status__exact='o')
            .order_by('due_back')
        )
```

Để hạn chế truy vấn của chúng ta chỉ cho các đối tượng `BookInstance` của người dùng hiện tại, chúng ta tái triển khai `get_queryset()` như được hiển thị ở trên. Lưu ý rằng "o" là mã được lưu trữ cho "on loan" và chúng ta sắp xếp theo ngày `due_back` để các mục cũ nhất được hiển thị đầu tiên.

### Cấu hình URL cho sách đang cho mượn

Bây giờ mở **/catalog/urls.py** và thêm một `path()` trỏ đến khung nhìn ở trên (bạn có thể sao chép văn bản bên dưới vào cuối tệp).

```python
urlpatterns += [
    path('mybooks/', views.LoanedBooksByUserListView.as_view(), name='my-borrowed'),
]
```

### Mẫu cho sách đang cho mượn

Bây giờ, tất cả những gì chúng ta cần làm cho trang này là thêm một mẫu. Đầu tiên, tạo tệp mẫu **/catalog/templates/catalog/bookinstance_list_borrowed_user.html** và cho nó nội dung sau:

```django
{% extends "base_generic.html" %}

{% block content %}
    <h1>Borrowed books</h1>

    {% if bookinstance_list %}
    <ul>

      {% for bookinst in bookinstance_list %}
      <li class="{% if bookinst.is_overdue %}text-danger{% endif %}">
        <a href="{% url 'book-detail' bookinst.book.pk %}">\{{ bookinst.book.title }}</a> (\{{ bookinst.due_back }})
      </li>
      {% endfor %}
    </ul>

    {% else %}
      <p>There are no books borrowed.</p>
    {% endif %}
{% endblock %}
```

Mẫu này rất giống với những gì chúng ta đã tạo trước đây cho các đối tượng `Book` và `Author`.
Điều "mới" duy nhất ở đây là chúng ta kiểm tra phương thức mà chúng ta đã thêm trong mô hình (`bookinst.is_overdue`) và sử dụng nó để thay đổi màu sắc của các mục quá hạn.

Khi máy chủ phát triển đang chạy, bây giờ bạn có thể xem danh sách cho người dùng đã đăng nhập trong trình duyệt của mình tại `http://127.0.0.1:8000/catalog/mybooks/`. Hãy thử điều này với người dùng của bạn đã đăng nhập và đã đăng xuất (trong trường hợp thứ hai, bạn sẽ được chuyển hướng đến trang đăng nhập).

### Thêm danh sách vào thanh bên

Bước cuối cùng là thêm liên kết cho trang mới này vào thanh bên. Chúng ta sẽ đặt điều này trong cùng phần nơi chúng ta hiển thị thông tin khác cho người dùng đã đăng nhập.

Mở mẫu cơ sở (**/django-locallibrary-tutorial/catalog/templates/base_generic.html**) và thêm dòng "My Borrowed" vào thanh bên ở vị trí được hiển thị bên dưới.

```django
 <ul class="sidebar-nav">
   {% if user.is_authenticated %}
   <li>User: \{{ user.get_username }}</li>

   <li><a href="{% url 'my-borrowed' %}">My Borrowed</a></li>

   <li>
     <form id="logout-form" method="post" action="{% url 'admin:logout' %}">
       {% csrf_token %}
       <button type="submit" class="btn btn-link">Logout</button>
     </form>
   </li>
   {% else %}
   <li><a href="{% url 'login' %}?next=\{{ request.path }}">Login</a></li>
   {% endif %}
 </ul>
```

### Nó trông như thế nào?

Khi bất kỳ người dùng nào đã đăng nhập, họ sẽ thấy liên kết _My Borrowed_ trong thanh bên, và danh sách sách được hiển thị như bên dưới (cuốn sách đầu tiên không có ngày đến hạn, đây là một lỗi mà chúng ta hy vọng sẽ khắc phục trong một hướng dẫn sau!).

![Library - borrowed books by user](library_borrowed_by_user.png)

## Quyền

Quyền được liên kết với các mô hình và định nghĩa các thao tác có thể được thực hiện trên một thể hiện mô hình bởi người dùng có quyền đó. Theo mặc định, Django tự động cấp quyền _add_, _change_, và _delete_ cho tất cả các mô hình, cho phép người dùng có quyền thực hiện các hành động liên quan thông qua trang admin. Bạn có thể định nghĩa quyền của riêng mình cho các mô hình và cấp cho người dùng cụ thể. Bạn cũng có thể thay đổi các quyền liên kết với các thể hiện khác nhau của cùng một mô hình.

Kiểm thử quyền trong các khung nhìn và mẫu sau đó rất giống với kiểm thử trạng thái xác thực (và trên thực tế, kiểm thử quyền cũng kiểm thử xác thực).

### Mô hình

Định nghĩa quyền được thực hiện trên phần `class Meta` của mô hình, sử dụng trường `permissions`.
Bạn có thể chỉ định bao nhiêu quyền tùy thích trong một tuple, mỗi quyền tự nó được định nghĩa trong một tuple lồng nhau chứa tên quyền và giá trị hiển thị quyền.
Ví dụ: chúng ta có thể định nghĩa một quyền để cho phép người dùng đánh dấu rằng một cuốn sách đã được trả lại như được hiển thị:

```python
class BookInstance(models.Model):
    # …
    class Meta:
        # …
        permissions = (("can_mark_returned", "Set book as returned"),)
```

Sau đó chúng ta có thể gán quyền cho một nhóm "Librarian" trong trang Admin.

Mở **catalog/models.py**, và thêm quyền như được hiển thị ở trên. Bạn sẽ cần chạy lại các migration của mình (gọi `python3 manage.py makemigrations` và `python3 manage.py migrate`) để cập nhật cơ sở dữ liệu một cách thích hợp.

### Mẫu

Quyền của người dùng hiện tại được lưu trữ trong một biến mẫu có tên `\{{ perms }}`. Bạn có thể kiểm tra xem người dùng hiện tại có quyền cụ thể không bằng cách sử dụng tên biến cụ thể trong "ứng dụng" Django liên quan — ví dụ: `\{{ perms.catalog.can_mark_returned }}` sẽ là `True` nếu người dùng có quyền này, và `False` nếu không. Chúng ta thường kiểm thử quyền bằng cách sử dụng thẻ mẫu `{% if %}` như được hiển thị:

```django
{% if perms.catalog.can_mark_returned %}
    <!-- We can mark a BookInstance as returned. -->
    <!-- Perhaps add code to link to a "book return" view here. -->
{% endif %}
```

### Khung nhìn

Quyền có thể được kiểm thử trong khung nhìn hàm bằng cách sử dụng decorator `permission_required` hoặc trong khung nhìn dựa trên lớp bằng cách sử dụng `PermissionRequiredMixin`. Các mẫu giống như đối với xác thực đăng nhập, mặc dù tất nhiên, bạn có thể hợp lý phải thêm nhiều quyền.

Decorator khung nhìn hàm:

```python
from django.contrib.auth.decorators import permission_required

@permission_required('catalog.can_mark_returned')
@permission_required('catalog.can_edit')
def my_view(request):
    # …
```

Một mixin yêu cầu quyền cho các khung nhìn dựa trên lớp.

```python
from django.contrib.auth.mixins import PermissionRequiredMixin

class MyView(PermissionRequiredMixin, View):
    permission_required = 'catalog.can_mark_returned'
    # Or multiple permissions
    permission_required = ('catalog.can_mark_returned', 'catalog.change_book')
    # Note that 'catalog.change_book' is permission
    # Is created automatically for the book model, along with add_book, and delete_book
```

> [!NOTE]
> Có một sự khác biệt mặc định nhỏ trong hành vi ở trên. Theo **mặc định** đối với người dùng đã đăng nhập với vi phạm quyền:
>
> - `@permission_required` chuyển hướng đến màn hình đăng nhập (HTTP Status 302).
> - `PermissionRequiredMixin` trả về 403 (HTTP Status Forbidden).
>
> Thông thường bạn sẽ muốn hành vi `PermissionRequiredMixin`: trả về 403 nếu người dùng đã đăng nhập nhưng không có quyền đúng. Để làm điều này cho một khung nhìn hàm, hãy sử dụng `@login_required` và `@permission_required` với `raise_exception=True` như được hiển thị:
>
> ```python
> from django.contrib.auth.decorators import login_required, permission_required
>
> @login_required
> @permission_required('catalog.can_mark_returned', raise_exception=True)
> def my_view(request):
>     # …
> ```

### Ví dụ

Chúng ta sẽ không cập nhật _LocalLibrary_ ở đây; có thể trong hướng dẫn tiếp theo!

## Thách thức bản thân

Trước đó trong bài viết này, chúng ta đã trình bày cách tạo một trang cho người dùng hiện tại, liệt kê các sách mà họ đã mượn.
Thách thức bây giờ là tạo một trang tương tự chỉ hiển thị cho thủ thư, hiển thị _tất cả_ sách đã được mượn, và bao gồm tên của mỗi người mượn.

Bạn nên có thể làm theo cùng mẫu như đối với khung nhìn khác. Sự khác biệt chính là bạn sẽ cần hạn chế khung nhìn chỉ cho thủ thư. Bạn có thể làm điều này dựa trên việc người dùng có phải là nhân viên hay không (decorator hàm: `staff_member_required`, biến mẫu: `user.is_staff`) nhưng chúng tôi khuyến nghị bạn sử dụng quyền `can_mark_returned` và `PermissionRequiredMixin`, như được mô tả trong phần trước.

> [!WARNING]
> Hãy nhớ không sử dụng người dùng siêu cấp của bạn để kiểm thử dựa trên quyền (kiểm tra quyền luôn trả về true cho người dùng siêu cấp, ngay cả khi quyền chưa được định nghĩa!). Thay vào đó, hãy tạo một người dùng thủ thư và thêm khả năng cần thiết.

Khi bạn hoàn thành, trang của bạn sẽ trông giống như ảnh chụp màn hình bên dưới.

![All borrowed books, restricted to librarian](library_borrowed_all.png)

## Tóm tắt

Xuất sắc — bạn đã tạo một trang web nơi các thành viên thư viện có thể đăng nhập và xem nội dung của riêng họ, và nơi thủ thư (với quyền đúng) có thể xem tất cả sách đã cho mượn và người mượn của chúng. Hiện tại chúng ta vẫn chỉ xem nội dung, nhưng các nguyên tắc và kỹ thuật tương tự được sử dụng khi bạn muốn bắt đầu sửa đổi và thêm dữ liệu.

Trong bài viết tiếp theo của chúng ta, chúng ta sẽ xem xét cách bạn có thể sử dụng các biểu mẫu Django để thu thập đầu vào của người dùng, và sau đó bắt đầu sửa đổi một số dữ liệu đã lưu trữ của chúng ta.

## Xem thêm

- [User authentication in Django](https://docs.djangoproject.com/en/5.0/topics/auth/) (Tài liệu Django)
- [Using the (default) Django authentication system](https://docs.djangoproject.com/en/5.0/topics/auth/default/) (Tài liệu Django)
- [Introduction to class-based views > Decorating class-based views](https://docs.djangoproject.com/en/5.0/topics/class-based-views/intro/#decorating-class-based-views) (Tài liệu Django)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Sessions", "Learn_web_development/Extensions/Server-side/Django/Forms", "Learn_web_development/Extensions/Server-side/Django")}}
