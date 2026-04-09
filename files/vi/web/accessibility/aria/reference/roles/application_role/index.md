---
title: "ARIA: vai trò application"
short-title: application
slug: Web/Accessibility/ARIA/Reference/Roles/application_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#application
sidebar: accessibilitysidebar
---

Vai trò `application` cho công nghệ hỗ trợ biết rằng một phần tử _và toàn bộ các phần tử con của nó_ nên được xử lý tương tự như một ứng dụng trên máy tính để bàn, và không nên dùng các kỹ thuật diễn giải HTML truyền thống. Vai trò này chỉ nên được dùng để xác định các ứng dụng web rất động và mang kiểu máy tính để bàn. Phần lớn ứng dụng web trên di động và máy tính để bàn _không_ được xem là ứng dụng theo mục đích này.

```html
<div role="application" aria-label="…">…</div>
```

Bằng cách chỉ định vai trò `application`, điều này cho biết phần tử `div` này và toàn bộ các phần tử con của nó phải được xử lý như thể chúng là một phần của ứng dụng trên máy tính để bàn.

## Mô tả

Vai trò `application` [cấu trúc tài liệu](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#1._document_structure_roles) cho công nghệ hỗ trợ biết rằng phần nội dung web này chứa các phần tử không khớp với bất kỳ phần tử HTML hay widget WAI-ARIA nào đã biết khác. Mọi kiểu diễn giải đặc biệt đối với cấu trúc HTML và widget nên được tạm dừng, và quyền điều khiển phải được giao hoàn toàn cho trình duyệt và ứng dụng web để xử lý tương tác chuột, bàn phím hoặc chạm.

Ở chế độ này, tác giả web hoàn toàn chịu trách nhiệm xử lý mọi nhập liệu bàn phím, quản lý tiêu điểm và các tương tác khác, đồng thời không thể giả định rằng công nghệ hỗ trợ sẽ tự xử lý bất cứ phần nào.

Nếu ứng dụng web được bao phủ bởi vai trò application có những phần nên được coi như nội dung web bình thường, hãy dùng vai trò [`document`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role) hoặc [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role) để bao bọc những nội dung đó.

### Bối cảnh

Vì lý do lịch sử, đặc biệt là trên Windows, trình đọc màn hình và một số công nghệ hỗ trợ khác (AT) thường lấy toàn bộ nội dung web từ trình duyệt cùng một lúc sau khi tải xong. AT tự xây dựng một biểu diễn riêng của nội dung sao cho phù hợp nhất để người dùng khiếm thị tiếp nhận. Điều này thường được gọi là _tài liệu ảo_, _chế độ duyệt_, hoặc các thuật ngữ tương tự. Tài liệu được tinh gọn thành chế độ xem một cột. Một mô hình tương tác bàn phím rất giống trình xử lý văn bản được tạo ra, nơi người dùng có thể đọc theo từng dòng, từng câu, hoặc từng đoạn. AT sẽ đọc các ngữ nghĩa như liên kết, tiêu đề, điều khiển biểu mẫu, bảng, danh sách, hoặc hình ảnh.

Ngoài ra, qua nhiều năm đã hình thành một tập hợp các _phím điều hướng nhanh_ cho phép người dùng khiếm thị lướt qua một trang theo một loại phần tử nhất định. Những phần tử như vậy thường gồm tiêu đề, trường biểu mẫu, danh sách, bảng, liên kết, đồ họa hoặc các vùng landmark.

Để tất cả điều này hoạt động, AT chặn hầu như toàn bộ nhập liệu bàn phím và tự xử lý chúng, không cho gì lọt sang trình duyệt hoặc tác nhân người dùng khác. Để có thể tương tác với trang web, một tập hợp chuẩn các widget được nhận diện và khi nhấn một phím nhất định (thường là phím <kbd>Enter</kbd>) thì chế độ này sẽ bị tắt. Chế độ trình đọc màn hình, thường được gọi là _forms mode_ hoặc _focus mode_, cho tất cả nhập liệu bàn phím đi thẳng trở lại trình duyệt. <kbd>Escape</kbd> là cách phổ biến nhất để quay lại chế độ _browse_, nhưng khi ở bên trong một phần `application` cụ thể, một số trình đọc màn hình có thể yêu cầu các phím khác để thoát có chủ đích khỏi chế độ này. Ví dụ như <kbd>NUMPAD PLUS</kbd> với JAWS.

Vai trò `application` được thiết kế để cung cấp một cách để các widget không thuộc bộ chuẩn vẫn có thể truy cập được khi tương tác trực tiếp trong AT dùng cả chế độ _browse_ và _focus_ để làm việc với nội dung web. Hầu hết widget phổ biến đã có hành vi tương tác bàn phím kỳ vọng sẵn. Vì vậy, một trải nghiệm bàn phím tùy biến do tác giả web tạo ra có thể gây nhầm lẫn.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`document`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role), [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role)
  - : Dùng để chỉ ra những phần của ứng dụng nên được coi là nội dung web bình thường
- [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
  - : Dùng để quản lý tiêu điểm bên trong ứng dụng.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Dùng để cung cấp tên của ứng dụng hoặc mục đích của widget đang được công bố.
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
  - : Dùng để tham chiếu tới `id` của phần tử chứa thêm hướng dẫn về cách điều hướng hoặc vận hành phần tử này.
- [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription)
  - : Dùng để cho ứng dụng một văn bản mô tả vai trò chi tiết hơn để trình đọc màn hình đọc. Nên được bản địa hóa.
- [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled)
  - : Cho biết phần tử đang hiển thị nhưng bị vô hiệu hóa
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
  - : Tham chiếu tới phần tử cung cấp thông báo lỗi cho phần tử mà nó được đặt lên
- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Nếu đặt `true`, phần tử nhóm do phần tử này sở hữu hoặc điều khiển đang được mở rộng, còn `false` nếu đang thu gọn.
- [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup)
  - : Cho biết có một popup, chẳng hạn menu hoặc dialog, có thể được kích hoạt bởi phần tử.

### Tương tác bàn phím

Tương tác bàn phím hoàn toàn do tác giả web kiểm soát và có thể là bất cứ thứ gì gắn với widget cụ thể đang được triển khai. Trong một ứng dụng trình chiếu, chẳng hạn, có thể tạo một widget dùng các phím mũi tên để định vị các phần tử trên slide, và dùng phản hồi âm thanh thông qua một vùng trực tiếp ARIA để truyền đạt vị trí và trạng thái chồng lấn với các đối tượng khác. Tiêu điểm được quản lý thông qua _aria-activedescendant_.

Các phím <kbd>Tab</kbd>, <kbd>Space</kbd> và <kbd>Enter</kbd>, cũng như <kbd>Escape</kbd>, phải được ứng dụng xử lý. Ngoại lệ duy nhất là khi tiêu điểm được đặt vào một widget chuẩn bên trong ứng dụng đã hỗ trợ điều hướng bàn phím từ trình duyệt, ví dụ một phần tử [input](/en-US/docs/Web/HTML/Reference/Elements/input).

### Các tính năng JavaScript bắt buộc

- keyPress
  - : Dùng để xử lý nhập liệu bàn phím và điều khiển tiêu điểm
- Click, Touch
  - : Xử lý phù hợp cho widget của bạn
- Thay đổi giá trị thuộc tính
  - : [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) được dùng để quản lý tiêu điểm bên trong vùng chứa ứng dụng. Đặt giá trị này khi có các sự kiện từ bàn phím hoặc sự kiện ứng dụng khác làm thay đổi tiêu điểm hoặc điểm tương tác.

> [!NOTE]
> Vai trò `application` không có widget HTML liên quan nên hoàn toàn tự do về hình thức. Tác giả của ứng dụng phải hoàn toàn chịu trách nhiệm để không khiến người dùng bị kẹt trong một focus trap bên trong thứ họ không thể thoát ra. Mọi khía cạnh tương tác, bao gồm việc quay lại nội dung web bình thường ở các phần khác của trang, đều phải được xử lý. Hãy dùng cẩn thận, và nhớ kiểm thử!

## Ví dụ

Một số ứng dụng web nổi bật đã dùng hoặc từng dùng vai trò application đúng cách là:

- Google Docs, Sheets và Slides
- CKEditor và TinyMCE WYSIWYG web editors, như công cụ được dùng trên Mozilla Developer Network
- Một số phần của Gmail

## Các vấn đề về khả năng truy cập

Việc dùng vai trò `application` không đúng có thể vô tình lấy đi quyền truy cập vào thông tin trên trang web, vì vậy hãy cân nhắc rất kỹ khi dùng. Hãy suy nghĩ cẩn thận xem bạn có thực sự cần nó hay không, và liệu bạn có thể chỉ dùng một tập hợp các widget đã biết khác để làm cùng nhiệm vụ hay không.

Nếu được dùng, vai trò application nên được thêm vào vùng chứa chung thấp nhất có thể, chẳng hạn không nên đặt trên phần tử `<body>`. Đồng thời hãy nhớ kiểm thử những gì bạn đã viết với công nghệ hỗ trợ để xác minh nó hoạt động như mong muốn.

## Đặc tả

{{Specifications}}

## Thứ tự ưu tiên

Việc áp dụng vai trò `application` sẽ khiến phần tử này và tất cả các phần tử con của nó được xử lý như nội dung ứng dụng, không phải nội dung web. Bất kỳ cơ chế đọc nào mà công nghệ hỗ trợ có cho nội dung web sẽ không còn áp dụng.

## Xem thêm

- [If you use the WAI-ARIA role `application`, please do so wisely](https://www.marcozehe.de/if-you-use-the-wai-aria-role-application-please-do-so-wisely/) - bài blog của Marco Zehe
- [Using the ARIA `application` role](https://tink.uk/using-the-aria-application-role/) - của Léonie Watson
