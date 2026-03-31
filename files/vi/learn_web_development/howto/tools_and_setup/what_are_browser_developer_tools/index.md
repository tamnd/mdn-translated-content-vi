---
title: What are browser developer tools?
slug: Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools
page-type: learn-faq
sidebar: learn-how-to
---

Mọi trình duyệt web hiện đại đều bao gồm một bộ công cụ dành cho nhà phát triển mạnh mẽ. Những công cụ này thực hiện nhiều thứ khác nhau, từ kiểm tra HTML, CSS và JavaScript hiện đang được tải đến hiển thị tài sản nào mà trang đã yêu cầu và thời gian tải. Bài viết này giải thích cách sử dụng các chức năng cơ bản của devtools trong trình duyệt của bạn.

> [!NOTE]
> Trước khi chạy qua các ví dụ bên dưới, hãy mở [trang web ví dụ dành cho người mới bắt đầu](https://mdn.github.io/beginner-html-site-scripted/) mà chúng tôi đã xây dựng trong loạt bài viết [Bắt đầu với Web](/en-US/docs/Learn_web_development/Getting_started/Your_first_website). Bạn nên mở trang này khi làm theo các bước bên dưới.

## Cách mở devtools trong trình duyệt

Devtools nằm bên trong trình duyệt của bạn trong một cửa sổ con trông đại khái như thế này, tùy thuộc vào trình duyệt bạn đang sử dụng:

![Ảnh chụp màn hình trình duyệt với công cụ dành cho nhà phát triển đang mở. Trang web được hiển thị ở nửa trên của trình duyệt, công cụ dành cho nhà phát triển chiếm nửa dưới. Có ba ngăn được mở trong công cụ dành cho nhà phát triển: HTML, với phần tử body được chọn, ngăn CSS hiển thị các khối kiểu nhắm vào body được tô sáng, và ngăn kiểu tính toán hiển thị tất cả các kiểu của tác giả; hộp kiểm kiểu trình duyệt không được chọn.](devtools_63_inspector.png)

Làm thế nào để mở nó? Ba cách:

- **_Bàn phím:_**
  - **Windows:** <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>I</kbd> hoặc <kbd>F12</kbd>
  - **macOS:** <kbd>⌘</kbd> + <kbd>⌥</kbd> + <kbd>I</kbd>

- **_Thanh menu:_**
  - **Firefox:** _Menu (☰) ➤ More tools ➤ Web Developer Tools_
  - **Chrome:** _More tools ➤ Developer tools_
  - **Opera**: _Developer ➤ Developer tools_
  - **Safari:** _Develop ➤ Show Web Inspector._

    > [!NOTE]
    > Công cụ dành cho nhà phát triển Safari không được bật theo mặc định.
    > Để bật chúng, hãy đến _Safari ➤ Preferences ➤ Advanced_ và chọn hộp kiểm _Show Develop menu in menu bar_ hoặc _Enable features for web developers_.

- **_Menu ngữ cảnh:_** Nhấn và giữ/nhấp chuột phải vào một mục trên trang web (Ctrl-click trên Mac), và chọn _Inspect Element_ từ menu ngữ cảnh xuất hiện. (_Thêm lợi ích:_ phương thức này ngay lập tức tô sáng code của phần tử bạn đã nhấp chuột phải.)

![Logo firefox như một phần tử DOM trong trang web ví dụ với menu ngữ cảnh hiển thị. Menu ngữ cảnh xuất hiện khi nhấp chuột phải vào bất kỳ mục nào trên trang web. Mục menu cuối cùng là 'Inspect element'.](inspector_context.png)

## Trình kiểm tra: Khám phá DOM và chỉnh sửa CSS

Công cụ dành cho nhà phát triển thường mở mặc định đến trình kiểm tra, trông giống như ảnh chụp màn hình sau. Công cụ này hiển thị HTML của trang của bạn trông như thế nào lúc chạy, cũng như CSS nào được áp dụng cho từng phần tử trên trang. Nó cũng cho phép bạn sửa đổi ngay lập tức HTML và CSS và thấy kết quả thay đổi của bạn được phản ánh trực tiếp trong khung nhìn trình duyệt.

![Một trang web kiểm thử đang được mở trong tab trình duyệt. Cửa sổ con công cụ dành cho nhà phát triển đang mở. Công cụ dành cho nhà phát triển có một số tab. Inspector là một trong những tab đó. Tab Inspector hiển thị code HTML của trang web. Một thẻ hình ảnh được chọn từ code HTML. Điều này dẫn đến tô sáng hình ảnh tương ứng với thẻ được chọn trong trang web.](inspector_highlighted.png)

Nếu bạn _không_ thấy trình kiểm tra,

- **Firefox:** Chọn tab **Inspector**.
- **Các trình duyệt khác:** Chọn tab **Elements**.

### Khám phá trình kiểm tra DOM

Để bắt đầu, nhấp chuột phải (Ctrl-click) vào một phần tử HTML trong trình kiểm tra DOM và xem menu ngữ cảnh. Các tùy chọn menu có sẵn thay đổi giữa các trình duyệt, nhưng những cái quan trọng hầu hết đều giống nhau:

![Cửa sổ con công cụ dành cho nhà phát triển đang mở. Tab trình kiểm tra được chọn. Một phần tử liên kết được nhấp chuột phải từ code HTML có trong tab trình kiểm tra. Một menu ngữ cảnh xuất hiện. Các tùy chọn menu có sẵn thay đổi giữa các trình duyệt, nhưng những cái quan trọng hầu hết đều giống nhau.](dom_inspector.png)

- **Delete Node** (đôi khi là _Delete Element_). Xóa phần tử hiện tại.
- **Edit as HTML** (đôi khi là _Add attribute_/_Edit text_). Cho phép bạn thay đổi HTML và xem kết quả ngay lập tức. Rất hữu ích để gỡ lỗi và kiểm thử.
- **:hover/:active/:focus**. Ép buộc trạng thái phần tử được bật, để bạn có thể xem kiểu dáng của chúng sẽ trông như thế nào.
- **Copy/Copy as HTML**. Sao chép HTML hiện đang được chọn.
- Một số trình duyệt cũng có sẵn _Copy CSS Path_ và _Copy XPath_, để cho phép bạn sao chép bộ chọn CSS hoặc biểu thức XPath để chọn phần tử HTML hiện tại.

Hãy thử chỉnh sửa DOM của bạn ngay bây giờ. Nhấp đúp vào một phần tử, hoặc nhấp chuột phải và chọn _Edit as HTML_ từ menu ngữ cảnh. Bạn có thể thực hiện bất kỳ thay đổi nào bạn muốn, nhưng bạn không thể lưu các thay đổi của mình.

### Khám phá trình chỉnh sửa CSS

Theo mặc định, trình chỉnh sửa CSS hiển thị các quy tắc CSS được áp dụng cho phần tử hiện đang được chọn:

![Đoạn của ngăn CSS và ngăn bố cục có thể thấy kề bên trình chỉnh sửa HTML trong công cụ dành cho nhà phát triển trình duyệt. Theo mặc định, trình chỉnh sửa CSS hiển thị các quy tắc CSS được áp dụng cho phần tử hiện được chọn trong trình chỉnh sửa HTML. Ngăn bố cục hiển thị các thuộc tính mô hình hộp của phần tử được chọn.](css_inspector.png)

Những tính năng này đặc biệt hữu ích:

- Các quy tắc được áp dụng cho phần tử hiện tại được hiển thị theo thứ tự từ cụ thể nhất đến ít cụ thể nhất.
- Nhấp vào hộp kiểm bên cạnh mỗi khai báo để xem điều gì sẽ xảy ra nếu bạn xóa khai báo đó.
- Nhấp vào mũi tên nhỏ bên cạnh mỗi thuộc tính tốc ký để hiển thị các thuộc tính dài tương đương.
- Nhấp vào tên thuộc tính hoặc giá trị để hiển thị hộp văn bản, nơi bạn có thể nhập giá trị mới để xem trước trực tiếp sự thay đổi kiểu dáng.
- Bên cạnh mỗi quy tắc là tên tệp và số dòng nơi quy tắc được định nghĩa. Nhấp vào quy tắc đó sẽ khiến công cụ dành cho nhà phát triển nhảy để hiển thị nó trong chế độ xem riêng của nó, nơi thường có thể chỉnh sửa và lưu.
- Bạn cũng có thể nhấp vào dấu ngoặc nhọn đóng của bất kỳ quy tắc nào để hiển thị hộp văn bản trên một dòng mới, nơi bạn có thể viết một khai báo hoàn toàn mới cho trang của mình.

Bạn sẽ nhận thấy một số tab có thể nhấp ở đầu CSS Viewer:

- _Computed_: Hiển thị các kiểu tính toán cho phần tử hiện đang được chọn (các giá trị cuối cùng, được chuẩn hóa mà trình duyệt áp dụng).
- _Layout_: Hiển thị thông tin chi tiết cho các chế độ bố cục CSS [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) và [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) nếu phần tử bạn đang kiểm tra sử dụng chúng.
- _Fonts_: Trong Firefox và Safari, tab _Fonts_ hiển thị các phông chữ được áp dụng cho phần tử hiện tại.

Chế độ xem _box model_ biểu diễn trực quan mô hình hộp của phần tử hiện tại, để bạn có thể thấy ngay lập tức padding, border và margin nào được áp dụng cho nó, và nội dung của nó có kích thước bao nhiêu. Trong Firefox, điều này nằm trong tab _Layout_, và trong các trình duyệt khác nằm trong tab _Computed_.

Trong một số trình duyệt, các chi tiết JavaScript của phần tử được chọn cũng có thể được xem trong ngăn này. Trong Safari, chúng được thống nhất dưới tab _Node_, nhưng nằm trong các tab riêng biệt trong Chrome, Opera và Edge.

- _Properties_: Các {{Glossary("Property/JavaScript", "thuộc tính")}} của đối tượng phần tử.
- _Event Listeners_: Các [sự kiện](/en-US/docs/Web/API/Event) liên kết với phần tử.

### Tìm hiểu thêm

Tìm hiểu thêm về Trình kiểm tra trong các trình duyệt khác nhau:

- [Firefox Page inspector](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/index.html)
- [Chrome DOM inspector](https://developer.chrome.com/docs/devtools/dom/) (Trình kiểm tra của Opera và Edge giống nhau)
- [Safari Elements tab](https://webkit.org/web-inspector/elements-tab/)

## Trình gỡ lỗi JavaScript

Trình gỡ lỗi JavaScript cho phép bạn theo dõi giá trị của các biến và đặt điểm dừng (breakpoint), những vị trí trong code mà bạn muốn tạm dừng thực thi và xác định các vấn đề ngăn code của bạn thực thi đúng cách.

![Một trang web kiểm thử đang được phục vụ cục bộ trên cổng 8080. Cửa sổ con công cụ dành cho nhà phát triển đang mở. Tab gỡ lỗi JavaScript được chọn. Nó cho phép bạn theo dõi giá trị của các biến và đặt điểm dừng. Một tệp có tên 'example.js' được chọn từ ngăn nguồn. Một điểm dừng được đặt tại số dòng 18 của tệp.](firefox_debugger.png)

Để đến trình gỡ lỗi:

**Firefox**: Mở Công cụ dành cho nhà phát triển và chọn tab **Debugger**.
**Các trình duyệt khác**: Mở Công cụ dành cho nhà phát triển và chọn tab **Sources**.

### Khám phá trình gỡ lỗi

Trình gỡ lỗi JavaScript của mỗi trình duyệt được chia thành ba ngăn. Bố cục của chúng có phần khác nhau tùy thuộc vào trình duyệt bạn đang sử dụng; hướng dẫn này sử dụng Firefox làm tham chiếu.

#### Danh sách tệp

Ngăn đầu tiên ở bên trái chứa danh sách các tệp liên kết với trang bạn đang gỡ lỗi. Chọn tệp bạn muốn làm việc từ danh sách này. Nhấp vào tệp để chọn nó và xem nội dung của nó trong ngăn giữa của Trình gỡ lỗi.

![Đoạn của ngăn nguồn của tab gỡ lỗi trong công cụ dành cho nhà phát triển trình duyệt. Các tệp liên quan đến trang hiện tại bạn đang gỡ lỗi có thể thấy trong thư mục có tên giống với URL của trang đang mở trong tab trình duyệt hiện tại.](file_list.png)

#### Code nguồn

Đặt điểm dừng nơi bạn muốn tạm dừng thực thi. Trong hình ảnh sau, phần tô sáng trên số 18 cho thấy dòng đó có điểm dừng được đặt.

![Đoạn của ngăn gỡ lỗi công cụ dành cho nhà phát triển với điểm dừng ở dòng 18 được tô sáng.](source_code.png)

#### Biểu thức theo dõi và điểm dừng

Ngăn bên phải hiển thị danh sách các biểu thức theo dõi bạn đã thêm và các điểm dừng bạn đã đặt.

Trong hình ảnh, phần đầu tiên, **Watch expressions**, cho thấy biến listItems đã được thêm. Bạn có thể mở rộng danh sách để xem các giá trị trong mảng.

Phần tiếp theo, **Breakpoints**, liệt kê các điểm dừng được đặt trên trang. Trong example.js, một điểm dừng đã được đặt trên câu lệnh `listItems.push(inputNewItem.value);`

Hai phần cuối chỉ xuất hiện khi code đang chạy.

Phần **Call stack** hiển thị cho bạn biết code nào đã được thực thi để đến dòng hiện tại. Bạn có thể thấy rằng code nằm trong hàm xử lý click chuột, và rằng code hiện đang dừng tại điểm dừng.

Phần cuối cùng, **Scopes**, hiển thị những giá trị nào có thể nhìn thấy từ các điểm khác nhau trong code của bạn. Ví dụ, trong hình ảnh bên dưới, bạn có thể thấy các đối tượng có sẵn cho code trong hàm addItemClick.

![Đoạn của ngăn nguồn của tab gỡ lỗi của công cụ dành cho nhà phát triển trình duyệt. Trong call stack nó hiển thị hàm được gọi ở Dòng 18, tô sáng rằng một điểm dừng được đặt ở dòng này và hiển thị phạm vi.](watch_items.png)

### Tìm hiểu thêm

Tìm hiểu thêm về trình gỡ lỗi JavaScript trong các trình duyệt khác nhau:

- [Firefox JavaScript Debugger](https://firefox-source-docs.mozilla.org/devtools-user/debugger/index.html))
- [Chrome Debugger](https://developer.chrome.com/docs/devtools/javascript/) (Trình gỡ lỗi của Opera và Edge giống nhau)
- [Safari Sources tab](https://webkit.org/web-inspector/sources-tab/)

## Bảng điều khiển JavaScript

Bảng điều khiển JavaScript là công cụ cực kỳ hữu ích để gỡ lỗi JavaScript không hoạt động như mong đợi. Nó cho phép bạn chạy các dòng JavaScript trên trang hiện đang được tải trong trình duyệt, và báo cáo các lỗi gặp phải khi trình duyệt cố gắng thực thi code của bạn.

Để truy cập bảng điều khiển trong bất kỳ trình duyệt nào, hãy mở công cụ dành cho nhà phát triển và chọn tab **Console**. Điều này sẽ cho bạn một cửa sổ như sau:

![Tab Console của công cụ dành cho nhà phát triển trình duyệt. Hai hàm JavaScript đã được thực thi trong bảng điều khiển. Người dùng nhập các hàm, và bảng điều khiển hiển thị các giá trị trả về.](console_only.png)

Để xem điều gì xảy ra, hãy thử nhập các đoạn code sau vào bảng điều khiển lần lượt (và sau đó nhấn Enter):

```js
alert("hello!");
```

```js
document.querySelector("html").style.backgroundColor = "purple";
```

```js
const loginImage = document.createElement("img");
loginImage.setAttribute(
  "src",
  "https://raw.githubusercontent.com/mdn/learning-area/master/html/forms/image-type-example/login.png",
);
document.querySelector("h1").appendChild(loginImage);
```

Bây giờ hãy thử nhập các phiên bản lỗi sau đây của code và xem bạn nhận được gì.

```js-nolint example-bad
alert("hello!);
```

```js example-bad
document.cheeseSelector("html").style.backgroundColor = "purple";
```

```js example-bad
const loginImage = document.createElement("img");
banana.setAttribute(
  "src",
  "https://raw.githubusercontent.com/mdn/learning-area/master/html/forms/image-type-example/login.png",
);
document.querySelector("h1").appendChild(loginImage);
```

Bạn sẽ bắt đầu thấy loại lỗi mà trình duyệt trả về. Thông thường những lỗi này khá khó hiểu, nhưng sẽ khá đơn giản để tìm ra những vấn đề này!

### Tìm hiểu thêm

Tìm hiểu thêm về bảng điều khiển JavaScript trong các trình duyệt khác nhau:

- [Firefox Web Console](https://firefox-source-docs.mozilla.org/devtools-user/web_console/index.html)
- [Chrome JavaScript Console](https://developer.chrome.com/docs/devtools/console/) (Bảng điều khiển của Opera và Edge giống nhau)
- [Safari Console Object API](https://webkit.org/web-inspector/console-object-api/) và [Console Command Line API](https://webkit.org/web-inspector/console-command-line-api/)

## Xem thêm

- [Gỡ lỗi HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Debugging_HTML)
- [Gỡ lỗi CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Debugging_CSS)
