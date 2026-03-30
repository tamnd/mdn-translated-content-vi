---
title: "Hướng dẫn Django Phần 4: Trang quản trị Django"
short-title: "4: Trang quản trị Django"
slug: Learn_web_development/Extensions/Server-side/Django/Admin_site
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Models", "Learn_web_development/Extensions/Server-side/Django/Home_page", "Learn_web_development/Extensions/Server-side/Django")}}

Bây giờ chúng tôi đã tạo các mô hình cho website [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website), chúng tôi sẽ sử dụng trang quản trị Django để thêm một số dữ liệu sách "thực". Đầu tiên chúng tôi sẽ chỉ cho bạn cách đăng ký các mô hình với trang quản trị, sau đó chúng tôi sẽ chỉ cho bạn cách đăng nhập và tạo một số dữ liệu. Vào cuối bài viết, chúng tôi sẽ chỉ ra một số cách bạn có thể cải thiện hơn nữa việc trình bày trang Quản trị.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành trước: <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Models"
          >Hướng dẫn Django Phần 3: Sử dụng mô hình</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu lợi ích và hạn chế của trang quản trị Django, và sử dụng nó để tạo một số bản ghi cho mô hình của chúng ta.
      </td>
    </tr>
  </tbody>
</table>

## Tổng quan

_Ứng dụng_ quản trị Django có thể sử dụng các mô hình của bạn để tự động xây dựng khu vực trang bạn có thể sử dụng để tạo, xem, cập nhật và xóa bản ghi. Điều này có thể giúp bạn tiết kiệm nhiều thời gian trong quá trình phát triển, làm cho việc kiểm tra mô hình của bạn và có cảm giác về việc bạn có _đúng_ dữ liệu trở nên rất dễ dàng. Ứng dụng quản trị cũng có thể hữu ích để quản lý dữ liệu trong môi trường sản xuất, tùy thuộc vào loại website. Dự án Django chỉ khuyến nghị nó cho việc quản lý dữ liệu nội bộ (tức là chỉ để sử dụng bởi quản trị viên, hoặc những người nội bộ trong tổ chức của bạn), vì cách tiếp cận tập trung vào mô hình không nhất thiết là giao diện tốt nhất có thể cho tất cả người dùng, và tiết lộ nhiều chi tiết không cần thiết về các mô hình.

Tất cả cấu hình cần thiết để bao gồm ứng dụng quản trị trong website của bạn đã được thực hiện tự động khi bạn [tạo dự án khung sườn](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website) (để biết thông tin về các phụ thuộc thực tế cần thiết, xem [Django docs tại đây](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/)). Kết quả là, tất cả những gì bạn **phải** làm để thêm mô hình vào ứng dụng quản trị là _đăng ký_ chúng. Vào cuối bài viết này, chúng tôi sẽ cung cấp một bản demo ngắn gọn về cách bạn có thể cấu hình thêm khu vực quản trị để hiển thị tốt hơn dữ liệu mô hình của chúng ta.

Sau khi đăng ký các mô hình, chúng tôi sẽ chỉ cách tạo "superuser" mới, đăng nhập vào trang và tạo một số sách, tác giả, phiên bản sách và thể loại. Những thứ này sẽ hữu ích để kiểm tra các khung nhìn và mẫu mà chúng tôi sẽ bắt đầu tạo trong hướng dẫn tiếp theo.

## Đăng ký mô hình

Đầu tiên, mở **admin.py** trong ứng dụng catalog (**/django-locallibrary-tutorial/catalog/admin.py**). Nó hiện trông như thế này — lưu ý rằng nó đã nhập `django.contrib.admin`:

```python
from django.contrib import admin

# Register your models here.
```

Đăng ký các mô hình bằng cách sao chép văn bản sau vào cuối tệp. Code này nhập các mô hình và sau đó gọi `admin.site.register` để đăng ký từng cái trong số chúng.

```python
from .models import Author, Genre, Book, BookInstance, Language

admin.site.register(Book)
admin.site.register(Author)
admin.site.register(Genre)
admin.site.register(BookInstance)
admin.site.register(Language)
```

> [!NOTE]
> Các dòng trên giả định rằng bạn đã chấp nhận thách thức tạo mô hình để đại diện cho ngôn ngữ tự nhiên của sách ([xem bài hướng dẫn mô hình](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Models))!

Đây là cách đơn giản nhất để đăng ký một mô hình hoặc các mô hình với trang. Trang quản trị có thể tùy chỉnh rất cao, và chúng tôi sẽ nói thêm về các cách khác để đăng ký mô hình của bạn ở phần dưới.

## Tạo superuser

Để đăng nhập vào trang quản trị, chúng ta cần tài khoản người dùng với trạng thái _Staff_ được kích hoạt. Để xem và tạo bản ghi, chúng ta cũng cần người dùng này có quyền để quản lý tất cả đối tượng của chúng ta. Bạn có thể tạo tài khoản "superuser" có quyền truy cập đầy đủ vào trang và tất cả các quyền cần thiết bằng **manage.py**.

Gọi lệnh sau, trong cùng thư mục với **manage.py**, để tạo superuser. Bạn sẽ được nhắc nhập tên người dùng, địa chỉ email và mật khẩu _mạnh_.

```bash
python3 manage.py createsuperuser
```

Khi lệnh này hoàn thành, superuser mới sẽ được thêm vào cơ sở dữ liệu. Bây giờ hãy khởi động lại máy chủ phát triển để chúng ta có thể kiểm tra đăng nhập:

```bash
python3 manage.py runserver
```

## Đăng nhập và sử dụng trang

Để đăng nhập vào trang, mở URL _/admin_ (ví dụ: `http://127.0.0.1:8000/admin`) và nhập thông tin đăng nhập userid và mật khẩu superuser mới của bạn (bạn sẽ được chuyển hướng đến trang _login_, và sau đó quay lại URL _/admin_ sau khi bạn đã nhập thông tin chi tiết).

Phần này của trang hiển thị tất cả mô hình của chúng ta, được nhóm theo ứng dụng đã cài đặt. Bạn có thể nhấp vào tên mô hình để đến màn hình liệt kê tất cả bản ghi liên quan, và bạn có thể tiếp tục nhấp vào các bản ghi đó để chỉnh sửa chúng. Bạn cũng có thể trực tiếp nhấp vào liên kết **Add** bên cạnh mỗi mô hình để bắt đầu tạo bản ghi loại đó.

![Admin Site - Home page](admin_home.png)

Nhấp vào liên kết **Add** ở bên phải _Books_ để tạo sách mới (điều này sẽ hiển thị một hộp thoại giống như hộp thoại bên dưới). Lưu ý cách các tiêu đề của mỗi trường, loại widget được sử dụng và `help_text` (nếu có) khớp với các giá trị bạn đã chỉ định trong mô hình.

Nhập giá trị cho các trường. Bạn có thể tạo tác giả hoặc thể loại mới bằng cách nhấn nút **+** bên cạnh các trường tương ứng (hoặc chọn các giá trị hiện có từ danh sách nếu bạn đã tạo chúng). Khi xong bạn có thể nhấn **SAVE**, **Save and add another**, hoặc **Save and continue editing** để lưu bản ghi.

![Admin Site - Book Add](admin_book_add.png)

> [!NOTE]
> Tại thời điểm này, chúng tôi muốn bạn dành thời gian thêm một vài sách, tác giả, ngôn ngữ và thể loại (ví dụ: Fantasy) vào ứng dụng của bạn. Đảm bảo rằng mỗi tác giả và thể loại bao gồm một vài sách khác nhau (điều này sẽ làm cho các khung nhìn danh sách và chi tiết của bạn thú vị hơn khi chúng ta triển khai chúng sau trong chuỗi bài viết).

Khi bạn đã thêm xong sách, nhấp vào liên kết **Home** trong bookmark trên cùng để quay lại trang quản trị chính. Sau đó nhấp vào liên kết **Books** để hiển thị danh sách sách hiện tại (hoặc trên một trong các liên kết khác để xem danh sách mô hình khác). Bây giờ bạn đã thêm một vài sách, danh sách có thể trông giống như ảnh chụp màn hình bên dưới. Tiêu đề của mỗi sách được hiển thị; đây là giá trị được trả về trong phương thức `__str__()` của mô hình Book mà chúng ta đã chỉ định trong bài viết cuối.

![Admin Site - List of book objects](admin_book_list.png)

Từ danh sách này bạn có thể xóa sách bằng cách chọn hộp kiểm bên cạnh sách bạn không muốn, chọn hành động _delete…_ từ danh sách thả xuống _Action_, và sau đó nhấn nút **Go**. Bạn cũng có thể thêm sách mới bằng cách nhấn nút **ADD BOOK**.

Bạn có thể chỉnh sửa sách bằng cách chọn tên của nó trong liên kết. Trang chỉnh sửa cho một cuốn sách, được hiển thị dưới đây, gần giống với trang "Add". Các điểm khác biệt chính là tiêu đề trang (_Change book_) và việc thêm các nút **Delete**, **HISTORY** và **VIEW ON SITE** (nút cuối này xuất hiện vì chúng ta đã định nghĩa phương thức `get_absolute_url()` trong mô hình của mình).

> [!NOTE]
> Nhấp vào nút **VIEW ON SITE** sẽ gây ra ngoại lệ `NoReverseMatch` vì phương thức `get_absolute_url()` cố gắng `reverse()` ánh xạ URL có tên ('book-detail') chưa được định nghĩa.
> Chúng ta sẽ định nghĩa ánh xạ URL và khung nhìn liên quan trong [Hướng dẫn Django Phần 6: Các khung nhìn danh sách và chi tiết chung](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Generic_views).

![Admin Site - Book Edit](admin_book_modify.png)

Bây giờ điều hướng trở lại trang **Home** (sử dụng liên kết _Home_ trong đường dẫn breadcrumb) và sau đó xem danh sách **Author** và **Genre** — bạn đã có khá nhiều được tạo từ khi bạn thêm sách mới, nhưng hãy thoải mái thêm một số nữa.

Điều bạn sẽ không có là bất kỳ _Book Instance_ nào, vì những thứ này không được tạo từ Books (mặc dù bạn có thể tạo `Book` từ `BookInstance` — đây là bản chất của trường `ForeignKey`). Điều hướng trở lại trang _Home_ và nhấn nút **Add** liên quan để hiển thị màn hình _Add book instance_ bên dưới. Lưu ý Id lớn, duy nhất toàn cầu, có thể được sử dụng để xác định riêng biệt một bản sao của sách trong thư viện.

![Admin Site - BookInstance Add](admin_bookinstance_add.png)

Tạo một số bản ghi này cho mỗi sách của bạn. Đặt trạng thái là _Available_ cho ít nhất một số bản ghi và _On loan_ cho những bản ghi khác. Nếu trạng thái **không** phải là _Available_, thì cũng đặt ngày _Due back_ trong tương lai.

Đó là tất cả! Bây giờ bạn đã học cách thiết lập và sử dụng trang quản trị. Bạn cũng đã tạo bản ghi cho `Book`, `BookInstance`, `Genre`, `Language` và `Author` mà chúng ta sẽ có thể sử dụng khi chúng ta tạo các khung nhìn và mẫu của riêng mình.

## Cấu hình nâng cao

Django làm khá tốt trong việc tạo trang quản trị cơ bản bằng cách sử dụng thông tin từ các mô hình đã đăng ký:

- Mỗi mô hình có danh sách các bản ghi riêng lẻ, được xác định bởi chuỗi được tạo bằng phương thức `__str__()` của mô hình, và được liên kết với các khung nhìn/biểu mẫu chi tiết để chỉnh sửa. Theo mặc định, khung nhìn này có menu hành động ở đầu mà bạn có thể sử dụng để thực hiện các hoạt động xóa hàng loạt trên bản ghi.
- Các biểu mẫu bản ghi chi tiết mô hình để chỉnh sửa và thêm bản ghi chứa tất cả các trường trong mô hình, được bố trí theo chiều dọc theo thứ tự khai báo của chúng.

Bạn có thể tùy chỉnh thêm giao diện để làm cho nó dễ sử dụng hơn. Một số điều bạn có thể làm là:

- Các khung nhìn danh sách:
  - Thêm các trường/thông tin bổ sung được hiển thị cho mỗi bản ghi.
  - Thêm bộ lọc để chọn bản ghi nào được liệt kê, dựa trên ngày hoặc một số giá trị lựa chọn khác (ví dụ: trạng thái cho mượn sách).
  - Thêm các tùy chọn bổ sung vào menu hành động trong các khung nhìn danh sách và chọn nơi menu này được hiển thị trên biểu mẫu.

- Các khung nhìn chi tiết
  - Chọn các trường nào để hiển thị (hoặc loại trừ), cùng với thứ tự, nhóm, liệu chúng có thể chỉnh sửa được, widget được sử dụng, hướng v.v.
  - Thêm các trường liên quan vào bản ghi để cho phép chỉnh sửa inline (ví dụ: thêm khả năng thêm và chỉnh sửa bản ghi sách trong khi bạn tạo bản ghi tác giả của họ).

Trong phần này, chúng tôi sẽ xem xét một vài thay đổi sẽ cải thiện giao diện cho _LocalLibrary_ của chúng ta, bao gồm thêm thêm thông tin vào danh sách mô hình `Book` và `Author`, và cải thiện bố cục của các khung nhìn chỉnh sửa của họ. Chúng tôi sẽ không thay đổi việc trình bày mô hình `Language` và `Genre` vì chúng chỉ có một trường mỗi cái, vì vậy không có lợi ích thực sự khi làm như vậy!

Bạn có thể tìm thấy tham chiếu đầy đủ về tất cả các lựa chọn tùy chỉnh trang quản trị trong [Trang quản trị Django](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/) (Django Docs).

### Đăng ký lớp ModelAdmin

Để thay đổi cách mô hình được hiển thị trong giao diện quản trị, bạn định nghĩa lớp [ModelAdmin](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#modeladmin-objects) (mô tả bố cục) và đăng ký nó với mô hình.

Hãy bắt đầu với mô hình `Author`. Mở **admin.py** trong ứng dụng catalog (**/django-locallibrary-tutorial/catalog/admin.py**). Comment đăng ký gốc của bạn (thêm tiền tố với #) cho mô hình `Author`:

```python
# admin.site.register(Author)
```

Bây giờ thêm `AuthorAdmin` mới và đăng ký như được hiển thị dưới đây.

```python
# Define the admin class
class AuthorAdmin(admin.ModelAdmin):
    pass

# Register the admin class with the associated model
admin.site.register(Author, AuthorAdmin)
```

Bây giờ chúng tôi sẽ thêm các lớp `ModelAdmin` cho `Book` và `BookInstance`. Chúng ta một lần nữa cần comment các đăng ký gốc:

```python
# admin.site.register(Book)
# admin.site.register(BookInstance)
```

Bây giờ để tạo và đăng ký các mô hình mới; với mục đích của bản demo này, chúng ta sẽ thay vào đó sử dụng decorator `@register` để đăng ký các mô hình (điều này thực hiện chính xác cùng một thứ như cú pháp `admin.site.register()`):

```python
# Register the Admin classes for Book using the decorator
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    pass

# Register the Admin classes for BookInstance using the decorator
@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    pass
```

Hiện tại tất cả các lớp quản trị của chúng ta đều trống (xem `pass`) vì vậy hành vi quản trị sẽ không thay đổi! Chúng ta bây giờ có thể mở rộng chúng để định nghĩa hành vi quản trị cụ thể cho từng mô hình.

### Cấu hình các khung nhìn danh sách

_LocalLibrary_ hiện liệt kê tất cả tác giả bằng cách sử dụng tên đối tượng được tạo từ phương thức `__str__()` của mô hình. Điều này ổn khi bạn chỉ có một vài tác giả, nhưng khi bạn có nhiều tác giả, bạn có thể kết thúc có các tên trùng lặp. Để phân biệt chúng, hoặc chỉ vì bạn muốn hiển thị thông tin thú vị hơn về mỗi tác giả, bạn có thể sử dụng [list_display](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#django.contrib.admin.ModelAdmin.list_display) để thêm các trường bổ sung vào khung nhìn.

Thay thế lớp `AuthorAdmin` của bạn bằng code dưới đây. Các tên trường sẽ được hiển thị trong danh sách được khai báo trong _tuple_ theo thứ tự cần thiết, như được hiển thị (đây là các tên giống như được chỉ định trong mô hình gốc của bạn).

```python
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'date_of_birth', 'date_of_death')
```

Bây giờ điều hướng đến danh sách tác giả trong website của bạn. Các trường ở trên bây giờ sẽ được hiển thị, như thế này:

![Admin Site - Improved Author List](admin_improved_author_list.png)

Đối với mô hình `Book`, chúng ta sẽ thêm hiển thị `author` và `genre`. `author` là trường `ForeignKey` (mối quan hệ một-nhiều), và vì vậy sẽ được đại diện bởi giá trị `__str__()` cho bản ghi liên quan. Thay thế lớp `BookAdmin` bằng phiên bản dưới đây.

```python
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'display_genre')
```

Thật không may, chúng ta không thể trực tiếp chỉ định trường `genre` trong `list_display` vì nó là `ManyToManyField` (Django ngăn điều này vì sẽ có "chi phí" truy cập cơ sở dữ liệu lớn khi làm như vậy). Thay vào đó, chúng ta sẽ định nghĩa hàm `display_genre` để lấy thông tin dưới dạng chuỗi (đây là hàm chúng ta đã gọi ở trên; chúng ta sẽ định nghĩa nó dưới đây).

> [!NOTE]
> Lấy `genre` có thể không phải là ý tưởng tốt ở đây, vì "chi phí" của hoạt động cơ sở dữ liệu. Chúng tôi đang chỉ bạn cách này vì việc gọi các hàm trong mô hình của bạn có thể rất hữu ích vì những lý do khác — ví dụ để thêm liên kết _Delete_ bên cạnh mỗi mục trong danh sách.

Thêm code sau vào mô hình `Book` của bạn (**models.py**). Điều này tạo một chuỗi từ ba giá trị đầu tiên của trường `genre` (nếu chúng tồn tại) và tạo `short_description` có thể được sử dụng trong trang quản trị cho phương thức này.

```python
def display_genre(self):
    """Create a string for the Genre. This is required to display genre in Admin."""
    return ', '.join(genre.name for genre in self.genre.all()[:3])

display_genre.short_description = 'Genre'
```

Sau khi lưu mô hình và quản trị đã cập nhật, mở website của bạn và đến trang danh sách _Books_; bạn sẽ thấy danh sách sách như bên dưới:

![Admin Site - Improved Book List](admin_improved_book_list.png)

Mô hình `Genre` (và mô hình `Language`, nếu bạn đã định nghĩa một) đều có một trường duy nhất, vì vậy không có điểm tạo mô hình bổ sung cho chúng để hiển thị các trường bổ sung.

> [!NOTE]
> Đáng để cập nhật danh sách mô hình `BookInstance` để hiển thị ít nhất trạng thái và ngày trả dự kiến. Chúng tôi đã thêm điều đó như một thách thức vào cuối bài viết này!

### Thêm bộ lọc danh sách

Khi bạn có nhiều mục trong danh sách, việc lọc các mục nào được hiển thị có thể hữu ích.
Điều này được thực hiện bằng cách liệt kê các trường trong thuộc tính `list_filter`.
Thay thế lớp `BookInstanceAdmin` hiện tại của bạn bằng đoạn code bên dưới.

```python
class BookInstanceAdmin(admin.ModelAdmin):
    list_filter = ('status', 'due_back')
```

Khung nhìn danh sách bây giờ sẽ bao gồm hộp bộ lọc ở bên phải. Lưu ý cách bạn có thể chọn ngày và trạng thái để lọc các giá trị:

![Admin Site - BookInstance List Filters](admin_improved_bookinstance_list_filters.png)

### Tổ chức bố cục khung nhìn chi tiết

Theo mặc định, các khung nhìn chi tiết bố trí tất cả các trường theo chiều dọc, theo thứ tự khai báo của chúng trong mô hình. Bạn có thể thay đổi thứ tự khai báo, các trường nào được hiển thị (hoặc loại trừ), liệu các phần có được sử dụng để tổ chức thông tin, liệu các trường được hiển thị theo chiều ngang hay chiều dọc, và thậm chí những widget chỉnh sửa nào được sử dụng trong biểu mẫu quản trị.

> [!NOTE]
> Các mô hình _LocalLibrary_ tương đối đơn giản nên không có nhu cầu lớn để chúng ta thay đổi bố cục; chúng ta sẽ thực hiện một số thay đổi dù sao, chỉ để chỉ cho bạn cách.

#### Kiểm soát các trường nào được hiển thị và bố trí

Cập nhật lớp `AuthorAdmin` của bạn để thêm dòng `fields`, như được hiển thị dưới đây:

```python
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'date_of_birth', 'date_of_death')

    fields = ['first_name', 'last_name', ('date_of_birth', 'date_of_death')]
```

Thuộc tính `fields` chỉ liệt kê các trường đó sẽ được hiển thị trên biểu mẫu, theo thứ tự. Các trường được hiển thị theo chiều dọc theo mặc định, nhưng sẽ hiển thị theo chiều ngang nếu bạn nhóm thêm chúng trong một tuple (như được hiển thị trong các trường "date" ở trên).

Trong website của bạn, đến khung nhìn chi tiết tác giả — nó bây giờ sẽ xuất hiện như được hiển thị dưới đây:

![Admin Site - Improved Author Detail](admin_improved_author_detail.png)

> [!NOTE]
> Bạn cũng có thể sử dụng thuộc tính `exclude` để khai báo danh sách thuộc tính sẽ bị loại trừ khỏi biểu mẫu (tất cả các thuộc tính khác trong mô hình sẽ được hiển thị).

#### Phân chia khung nhìn chi tiết

Bạn có thể thêm "phần" để nhóm thông tin mô hình liên quan trong biểu mẫu chi tiết, bằng cách sử dụng thuộc tính [fieldsets](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#django.contrib.admin.ModelAdmin.fieldsets).

Trong mô hình `BookInstance`, chúng ta có thông tin liên quan đến cuốn sách là gì (tức là `name`, `imprint` và `id`) và khi nó sẽ có sẵn (`status`, `due_back`). Chúng ta có thể thêm những thứ này vào lớp `BookInstanceAdmin` của mình như được hiển thị dưới đây, bằng cách sử dụng thuộc tính `fieldsets`.

```python
@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    list_filter = ('status', 'due_back')

    fieldsets = (
        (None, {
            'fields': ('book', 'imprint', 'id')
        }),
        ('Availability', {
            'fields': ('status', 'due_back')
        }),
    )
```

Mỗi phần có tiêu đề riêng (hoặc `None`, nếu bạn không muốn tiêu đề) và một tuple các trường liên quan trong từ điển — định dạng phức tạp để mô tả, nhưng khá dễ hiểu nếu bạn nhìn vào đoạn code ngay trên.

Bây giờ điều hướng đến khung nhìn phiên bản sách trong website của bạn; biểu mẫu sẽ xuất hiện như được hiển thị dưới đây:

![Admin Site - Improved BookInstance Detail with sections](admin_improved_bookinstance_detail_sections.png)

### Chỉnh sửa inline của bản ghi liên quan

Đôi khi có thể hợp lý khi thêm các bản ghi liên quan vào cùng một lúc. Ví dụ, có thể hợp lý khi có cả thông tin sách và thông tin về các bản sao cụ thể bạn có trên cùng trang chi tiết.

Bạn có thể làm điều này bằng cách khai báo [inlines](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#django.contrib.admin.ModelAdmin.inlines), loại [TabularInline](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#django.contrib.admin.TabularInline) (bố cục ngang) hoặc [StackedInline](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#django.contrib.admin.StackedInline) (bố cục dọc, giống bố cục mô hình mặc định). Bạn có thể thêm thông tin `BookInstance` inline vào chi tiết `Book` của chúng ta bằng cách chỉ định `inlines` trong `BookAdmin`:

```python
class BooksInstanceInline(admin.TabularInline):
    model = BookInstance

@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'display_genre')

    inlines = [BooksInstanceInline]
```

Bây giờ điều hướng đến khung nhìn cho `Book` trong website của bạn — ở dưới cùng bạn bây giờ sẽ thấy các phiên bản sách liên quan đến sách này (ngay bên dưới các trường thể loại của sách):

![Admin Site - Book with Inlines](admin_improved_book_detail_inlines.png)

Trong trường hợp này, tất cả những gì chúng tôi đã làm là khai báo lớp inline dạng bảng, chỉ thêm tất cả các trường từ mô hình _được nhúng_. Bạn có thể chỉ định tất cả các loại thông tin bổ sung cho bố cục, bao gồm các trường để hiển thị, thứ tự của chúng, liệu chúng có ở chế độ chỉ đọc hay không, v.v. (xem [TabularInline](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/#django.contrib.admin.TabularInline) để biết thêm thông tin).

> [!NOTE]
> Có một số hạn chế đau đớn trong chức năng này! Trong ảnh chụp màn hình trên chúng ta có ba phiên bản sách hiện có, theo sau là ba placeholder cho phiên bản sách mới (trông rất giống!). Sẽ tốt hơn nếu không có phiên bản sách dự phòng theo mặc định và chỉ thêm chúng bằng liên kết **Add another Book instance**, hoặc chỉ liệt kê `BookInstance` như các liên kết không đọc được từ đây. Tùy chọn đầu tiên có thể được thực hiện bằng cách đặt thuộc tính `extra` thành `0` trong mô hình `BooksInstanceInline`, hãy tự thử.

## Tự thách thức bản thân

Chúng tôi đã học được rất nhiều trong phần này, vì vậy đây là lúc bạn thử một vài thứ.

1. Đối với khung nhìn danh sách `BookInstance`, thêm code để hiển thị sách, trạng thái, ngày trả và id (thay vì văn bản `__str__()` mặc định).
2. Thêm danh sách inline của các mục `Book` vào khung nhìn chi tiết `Author` bằng cách sử dụng cùng cách tiếp cận như chúng ta đã làm cho `Book`/`BookInstance`.

## Tóm tắt

Đó là tất cả! Bạn đã học cách thiết lập trang quản trị cả ở dạng đơn giản nhất và cải tiến, cách tạo superuser và cách điều hướng trang quản trị và xem, xóa và cập nhật bản ghi. Theo đó, bạn đã tạo một loạt Books, BookInstances, Genres và Authors mà chúng ta sẽ có thể liệt kê và hiển thị khi chúng ta tạo khung nhìn và mẫu của riêng mình.

## Đọc thêm

- [Writing your first Django app, part 2: Introducing the Django Admin](https://docs.djangoproject.com/en/5.0/intro/tutorial02/#introducing-the-django-admin) (Django docs)
- [The Django Admin site](https://docs.djangoproject.com/en/5.0/ref/contrib/admin/) (Django Docs)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Models", "Learn_web_development/Extensions/Server-side/Django/Home_page", "Learn_web_development/Extensions/Server-side/Django")}}
