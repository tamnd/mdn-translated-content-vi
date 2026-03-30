---
title: "Challenge: DIY Django mini blog"
short-title: "Challenge: Django blog"
slug: Learn_web_development/Extensions/Server-side/Django/django_assessment_blog
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Extensions/Server-side/Django/web_application_security", "Learn_web_development/Extensions/Server-side/Django")}}

Trong thử thách này, bạn sẽ sử dụng kiến thức Django mà bạn đã học được trong mô-đun [Django Web Framework (Python)](/en-US/docs/Learn_web_development/Extensions/Server-side/Django) để tạo một blog rất cơ bản.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Trước khi thực hiện thử thách này, bạn nên đã hoàn thành tất cả các bài viết trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Kiểm tra sự hiểu biết về các nguyên tắc cơ bản của Django, bao gồm cấu hình URL, models, views, biểu mẫu và mẫu.
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt dự án

Các trang cần được hiển thị, URL của chúng và các yêu cầu khác được liệt kê bên dưới:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Trang</th>
      <th scope="col">URL</th>
      <th scope="col">Yêu cầu</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Trang chủ</td>
      <td><code>/</code> và <code>/blog/</code></td>
      <td>Trang index mô tả trang web.</td>
    </tr>
    <tr>
      <td>Danh sách tất cả bài viết blog</td>
      <td><code>/blog/blogs/</code></td>
      <td>
        <p>Danh sách tất cả bài viết blog:</p>
        <ul>
          <li>Có thể truy cập cho tất cả người dùng từ liên kết thanh bên.</li>
          <li>Danh sách được sắp xếp theo ngày đăng (mới nhất đến cũ nhất).</li>
          <li>Danh sách được phân trang thành các nhóm 5 bài viết.</li>
          <li>Các mục danh sách hiển thị tiêu đề blog, ngày đăng và tác giả.</li>
          <li>Tên bài viết blog được liên kết đến trang chi tiết blog.</li>
          <li>
            Blogger (tên tác giả) được liên kết đến trang chi tiết tác giả blog.
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Trang chi tiết tác giả blog (blogger)</td>
      <td>
        <code>/blog/blogger/<em>&#x3C;author-id></em></code>
      </td>
      <td>
        <p>
          Thông tin cho một tác giả được chỉ định (theo id) và danh sách bài viết blog của họ:
        </p>
        <ul>
          <li>Có thể truy cập cho tất cả người dùng từ các liên kết tác giả trong bài viết blog, v.v.</li>
          <li>
            Chứa một số thông tin tiểu sử về blogger/tác giả.
          </li>
          <li>Danh sách được sắp xếp theo ngày đăng (mới nhất đến cũ nhất).</li>
          <li>Không được phân trang.</li>
          <li>Các mục danh sách chỉ hiển thị tên bài viết blog và ngày đăng.</li>
          <li>Tên bài viết blog được liên kết đến trang chi tiết blog.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Trang chi tiết bài viết blog</td>
      <td>
        <code>/blog/<em>&#x3C;blog-id></em></code>
      </td>
      <td>
        <p>Chi tiết bài viết blog.</p>
        <ul>
          <li>Có thể truy cập cho tất cả người dùng từ danh sách bài viết blog.</li>
          <li>
            Trang chứa bài viết blog: tên, tác giả, ngày đăng và nội dung.
          </li>
          <li>Các bình luận cho bài viết blog nên được hiển thị ở phía dưới.</li>
          <li>Các bình luận nên được sắp xếp theo thứ tự: cũ nhất đến gần đây nhất.</li>
          <li>
            Chứa liên kết thêm bình luận ở cuối cho người dùng đã đăng nhập (xem trang biểu mẫu bình luận)
          </li>
          <li>
            Bài viết blog và bình luận chỉ cần hiển thị văn bản thuần túy.
            Không cần hỗ trợ bất kỳ loại đánh dấu HTML nào (ví dụ: liên kết, hình ảnh, in đậm/nghiêng, v.v.).
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Danh sách tất cả bloggers</td>
      <td><code>/blog/bloggers/</code></td>
      <td>
        <p>Danh sách bloggers trên hệ thống:</p>
        <ul>
          <li>Có thể truy cập cho tất cả người dùng từ thanh bên trang web</li>
          <li>Tên blogger được liên kết đến trang chi tiết tác giả blog.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Trang biểu mẫu bình luận</td>
      <td><code>/blog/<em>&#x3C;blog-id></em>/create</code></td>
      <td>
        <p>Tạo bình luận cho bài viết blog:</p>
        <ul>
          <li>
            Chỉ có thể truy cập cho người dùng đã đăng nhập từ liên kết ở cuối trang chi tiết bài viết blog.
          </li>
          <li>
            Hiển thị biểu mẫu với mô tả để nhập bình luận (ngày đăng và blog không thể chỉnh sửa).
          </li>
          <li>
            Sau khi bình luận được đăng, trang sẽ chuyển hướng lại trang bài viết blog liên quan.
          </li>
          <li>Người dùng không thể chỉnh sửa hoặc xóa bài đăng của họ.</li>
          <li>
            Người dùng đã đăng xuất sẽ được dẫn đến trang đăng nhập để đăng nhập,
            trước khi họ có thể thêm bình luận. Sau khi đăng nhập, họ sẽ được
            chuyển hướng lại trang blog mà họ muốn bình luận.
          </li>
          <li>
            Trang bình luận nên bao gồm tên/liên kết đến bài viết blog đang được bình luận.
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Trang xác thực người dùng</td>
      <td>
        <code>/accounts/<em>&#x3C;standard urls></em></code>
      </td>
      <td>
        <p>
          Các trang xác thực Django tiêu chuẩn để đăng nhập, đăng xuất và đặt mật khẩu:
        </p>
        <ul>
          <li>Đăng nhập/xuất nên có thể truy cập qua các liên kết thanh bên.</li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Trang quản trị</td>
      <td>
        <code>/admin/<em>&#x3C;standard urls></em></code>
      </td>
      <td>
        <p>
          Trang quản trị nên được bật để cho phép tạo/chỉnh sửa/xóa bài viết
          blog, tác giả blog và bình luận blog (đây là cơ chế để
          bloggers tạo bài viết blog mới):
        </p>
        <ul>
          <li>
            Các bản ghi bài viết blog trên trang quản trị nên hiển thị danh sách các bình luận liên quan nội tuyến (bên dưới mỗi bài viết blog).
          </li>
          <li>
            Tên bình luận trong trang quản trị được tạo bằng cách cắt bớt mô tả bình luận xuống còn 75 ký tự.
          </li>
          <li>Các loại bản ghi khác có thể sử dụng đăng ký cơ bản.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

Ngoài ra, bạn nên viết một số kiểm thử cơ bản để xác minh:

- Tất cả các trường model có nhãn và độ dài chính xác.
- Tất cả các models có tên đối tượng mong đợi (ví dụ: `__str__()` trả về giá trị mong đợi).
- Các models có URL mong đợi cho các bản ghi Blog và Comment riêng lẻ (ví dụ: `get_absolute_url()` trả về URL mong đợi).
- BlogListView (trang tất cả blog) có thể truy cập tại vị trí mong đợi (ví dụ: /blog/blogs)
- BlogListView (trang tất cả blog) có thể truy cập tại URL có tên mong đợi (ví dụ: 'blogs')
- BlogListView (trang tất cả blog) sử dụng mẫu mong đợi (ví dụ: mẫu mặc định)
- BlogListView phân trang các bản ghi theo 5 (ít nhất trên trang đầu tiên)

> [!NOTE]
> Tất nhiên có nhiều kiểm thử khác bạn có thể chạy. Sử dụng phán đoán của bạn, nhưng chúng ta sẽ kỳ vọng bạn thực hiện ít nhất các kiểm thử trên.

Phần sau hiển thị [ảnh chụp màn hình](#screenshots) của một trang web thực hiện các yêu cầu trên.

## Ảnh chụp màn hình

Các ảnh chụp màn hình sau đây cung cấp ví dụ về đầu ra của chương trình hoàn chỉnh.

### Danh sách tất cả bài viết blog

Điều này hiển thị danh sách tất cả bài viết blog (có thể truy cập từ liên kết "All blogs" trong thanh bên). Những điều cần lưu ý:

- Thanh bên cũng liệt kê người dùng đã đăng nhập.
- Các bài viết blog và bloggers riêng lẻ có thể truy cập dưới dạng liên kết trong trang.
- Phân trang được bật (theo nhóm 5)
- Thứ tự là mới nhất đến cũ nhất.

![List of all blogs](diyblog_allblogs.png)

### Danh sách tất cả bloggers

Điều này cung cấp các liên kết đến tất cả bloggers, được liên kết từ liên kết "All bloggers" trong thanh bên. Trong trường hợp này chúng ta có thể thấy từ thanh bên rằng không có người dùng nào đã đăng nhập.

![List of all bloggers](diyblog_blog_allbloggers.png)

### Trang chi tiết blog

Điều này hiển thị trang chi tiết cho một blog cụ thể.

![Blog detail with add comment link](diyblog_blog_detail_add_comment.png)

Lưu ý rằng các bình luận có ngày _và_ giờ, và được sắp xếp từ cũ nhất đến mới nhất (ngược với thứ tự blog). Ở cuối chúng ta có liên kết để truy cập biểu mẫu thêm bình luận mới. Nếu người dùng không đăng nhập, chúng ta sẽ thấy thay vào đó là một gợi ý để đăng nhập.

![Comment link when not logged in](diyblog_blog_detail_not_logged_in.png)

### Biểu mẫu thêm bình luận

Đây là biểu mẫu để thêm bình luận. Lưu ý rằng chúng ta đã đăng nhập. Khi điều này thành công, chúng ta sẽ được đưa trở lại trang bài viết blog liên quan.

![Add comment form](diyblog_comment_form.png)

### Tiểu sử tác giả

Điều này hiển thị thông tin tiểu sử cho một blogger cùng với danh sách bài viết blog của họ.

![Blogger detail page](diyblog_blogger_detail.png)

## Các bước để hoàn thành

Các phần sau mô tả những gì bạn cần làm.

1. Tạo dự án khung và ứng dụng web cho trang web (như được mô tả trong [Django Tutorial Part 2: Creating a skeleton website](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website)). Bạn có thể sử dụng 'diyblog' cho tên dự án và 'blog' cho tên ứng dụng.
2. Tạo models cho bài viết blog, bình luận và bất kỳ đối tượng nào khác cần thiết. Khi suy nghĩ về thiết kế của bạn, hãy nhớ:
   - Mỗi bình luận sẽ chỉ có một blog, nhưng một blog có thể có nhiều bình luận.
   - Bài viết blog và bình luận phải được sắp xếp theo ngày đăng.
   - Không phải mọi người dùng đều nhất thiết là tác giả blog mặc dù bất kỳ người dùng nào cũng có thể là người bình luận.
   - Tác giả blog cũng phải bao gồm thông tin tiểu sử.

3. Chạy migrations cho các models mới của bạn và tạo superuser.
4. Sử dụng trang quản trị để tạo một số bài viết blog và bình luận blog ví dụ.
5. Tạo views, mẫu và cấu hình URL cho các trang danh sách bài viết blog và blogger.
6. Tạo views, mẫu và cấu hình URL cho các trang chi tiết bài viết blog và blogger.
7. Tạo một trang với biểu mẫu để thêm bình luận mới (hãy nhớ chỉ cho phép người dùng đã đăng nhập làm điều này!)

## Gợi ý và mẹo

Dự án này rất giống với hướng dẫn [LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Tutorial_local_library_website). Bạn có thể thiết lập khung, hành vi đăng nhập/đăng xuất người dùng, hỗ trợ cho các tệp tĩnh, views, URLs, biểu mẫu, mẫu cơ sở và cấu hình trang quản trị bằng cách sử dụng hầu hết tất cả các cách tiếp cận tương tự.

Một số gợi ý chung:

1. Trang index có thể được triển khai như một function view và mẫu cơ bản (giống như cho locallibrary).
2. View danh sách cho bài viết blog và bloggers, và view chi tiết cho bài viết blog có thể được tạo bằng cách sử dụng [khung nhìn danh sách và chi tiết tổng quát](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Generic_views).
3. Danh sách bài viết blog cho một tác giả cụ thể có thể được tạo bằng cách sử dụng view danh sách blog tổng quát và lọc các đối tượng blog khớp với tác giả được chỉ định.
   - Bạn sẽ phải triển khai `get_queryset(self)` để thực hiện lọc (giống như trong lớp thư viện của chúng ta `LoanedBooksAllListView`) và lấy thông tin tác giả từ URL.
   - Bạn cũng cần truyền tên tác giả đến trang trong ngữ cảnh. Để làm điều này trong class-based view, bạn cần triển khai `get_context_data()` (được thảo luận bên dưới).

4. Biểu mẫu _thêm bình luận_ có thể được tạo bằng cách sử dụng function-based view (và model và biểu mẫu liên quan) hoặc sử dụng `CreateView` tổng quát. Nếu bạn sử dụng `CreateView` (được khuyến nghị) thì:
   - Bạn cũng cần truyền tên bài viết blog đến trang bình luận trong ngữ cảnh (triển khai `get_context_data()` như được thảo luận bên dưới).
   - Biểu mẫu chỉ nên hiển thị "mô tả" bình luận cho người dùng nhập vào (ngày và bài viết blog liên quan không nên có thể chỉnh sửa được). Vì chúng sẽ không có trong biểu mẫu, code của bạn sẽ cần đặt tác giả của bình luận trong hàm `form_valid()` để nó có thể được lưu vào model ([như được mô tả ở đây](https://docs.djangoproject.com/en/5.0/topics/class-based-views/generic-editing/#models-and-request-user) — Tài liệu Django). Trong cùng hàm đó, chúng ta đặt blog liên quan. Một cài đặt khả thi được hiển thị bên dưới (`pk` là blog id được truyền vào từ URL/cấu hình URL).

     ```python
         def form_valid(self, form):
             """
             Add author and associated blog to form data before setting it as valid (so it is saved to model)
             """
             # Add logged-in user as author of comment
             form.instance.author = self.request.user
             #Associate comment with blog based on passed id
             form.instance.blog=get_object_or_404(Blog, pk = self.kwargs['pk'])
             # Call super-class form validation behavior
             return super(BlogCommentCreate, self).form_valid(form)
     ```

   - Bạn sẽ cần cung cấp URL thành công để chuyển hướng sau khi biểu mẫu xác thực; đây nên là blog gốc. Để làm điều này, bạn sẽ cần ghi đè `get_success_url()` và "đảo ngược" URL cho blog gốc. Bạn có thể lấy blog ID cần thiết bằng cách sử dụng thuộc tính `self.kwargs`, như được hiển thị trong phương thức `form_valid()` ở trên.

Chúng ta đã ngắn gọn nói về việc truyền ngữ cảnh đến mẫu trong class-based view trong chủ đề [Django Tutorial Part 6: Generic list and detail views](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Generic_views#overriding_methods_in_class-based_views). Để làm điều này, bạn cần ghi đè `get_context_data()` (đầu tiên lấy ngữ cảnh hiện có, cập nhật nó với bất kỳ biến bổ sung nào bạn muốn truyền đến mẫu, sau đó trả về ngữ cảnh đã cập nhật). Ví dụ: đoạn code bên dưới cho thấy cách bạn có thể thêm đối tượng blogger vào ngữ cảnh dựa trên `BlogAuthor` id của họ.

```python
class SomeView(generic.ListView):
    # …

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(SomeView, self).get_context_data(**kwargs)
        # Get the blogger object from the "pk" URL parameter and add it to the context
        context['blogger'] = get_object_or_404(BlogAuthor, pk = self.kwargs['pk'])
        return context
```

## Đánh giá

Bài đánh giá cho thử thách này [có sẵn trên GitHub tại đây](https://github.com/mdn/django-diy-blog/blob/main/MarkingGuide.md). Bài đánh giá này chủ yếu dựa trên mức độ ứng dụng của bạn đáp ứng các yêu cầu chúng ta đã liệt kê ở trên, mặc dù có một số phần kiểm tra code của bạn sử dụng các models phù hợp, và bạn đã viết ít nhất một số code kiểm thử.
Khi bạn hoàn thành, bạn có thể xem [ví dụ hoàn chỉnh](https://github.com/mdn/django-diy-blog) phản ánh dự án "điểm đầy đủ".

Sau khi bạn hoàn thành mô-đun này, bạn cũng đã hoàn thành tất cả nội dung MDN để học lập trình trang web phía máy chủ Django cơ bản! Chúng ta hy vọng bạn thích mô-đun này và cảm thấy bạn đã nắm bắt tốt các kiến thức cơ bản!

{{PreviousMenu("Learn_web_development/Extensions/Server-side/Django/web_application_security", "Learn_web_development/Extensions/Server-side/Django")}}
