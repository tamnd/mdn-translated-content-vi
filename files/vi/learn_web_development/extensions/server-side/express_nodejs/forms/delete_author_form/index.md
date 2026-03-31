---
title: Biểu mẫu xóa tác giả
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Delete_author_form
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài viết con này cho thấy cách định nghĩa một trang để xóa các đối tượng `Author`.

Như đã thảo luận trong phần [thiết kế biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms#form_design), chiến lược của chúng ta sẽ là chỉ cho phép xóa các đối tượng không được tham chiếu bởi các đối tượng khác (trong trường hợp này có nghĩa là chúng ta sẽ không cho phép một `Author` bị xóa nếu nó được tham chiếu bởi một `Book`).
Về mặt triển khai, điều này có nghĩa là biểu mẫu cần xác nhận rằng không có sách liên quan nào trước khi tác giả bị xóa.
Nếu có sách liên quan, nó nên hiển thị chúng và nêu rõ rằng chúng phải được xóa trước khi đối tượng `Author` có thể bị xóa.

## Bộ điều khiển — route GET

Mở tệp **/controllers/authorController.js**. Tìm phương thức bộ điều khiển `author_delete_get()` đã được xuất và thay thế bằng đoạn mã sau.

```js
// Display Author delete form on GET.
exports.author_delete_get = async (req, res, next) => {
  // Get details of author and all their books (in parallel)
  const [author, allBooksByAuthor] = await Promise.all([
    Author.findById(req.params.id).exec(),
    Book.find({ author: req.params.id }, "title summary").exec(),
  ]);

  if (author === null) {
    // No results.
    res.redirect("/catalog/authors");
    return;
  }

  res.render("author_delete", {
    title: "Delete Author",
    author,
    author_books: allBooksByAuthor,
  });
};
```

Bộ điều khiển lấy id của phiên bản `Author` cần xóa từ tham số URL (`req.params.id`).
Nó sử dụng `await` trên promise được trả về bởi `Promise.all()` để chờ bất đồng bộ trên bản ghi tác giả được chỉ định và tất cả sách liên quan (song song).
Khi cả hai hoạt động hoàn tất, nó hiển thị view **author_delete.pug**, truyền các biến cho `title`, `author`, và `author_books`.

> [!NOTE]
> Nếu `findById()` không trả về kết quả nào thì tác giả không có trong cơ sở dữ liệu.
> Trong trường hợp này không có gì để xóa, vì vậy chúng ta chuyển hướng ngay đến danh sách tất cả tác giả.
>
> ```js
> if (author === null) {
>   // No results.
>   res.redirect("/catalog/authors");
>   return;
> }
> ```

## Bộ điều khiển — route POST

Tìm phương thức bộ điều khiển `author_delete_post()` đã được xuất, và thay thế bằng đoạn mã sau.

```js
// Handle Author delete on POST.
exports.author_delete_post = async (req, res, next) => {
  // Get details of author and all their books (in parallel)
  const [author, allBooksByAuthor] = await Promise.all([
    Author.findById(req.params.id).exec(),
    Book.find({ author: req.params.id }, "title summary").exec(),
  ]);

  if (allBooksByAuthor.length > 0) {
    // Author has books. Render in same way as for GET route.
    res.render("author_delete", {
      title: "Delete Author",
      author,
      author_books: allBooksByAuthor,
    });
    return;
  }
  // Author has no books. Delete object and redirect to the list of authors.
  await Author.findByIdAndDelete(req.body.authorid);
  res.redirect("/catalog/authors");
};
```

Đầu tiên chúng ta kiểm tra hợp lệ rằng một id đã được cung cấp (điều này được gửi qua các tham số body biểu mẫu, thay vì sử dụng phiên bản trong URL).
Sau đó chúng ta lấy tác giả và sách liên quan của họ theo cách tương tự như đối với route `GET`.
Nếu không có sách nào thì chúng ta xóa đối tượng tác giả và chuyển hướng đến danh sách tất cả tác giả.
Nếu vẫn còn sách thì chúng ta chỉ hiển thị lại biểu mẫu, truyền vào tác giả và danh sách sách cần xóa.

> [!NOTE]
> Chúng ta có thể kiểm tra xem lời gọi `findById()` có trả về kết quả nào không, và nếu không, ngay lập tức hiển thị danh sách tất cả tác giả.
> Chúng ta đã để mã như trên để ngắn gọn (nó vẫn sẽ trả về danh sách tác giả nếu id không được tìm thấy, nhưng điều này sẽ xảy ra sau `findByIdAndDelete()`).

## View

Tạo tệp **/views/author_delete.pug** và sao chép nội dung văn bản dưới đây vào.

```pug
extends layout

block content

  h1 #{title}: #{author.name}
  p= author.lifespan

  if author_books.length

    p #[strong Delete the following books before attempting to delete this author.]
    div(style='margin-left:20px;margin-top:20px')
      h4 Books
      dl
        each book in author_books
          dt
            a(href=book.url) #{book.title}
          dd #{book.summary}

  else
    p Do you really want to delete this Author?

    form(method='POST')
      div.form-group
        input#authorid.form-control(type='hidden', name='authorid', value=author._id )

      button.btn.btn-primary(type='submit') Delete
```

View mở rộng template bố cục, ghi đè block có tên `content`. Ở đầu, nó hiển thị chi tiết tác giả.
Sau đó nó bao gồm một câu lệnh điều kiện dựa trên số lượng **`author_books`** (mệnh đề `if` và `else`).

- Nếu _có_ sách liên kết với tác giả thì trang liệt kê các sách đó và nêu rõ rằng những cuốn sách này phải được xóa trước khi `Author` này có thể bị xóa.
- Nếu _không có_ sách nào thì trang hiển thị một nhắc nhở xác nhận.
- Nếu nút **Delete** được nhấn thì id tác giả được gửi đến máy chủ trong yêu cầu `POST` và bản ghi của tác giả đó sẽ bị xóa.

## Thêm control xóa

Tiếp theo chúng ta sẽ thêm một control **Delete** vào view _chi tiết Tác giả_ (trang chi tiết là nơi tốt để xóa một bản ghi từ đó).

> [!NOTE]
> Trong một triển khai đầy đủ, control sẽ chỉ được hiển thị cho người dùng được ủy quyền.
> Tuy nhiên tại thời điểm này chúng ta chưa có hệ thống ủy quyền!

Mở view **author_detail.pug** và thêm các dòng sau vào cuối.

```pug
hr
p
  a(href=author.url+'/delete') Delete author
```

Control bây giờ sẽ xuất hiện dưới dạng một liên kết, như được hiển thị dưới đây trên trang _chi tiết Tác giả_.

![The Author details section of the Local library application. The left column has a vertical navigation bar. The right section contains the author details with a heading that has the Author's name followed by the life dates of the author and lists the books written by the author below it. There is a button labelled 'Delete Author' at the bottom.](locallibary_express_author_detail_delete.png)

## Kết quả trông như thế nào?

Chạy ứng dụng và mở trình duyệt đến `http://localhost:3000/`.
Sau đó chọn liên kết _All authors_, rồi chọn một tác giả cụ thể. Cuối cùng chọn liên kết _Delete author_.

Nếu tác giả không có sách, bạn sẽ thấy một trang như thế này.
Sau khi nhấn delete, máy chủ sẽ xóa tác giả và chuyển hướng đến danh sách tác giả.

![The Delete Author section of the Local library application of an author who does not have any books. The left column has a vertical navigation bar. The right section contains the author's name and life dates. There is the question "Do you really want to delete this author" with a button labeled 'Delete'.](locallibary_express_author_delete_nobooks.png)

Nếu tác giả có sách, thì bạn sẽ thấy một view như sau.
Sau đó bạn có thể xóa các sách từ trang chi tiết của chúng (khi mã đó được triển khai!).

![The Delete Author section of the Local library application of an author who does have books under his name. The section contains the author's name and life dates of the author. There is a statement that reads "Delete the following books before attempting to delete this author" followed by the author's books. The list includes the titles of each book, as links, followed by a brief description in plain text.](locallibary_express_author_delete_withbooks.png)

> [!NOTE]
> Các trang khác để xóa đối tượng có thể được triển khai theo cách tương tự.
> Chúng ta đã để điều đó như một thử thách.

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms).
- Tiếp tục đến bài viết con cuối cùng của phần 6: [Biểu mẫu cập nhật Sách](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms/Update_Book_form).
