---
title: Giới thiệu về template
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/Template_primer
page-type: learn-module-chapter
sidebar: learnsidebar
---

Một template là một tệp văn bản định nghĩa _cấu trúc_ hoặc bố cục của tệp đầu ra, với các placeholder được sử dụng để đại diện cho nơi dữ liệu sẽ được chèn vào khi template được hiển thị (trong _Express_, các template được gọi là _views_).

## Các lựa chọn template trong Express

Express có thể được sử dụng với nhiều [công cụ hiển thị template](https://expressjs.com/en/guide/using-template-engines.html) khác nhau. Trong hướng dẫn này, chúng ta sử dụng [Pug](https://pugjs.org/api/getting-started.html) (trước đây được gọi là _Jade_) cho các template của mình. Đây là ngôn ngữ template Node phổ biến nhất, và tự mô tả mình là "cú pháp rõ ràng, nhạy cảm với khoảng trắng để viết HTML, được ảnh hưởng nhiều bởi [Haml](https://haml.info/)".

Các ngôn ngữ template khác nhau sử dụng các cách tiếp cận khác nhau để định nghĩa bố cục và đánh dấu các placeholder cho dữ liệu — một số sử dụng HTML để định nghĩa bố cục trong khi những ngôn ngữ khác sử dụng các định dạng đánh dấu khác có thể được biên dịch sang HTML. Pug thuộc loại thứ hai; nó sử dụng _biểu diễn_ của HTML trong đó từ đầu tiên trên bất kỳ dòng nào thường đại diện cho một phần tử HTML, và thụt lề trên các dòng tiếp theo được sử dụng để đại diện cho sự lồng nhau. Kết quả là một định nghĩa trang dịch trực tiếp sang HTML, nhưng ngắn gọn hơn và có thể nói là dễ đọc hơn.

> [!NOTE]
> Một nhược điểm của việc sử dụng _Pug_ là nó nhạy cảm với thụt lề và khoảng trắng (nếu bạn thêm một khoảng trắng thừa ở sai vị trí, bạn có thể nhận được mã lỗi không hữu ích). Tuy nhiên, một khi bạn đã có các template đã thiết lập, chúng rất dễ đọc và duy trì.

## Cấu hình template

_LocalLibrary_ được cấu hình để sử dụng [Pug](https://pugjs.org/api/getting-started.html) khi chúng ta [tạo trang web khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website). Bạn có thể thấy module pug được bao gồm như một phụ thuộc trong tệp **package.json** của trang web, và các cài đặt cấu hình sau trong tệp **app.js**. Các cài đặt cho chúng ta biết rằng chúng ta đang sử dụng pug làm công cụ view, và _Express_ nên tìm kiếm các template trong thư mục con **/views**.

```js
// View engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");
```

Nếu bạn nhìn vào thư mục views, bạn sẽ thấy các tệp .pug cho các view mặc định của dự án.
Chúng bao gồm view cho trang chủ (**index.pug**) và mẫu cơ sở (**layout.pug**) mà chúng ta cần thay thế bằng nội dung của riêng mình.

```plain
/express-locallibrary-tutorial  # the project root
  /views
    error.pug
    index.pug
    layout.pug
```

## Cú pháp template

Tệp template ví dụ dưới đây trình bày nhiều tính năng hữu ích nhất của Pug.

Điều đầu tiên cần chú ý là tệp ánh xạ cấu trúc của một tệp HTML điển hình, với từ đầu tiên trên (hầu hết) mỗi dòng là một phần tử HTML, và thụt lề được sử dụng để chỉ ra các phần tử lồng nhau. Vì vậy, ví dụ, phần tử `body` nằm bên trong phần tử `html`, và các phần tử đoạn văn (`p`) nằm trong phần tử `body`, v.v. Các phần tử không lồng nhau (ví dụ: các đoạn văn riêng lẻ) được đặt trên các dòng riêng biệt.

```pug
doctype html
html(lang="en")
  head
    title= title
    script(type='text/javascript').
  body
    h1= title

    p This is a line with #[em some emphasis] and #[strong strong text] markup.
    p This line has un-escaped data: !{'<em> is emphasized</em>'} and escaped data: #{'<em> is not emphasized</em>'}.
      | This line follows on.
    p= 'Evaluated and <em>escaped expression</em>:' + title

    <!-- You can add HTML comments directly -->
    // You can add single line JavaScript comments and they are generated to HTML comments
    //- Introducing a single line JavaScript comment with "//-" ensures the comment isn't rendered to HTML

    p A line with a link
      a(href='/catalog/authors') Some link text
      |  and some extra text.

    #container.col
      if title
        p A variable named "title" exists.
      else
        p A variable named "title" does not exist.
      p.
        Pug is a terse and simple template language with a
        strong focus on performance and powerful features.

    h2 Generate a list

    ul
      each val in [1, 2, 3, 4, 5]
        li= val
```

Các thuộc tính phần tử được định nghĩa trong ngoặc đơn sau phần tử liên kết của chúng. Bên trong ngoặc đơn, các thuộc tính được định nghĩa trong danh sách phân tách bằng dấu phẩy hoặc khoảng trắng của các cặp tên thuộc tính và giá trị thuộc tính, ví dụ:

- `script(type='text/javascript')`, `link(rel='stylesheet', href='/stylesheets/style.css')`
- `meta(name='viewport' content='width=device-width initial-scale=1')`

Các giá trị của tất cả các thuộc tính đều bị _escape_ (ví dụ: các ký tự như `>` được chuyển đổi thành các mã tương đương HTML như `&gt;`) để ngăn chặn các cuộc tấn công chèn JavaScript hoặc tấn công cross-site scripting.

Nếu một thẻ được theo sau bởi dấu bằng, văn bản tiếp theo được coi là _biểu thức_ JavaScript. Vì vậy, ví dụ, trong dòng đầu tiên bên dưới, nội dung của thẻ `h1` sẽ là _biến_ `title` (hoặc được định nghĩa trong tệp hoặc được truyền vào template từ Express). Trong dòng thứ hai, nội dung đoạn văn là một chuỗi văn bản được nối với biến `title`. Trong cả hai trường hợp, hành vi mặc định là _escape_ dòng.

```pug
h1= title
p= 'Evaluated and <em>escaped expression</em>:' + title
```

> [!NOTE]
> Trong các template Pug, một biến được sử dụng nhưng không được truyền vào từ mã Express của bạn (hoặc được định nghĩa cục bộ) sẽ là "undefined".
> Nếu bạn sử dụng template này mà không truyền vào biến `title`, các thẻ sẽ được tạo nhưng sẽ chứa chuỗi rỗng.
> Nếu bạn sử dụng các biến chưa được định nghĩa trong các câu lệnh điều kiện, chúng sẽ được đánh giá là `false`.
> Các ngôn ngữ template khác có thể yêu cầu rằng các biến được sử dụng trong template phải được định nghĩa.

Nếu không có ký hiệu bằng sau thẻ thì nội dung được coi là văn bản thuần túy. Trong văn bản thuần túy, bạn có thể chèn dữ liệu đã escape và chưa escape bằng cú pháp `#{}` và `!{}` tương ứng, như được hiển thị dưới đây. Bạn cũng có thể thêm HTML thô trong văn bản thuần túy.

```pug
p This is a line with #[em some emphasis] and #[strong strong text] markup.
p This line has an un-escaped string: !{'<em> is emphasized</em>'}, an escaped string: #{'<em> is not emphasized</em>'}, and escaped variables: #{title}.
```

> [!NOTE]
> Bạn hầu như luôn muốn escape dữ liệu từ người dùng (thông qua cú pháp **`#{}`**). Dữ liệu có thể tin cậy (ví dụ: số đếm bản ghi được tạo ra, v.v.) có thể được hiển thị mà không cần escape các giá trị.

Bạn có thể sử dụng ký tự pipe ('**|**') ở đầu dòng để chỉ ra "[văn bản thuần túy](https://pugjs.org/language/plain-text.html)". Ví dụ, văn bản bổ sung được hiển thị dưới đây sẽ được hiển thị trên cùng dòng với anchor trước đó, nhưng sẽ không được liên kết.

```pug
a(href='http://someurl/') Link text
| Plain text
```

Pug cho phép bạn thực hiện các phép toán điều kiện sử dụng `if`, `else`, `else if` và `unless` — ví dụ:

```pug
if title
  p A variable named "title" exists
else
  p A variable named "title" does not exist
```

Bạn cũng có thể thực hiện các phép toán lặp/lặp qua bằng cú pháp `each-in` hoặc `while`. Trong đoạn mã dưới đây, chúng ta đã lặp qua một mảng để hiển thị danh sách các biến (lưu ý việc sử dụng 'li=' để đánh giá "val" như một biến bên dưới. Giá trị bạn lặp qua cũng có thể được truyền vào template như một biến!

```pug
ul
  each val in [1, 2, 3, 4, 5]
    li= val
```

Cú pháp cũng hỗ trợ các chú thích (có thể được hiển thị trong đầu ra — hoặc không — tùy bạn chọn), các mixin để tạo các khối mã có thể tái sử dụng, các câu lệnh case, và nhiều tính năng khác. Để biết thông tin chi tiết hơn, xem [tài liệu Pug](https://pugjs.org/api/getting-started.html).

## Mở rộng template

Trên một trang web, thông thường tất cả các trang đều có cấu trúc chung, bao gồm đánh dấu HTML tiêu chuẩn cho head, footer, điều hướng, v.v. Thay vì buộc các nhà phát triển phải sao chép "boilerplate" này trong mỗi trang, _Pug_ cho phép bạn khai báo một template cơ sở và sau đó mở rộng nó, chỉ thay thế các phần khác nhau cho từng trang cụ thể.

Ví dụ, mẫu cơ sở **layout.pug** được tạo trong [dự án khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website) của chúng ta trông như thế này:

```pug
doctype html
html
  head
    title= title
    link(rel='stylesheet', href='/stylesheets/style.css')
  body
    block content
```

Thẻ `block` được sử dụng để đánh dấu các phần nội dung có thể được thay thế trong một template dẫn xuất (nếu block không được định nghĩa lại thì việc triển khai của nó trong lớp cơ sở được sử dụng).

Tệp **index.pug** mặc định (được tạo cho dự án khung của chúng ta) cho thấy cách chúng ta ghi đè template cơ sở. Thẻ `extends` xác định template cơ sở cần sử dụng, và sau đó chúng ta sử dụng `block section_name` để chỉ ra nội dung mới của phần mà chúng ta sẽ ghi đè.

```pug
extends layout

block content
  h1= title
  p Welcome to #{title}
```

## Các bước tiếp theo

- Quay lại [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data).
- Tiếp tục đến bài viết con tiếp theo của phần 5: [Mẫu cơ sở LocalLibrary](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data/LocalLibrary_base_template).
