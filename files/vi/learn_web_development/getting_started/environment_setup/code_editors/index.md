---
title: Trình soạn thảo mã
slug: Learn_web_development/Getting_started/Environment_setup/Code_editors
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Browsing_the_web", "Learn_web_development/Getting_started/Environment_setup/Dealing_with_files", "Learn_web_development/Getting_started/Environment_setup")}}

Trước đây, chúng tôi đã yêu cầu bạn cài đặt một trình soạn thảo mã (code editor), vì bạn sẽ cần có nó để theo học lộ trình này. Trong bài này, chúng ta sẽ xem xét kỹ hơn về các trình soạn thảo mã, giúp bạn hiểu rõ chúng có thể làm gì cho bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Làm quen cơ bản với hệ điều hành máy tính của bạn.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Những trình soạn thảo mã nào có sẵn và cái nào phù hợp với mục đích của bạn.</li>
          <li>Một trình soạn thảo mã cơ bản có thể làm gì.</li>
          <li>Các tiện ích mở rộng (extension) của trình soạn thảo mã có thể làm gì và cách cài đặt chúng.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Những trình soạn thảo mã nào có sẵn?

Trước khi bắt đầu lập trình, bạn có thể đã có kinh nghiệm làm việc với tài liệu văn bản trong một chương trình như Microsoft Word. Bạn cũng có thể tự hỏi liệu có thể làm việc với mã trong cùng một chương trình đó không. Tiếc thay, câu trả lời là "không thực sự":

- Các chương trình như Microsoft Word là trình soạn thảo **tệp nhị phân (Binary file)**; các tệp của chúng chứa định dạng không phải văn bản chỉ có thể được hiểu bởi các chương trình đó. Mặt khác, mã nguồn (source code) của website được lưu trữ dưới dạng văn bản thuần túy (plain text).
- Word _có thể_ mở và chỉnh sửa các tệp văn bản thuần túy, nhưng nó không xử lý chúng rất tốt. Nó không có bộ tính năng được thiết kế để làm việc với mã — nó dành để viết các tài liệu như thư và báo cáo. Bạn cần một chương trình được thiết kế để xử lý và xuất ra văn bản thuần túy một cách gọn gàng, và làm việc với mã.

Bạn có thể đã có sẵn một trình soạn thảo văn bản thuần túy trên máy tính. Theo mặc định, Windows bao gồm [Notepad](https://en.wikipedia.org/wiki/Microsoft_Notepad) và macOS đi kèm với [TextEdit](https://en.wikipedia.org/wiki/TextEdit). Các bản phân phối Linux khác nhau; bản phát hành Ubuntu 22.04 LTS đi kèm với [GNOME Text Editor](https://en.wikipedia.org/wiki/GNOME_Text_Editor) theo mặc định. Các trình soạn thảo văn bản thuần túy mặc định của hệ điều hành (OS) có thể dùng được, nhưng chúng cũng có bộ tính năng hạn chế.

Bạn nên dùng một trình soạn thảo mã đầy đủ chức năng như [Visual Studio Code](https://code.visualstudio.com/) (đa nền tảng, miễn phí), [Sublime Text](https://www.sublimetext.com/) (đa nền tảng, không miễn phí), hoặc [Notepad++](https://notepad-plus-plus.org/) (Windows, miễn phí).

Chúng tôi khuyến nghị Visual Studio Code (VS Code), vì đó là trình soạn thảo chúng tôi chủ yếu sử dụng. Nếu bạn chưa cài đặt VS Code (hoặc một trình soạn thảo mã khác), bạn nên [cài đặt nó trước khi tiếp tục](https://code.visualstudio.com/).

> [!NOTE]
> Các Môi trường phát triển tích hợp (Integrated Development Environments - IDEs) như [NetBeans](https://netbeans.apache.org/front/main/index.html) (đa nền tảng, miễn phí) và [WebStorm](https://www.jetbrains.com/webstorm/) (đa nền tảng, không miễn phí) có nhiều tính năng hơn các trình soạn thảo mã đơn giản, nhưng có xu hướng phức tạp hơn mức bạn cần ở giai đoạn này trong hành trình học tập.

## Chức năng cơ bản của trình soạn thảo mã

Trong phần này, chúng ta sẽ xem xét một số chức năng quan trọng nhất mà bạn sẽ tìm thấy trong các trình soạn thảo mã, mô tả cách chúng có thể giúp bạn trong công việc lập trình.

> [!NOTE]
> Các phần dưới đây chỉ đề cập sơ lược những gì một trình soạn thảo mã có thể làm. Để có danh sách tính năng đầy đủ hơn, hãy xem [tài liệu Visual Studio Code](https://code.visualstudio.com/docs) (hoặc tìm kiếm tài liệu của trình soạn thảo bạn đã chọn nếu bạn đang dùng thứ gì khác).

> [!NOTE]
> Nếu bạn chỉ sử dụng bàn phím, hãy lưu ý rằng VS Code có bộ phím tắt (keyboard shortcut) mạnh mẽ. Xem [Tham chiếu phím tắt mặc định](https://code.visualstudio.com/docs/reference/default-keybindings) của VS Code.

### Mở và chỉnh sửa tệp

Điều này có thể trông hiển nhiên, nhưng việc cài đặt trình soạn thảo mã rất hữu ích vì nó cho bạn một ứng dụng duy nhất sẽ mở tất cả các tệp mã bạn có thể muốn sử dụng trong công việc phát triển. Không có gì khó chịu hơn khi nhấp đúp vào một tệp trên máy tính và nó mở ra trong một ứng dụng ngẫu nhiên, không liên quan, hoặc hệ điều hành thông báo rằng nó không nhận ra tệp đó.

Điều này sẽ xảy ra tự động khi cài đặt VS Code, nhưng nếu bạn vẫn gặp sự cố với một số loại tệp nhất định, bạn có thể thiết lập thủ công để chúng mở qua ứng dụng đó. Điều này có thể khác nhau tùy thuộc vào hệ điều hành của bạn, vì vậy để tìm hiểu, hãy vào công cụ tìm kiếm yêu thích và tìm "chọn ứng dụng mở loại tệp &lt;tên-và-phiên-bản-OS>" — ví dụ: "chọn ứng dụng mở loại tệp windows 11" nếu bạn đang dùng Windows 11.

Bạn có thể tìm thêm nhiều thông tin về mở và chỉnh sửa tệp và thư mục trong bài tiếp theo của chúng tôi.

### Tô sáng cú pháp

Các trình soạn thảo mã như VS Code cung cấp tô sáng cú pháp (syntax highlighting) — nghĩa là, các tính năng mã được nhận biết sẽ hiển thị với màu sắc khác nhau. Điều này làm cho mã dễ đọc hơn nhiều so với khi tô màu toàn bộ bằng một màu. Hãy dùng hàm JavaScript sau làm ví dụ:

```js
function createGreeting(name) {
  const greeting = `Hello, ${name}!`;
  return greeting;
}
```

Bạn chưa cần hiểu đoạn mã này đang làm gì, nhưng bạn đã có thể thấy tô sáng cú pháp trông như thế nào ở trên. Vâng, MDN cũng cung cấp tô sáng cú pháp!

Hãy thử một bài tập trong VS Code:

1. Sao chép ví dụ mã ở trên vào clipboard (các khối mã MDN có biểu tượng sao chép ở góc trên bên phải mà bạn có thể nhấn để làm điều này).
2. Mở VS Code và tạo tệp mới bằng cách chọn _File_ > _New File..._
3. Bên trong tệp mới, nhấp vào văn bản _Select a language_, sau đó chọn _JavaScript_ từ menu thả xuống xuất hiện.
4. Dán mã vào tệp mới để xem tô sáng cú pháp JavaScript của VS Code trông như thế nào.

VS Code cũng cung cấp các tính năng cú pháp khác. Ví dụ:

- Bạn sẽ thấy một đường thẳng đứng mỏng chạy xuống từ từ khóa `function` đến dấu ngoặc nhọn đóng (`}`) — những đường này được dùng để đánh dấu các cấp độ [thụt lề (indentation)](https://en.wikipedia.org/wiki/Indentation_style) khác nhau trong mã, giúp dễ dàng xác định các khối bắt đầu và kết thúc ở đâu.
- Cũng thử di chuyển con trỏ văn bản nhấp nháy qua dấu ngoặc nhọn mở hoặc đóng (`{` hoặc `}`) — bạn sẽ thấy cả hai đều được tô sáng. Điều này cũng giúp xác định đầu và cuối của các khối, và hữu ích khi bạn đang cố tìm chỗ thiếu ký tự khi có cấu trúc phức tạp với nhiều khối lồng nhau. Tính năng tô sáng này cũng hoạt động với các dấu phân cách khác như dấu ngoặc tròn (`(` và `)`) và dấu ngoặc vuông (`[` và `]`).

### Tự động hoàn thành/gợi ý mã

Khi bạn gõ mã vào trình soạn thảo mã, nó thường có thể gợi ý những gì bạn nên gõ tiếp theo, và điền sẵn một số mã boilerplate cho bạn (tức là mã chuẩn sẽ luôn giống nhau).

Hãy thử điều này ngay bây giờ trong VS Code:

1. Quay lại tệp JavaScript bạn đã tạo ở phần trước.
2. Đến cuối tệp và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd> vài lần để đảm bảo bạn đang ở trên dòng mới.
3. Bắt đầu gõ "function" — một danh sách các tùy chọn sẽ xuất hiện ở bên phải văn bản.
4. Chọn tùy chọn _function_ với _Function Statement_ được viết ở bên phải. Nó sẽ điền đoạn mã sau cho bạn:

   ```js-nolint
   function name(params) {

   }
   ```

5. Nhấp vào bên trong hàm, trên dòng trống giữa hai dấu ngoặc nhọn. Bắt đầu gõ "document" và bạn sẽ lại nhận được một danh sách các tùy chọn. Chọn tùy chọn đầu tiên. Đây là tham chiếu đến đối tượng {{domxref("Document")}} (một lần nữa, đừng lo lắng về ý nghĩa của nó ngay bây giờ).
6. Ngay sau `document`, gõ dấu chấm (`.`) — bạn sẽ lại nhận được một danh sách các tùy chọn, lần này chứa tất cả các thuộc tính và phương thức có sẵn trên đối tượng `document`!

Đủ rồi cho lúc này. Hãy tiếp tục.

### Hỗ trợ gỡ lỗi

Các trình soạn thảo mã không thể tự động sửa tất cả các vấn đề mã của bạn, nhưng chúng chắc chắn có thể giúp bạn tìm lỗi đánh máy và các lỗi đơn giản khác. Hãy xem một vài ví dụ.

1. Quay lại tệp JavaScript của bạn và xóa tất cả mã bạn hiện có. Thay thế bằng nội dung sau:

   ```js-nolint example-bad
   function createGreeting(name) {
     const greeting = `Hello, ${Name}!`;
     return greeting;
   }

   const helloChris = createGreeting("Chris);

   console.log(helloChris;
   ```

2. Biểu tượng chữ thập nhỏ ở bên phải danh sách mã trên là cách MDN chỉ ra một ví dụ mã lỗi, và hoàn toàn đúng như vậy — có ba lỗi trong mã trên! Hãy xem cách VS Code tô sáng để xem bạn có thể phát hiện các lỗi đó không, sau đó chúng ta sẽ cùng xem xét và sửa chúng.
3. Lỗi đầu tiên là chúng ta đã dùng `name` ở dòng đầu tiên, nhưng `Name` ở dòng thứ hai để chỉ cùng một biến. Đây là vấn đề vì JavaScript phân biệt chữ hoa chữ thường (case sensitive) và do đó coi đây là hai tên khác nhau. VS Code đã tô sáng điều này theo hai cách khác nhau — bằng cách tô màu `name` xám tối để chỉ ra rằng giá trị được khai báo nhưng không bao giờ được sử dụng (thường là dấu hiệu tốt cho thấy bạn đã mắc lỗi đánh máy ở đâu đó), và bằng cách đặt ba dấu chấm dưới `Name` để chỉ ra rằng nó có gợi ý cho bạn về cách cải thiện mã (trong trường hợp này bằng cách hỏi xem bạn có muốn viết `name` không). Để sửa lỗi này, thay đổi `Name` thành `name`.
   > [!NOTE]
   > Bạn có thể di chuột qua từng điểm tô sáng để biết thêm thông tin.
4. Lỗi thứ hai nằm ở dòng sáu, nơi chúng ta viết `"Chris`. Trong JavaScript, một đoạn văn bản (được gọi là **chuỗi - string**) phải được bao quanh bởi hai dấu ngoặc kép, nhưng dấu ngoặc kép thứ hai bị thiếu. VS Code đã tô sáng điều này bằng cách gạch chân văn bản nơi lỗi được phát hiện đầu tiên (có thể không phải là nơi lỗi thực sự xảy ra) bằng một đường gợn sóng màu đỏ, giống như đường được dùng trong Microsoft Word để tô sáng lỗi chính tả. Để sửa lỗi này, cập nhật `"Chris` thành `"Chris"`.
5. Ở dòng cuối cùng, một chút đường gợn sóng đỏ nhỏ vẫn còn gần cuối, ngay cả sau khi chúng ta đã sửa lỗi trước. Đây là do lỗi thứ ba — trong JavaScript, một dấu ngoặc mở luôn cần có dấu ngoặc đóng đi kèm. Sửa lỗi này bằng cách cập nhật `(helloChris` thành `(helloChris)`.

### Tìm kiếm và thay thế

Mỗi trình soạn thảo mã xứng đáng đều có chức năng tìm kiếm và thay thế mạnh mẽ. Điều này hữu ích ví dụ khi bạn phát hiện ra lỗi đang xảy ra trong một hàm cụ thể và bạn muốn tìm nó trong mã, hoặc khi bạn quyết định thay đổi tên biến và cần đảm bảo nó được thay đổi ở tất cả các vị trí tham chiếu đến nó.

Khái niệm tìm kiếm và thay thế có thể khá quen thuộc với bạn nếu bạn đã từng dùng máy tính, nhưng hãy khám phá nhanh để cho đầy đủ:

1. Quay lại tệp JavaScript của bạn trong VS Code và mở bảng tìm kiếm và thay thế ở chế độ tìm kiếm bằng cách chọn _Edit_ > _Find_ từ menu.
2. Gõ `createGreeting` vào ô _Find_ — bạn sẽ thấy cả hai trường hợp đều được tô sáng, và bạn có thể di chuyển giữa chúng bằng các mũi tên lên và xuống trong bảng. Trường hợp đang được tô sáng có độ sáng tô sáng mạnh hơn.
3. Bây giờ mở bảng tìm kiếm và thay thế ở chế độ thay thế bằng cách chọn _Edit_ > _Replace_ từ menu, hoặc bằng cách nhấp vào mũi tên ở bên trái ô _Find_.
4. Gõ `sayHello` vào ô _Replace_ sẽ hiện ra.
5. Bây giờ bạn có thể thay thế tất cả các trường hợp của `createGreeting` trong mã bằng `sayHello` sử dụng hai nút ở bên phải ô _Replace_. Nút bên trái di chuyển đến trường hợp tiếp theo của chuỗi tìm kiếm bằng một cú nhấp và thay thế nó bằng cú nhấp thứ hai. Nút bên phải thay thế tất cả các trường hợp bằng một cú nhấp duy nhất.

VS Code có nhiều tính năng tìm kiếm và thay thế mạnh mẽ — xem [Tìm kiếm và thay thế](https://code.visualstudio.com/docs/editing/codebasics#_find-and-replace).

## Nâng cao trình soạn thảo mã với tiện ích mở rộng

Hầu hết các trình soạn thảo mã có hệ thống tiện ích mở rộng (extension) hoặc plugin cho phép bạn thêm chức năng vào chương trình mà theo mặc định không có sẵn. Chúng có thể thực hiện nhiều tác vụ khác nhau, chẳng hạn như:

- Cho phép hoàn thành mã, kiểm tra lỗi (linting), hoặc chức năng gỡ lỗi cho các ngôn ngữ không được hỗ trợ theo mặc định, hoặc cung cấp thêm chức năng cho những ngôn ngữ đã được hỗ trợ.
- Cho phép bạn sử dụng chức năng của các công cụ khác ngay bên trong trình soạn thảo mã, chẳng hạn như công cụ kiểm soát phiên bản (version control) hoặc máy chủ kiểm tra cục bộ (local testing server).
- Cung cấp các chủ đề/bảng màu giao diện người dùng hoặc tô sáng mã bổ sung.
- Gợi ý các đoạn mã để đáp ứng các yêu cầu. Những đoạn mã này có thể được tạo từ các mẫu tĩnh, hoặc thông qua công cụ AI. Sử dụng AI để tạo đoạn mã có nhiều ưu điểm và lưu ý tương tự như sử dụng nó để tạo kết quả tìm kiếm (xem [Tìm kiếm thông tin > Sử dụng AI](/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Browsing_the_web#using_ai) để biết thêm thông tin).

### Khám phá tiện ích mở rộng VS Code

Tiện ích mở rộng VS Code được quản lý qua bảng Extensions Marketplace trong VS Code, truy cập qua menu _View_ > _Extensions_. Hãy khám phá nó ngay bây giờ.

1. Mở bảng Extensions Marketplace.
2. Trong ô _Search..._ ở đầu bảng, gõ "JavaScript" để xem các tiện ích mở rộng liên quan đến JavaScript có sẵn. Thử nhấp vào một vài kết quả tìm kiếm xuất hiện để xem các loại tính năng chúng cung cấp. Đừng cài đặt bất kỳ tiện ích nào ngay bây giờ.
3. Thay vào đó, hãy cài đặt một tiện ích mở rộng dễ hiểu và sẽ hữu ích cho hầu như bất kỳ tệp mã nào bạn làm việc trong bộ mô-đun này. Gõ "Prettier" vào ô _Search..._ và nhấp vào kết quả _Prettier - code formatter_. Khi tiện ích mở rộng [Prettier](https://prettier.io/) được cài đặt, nó có thể được dùng để định dạng mã mỗi khi bạn lưu tệp, làm cho mã dễ đọc hơn nhiều.
4. Nhấp nút _Install_ trên tab _Extension_. Đóng tab khi cài đặt xong.
5. Để Prettier hoạt động, bạn cần cập nhật một vài cài đặt. Mở tab Cài đặt VS Code (_Code_ > _Settings..._ > _Settings_ trên macOS, _File_ > _Preferences_ > _Settings_ trên Windows).
6. Trong ô _Search settings_ ở đầu trang, gõ "formatter" để lọc danh sách cài đặt và chỉ hiển thị những cài đặt chứa "formatter".
7. Tìm tùy chọn _Editor: Default Formatter_ và chọn tùy chọn _Prettier - Code formatter_ từ menu thả xuống liên quan.
8. Tìm tùy chọn _Editor: Format On Save_ và bật nó bằng cách nhấp vào hộp kiểm.
9. Đóng tab _Settings_.

Đó là tất cả quá trình thiết lập; hãy xem Prettier hoạt động như thế nào.

1. Quay lại tab tệp JavaScript của bạn và lưu nó (_File_ > _Save_). Tệp cần được lưu để Prettier hoạt động. Đặt tên là `test.js`. Vị trí bạn lưu không thực sự quan trọng.
2. Thay thế nội dung hiện tại bằng đoạn mã sau:

   ```js-nolint example-bad
   function sayHello(name){const greeting = `Hello, ${name}!`;
   return greeting;}
   ```

3. Lưu tệp lại; tại thời điểm này, Prettier sẽ định dạng lại mã một cách gọn gàng, như thế này:

   ```js
   function sayHello(name) {
     const greeting = `Hello, ${name}!`;
     return greeting;
   }
   ```

{{PreviousMenuNext("Learn_web_development/Getting_started/Environment_setup/Browsing_the_web", "Learn_web_development/Getting_started/Environment_setup/Dealing_with_files", "Learn_web_development/Getting_started/Environment_setup")}}
